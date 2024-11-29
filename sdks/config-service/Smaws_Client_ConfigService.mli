(** 
    Config Service client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(** 
    The requested action is not valid.
    
     For PutStoredQuery, you will see this exception if there are missing required fields or if the input value fails the validation, or if you are trying to create more than 300 queries.
     
      For GetStoredQuery, ListStoredQuery, and DeleteStoredQuery you will see this exception if there are missing required fields or if the input value fails the validation.
       *)
type validation_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type untag_resource_request = {
  tag_keys: string list;
  (** 
    The keys of the tags to be removed.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. Currently, the supported resources are [ConfigRule], [ConfigurationAggregator] and [AggregatorAuthorization].
     *)

}

(** 
    You have specified a resource that does not exist.
     *)
type resource_not_found_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type resource_type = | SSMDocument
  | Route53ResolverFirewallRuleGroup
  | RedshiftEndpointAccess
  | RDSOptionGroup
  | QuickSightTheme
  | QuickSightTemplate
  | QuickSightDataSource
  | M2Environment
  | KMSAlias
  | ImageBuilderImageRecipe
  | GroundStationDataflowEndpointGroup
  | GrafanaWorkspace
  | EC2NetworkInsightsAnalysis
  | EC2NetworkInsightsAccessScope
  | CognitoUserPoolGroup
  | CognitoUserPoolClient
  | CognitoUserPool
  | AppStreamFleet
  | ResourceExplorer2Index
  | NetworkManagerConnectPeer
  | LambdaCodeSigningConfig
  | KafkaConnectConnector
  | IoTTwinMakerSyncJob
  | IoTCACertificate
  | IAMInstanceProfile
  | ECSCapacityProvider
  | EC2TransitGatewayMulticastDomain
  | EC2TransitGatewayConnect
  | EC2IPAMPool
  | EC2CarrierGateway
  | ConnectQuickConnect
  | ConnectInstance
  | AppMeshMesh
  | AppMeshGatewayRoute
  | ACMPCACertificateAuthorityActivation
  | BatchSchedulingPolicy
  | Route53ResolverResolverQueryLoggingConfig
  | CodeGuruProfilerProfilingGroup
  | APSRuleGroupsNamespace
  | MediaConnectFlowSource
  | TransferCertificate
  | ServiceDiscoveryInstance
  | Route53ResolverResolverQueryLoggingConfigAssociation
  | InspectorV2Filter
  | IoTProvisioningTemplate
  | IoTWirelessFuotaTask
  | IoTJobTemplate
  | AppStreamStack
  | MSKBatchScramSecret
  | SageMakerFeatureGroup
  | CodeBuildReportGroup
  | IoTTwinMakerComponentType
  | PersonalizeDatasetGroup
  | IoTWirelessMulticastGroup
  | NetworkManagerLinkAssociation
  | NetworkManagerCustomerGatewayAssociation
  | S3AccessPoint
  | PinpointEmailChannel
  | LogsDestination
  | KinesisVideoStream
  | KendraIndex
  | EC2ClientVpnEndpoint
  | EC2CapacityReservation
  | DMSEndpoint
  | CustomerProfilesObjectType
  | AppRunnerService
  | AppMeshVirtualRouter
  | AppMeshVirtualGateway
  | AppConfigHostedConfigurationVersion
  | ACMPCACertificateAuthority
  | ResilienceHubApp
  | PinpointEventStream
  | PinpointEmailTemplate
  | PersonalizeSolution
  | PersonalizeSchema
  | PersonalizeDataset
  | MSKConfiguration
  | MediaTailorPlaybackConfiguration
  | MediaConnectFlowVpcInterface
  | MediaConnectFlowEntitlement
  | GroundStationMissionProfile
  | GreengrassV2ComponentVersion
  | ForecastDatasetGroup
  | EvidentlyLaunch
  | EC2IPAMScope
  | AthenaPreparedStatement
  | AppMeshRoute
  | AppIntegrationsEventIntegration
  | AmplifyBranch
  | KinesisFirehoseDeliveryStream
  | TransferConnector
  | TransferAgreement
  | SageMakerDomain
  | PinpointInAppTemplate
  | PinpointCampaign
  | IAMServerCertificate
  | IAMSAMLProvider
  | ForecastDataset
  | EvidentlyProject
  | EC2SpotFleet
  | EC2PrefixList
  | CodeArtifactRepository
  | AppStreamApplication
  | AppRunnerVpcConnector
  | AppMeshVirtualService
  | AppMeshVirtualNode
  | AmplifyApp
  | SignerSigningProfile
  | CassandraKeyspace
  | ECSTaskSet
  | SageMakerImage
  | SageMakerAppImageConfig
  | Route53ResolverFirewallRuleGroupAssociation
  | RedshiftScheduledAction
  | PinpointApp
  | PanoramaPackage
  | NetworkManagerSite
  | NetworkManagerLink
  | NetworkManagerGlobalNetwork
  | NetworkManagerDevice
  | IoTWirelessServiceProfile
  | IoTFleetMetric
  | ImageBuilderImagePipeline
  | GroundStationConfig
  | ECRPullThroughCacheRule
  | EC2SubnetRouteTableAssociation
  | EC2EC2Fleet
  | DeviceFarmProject
  | DeviceFarmInstanceProfile
  | CloudWatchMetricStream
  | AuditManagerAssessment
  | AppFlowFlow
  | AppConfigDeploymentStrategy
  | ConnectPhoneNumber
  | AutoScalingWarmPool
  | CustomerProfilesDomain
  | NetworkManagerTransitGatewayRegistration
  | IoTTwinMakerScene
  | EC2IPAM
  | EC2TrafficMirrorFilter
  | EC2NetworkInsightsPath
  | EC2DHCPOptions
  | EventsRule
  | PinpointApplicationSettings
  | PinpointSegment
  | HealthLakeFHIRDatastore
  | RoboMakerRobotApplication
  | RoboMakerSimulationApplication
  | Route53RecoveryReadinessResourceSet
  | Route53RecoveryControlRoutingControl
  | Route53RecoveryControlControlPanel
  | Route53RecoveryControlSafetyRule
  | Route53RecoveryControlCluster
  | LookoutVisionProject
  | AppStreamDirectoryConfig
  | KinesisVideoSignalingChannel
  | MediaPackagePackagingConfiguration
  | EventSchemasSchema
  | EventsConnection
  | IoTScheduledAudit
  | S3StorageLens
  | EC2TrafficMirrorTarget
  | IoTAccountAuditConfiguration
  | LookoutMetricsAlert
  | LexBotAlias
  | IoTSiteWiseGateway
  | EC2TrafficMirrorSession
  | RoboMakerRobotApplicationVersion
  | Route53ResolverFirewallDomainList
  | IoTCustomMetric
  | CodeGuruReviewerRepositoryAssociation
  | LexBot
  | BudgetsBudgetsAction
  | DeviceFarmTestGridProject
  | S3MultiRegionAccessPoint
  | RDSGlobalCluster
  | KinesisAnalyticsV2Application
  | IVSPlaybackKeyPair
  | IVSRecordingConfiguration
  | IVSChannel
  | IoTSiteWiseAssetModel
  | IoTSiteWisePortal
  | IoTSiteWiseProject
  | IoTSiteWiseDashboard
  | IoTAnalyticsChannel
  | IoTAnalyticsPipeline
  | IoTAnalyticsDataset
  | IoTTwinMakerEntity
  | IoTTwinMakerWorkspace
  | IoTMitigationAction
  | IoTPolicy
  | GlueMLTransform
  | EKSAddon
  | EKSIdentityProviderConfig
  | TransferWorkflow
  | ResilienceHubResiliencyPolicy
  | Route53RecoveryReadinessRecoveryGroup
  | MediaPackagePackagingGroup
  | LightsailStaticIp
  | LightsailBucket
  | IoTAnalyticsDatastore
  | IoTDimension
  | IoTRoleAlias
  | IoTSecurityProfile
  | IoTAuthorizer
  | FraudDetectorOutcome
  | FraudDetectorVariable
  | FraudDetectorEntityType
  | FraudDetectorLabel
  | EventSchemasDiscoverer
  | EventSchemasRegistryPolicy
  | EventSchemasRegistry
  | Cloud9EnvironmentEC2
  | AppConfigConfigurationProfile
  | AppConfigEnvironment
  | AmazonMQBroker
  | SESTemplate
  | GuardDutyFilter
  | SESReceiptFilter
  | DataSyncLocationFSxWindows
  | FISExperimentTemplate
  | LightsailDisk
  | EventsApiDestination
  | EventsArchive
  | SESReceiptRuleSet
  | EventsEndpoint
  | RUMAppMonitor
  | LightsailCertificate
  | BackupReportPlan
  | ECRRegistryPolicy
  | Route53RecoveryReadinessReadinessCheck
  | Route53RecoveryReadinessCell
  | GlueClassifier
  | DataSyncLocationHDFS
  | DataSyncLocationObjectStorage
  | ImageBuilderInfrastructureConfiguration
  | ImageBuilderDistributionConfiguration
  | ImageBuilderContainerRecipe
  | EventsEventBus
  | ServiceDiscoveryHttpNamespace
  | IoTEventsAlarmModel
  | IoTEventsDetectorModel
  | IoTEventsInput
  | Route53HostedZone
  | SESConfigurationSet
  | SESContactList
  | ServiceDiscoveryPublicDnsNamespace
  | ServiceDiscoveryService
  | SageMakerNotebookInstanceLifecycleConfig
  | SageMakerWorkteam
  | GuardDutyIPSet
  | GuardDutyThreatIntelSet
  | GlueJob
  | EKSFargateProfile
  | NetworkInsightsAccessScopeAnalysis
  | DataSyncLocationNFS
  | DataSyncTask
  | DataSyncLocationEFS
  | DataSyncLocationS3
  | DataSyncLocationFSxLustre
  | DataSyncLocationSMB
  | AppSyncGraphQLApi
  | AppConfigApplication
  | DMSCertificate
  | TransitGatewayRouteTable
  | TransitGatewayAttachment
  | GlobalAcceleratorListener
  | GlobalAcceleratorEndpointGroup
  | GlobalAcceleratorAccelerator
  | DetectiveGraph
  | AthenaDataCatalog
  | AthenaWorkGroup
  | AccessAnalyzerAnalyzer
  | BatchComputeEnvironment
  | BatchJobQueue
  | StepFunctionsStateMachine
  | ListenerV2
  | SageMakerModel
  | WorkSpacesConnectionAlias
  | WorkSpacesWorkspace
  | StepFunctionsActivity
  | MSKCluster
  | DMSEventSubscription
  | DMSReplicationSubnetGroup
  | Route53ResolverResolverRuleAssociation
  | Route53ResolverResolverRule
  | Route53ResolverResolverEndpoint
  | SageMakerCodeRepository
  | EMRSecurityConfiguration
  | GuardDutyDetector
  | ECRPublicRepository
  | LaunchTemplate
  | CodeDeployDeploymentGroup
  | CodeDeployDeploymentConfig
  | CodeDeployApplication
  | KinesisStreamConsumer
  | KinesisStream
  | TransitGateway
  | OpenSearchDomain
  | EKSCluster
  | EFSFileSystem
  | EFSAccessPoint
  | ECSTaskDefinition
  | ECSService
  | ECSCluster
  | ECRRepository
  | BackupRecoveryPoint
  | BackupVault
  | BackupSelection
  | BackupPlan
  | FileData
  | Topic
  | Secret
  | QLDBLedger
  | Key
  | Queue
  | Portfolio
  | CloudFormationProduct
  | CloudFormationProvisionedProduct
  | Pipeline
  | Api
  | StageV2
  | RestApi
  | Stage
  | ResourceCompliance
  | ConformancePackCompliance
  | RegionalProtection
  | Protection
  | PatchCompliance
  | AssociationCompliance
  | EncryptionConfig
  | ManagedRuleSetV2
  | RegexPatternSetV2
  | IPSetV2
  | RuleGroupV2
  | WebACLV2
  | Environment
  | ApplicationVersion
  | Application
  | NetworkFirewallRuleGroup
  | NetworkFirewallFirewallPolicy
  | NetworkFirewallFirewall
  | Function
  | StreamingDistribution
  | Distribution
  | RegionalWebACL
  | RegionalRuleGroup
  | RegionalRule
  | RegionalRateBasedRule
  | WebACL
  | RuleGroup
  | Rule
  | RateBasedRule
  | Project
  | Table
  | ScheduledAction
  | ScalingPolicy
  | LaunchConfiguration
  | AutoScalingGroup
  | LoadBalancer
  | Stack
  | Alarm
  | ManagedInstanceInventory
  | RedshiftEventSubscription
  | ClusterSubnetGroup
  | ClusterSecurityGroup
  | ClusterParameterGroup
  | ClusterSnapshot
  | Cluster
  | AccountPublicAccessBlock
  | Bucket
  | EventSubscription
  | DBClusterSnapshot
  | DBCluster
  | DBSnapshot
  | DBSecurityGroup
  | DBSubnetGroup
  | DBInstance
  | Certificate
  | LoadBalancerV2
  | User
  | Role
  | Policy
  | Group
  | Domain
  | VPCPeeringConnection
  | FlowLog
  | VPCEndpointService
  | VPCEndpoint
  | EgressOnlyInternetGateway
  | NatGateway
  | RegisteredHAInstance
  | VPNGateway
  | VPNConnection
  | VPC
  | Volume
  | Trail
  | Subnet
  | SecurityGroup
  | RouteTable
  | NetworkInterface
  | NetworkAcl
  | InternetGateway
  | Instance
  | Host
  | EIP
  | CustomerGateway

(** 
    The details that identify a resource that is collected by Config aggregator, including the resource type, ID, (if available) the custom resource name, the source account, and source region.
     *)
type aggregate_resource_identifier = {
  resource_name: string option;
  (** 
    The name of the Amazon Web Services resource.
     *)

  resource_type: resource_type;
  (** 
    The type of the Amazon Web Services resource.
     *)

  resource_id: string;
  (** 
    The ID of the Amazon Web Services resource.
     *)

  source_region: string;
  (** 
    The source region where data is aggregated.
     *)

  source_account_id: string;
  (** 
    The 12-digit account ID of the source account.
     *)

}

(** 
    You have reached the limit of the number of tags you can use. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html}{b Service Limits}} in the {i Config Developer Guide}.
     *)
type too_many_tags_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Filters evaluation results based on start and end times.
     *)
type time_window = {
  end_time: float option;
  (** 
    The end time of an execution. The end time must be after the start date.
     *)

  start_time: float option;
  (** 
    The start time of an execution.
     *)

}

(** 
    This API allows you to create a conformance pack template with an Amazon Web Services Systems Manager document (SSM document). To deploy a conformance pack using an SSM document, first create an SSM document with conformance pack content, and then provide the [DocumentName] in the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutConformancePack.html}PutConformancePack API}. You can also provide the [DocumentVersion].
    
     The [TemplateSSMDocumentDetails] object contains the name of the SSM document and the version of the SSM document.
      *)
type template_ssm_document_details = {
  document_version: string option;
  (** 
    The version of the SSM document to use to create a conformance pack. By default, Config uses the latest version.
    
     This field is optional.
     
      *)

  document_name: string;
  (** 
    The name or Amazon Resource Name (ARN) of the SSM document to use to create a conformance pack. If you use the document name, Config checks only your account and Amazon Web Services Region for the SSM document.
     *)

}

(** 
    The tags for the resource. The metadata that you apply to a resource to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.
     *)
type tag = {
  value: string option;
  (** 
    The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).
     *)

  key: string option;
  (** 
    One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.
     *)

}

type tag_resource_request = {
  tags: tag list;
  (** 
    An array of tag object.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. Currently, the supported resources are [ConfigRule], [ConfigurationAggregator] and [AggregatorAuthorization].
     *)

}

(** 
    Returns details of a specific query.
     *)
type stored_query_metadata = {
  description: string option;
  (** 
    A unique description for the query.
     *)

  query_name: string;
  (** 
    The name of the query.
     *)

  query_arn: string;
  (** 
    Amazon Resource Name (ARN) of the query. For example, arn:partition:service:region:account-id:resource-type/resource-name/resource-id.
     *)

  query_id: string;
  (** 
    The ID of the query.
     *)

}

(** 
    Provides the details of a stored query.
     *)
type stored_query = {
  expression: string option;
  (** 
    The expression of the query. For example, [SELECT
			resourceId,
			resourceType,
			supplementaryConfiguration.BucketVersioningConfiguration.status
			WHERE
			resourceType = 'AWS::S3::Bucket'
			AND supplementaryConfiguration.BucketVersioningConfiguration.status = 'Off'.]
     *)

  description: string option;
  (** 
    A unique description for the query.
     *)

  query_name: string;
  (** 
    The name of the query.
     *)

  query_arn: string option;
  (** 
    Amazon Resource Name (ARN) of the query. For example, arn:partition:service:region:account-id:resource-type/resource-name/resource-id.
     *)

  query_id: string option;
  (** 
    The ID of the query.
     *)

}

(** 
    The input for the [StopConfigurationRecorder] action.
     *)
type stop_configuration_recorder_request = {
  configuration_recorder_name: string;
  (** 
    The name of the recorder object that records each configuration change made to the resources.
     *)

}

(** 
    You have specified a configuration recorder that does not exist.
     *)
type no_such_configuration_recorder_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type member_account_rule_status = | UPDATE_FAILED
  | UPDATE_IN_PROGRESS
  | UPDATE_SUCCESSFUL
  | DELETE_IN_PROGRESS
  | DELETE_FAILED
  | DELETE_SUCCESSFUL
  | CREATE_FAILED
  | CREATE_IN_PROGRESS
  | CREATE_SUCCESSFUL

(** 
    Status filter object to filter results based on specific member account ID or status type for an organization Config rule.
     *)
type status_detail_filters = {
  member_account_rule_status: member_account_rule_status option;
  (** 
    Indicates deployment status for Config rule in the member account. When management account calls [PutOrganizationConfigRule] action for the first time, Config rule status is created in the member account. When management account calls [PutOrganizationConfigRule] action for the second time, Config rule status is updated in the member account. Config rule status is deleted when the management account deletes [OrganizationConfigRule] and disables service access for [config-multiaccountsetup.amazonaws.com].
    
     Config sets the state of the rule to:
     
      {ul
           {- [CREATE_SUCCESSFUL] when Config rule has been created in the member account.
              
              }
            {- [CREATE_IN_PROGRESS] when Config rule is being created in the member account.
               
               }
            {- [CREATE_FAILED] when Config rule creation has failed in the member account.
               
               }
            {- [DELETE_FAILED] when Config rule deletion has failed in the member account.
               
               }
            {- [DELETE_IN_PROGRESS] when Config rule is being deleted in the member account.
               
               }
            {- [DELETE_SUCCESSFUL] when Config rule has been deleted in the member account.
               
               }
            {- [UPDATE_SUCCESSFUL] when Config rule has been updated in the member account.
               
               }
            {- [UPDATE_IN_PROGRESS] when Config rule is being updated in the member account.
               
               }
            {- [UPDATE_FAILED] when Config rule deletion has failed in the member account.
               
               }
           
      }
       *)

  account_id: string option;
  (** 
    The 12-digit account ID of the member account within an organization.
     *)

}

(** 
    The static value of the resource.
     *)
type static_value = {
  values: string list;
  (** 
    A list of values. For example, the ARN of the assumed role.
     *)

}

type start_resource_evaluation_response = {
  resource_evaluation_id: string option;
  (** 
    A unique ResourceEvaluationId that is associated with a single execution.
     *)

}

type resource_configuration_schema_type = | CFN_RESOURCE_SCHEMA

(** 
    Returns information about the resource being evaluated.
     *)
type resource_details = {
  resource_configuration_schema_type: resource_configuration_schema_type option;
  [@ocaml.doc {| 
    The schema type of the resource configuration.
    
     You can find the {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}Resource type schema}, or [CFN_RESOURCE_SCHEMA], in "{i Amazon Web Services public extensions}" within the CloudFormation registry or with the following CLI commmand: [aws cloudformation describe-type --type-name "AWS::S3::Bucket" --type RESOURCE].
     
      For more information, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-view}Managing extensions through the CloudFormation registry} and {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the CloudFormation User Guide.
      
       |}]

  resource_configuration: string;
  (** 
    The resource definition to be evaluated as per the resource configuration schema type.
     *)

  resource_type: string;
  (** 
    The type of resource being evaluated.
     *)

  resource_id: string;
  (** 
    A unique resource ID for an evaluation.
     *)

}

(** 
    Use EvaluationContext to group independently initiated proactive resource evaluations. For example, CFN Stack. If you want to check just a resource definition, you do not need to provide evaluation context.
     *)
type evaluation_context = {
  evaluation_context_identifier: string option;
  (** 
    A unique EvaluationContextIdentifier ID for an EvaluationContext.
     *)

}

type evaluation_mode = | PROACTIVE
  | DETECTIVE

type start_resource_evaluation_request = {
  client_token: string option;
  (** 
    A client token is a unique, case-sensitive string of up to 64 ASCII characters. To make an idempotent API request using one of these actions, specify a client token in the request.
    
     Avoid reusing the same client token for other API requests. If you retry a request that completed successfully using the same client token and the same parameters, the retry succeeds without performing any further actions. If you retry a successful request using the same client token, but one or more of the parameters are different, other than the Region or Availability Zone, the retry fails with an IdempotentParameterMismatch error.
     
      *)

  evaluation_timeout: int option;
  (** 
    The timeout for an evaluation. The default is 900 seconds. You cannot specify a number greater than 3600. If you specify 0, Config uses the default.
     *)

  evaluation_mode: evaluation_mode;
  (** 
    The mode of an evaluation. The valid values for this API are [DETECTIVE] and [PROACTIVE].
     *)

  evaluation_context: evaluation_context option;
  (** 
    Returns an [EvaluationContext] object.
     *)

  resource_details: resource_details;
  (** 
    Returns a [ResourceDetails] object.
     *)

}

(** 
    One or more of the specified parameters are not valid. Verify that your parameters are valid and try again.
     *)
type invalid_parameter_value_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Using the same client token with one or more different parameters. Specify a new client token with the parameter changes and try again.
     *)
type idempotent_parameter_mismatch = {
  message: string option;
  
}

(** 
    The details that identify a resource within Config, including the resource type and resource ID.
     *)
type resource_key = {
  resource_id: string;
  (** 
    The ID of the resource (for example., sg-xxxxxx).
     *)

  resource_type: resource_type;
  (** 
    The resource type.
     *)

}

type start_remediation_execution_response = {
  failed_items: resource_key list option;
  (** 
    For resources that have failed to start execution, the API returns a resource key object.
     *)

  failure_message: string option;
  (** 
    Returns a failure message. For example, the resource is already compliant.
     *)

}

type start_remediation_execution_request = {
  resource_keys: resource_key list;
  (** 
    A list of resource keys to be processed with the current request. Each element in the list consists of the resource type and resource ID.
     *)

  config_rule_name: string;
  (** 
    The list of names of Config rules that you want to run remediation execution for.
     *)

}

(** 
    You specified an Config rule without a remediation configuration.
     *)
type no_such_remediation_configuration_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Indicates one of the following errors:
    
     {ul
          {- For PutConfigRule, the rule cannot be created because the IAM role assigned to Config lacks permissions to perform the config:Put* action.
             
             }
           {- For PutConfigRule, the Lambda function cannot be invoked. Check the function ARN, and check the function's permissions.
              
              }
           {- For PutOrganizationConfigRule, organization Config rule cannot be created because you do not have permissions to call IAM [GetRole] action or create a service-linked role.
              
              }
           {- For PutConformancePack and PutOrganizationConformancePack, a conformance pack cannot be created because you do not have the following permissions:
              
               {ul
                    {- You do not have permission to call IAM [GetRole] action or create a service-linked role.
                       
                       }
                     {- You do not have permission to read Amazon S3 bucket or call SSM:GetDocument.
                        
                        }
                    
            }
            }
          
      }
       *)
type insufficient_permissions_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The input for the [StartConfigurationRecorder] action.
     *)
type start_configuration_recorder_request = {
  configuration_recorder_name: string;
  (** 
    The name of the recorder object that records each configuration change made to the resources.
     *)

}

(** 
    There is no delivery channel available to record configurations.
     *)
type no_available_delivery_channel_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The output when you start the evaluation for the specified Config rule.
     *)
type start_config_rules_evaluation_response = unit

(** 
    
     *)
type start_config_rules_evaluation_request = {
  config_rule_names: string list option;
  (** 
    The list of names of Config rules that you want to run evaluations for.
     *)

}

(** 
    You see this exception in the following cases:
    
     {ul
          {- For DeleteConfigRule, Config is deleting this rule. Try your request again later.
             
             }
           {- For DeleteConfigRule, the rule is deleting your evaluation results. Try your request again later.
              
              }
           {- For DeleteConfigRule, a remediation action is associated with the rule and Config cannot delete this rule. Delete the remediation action associated with the rule before deleting the rule and try your request again later.
              
              }
           {- For PutConfigOrganizationRule, organization Config rule deletion is in progress. Try your request again later.
              
              }
           {- For DeleteOrganizationConfigRule, organization Config rule creation is in progress. Try your request again later.
              
              }
           {- For PutConformancePack and PutOrganizationConformancePack, a conformance pack creation, update, and deletion is in progress. Try your request again later.
              
              }
           {- For DeleteConformancePack, a conformance pack creation, update, and deletion is in progress. Try your request again later.
              
              }
          
      }
       *)
type resource_in_use_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The Config rule in the request is not valid. Verify that the rule is an Config Process Check rule, that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used before trying again.
     *)
type no_such_config_rule_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    For [StartConfigRulesEvaluation] API, this exception is thrown if an evaluation is in progress or if you call the [StartConfigRulesEvaluation] API more than once per minute.
    
     For [PutConfigurationAggregator] API, this exception is thrown if the number of accounts and aggregators exceeds the limit.
      *)
type limit_exceeded_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The specified next token is not valid. Specify the [nextToken] string that was returned in the previous response to get the next page of results.
     *)
type invalid_next_token_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The specified limit is outside the allowable range.
     *)
type invalid_limit_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The syntax of the query is incorrect.
     *)
type invalid_expression_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Details about the fields such as name of the field.
     *)
type field_info = {
  name: string option;
  (** 
    Name of the field.
     *)

}

(** 
    Details about the query.
     *)
type query_info = {
  select_fields: field_info list option;
  (** 
    Returns a [FieldInfo] object.
     *)

}

type select_resource_config_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  query_info: query_info option;
  (** 
    Returns the [QueryInfo] object.
     *)

  results: string list option;
  (** 
    Returns the results for the SQL query.
     *)

}

type select_resource_config_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of query results returned on each page.
     *)

  expression: string;
  (** 
    The SQL query [SELECT] command.
     *)

}

(** 
    You have specified a configuration aggregator that does not exist.
     *)
type no_such_configuration_aggregator_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type select_aggregate_resource_config_response = {
  next_token: string option;
  (** 
    The nextToken string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  query_info: query_info option;
  
  results: string list option;
  (** 
    Returns the results for the SQL query.
     *)

}

type select_aggregate_resource_config_request = {
  next_token: string option;
  (** 
    The nextToken string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  max_results: int option;
  (** 
    The maximum number of query results returned on each page. Config also allows the Limit request parameter.
     *)

  limit: int option;
  (** 
    The maximum number of query results returned on each page.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

  expression: string;
  (** 
    The SQL query SELECT command.
     *)

}

(** 
    Two users are trying to modify the same query at the same time. Wait for a moment and try again.
     *)
type resource_concurrent_modification_exception = {
  message: string option;
  
}

type put_stored_query_response = {
  query_arn: string option;
  (** 
    Amazon Resource Name (ARN) of the query. For example, arn:partition:service:region:account-id:resource-type/resource-name/resource-id.
     *)

}

type put_stored_query_request = {
  tags: tag list option;
  (** 
    A list of [Tags] object.
     *)

  stored_query: stored_query;
  (** 
    A list of [StoredQuery] objects. The mandatory fields are [QueryName] and [Expression].
    
     When you are creating a query, you must provide a query name and an expression. When you are updating a query, you must provide a query name but updating the description is optional.
     
      *)

}

(** 
    Failed to add the retention configuration because a retention configuration with that name already exists.
     *)
type max_number_of_retention_configurations_exceeded_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    An object with the name of the retention configuration and the retention period in days. The object stores the configuration for data retention in Config.
     *)
type retention_configuration = {
  retention_period_in_days: int;
  (** 
    Number of days Config stores your historical information.
    
     Currently, only applicable to the configuration item history.
     
      *)

  name: string;
  (** 
    The name of the retention configuration object.
     *)

}

type put_retention_configuration_response = {
  retention_configuration: retention_configuration option;
  (** 
    Returns a retention configuration object.
     *)

}

type put_retention_configuration_request = {
  retention_period_in_days: int;
  (** 
    Number of days Config stores your historical information.
    
     Currently, only applicable to the configuration item history.
     
      *)

}

(** 
    There is no configuration recorder running.
     *)
type no_running_configuration_recorder_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    You have reached the limit of active custom resource types in your account. There is a limit of 100,000. Delete unused resources using {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeleteResourceConfig.html}DeleteResourceConfig} .
     *)
type max_active_resources_exceeded_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type put_resource_config_request = {
  tags: (string * string) list option;
  (** 
    Tags associated with the resource.
    
     This field is not to be confused with the Amazon Web Services-wide tag feature for Amazon Web Services resources. Tags for [PutResourceConfig] are tags that you supply for the configuration items of your custom resources.
     
      *)

  configuration: string;
  (** 
    The configuration object of the resource in valid JSON format. It must match the schema registered with CloudFormation.
    
     The configuration JSON must not exceed 64 KB.
     
      *)

  resource_name: string option;
  (** 
    Name of the resource.
     *)

  resource_id: string;
  (** 
    Unique identifier of the resource.
     *)

  schema_version_id: string;
  (** 
    Version of the schema registered for the ResourceType in CloudFormation.
     *)

  resource_type: string;
  (** 
    The type of the resource. The custom resource type must be registered with CloudFormation.
    
     You cannot use the organization names “amzn”, “amazon”, “alexa”, “custom” with custom resource types. It is the first part of the ResourceType up to the first ::.
     
      *)

}

(** 
    An object that represents the details about the remediation exception. The details include the rule name, an explanation of an exception, the time when the exception will be deleted, the resource ID, and resource type.
     *)
type remediation_exception = {
  expiration_time: float option;
  (** 
    The time when the remediation exception will be deleted.
     *)

  message: string option;
  (** 
    An explanation of an remediation exception.
     *)

  resource_id: string;
  (** 
    The ID of the resource (for example., sg-xxxxxx).
     *)

  resource_type: string;
  (** 
    The type of a resource.
     *)

  config_rule_name: string;
  (** 
    The name of the Config rule.
     *)

}

(** 
    List of each of the failed remediation exceptions with specific reasons.
     *)
type failed_remediation_exception_batch = {
  failed_items: remediation_exception list option;
  (** 
    Returns remediation exception resource key object of the failed items.
     *)

  failure_message: string option;
  (** 
    Returns a failure message. For example, the auto-remediation has failed.
     *)

}

type put_remediation_exceptions_response = {
  failed_batches: failed_remediation_exception_batch list option;
  (** 
    Returns a list of failed remediation exceptions batch objects. Each object in the batch consists of a list of failed items and failure messages.
     *)

}

(** 
    The details that identify a resource within Config, including the resource type and resource ID.
     *)
type remediation_exception_resource_key = {
  resource_id: string option;
  (** 
    The ID of the resource (for example., sg-xxxxxx).
     *)

  resource_type: string option;
  (** 
    The type of a resource.
     *)

}

type put_remediation_exceptions_request = {
  expiration_time: float option;
  (** 
    The exception is automatically deleted after the expiration date.
     *)

  message: string option;
  (** 
    The message contains an explanation of the exception.
     *)

  resource_keys: remediation_exception_resource_key list;
  (** 
    An exception list of resource exception keys to be processed with the current request. Config adds exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys.
     *)

  config_rule_name: string;
  (** 
    The name of the Config rule for which you want to create remediation exception.
     *)

}

type remediation_target_type = | SSM_DOCUMENT

type resource_value_type = | RESOURCE_ID

(** 
    The dynamic value of the resource.
     *)
type resource_value = {
  value: resource_value_type;
  (** 
    The value is a resource ID.
     *)

}

(** 
    The value is either a dynamic (resource) value or a static value. You must select either a dynamic value or a static value.
     *)
type remediation_parameter_value = {
  static_value: static_value option;
  (** 
    The value is static and does not change at run-time.
     *)

  resource_value: resource_value option;
  (** 
    The value is dynamic and changes at run-time.
     *)

}

(** 
    Amazon Web Services Systems Manager (SSM) specific remediation controls.
     *)
type ssm_controls = {
  error_percentage: int option;
  (** 
    The percentage of errors that are allowed before SSM stops running automations on non-compliant resources for that specific rule. You can specify a percentage of errors, for example 10%. If you do not specifiy a percentage, the default is 50%. For example, if you set the ErrorPercentage to 40% for 10 non-compliant resources, then SSM stops running the automations when the fifth error is received.
     *)

  concurrent_execution_rate_percentage: int option;
  (** 
    The maximum percentage of remediation actions allowed to run in parallel on the non-compliant resources for that specific rule. You can specify a percentage, such as 10%. The default value is 10.
     *)

}

(** 
    The controls that Config uses for executing remediations.
     *)
type execution_controls = {
  ssm_controls: ssm_controls option;
  (** 
    A SsmControls object.
     *)

}

(** 
    An object that represents the details about the remediation configuration that includes the remediation action, parameters, and data to execute the action.
     *)
type remediation_configuration = {
  created_by_service: string option;
  (** 
    Name of the service that owns the service-linked rule, if applicable.
     *)

  arn: string option;
  (** 
    Amazon Resource Name (ARN) of remediation configuration.
     *)

  retry_attempt_seconds: int option;
  (** 
    Time window to determine whether or not to add a remediation exception to prevent infinite remediation attempts. If [MaximumAutomaticAttempts] remediation attempts have been made under [RetryAttemptSeconds], a remediation exception will be added to the resource. If you do not select a number, the default is 60 seconds.
    
     For example, if you specify [RetryAttemptSeconds] as 50 seconds and [MaximumAutomaticAttempts] as 5, Config will run auto-remediations 5 times within 50 seconds before adding a remediation exception to the resource.
      *)

  maximum_automatic_attempts: int option;
  (** 
    The maximum number of failed attempts for auto-remediation. If you do not select a number, the default is 5.
    
     For example, if you specify MaximumAutomaticAttempts as 5 with RetryAttemptSeconds as 50 seconds, Config will put a RemediationException on your behalf for the failing resource after the 5th failed attempt within 50 seconds.
      *)

  execution_controls: execution_controls option;
  (** 
    An ExecutionControls object.
     *)

  automatic: bool option;
  (** 
    The remediation is triggered automatically.
     *)

  resource_type: string option;
  (** 
    The type of a resource.
     *)

  parameters: (string * remediation_parameter_value) list option;
  (** 
    An object of the RemediationParameterValue.
     *)

  target_version: string option;
  (** 
    Version of the target. For example, version of the SSM document.
    
     If you make backward incompatible changes to the SSM document, you must call PutRemediationConfiguration API again to ensure the remediations can run.
     
      *)

  target_id: string;
  (** 
    Target ID is the name of the SSM document.
     *)

  target_type: remediation_target_type;
  (** 
    The type of the target. Target executes remediation. For example, SSM document.
     *)

  config_rule_name: string;
  (** 
    The name of the Config rule.
     *)

}

(** 
    List of each of the failed remediations with specific reasons.
     *)
type failed_remediation_batch = {
  failed_items: remediation_configuration list option;
  (** 
    Returns remediation configurations of the failed items.
     *)

  failure_message: string option;
  (** 
    Returns a failure message. For example, the resource is already compliant.
     *)

}

type put_remediation_configurations_response = {
  failed_batches: failed_remediation_batch list option;
  (** 
    Returns a list of failed remediation batch objects.
     *)

}

type put_remediation_configurations_request = {
  remediation_configurations: remediation_configuration list;
  (** 
    A list of remediation configuration objects.
     *)

}

(** 
    You have specified a template that is not valid or supported.
     *)
type organization_conformance_pack_template_validation_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Config resource cannot be created because your organization does not have all features enabled.
     *)
type organization_all_features_not_enabled_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    For [PutConfigurationAggregator] API, you can see this exception for the following reasons:
    
     {ul
          {- No permission to call [EnableAWSServiceAccess] API
             
             }
           {- The configuration aggregator cannot be updated because your Amazon Web Services Organization management account or the delegated administrator role changed. Delete this aggregator and create a new one with the current Amazon Web Services Organization.
              
              }
           {- The configuration aggregator is associated with a previous Amazon Web Services Organization and Config cannot aggregate data with current Amazon Web Services Organization. Delete this aggregator and create a new one with the current Amazon Web Services Organization.
              
              }
           {- You are not a registered delegated administrator for Config with permissions to call [ListDelegatedAdministrators] API. Ensure that the management account registers delagated administrator for Config service principle name before the delegated administrator creates an aggregator.
              
              }
          
      }
       For all [OrganizationConfigRule] and [OrganizationConformancePack] APIs, Config throws an exception if APIs are called from member accounts. All APIs must be called from organization management account.
        *)
type organization_access_denied_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Organization is no longer available.
     *)
type no_available_organization_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    You have reached the limit of the number of organization conformance packs you can create in an account. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html}{b Service Limits}} in the {i Config Developer Guide}.
     *)
type max_number_of_organization_conformance_packs_exceeded_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type put_organization_conformance_pack_response = {
  organization_conformance_pack_arn: string option;
  (** 
    ARN of the organization conformance pack.
     *)

}

(** 
    Input parameters in the form of key-value pairs for the conformance pack, both of which you define. Keys can have a maximum character length of 255 characters, and values can have a maximum length of 4096 characters.
     *)
type conformance_pack_input_parameter = {
  parameter_value: string;
  (** 
    Another part of the key-value pair.
     *)

  parameter_name: string;
  (** 
    One part of a key-value pair.
     *)

}

type put_organization_conformance_pack_request = {
  excluded_accounts: string list option;
  (** 
    A list of Amazon Web Services accounts to be excluded from an organization conformance pack while deploying a conformance pack.
     *)

  conformance_pack_input_parameters: conformance_pack_input_parameter list option;
  (** 
    A list of [ConformancePackInputParameter] objects.
     *)

  delivery_s3_key_prefix: string option;
  (** 
    The prefix for the Amazon S3 bucket.
    
     This field is optional.
     
      *)

  delivery_s3_bucket: string option;
  (** 
    The name of the Amazon S3 bucket where Config stores conformance pack templates.
    
     This field is optional. If used, it must be prefixed with [awsconfigconforms].
     
      *)

  template_body: string option;
  (** 
    A string containing full conformance pack template body. Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes.
     *)

  template_s3_uri: string option;
  (** 
    Location of file containing the template body. The uri must point to the conformance pack template (max size: 300 KB).
    
     You must have access to read Amazon S3 bucket. In addition, in order to ensure a successful deployment, the template object must not be in an {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html}archived storage class} if this parameter is passed.
     
      *)

  organization_conformance_pack_name: string;
  (** 
    Name of the organization conformance pack you want to create.
     *)

}

(** 
    You have reached the limit of the number of organization Config rules you can create. For more information, see see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html}{b Service Limits}} in the {i Config Developer Guide}.
     *)
type max_number_of_organization_config_rules_exceeded_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type put_organization_config_rule_response = {
  organization_config_rule_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of an organization Config rule.
     *)

}

type maximum_execution_frequency = | TwentyFour_Hours
  | Twelve_Hours
  | Six_Hours
  | Three_Hours
  | One_Hour

(** 
    An object that specifies organization managed rule metadata such as resource type and ID of Amazon Web Services resource along with the rule identifier. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.
     *)
type organization_managed_rule_metadata = {
  tag_value_scope: string option;
  (** 
    The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).
     *)

  tag_key_scope: string option;
  (** 
    One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.
     *)

  resource_id_scope: string option;
  (** 
    The ID of the Amazon Web Services resource that was evaluated.
     *)

  resource_types_scope: string list option;
  (** 
    The type of the Amazon Web Services resource that was evaluated.
     *)

  maximum_execution_frequency: maximum_execution_frequency option;
  (** 
    The maximum frequency with which Config runs evaluations for a rule. This is for an Config managed rule that is triggered at a periodic frequency.
    
     By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.
     
      *)

  input_parameters: string option;
  (** 
    A string, in JSON format, that is passed to your organization Config rule Lambda function.
     *)

  rule_identifier: string;
  (** 
    For organization config managed rules, a predefined identifier from a list. For example, [IAM_PASSWORD_POLICY] is a managed rule. To reference a managed rule, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html}Using Config managed rules}.
     *)

  description: string option;
  (** 
    The description that you provide for your organization Config rule.
     *)

}

type organization_config_rule_trigger_type = | SCHEDULED_NOTIFICATION
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION

(** 
    An object that specifies organization custom rule metadata such as resource type, resource ID of Amazon Web Services resource, Lambda function ARN, and organization trigger types that trigger Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.
     *)
type organization_custom_rule_metadata = {
  tag_value_scope: string option;
  (** 
    The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).
     *)

  tag_key_scope: string option;
  (** 
    One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.
     *)

  resource_id_scope: string option;
  (** 
    The ID of the Amazon Web Services resource that was evaluated.
     *)

  resource_types_scope: string list option;
  (** 
    The type of the Amazon Web Services resource that was evaluated.
     *)

  maximum_execution_frequency: maximum_execution_frequency option;
  (** 
    The maximum frequency with which Config runs evaluations for a rule. Your custom rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].
    
     By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.
     
      *)

  input_parameters: string option;
  (** 
    A string, in JSON format, that is passed to your organization Config rule Lambda function.
     *)

  organization_config_rule_trigger_types: organization_config_rule_trigger_type list;
  (** 
    The type of notification that triggers Config to run an evaluation for a rule. You can specify the following notification types:
    
     {ul
          {- [ConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers a configuration item as a result of a resource change.
             
             }
           {- [OversizedConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.
              
              }
           {- [ScheduledNotification] - Triggers a periodic evaluation at the frequency specified for [MaximumExecutionFrequency].
              
              }
          
      }
       *)

  lambda_function_arn: string;
  (** 
    The lambda function ARN.
     *)

  description: string option;
  (** 
    The description that you provide for your organization Config rule.
     *)

}

type organization_config_rule_trigger_type_no_s_n = | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION

(** 
    An object that specifies metadata for your organization's Config Custom Policy rule. The metadata includes the runtime system in use, which accounts have debug logging enabled, and other custom rule metadata, such as resource type, resource ID of Amazon Web Services resource, and organization trigger types that initiate Config to evaluate Amazon Web Services resources against a rule.
     *)
type organization_custom_policy_rule_metadata = {
  debug_log_delivery_accounts: string list option;
  (** 
    A list of accounts that you can enable debug logging for your organization Config Custom Policy rule. List is null when debug logging is enabled for all accounts.
     *)

  policy_text: string;
  (** 
    The policy definition containing the logic for your organization Config Custom Policy rule.
     *)

  policy_runtime: string;
  (** 
    The runtime system for your organization Config Custom Policy rules. Guard is a policy-as-code language that allows you to write policies that are enforced by Config Custom Policy rules. For more information about Guard, see the {{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}.
     *)

  tag_value_scope: string option;
  (** 
    The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).
     *)

  tag_key_scope: string option;
  (** 
    One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.
     *)

  resource_id_scope: string option;
  (** 
    The ID of the Amazon Web Services resource that was evaluated.
     *)

  resource_types_scope: string list option;
  (** 
    The type of the Amazon Web Services resource that was evaluated.
     *)

  maximum_execution_frequency: maximum_execution_frequency option;
  (** 
    The maximum frequency with which Config runs evaluations for a rule. Your Config Custom Policy rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].
     *)

  input_parameters: string option;
  (** 
    A string, in JSON format, that is passed to your organization Config Custom Policy rule.
     *)

  organization_config_rule_trigger_types: organization_config_rule_trigger_type_no_s_n list option;
  (** 
    The type of notification that initiates Config to run an evaluation for a rule. For Config Custom Policy rules, Config supports change-initiated notification types:
    
     {ul
          {- [ConfigurationItemChangeNotification] - Initiates an evaluation when Config delivers a configuration item as a result of a resource change.
             
             }
           {- [OversizedConfigurationItemChangeNotification] - Initiates an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.
              
              }
          
      }
       *)

  description: string option;
  (** 
    The description that you provide for your organization Config Custom Policy rule.
     *)

}

type put_organization_config_rule_request = {
  organization_custom_policy_rule_metadata: organization_custom_policy_rule_metadata option;
  (** 
    An [OrganizationCustomPolicyRuleMetadata] object. This object specifies metadata for your organization's Config Custom Policy rule. The metadata includes the runtime system in use, which accounts have debug logging enabled, and other custom rule metadata, such as resource type, resource ID of Amazon Web Services resource, and organization trigger types that initiate Config to evaluate Amazon Web Services resources against a rule.
     *)

  excluded_accounts: string list option;
  (** 
    A comma-separated list of accounts that you want to exclude from an organization Config rule.
     *)

  organization_custom_rule_metadata: organization_custom_rule_metadata option;
  (** 
    An [OrganizationCustomRuleMetadata] object. This object specifies organization custom rule metadata such as resource type, resource ID of Amazon Web Services resource, Lambda function ARN, and organization trigger types that trigger Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.
     *)

  organization_managed_rule_metadata: organization_managed_rule_metadata option;
  (** 
    An [OrganizationManagedRuleMetadata] object. This object specifies organization managed rule metadata such as resource type and ID of Amazon Web Services resource along with the rule identifier. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.
     *)

  organization_config_rule_name: string;
  (** 
    The name that you assign to an organization Config rule.
     *)

}

type put_external_evaluation_response = unit

type compliance_type = | Insufficient_Data
  | Not_Applicable
  | Non_Compliant
  | Compliant

(** 
    Identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that it was evaluated against.
     *)
type external_evaluation = {
  ordering_timestamp: float;
  (** 
    The time when the compliance was recorded.
     *)

  annotation: string option;
  (** 
    Supplementary information about the reason of compliance. For example, this task was completed on a specific date.
     *)

  compliance_type: compliance_type;
  (** 
    The compliance of the Amazon Web Services resource. The valid values are [COMPLIANT, NON_COMPLIANT, ] and [NOT_APPLICABLE].
     *)

  compliance_resource_id: string;
  (** 
    The evaluated compliance resource ID. Config accepts only Amazon Web Services account ID.
     *)

  compliance_resource_type: string;
  (** 
    The evaluated compliance resource type. Config accepts [AWS::::Account] resource type.
     *)

}

type put_external_evaluation_request = {
  external_evaluation: external_evaluation;
  (** 
    An [ExternalEvaluation] object that provides details about compliance.
     *)

  config_rule_name: string;
  (** 
    The name of the Config rule.
     *)

}

(** 
    The specified [ResultToken] is not valid.
     *)
type invalid_result_token_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that it was evaluated against.
     *)
type evaluation = {
  ordering_timestamp: float;
  (** 
    The time of the event in Config that triggered the evaluation. For event-based evaluations, the time indicates when Config created the configuration item that triggered the evaluation. For periodic evaluations, the time indicates when Config triggered the evaluation at the frequency that you specified (for example, every 24 hours).
     *)

  annotation: string option;
  (** 
    Supplementary information about how the evaluation determined the compliance.
     *)

  compliance_type: compliance_type;
  (** 
    Indicates whether the Amazon Web Services resource complies with the Config rule that it was evaluated against.
    
     For the [Evaluation] data type, Config supports only the [COMPLIANT], [NON_COMPLIANT], and [NOT_APPLICABLE] values. Config does not support the [INSUFFICIENT_DATA] value for this data type.
     
      Similarly, Config does not accept [INSUFFICIENT_DATA] as the value for [ComplianceType] from a [PutEvaluations] request. For example, an Lambda function for a custom Config rule cannot pass an [INSUFFICIENT_DATA] value to Config.
       *)

  compliance_resource_id: string;
  (** 
    The ID of the Amazon Web Services resource that was evaluated.
     *)

  compliance_resource_type: string;
  (** 
    The type of Amazon Web Services resource that was evaluated.
     *)

}

(** 
    
     *)
type put_evaluations_response = {
  failed_evaluations: evaluation list option;
  (** 
    Requests that failed because of a client or server error.
     *)

}

(** 
    
     *)
type put_evaluations_request = {
  test_mode: bool option;
  (** 
    Use this parameter to specify a test run for [PutEvaluations]. You can verify whether your Lambda function will deliver evaluation results to Config. No updates occur to your existing evaluations, and evaluation results are not sent to Config.
    
     When [TestMode] is [true], [PutEvaluations] doesn't require a valid value for the [ResultToken] parameter, but the value cannot be null.
     
      *)

  result_token: string;
  (** 
    An encrypted token that associates an evaluation with an Config rule. Identifies the rule and the event that triggered the evaluation.
     *)

  evaluations: evaluation list option;
  (** 
    The assessments that the Lambda function performs. Each evaluation identifies an Amazon Web Services resource and indicates whether it complies with the Config rule that invokes the Lambda function.
     *)

}

(** 
    The specified Amazon S3 bucket does not exist.
     *)
type no_such_bucket_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    There are no configuration recorders available to provide the role needed to describe your resources. Create a configuration recorder.
     *)
type no_available_configuration_recorder_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    You have reached the limit of the number of delivery channels you can create.
     *)
type max_number_of_delivery_channels_exceeded_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The specified Amazon SNS topic does not exist.
     *)
type invalid_sns_topic_arn_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The specified Amazon KMS Key ARN is not valid.
     *)
type invalid_s3_kms_key_arn_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The specified Amazon S3 key prefix is not valid.
     *)
type invalid_s3_key_prefix_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The specified delivery channel name is not valid.
     *)
type invalid_delivery_channel_name_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Your Amazon S3 bucket policy does not permit Config to write to it.
     *)
type insufficient_delivery_policy_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Provides options for how often Config delivers configuration snapshots to the Amazon S3 bucket in your delivery channel.
    
     The frequency for a rule that triggers evaluations for your resources when Config delivers the configuration snapshot is set by one of two values, depending on which is less frequent:
     
      {ul
           {- The value for the [deliveryFrequency] parameter within the delivery channel configuration, which sets how often Config delivers configuration snapshots. This value also sets how often Config invokes evaluations for Config rules.
              
              }
            {- The value for the [MaximumExecutionFrequency] parameter, which sets the maximum frequency with which Config invokes evaluations for the rule. For more information, see [ConfigRule].
               
               }
           
      }
       If the [deliveryFrequency] value is less frequent than the [MaximumExecutionFrequency] value for a rule, Config invokes the rule only as often as the [deliveryFrequency] value.
       
        {ol
             {- For example, you want your rule to run evaluations when Config delivers the configuration snapshot.
                
                }
              {- You specify the [MaximumExecutionFrequency] value for [Six_Hours].
                 
                 }
              {- You then specify the delivery channel [deliveryFrequency] value for [TwentyFour_Hours].
                 
                 }
              {- Because the value for [deliveryFrequency] is less frequent than [MaximumExecutionFrequency], Config invokes evaluations for the rule every 24 hours.
                 
                 }
             
      }
       You should set the [MaximumExecutionFrequency] value to be at least as frequent as the [deliveryFrequency] value. You can view the [deliveryFrequency] value by using the [DescribeDeliveryChannnels] action.
       
        To update the [deliveryFrequency] with which Config delivers your configuration snapshots, use the [PutDeliveryChannel] action.
         *)
type config_snapshot_delivery_properties = {
  delivery_frequency: maximum_execution_frequency option;
  (** 
    The frequency with which Config delivers configuration snapshots.
     *)

}

(** 
    The channel through which Config delivers notifications and updated configuration states.
     *)
type delivery_channel = {
  config_snapshot_delivery_properties: config_snapshot_delivery_properties option;
  (** 
    The options for how often Config delivers configuration snapshots to the Amazon S3 bucket.
     *)

  sns_topic_ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the Amazon SNS topic to which Config sends notifications about configuration changes.
    
     If you choose a topic from another account, the topic must have policies that grant access permissions to Config. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/sns-topic-policy.html}Permissions for the Amazon SNS Topic} in the {i Config Developer Guide}.
      *)

  s3_kms_key_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the Key Management Service (KMS ) KMS key (KMS key) used to encrypt objects delivered by Config. Must belong to the same Region as the destination S3 bucket.
     *)

  s3_key_prefix: string option;
  (** 
    The prefix for the specified Amazon S3 bucket.
     *)

  s3_bucket_name: string option;
  (** 
    The name of the Amazon S3 bucket to which Config delivers configuration snapshots and configuration history files.
    
     If you specify a bucket that belongs to another Amazon Web Services account, that bucket must have policies that grant access permissions to Config. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/s3-bucket-policy.html}Permissions for the Amazon S3 Bucket} in the {i Config Developer Guide}.
      *)

  name: string option;
  [@ocaml.doc {| 
    The name of the delivery channel. By default, Config assigns the name "default" when creating the delivery channel. To change the delivery channel name, you must use the DeleteDeliveryChannel action to delete your current delivery channel, and then you must use the PutDeliveryChannel command to create a delivery channel that has the desired name.
     |}]

}

(** 
    The input for the [PutDeliveryChannel] action.
     *)
type put_delivery_channel_request = {
  delivery_channel: delivery_channel;
  (** 
    The configuration delivery channel object that delivers the configuration information to an Amazon S3 bucket and to an Amazon SNS topic.
     *)

}

(** 
    You have reached the limit of the number of conformance packs you can create in an account. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html}{b Service Limits}} in the {i Config Developer Guide}.
     *)
type max_number_of_conformance_packs_exceeded_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    You have specified a template that is not valid or supported.
     *)
type conformance_pack_template_validation_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type put_conformance_pack_response = {
  conformance_pack_arn: string option;
  (** 
    ARN of the conformance pack.
     *)

}

type put_conformance_pack_request = {
  template_ssm_document_details: template_ssm_document_details option;
  (** 
    An object of type [TemplateSSMDocumentDetails], which contains the name or the Amazon Resource Name (ARN) of the Amazon Web Services Systems Manager document (SSM document) and the version of the SSM document that is used to create a conformance pack.
     *)

  conformance_pack_input_parameters: conformance_pack_input_parameter list option;
  (** 
    A list of [ConformancePackInputParameter] objects.
     *)

  delivery_s3_key_prefix: string option;
  (** 
    The prefix for the Amazon S3 bucket.
    
     This field is optional.
     
      *)

  delivery_s3_bucket: string option;
  (** 
    The name of the Amazon S3 bucket where Config stores conformance pack templates.
    
     This field is optional.
     
      *)

  template_body: string option;
  (** 
    A string containing the full conformance pack template body. The structure containing the template body has a minimum length of 1 byte and a maximum length of 51,200 bytes.
    
     You can use a YAML template with two resource types: Config rule ([AWS::Config::ConfigRule]) and remediation action ([AWS::Config::RemediationConfiguration]).
     
      *)

  template_s3_uri: string option;
  (** 
    The location of the file containing the template body ([s3://bucketname/prefix]). The uri must point to a conformance pack template (max size: 300 KB) that is located in an Amazon S3 bucket in the same Region as the conformance pack.
    
     You must have access to read Amazon S3 bucket. In addition, in order to ensure a successful deployment, the template object must not be in an {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/storage-class-intro.html}archived storage class} if this parameter is passed.
     
      *)

  conformance_pack_name: string;
  (** 
    The unique name of the conformance pack you want to deploy.
     *)

}

(** 
    You have reached the limit of the number of configuration recorders you can create.
     *)
type max_number_of_configuration_recorders_exceeded_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    You have provided a null or empty Amazon Resource Name (ARN) for the IAM role assumed by Config and used by the configuration recorder.
     *)
type invalid_role_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Indicates one of the following errors:
    
     {ul
          {- You have provided a combination of parameter values that is not valid. For example:
             
              {ul
                   {- Setting the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], but providing a non-empty list for the [resourceTypes]field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.
                      
                      }
                    {- Setting the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], but also setting the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES].
                       
                       }
                   
            }
            }
           {- Every parameter is either null, false, or empty.
              
              }
           {- You have reached the limit of the number of resource types you can provide for the recording group.
              
              }
           {- You have provided resource types or a recording strategy that are not valid.
              
              }
          
      }
       *)
type invalid_recording_group_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    You have provided a name for the configuration recorder that is not valid.
     *)
type invalid_configuration_recorder_name_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Specifies whether the configuration recorder excludes certain resource types from being recorded. Use the [resourceTypes] field to enter a comma-separated list of resource types you want to exclude from recording.
    
     By default, when Config adds support for a new resource type in the Region where you set up the configuration recorder, including global resource types, Config starts recording resources of that type automatically.
     
      {b How to use the exclusion recording strategy}
      
       To use this option, you must set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES].
       
        Config will then record configuration changes for all supported resource types, except the resource types that you specify to exclude from being recorded.
        
         {b Global resource types and the exclusion recording strategy}
         
          Unless specifically listed as exclusions, [AWS::RDS::GlobalCluster] will be recorded automatically in all supported Config Regions were the configuration recorder is enabled.
          
           IAM users, groups, roles, and customer managed policies will be recorded in the Region where you set up the configuration recorder if that is a Region where Config was available before February 2022. You cannot be record the global IAM resouce types in Regions supported by Config after February 2022. This list where you cannot record the global IAM resource types includes the following Regions:
           
            {ul
                 {- Asia Pacific (Hyderabad)
                    
                    }
                  {- Asia Pacific (Melbourne)
                     
                     }
                  {- Canada West (Calgary)
                     
                     }
                  {- Europe (Spain)
                     
                     }
                  {- Europe (Zurich)
                     
                     }
                  {- Israel (Tel Aviv)
                     
                     }
                  {- Middle East (UAE)
                     
                     }
                 
      }
       *)
type exclusion_by_resource_types = {
  resource_types: resource_type list option;
  (** 
    A comma-separated list of resource types to exclude from recording by the configuration recorder.
     *)

}

type recording_strategy_type = | EXCLUSION_BY_RESOURCE_TYPES
  | INCLUSION_BY_RESOURCE_TYPES
  | ALL_SUPPORTED_RESOURCE_TYPES

(** 
    Specifies the recording strategy of the configuration recorder.
     *)
type recording_strategy = {
  use_only: recording_strategy_type option;
  (** 
    The recording strategy for the configuration recorder.
    
     {ul
          {- If you set this option to [ALL_SUPPORTED_RESOURCE_TYPES], Config records configuration changes for all supported resource types, excluding the global IAM resource types. You also must set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true]. When Config adds support for a new resource type, Config automatically starts recording resources of that type. For a list of supported resource types, see {{:https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources}Supported Resource Types} in the {i Config developer guide}.
             
             }
           {- If you set this option to [INCLUSION_BY_RESOURCE_TYPES], Config records configuration changes for only the resource types that you specify in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.
              
              }
           {- If you set this option to [EXCLUSION_BY_RESOURCE_TYPES], Config records configuration changes for all supported resource types, except the resource types that you specify to exclude from being recorded in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.
              
              }
          
      }
       {b Required and optional fields}
       
        The [recordingStrategy] field is optional when you set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true].
        
         The [recordingStrategy] field is optional when you list resource types in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.
         
          The [recordingStrategy] field is required if you list resource types to exclude from recording in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.
          
           {b Overriding fields}
           
            If you choose [EXCLUSION_BY_RESOURCE_TYPES] for the recording strategy, the [exclusionByResourceTypes] field will override other properties in the request.
            
             For example, even if you set [includeGlobalResourceTypes] to false, global IAM resource types will still be automatically recorded in this option unless those resource types are specifically listed as exclusions in the [resourceTypes] field of [exclusionByResourceTypes].
             
              {b Global resource types and the exclusion recording strategy}
              
               By default, if you choose the [EXCLUSION_BY_RESOURCE_TYPES] recording strategy, when Config adds support for a new resource type in the Region where you set up the configuration recorder, including global resource types, Config starts recording resources of that type automatically.
               
                Unless specifically listed as exclusions, [AWS::RDS::GlobalCluster] will be recorded automatically in all supported Config Regions were the configuration recorder is enabled.
                
                 IAM users, groups, roles, and customer managed policies will be recorded in the Region where you set up the configuration recorder if that is a Region where Config was available before February 2022. You cannot be record the global IAM resouce types in Regions supported by Config after February 2022. This list where you cannot record the global IAM resource types includes the following Regions:
                 
                  {ul
                       {- Asia Pacific (Hyderabad)
                          
                          }
                        {- Asia Pacific (Melbourne)
                           
                           }
                        {- Canada West (Calgary)
                           
                           }
                        {- Europe (Spain)
                           
                           }
                        {- Europe (Zurich)
                           
                           }
                        {- Israel (Tel Aviv)
                           
                           }
                        {- Middle East (UAE)
                           
                           }
                       
      }
       *)

}

(** 
    Specifies which resource types Config records for configuration changes. By default, Config records configuration changes for all current and future supported resource types in the Amazon Web Services Region where you have enabled Config, excluding the global IAM resource types: IAM users, groups, roles, and customer managed policies.
    
     In the recording group, you specify whether you want to record all supported current and future supported resource types or to include or exclude specific resources types. For a list of supported resource types, see {{:https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources}Supported Resource Types} in the {i Config developer guide}.
     
      If you don't want Config to record all current and future supported resource types (excluding the global IAM resource types), use one of the following recording strategies:
      
       {ol
            {- {b Record all current and future resource types with exclusions} ([EXCLUSION_BY_RESOURCE_TYPES]), or
               
               }
             {- {b Record specific resource types} ([INCLUSION_BY_RESOURCE_TYPES]).
                
                }
            
      }
       If you use the recording strategy to {b Record all current and future resource types} ([ALL_SUPPORTED_RESOURCE_TYPES]), you can use the flag [includeGlobalResourceTypes] to include the global IAM resource types in your recording.
       
        {b Aurora global clusters are recorded in all enabled Regions}
        
         The [AWS::RDS::GlobalCluster] resource type will be recorded in all supported Config Regions where the configuration recorder is enabled.
         
          If you do not want to record [AWS::RDS::GlobalCluster] in all enabled Regions, use the [EXCLUSION_BY_RESOURCE_TYPES] or [INCLUSION_BY_RESOURCE_TYPES] recording strategy.
          
           *)
type recording_group = {
  recording_strategy: recording_strategy option;
  (** 
    An object that specifies the recording strategy for the configuration recorder.
    
     {ul
          {- If you set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [ALL_SUPPORTED_RESOURCE_TYPES], Config records configuration changes for all supported resource types, excluding the global IAM resource types. You also must set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true]. When Config adds support for a new resource type, Config automatically starts recording resources of that type.
             
             }
           {- If you set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [INCLUSION_BY_RESOURCE_TYPES], Config records configuration changes for only the resource types you specify in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.
              
              }
           {- If you set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES], Config records configuration changes for all supported resource types except the resource types that you specify to exclude from being recorded in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.
              
              }
          
      }
       {b Required and optional fields}
       
        The [recordingStrategy] field is optional when you set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true].
        
         The [recordingStrategy] field is optional when you list resource types in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}.
         
          The [recordingStrategy] field is required if you list resource types to exclude from recording in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.
          
           {b Overriding fields}
           
            If you choose [EXCLUSION_BY_RESOURCE_TYPES] for the recording strategy, the [exclusionByResourceTypes] field will override other properties in the request.
            
             For example, even if you set [includeGlobalResourceTypes] to false, global IAM resource types will still be automatically recorded in this option unless those resource types are specifically listed as exclusions in the [resourceTypes] field of [exclusionByResourceTypes].
             
              {b Global resources types and the resource exclusion recording strategy}
              
               By default, if you choose the [EXCLUSION_BY_RESOURCE_TYPES] recording strategy, when Config adds support for a new resource type in the Region where you set up the configuration recorder, including global resource types, Config starts recording resources of that type automatically.
               
                Unless specifically listed as exclusions, [AWS::RDS::GlobalCluster] will be recorded automatically in all supported Config Regions were the configuration recorder is enabled.
                
                 IAM users, groups, roles, and customer managed policies will be recorded in the Region where you set up the configuration recorder if that is a Region where Config was available before February 2022. You cannot be record the global IAM resouce types in Regions supported by Config after February 2022. This list where you cannot record the global IAM resource types includes the following Regions:
                 
                  {ul
                       {- Asia Pacific (Hyderabad)
                          
                          }
                        {- Asia Pacific (Melbourne)
                           
                           }
                        {- Canada West (Calgary)
                           
                           }
                        {- Europe (Spain)
                           
                           }
                        {- Europe (Zurich)
                           
                           }
                        {- Israel (Tel Aviv)
                           
                           }
                        {- Middle East (UAE)
                           
                           }
                       
      }
       *)

  exclusion_by_resource_types: exclusion_by_resource_types option;
  (** 
    An object that specifies how Config excludes resource types from being recorded by the configuration recorder.
    
     {b Required fields}
     
      To use this option, you must set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [EXCLUSION_BY_RESOURCE_TYPES].
      
       *)

  resource_types: resource_type list option;
  (** 
    A comma-separated list that specifies which resource types Config records.
    
     For a list of valid [resourceTypes] values, see the {b Resource Type Value} column in {{:https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources}Supported Amazon Web Services resource Types} in the {i Config developer guide}.
     
      {b Required and optional fields}
      
       Optionally, you can set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [INCLUSION_BY_RESOURCE_TYPES].
       
        To record all configuration changes, set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true], and either omit this field or don't specify any resource types in this field. If you set the [allSupported] field to [false] and specify values for [resourceTypes], when Config adds support for a new type of resource, it will not record resources of that type unless you manually add that type to your recording group.
        
         {b Region availability}
         
          Before specifying a resource type for Config to track, check {{:https://docs.aws.amazon.com/config/latest/developerguide/what-is-resource-config-coverage.html}Resource Coverage by Region Availability} to see if the resource type is supported in the Amazon Web Services Region where you set up Config. If a resource type is supported by Config in at least one Region, you can enable the recording of that resource type in all Regions supported by Config, even if the specified resource type is not supported in the Amazon Web Services Region where you set up Config.
          
           *)

  include_global_resource_types: bool option;
  (** 
    This option is a bundle which only applies to the global IAM resource types: IAM users, groups, roles, and customer managed policies. These global IAM resource types can only be recorded by Config in Regions where Config was available before February 2022. You cannot be record the global IAM resouce types in Regions supported by Config after February 2022. This list where you cannot record the global IAM resource types includes the following Regions:
    
     {ul
          {- Asia Pacific (Hyderabad)
             
             }
           {- Asia Pacific (Melbourne)
              
              }
           {- Canada West (Calgary)
              
              }
           {- Europe (Spain)
              
              }
           {- Europe (Zurich)
              
              }
           {- Israel (Tel Aviv)
              
              }
           {- Middle East (UAE)
              
              }
          
      }
       {b Aurora global clusters are recorded in all enabled Regions}
       
        The [AWS::RDS::GlobalCluster] resource type will be recorded in all supported Config Regions where the configuration recorder is enabled, even if [includeGlobalResourceTypes] is set[false]. The [includeGlobalResourceTypes] option is a bundle which only applies to IAM users, groups, roles, and customer managed policies.
        
         If you do not want to record [AWS::RDS::GlobalCluster] in all enabled Regions, use one of the following recording strategies:
         
          {ol
               {- {b Record all current and future resource types with exclusions} ([EXCLUSION_BY_RESOURCE_TYPES]), or
                  
                  }
                {- {b Record specific resource types} ([INCLUSION_BY_RESOURCE_TYPES]).
                   
                   }
               
      }
       For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-all}Selecting Which Resources are Recorded} in the {i Config developer guide}.
       
        {b includeGlobalResourceTypes and the exclusion recording strategy}
        
         The [includeGlobalResourceTypes] field has no impact on the [EXCLUSION_BY_RESOURCE_TYPES] recording strategy. This means that the global IAM resource types (IAM users, groups, roles, and customer managed policies) will not be automatically added as exclusions for [exclusionByResourceTypes] when [includeGlobalResourceTypes] is set to [false].
         
          The [includeGlobalResourceTypes] field should only be used to modify the [AllSupported] field, as the default for the [AllSupported] field is to record configuration changes for all supported resource types excluding the global IAM resource types. To include the global IAM resource types when [AllSupported] is set to [true], make sure to set [includeGlobalResourceTypes] to [true].
          
           To exclude the global IAM resource types for the [EXCLUSION_BY_RESOURCE_TYPES] recording strategy, you need to manually add them to the [resourceTypes] field of [exclusionByResourceTypes].
           
            {b Required and optional fields}
            
             Before you set this field to [true], set the [allSupported] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} to [true]. Optionally, you can set the [useOnly] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} to [ALL_SUPPORTED_RESOURCE_TYPES].
             
              {b Overriding fields}
              
               If you set this field to [false] but list global IAM resource types in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}, Config will still record configuration changes for those specified resource types {i regardless} of if you set the [includeGlobalResourceTypes] field to false.
               
                If you do not want to record configuration changes to the global IAM resource types (IAM users, groups, roles, and customer managed policies), make sure to not list them in the [resourceTypes] field in addition to setting the [includeGlobalResourceTypes] field to false.
                
                 *)

  all_supported: bool option;
  (** 
    Specifies whether Config records configuration changes for all supported resource types, excluding the global IAM resource types.
    
     If you set this field to [true], when Config adds support for a new resource type, Config starts recording resources of that type automatically.
     
      If you set this field to [true], you cannot enumerate specific resource types to record in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup}, or to exclude in the [resourceTypes] field of {{:https://docs.aws.amazon.com/config/latest/APIReference/API_ExclusionByResourceTypes.html}ExclusionByResourceTypes}.
      
       {b Region availability}
       
        Check {{:https://docs.aws.amazon.com/config/latest/developerguide/what-is-resource-config-coverage.html}Resource Coverage by Region Availability} to see if a resource type is supported in the Amazon Web Services Region where you set up Config.
        
         *)

}

type recording_frequency = | DAILY
  | CONTINUOUS

(** 
    An object for you to specify your overrides for the recording mode.
     *)
type recording_mode_override = {
  recording_frequency: recording_frequency;
  (** 
    The recording frequency that will be applied to all the resource types specified in the override.
    
     {ul
          {- Continuous recording allows you to record configuration changes continuously whenever a change occurs.
             
             }
           {- Daily recording allows you to receive a configuration item (CI) representing the most recent state of your resources over the last 24-hour period, only if it’s different from the previous CI recorded.
              
              }
          
      }
       Firewall Manager depends on continuous recording to monitor your resources. If you are using Firewall Manager, it is recommended that you set the recording frequency to Continuous.
       
        *)

  resource_types: resource_type list;
  (** 
    A comma-separated list that specifies which resource types Config includes in the override.
    
     Daily recording is not supported for the following resource types:
     
      {ul
           {- [AWS::Config::ResourceCompliance]
              
              }
            {- [AWS::Config::ConformancePackCompliance]
               
               }
            {- [AWS::Config::ConfigurationRecorder]
               
               }
           
      }
       *)

  description: string option;
  (** 
    A description that you provide for the override.
     *)

}

(** 
    Specifies the default recording frequency that Config uses to record configuration changes. Config supports {i Continuous recording} and {i Daily recording}.
    
     {ul
          {- Continuous recording allows you to record configuration changes continuously whenever a change occurs.
             
             }
           {- Daily recording allows you to receive a configuration item (CI) representing the most recent state of your resources over the last 24-hour period, only if it’s different from the previous CI recorded.
              
              }
          
      }
       Firewall Manager depends on continuous recording to monitor your resources. If you are using Firewall Manager, it is recommended that you set the recording frequency to Continuous.
       
        You can also override the recording frequency for specific resource types.
         *)
type recording_mode = {
  recording_mode_overrides: recording_mode_override list option;
  (** 
    An array of [recordingModeOverride] objects for you to specify your overrides for the recording mode. The [recordingModeOverride] object in the [recordingModeOverrides] array consists of three fields: a [description], the new [recordingFrequency], and an array of [resourceTypes] to override.
     *)

  recording_frequency: recording_frequency;
  (** 
    The default recording frequency that Config uses to record configuration changes.
    
     Daily recording is not supported for the following resource types:
     
      {ul
           {- [AWS::Config::ResourceCompliance]
              
              }
            {- [AWS::Config::ConformancePackCompliance]
               
               }
            {- [AWS::Config::ConfigurationRecorder]
               
               }
           
      }
       For the {b allSupported} ([ALL_SUPPORTED_RESOURCE_TYPES]) recording strategy, these resource types will be set to Continuous recording.
       
        *)

}

(** 
    Records configuration changes to your specified resource types. For more information about the configuration recorder, see {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html}{b Managing the Configuration Recorder}} in the {i Config Developer Guide}.
     *)
type configuration_recorder = {
  recording_mode: recording_mode option;
  (** 
    Specifies the default recording frequency that Config uses to record configuration changes. Config supports {i Continuous recording} and {i Daily recording}.
    
     {ul
          {- Continuous recording allows you to record configuration changes continuously whenever a change occurs.
             
             }
           {- Daily recording allows you to receive a configuration item (CI) representing the most recent state of your resources over the last 24-hour period, only if it’s different from the previous CI recorded.
              
              }
          
      }
       Firewall Manager depends on continuous recording to monitor your resources. If you are using Firewall Manager, it is recommended that you set the recording frequency to Continuous.
       
        You can also override the recording frequency for specific resource types.
         *)

  recording_group: recording_group option;
  (** 
    Specifies which resource types Config records for configuration changes.
    
     {b High Number of Config Evaluations}
     
      You may notice increased activity in your account during your initial month recording with Config when compared to subsequent months. During the initial bootstrapping process, Config runs evaluations on all the resources in your account that you have selected for Config to record.
      
       If you are running ephemeral workloads, you may see increased activity from Config as it records configuration changes associated with creating and deleting these temporary resources. An {i ephemeral workload} is a temporary use of computing resources that are loaded and run when needed. Examples include Amazon Elastic Compute Cloud (Amazon EC2) Spot Instances, Amazon EMR jobs, and Auto Scaling. If you want to avoid the increased activity from running ephemeral workloads, you can run these types of workloads in a separate account with Config turned off to avoid increased configuration recording and rule evaluations.
       
        *)

  role_ar_n: string option;
  (** 
    Amazon Resource Name (ARN) of the IAM role assumed by Config and used by the configuration recorder.
    
     While the API model does not require this field, the server will reject a request without a defined [roleARN] for the configuration recorder.
     
      {b Pre-existing Config role}
      
       If you have used an Amazon Web Services service that uses Config, such as Security Hub or Control Tower, and an Config role has already been created, make sure that the IAM role that you use when setting up Config keeps the same minimum permissions as the already created Config role. You must do this so that the other Amazon Web Services service continues to run as expected.
       
        For example, if Control Tower has an IAM role that allows Config to read Amazon Simple Storage Service (Amazon S3) objects, make sure that the same permissions are granted within the IAM role you use when setting up Config. Otherwise, it may interfere with how Control Tower operates. For more information about IAM roles for Config, see {{:https://docs.aws.amazon.com/config/latest/developerguide/security-iam.html}{b Identity and Access Management for Config}} in the {i Config Developer Guide}.
        
         *)

  name: string option;
  [@ocaml.doc {| 
    The name of the configuration recorder. Config automatically assigns the name of "default" when creating the configuration recorder.
    
     You cannot change the name of the configuration recorder after it has been created. To change the configuration recorder name, you must delete it and create a new configuration recorder with a new name.
     
      |}]

}

(** 
    The input for the [PutConfigurationRecorder] action.
     *)
type put_configuration_recorder_request = {
  configuration_recorder: configuration_recorder;
  (** 
    An object for the configuration recorder to record configuration changes for specified resource types.
     *)

}

(** 
    A collection of accounts and regions.
     *)
type account_aggregation_source = {
  aws_regions: string list option;
  (** 
    The source regions being aggregated.
     *)

  all_aws_regions: bool option;
  (** 
    If true, aggregate existing Config regions and future regions.
     *)

  account_ids: string list;
  (** 
    The 12-digit account ID of the account being aggregated.
     *)

}

(** 
    This object contains regions to set up the aggregator and an IAM role to retrieve organization details.
     *)
type organization_aggregation_source = {
  all_aws_regions: bool option;
  (** 
    If true, aggregate existing Config regions and future regions.
     *)

  aws_regions: string list option;
  (** 
    The source regions being aggregated.
     *)

  role_arn: string;
  (** 
    ARN of the IAM role used to retrieve Amazon Web Services Organization details associated with the aggregator account.
     *)

}

(** 
    The details about the configuration aggregator, including information about source accounts, regions, and metadata of the aggregator.
     *)
type configuration_aggregator = {
  created_by: string option;
  (** 
    Amazon Web Services service that created the configuration aggregator.
     *)

  last_updated_time: float option;
  (** 
    The time of the last update.
     *)

  creation_time: float option;
  (** 
    The time stamp when the configuration aggregator was created.
     *)

  organization_aggregation_source: organization_aggregation_source option;
  (** 
    Provides an organization and list of regions to be aggregated.
     *)

  account_aggregation_sources: account_aggregation_source list option;
  (** 
    Provides a list of source accounts and regions to be aggregated.
     *)

  configuration_aggregator_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the aggregator.
     *)

  configuration_aggregator_name: string option;
  (** 
    The name of the aggregator.
     *)

}

type put_configuration_aggregator_response = {
  configuration_aggregator: configuration_aggregator option;
  (** 
    Returns a ConfigurationAggregator object.
     *)

}

type put_configuration_aggregator_request = {
  tags: tag list option;
  (** 
    An array of tag object.
     *)

  organization_aggregation_source: organization_aggregation_source option;
  (** 
    An OrganizationAggregationSource object.
     *)

  account_aggregation_sources: account_aggregation_source list option;
  (** 
    A list of AccountAggregationSource object.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

(** 
    Failed to add the Config rule because the account already contains the maximum number of 1000 rules. Consider deleting any deactivated rules before you add new rules.
     *)
type max_number_of_config_rules_exceeded_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Defines which resources trigger an evaluation for an Config rule. The scope can include one or more resource types, a combination of a tag key and value, or a combination of one resource type and one resource ID. Specify a scope to constrain which resources trigger an evaluation for a rule. Otherwise, evaluations for the rule are triggered when any resource in your recording group changes in configuration.
     *)
type scope = {
  compliance_resource_id: string option;
  (** 
    The ID of the only Amazon Web Services resource that you want to trigger an evaluation for the rule. If you specify a resource ID, you must specify one resource type for [ComplianceResourceTypes].
     *)

  tag_value: string option;
  (** 
    The tag value applied to only those Amazon Web Services resources that you want to trigger an evaluation for the rule. If you specify a value for [TagValue], you must also specify a value for [TagKey].
     *)

  tag_key: string option;
  (** 
    The tag key that is applied to only those Amazon Web Services resources that you want to trigger an evaluation for the rule.
     *)

  compliance_resource_types: string list option;
  (** 
    The resource types of only those Amazon Web Services resources that you want to trigger an evaluation for the rule. You can only specify one type if you also specify a resource ID for [ComplianceResourceId].
     *)

}

type owner = | Custom_Policy
  | Aws
  | Custom_Lambda

type event_source = | Aws_Config

type message_type = | OversizedConfigurationItemChangeNotification
  | ScheduledNotification
  | ConfigurationSnapshotDeliveryCompleted
  | ConfigurationItemChangeNotification

(** 
    Provides the source and the message types that trigger Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic. You can specify the parameter values for [SourceDetail] only for custom rules.
     *)
type source_detail = {
  maximum_execution_frequency: maximum_execution_frequency option;
  (** 
    The frequency at which you want Config to run evaluations for a custom rule with a periodic trigger. If you specify a value for [MaximumExecutionFrequency], then [MessageType] must use the [ScheduledNotification] value.
    
     By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.
     
      Based on the valid value you choose, Config runs evaluations once for each valid value. For example, if you choose [Three_Hours], Config runs evaluations once every three hours. In this case, [Three_Hours] is the frequency of this rule.
      
       *)

  message_type: message_type option;
  (** 
    The type of notification that triggers Config to run an evaluation for a rule. You can specify the following notification types:
    
     {ul
          {- [ConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers a configuration item as a result of a resource change.
             
             }
           {- [OversizedConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.
              
              }
           {- [ScheduledNotification] - Triggers a periodic evaluation at the frequency specified for [MaximumExecutionFrequency].
              
              }
           {- [ConfigurationSnapshotDeliveryCompleted] - Triggers a periodic evaluation when Config delivers a configuration snapshot.
              
              }
          
      }
       If you want your custom rule to be triggered by configuration changes, specify two SourceDetail objects, one for [ConfigurationItemChangeNotification] and one for [OversizedConfigurationItemChangeNotification].
        *)

  event_source: event_source option;
  (** 
    The source of the event, such as an Amazon Web Services service, that triggers Config to evaluate your Amazon Web Services resources.
     *)

}

(** 
    Provides the runtime system, policy definition, and whether debug logging enabled. You can specify the following CustomPolicyDetails parameter values only for Config Custom Policy rules.
     *)
type custom_policy_details = {
  enable_debug_log_delivery: bool option;
  (** 
    The boolean expression for enabling debug logging for your Config Custom Policy rule. The default value is [false].
     *)

  policy_text: string;
  (** 
    The policy definition containing the logic for your Config Custom Policy rule.
     *)

  policy_runtime: string;
  (** 
    The runtime system for your Config Custom Policy rule. Guard is a policy-as-code language that allows you to write policies that are enforced by Config Custom Policy rules. For more information about Guard, see the {{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}.
     *)

}

(** 
    Provides the CustomPolicyDetails, the rule owner ([Amazon Web Services] for managed rules, [CUSTOM_POLICY] for Custom Policy rules, and [CUSTOM_LAMBDA] for Custom Lambda rules), the rule identifier, and the events that cause the evaluation of your Amazon Web Services resources.
     *)
type source = {
  custom_policy_details: custom_policy_details option;
  (** 
    Provides the runtime system, policy definition, and whether debug logging is enabled. Required when owner is set to [CUSTOM_POLICY].
     *)

  source_details: source_detail list option;
  (** 
    Provides the source and the message types that cause Config to evaluate your Amazon Web Services resources against a rule. It also provides the frequency with which you want Config to run evaluations for the rule if the trigger type is periodic.
    
     If the owner is set to [CUSTOM_POLICY], the only acceptable values for the Config rule trigger message type are [ConfigurationItemChangeNotification] and [OversizedConfigurationItemChangeNotification].
      *)

  source_identifier: string option;
  (** 
    For Config Managed rules, a predefined identifier from a list. For example, [IAM_PASSWORD_POLICY] is a managed rule. To reference a managed rule, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}.
    
     For Config Custom Lambda rules, the identifier is the Amazon Resource Name (ARN) of the rule's Lambda function, such as [arn:aws:lambda:us-east-2:123456789012:function:custom_rule_name].
     
      For Config Custom Policy rules, this field will be ignored.
       *)

  owner: owner;
  (** 
    Indicates whether Amazon Web Services or the customer owns and manages the Config rule.
    
     Config Managed Rules are predefined rules owned by Amazon Web Services. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_use-managed-rules.html}Config Managed Rules} in the {i Config developer guide}.
     
      Config Custom Rules are rules that you can develop either with Guard ([CUSTOM_POLICY]) or Lambda ([CUSTOM_LAMBDA]). For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_develop-rules.html}Config Custom Rules} in the {i Config developer guide}.
       *)

}

type config_rule_state = | EVALUATING
  | DELETING_RESULTS
  | DELETING
  | ACTIVE

(** 
    The configuration object for Config rule evaluation mode. The supported valid values are Detective or Proactive.
     *)
type evaluation_mode_configuration = {
  mode: evaluation_mode option;
  (** 
    The mode of an evaluation. The valid values are Detective or Proactive.
     *)

}

(** 
    Config rules evaluate the configuration settings of your Amazon Web Services resources. A rule can run when Config detects a configuration change to an Amazon Web Services resource or at a periodic frequency that you choose (for example, every 24 hours). There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}.
    
     Config Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}.
     
      Config Custom Rules are rules that you create from scratch. There are two ways to create Config custom rules: with Lambda functions ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function}Lambda Developer Guide}) and with Guard ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a policy-as-code language. Config custom rules created with Lambda are called {i Config Custom Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy Rules}.
      
       For more information about developing and using Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html}Evaluating Resource with Config Rules} in the {i Config Developer Guide}.
       
        You can use the Amazon Web Services CLI and Amazon Web Services SDKs if you want to create a rule that triggers evaluations for your resources when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].
        
         *)
type config_rule = {
  evaluation_modes: evaluation_mode_configuration list option;
  (** 
    The modes the Config rule can be evaluated in. The valid values are distinct objects. By default, the value is Detective evaluation mode only.
     *)

  created_by: string option;
  (** 
    Service principal name of the service that created the rule.
    
     The field is populated only if the service-linked rule is created by a service. The field is empty if you create your own rule.
     
      *)

  config_rule_state: config_rule_state option;
  (** 
    Indicates whether the Config rule is active or is currently being deleted by Config. It can also indicate the evaluation status for the Config rule.
    
     Config sets the state of the rule to [EVALUATING] temporarily after you use the [StartConfigRulesEvaluation] request to evaluate your resources against the Config rule.
     
      Config sets the state of the rule to [DELETING_RESULTS] temporarily after you use the [DeleteEvaluationResults] request to delete the current evaluation results for the Config rule.
      
       Config temporarily sets the state of a rule to [DELETING] after you use the [DeleteConfigRule] request to delete the rule. After Config deletes the rule, the rule and all of its evaluations are erased and are no longer available.
        *)

  maximum_execution_frequency: maximum_execution_frequency option;
  (** 
    The maximum frequency with which Config runs evaluations for a rule. You can specify a value for [MaximumExecutionFrequency] when:
    
     {ul
          {- This is for an Config managed rule that is triggered at a periodic frequency.
             
             }
           {- Your custom rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].
              
              }
          
      }
       By default, rules with a periodic trigger are evaluated every 24 hours. To change the frequency, specify a valid value for the [MaximumExecutionFrequency] parameter.
       
        *)

  input_parameters: string option;
  (** 
    A string, in JSON format, that is passed to the Config rule Lambda function.
     *)

  source: source;
  (** 
    Provides the rule owner ([Amazon Web Services] for managed rules, [CUSTOM_POLICY] for Custom Policy rules, and [CUSTOM_LAMBDA] for Custom Lambda rules), the rule identifier, and the notifications that cause the function to evaluate your Amazon Web Services resources.
     *)

  scope: scope option;
  (** 
    Defines which resources can trigger an evaluation for the rule. The scope can include one or more resource types, a combination of one resource type and one resource ID, or a combination of a tag key and value. Specify a scope to constrain the resources that can trigger an evaluation for the rule. If you do not specify a scope, evaluations are triggered when any resource in the recording group changes.
    
     The scope can be empty.
     
      *)

  description: string option;
  (** 
    The description that you provide for the Config rule.
     *)

  config_rule_id: string option;
  (** 
    The ID of the Config rule.
     *)

  config_rule_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the Config rule.
     *)

  config_rule_name: string option;
  (** 
    The name that you assign to the Config rule. The name is required if you are adding a new rule.
     *)

}

type put_config_rule_request = {
  tags: tag list option;
  (** 
    An array of tag object.
     *)

  config_rule: config_rule;
  (** 
    The rule that you want to add to your account.
     *)

}

(** 
    An object that represents the authorizations granted to aggregator accounts and regions.
     *)
type aggregation_authorization = {
  creation_time: float option;
  (** 
    The time stamp when the aggregation authorization was created.
     *)

  authorized_aws_region: string option;
  (** 
    The region authorized to collect aggregated data.
     *)

  authorized_account_id: string option;
  (** 
    The 12-digit account ID of the account authorized to aggregate data.
     *)

  aggregation_authorization_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the aggregation object.
     *)

}

type put_aggregation_authorization_response = {
  aggregation_authorization: aggregation_authorization option;
  (** 
    Returns an AggregationAuthorization object.
     *)

}

type put_aggregation_authorization_request = {
  tags: tag list option;
  (** 
    An array of tag object.
     *)

  authorized_aws_region: string;
  (** 
    The region authorized to collect aggregated data.
     *)

  authorized_account_id: string;
  (** 
    The 12-digit account ID of the account authorized to aggregate data.
     *)

}

type list_tags_for_resource_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  tags: tag list option;
  (** 
    The tags for the resource.
     *)

}

type list_tags_for_resource_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of tags returned on each page. The limit maximum is 50. You cannot specify a number greater than 50. If you specify 0, Config uses the default.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. Currently, the supported resources are [ConfigRule], [ConfigurationAggregator] and [AggregatorAuthorization].
     *)

}

type list_stored_queries_response = {
  next_token: string option;
  (** 
    If the previous paginated request didn't return all of the remaining results, the response object's [NextToken] parameter value is set to a token. To retrieve the next set of results, call this action again and assign that token to the request object's [NextToken] parameter. If there are no remaining results, the previous response object's [NextToken] parameter is set to [null].
     *)

  stored_query_metadata: stored_query_metadata list option;
  (** 
    A list of [StoredQueryMetadata] objects.
     *)

}

type list_stored_queries_request = {
  max_results: int option;
  (** 
    The maximum number of results to be returned with a single call.
     *)

  next_token: string option;
  (** 
    The nextToken string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

}

(** 
    The specified time range is not valid. The earlier time is not chronologically before the later time.
     *)
type invalid_time_range_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Returns details of a resource evaluation.
     *)
type resource_evaluation = {
  evaluation_start_timestamp: float option;
  (** 
    The starting time of an execution.
     *)

  evaluation_mode: evaluation_mode option;
  (** 
    The mode of an evaluation. The valid values are Detective or Proactive.
     *)

  resource_evaluation_id: string option;
  (** 
    The ResourceEvaluationId of a evaluation.
     *)

}

type list_resource_evaluations_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  resource_evaluations: resource_evaluation list option;
  (** 
    Returns a [ResourceEvaluations] object.
     *)

}

(** 
    Returns details of a resource evaluation based on the selected filter.
     *)
type resource_evaluation_filters = {
  evaluation_context_identifier: string option;
  (** 
    Filters evaluations for a given infrastructure deployment. For example: CFN Stack.
     *)

  time_window: time_window option;
  (** 
    Returns a [TimeWindow] object.
     *)

  evaluation_mode: evaluation_mode option;
  (** 
    Filters all resource evaluations results based on an evaluation mode.
    
     Currently, [DECTECTIVE] is not supported as a valid value. Ignore other documentation stating otherwise.
     
      *)

}

type list_resource_evaluations_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of evaluations returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.
     *)

  filters: resource_evaluation_filters option;
  (** 
    Returns a [ResourceEvaluationFilters] object.
     *)

}

(** 
    The details that identify a resource that is discovered by Config, including the resource type, ID, and (if available) the custom resource name.
     *)
type resource_identifier = {
  resource_deletion_time: float option;
  (** 
    The time that the resource was deleted.
     *)

  resource_name: string option;
  (** 
    The custom name of the resource (if available).
     *)

  resource_id: string option;
  (** 
    The ID of the resource (for example, [sg-xxxxxx]).
     *)

  resource_type: resource_type option;
  (** 
    The type of resource.
     *)

}

(** 
    
     *)
type list_discovered_resources_response = {
  next_token: string option;
  (** 
    The string that you use in a subsequent request to get the next page of results in a paginated response.
     *)

  resource_identifiers: resource_identifier list option;
  (** 
    The details that identify a resource that is discovered by Config, including the resource type, ID, and (if available) the custom resource name.
     *)

}

(** 
    
     *)
type list_discovered_resources_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  include_deleted_resources: bool option;
  (** 
    Specifies whether Config includes deleted resources in the results. By default, deleted resources are not included.
     *)

  limit: int option;
  (** 
    The maximum number of resource identifiers returned on each page. The default is 100. You cannot specify a number greater than 100. If you specify 0, Config uses the default.
     *)

  resource_name: string option;
  (** 
    The custom name of only those resources that you want Config to list in the response. If you do not specify this parameter, Config lists all resources of the specified type that it has discovered.
     *)

  resource_ids: string list option;
  (** 
    The IDs of only those resources that you want Config to list in the response. If you do not specify this parameter, Config lists all resources of the specified type that it has discovered. You can list a minimum of 1 resourceID and a maximum of 20 resourceIds.
     *)

  resource_type: resource_type;
  (** 
    The type of resources that you want Config to list in the response.
     *)

}

(** 
    A compliance score is the percentage of the number of compliant rule-resource combinations in a conformance pack compared to the number of total possible rule-resource combinations in the conformance pack. This metric provides you with a high-level view of the compliance state of your conformance packs. You can use it to identify, investigate, and understand the level of compliance in your conformance packs.
     *)
type conformance_pack_compliance_score = {
  last_updated_time: float option;
  (** 
    The time that the conformance pack compliance score was last updated.
     *)

  conformance_pack_name: string option;
  (** 
    The name of the conformance pack.
     *)

  score: string option;
  (** 
    Compliance score for the conformance pack. Conformance packs with no evaluation results will have a compliance score of [INSUFFICIENT_DATA].
     *)

}

type list_conformance_pack_compliance_scores_response = {
  conformance_pack_compliance_scores: conformance_pack_compliance_score list;
  (** 
    A list of [ConformancePackComplianceScore] objects.
     *)

  next_token: string option;
  (** 
    The [nextToken] string that you can use to get the next page of results in a paginated response.
     *)

}

(** 
    A list of filters to apply to the conformance pack compliance score result set.
     *)
type conformance_pack_compliance_scores_filters = {
  conformance_pack_names: string list;
  (** 
    The names of the conformance packs whose compliance scores you want to include in the conformance pack compliance score result set. You can include up to 25 conformance packs in the [ConformancePackNames] array of strings, each with a character limit of 256 characters for the conformance pack name.
     *)

}

type sort_order = | DESCENDING
  | ASCENDING

type sort_by = | SCORE

type list_conformance_pack_compliance_scores_request = {
  next_token: string option;
  (** 
    The [nextToken] string in a prior request that you can use to get the paginated response for the next set of conformance pack compliance scores.
     *)

  limit: int option;
  (** 
    The maximum number of conformance pack compliance scores returned on each page.
     *)

  sort_by: sort_by option;
  (** 
    Sorts your conformance pack compliance scores in either ascending or descending order, depending on [SortOrder].
    
     By default, conformance pack compliance scores are sorted in alphabetical order by name of the conformance pack. Enter [SCORE], to sort conformance pack compliance scores by the numerical value of the compliance score.
      *)

  sort_order: sort_order option;
  (** 
    Determines the order in which conformance pack compliance scores are sorted. Either in ascending or descending order.
    
     By default, conformance pack compliance scores are sorted in alphabetical order by name of the conformance pack. Conformance pack compliance scores are sorted in reverse alphabetical order if you enter [DESCENDING].
     
      You can sort conformance pack compliance scores by the numerical value of the compliance score by entering [SCORE] in the [SortBy] action. When compliance scores are sorted by [SCORE], conformance packs with a compliance score of [INSUFFICIENT_DATA] will be last when sorting by ascending order and first when sorting by descending order.
       *)

  filters: conformance_pack_compliance_scores_filters option;
  (** 
    Filters the results based on the [ConformancePackComplianceScoresFilters].
     *)

}

type list_aggregate_discovered_resources_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  resource_identifiers: aggregate_resource_identifier list option;
  (** 
    Returns a list of [ResourceIdentifiers] objects.
     *)

}

(** 
    Filters the results by resource account ID, region, resource ID, and resource name.
     *)
type resource_filters = {
  region: string option;
  (** 
    The source region.
     *)

  resource_name: string option;
  (** 
    The name of the resource.
     *)

  resource_id: string option;
  (** 
    The ID of the resource.
     *)

  account_id: string option;
  (** 
    The 12-digit source account ID.
     *)

}

type list_aggregate_discovered_resources_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of resource identifiers returned on each page. You cannot specify a number greater than 100. If you specify 0, Config uses the default.
     *)

  filters: resource_filters option;
  (** 
    Filters the results based on the [ResourceFilters] object.
     *)

  resource_type: resource_type;
  (** 
    The type of resources that you want Config to list in the response.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

type get_stored_query_response = {
  stored_query: stored_query option;
  (** 
    Returns a [StoredQuery] object.
     *)

}

type get_stored_query_request = {
  query_name: string;
  (** 
    The name of the query.
     *)

}

type resource_evaluation_status = | SUCCEEDED
  | FAILED
  | IN_PROGRESS

(** 
    Returns status details of an evaluation.
     *)
type evaluation_status = {
  failure_reason: string option;
  (** 
    An explanation for failed execution status.
     *)

  status: resource_evaluation_status;
  (** 
    The status of an execution. The valid values are In_Progress, Succeeded or Failed.
     *)

}

type get_resource_evaluation_summary_response = {
  resource_details: resource_details option;
  (** 
    Returns a [ResourceDetails] object.
     *)

  evaluation_context: evaluation_context option;
  (** 
    Returns an [EvaluationContext] object.
     *)

  compliance: compliance_type option;
  (** 
    The compliance status of the resource evaluation summary.
     *)

  evaluation_start_timestamp: float option;
  (** 
    The start timestamp when Config rule starts evaluating compliance for the provided resource details.
     *)

  evaluation_status: evaluation_status option;
  (** 
    Returns an [EvaluationStatus] object.
     *)

  evaluation_mode: evaluation_mode option;
  (** 
    Lists results of the mode that you requested to retrieve the resource evaluation summary. The valid values are Detective or Proactive.
     *)

  resource_evaluation_id: string option;
  (** 
    The unique [ResourceEvaluationId] of Amazon Web Services resource execution for which you want to retrieve the evaluation summary.
     *)

}

type get_resource_evaluation_summary_request = {
  resource_evaluation_id: string;
  (** 
    The unique [ResourceEvaluationId] of Amazon Web Services resource execution for which you want to retrieve the evaluation summary.
     *)

}

(** 
    You have specified a resource that is either unknown or has not been discovered.
     *)
type resource_not_discovered_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type configuration_item_status = | ResourceDeletedNotRecorded
  | ResourceDeleted
  | ResourceNotRecorded
  | ResourceDiscovered
  | OK

(** 
    The relationship of the related resource to the main resource.
     *)
type relationship = {
  relationship_name: string option;
  (** 
    The type of relationship with the related resource.
     *)

  resource_name: string option;
  (** 
    The custom name of the related resource, if available.
     *)

  resource_id: string option;
  (** 
    The ID of the related resource (for example, [sg-xxxxxx]).
     *)

  resource_type: resource_type option;
  (** 
    The resource type of the related resource.
     *)

}

(** 
    A list that contains detailed configurations of a specified resource.
     *)
type configuration_item = {
  configuration_item_delivery_time: float option;
  (** 
    The time when configuration changes for the resource were delivered.
    
     This field is optional and is not guaranteed to be present in a configuration item (CI). If you are using daily recording, this field will be populated. However, if you are using continuous recording, this field will be omitted since the delivery time is instantaneous as the CI is available right away. For more information on daily recording and continuous recording, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-recording-frequency}Recording Frequency} in the {i Config Developer Guide}.
     
      *)

  recording_frequency: recording_frequency option;
  (** 
    The recording frequency that Config uses to record configuration changes for the resource.
     *)

  supplementary_configuration: (string * string) list option;
  (** 
    Configuration attributes that Config returns for certain resource types to supplement the information returned for the [configuration] parameter.
     *)

  configuration: string option;
  (** 
    The description of the resource configuration.
     *)

  relationships: relationship list option;
  (** 
    A list of related Amazon Web Services resources.
     *)

  related_events: string list option;
  (** 
    A list of CloudTrail event IDs.
    
     A populated field indicates that the current configuration was initiated by the events recorded in the CloudTrail log. For more information about CloudTrail, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html}What Is CloudTrail}.
     
      An empty field indicates that the current configuration was not initiated by any event. As of Version 1.3, the relatedEvents field is empty. You can access the {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_LookupEvents.html}LookupEvents API} in the {i CloudTrail API Reference} to retrieve the events for the resource.
       *)

  tags: (string * string) list option;
  (** 
    A mapping of key value tags associated with the resource.
     *)

  resource_creation_time: float option;
  (** 
    The time stamp when the resource was created.
     *)

  availability_zone: string option;
  (** 
    The Availability Zone associated with the resource.
     *)

  aws_region: string option;
  (** 
    The region where the resource resides.
     *)

  resource_name: string option;
  (** 
    The custom name of the resource, if available.
     *)

  resource_id: string option;
  (** 
    The ID of the resource (for example, [sg-xxxxxx]).
     *)

  resource_type: resource_type option;
  (** 
    The type of Amazon Web Services resource.
     *)

  arn: string option;
  (** 
    Amazon Resource Name (ARN) associated with the resource.
     *)

  configuration_item_md5_hash: string option;
  (** 
    Unique MD5 hash that represents the configuration item's state.
    
     You can use MD5 hash to compare the states of two or more configuration items that are associated with the same resource.
      *)

  configuration_state_id: string option;
  (** 
    An identifier that indicates the ordering of the configuration items of a resource.
     *)

  configuration_item_status: configuration_item_status option;
  (** 
    The configuration item status. Valid values include:
    
     {ul
          {- OK – The resource configuration has been updated
             
             }
           {- ResourceDiscovered – The resource was newly discovered
              
              }
           {- ResourceNotRecorded – The resource was discovered but its configuration was not recorded since the recorder doesn't record resources of this type
              
              }
           {- ResourceDeleted – The resource was deleted
              
              }
           {- ResourceDeletedNotRecorded – The resource was deleted but its configuration was not recorded since the recorder doesn't record resources of this type
              
              }
          
      }
       *)

  configuration_item_capture_time: float option;
  (** 
    The time when the recording of configuration changes was initiated for the resource.
     *)

  account_id: string option;
  (** 
    The 12-digit Amazon Web Services account ID associated with the resource.
     *)

  version: string option;
  (** 
    The version number of the resource configuration.
     *)

}

(** 
    The output for the [GetResourceConfigHistory] action.
     *)
type get_resource_config_history_response = {
  next_token: string option;
  (** 
    The string that you use in a subsequent request to get the next page of results in a paginated response.
     *)

  configuration_items: configuration_item list option;
  (** 
    A list that contains the configuration history of one or more resources.
     *)

}

type chronological_order = | Forward
  | Reverse

(** 
    The input for the [GetResourceConfigHistory] action.
     *)
type get_resource_config_history_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of configuration items returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.
     *)

  chronological_order: chronological_order option;
  (** 
    The chronological order for configuration items listed. By default, the results are listed in reverse chronological order.
     *)

  earlier_time: float option;
  (** 
    The chronologically earliest time in the time range for which the history requested. If not specified, the action returns paginated results that contain configuration items that start when the first configuration item was recorded.
     *)

  later_time: float option;
  (** 
    The chronologically latest time in the time range for which the history requested. If not specified, current time is taken.
     *)

  resource_id: string;
  (** 
    The ID of the resource (for example., [sg-xxxxxx]).
     *)

  resource_type: resource_type;
  (** 
    The resource type.
     *)

}

(** 
    The Config rule in the request is not valid. Verify that the rule is an organization Config Process Check rule, that the rule name is correct, and that valid Amazon Resouce Names (ARNs) are used before trying again.
     *)
type no_such_organization_config_rule_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type get_organization_custom_rule_policy_response = {
  policy_text: string option;
  (** 
    The policy definition containing the logic for your organization Config Custom Policy rule.
     *)

}

type get_organization_custom_rule_policy_request = {
  organization_config_rule_name: string;
  (** 
    The name of your organization Config Custom Policy rule.
     *)

}

(** 
    Config organization conformance pack that you passed in the filter does not exist.
    
     For DeleteOrganizationConformancePack, you tried to delete an organization conformance pack that does not exist.
      *)
type no_such_organization_conformance_pack_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type organization_resource_detailed_status = | UPDATE_FAILED
  | UPDATE_IN_PROGRESS
  | UPDATE_SUCCESSFUL
  | DELETE_IN_PROGRESS
  | DELETE_FAILED
  | DELETE_SUCCESSFUL
  | CREATE_FAILED
  | CREATE_IN_PROGRESS
  | CREATE_SUCCESSFUL

(** 
    Organization conformance pack creation or deletion status in each member account. This includes the name of the conformance pack, the status, error code and error message when the conformance pack creation or deletion failed.
     *)
type organization_conformance_pack_detailed_status = {
  last_update_time: float option;
  (** 
    The timestamp of the last status update.
     *)

  error_message: string option;
  (** 
    An error message indicating that conformance pack account creation or deletion has failed due to an error in the member account.
     *)

  error_code: string option;
  (** 
    An error code that is returned when conformance pack creation or deletion failed in the member account.
     *)

  status: organization_resource_detailed_status;
  (** 
    Indicates deployment status for conformance pack in a member account. When management account calls [PutOrganizationConformancePack] action for the first time, conformance pack status is created in the member account. When management account calls [PutOrganizationConformancePack] action for the second time, conformance pack status is updated in the member account. Conformance pack status is deleted when the management account deletes [OrganizationConformancePack] and disables service access for [config-multiaccountsetup.amazonaws.com].
    
     Config sets the state of the conformance pack to:
     
      {ul
           {- [CREATE_SUCCESSFUL] when conformance pack has been created in the member account.
              
              }
            {- [CREATE_IN_PROGRESS] when conformance pack is being created in the member account.
               
               }
            {- [CREATE_FAILED] when conformance pack creation has failed in the member account.
               
               }
            {- [DELETE_FAILED] when conformance pack deletion has failed in the member account.
               
               }
            {- [DELETE_IN_PROGRESS] when conformance pack is being deleted in the member account.
               
               }
            {- [DELETE_SUCCESSFUL] when conformance pack has been deleted in the member account.
               
               }
            {- [UPDATE_SUCCESSFUL] when conformance pack has been updated in the member account.
               
               }
            {- [UPDATE_IN_PROGRESS] when conformance pack is being updated in the member account.
               
               }
            {- [UPDATE_FAILED] when conformance pack deletion has failed in the member account.
               
               }
           
      }
       *)

  conformance_pack_name: string;
  (** 
    The name of conformance pack deployed in the member account.
     *)

  account_id: string;
  (** 
    The 12-digit account ID of a member account.
     *)

}

type get_organization_conformance_pack_detailed_status_response = {
  next_token: string option;
  (** 
    The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  organization_conformance_pack_detailed_statuses: organization_conformance_pack_detailed_status list option;
  (** 
    A list of [OrganizationConformancePackDetailedStatus] objects.
     *)

}

(** 
    Status filter object to filter results based on specific member account ID or status type for an organization conformance pack.
     *)
type organization_resource_detailed_status_filters = {
  status: organization_resource_detailed_status option;
  (** 
    Indicates deployment status for conformance pack in a member account. When management account calls [PutOrganizationConformancePack] action for the first time, conformance pack status is created in the member account. When management account calls [PutOrganizationConformancePack] action for the second time, conformance pack status is updated in the member account. Conformance pack status is deleted when the management account deletes [OrganizationConformancePack] and disables service access for [config-multiaccountsetup.amazonaws.com].
    
     Config sets the state of the conformance pack to:
     
      {ul
           {- [CREATE_SUCCESSFUL] when conformance pack has been created in the member account.
              
              }
            {- [CREATE_IN_PROGRESS] when conformance pack is being created in the member account.
               
               }
            {- [CREATE_FAILED] when conformance pack creation has failed in the member account.
               
               }
            {- [DELETE_FAILED] when conformance pack deletion has failed in the member account.
               
               }
            {- [DELETE_IN_PROGRESS] when conformance pack is being deleted in the member account.
               
               }
            {- [DELETE_SUCCESSFUL] when conformance pack has been deleted in the member account.
               
               }
            {- [UPDATE_SUCCESSFUL] when conformance pack has been updated in the member account.
               
               }
            {- [UPDATE_IN_PROGRESS] when conformance pack is being updated in the member account.
               
               }
            {- [UPDATE_FAILED] when conformance pack deletion has failed in the member account.
               
               }
           
      }
       *)

  account_id: string option;
  (** 
    The 12-digit account ID of the member account within an organization.
     *)

}

type get_organization_conformance_pack_detailed_status_request = {
  next_token: string option;
  (** 
    The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of [OrganizationConformancePackDetailedStatuses] returned on each page. If you do not specify a number, Config uses the default. The default is 100.
     *)

  filters: organization_resource_detailed_status_filters option;
  (** 
    An [OrganizationResourceDetailedStatusFilters] object.
     *)

  organization_conformance_pack_name: string;
  (** 
    The name of organization conformance pack for which you want status details for member accounts.
     *)

}

(** 
    Organization Config rule creation or deletion status in each member account. This includes the name of the rule, the status, error code and error message when the rule creation or deletion failed.
     *)
type member_account_status = {
  last_update_time: float option;
  (** 
    The timestamp of the last status update.
     *)

  error_message: string option;
  (** 
    An error message indicating that Config rule account creation or deletion has failed due to an error in the member account.
     *)

  error_code: string option;
  (** 
    An error code that is returned when Config rule creation or deletion failed in the member account.
     *)

  member_account_rule_status: member_account_rule_status;
  (** 
    Indicates deployment status for Config rule in the member account. When management account calls [PutOrganizationConfigRule] action for the first time, Config rule status is created in the member account. When management account calls [PutOrganizationConfigRule] action for the second time, Config rule status is updated in the member account. Config rule status is deleted when the management account deletes [OrganizationConfigRule] and disables service access for [config-multiaccountsetup.amazonaws.com].
    
     Config sets the state of the rule to:
     
      {ul
           {- [CREATE_SUCCESSFUL] when Config rule has been created in the member account.
              
              }
            {- [CREATE_IN_PROGRESS] when Config rule is being created in the member account.
               
               }
            {- [CREATE_FAILED] when Config rule creation has failed in the member account.
               
               }
            {- [DELETE_FAILED] when Config rule deletion has failed in the member account.
               
               }
            {- [DELETE_IN_PROGRESS] when Config rule is being deleted in the member account.
               
               }
            {- [DELETE_SUCCESSFUL] when Config rule has been deleted in the member account.
               
               }
            {- [UPDATE_SUCCESSFUL] when Config rule has been updated in the member account.
               
               }
            {- [UPDATE_IN_PROGRESS] when Config rule is being updated in the member account.
               
               }
            {- [UPDATE_FAILED] when Config rule deletion has failed in the member account.
               
               }
           
      }
       *)

  config_rule_name: string;
  (** 
    The name of Config rule deployed in the member account.
     *)

  account_id: string;
  (** 
    The 12-digit account ID of a member account.
     *)

}

type get_organization_config_rule_detailed_status_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  organization_config_rule_detailed_status: member_account_status list option;
  (** 
    A list of [MemberAccountStatus] objects.
     *)

}

type get_organization_config_rule_detailed_status_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of [OrganizationConfigRuleDetailedStatus] returned on each page. If you do not specify a number, Config uses the default. The default is 100.
     *)

  filters: status_detail_filters option;
  (** 
    A [StatusDetailFilters] object.
     *)

  organization_config_rule_name: string;
  (** 
    The name of your organization Config rule for which you want status details for member accounts.
     *)

}

(** 
    An object that contains the resource type and the number of resources.
     *)
type resource_count = {
  count: int option;
  (** 
    The number of resources.
     *)

  resource_type: resource_type option;
  [@ocaml.doc {| 
    The resource type (for example, ["AWS::EC2::Instance"]).
     |}]

}

type get_discovered_resource_counts_response = {
  next_token: string option;
  (** 
    The string that you use in a subsequent request to get the next page of results in a paginated response.
     *)

  resource_counts: resource_count list option;
  (** 
    The list of [ResourceCount] objects. Each object is listed in descending order by the number of resources.
     *)

  total_discovered_resources: int option;
  [@ocaml.doc {| 
    The total number of resources that Config is recording in the region for your account. If you specify resource types in the request, Config returns only the total number of resources for those resource types.
    
     {b Example}
     
      {ol
           {- Config is recording three resource types in the US East (Ohio) Region for your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets, for a total of 60 resources.
              
              }
            {- You make a call to the [GetDiscoveredResourceCounts] action and specify the resource type, ["AWS::EC2::Instances"], in the request.
               
               }
            {- Config returns 25 for [totalDiscoveredResources].
               
               }
           
      }
       |}]

}

type get_discovered_resource_counts_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of [ResourceCount] objects returned on each page. The default is 100. You cannot specify a number greater than 100. If you specify 0, Config uses the default.
     *)

  resource_types: string list option;
  [@ocaml.doc {| 
    The comma-separated list that specifies the resource types that you want Config to return (for example, ["AWS::EC2::Instance"], ["AWS::IAM::User"]).
    
     If a value for [resourceTypes] is not specified, Config returns all resource types that Config is recording in the region for your account.
     
      If the configuration recorder is turned off, Config returns an empty list of [ResourceCount] objects. If the configuration recorder is not recording a specific resource type (for example, S3 buckets), that resource type is not returned in the list of [ResourceCount] objects.
      
       |}]

}

type get_custom_rule_policy_response = {
  policy_text: string option;
  (** 
    The policy definition containing the logic for your Config Custom Policy rule.
     *)

}

type get_custom_rule_policy_request = {
  config_rule_name: string option;
  (** 
    The name of your Config Custom Policy rule.
     *)

}

(** 
    You specified one or more conformance packs that do not exist.
     *)
type no_such_conformance_pack_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type conformance_pack_compliance_type = | INSUFFICIENT_DATA
  | NON_COMPLIANT
  | COMPLIANT

(** 
    Summary includes the name and status of the conformance pack.
     *)
type conformance_pack_compliance_summary = {
  conformance_pack_compliance_status: conformance_pack_compliance_type;
  (** 
    The status of the conformance pack.
     *)

  conformance_pack_name: string;
  (** 
    The name of the conformance pack name.
     *)

}

type get_conformance_pack_compliance_summary_response = {
  next_token: string option;
  (** 
    The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  conformance_pack_compliance_summary_list: conformance_pack_compliance_summary list option;
  (** 
    A list of [ConformancePackComplianceSummary] objects.
     *)

}

type get_conformance_pack_compliance_summary_request = {
  next_token: string option;
  (** 
    The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of conformance packs returned on each page.
     *)

  conformance_pack_names: string list;
  (** 
    Names of conformance packs.
     *)

}

(** 
    Config rule that you passed in the filter does not exist.
     *)
type no_such_config_rule_in_conformance_pack_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    Identifies an Config rule that evaluated an Amazon Web Services resource, and provides the type and ID of the resource that the rule evaluated.
     *)
type evaluation_result_qualifier = {
  evaluation_mode: evaluation_mode option;
  (** 
    The mode of an evaluation. The valid values are Detective or Proactive.
     *)

  resource_id: string option;
  (** 
    The ID of the evaluated Amazon Web Services resource.
     *)

  resource_type: string option;
  (** 
    The type of Amazon Web Services resource that was evaluated.
     *)

  config_rule_name: string option;
  (** 
    The name of the Config rule that was used in the evaluation.
     *)

}

(** 
    Uniquely identifies an evaluation result.
     *)
type evaluation_result_identifier = {
  resource_evaluation_id: string option;
  (** 
    A Unique ID for an evaluation result.
     *)

  ordering_timestamp: float option;
  (** 
    The time of the event that triggered the evaluation of your Amazon Web Services resources. The time can indicate when Config delivered a configuration item change notification, or it can indicate when Config delivered the configuration snapshot, depending on which event triggered the evaluation.
     *)

  evaluation_result_qualifier: evaluation_result_qualifier option;
  (** 
    Identifies an Config rule used to evaluate an Amazon Web Services resource, and provides the type and ID of the evaluated resource.
     *)

}

(** 
    The details of a conformance pack evaluation. Provides Config rule and Amazon Web Services resource type that was evaluated, the compliance of the conformance pack, related time stamps, and supplementary information.
     *)
type conformance_pack_evaluation_result = {
  annotation: string option;
  (** 
    Supplementary information about how the evaluation determined the compliance.
     *)

  result_recorded_time: float;
  (** 
    The time when Config recorded the evaluation result.
     *)

  config_rule_invoked_time: float;
  (** 
    The time when Config rule evaluated Amazon Web Services resource.
     *)

  evaluation_result_identifier: evaluation_result_identifier;
  
  compliance_type: conformance_pack_compliance_type;
  (** 
    The compliance type. The allowed values are [COMPLIANT] and [NON_COMPLIANT]. [INSUFFICIENT_DATA] is not supported.
     *)

}

type get_conformance_pack_compliance_details_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  conformance_pack_rule_evaluation_results: conformance_pack_evaluation_result list option;
  (** 
    Returns a list of [ConformancePackEvaluationResult] objects.
     *)

  conformance_pack_name: string;
  (** 
    Name of the conformance pack.
     *)

}

(** 
    Filters a conformance pack by Config rule names, compliance types, Amazon Web Services resource types, and resource IDs.
     *)
type conformance_pack_evaluation_filters = {
  resource_ids: string list option;
  (** 
    Filters the results by resource IDs.
    
     This is valid only when you provide resource type. If there is no resource type, you will see an error.
     
      *)

  resource_type: string option;
  [@ocaml.doc {| 
    Filters the results by the resource type (for example, ["AWS::EC2::Instance"]).
     |}]

  compliance_type: conformance_pack_compliance_type option;
  (** 
    Filters the results by compliance.
    
     The allowed values are [COMPLIANT] and [NON_COMPLIANT]. [INSUFFICIENT_DATA] is not supported.
      *)

  config_rule_names: string list option;
  (** 
    Filters the results by Config rule names.
     *)

}

type get_conformance_pack_compliance_details_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of evaluation results returned on each page. If you do no specify a number, Config uses the default. The default is 100.
     *)

  filters: conformance_pack_evaluation_filters option;
  (** 
    A [ConformancePackEvaluationFilters] object.
     *)

  conformance_pack_name: string;
  (** 
    Name of the conformance pack.
     *)

}

(** 
    The number of Amazon Web Services resources or Config rules responsible for the current compliance of the item, up to a maximum number.
     *)
type compliance_contributor_count = {
  cap_exceeded: bool option;
  (** 
    Indicates whether the maximum count is reached.
     *)

  capped_count: int option;
  (** 
    The number of Amazon Web Services resources or Config rules responsible for the current compliance of the item.
     *)

}

(** 
    The number of Config rules or Amazon Web Services resources that are compliant and noncompliant.
     *)
type compliance_summary = {
  compliance_summary_timestamp: float option;
  (** 
    The time that Config created the compliance summary.
     *)

  non_compliant_resource_count: compliance_contributor_count option;
  (** 
    The number of Config rules or Amazon Web Services resources that are noncompliant, up to a maximum of 25 for rules and 100 for resources.
     *)

  compliant_resource_count: compliance_contributor_count option;
  (** 
    The number of Config rules or Amazon Web Services resources that are compliant, up to a maximum of 25 for rules and 100 for resources.
     *)

}

(** 
    The number of Amazon Web Services resources of a specific type that are compliant or noncompliant, up to a maximum of 100 for each.
     *)
type compliance_summary_by_resource_type = {
  compliance_summary: compliance_summary option;
  (** 
    The number of Amazon Web Services resources that are compliant or noncompliant, up to a maximum of 100 for each.
     *)

  resource_type: string option;
  (** 
    The type of Amazon Web Services resource.
     *)

}

(** 
    
     *)
type get_compliance_summary_by_resource_type_response = {
  compliance_summaries_by_resource_type: compliance_summary_by_resource_type list option;
  (** 
    The number of resources that are compliant and the number that are noncompliant. If one or more resource types were provided with the request, the numbers are returned for each resource type. The maximum number returned is 100.
     *)

}

(** 
    
     *)
type get_compliance_summary_by_resource_type_request = {
  resource_types: string list option;
  (** 
    Specify one or more resource types to get the number of resources that are compliant and the number that are noncompliant for each resource type.
    
     For this request, you can specify an Amazon Web Services resource type such as [AWS::EC2::Instance]. You can specify that the resource type is an Amazon Web Services account by specifying [AWS::::Account].
      *)

}

(** 
    
     *)
type get_compliance_summary_by_config_rule_response = {
  compliance_summary: compliance_summary option;
  (** 
    The number of Config rules that are compliant and the number that are noncompliant, up to a maximum of 25 for each.
     *)

}

(** 
    The details of an Config evaluation. Provides the Amazon Web Services resource that was evaluated, the compliance of the resource, related time stamps, and supplementary information.
     *)
type evaluation_result = {
  result_token: string option;
  (** 
    An encrypted token that associates an evaluation with an Config rule. The token identifies the rule, the Amazon Web Services resource being evaluated, and the event that triggered the evaluation.
     *)

  annotation: string option;
  (** 
    Supplementary information about how the evaluation determined the compliance.
     *)

  config_rule_invoked_time: float option;
  (** 
    The time when the Config rule evaluated the Amazon Web Services resource.
     *)

  result_recorded_time: float option;
  (** 
    The time when Config recorded the evaluation result.
     *)

  compliance_type: compliance_type option;
  (** 
    Indicates whether the Amazon Web Services resource complies with the Config rule that evaluated it.
    
     For the [EvaluationResult] data type, Config supports only the [COMPLIANT], [NON_COMPLIANT], and [NOT_APPLICABLE] values. Config does not support the [INSUFFICIENT_DATA] value for the [EvaluationResult] data type.
      *)

  evaluation_result_identifier: evaluation_result_identifier option;
  (** 
    Uniquely identifies the evaluation result.
     *)

}

(** 
    
     *)
type get_compliance_details_by_resource_response = {
  next_token: string option;
  (** 
    The string that you use in a subsequent request to get the next page of results in a paginated response.
     *)

  evaluation_results: evaluation_result list option;
  (** 
    Indicates whether the specified Amazon Web Services resource complies each Config rule.
     *)

}

(** 
    
     *)
type get_compliance_details_by_resource_request = {
  resource_evaluation_id: string option;
  (** 
    The unique ID of Amazon Web Services resource execution for which you want to retrieve evaluation results.
    
     You need to only provide either a [ResourceEvaluationID] or a [ResourceID ]and [ResourceType].
     
      *)

  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  compliance_types: compliance_type list option;
  (** 
    Filters the results by compliance.
    
     [INSUFFICIENT_DATA] is a valid [ComplianceType] that is returned when an Config rule cannot be evaluated. However, [INSUFFICIENT_DATA] cannot be used as a [ComplianceType] for filtering results.
      *)

  resource_id: string option;
  (** 
    The ID of the Amazon Web Services resource for which you want compliance information.
     *)

  resource_type: string option;
  (** 
    The type of the Amazon Web Services resource for which you want compliance information.
     *)

}

(** 
    
     *)
type get_compliance_details_by_config_rule_response = {
  next_token: string option;
  (** 
    The string that you use in a subsequent request to get the next page of results in a paginated response.
     *)

  evaluation_results: evaluation_result list option;
  (** 
    Indicates whether the Amazon Web Services resource complies with the specified Config rule.
     *)

}

(** 
    
     *)
type get_compliance_details_by_config_rule_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of evaluation results returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.
     *)

  compliance_types: compliance_type list option;
  (** 
    Filters the results by compliance.
    
     [INSUFFICIENT_DATA] is a valid [ComplianceType] that is returned when an Config rule cannot be evaluated. However, [INSUFFICIENT_DATA] cannot be used as a [ComplianceType] for filtering results.
      *)

  config_rule_name: string;
  (** 
    The name of the Config rule for which you want compliance information.
     *)

}

(** 
    The configuration item size is outside the allowable range.
     *)
type oversized_configuration_item_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type get_aggregate_resource_config_response = {
  configuration_item: configuration_item option;
  (** 
    Returns a [ConfigurationItem] object.
     *)

}

type get_aggregate_resource_config_request = {
  resource_identifier: aggregate_resource_identifier;
  (** 
    An object that identifies aggregate resource.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

(** 
    The count of resources that are grouped by the group name.
     *)
type grouped_resource_count = {
  resource_count: int;
  (** 
    The number of resources in the group.
     *)

  group_name: string;
  (** 
    The name of the group that can be region, account ID, or resource type. For example, region1, region2 if the region was chosen as [GroupByKey].
     *)

}

type get_aggregate_discovered_resource_counts_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  grouped_resource_counts: grouped_resource_count list option;
  (** 
    Returns a list of GroupedResourceCount objects.
     *)

  group_by_key: string option;
  (** 
    The key passed into the request object. If [GroupByKey] is not provided, the result will be empty.
     *)

  total_discovered_resources: int;
  (** 
    The total number of resources that are present in an aggregator with the filters that you provide.
     *)

}

(** 
    Filters the resource count based on account ID, region, and resource type.
     *)
type resource_count_filters = {
  region: string option;
  (** 
    The region where the account is located.
     *)

  account_id: string option;
  (** 
    The 12-digit ID of the account.
     *)

  resource_type: resource_type option;
  (** 
    The type of the Amazon Web Services resource.
     *)

}

type resource_count_group_key = | AWS_REGION
  | ACCOUNT_ID
  | RESOURCE_TYPE

type get_aggregate_discovered_resource_counts_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of [GroupedResourceCount] objects returned on each page. The default is 1000. You cannot specify a number greater than 1000. If you specify 0, Config uses the default.
     *)

  group_by_key: resource_count_group_key option;
  (** 
    The key to group the resource counts.
     *)

  filters: resource_count_filters option;
  (** 
    Filters the results based on the [ResourceCountFilters] object.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

(** 
    The number of conformance packs that are compliant and noncompliant.
     *)
type aggregate_conformance_pack_compliance_count = {
  non_compliant_conformance_pack_count: int option;
  (** 
    Number of noncompliant conformance packs.
     *)

  compliant_conformance_pack_count: int option;
  (** 
    Number of compliant conformance packs.
     *)

}

(** 
    Provides a summary of compliance based on either account ID or region.
     *)
type aggregate_conformance_pack_compliance_summary = {
  group_name: string option;
  (** 
    Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.
     *)

  compliance_summary: aggregate_conformance_pack_compliance_count option;
  (** 
    Returns an [AggregateConformancePackComplianceCount] object.
     *)

}

type get_aggregate_conformance_pack_compliance_summary_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  group_by_key: string option;
  (** 
    Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.
     *)

  aggregate_conformance_pack_compliance_summaries: aggregate_conformance_pack_compliance_summary list option;
  (** 
    Returns a list of [AggregateConformancePackComplianceSummary] object.
     *)

}

(** 
    Filters the results based on account ID and region.
     *)
type aggregate_conformance_pack_compliance_summary_filters = {
  aws_region: string option;
  (** 
    The source Amazon Web Services Region from where the data is aggregated.
     *)

  account_id: string option;
  (** 
    The 12-digit Amazon Web Services account ID of the source account.
     *)

}

type aggregate_conformance_pack_compliance_summary_group_key = | AWS_REGION
  | ACCOUNT_ID

type get_aggregate_conformance_pack_compliance_summary_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of results returned on each page. The default is maximum. If you specify 0, Config uses the default.
     *)

  group_by_key: aggregate_conformance_pack_compliance_summary_group_key option;
  (** 
    Groups the result based on Amazon Web Services account ID or Amazon Web Services Region.
     *)

  filters: aggregate_conformance_pack_compliance_summary_filters option;
  (** 
    Filters the results based on the [AggregateConformancePackComplianceSummaryFilters] object.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

(** 
    Returns the number of compliant and noncompliant rules for one or more accounts and regions in an aggregator.
     *)
type aggregate_compliance_count = {
  compliance_summary: compliance_summary option;
  (** 
    The number of compliant and noncompliant Config rules.
     *)

  group_name: string option;
  (** 
    The 12-digit account ID or region based on the GroupByKey value.
     *)

}

type get_aggregate_config_rule_compliance_summary_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  aggregate_compliance_counts: aggregate_compliance_count list option;
  (** 
    Returns a list of AggregateComplianceCounts object.
     *)

  group_by_key: string option;
  (** 
    Groups the result based on ACCOUNT_ID or AWS_REGION.
     *)

}

(** 
    Filters the results based on the account IDs and regions.
     *)
type config_rule_compliance_summary_filters = {
  aws_region: string option;
  (** 
    The source region where the data is aggregated.
     *)

  account_id: string option;
  (** 
    The 12-digit account ID of the source account.
     *)

}

type config_rule_compliance_summary_group_key = | AWS_REGION
  | ACCOUNT_ID

type get_aggregate_config_rule_compliance_summary_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of evaluation results returned on each page. The default is 1000. You cannot specify a number greater than 1000. If you specify 0, Config uses the default.
     *)

  group_by_key: config_rule_compliance_summary_group_key option;
  (** 
    Groups the result based on ACCOUNT_ID or AWS_REGION.
     *)

  filters: config_rule_compliance_summary_filters option;
  (** 
    Filters the results based on the ConfigRuleComplianceSummaryFilters object.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

(** 
    The details of an Config evaluation for an account ID and region in an aggregator. Provides the Amazon Web Services resource that was evaluated, the compliance of the resource, related time stamps, and supplementary information.
     *)
type aggregate_evaluation_result = {
  aws_region: string option;
  (** 
    The source region from where the data is aggregated.
     *)

  account_id: string option;
  (** 
    The 12-digit account ID of the source account.
     *)

  annotation: string option;
  (** 
    Supplementary information about how the agrregate evaluation determined the compliance.
     *)

  config_rule_invoked_time: float option;
  (** 
    The time when the Config rule evaluated the Amazon Web Services resource.
     *)

  result_recorded_time: float option;
  (** 
    The time when Config recorded the aggregate evaluation result.
     *)

  compliance_type: compliance_type option;
  (** 
    The resource compliance status.
    
     For the [AggregationEvaluationResult] data type, Config supports only the [COMPLIANT] and [NON_COMPLIANT]. Config does not support the [NOT_APPLICABLE] and [INSUFFICIENT_DATA] value.
      *)

  evaluation_result_identifier: evaluation_result_identifier option;
  (** 
    Uniquely identifies the evaluation result.
     *)

}

type get_aggregate_compliance_details_by_config_rule_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  aggregate_evaluation_results: aggregate_evaluation_result list option;
  (** 
    Returns an AggregateEvaluationResults object.
     *)

}

type get_aggregate_compliance_details_by_config_rule_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of evaluation results returned on each page. The default is 50. You cannot specify a number greater than 100. If you specify 0, Config uses the default.
     *)

  compliance_type: compliance_type option;
  (** 
    The resource compliance status.
    
     For the [GetAggregateComplianceDetailsByConfigRuleRequest] data type, Config supports only the [COMPLIANT] and [NON_COMPLIANT]. Config does not support the [NOT_APPLICABLE] and [INSUFFICIENT_DATA] values.
     
      *)

  aws_region: string;
  (** 
    The source region from where the data is aggregated.
     *)

  account_id: string;
  (** 
    The 12-digit account ID of the source account.
     *)

  config_rule_name: string;
  (** 
    The name of the Config rule for which you want compliance information.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

(** 
    You have specified a retention configuration that does not exist.
     *)
type no_such_retention_configuration_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type describe_retention_configurations_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  retention_configurations: retention_configuration list option;
  (** 
    Returns a retention configuration object.
     *)

}

type describe_retention_configurations_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  retention_configuration_names: string list option;
  (** 
    A list of names of retention configurations for which you want details. If you do not specify a name, Config returns details for all the retention configurations for that account.
    
     Currently, Config supports only one retention configuration per region in your account.
     
      *)

}

type remediation_execution_state = | FAILED
  | SUCCEEDED
  | IN_PROGRESS
  | QUEUED

type remediation_execution_step_state = | FAILED
  | PENDING
  | SUCCEEDED

(** 
    Name of the step from the SSM document.
     *)
type remediation_execution_step = {
  stop_time: float option;
  (** 
    The time when the step stopped.
     *)

  start_time: float option;
  (** 
    The time when the step started.
     *)

  error_message: string option;
  (** 
    An error message if the step was interrupted during execution.
     *)

  state: remediation_execution_step_state option;
  (** 
    The valid status of the step.
     *)

  name: string option;
  (** 
    The details of the step.
     *)

}

(** 
    Provides details of the current status of the invoked remediation action for that resource.
     *)
type remediation_execution_status = {
  last_updated_time: float option;
  (** 
    The time when the remediation execution was last updated.
     *)

  invocation_time: float option;
  (** 
    Start time when the remediation was executed.
     *)

  step_details: remediation_execution_step list option;
  (** 
    Details of every step.
     *)

  state: remediation_execution_state option;
  (** 
    ENUM of the values.
     *)

  resource_key: resource_key option;
  
}

type describe_remediation_execution_status_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  remediation_execution_statuses: remediation_execution_status list option;
  (** 
    Returns a list of remediation execution statuses objects.
     *)

}

type describe_remediation_execution_status_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of RemediationExecutionStatuses returned on each page. The default is maximum. If you specify 0, Config uses the default.
     *)

  resource_keys: resource_key list option;
  (** 
    A list of resource keys to be processed with the current request. Each element in the list consists of the resource type and resource ID.
     *)

  config_rule_name: string;
  (** 
    A list of Config rule names.
     *)

}

type describe_remediation_exceptions_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  remediation_exceptions: remediation_exception list option;
  (** 
    Returns a list of remediation exception objects.
     *)

}

type describe_remediation_exceptions_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of RemediationExceptionResourceKey returned on each page. The default is 25. If you specify 0, Config uses the default.
     *)

  resource_keys: remediation_exception_resource_key list option;
  (** 
    An exception list of resource exception keys to be processed with the current request. Config adds exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys.
     *)

  config_rule_name: string;
  (** 
    The name of the Config rule.
     *)

}

type describe_remediation_configurations_response = {
  remediation_configurations: remediation_configuration list option;
  (** 
    Returns a remediation configuration object.
     *)

}

type describe_remediation_configurations_request = {
  config_rule_names: string list;
  (** 
    A list of Config rule names of remediation configurations for which you want details.
     *)

}

(** 
    An object that represents the account ID and region of an aggregator account that is requesting authorization but is not yet authorized.
     *)
type pending_aggregation_request = {
  requester_aws_region: string option;
  (** 
    The region requesting to aggregate data.
     *)

  requester_account_id: string option;
  (** 
    The 12-digit account ID of the account requesting to aggregate data.
     *)

}

type describe_pending_aggregation_requests_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  pending_aggregation_requests: pending_aggregation_request list option;
  (** 
    Returns a PendingAggregationRequests object.
     *)

}

type describe_pending_aggregation_requests_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of evaluation results returned on each page. The default is maximum. If you specify 0, Config uses the default.
     *)

}

type organization_resource_status = | UPDATE_FAILED
  | UPDATE_IN_PROGRESS
  | UPDATE_SUCCESSFUL
  | DELETE_IN_PROGRESS
  | DELETE_FAILED
  | DELETE_SUCCESSFUL
  | CREATE_FAILED
  | CREATE_IN_PROGRESS
  | CREATE_SUCCESSFUL

(** 
    Returns the status for an organization conformance pack in an organization.
     *)
type organization_conformance_pack_status = {
  last_update_time: float option;
  (** 
    The timestamp of the last update.
     *)

  error_message: string option;
  (** 
    An error message indicating that organization conformance pack creation or deletion failed due to an error.
     *)

  error_code: string option;
  (** 
    An error code that is returned when organization conformance pack creation or deletion has failed in a member account.
     *)

  status: organization_resource_status;
  (** 
    Indicates deployment status of an organization conformance pack. When management account calls PutOrganizationConformancePack for the first time, conformance pack status is created in all the member accounts. When management account calls PutOrganizationConformancePack for the second time, conformance pack status is updated in all the member accounts. Additionally, conformance pack status is updated when one or more member accounts join or leave an organization. Conformance pack status is deleted when the management account deletes OrganizationConformancePack in all the member accounts and disables service access for [config-multiaccountsetup.amazonaws.com].
    
     Config sets the state of the conformance pack to:
     
      {ul
           {- [CREATE_SUCCESSFUL] when an organization conformance pack has been successfully created in all the member accounts.
              
              }
            {- [CREATE_IN_PROGRESS] when an organization conformance pack creation is in progress.
               
               }
            {- [CREATE_FAILED] when an organization conformance pack creation failed in one or more member accounts within that organization.
               
               }
            {- [DELETE_FAILED] when an organization conformance pack deletion failed in one or more member accounts within that organization.
               
               }
            {- [DELETE_IN_PROGRESS] when an organization conformance pack deletion is in progress.
               
               }
            {- [DELETE_SUCCESSFUL] when an organization conformance pack has been successfully deleted from all the member accounts.
               
               }
            {- [UPDATE_SUCCESSFUL] when an organization conformance pack has been successfully updated in all the member accounts.
               
               }
            {- [UPDATE_IN_PROGRESS] when an organization conformance pack update is in progress.
               
               }
            {- [UPDATE_FAILED] when an organization conformance pack update failed in one or more member accounts within that organization.
               
               }
           
      }
       *)

  organization_conformance_pack_name: string;
  (** 
    The name that you assign to organization conformance pack.
     *)

}

type describe_organization_conformance_pack_statuses_response = {
  next_token: string option;
  (** 
    The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  organization_conformance_pack_statuses: organization_conformance_pack_status list option;
  (** 
    A list of [OrganizationConformancePackStatus] objects.
     *)

}

type describe_organization_conformance_pack_statuses_request = {
  next_token: string option;
  (** 
    The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of OrganizationConformancePackStatuses returned on each page. If you do no specify a number, Config uses the default. The default is 100.
     *)

  organization_conformance_pack_names: string list option;
  (** 
    The names of organization conformance packs for which you want status details. If you do not specify any names, Config returns details for all your organization conformance packs.
     *)

}

(** 
    An organization conformance pack that has information about conformance packs that Config creates in member accounts.
     *)
type organization_conformance_pack = {
  last_update_time: float;
  (** 
    Last time when organization conformation pack was updated.
     *)

  excluded_accounts: string list option;
  (** 
    A comma-separated list of accounts excluded from organization conformance pack.
     *)

  conformance_pack_input_parameters: conformance_pack_input_parameter list option;
  (** 
    A list of [ConformancePackInputParameter] objects.
     *)

  delivery_s3_key_prefix: string option;
  (** 
    Any folder structure you want to add to an Amazon S3 bucket.
    
     This field is optional.
     
      *)

  delivery_s3_bucket: string option;
  (** 
    The name of the Amazon S3 bucket where Config stores conformance pack templates.
    
     This field is optional.
     
      *)

  organization_conformance_pack_arn: string;
  (** 
    Amazon Resource Name (ARN) of organization conformance pack.
     *)

  organization_conformance_pack_name: string;
  (** 
    The name you assign to an organization conformance pack.
     *)

}

type describe_organization_conformance_packs_response = {
  next_token: string option;
  (** 
    The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  organization_conformance_packs: organization_conformance_pack list option;
  (** 
    Returns a list of OrganizationConformancePacks objects.
     *)

}

type describe_organization_conformance_packs_request = {
  next_token: string option;
  (** 
    The nextToken string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of organization config packs returned on each page. If you do no specify a number, Config uses the default. The default is 100.
     *)

  organization_conformance_pack_names: string list option;
  (** 
    The name that you assign to an organization conformance pack.
     *)

}

type organization_rule_status = | UPDATE_FAILED
  | UPDATE_IN_PROGRESS
  | UPDATE_SUCCESSFUL
  | DELETE_IN_PROGRESS
  | DELETE_FAILED
  | DELETE_SUCCESSFUL
  | CREATE_FAILED
  | CREATE_IN_PROGRESS
  | CREATE_SUCCESSFUL

(** 
    Returns the status for an organization Config rule in an organization.
     *)
type organization_config_rule_status = {
  last_update_time: float option;
  (** 
    The timestamp of the last update.
     *)

  error_message: string option;
  (** 
    An error message indicating that organization Config rule creation or deletion failed due to an error.
     *)

  error_code: string option;
  (** 
    An error code that is returned when organization Config rule creation or deletion has failed.
     *)

  organization_rule_status: organization_rule_status;
  (** 
    Indicates deployment status of an organization Config rule. When management account calls PutOrganizationConfigRule action for the first time, Config rule status is created in all the member accounts. When management account calls PutOrganizationConfigRule action for the second time, Config rule status is updated in all the member accounts. Additionally, Config rule status is updated when one or more member accounts join or leave an organization. Config rule status is deleted when the management account deletes OrganizationConfigRule in all the member accounts and disables service access for [config-multiaccountsetup.amazonaws.com].
    
     Config sets the state of the rule to:
     
      {ul
           {- [CREATE_SUCCESSFUL] when an organization Config rule has been successfully created in all the member accounts.
              
              }
            {- [CREATE_IN_PROGRESS] when an organization Config rule creation is in progress.
               
               }
            {- [CREATE_FAILED] when an organization Config rule creation failed in one or more member accounts within that organization.
               
               }
            {- [DELETE_FAILED] when an organization Config rule deletion failed in one or more member accounts within that organization.
               
               }
            {- [DELETE_IN_PROGRESS] when an organization Config rule deletion is in progress.
               
               }
            {- [DELETE_SUCCESSFUL] when an organization Config rule has been successfully deleted from all the member accounts.
               
               }
            {- [UPDATE_SUCCESSFUL] when an organization Config rule has been successfully updated in all the member accounts.
               
               }
            {- [UPDATE_IN_PROGRESS] when an organization Config rule update is in progress.
               
               }
            {- [UPDATE_FAILED] when an organization Config rule update failed in one or more member accounts within that organization.
               
               }
           
      }
       *)

  organization_config_rule_name: string;
  (** 
    The name that you assign to organization Config rule.
     *)

}

type describe_organization_config_rule_statuses_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  organization_config_rule_statuses: organization_config_rule_status list option;
  (** 
    A list of [OrganizationConfigRuleStatus] objects.
     *)

}

type describe_organization_config_rule_statuses_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of [OrganizationConfigRuleStatuses] returned on each page. If you do no specify a number, Config uses the default. The default is 100.
     *)

  organization_config_rule_names: string list option;
  (** 
    The names of organization Config rules for which you want status details. If you do not specify any names, Config returns details for all your organization Config rules.
     *)

}

(** 
    metadata for your organization Config Custom Policy rule including the runtime system in use, which accounts have debug logging enabled, and other custom rule metadata such as resource type, resource ID of Amazon Web Services resource, and organization trigger types that trigger Config to evaluate Amazon Web Services resources against a rule.
     *)
type organization_custom_policy_rule_metadata_no_policy = {
  debug_log_delivery_accounts: string list option;
  (** 
    A list of accounts that you can enable debug logging for your organization Config Custom Policy rule. List is null when debug logging is enabled for all accounts.
     *)

  policy_runtime: string option;
  (** 
    The runtime system for your organization Config Custom Policy rules. Guard is a policy-as-code language that allows you to write policies that are enforced by Config Custom Policy rules. For more information about Guard, see the {{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}.
     *)

  tag_value_scope: string option;
  (** 
    The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key).
     *)

  tag_key_scope: string option;
  (** 
    One part of a key-value pair that make up a tag. A key is a general label that acts like a category for more specific tag values.
     *)

  resource_id_scope: string option;
  (** 
    The ID of the Amazon Web Services resource that was evaluated.
     *)

  resource_types_scope: string list option;
  (** 
    The type of the Amazon Web Services resource that was evaluated.
     *)

  maximum_execution_frequency: maximum_execution_frequency option;
  (** 
    The maximum frequency with which Config runs evaluations for a rule. Your Config Custom Policy rule is triggered when Config delivers the configuration snapshot. For more information, see [ConfigSnapshotDeliveryProperties].
     *)

  input_parameters: string option;
  (** 
    A string, in JSON format, that is passed to your organization Config Custom Policy rule.
     *)

  organization_config_rule_trigger_types: organization_config_rule_trigger_type_no_s_n list option;
  (** 
    The type of notification that triggers Config to run an evaluation for a rule. For Config Custom Policy rules, Config supports change triggered notification types:
    
     {ul
          {- [ConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers a configuration item as a result of a resource change.
             
             }
           {- [OversizedConfigurationItemChangeNotification] - Triggers an evaluation when Config delivers an oversized configuration item. Config may generate this notification type when a resource changes and the notification exceeds the maximum size allowed by Amazon SNS.
              
              }
          
      }
       *)

  description: string option;
  (** 
    The description that you provide for your organization Config Custom Policy rule.
     *)

}

(** 
    An organization Config rule that has information about Config rules that Config creates in member accounts.
     *)
type organization_config_rule = {
  organization_custom_policy_rule_metadata: organization_custom_policy_rule_metadata_no_policy option;
  (** 
    An object that specifies metadata for your organization's Config Custom Policy rule. The metadata includes the runtime system in use, which accounts have debug logging enabled, and other custom rule metadata, such as resource type, resource ID of Amazon Web Services resource, and organization trigger types that initiate Config to evaluate Amazon Web Services resources against a rule.
     *)

  last_update_time: float option;
  (** 
    The timestamp of the last update.
     *)

  excluded_accounts: string list option;
  (** 
    A comma-separated list of accounts excluded from organization Config rule.
     *)

  organization_custom_rule_metadata: organization_custom_rule_metadata option;
  (** 
    An [OrganizationCustomRuleMetadata] object.
     *)

  organization_managed_rule_metadata: organization_managed_rule_metadata option;
  (** 
    An [OrganizationManagedRuleMetadata] object.
     *)

  organization_config_rule_arn: string;
  (** 
    Amazon Resource Name (ARN) of organization Config rule.
     *)

  organization_config_rule_name: string;
  (** 
    The name that you assign to organization Config rule.
     *)

}

type describe_organization_config_rules_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  organization_config_rules: organization_config_rule list option;
  (** 
    Returns a list of [OrganizationConfigRule] objects.
     *)

}

type describe_organization_config_rules_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of organization Config rules returned on each page. If you do no specify a number, Config uses the default. The default is 100.
     *)

  organization_config_rule_names: string list option;
  (** 
    The names of organization Config rules for which you want details. If you do not specify any names, Config returns details for all your organization Config rules.
     *)

}

(** 
    You have specified a delivery channel that does not exist.
     *)
type no_such_delivery_channel_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type delivery_status = | Not_Applicable
  | Failure
  | Success

(** 
    Provides status of the delivery of the snapshot or the configuration history to the specified Amazon S3 bucket. Also provides the status of notifications about the Amazon S3 delivery to the specified Amazon SNS topic.
     *)
type config_export_delivery_info = {
  next_delivery_time: float option;
  (** 
    The time that the next delivery occurs.
     *)

  last_successful_time: float option;
  (** 
    The time of the last successful delivery.
     *)

  last_attempt_time: float option;
  (** 
    The time of the last attempted delivery.
     *)

  last_error_message: string option;
  (** 
    The error message from the last attempted delivery.
     *)

  last_error_code: string option;
  (** 
    The error code from the last attempted delivery.
     *)

  last_status: delivery_status option;
  (** 
    Status of the last attempted delivery.
     *)

}

(** 
    A list that contains the status of the delivery of the configuration stream notification to the Amazon SNS topic.
     *)
type config_stream_delivery_info = {
  last_status_change_time: float option;
  (** 
    The time from the last status change.
     *)

  last_error_message: string option;
  (** 
    The error message from the last attempted delivery.
     *)

  last_error_code: string option;
  (** 
    The error code from the last attempted delivery.
     *)

  last_status: delivery_status option;
  (** 
    Status of the last attempted delivery.
    
     {b Note} Providing an SNS topic on a {{:https://docs.aws.amazon.com/config/latest/APIReference/API_DeliveryChannel.html}DeliveryChannel} for Config is optional. If the SNS delivery is turned off, the last status will be {b Not_Applicable}.
      *)

}

(** 
    The status of a specified delivery channel.
    
     Valid values: [Success] | [Failure]
      *)
type delivery_channel_status = {
  config_stream_delivery_info: config_stream_delivery_info option;
  (** 
    A list containing the status of the delivery of the configuration stream notification to the specified Amazon SNS topic.
     *)

  config_history_delivery_info: config_export_delivery_info option;
  (** 
    A list that contains the status of the delivery of the configuration history to the specified Amazon S3 bucket.
     *)

  config_snapshot_delivery_info: config_export_delivery_info option;
  (** 
    A list containing the status of the delivery of the snapshot to the specified Amazon S3 bucket.
     *)

  name: string option;
  (** 
    The name of the delivery channel.
     *)

}

(** 
    The output for the [DescribeDeliveryChannelStatus] action.
     *)
type describe_delivery_channel_status_response = {
  delivery_channels_status: delivery_channel_status list option;
  (** 
    A list that contains the status of a specified delivery channel.
     *)

}

(** 
    The input for the [DeliveryChannelStatus] action.
     *)
type describe_delivery_channel_status_request = {
  delivery_channel_names: string list option;
  (** 
    A list of delivery channel names.
     *)

}

(** 
    The output for the [DescribeDeliveryChannels] action.
     *)
type describe_delivery_channels_response = {
  delivery_channels: delivery_channel list option;
  (** 
    A list that contains the descriptions of the specified delivery channel.
     *)

}

(** 
    The input for the [DescribeDeliveryChannels] action.
     *)
type describe_delivery_channels_request = {
  delivery_channel_names: string list option;
  (** 
    A list of delivery channel names.
     *)

}

type conformance_pack_state = | DELETE_FAILED
  | DELETE_IN_PROGRESS
  | CREATE_FAILED
  | CREATE_COMPLETE
  | CREATE_IN_PROGRESS

(** 
    Status details of a conformance pack.
     *)
type conformance_pack_status_detail = {
  last_update_completed_time: float option;
  (** 
    Last time when conformation pack creation and update was successful.
     *)

  last_update_requested_time: float;
  (** 
    Last time when conformation pack creation and update was requested.
     *)

  conformance_pack_status_reason: string option;
  (** 
    The reason of conformance pack creation failure.
     *)

  stack_arn: string;
  (** 
    Amazon Resource Name (ARN) of CloudFormation stack.
     *)

  conformance_pack_state: conformance_pack_state;
  (** 
    Indicates deployment status of conformance pack.
    
     Config sets the state of the conformance pack to:
     
      {ul
           {- CREATE_IN_PROGRESS when a conformance pack creation is in progress for an account.
              
              }
            {- CREATE_COMPLETE when a conformance pack has been successfully created in your account.
               
               }
            {- CREATE_FAILED when a conformance pack creation failed in your account.
               
               }
            {- DELETE_IN_PROGRESS when a conformance pack deletion is in progress.
               
               }
            {- DELETE_FAILED when a conformance pack deletion failed in your account.
               
               }
           
      }
       *)

  conformance_pack_arn: string;
  (** 
    Amazon Resource Name (ARN) of comformance pack.
     *)

  conformance_pack_id: string;
  (** 
    ID of the conformance pack.
     *)

  conformance_pack_name: string;
  (** 
    Name of the conformance pack.
     *)

}

type describe_conformance_pack_status_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  conformance_pack_status_details: conformance_pack_status_detail list option;
  (** 
    A list of [ConformancePackStatusDetail] objects.
     *)

}

type describe_conformance_pack_status_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of conformance packs status returned on each page.
     *)

  conformance_pack_names: string list option;
  (** 
    Comma-separated list of conformance pack names.
     *)

}

(** 
    Returns details of a conformance pack. A conformance pack is a collection of Config rules and remediation actions that can be easily deployed in an account and a region.
     *)
type conformance_pack_detail = {
  template_ssm_document_details: template_ssm_document_details option;
  (** 
    An object that contains the name or Amazon Resource Name (ARN) of the Amazon Web Services Systems Manager document (SSM document) and the version of the SSM document that is used to create a conformance pack.
     *)

  created_by: string option;
  (** 
    The Amazon Web Services service that created the conformance pack.
     *)

  last_update_requested_time: float option;
  (** 
    The last time a conformation pack update was requested.
     *)

  conformance_pack_input_parameters: conformance_pack_input_parameter list option;
  (** 
    A list of [ConformancePackInputParameter] objects.
     *)

  delivery_s3_key_prefix: string option;
  (** 
    The prefix for the Amazon S3 bucket.
    
     This field is optional.
     
      *)

  delivery_s3_bucket: string option;
  (** 
    The name of the Amazon S3 bucket where Config stores conformance pack templates.
    
     This field is optional.
     
      *)

  conformance_pack_id: string;
  (** 
    ID of the conformance pack.
     *)

  conformance_pack_arn: string;
  (** 
    Amazon Resource Name (ARN) of the conformance pack.
     *)

  conformance_pack_name: string;
  (** 
    Name of the conformance pack.
     *)

}

type describe_conformance_packs_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  conformance_pack_details: conformance_pack_detail list option;
  (** 
    Returns a list of [ConformancePackDetail] objects.
     *)

}

type describe_conformance_packs_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of conformance packs returned on each page.
     *)

  conformance_pack_names: string list option;
  (** 
    Comma-separated list of conformance pack names for which you want details. If you do not specify any names, Config returns details for all your conformance packs.
     *)

}

(** 
    Compliance information of one or more Config rules within a conformance pack. You can filter using Config rule names and compliance types.
     *)
type conformance_pack_rule_compliance = {
  controls: string list option;
  (** 
    Controls for the conformance pack. A control is a process to prevent or detect problems while meeting objectives. A control can align with a specific compliance regime or map to internal controls defined by an organization.
     *)

  compliance_type: conformance_pack_compliance_type option;
  (** 
    Compliance of the Config rule.
     *)

  config_rule_name: string option;
  (** 
    Name of the Config rule.
     *)

}

type describe_conformance_pack_compliance_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  conformance_pack_rule_compliance_list: conformance_pack_rule_compliance list;
  (** 
    Returns a list of [ConformancePackRuleCompliance] objects.
     *)

  conformance_pack_name: string;
  (** 
    Name of the conformance pack.
     *)

}

(** 
    Filters the conformance pack by compliance types and Config rule names.
     *)
type conformance_pack_compliance_filters = {
  compliance_type: conformance_pack_compliance_type option;
  (** 
    Filters the results by compliance.
    
     The allowed values are [COMPLIANT] and [NON_COMPLIANT]. [INSUFFICIENT_DATA] is not supported.
      *)

  config_rule_names: string list option;
  (** 
    Filters the results by Config rule names.
     *)

}

type describe_conformance_pack_compliance_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned in a previous request that you use to request the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of Config rules within a conformance pack are returned on each page.
     *)

  filters: conformance_pack_compliance_filters option;
  (** 
    A [ConformancePackComplianceFilters] object.
     *)

  conformance_pack_name: string;
  (** 
    Name of the conformance pack.
     *)

}

type recorder_status = | Failure
  | Success
  | Pending

(** 
    The current status of the configuration recorder.
    
     For a detailed status of recording events over time, add your Config events to CloudWatch metrics and use CloudWatch metrics.
     
      *)
type configuration_recorder_status = {
  last_status_change_time: float option;
  (** 
    The time of the latest change in status of an recording event processed by the recorder.
     *)

  last_error_message: string option;
  (** 
    The latest error message from when the recorder last failed.
     *)

  last_error_code: string option;
  (** 
    The latest error code from when the recorder last failed.
     *)

  last_status: recorder_status option;
  (** 
    The status of the latest recording event processed by the recorder.
     *)

  recording: bool option;
  (** 
    Specifies whether or not the recorder is currently recording.
     *)

  last_stop_time: float option;
  (** 
    The time the recorder was last stopped.
     *)

  last_start_time: float option;
  (** 
    The time the recorder was last started.
     *)

  name: string option;
  (** 
    The name of the configuration recorder.
     *)

}

(** 
    The output for the [DescribeConfigurationRecorderStatus] action, in JSON format.
     *)
type describe_configuration_recorder_status_response = {
  configuration_recorders_status: configuration_recorder_status list option;
  (** 
    A list that contains status of the specified recorders.
     *)

}

(** 
    The input for the [DescribeConfigurationRecorderStatus] action.
     *)
type describe_configuration_recorder_status_request = {
  configuration_recorder_names: string list option;
  (** 
    The name(s) of the configuration recorder. If the name is not specified, the action returns the current status of all the configuration recorders associated with the account.
     *)

}

(** 
    The output for the [DescribeConfigurationRecorders] action.
     *)
type describe_configuration_recorders_response = {
  configuration_recorders: configuration_recorder list option;
  (** 
    A list that contains the descriptions of the specified configuration recorders.
     *)

}

(** 
    The input for the [DescribeConfigurationRecorders] action.
     *)
type describe_configuration_recorders_request = {
  configuration_recorder_names: string list option;
  (** 
    A list of configuration recorder names.
     *)

}

type aggregated_source_type = | ORGANIZATION
  | ACCOUNT

type aggregated_source_status_type = | OUTDATED
  | SUCCEEDED
  | FAILED

(** 
    The current sync status between the source and the aggregator account.
     *)
type aggregated_source_status = {
  last_error_message: string option;
  (** 
    The message indicating that the source account aggregation failed due to an error.
     *)

  last_error_code: string option;
  (** 
    The error code that Config returned when the source account aggregation last failed.
     *)

  last_update_time: float option;
  (** 
    The time of the last update.
     *)

  last_update_status: aggregated_source_status_type option;
  (** 
    Filters the last updated status type.
    
     {ul
          {- Valid value FAILED indicates errors while moving data.
             
             }
           {- Valid value SUCCEEDED indicates the data was successfully moved.
              
              }
           {- Valid value OUTDATED indicates the data is not the most recent.
              
              }
          
      }
       *)

  aws_region: string option;
  (** 
    The region authorized to collect aggregated data.
     *)

  source_type: aggregated_source_type option;
  (** 
    The source account or an organization.
     *)

  source_id: string option;
  (** 
    The source account ID or an organization.
     *)

}

type describe_configuration_aggregator_sources_status_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  aggregated_source_status_list: aggregated_source_status list option;
  (** 
    Returns an AggregatedSourceStatus object.
     *)

}

type describe_configuration_aggregator_sources_status_request = {
  limit: int option;
  (** 
    The maximum number of AggregatorSourceStatus returned on each page. The default is maximum. If you specify 0, Config uses the default.
     *)

  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  update_status: aggregated_source_status_type list option;
  (** 
    Filters the status type.
    
     {ul
          {- Valid value FAILED indicates errors while moving data.
             
             }
           {- Valid value SUCCEEDED indicates the data was successfully moved.
              
              }
           {- Valid value OUTDATED indicates the data is not the most recent.
              
              }
          
      }
       *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

type describe_configuration_aggregators_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  configuration_aggregators: configuration_aggregator list option;
  (** 
    Returns a ConfigurationAggregators object.
     *)

}

type describe_configuration_aggregators_request = {
  limit: int option;
  (** 
    The maximum number of configuration aggregators returned on each page. The default is maximum. If you specify 0, Config uses the default.
     *)

  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  configuration_aggregator_names: string list option;
  (** 
    The name of the configuration aggregators.
     *)

}

(** 
    
     *)
type describe_config_rules_response = {
  next_token: string option;
  (** 
    The string that you use in a subsequent request to get the next page of results in a paginated response.
     *)

  config_rules: config_rule list option;
  (** 
    The details about your Config rules.
     *)

}

(** 
    Returns a filtered list of Detective or Proactive Config rules. By default, if the filter is not defined, this API returns an unfiltered list. For more information on Detective or Proactive Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config-rules.html}{b Evaluation Mode}} in the {i Config Developer Guide}.
     *)
type describe_config_rules_filters = {
  evaluation_mode: evaluation_mode option;
  (** 
    The mode of an evaluation. The valid values are Detective or Proactive.
     *)

}

(** 
    
     *)
type describe_config_rules_request = {
  filters: describe_config_rules_filters option;
  (** 
    Returns a list of Detective or Proactive Config rules. By default, this API returns an unfiltered list. For more information on Detective or Proactive Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config-rules.html}{b Evaluation Mode}} in the {i Config Developer Guide}.
     *)

  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  config_rule_names: string list option;
  (** 
    The names of the Config rules for which you want details. If you do not specify any names, Config returns details for all your rules.
     *)

}

(** 
    Status information for your Config Managed rules and Config Custom Policy rules. The status includes information such as the last time the rule ran, the last time it failed, and the related error for the last failure.
    
     This action does not return status information about Config Custom Lambda rules.
      *)
type config_rule_evaluation_status = {
  last_debug_log_delivery_time: float option;
  (** 
    The time Config last attempted to deliver a debug log for your Config Custom Policy rules.
     *)

  last_debug_log_delivery_status_reason: string option;
  (** 
    The reason Config was not able to deliver a debug log. This is for the last failed attempt to retrieve a debug log for your Config Custom Policy rules.
     *)

  last_debug_log_delivery_status: string option;
  (** 
    The status of the last attempted delivery of a debug log for your Config Custom Policy rules. Either [Successful] or [Failed].
     *)

  first_evaluation_started: bool option;
  (** 
    Indicates whether Config has evaluated your resources against the rule at least once.
    
     {ul
          {- [true] - Config has evaluated your Amazon Web Services resources against the rule at least once.
             
             }
           {- [false] - Config has not finished evaluating your Amazon Web Services resources against the rule at least once.
              
              }
          
      }
       *)

  last_error_message: string option;
  (** 
    The error message that Config returned when the rule last failed.
     *)

  last_error_code: string option;
  (** 
    The error code that Config returned when the rule last failed.
     *)

  last_deactivated_time: float option;
  (** 
    The time that you last turned off the Config rule.
     *)

  first_activated_time: float option;
  (** 
    The time that you first activated the Config rule.
     *)

  last_failed_evaluation_time: float option;
  (** 
    The time that Config last failed to evaluate your Amazon Web Services resources against the rule.
     *)

  last_successful_evaluation_time: float option;
  (** 
    The time that Config last successfully evaluated your Amazon Web Services resources against the rule.
     *)

  last_failed_invocation_time: float option;
  (** 
    The time that Config last failed to invoke the Config rule to evaluate your Amazon Web Services resources.
     *)

  last_successful_invocation_time: float option;
  (** 
    The time that Config last successfully invoked the Config rule to evaluate your Amazon Web Services resources.
     *)

  config_rule_id: string option;
  (** 
    The ID of the Config rule.
     *)

  config_rule_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the Config rule.
     *)

  config_rule_name: string option;
  (** 
    The name of the Config rule.
     *)

}

(** 
    
     *)
type describe_config_rule_evaluation_status_response = {
  next_token: string option;
  (** 
    The string that you use in a subsequent request to get the next page of results in a paginated response.
     *)

  config_rules_evaluation_status: config_rule_evaluation_status list option;
  (** 
    Status information about your Config managed rules.
     *)

}

(** 
    
     *)
type describe_config_rule_evaluation_status_request = {
  limit: int option;
  (** 
    The number of rule evaluation results that you want returned.
    
     This parameter is required if the rule limit for your account is more than the default of 1000 rules.
     
      For information about requesting a rule limit increase, see {{:http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_config}Config Limits} in the {i Amazon Web Services General Reference Guide}.
       *)

  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  config_rule_names: string list option;
  (** 
    The name of the Config managed rules for which you want status information. If you do not specify any names, Config returns status information for all Config managed rules that you use.
     *)

}

(** 
    Indicates whether an Amazon Web Services resource or Config rule is compliant and provides the number of contributors that affect the compliance.
     *)
type compliance = {
  compliance_contributor_count: compliance_contributor_count option;
  (** 
    The number of Amazon Web Services resources or Config rules that cause a result of [NON_COMPLIANT], up to a maximum number.
     *)

  compliance_type: compliance_type option;
  (** 
    Indicates whether an Amazon Web Services resource or Config rule is compliant.
    
     A resource is compliant if it complies with all of the Config rules that evaluate it. A resource is noncompliant if it does not comply with one or more of these rules.
     
      A rule is compliant if all of the resources that the rule evaluates comply with it. A rule is noncompliant if any of these resources do not comply.
      
       Config returns the [INSUFFICIENT_DATA] value when no evaluation results are available for the Amazon Web Services resource or Config rule.
       
        For the [Compliance] data type, Config supports only [COMPLIANT], [NON_COMPLIANT], and [INSUFFICIENT_DATA] values. Config does not support the [NOT_APPLICABLE] value for the [Compliance] data type.
         *)

}

(** 
    Indicates whether an Amazon Web Services resource that is evaluated according to one or more Config rules is compliant. A resource is compliant if it complies with all of the rules that evaluate it. A resource is noncompliant if it does not comply with one or more of these rules.
     *)
type compliance_by_resource = {
  compliance: compliance option;
  (** 
    Indicates whether the Amazon Web Services resource complies with all of the Config rules that evaluated it.
     *)

  resource_id: string option;
  (** 
    The ID of the Amazon Web Services resource that was evaluated.
     *)

  resource_type: string option;
  (** 
    The type of the Amazon Web Services resource that was evaluated.
     *)

}

(** 
    
     *)
type describe_compliance_by_resource_response = {
  next_token: string option;
  (** 
    The string that you use in a subsequent request to get the next page of results in a paginated response.
     *)

  compliance_by_resources: compliance_by_resource list option;
  (** 
    Indicates whether the specified Amazon Web Services resource complies with all of the Config rules that evaluate it.
     *)

}

(** 
    
     *)
type describe_compliance_by_resource_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of evaluation results returned on each page. The default is 10. You cannot specify a number greater than 100. If you specify 0, Config uses the default.
     *)

  compliance_types: compliance_type list option;
  (** 
    Filters the results by compliance.
     *)

  resource_id: string option;
  (** 
    The ID of the Amazon Web Services resource for which you want compliance information. You can specify only one resource ID. If you specify a resource ID, you must also specify a type for [ResourceType].
     *)

  resource_type: string option;
  (** 
    The types of Amazon Web Services resources for which you want compliance information (for example, [AWS::EC2::Instance]). For this action, you can specify that the resource type is an Amazon Web Services account by specifying [AWS::::Account].
     *)

}

(** 
    Indicates whether an Config rule is compliant. A rule is compliant if all of the resources that the rule evaluated comply with it. A rule is noncompliant if any of these resources do not comply.
     *)
type compliance_by_config_rule = {
  compliance: compliance option;
  (** 
    Indicates whether the Config rule is compliant.
     *)

  config_rule_name: string option;
  (** 
    The name of the Config rule.
     *)

}

(** 
    
     *)
type describe_compliance_by_config_rule_response = {
  next_token: string option;
  (** 
    The string that you use in a subsequent request to get the next page of results in a paginated response.
     *)

  compliance_by_config_rules: compliance_by_config_rule list option;
  (** 
    Indicates whether each of the specified Config rules is compliant.
     *)

}

(** 
    
     *)
type describe_compliance_by_config_rule_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  compliance_types: compliance_type list option;
  (** 
    Filters the results by compliance.
     *)

  config_rule_names: string list option;
  (** 
    Specify one or more Config rule names to filter the results by rule.
     *)

}

type describe_aggregation_authorizations_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  aggregation_authorizations: aggregation_authorization list option;
  (** 
    Returns a list of authorizations granted to various aggregator accounts and regions.
     *)

}

type describe_aggregation_authorizations_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of AggregationAuthorizations returned on each page. The default is maximum. If you specify 0, Config uses the default.
     *)

}

(** 
    Provides the number of compliant and noncompliant rules within a conformance pack. Also provides the compliance status of the conformance pack and the total rule count which includes compliant rules, noncompliant rules, and rules that cannot be evaluated due to insufficient data.
    
     A conformance pack is compliant if all of the rules in a conformance packs are compliant. It is noncompliant if any of the rules are not compliant. The compliance status of a conformance pack is INSUFFICIENT_DATA only if all rules within a conformance pack cannot be evaluated due to insufficient data. If some of the rules in a conformance pack are compliant but the compliance status of other rules in that same conformance pack is INSUFFICIENT_DATA, the conformance pack shows compliant.
      *)
type aggregate_conformance_pack_compliance = {
  total_rule_count: int option;
  (** 
    Total number of compliant rules, noncompliant rules, and the rules that do not have any applicable resources to evaluate upon resulting in insufficient data.
     *)

  non_compliant_rule_count: int option;
  (** 
    The number of noncompliant Config Rules.
     *)

  compliant_rule_count: int option;
  (** 
    The number of compliant Config Rules.
     *)

  compliance_type: conformance_pack_compliance_type option;
  (** 
    The compliance status of the conformance pack.
     *)

}

(** 
    Provides aggregate compliance of the conformance pack. Indicates whether a conformance pack is compliant based on the name of the conformance pack, account ID, and region.
    
     A conformance pack is compliant if all of the rules in a conformance packs are compliant. It is noncompliant if any of the rules are not compliant. The compliance status of a conformance pack is INSUFFICIENT_DATA only if all rules within a conformance pack cannot be evaluated due to insufficient data. If some of the rules in a conformance pack are compliant but the compliance status of other rules in that same conformance pack is INSUFFICIENT_DATA, the conformance pack shows compliant.
      *)
type aggregate_compliance_by_conformance_pack = {
  aws_region: string option;
  (** 
    The source Amazon Web Services Region from where the data is aggregated.
     *)

  account_id: string option;
  (** 
    The 12-digit Amazon Web Services account ID of the source account.
     *)

  compliance: aggregate_conformance_pack_compliance option;
  (** 
    The compliance status of the conformance pack.
     *)

  conformance_pack_name: string option;
  (** 
    The name of the conformance pack.
     *)

}

type describe_aggregate_compliance_by_conformance_packs_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  aggregate_compliance_by_conformance_packs: aggregate_compliance_by_conformance_pack list option;
  (** 
    Returns the [AggregateComplianceByConformancePack] object.
     *)

}

(** 
    Filters the conformance packs based on an account ID, region, compliance type, and the name of the conformance pack.
     *)
type aggregate_conformance_pack_compliance_filters = {
  aws_region: string option;
  (** 
    The source Amazon Web Services Region from where the data is aggregated.
     *)

  account_id: string option;
  (** 
    The 12-digit Amazon Web Services account ID of the source account.
     *)

  compliance_type: conformance_pack_compliance_type option;
  (** 
    The compliance status of the conformance pack.
     *)

  conformance_pack_name: string option;
  (** 
    The name of the conformance pack.
     *)

}

type describe_aggregate_compliance_by_conformance_packs_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of conformance packs compliance details returned on each page. The default is maximum. If you specify 0, Config uses the default.
     *)

  filters: aggregate_conformance_pack_compliance_filters option;
  (** 
    Filters the result by [AggregateConformancePackComplianceFilters] object.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

(** 
    Indicates whether an Config rule is compliant based on account ID, region, compliance, and rule name.
    
     A rule is compliant if all of the resources that the rule evaluated comply with it. It is noncompliant if any of these resources do not comply.
      *)
type aggregate_compliance_by_config_rule = {
  aws_region: string option;
  (** 
    The source region from where the data is aggregated.
     *)

  account_id: string option;
  (** 
    The 12-digit account ID of the source account.
     *)

  compliance: compliance option;
  (** 
    Indicates whether an Amazon Web Services resource or Config rule is compliant and provides the number of contributors that affect the compliance.
     *)

  config_rule_name: string option;
  (** 
    The name of the Config rule.
     *)

}

type describe_aggregate_compliance_by_config_rules_response = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  aggregate_compliance_by_config_rules: aggregate_compliance_by_config_rule list option;
  (** 
    Returns a list of AggregateComplianceByConfigRule object.
     *)

}

(** 
    Filters the compliance results based on account ID, region, compliance type, and rule name.
     *)
type config_rule_compliance_filters = {
  aws_region: string option;
  (** 
    The source region where the data is aggregated.
     *)

  account_id: string option;
  (** 
    The 12-digit account ID of the source account.
     *)

  compliance_type: compliance_type option;
  (** 
    The rule compliance status.
    
     For the [ConfigRuleComplianceFilters] data type, Config supports only [COMPLIANT] and [NON_COMPLIANT]. Config does not support the [NOT_APPLICABLE] and the [INSUFFICIENT_DATA] values.
      *)

  config_rule_name: string option;
  (** 
    The name of the Config rule.
     *)

}

type describe_aggregate_compliance_by_config_rules_request = {
  next_token: string option;
  (** 
    The [nextToken] string returned on a previous page that you use to get the next page of results in a paginated response.
     *)

  limit: int option;
  (** 
    The maximum number of evaluation results returned on each page. The default is maximum. If you specify 0, Config uses the default.
     *)

  filters: config_rule_compliance_filters option;
  (** 
    Filters the results by ConfigRuleComplianceFilters object.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

(** 
    The output for the [DeliverConfigSnapshot] action, in JSON format.
     *)
type deliver_config_snapshot_response = {
  config_snapshot_id: string option;
  (** 
    The ID of the snapshot that is being created.
     *)

}

(** 
    The input for the [DeliverConfigSnapshot] action.
     *)
type deliver_config_snapshot_request = {
  delivery_channel_name: string;
  (** 
    The name of the delivery channel through which the snapshot is delivered.
     *)

}

type delete_stored_query_response = unit

type delete_stored_query_request = {
  query_name: string;
  (** 
    The name of the query that you want to delete.
     *)

}

type delete_retention_configuration_request = {
  retention_configuration_name: string;
  (** 
    The name of the retention configuration to delete.
     *)

}

type delete_resource_config_request = {
  resource_id: string;
  (** 
    Unique identifier of the resource.
     *)

  resource_type: string;
  (** 
    The type of the resource.
     *)

}

(** 
    You tried to delete a remediation exception that does not exist.
     *)
type no_such_remediation_exception_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    List of each of the failed delete remediation exceptions with specific reasons.
     *)
type failed_delete_remediation_exceptions_batch = {
  failed_items: remediation_exception_resource_key list option;
  (** 
    Returns remediation exception resource key object of the failed items.
     *)

  failure_message: string option;
  (** 
    Returns a failure message for delete remediation exception. For example, Config creates an exception due to an internal error.
     *)

}

type delete_remediation_exceptions_response = {
  failed_batches: failed_delete_remediation_exceptions_batch list option;
  (** 
    Returns a list of failed delete remediation exceptions batch objects. Each object in the batch consists of a list of failed items and failure messages.
     *)

}

type delete_remediation_exceptions_request = {
  resource_keys: remediation_exception_resource_key list;
  (** 
    An exception list of resource exception keys to be processed with the current request. Config adds exception for each resource key. For example, Config adds 3 exceptions for 3 resource keys.
     *)

  config_rule_name: string;
  (** 
    The name of the Config rule for which you want to delete remediation exception configuration.
     *)

}

(** 
    Remediation action is in progress. You can either cancel execution in Amazon Web Services Systems Manager or wait and try again later.
     *)
type remediation_in_progress_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

type delete_remediation_configuration_response = unit

type delete_remediation_configuration_request = {
  resource_type: string option;
  (** 
    The type of a resource.
     *)

  config_rule_name: string;
  (** 
    The name of the Config rule for which you want to delete remediation configuration.
     *)

}

type delete_pending_aggregation_request_request = {
  requester_aws_region: string;
  (** 
    The region requesting to aggregate data.
     *)

  requester_account_id: string;
  (** 
    The 12-digit account ID of the account requesting to aggregate data.
     *)

}

type delete_organization_conformance_pack_request = {
  organization_conformance_pack_name: string;
  (** 
    The name of organization conformance pack that you want to delete.
     *)

}

type delete_organization_config_rule_request = {
  organization_config_rule_name: string;
  (** 
    The name of organization Config rule that you want to delete.
     *)

}

(** 
    The output when you delete the evaluation results for the specified Config rule.
     *)
type delete_evaluation_results_response = unit

(** 
    
     *)
type delete_evaluation_results_request = {
  config_rule_name: string;
  (** 
    The name of the Config rule for which you want to delete the evaluation results.
     *)

}

(** 
    You cannot delete the delivery channel you specified because the configuration recorder is running.
     *)
type last_delivery_channel_delete_failed_exception = {
  message: string option;
  (** 
    Error executing the command
     *)

}

(** 
    The input for the [DeleteDeliveryChannel] action. The action accepts the following data, in JSON format.
     *)
type delete_delivery_channel_request = {
  delivery_channel_name: string;
  (** 
    The name of the delivery channel to delete.
     *)

}

type delete_conformance_pack_request = {
  conformance_pack_name: string;
  (** 
    Name of the conformance pack you want to delete.
     *)

}

(** 
    The request object for the [DeleteConfigurationRecorder] action.
     *)
type delete_configuration_recorder_request = {
  configuration_recorder_name: string;
  (** 
    The name of the configuration recorder to be deleted. You can retrieve the name of your configuration recorder by using the [DescribeConfigurationRecorders] action.
     *)

}

type delete_configuration_aggregator_request = {
  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

(** 
    
     *)
type delete_config_rule_request = {
  config_rule_name: string;
  (** 
    The name of the Config rule that you want to delete.
     *)

}

type delete_aggregation_authorization_request = {
  authorized_aws_region: string;
  (** 
    The region authorized to collect aggregated data.
     *)

  authorized_account_id: string;
  (** 
    The 12-digit account ID of the account authorized to aggregate data.
     *)

}

(** 
    The detailed configurations of a specified resource.
     *)
type base_configuration_item = {
  configuration_item_delivery_time: float option;
  (** 
    The time when configuration changes for the resource were delivered.
    
     This field is optional and is not guaranteed to be present in a configuration item (CI). If you are using daily recording, this field will be populated. However, if you are using continuous recording, this field will be omitted since the delivery time is instantaneous as the CI is available right away. For more information on daily recording and continuous recording, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html#select-resources-recording-frequency}Recording Frequency} in the {i Config Developer Guide}.
     
      *)

  recording_frequency: recording_frequency option;
  (** 
    The recording frequency that Config uses to record configuration changes for the resource.
     *)

  supplementary_configuration: (string * string) list option;
  (** 
    Configuration attributes that Config returns for certain resource types to supplement the information returned for the configuration parameter.
     *)

  configuration: string option;
  (** 
    The description of the resource configuration.
     *)

  resource_creation_time: float option;
  (** 
    The time stamp when the resource was created.
     *)

  availability_zone: string option;
  (** 
    The Availability Zone associated with the resource.
     *)

  aws_region: string option;
  (** 
    The region where the resource resides.
     *)

  resource_name: string option;
  (** 
    The custom name of the resource, if available.
     *)

  resource_id: string option;
  (** 
    The ID of the resource (for example., sg-xxxxxx).
     *)

  resource_type: resource_type option;
  (** 
    The type of Amazon Web Services resource.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the resource.
     *)

  configuration_state_id: string option;
  (** 
    An identifier that indicates the ordering of the configuration items of a resource.
     *)

  configuration_item_status: configuration_item_status option;
  (** 
    The configuration item status. Valid values include:
    
     {ul
          {- OK – The resource configuration has been updated.
             
             }
           {- ResourceDiscovered – The resource was newly discovered.
              
              }
           {- ResourceNotRecorded – The resource was discovered, but its configuration was not recorded since the recorder doesn't record resources of this type.
              
              }
           {- ResourceDeleted – The resource was deleted
              
              }
           {- ResourceDeletedNotRecorded – The resource was deleted, but its configuration was not recorded since the recorder doesn't record resources of this type.
              
              }
          
      }
       *)

  configuration_item_capture_time: float option;
  (** 
    The time when the recording of configuration changes was initiated for the resource.
     *)

  account_id: string option;
  (** 
    The 12-digit Amazon Web Services account ID associated with the resource.
     *)

  version: string option;
  (** 
    The version number of the resource configuration.
     *)

}

type batch_get_resource_config_response = {
  unprocessed_resource_keys: resource_key list option;
  (** 
    A list of resource keys that were not processed with the current response. The unprocessesResourceKeys value is in the same form as ResourceKeys, so the value can be directly provided to a subsequent BatchGetResourceConfig operation. If there are no unprocessed resource keys, the response contains an empty unprocessedResourceKeys list.
     *)

  base_configuration_items: base_configuration_item list option;
  (** 
    A list that contains the current configuration of one or more resources.
     *)

}

type batch_get_resource_config_request = {
  resource_keys: resource_key list;
  (** 
    A list of resource keys to be processed with the current request. Each element in the list consists of the resource type and resource ID.
     *)

}

type batch_get_aggregate_resource_config_response = {
  unprocessed_resource_identifiers: aggregate_resource_identifier list option;
  (** 
    A list of resource identifiers that were not processed with current scope. The list is empty if all the resources are processed.
     *)

  base_configuration_items: base_configuration_item list option;
  (** 
    A list that contains the current configuration of one or more resources.
     *)

}

type batch_get_aggregate_resource_config_request = {
  resource_identifiers: aggregate_resource_identifier list;
  (** 
    A list of aggregate ResourceIdentifiers objects.
     *)

  configuration_aggregator_name: string;
  (** 
    The name of the configuration aggregator.
     *)

}

(** 
    Config Config provides a way to keep track of the configurations of all the Amazon Web Services resources associated with your Amazon Web Services account. You can use Config to get the current and historical configurations of each Amazon Web Services resource and also to get information about the relationship between the resources. An Amazon Web Services resource can be an Amazon Compute Cloud (Amazon EC2) instance, an Elastic Block Store (EBS) volume, an elastic network Interface (ENI), or a security group. For a complete list of resources currently supported by Config, see {{:https://docs.aws.amazon.com/config/latest/developerguide/resource-config-reference.html#supported-resources}Supported Amazon Web Services resources}.
           
            You can access and manage Config through the Amazon Web Services Management Console, the Amazon Web Services Command Line Interface (Amazon Web Services CLI), the Config API, or the Amazon Web Services SDKs for Config. This reference guide contains documentation for the Config API and the Amazon Web Services CLI commands that you can use to manage Config. The Config API uses the Signature Version 4 protocol for signing requests. For more information about how to sign a request with this protocol, see {{:https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html}Signature Version 4 Signing Process}. For detailed information about Config features and their associated actions or commands, as well as how to work with Amazon Web Services Management Console, see {{:https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html}What Is Config} in the {i Config Developer Guide}.
             *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_untag_resource_request :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_aggregate_resource_identifier :
  ?resource_name:string ->
  resource_type:resource_type ->
  resource_id:string ->
  source_region:string ->
  source_account_id:string ->
  unit
-> aggregate_resource_identifier
(** Create a {!type-aggregate_resource_identifier} type *)

val make_time_window : ?end_time:float -> ?start_time:float -> unit
-> time_window
(** Create a {!type-time_window} type *)

val make_template_ssm_document_details :
  ?document_version:string -> document_name:string -> unit
-> template_ssm_document_details
(** Create a {!type-template_ssm_document_details} type *)

val make_tag : ?value:string -> ?key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_request : tags:tag list -> resource_arn:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_stored_query_metadata :
  ?description:string ->
  query_name:string ->
  query_arn:string ->
  query_id:string ->
  unit
-> stored_query_metadata
(** Create a {!type-stored_query_metadata} type *)

val make_stored_query :
  ?expression:string ->
  ?description:string ->
  ?query_arn:string ->
  ?query_id:string ->
  query_name:string ->
  unit
-> stored_query
(** Create a {!type-stored_query} type *)

val make_stop_configuration_recorder_request :
  configuration_recorder_name:string -> unit
-> stop_configuration_recorder_request
(** Create a {!type-stop_configuration_recorder_request} type *)

val make_status_detail_filters :
  ?member_account_rule_status:member_account_rule_status ->
  ?account_id:string ->
  unit
-> status_detail_filters
(** Create a {!type-status_detail_filters} type *)

val make_static_value : values:string list -> unit
-> static_value
(** Create a {!type-static_value} type *)

val make_start_resource_evaluation_response :
  ?resource_evaluation_id:string -> unit
-> start_resource_evaluation_response
(** Create a {!type-start_resource_evaluation_response} type *)

val make_resource_details :
  ?resource_configuration_schema_type:resource_configuration_schema_type ->
  resource_configuration:string ->
  resource_type:string ->
  resource_id:string ->
  unit
-> resource_details
(** Create a {!type-resource_details} type *)

val make_evaluation_context : ?evaluation_context_identifier:string -> unit
-> evaluation_context
(** Create a {!type-evaluation_context} type *)

val make_start_resource_evaluation_request :
  ?client_token:string ->
  ?evaluation_timeout:int ->
  ?evaluation_context:evaluation_context ->
  evaluation_mode:evaluation_mode ->
  resource_details:resource_details ->
  unit
-> start_resource_evaluation_request
(** Create a {!type-start_resource_evaluation_request} type *)

val make_resource_key :
  resource_id:string -> resource_type:resource_type -> unit
-> resource_key
(** Create a {!type-resource_key} type *)

val make_start_remediation_execution_response :
  ?failed_items:resource_key list -> ?failure_message:string -> unit
-> start_remediation_execution_response
(** Create a {!type-start_remediation_execution_response} type *)

val make_start_remediation_execution_request :
  resource_keys:resource_key list -> config_rule_name:string -> unit
-> start_remediation_execution_request
(** Create a {!type-start_remediation_execution_request} type *)

val make_start_configuration_recorder_request :
  configuration_recorder_name:string -> unit
-> start_configuration_recorder_request
(** Create a {!type-start_configuration_recorder_request} type *)

val make_start_config_rules_evaluation_response : unit
-> start_config_rules_evaluation_response
(** Create a {!type-start_config_rules_evaluation_response} type *)

val make_start_config_rules_evaluation_request :
  ?config_rule_names:string list -> unit
-> start_config_rules_evaluation_request
(** Create a {!type-start_config_rules_evaluation_request} type *)

val make_field_info : ?name:string -> unit
-> field_info
(** Create a {!type-field_info} type *)

val make_query_info : ?select_fields:field_info list -> unit
-> query_info
(** Create a {!type-query_info} type *)

val make_select_resource_config_response :
  ?next_token:string ->
  ?query_info:query_info ->
  ?results:string list ->
  unit
-> select_resource_config_response
(** Create a {!type-select_resource_config_response} type *)

val make_select_resource_config_request :
  ?next_token:string -> ?limit:int -> expression:string -> unit
-> select_resource_config_request
(** Create a {!type-select_resource_config_request} type *)

val make_select_aggregate_resource_config_response :
  ?next_token:string ->
  ?query_info:query_info ->
  ?results:string list ->
  unit
-> select_aggregate_resource_config_response
(** Create a {!type-select_aggregate_resource_config_response} type *)

val make_select_aggregate_resource_config_request :
  ?next_token:string ->
  ?max_results:int ->
  ?limit:int ->
  configuration_aggregator_name:string ->
  expression:string ->
  unit
-> select_aggregate_resource_config_request
(** Create a {!type-select_aggregate_resource_config_request} type *)

val make_put_stored_query_response : ?query_arn:string -> unit
-> put_stored_query_response
(** Create a {!type-put_stored_query_response} type *)

val make_put_stored_query_request :
  ?tags:tag list -> stored_query:stored_query -> unit
-> put_stored_query_request
(** Create a {!type-put_stored_query_request} type *)

val make_retention_configuration :
  retention_period_in_days:int -> name:string -> unit
-> retention_configuration
(** Create a {!type-retention_configuration} type *)

val make_put_retention_configuration_response :
  ?retention_configuration:retention_configuration -> unit
-> put_retention_configuration_response
(** Create a {!type-put_retention_configuration_response} type *)

val make_put_retention_configuration_request :
  retention_period_in_days:int -> unit
-> put_retention_configuration_request
(** Create a {!type-put_retention_configuration_request} type *)

val make_put_resource_config_request :
  ?tags:(string * string) list ->
  ?resource_name:string ->
  configuration:string ->
  resource_id:string ->
  schema_version_id:string ->
  resource_type:string ->
  unit
-> put_resource_config_request
(** Create a {!type-put_resource_config_request} type *)

val make_remediation_exception :
  ?expiration_time:float ->
  ?message:string ->
  resource_id:string ->
  resource_type:string ->
  config_rule_name:string ->
  unit
-> remediation_exception
(** Create a {!type-remediation_exception} type *)

val make_failed_remediation_exception_batch :
  ?failed_items:remediation_exception list -> ?failure_message:string -> unit
-> failed_remediation_exception_batch
(** Create a {!type-failed_remediation_exception_batch} type *)

val make_put_remediation_exceptions_response :
  ?failed_batches:failed_remediation_exception_batch list -> unit
-> put_remediation_exceptions_response
(** Create a {!type-put_remediation_exceptions_response} type *)

val make_remediation_exception_resource_key :
  ?resource_id:string -> ?resource_type:string -> unit
-> remediation_exception_resource_key
(** Create a {!type-remediation_exception_resource_key} type *)

val make_put_remediation_exceptions_request :
  ?expiration_time:float ->
  ?message:string ->
  resource_keys:remediation_exception_resource_key list ->
  config_rule_name:string ->
  unit
-> put_remediation_exceptions_request
(** Create a {!type-put_remediation_exceptions_request} type *)

val make_resource_value : value:resource_value_type -> unit
-> resource_value
(** Create a {!type-resource_value} type *)

val make_remediation_parameter_value :
  ?static_value:static_value -> ?resource_value:resource_value -> unit
-> remediation_parameter_value
(** Create a {!type-remediation_parameter_value} type *)

val make_ssm_controls :
  ?error_percentage:int -> ?concurrent_execution_rate_percentage:int -> unit
-> ssm_controls
(** Create a {!type-ssm_controls} type *)

val make_execution_controls : ?ssm_controls:ssm_controls -> unit
-> execution_controls
(** Create a {!type-execution_controls} type *)

val make_remediation_configuration :
  ?created_by_service:string ->
  ?arn:string ->
  ?retry_attempt_seconds:int ->
  ?maximum_automatic_attempts:int ->
  ?execution_controls:execution_controls ->
  ?automatic:bool ->
  ?resource_type:string ->
  ?parameters:(string * remediation_parameter_value) list ->
  ?target_version:string ->
  target_id:string ->
  target_type:remediation_target_type ->
  config_rule_name:string ->
  unit
-> remediation_configuration
(** Create a {!type-remediation_configuration} type *)

val make_failed_remediation_batch :
  ?failed_items:remediation_configuration list ->
  ?failure_message:string ->
  unit
-> failed_remediation_batch
(** Create a {!type-failed_remediation_batch} type *)

val make_put_remediation_configurations_response :
  ?failed_batches:failed_remediation_batch list -> unit
-> put_remediation_configurations_response
(** Create a {!type-put_remediation_configurations_response} type *)

val make_put_remediation_configurations_request :
  remediation_configurations:remediation_configuration list -> unit
-> put_remediation_configurations_request
(** Create a {!type-put_remediation_configurations_request} type *)

val make_put_organization_conformance_pack_response :
  ?organization_conformance_pack_arn:string -> unit
-> put_organization_conformance_pack_response
(** Create a {!type-put_organization_conformance_pack_response} type *)

val make_conformance_pack_input_parameter :
  parameter_value:string -> parameter_name:string -> unit
-> conformance_pack_input_parameter
(** Create a {!type-conformance_pack_input_parameter} type *)

val make_put_organization_conformance_pack_request :
  ?excluded_accounts:string list ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameter list ->
  ?delivery_s3_key_prefix:string ->
  ?delivery_s3_bucket:string ->
  ?template_body:string ->
  ?template_s3_uri:string ->
  organization_conformance_pack_name:string ->
  unit
-> put_organization_conformance_pack_request
(** Create a {!type-put_organization_conformance_pack_request} type *)

val make_put_organization_config_rule_response :
  ?organization_config_rule_arn:string -> unit
-> put_organization_config_rule_response
(** Create a {!type-put_organization_config_rule_response} type *)

val make_organization_managed_rule_metadata :
  ?tag_value_scope:string ->
  ?tag_key_scope:string ->
  ?resource_id_scope:string ->
  ?resource_types_scope:string list ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?input_parameters:string ->
  ?description:string ->
  rule_identifier:string ->
  unit
-> organization_managed_rule_metadata
(** Create a {!type-organization_managed_rule_metadata} type *)

val make_organization_custom_rule_metadata :
  ?tag_value_scope:string ->
  ?tag_key_scope:string ->
  ?resource_id_scope:string ->
  ?resource_types_scope:string list ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?input_parameters:string ->
  ?description:string ->
  organization_config_rule_trigger_types:organization_config_rule_trigger_type list ->
  lambda_function_arn:string ->
  unit
-> organization_custom_rule_metadata
(** Create a {!type-organization_custom_rule_metadata} type *)

val make_organization_custom_policy_rule_metadata :
  ?debug_log_delivery_accounts:string list ->
  ?tag_value_scope:string ->
  ?tag_key_scope:string ->
  ?resource_id_scope:string ->
  ?resource_types_scope:string list ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?input_parameters:string ->
  ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_n list ->
  ?description:string ->
  policy_text:string ->
  policy_runtime:string ->
  unit
-> organization_custom_policy_rule_metadata
(** Create a {!type-organization_custom_policy_rule_metadata} type *)

val make_put_organization_config_rule_request :
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata ->
  ?excluded_accounts:string list ->
  ?organization_custom_rule_metadata:organization_custom_rule_metadata ->
  ?organization_managed_rule_metadata:organization_managed_rule_metadata ->
  organization_config_rule_name:string ->
  unit
-> put_organization_config_rule_request
(** Create a {!type-put_organization_config_rule_request} type *)

val make_put_external_evaluation_response : unit
-> put_external_evaluation_response
(** Create a {!type-put_external_evaluation_response} type *)

val make_external_evaluation :
  ?annotation:string ->
  ordering_timestamp:float ->
  compliance_type:compliance_type ->
  compliance_resource_id:string ->
  compliance_resource_type:string ->
  unit
-> external_evaluation
(** Create a {!type-external_evaluation} type *)

val make_put_external_evaluation_request :
  external_evaluation:external_evaluation -> config_rule_name:string -> unit
-> put_external_evaluation_request
(** Create a {!type-put_external_evaluation_request} type *)

val make_evaluation :
  ?annotation:string ->
  ordering_timestamp:float ->
  compliance_type:compliance_type ->
  compliance_resource_id:string ->
  compliance_resource_type:string ->
  unit
-> evaluation
(** Create a {!type-evaluation} type *)

val make_put_evaluations_response :
  ?failed_evaluations:evaluation list -> unit
-> put_evaluations_response
(** Create a {!type-put_evaluations_response} type *)

val make_put_evaluations_request :
  ?test_mode:bool ->
  ?evaluations:evaluation list ->
  result_token:string ->
  unit
-> put_evaluations_request
(** Create a {!type-put_evaluations_request} type *)

val make_config_snapshot_delivery_properties :
  ?delivery_frequency:maximum_execution_frequency -> unit
-> config_snapshot_delivery_properties
(** Create a {!type-config_snapshot_delivery_properties} type *)

val make_delivery_channel :
  ?config_snapshot_delivery_properties:config_snapshot_delivery_properties ->
  ?sns_topic_ar_n:string ->
  ?s3_kms_key_arn:string ->
  ?s3_key_prefix:string ->
  ?s3_bucket_name:string ->
  ?name:string ->
  unit
-> delivery_channel
(** Create a {!type-delivery_channel} type *)

val make_put_delivery_channel_request :
  delivery_channel:delivery_channel -> unit
-> put_delivery_channel_request
(** Create a {!type-put_delivery_channel_request} type *)

val make_put_conformance_pack_response : ?conformance_pack_arn:string -> unit
-> put_conformance_pack_response
(** Create a {!type-put_conformance_pack_response} type *)

val make_put_conformance_pack_request :
  ?template_ssm_document_details:template_ssm_document_details ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameter list ->
  ?delivery_s3_key_prefix:string ->
  ?delivery_s3_bucket:string ->
  ?template_body:string ->
  ?template_s3_uri:string ->
  conformance_pack_name:string ->
  unit
-> put_conformance_pack_request
(** Create a {!type-put_conformance_pack_request} type *)

val make_exclusion_by_resource_types :
  ?resource_types:resource_type list -> unit
-> exclusion_by_resource_types
(** Create a {!type-exclusion_by_resource_types} type *)

val make_recording_strategy : ?use_only:recording_strategy_type -> unit
-> recording_strategy
(** Create a {!type-recording_strategy} type *)

val make_recording_group :
  ?recording_strategy:recording_strategy ->
  ?exclusion_by_resource_types:exclusion_by_resource_types ->
  ?resource_types:resource_type list ->
  ?include_global_resource_types:bool ->
  ?all_supported:bool ->
  unit
-> recording_group
(** Create a {!type-recording_group} type *)

val make_recording_mode_override :
  ?description:string ->
  recording_frequency:recording_frequency ->
  resource_types:resource_type list ->
  unit
-> recording_mode_override
(** Create a {!type-recording_mode_override} type *)

val make_recording_mode :
  ?recording_mode_overrides:recording_mode_override list ->
  recording_frequency:recording_frequency ->
  unit
-> recording_mode
(** Create a {!type-recording_mode} type *)

val make_configuration_recorder :
  ?recording_mode:recording_mode ->
  ?recording_group:recording_group ->
  ?role_ar_n:string ->
  ?name:string ->
  unit
-> configuration_recorder
(** Create a {!type-configuration_recorder} type *)

val make_put_configuration_recorder_request :
  configuration_recorder:configuration_recorder -> unit
-> put_configuration_recorder_request
(** Create a {!type-put_configuration_recorder_request} type *)

val make_account_aggregation_source :
  ?aws_regions:string list ->
  ?all_aws_regions:bool ->
  account_ids:string list ->
  unit
-> account_aggregation_source
(** Create a {!type-account_aggregation_source} type *)

val make_organization_aggregation_source :
  ?all_aws_regions:bool ->
  ?aws_regions:string list ->
  role_arn:string ->
  unit
-> organization_aggregation_source
(** Create a {!type-organization_aggregation_source} type *)

val make_configuration_aggregator :
  ?created_by:string ->
  ?last_updated_time:float ->
  ?creation_time:float ->
  ?organization_aggregation_source:organization_aggregation_source ->
  ?account_aggregation_sources:account_aggregation_source list ->
  ?configuration_aggregator_arn:string ->
  ?configuration_aggregator_name:string ->
  unit
-> configuration_aggregator
(** Create a {!type-configuration_aggregator} type *)

val make_put_configuration_aggregator_response :
  ?configuration_aggregator:configuration_aggregator -> unit
-> put_configuration_aggregator_response
(** Create a {!type-put_configuration_aggregator_response} type *)

val make_put_configuration_aggregator_request :
  ?tags:tag list ->
  ?organization_aggregation_source:organization_aggregation_source ->
  ?account_aggregation_sources:account_aggregation_source list ->
  configuration_aggregator_name:string ->
  unit
-> put_configuration_aggregator_request
(** Create a {!type-put_configuration_aggregator_request} type *)

val make_scope :
  ?compliance_resource_id:string ->
  ?tag_value:string ->
  ?tag_key:string ->
  ?compliance_resource_types:string list ->
  unit -> scope
(** Create a {!type-scope} type *)

val make_source_detail :
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?message_type:message_type ->
  ?event_source:event_source ->
  unit
-> source_detail
(** Create a {!type-source_detail} type *)

val make_custom_policy_details :
  ?enable_debug_log_delivery:bool ->
  policy_text:string ->
  policy_runtime:string ->
  unit
-> custom_policy_details
(** Create a {!type-custom_policy_details} type *)

val make_source :
  ?custom_policy_details:custom_policy_details ->
  ?source_details:source_detail list ->
  ?source_identifier:string ->
  owner:owner ->
  unit
-> source
(** Create a {!type-source} type *)

val make_evaluation_mode_configuration : ?mode:evaluation_mode -> unit
-> evaluation_mode_configuration
(** Create a {!type-evaluation_mode_configuration} type *)

val make_config_rule :
  ?evaluation_modes:evaluation_mode_configuration list ->
  ?created_by:string ->
  ?config_rule_state:config_rule_state ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?input_parameters:string ->
  ?scope:scope ->
  ?description:string ->
  ?config_rule_id:string ->
  ?config_rule_arn:string ->
  ?config_rule_name:string ->
  source:source ->
  unit
-> config_rule
(** Create a {!type-config_rule} type *)

val make_put_config_rule_request :
  ?tags:tag list -> config_rule:config_rule -> unit
-> put_config_rule_request
(** Create a {!type-put_config_rule_request} type *)

val make_aggregation_authorization :
  ?creation_time:float ->
  ?authorized_aws_region:string ->
  ?authorized_account_id:string ->
  ?aggregation_authorization_arn:string ->
  unit
-> aggregation_authorization
(** Create a {!type-aggregation_authorization} type *)

val make_put_aggregation_authorization_response :
  ?aggregation_authorization:aggregation_authorization -> unit
-> put_aggregation_authorization_response
(** Create a {!type-put_aggregation_authorization_response} type *)

val make_put_aggregation_authorization_request :
  ?tags:tag list ->
  authorized_aws_region:string ->
  authorized_account_id:string ->
  unit
-> put_aggregation_authorization_request
(** Create a {!type-put_aggregation_authorization_request} type *)

val make_list_tags_for_resource_response :
  ?next_token:string -> ?tags:tag list -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request :
  ?next_token:string -> ?limit:int -> resource_arn:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_list_stored_queries_response :
  ?next_token:string ->
  ?stored_query_metadata:stored_query_metadata list ->
  unit
-> list_stored_queries_response
(** Create a {!type-list_stored_queries_response} type *)

val make_list_stored_queries_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_stored_queries_request
(** Create a {!type-list_stored_queries_request} type *)

val make_resource_evaluation :
  ?evaluation_start_timestamp:float ->
  ?evaluation_mode:evaluation_mode ->
  ?resource_evaluation_id:string ->
  unit
-> resource_evaluation
(** Create a {!type-resource_evaluation} type *)

val make_list_resource_evaluations_response :
  ?next_token:string ->
  ?resource_evaluations:resource_evaluation list ->
  unit
-> list_resource_evaluations_response
(** Create a {!type-list_resource_evaluations_response} type *)

val make_resource_evaluation_filters :
  ?evaluation_context_identifier:string ->
  ?time_window:time_window ->
  ?evaluation_mode:evaluation_mode ->
  unit
-> resource_evaluation_filters
(** Create a {!type-resource_evaluation_filters} type *)

val make_list_resource_evaluations_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:resource_evaluation_filters ->
  unit
-> list_resource_evaluations_request
(** Create a {!type-list_resource_evaluations_request} type *)

val make_resource_identifier :
  ?resource_deletion_time:float ->
  ?resource_name:string ->
  ?resource_id:string ->
  ?resource_type:resource_type ->
  unit
-> resource_identifier
(** Create a {!type-resource_identifier} type *)

val make_list_discovered_resources_response :
  ?next_token:string ->
  ?resource_identifiers:resource_identifier list ->
  unit
-> list_discovered_resources_response
(** Create a {!type-list_discovered_resources_response} type *)

val make_list_discovered_resources_request :
  ?next_token:string ->
  ?include_deleted_resources:bool ->
  ?limit:int ->
  ?resource_name:string ->
  ?resource_ids:string list ->
  resource_type:resource_type ->
  unit
-> list_discovered_resources_request
(** Create a {!type-list_discovered_resources_request} type *)

val make_conformance_pack_compliance_score :
  ?last_updated_time:float ->
  ?conformance_pack_name:string ->
  ?score:string ->
  unit
-> conformance_pack_compliance_score
(** Create a {!type-conformance_pack_compliance_score} type *)

val make_list_conformance_pack_compliance_scores_response :
  ?next_token:string ->
  conformance_pack_compliance_scores:conformance_pack_compliance_score list ->
  unit
-> list_conformance_pack_compliance_scores_response
(** Create a {!type-list_conformance_pack_compliance_scores_response} type *)

val make_conformance_pack_compliance_scores_filters :
  conformance_pack_names:string list -> unit
-> conformance_pack_compliance_scores_filters
(** Create a {!type-conformance_pack_compliance_scores_filters} type *)

val make_list_conformance_pack_compliance_scores_request :
  ?next_token:string ->
  ?limit:int ->
  ?sort_by:sort_by ->
  ?sort_order:sort_order ->
  ?filters:conformance_pack_compliance_scores_filters ->
  unit
-> list_conformance_pack_compliance_scores_request
(** Create a {!type-list_conformance_pack_compliance_scores_request} type *)

val make_list_aggregate_discovered_resources_response :
  ?next_token:string ->
  ?resource_identifiers:aggregate_resource_identifier list ->
  unit
-> list_aggregate_discovered_resources_response
(** Create a {!type-list_aggregate_discovered_resources_response} type *)

val make_resource_filters :
  ?region:string ->
  ?resource_name:string ->
  ?resource_id:string ->
  ?account_id:string ->
  unit
-> resource_filters
(** Create a {!type-resource_filters} type *)

val make_list_aggregate_discovered_resources_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:resource_filters ->
  resource_type:resource_type ->
  configuration_aggregator_name:string ->
  unit
-> list_aggregate_discovered_resources_request
(** Create a {!type-list_aggregate_discovered_resources_request} type *)

val make_get_stored_query_response : ?stored_query:stored_query -> unit
-> get_stored_query_response
(** Create a {!type-get_stored_query_response} type *)

val make_get_stored_query_request : query_name:string -> unit
-> get_stored_query_request
(** Create a {!type-get_stored_query_request} type *)

val make_evaluation_status :
  ?failure_reason:string -> status:resource_evaluation_status -> unit
-> evaluation_status
(** Create a {!type-evaluation_status} type *)

val make_get_resource_evaluation_summary_response :
  ?resource_details:resource_details ->
  ?evaluation_context:evaluation_context ->
  ?compliance:compliance_type ->
  ?evaluation_start_timestamp:float ->
  ?evaluation_status:evaluation_status ->
  ?evaluation_mode:evaluation_mode ->
  ?resource_evaluation_id:string ->
  unit
-> get_resource_evaluation_summary_response
(** Create a {!type-get_resource_evaluation_summary_response} type *)

val make_get_resource_evaluation_summary_request :
  resource_evaluation_id:string -> unit
-> get_resource_evaluation_summary_request
(** Create a {!type-get_resource_evaluation_summary_request} type *)

val make_relationship :
  ?relationship_name:string ->
  ?resource_name:string ->
  ?resource_id:string ->
  ?resource_type:resource_type ->
  unit
-> relationship
(** Create a {!type-relationship} type *)

val make_configuration_item :
  ?configuration_item_delivery_time:float ->
  ?recording_frequency:recording_frequency ->
  ?supplementary_configuration:(string * string) list ->
  ?configuration:string ->
  ?relationships:relationship list ->
  ?related_events:string list ->
  ?tags:(string * string) list ->
  ?resource_creation_time:float ->
  ?availability_zone:string ->
  ?aws_region:string ->
  ?resource_name:string ->
  ?resource_id:string ->
  ?resource_type:resource_type ->
  ?arn:string ->
  ?configuration_item_md5_hash:string ->
  ?configuration_state_id:string ->
  ?configuration_item_status:configuration_item_status ->
  ?configuration_item_capture_time:float ->
  ?account_id:string ->
  ?version:string ->
  unit
-> configuration_item
(** Create a {!type-configuration_item} type *)

val make_get_resource_config_history_response :
  ?next_token:string -> ?configuration_items:configuration_item list -> unit
-> get_resource_config_history_response
(** Create a {!type-get_resource_config_history_response} type *)

val make_get_resource_config_history_request :
  ?next_token:string ->
  ?limit:int ->
  ?chronological_order:chronological_order ->
  ?earlier_time:float ->
  ?later_time:float ->
  resource_id:string ->
  resource_type:resource_type ->
  unit
-> get_resource_config_history_request
(** Create a {!type-get_resource_config_history_request} type *)

val make_get_organization_custom_rule_policy_response :
  ?policy_text:string -> unit
-> get_organization_custom_rule_policy_response
(** Create a {!type-get_organization_custom_rule_policy_response} type *)

val make_get_organization_custom_rule_policy_request :
  organization_config_rule_name:string -> unit
-> get_organization_custom_rule_policy_request
(** Create a {!type-get_organization_custom_rule_policy_request} type *)

val make_organization_conformance_pack_detailed_status :
  ?last_update_time:float ->
  ?error_message:string ->
  ?error_code:string ->
  status:organization_resource_detailed_status ->
  conformance_pack_name:string ->
  account_id:string ->
  unit
-> organization_conformance_pack_detailed_status
(** Create a {!type-organization_conformance_pack_detailed_status} type *)

val make_get_organization_conformance_pack_detailed_status_response :
  ?next_token:string ->
  ?organization_conformance_pack_detailed_statuses:organization_conformance_pack_detailed_status list ->
  unit
-> get_organization_conformance_pack_detailed_status_response
(** Create a {!type-get_organization_conformance_pack_detailed_status_response} type *)

val make_organization_resource_detailed_status_filters :
  ?status:organization_resource_detailed_status -> ?account_id:string -> unit
-> organization_resource_detailed_status_filters
(** Create a {!type-organization_resource_detailed_status_filters} type *)

val make_get_organization_conformance_pack_detailed_status_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:organization_resource_detailed_status_filters ->
  organization_conformance_pack_name:string ->
  unit
-> get_organization_conformance_pack_detailed_status_request
(** Create a {!type-get_organization_conformance_pack_detailed_status_request} type *)

val make_member_account_status :
  ?last_update_time:float ->
  ?error_message:string ->
  ?error_code:string ->
  member_account_rule_status:member_account_rule_status ->
  config_rule_name:string ->
  account_id:string ->
  unit
-> member_account_status
(** Create a {!type-member_account_status} type *)

val make_get_organization_config_rule_detailed_status_response :
  ?next_token:string ->
  ?organization_config_rule_detailed_status:member_account_status list ->
  unit
-> get_organization_config_rule_detailed_status_response
(** Create a {!type-get_organization_config_rule_detailed_status_response} type *)

val make_get_organization_config_rule_detailed_status_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:status_detail_filters ->
  organization_config_rule_name:string ->
  unit
-> get_organization_config_rule_detailed_status_request
(** Create a {!type-get_organization_config_rule_detailed_status_request} type *)

val make_resource_count : ?count:int -> ?resource_type:resource_type -> unit
-> resource_count
(** Create a {!type-resource_count} type *)

val make_get_discovered_resource_counts_response :
  ?next_token:string ->
  ?resource_counts:resource_count list ->
  ?total_discovered_resources:int ->
  unit
-> get_discovered_resource_counts_response
(** Create a {!type-get_discovered_resource_counts_response} type *)

val make_get_discovered_resource_counts_request :
  ?next_token:string -> ?limit:int -> ?resource_types:string list -> unit
-> get_discovered_resource_counts_request
(** Create a {!type-get_discovered_resource_counts_request} type *)

val make_get_custom_rule_policy_response : ?policy_text:string -> unit
-> get_custom_rule_policy_response
(** Create a {!type-get_custom_rule_policy_response} type *)

val make_get_custom_rule_policy_request : ?config_rule_name:string -> unit
-> get_custom_rule_policy_request
(** Create a {!type-get_custom_rule_policy_request} type *)

val make_conformance_pack_compliance_summary :
  conformance_pack_compliance_status:conformance_pack_compliance_type ->
  conformance_pack_name:string ->
  unit
-> conformance_pack_compliance_summary
(** Create a {!type-conformance_pack_compliance_summary} type *)

val make_get_conformance_pack_compliance_summary_response :
  ?next_token:string ->
  ?conformance_pack_compliance_summary_list:conformance_pack_compliance_summary list ->
  unit
-> get_conformance_pack_compliance_summary_response
(** Create a {!type-get_conformance_pack_compliance_summary_response} type *)

val make_get_conformance_pack_compliance_summary_request :
  ?next_token:string ->
  ?limit:int ->
  conformance_pack_names:string list ->
  unit
-> get_conformance_pack_compliance_summary_request
(** Create a {!type-get_conformance_pack_compliance_summary_request} type *)

val make_evaluation_result_qualifier :
  ?evaluation_mode:evaluation_mode ->
  ?resource_id:string ->
  ?resource_type:string ->
  ?config_rule_name:string ->
  unit
-> evaluation_result_qualifier
(** Create a {!type-evaluation_result_qualifier} type *)

val make_evaluation_result_identifier :
  ?resource_evaluation_id:string ->
  ?ordering_timestamp:float ->
  ?evaluation_result_qualifier:evaluation_result_qualifier ->
  unit
-> evaluation_result_identifier
(** Create a {!type-evaluation_result_identifier} type *)

val make_get_conformance_pack_compliance_details_response :
  ?next_token:string ->
  ?conformance_pack_rule_evaluation_results:conformance_pack_evaluation_result list ->
  conformance_pack_name:string ->
  unit
-> get_conformance_pack_compliance_details_response
(** Create a {!type-get_conformance_pack_compliance_details_response} type *)

val make_conformance_pack_evaluation_filters :
  ?resource_ids:string list ->
  ?resource_type:string ->
  ?compliance_type:conformance_pack_compliance_type ->
  ?config_rule_names:string list ->
  unit
-> conformance_pack_evaluation_filters
(** Create a {!type-conformance_pack_evaluation_filters} type *)

val make_get_conformance_pack_compliance_details_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:conformance_pack_evaluation_filters ->
  conformance_pack_name:string ->
  unit
-> get_conformance_pack_compliance_details_request
(** Create a {!type-get_conformance_pack_compliance_details_request} type *)

val make_compliance_contributor_count :
  ?cap_exceeded:bool -> ?capped_count:int -> unit
-> compliance_contributor_count
(** Create a {!type-compliance_contributor_count} type *)

val make_compliance_summary :
  ?compliance_summary_timestamp:float ->
  ?non_compliant_resource_count:compliance_contributor_count ->
  ?compliant_resource_count:compliance_contributor_count ->
  unit
-> compliance_summary
(** Create a {!type-compliance_summary} type *)

val make_compliance_summary_by_resource_type :
  ?compliance_summary:compliance_summary -> ?resource_type:string -> unit
-> compliance_summary_by_resource_type
(** Create a {!type-compliance_summary_by_resource_type} type *)

val make_get_compliance_summary_by_resource_type_response :
  ?compliance_summaries_by_resource_type:compliance_summary_by_resource_type list ->
  unit
-> get_compliance_summary_by_resource_type_response
(** Create a {!type-get_compliance_summary_by_resource_type_response} type *)

val make_get_compliance_summary_by_resource_type_request :
  ?resource_types:string list -> unit
-> get_compliance_summary_by_resource_type_request
(** Create a {!type-get_compliance_summary_by_resource_type_request} type *)

val make_get_compliance_summary_by_config_rule_response :
  ?compliance_summary:compliance_summary -> unit
-> get_compliance_summary_by_config_rule_response
(** Create a {!type-get_compliance_summary_by_config_rule_response} type *)

val make_get_compliance_details_by_resource_response :
  ?next_token:string -> ?evaluation_results:evaluation_result list -> unit
-> get_compliance_details_by_resource_response
(** Create a {!type-get_compliance_details_by_resource_response} type *)

val make_get_compliance_details_by_resource_request :
  ?resource_evaluation_id:string ->
  ?next_token:string ->
  ?compliance_types:compliance_type list ->
  ?resource_id:string ->
  ?resource_type:string ->
  unit
-> get_compliance_details_by_resource_request
(** Create a {!type-get_compliance_details_by_resource_request} type *)

val make_get_compliance_details_by_config_rule_response :
  ?next_token:string -> ?evaluation_results:evaluation_result list -> unit
-> get_compliance_details_by_config_rule_response
(** Create a {!type-get_compliance_details_by_config_rule_response} type *)

val make_get_compliance_details_by_config_rule_request :
  ?next_token:string ->
  ?limit:int ->
  ?compliance_types:compliance_type list ->
  config_rule_name:string ->
  unit
-> get_compliance_details_by_config_rule_request
(** Create a {!type-get_compliance_details_by_config_rule_request} type *)

val make_get_aggregate_resource_config_response :
  ?configuration_item:configuration_item -> unit
-> get_aggregate_resource_config_response
(** Create a {!type-get_aggregate_resource_config_response} type *)

val make_get_aggregate_resource_config_request :
  resource_identifier:aggregate_resource_identifier ->
  configuration_aggregator_name:string ->
  unit
-> get_aggregate_resource_config_request
(** Create a {!type-get_aggregate_resource_config_request} type *)

val make_grouped_resource_count :
  resource_count:int -> group_name:string -> unit
-> grouped_resource_count
(** Create a {!type-grouped_resource_count} type *)

val make_get_aggregate_discovered_resource_counts_response :
  ?next_token:string ->
  ?grouped_resource_counts:grouped_resource_count list ->
  ?group_by_key:string ->
  total_discovered_resources:int ->
  unit
-> get_aggregate_discovered_resource_counts_response
(** Create a {!type-get_aggregate_discovered_resource_counts_response} type *)

val make_resource_count_filters :
  ?region:string ->
  ?account_id:string ->
  ?resource_type:resource_type ->
  unit
-> resource_count_filters
(** Create a {!type-resource_count_filters} type *)

val make_get_aggregate_discovered_resource_counts_request :
  ?next_token:string ->
  ?limit:int ->
  ?group_by_key:resource_count_group_key ->
  ?filters:resource_count_filters ->
  configuration_aggregator_name:string ->
  unit
-> get_aggregate_discovered_resource_counts_request
(** Create a {!type-get_aggregate_discovered_resource_counts_request} type *)

val make_aggregate_conformance_pack_compliance_count :
  ?non_compliant_conformance_pack_count:int ->
  ?compliant_conformance_pack_count:int ->
  unit
-> aggregate_conformance_pack_compliance_count
(** Create a {!type-aggregate_conformance_pack_compliance_count} type *)

val make_aggregate_conformance_pack_compliance_summary :
  ?group_name:string ->
  ?compliance_summary:aggregate_conformance_pack_compliance_count ->
  unit
-> aggregate_conformance_pack_compliance_summary
(** Create a {!type-aggregate_conformance_pack_compliance_summary} type *)

val make_get_aggregate_conformance_pack_compliance_summary_response :
  ?next_token:string ->
  ?group_by_key:string ->
  ?aggregate_conformance_pack_compliance_summaries:aggregate_conformance_pack_compliance_summary list ->
  unit
-> get_aggregate_conformance_pack_compliance_summary_response
(** Create a {!type-get_aggregate_conformance_pack_compliance_summary_response} type *)

val make_aggregate_conformance_pack_compliance_summary_filters :
  ?aws_region:string -> ?account_id:string -> unit
-> aggregate_conformance_pack_compliance_summary_filters
(** Create a {!type-aggregate_conformance_pack_compliance_summary_filters} type *)

val make_get_aggregate_conformance_pack_compliance_summary_request :
  ?next_token:string ->
  ?limit:int ->
  ?group_by_key:aggregate_conformance_pack_compliance_summary_group_key ->
  ?filters:aggregate_conformance_pack_compliance_summary_filters ->
  configuration_aggregator_name:string ->
  unit
-> get_aggregate_conformance_pack_compliance_summary_request
(** Create a {!type-get_aggregate_conformance_pack_compliance_summary_request} type *)

val make_aggregate_compliance_count :
  ?compliance_summary:compliance_summary -> ?group_name:string -> unit
-> aggregate_compliance_count
(** Create a {!type-aggregate_compliance_count} type *)

val make_get_aggregate_config_rule_compliance_summary_response :
  ?next_token:string ->
  ?aggregate_compliance_counts:aggregate_compliance_count list ->
  ?group_by_key:string ->
  unit
-> get_aggregate_config_rule_compliance_summary_response
(** Create a {!type-get_aggregate_config_rule_compliance_summary_response} type *)

val make_config_rule_compliance_summary_filters :
  ?aws_region:string -> ?account_id:string -> unit
-> config_rule_compliance_summary_filters
(** Create a {!type-config_rule_compliance_summary_filters} type *)

val make_get_aggregate_config_rule_compliance_summary_request :
  ?next_token:string ->
  ?limit:int ->
  ?group_by_key:config_rule_compliance_summary_group_key ->
  ?filters:config_rule_compliance_summary_filters ->
  configuration_aggregator_name:string ->
  unit
-> get_aggregate_config_rule_compliance_summary_request
(** Create a {!type-get_aggregate_config_rule_compliance_summary_request} type *)

val make_get_aggregate_compliance_details_by_config_rule_response :
  ?next_token:string ->
  ?aggregate_evaluation_results:aggregate_evaluation_result list ->
  unit
-> get_aggregate_compliance_details_by_config_rule_response
(** Create a {!type-get_aggregate_compliance_details_by_config_rule_response} type *)

val make_get_aggregate_compliance_details_by_config_rule_request :
  ?next_token:string ->
  ?limit:int ->
  ?compliance_type:compliance_type ->
  aws_region:string ->
  account_id:string ->
  config_rule_name:string ->
  configuration_aggregator_name:string ->
  unit
-> get_aggregate_compliance_details_by_config_rule_request
(** Create a {!type-get_aggregate_compliance_details_by_config_rule_request} type *)

val make_describe_retention_configurations_response :
  ?next_token:string ->
  ?retention_configurations:retention_configuration list ->
  unit
-> describe_retention_configurations_response
(** Create a {!type-describe_retention_configurations_response} type *)

val make_describe_retention_configurations_request :
  ?next_token:string -> ?retention_configuration_names:string list -> unit
-> describe_retention_configurations_request
(** Create a {!type-describe_retention_configurations_request} type *)

val make_remediation_execution_step :
  ?stop_time:float ->
  ?start_time:float ->
  ?error_message:string ->
  ?state:remediation_execution_step_state ->
  ?name:string ->
  unit
-> remediation_execution_step
(** Create a {!type-remediation_execution_step} type *)

val make_remediation_execution_status :
  ?last_updated_time:float ->
  ?invocation_time:float ->
  ?step_details:remediation_execution_step list ->
  ?state:remediation_execution_state ->
  ?resource_key:resource_key ->
  unit
-> remediation_execution_status
(** Create a {!type-remediation_execution_status} type *)

val make_describe_remediation_execution_status_response :
  ?next_token:string ->
  ?remediation_execution_statuses:remediation_execution_status list ->
  unit
-> describe_remediation_execution_status_response
(** Create a {!type-describe_remediation_execution_status_response} type *)

val make_describe_remediation_execution_status_request :
  ?next_token:string ->
  ?limit:int ->
  ?resource_keys:resource_key list ->
  config_rule_name:string ->
  unit
-> describe_remediation_execution_status_request
(** Create a {!type-describe_remediation_execution_status_request} type *)

val make_describe_remediation_exceptions_response :
  ?next_token:string ->
  ?remediation_exceptions:remediation_exception list ->
  unit
-> describe_remediation_exceptions_response
(** Create a {!type-describe_remediation_exceptions_response} type *)

val make_describe_remediation_exceptions_request :
  ?next_token:string ->
  ?limit:int ->
  ?resource_keys:remediation_exception_resource_key list ->
  config_rule_name:string ->
  unit
-> describe_remediation_exceptions_request
(** Create a {!type-describe_remediation_exceptions_request} type *)

val make_describe_remediation_configurations_response :
  ?remediation_configurations:remediation_configuration list -> unit
-> describe_remediation_configurations_response
(** Create a {!type-describe_remediation_configurations_response} type *)

val make_describe_remediation_configurations_request :
  config_rule_names:string list -> unit
-> describe_remediation_configurations_request
(** Create a {!type-describe_remediation_configurations_request} type *)

val make_pending_aggregation_request :
  ?requester_aws_region:string -> ?requester_account_id:string -> unit
-> pending_aggregation_request
(** Create a {!type-pending_aggregation_request} type *)

val make_describe_pending_aggregation_requests_response :
  ?next_token:string ->
  ?pending_aggregation_requests:pending_aggregation_request list ->
  unit
-> describe_pending_aggregation_requests_response
(** Create a {!type-describe_pending_aggregation_requests_response} type *)

val make_describe_pending_aggregation_requests_request :
  ?next_token:string -> ?limit:int -> unit
-> describe_pending_aggregation_requests_request
(** Create a {!type-describe_pending_aggregation_requests_request} type *)

val make_organization_conformance_pack_status :
  ?last_update_time:float ->
  ?error_message:string ->
  ?error_code:string ->
  status:organization_resource_status ->
  organization_conformance_pack_name:string ->
  unit
-> organization_conformance_pack_status
(** Create a {!type-organization_conformance_pack_status} type *)

val make_describe_organization_conformance_pack_statuses_response :
  ?next_token:string ->
  ?organization_conformance_pack_statuses:organization_conformance_pack_status list ->
  unit
-> describe_organization_conformance_pack_statuses_response
(** Create a {!type-describe_organization_conformance_pack_statuses_response} type *)

val make_describe_organization_conformance_pack_statuses_request :
  ?next_token:string ->
  ?limit:int ->
  ?organization_conformance_pack_names:string list ->
  unit
-> describe_organization_conformance_pack_statuses_request
(** Create a {!type-describe_organization_conformance_pack_statuses_request} type *)

val make_organization_conformance_pack :
  ?excluded_accounts:string list ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameter list ->
  ?delivery_s3_key_prefix:string ->
  ?delivery_s3_bucket:string ->
  last_update_time:float ->
  organization_conformance_pack_arn:string ->
  organization_conformance_pack_name:string ->
  unit
-> organization_conformance_pack
(** Create a {!type-organization_conformance_pack} type *)

val make_describe_organization_conformance_packs_response :
  ?next_token:string ->
  ?organization_conformance_packs:organization_conformance_pack list ->
  unit
-> describe_organization_conformance_packs_response
(** Create a {!type-describe_organization_conformance_packs_response} type *)

val make_describe_organization_conformance_packs_request :
  ?next_token:string ->
  ?limit:int ->
  ?organization_conformance_pack_names:string list ->
  unit
-> describe_organization_conformance_packs_request
(** Create a {!type-describe_organization_conformance_packs_request} type *)

val make_organization_config_rule_status :
  ?last_update_time:float ->
  ?error_message:string ->
  ?error_code:string ->
  organization_rule_status:organization_rule_status ->
  organization_config_rule_name:string ->
  unit
-> organization_config_rule_status
(** Create a {!type-organization_config_rule_status} type *)

val make_describe_organization_config_rule_statuses_response :
  ?next_token:string ->
  ?organization_config_rule_statuses:organization_config_rule_status list ->
  unit
-> describe_organization_config_rule_statuses_response
(** Create a {!type-describe_organization_config_rule_statuses_response} type *)

val make_describe_organization_config_rule_statuses_request :
  ?next_token:string ->
  ?limit:int ->
  ?organization_config_rule_names:string list ->
  unit
-> describe_organization_config_rule_statuses_request
(** Create a {!type-describe_organization_config_rule_statuses_request} type *)

val make_organization_custom_policy_rule_metadata_no_policy :
  ?debug_log_delivery_accounts:string list ->
  ?policy_runtime:string ->
  ?tag_value_scope:string ->
  ?tag_key_scope:string ->
  ?resource_id_scope:string ->
  ?resource_types_scope:string list ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?input_parameters:string ->
  ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_n list ->
  ?description:string ->
  unit
-> organization_custom_policy_rule_metadata_no_policy
(** Create a {!type-organization_custom_policy_rule_metadata_no_policy} type *)

val make_organization_config_rule :
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata_no_policy ->
  ?last_update_time:float ->
  ?excluded_accounts:string list ->
  ?organization_custom_rule_metadata:organization_custom_rule_metadata ->
  ?organization_managed_rule_metadata:organization_managed_rule_metadata ->
  organization_config_rule_arn:string ->
  organization_config_rule_name:string ->
  unit
-> organization_config_rule
(** Create a {!type-organization_config_rule} type *)

val make_describe_organization_config_rules_response :
  ?next_token:string ->
  ?organization_config_rules:organization_config_rule list ->
  unit
-> describe_organization_config_rules_response
(** Create a {!type-describe_organization_config_rules_response} type *)

val make_describe_organization_config_rules_request :
  ?next_token:string ->
  ?limit:int ->
  ?organization_config_rule_names:string list ->
  unit
-> describe_organization_config_rules_request
(** Create a {!type-describe_organization_config_rules_request} type *)

val make_config_export_delivery_info :
  ?next_delivery_time:float ->
  ?last_successful_time:float ->
  ?last_attempt_time:float ->
  ?last_error_message:string ->
  ?last_error_code:string ->
  ?last_status:delivery_status ->
  unit
-> config_export_delivery_info
(** Create a {!type-config_export_delivery_info} type *)

val make_config_stream_delivery_info :
  ?last_status_change_time:float ->
  ?last_error_message:string ->
  ?last_error_code:string ->
  ?last_status:delivery_status ->
  unit
-> config_stream_delivery_info
(** Create a {!type-config_stream_delivery_info} type *)

val make_delivery_channel_status :
  ?config_stream_delivery_info:config_stream_delivery_info ->
  ?config_history_delivery_info:config_export_delivery_info ->
  ?config_snapshot_delivery_info:config_export_delivery_info ->
  ?name:string ->
  unit
-> delivery_channel_status
(** Create a {!type-delivery_channel_status} type *)

val make_describe_delivery_channel_status_response :
  ?delivery_channels_status:delivery_channel_status list -> unit
-> describe_delivery_channel_status_response
(** Create a {!type-describe_delivery_channel_status_response} type *)

val make_describe_delivery_channel_status_request :
  ?delivery_channel_names:string list -> unit
-> describe_delivery_channel_status_request
(** Create a {!type-describe_delivery_channel_status_request} type *)

val make_describe_delivery_channels_response :
  ?delivery_channels:delivery_channel list -> unit
-> describe_delivery_channels_response
(** Create a {!type-describe_delivery_channels_response} type *)

val make_describe_delivery_channels_request :
  ?delivery_channel_names:string list -> unit
-> describe_delivery_channels_request
(** Create a {!type-describe_delivery_channels_request} type *)

val make_conformance_pack_status_detail :
  ?last_update_completed_time:float ->
  ?conformance_pack_status_reason:string ->
  last_update_requested_time:float ->
  stack_arn:string ->
  conformance_pack_state:conformance_pack_state ->
  conformance_pack_arn:string ->
  conformance_pack_id:string ->
  conformance_pack_name:string ->
  unit
-> conformance_pack_status_detail
(** Create a {!type-conformance_pack_status_detail} type *)

val make_describe_conformance_pack_status_response :
  ?next_token:string ->
  ?conformance_pack_status_details:conformance_pack_status_detail list ->
  unit
-> describe_conformance_pack_status_response
(** Create a {!type-describe_conformance_pack_status_response} type *)

val make_describe_conformance_pack_status_request :
  ?next_token:string ->
  ?limit:int ->
  ?conformance_pack_names:string list ->
  unit
-> describe_conformance_pack_status_request
(** Create a {!type-describe_conformance_pack_status_request} type *)

val make_conformance_pack_detail :
  ?template_ssm_document_details:template_ssm_document_details ->
  ?created_by:string ->
  ?last_update_requested_time:float ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameter list ->
  ?delivery_s3_key_prefix:string ->
  ?delivery_s3_bucket:string ->
  conformance_pack_id:string ->
  conformance_pack_arn:string ->
  conformance_pack_name:string ->
  unit
-> conformance_pack_detail
(** Create a {!type-conformance_pack_detail} type *)

val make_describe_conformance_packs_response :
  ?next_token:string ->
  ?conformance_pack_details:conformance_pack_detail list ->
  unit
-> describe_conformance_packs_response
(** Create a {!type-describe_conformance_packs_response} type *)

val make_describe_conformance_packs_request :
  ?next_token:string ->
  ?limit:int ->
  ?conformance_pack_names:string list ->
  unit
-> describe_conformance_packs_request
(** Create a {!type-describe_conformance_packs_request} type *)

val make_conformance_pack_rule_compliance :
  ?controls:string list ->
  ?compliance_type:conformance_pack_compliance_type ->
  ?config_rule_name:string ->
  unit
-> conformance_pack_rule_compliance
(** Create a {!type-conformance_pack_rule_compliance} type *)

val make_describe_conformance_pack_compliance_response :
  ?next_token:string ->
  conformance_pack_rule_compliance_list:conformance_pack_rule_compliance list ->
  conformance_pack_name:string ->
  unit
-> describe_conformance_pack_compliance_response
(** Create a {!type-describe_conformance_pack_compliance_response} type *)

val make_conformance_pack_compliance_filters :
  ?compliance_type:conformance_pack_compliance_type ->
  ?config_rule_names:string list ->
  unit
-> conformance_pack_compliance_filters
(** Create a {!type-conformance_pack_compliance_filters} type *)

val make_describe_conformance_pack_compliance_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:conformance_pack_compliance_filters ->
  conformance_pack_name:string ->
  unit
-> describe_conformance_pack_compliance_request
(** Create a {!type-describe_conformance_pack_compliance_request} type *)

val make_configuration_recorder_status :
  ?last_status_change_time:float ->
  ?last_error_message:string ->
  ?last_error_code:string ->
  ?last_status:recorder_status ->
  ?recording:bool ->
  ?last_stop_time:float ->
  ?last_start_time:float ->
  ?name:string ->
  unit
-> configuration_recorder_status
(** Create a {!type-configuration_recorder_status} type *)

val make_describe_configuration_recorder_status_response :
  ?configuration_recorders_status:configuration_recorder_status list -> unit
-> describe_configuration_recorder_status_response
(** Create a {!type-describe_configuration_recorder_status_response} type *)

val make_describe_configuration_recorder_status_request :
  ?configuration_recorder_names:string list -> unit
-> describe_configuration_recorder_status_request
(** Create a {!type-describe_configuration_recorder_status_request} type *)

val make_describe_configuration_recorders_response :
  ?configuration_recorders:configuration_recorder list -> unit
-> describe_configuration_recorders_response
(** Create a {!type-describe_configuration_recorders_response} type *)

val make_describe_configuration_recorders_request :
  ?configuration_recorder_names:string list -> unit
-> describe_configuration_recorders_request
(** Create a {!type-describe_configuration_recorders_request} type *)

val make_aggregated_source_status :
  ?last_error_message:string ->
  ?last_error_code:string ->
  ?last_update_time:float ->
  ?last_update_status:aggregated_source_status_type ->
  ?aws_region:string ->
  ?source_type:aggregated_source_type ->
  ?source_id:string ->
  unit
-> aggregated_source_status
(** Create a {!type-aggregated_source_status} type *)

val make_describe_configuration_aggregator_sources_status_response :
  ?next_token:string ->
  ?aggregated_source_status_list:aggregated_source_status list ->
  unit
-> describe_configuration_aggregator_sources_status_response
(** Create a {!type-describe_configuration_aggregator_sources_status_response} type *)

val make_describe_configuration_aggregator_sources_status_request :
  ?limit:int ->
  ?next_token:string ->
  ?update_status:aggregated_source_status_type list ->
  configuration_aggregator_name:string ->
  unit
-> describe_configuration_aggregator_sources_status_request
(** Create a {!type-describe_configuration_aggregator_sources_status_request} type *)

val make_describe_configuration_aggregators_response :
  ?next_token:string ->
  ?configuration_aggregators:configuration_aggregator list ->
  unit
-> describe_configuration_aggregators_response
(** Create a {!type-describe_configuration_aggregators_response} type *)

val make_describe_configuration_aggregators_request :
  ?limit:int ->
  ?next_token:string ->
  ?configuration_aggregator_names:string list ->
  unit
-> describe_configuration_aggregators_request
(** Create a {!type-describe_configuration_aggregators_request} type *)

val make_describe_config_rules_response :
  ?next_token:string -> ?config_rules:config_rule list -> unit
-> describe_config_rules_response
(** Create a {!type-describe_config_rules_response} type *)

val make_describe_config_rules_filters :
  ?evaluation_mode:evaluation_mode -> unit
-> describe_config_rules_filters
(** Create a {!type-describe_config_rules_filters} type *)

val make_describe_config_rules_request :
  ?filters:describe_config_rules_filters ->
  ?next_token:string ->
  ?config_rule_names:string list ->
  unit
-> describe_config_rules_request
(** Create a {!type-describe_config_rules_request} type *)

val make_config_rule_evaluation_status :
  ?last_debug_log_delivery_time:float ->
  ?last_debug_log_delivery_status_reason:string ->
  ?last_debug_log_delivery_status:string ->
  ?first_evaluation_started:bool ->
  ?last_error_message:string ->
  ?last_error_code:string ->
  ?last_deactivated_time:float ->
  ?first_activated_time:float ->
  ?last_failed_evaluation_time:float ->
  ?last_successful_evaluation_time:float ->
  ?last_failed_invocation_time:float ->
  ?last_successful_invocation_time:float ->
  ?config_rule_id:string ->
  ?config_rule_arn:string ->
  ?config_rule_name:string ->
  unit
-> config_rule_evaluation_status
(** Create a {!type-config_rule_evaluation_status} type *)

val make_describe_config_rule_evaluation_status_response :
  ?next_token:string ->
  ?config_rules_evaluation_status:config_rule_evaluation_status list ->
  unit
-> describe_config_rule_evaluation_status_response
(** Create a {!type-describe_config_rule_evaluation_status_response} type *)

val make_describe_config_rule_evaluation_status_request :
  ?limit:int -> ?next_token:string -> ?config_rule_names:string list -> unit
-> describe_config_rule_evaluation_status_request
(** Create a {!type-describe_config_rule_evaluation_status_request} type *)

val make_compliance :
  ?compliance_contributor_count:compliance_contributor_count ->
  ?compliance_type:compliance_type ->
  unit
-> compliance
(** Create a {!type-compliance} type *)

val make_compliance_by_resource :
  ?compliance:compliance ->
  ?resource_id:string ->
  ?resource_type:string ->
  unit
-> compliance_by_resource
(** Create a {!type-compliance_by_resource} type *)

val make_describe_compliance_by_resource_response :
  ?next_token:string ->
  ?compliance_by_resources:compliance_by_resource list ->
  unit
-> describe_compliance_by_resource_response
(** Create a {!type-describe_compliance_by_resource_response} type *)

val make_describe_compliance_by_resource_request :
  ?next_token:string ->
  ?limit:int ->
  ?compliance_types:compliance_type list ->
  ?resource_id:string ->
  ?resource_type:string ->
  unit
-> describe_compliance_by_resource_request
(** Create a {!type-describe_compliance_by_resource_request} type *)

val make_compliance_by_config_rule :
  ?compliance:compliance -> ?config_rule_name:string -> unit
-> compliance_by_config_rule
(** Create a {!type-compliance_by_config_rule} type *)

val make_describe_compliance_by_config_rule_response :
  ?next_token:string ->
  ?compliance_by_config_rules:compliance_by_config_rule list ->
  unit
-> describe_compliance_by_config_rule_response
(** Create a {!type-describe_compliance_by_config_rule_response} type *)

val make_describe_compliance_by_config_rule_request :
  ?next_token:string ->
  ?compliance_types:compliance_type list ->
  ?config_rule_names:string list ->
  unit
-> describe_compliance_by_config_rule_request
(** Create a {!type-describe_compliance_by_config_rule_request} type *)

val make_describe_aggregation_authorizations_response :
  ?next_token:string ->
  ?aggregation_authorizations:aggregation_authorization list ->
  unit
-> describe_aggregation_authorizations_response
(** Create a {!type-describe_aggregation_authorizations_response} type *)

val make_describe_aggregation_authorizations_request :
  ?next_token:string -> ?limit:int -> unit
-> describe_aggregation_authorizations_request
(** Create a {!type-describe_aggregation_authorizations_request} type *)

val make_aggregate_conformance_pack_compliance :
  ?total_rule_count:int ->
  ?non_compliant_rule_count:int ->
  ?compliant_rule_count:int ->
  ?compliance_type:conformance_pack_compliance_type ->
  unit
-> aggregate_conformance_pack_compliance
(** Create a {!type-aggregate_conformance_pack_compliance} type *)

val make_aggregate_compliance_by_conformance_pack :
  ?aws_region:string ->
  ?account_id:string ->
  ?compliance:aggregate_conformance_pack_compliance ->
  ?conformance_pack_name:string ->
  unit
-> aggregate_compliance_by_conformance_pack
(** Create a {!type-aggregate_compliance_by_conformance_pack} type *)

val make_describe_aggregate_compliance_by_conformance_packs_response :
  ?next_token:string ->
  ?aggregate_compliance_by_conformance_packs:aggregate_compliance_by_conformance_pack list ->
  unit
-> describe_aggregate_compliance_by_conformance_packs_response
(** Create a {!type-describe_aggregate_compliance_by_conformance_packs_response} type *)

val make_aggregate_conformance_pack_compliance_filters :
  ?aws_region:string ->
  ?account_id:string ->
  ?compliance_type:conformance_pack_compliance_type ->
  ?conformance_pack_name:string ->
  unit
-> aggregate_conformance_pack_compliance_filters
(** Create a {!type-aggregate_conformance_pack_compliance_filters} type *)

val make_describe_aggregate_compliance_by_conformance_packs_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:aggregate_conformance_pack_compliance_filters ->
  configuration_aggregator_name:string ->
  unit
-> describe_aggregate_compliance_by_conformance_packs_request
(** Create a {!type-describe_aggregate_compliance_by_conformance_packs_request} type *)

val make_aggregate_compliance_by_config_rule :
  ?aws_region:string ->
  ?account_id:string ->
  ?compliance:compliance ->
  ?config_rule_name:string ->
  unit
-> aggregate_compliance_by_config_rule
(** Create a {!type-aggregate_compliance_by_config_rule} type *)

val make_describe_aggregate_compliance_by_config_rules_response :
  ?next_token:string ->
  ?aggregate_compliance_by_config_rules:aggregate_compliance_by_config_rule list ->
  unit
-> describe_aggregate_compliance_by_config_rules_response
(** Create a {!type-describe_aggregate_compliance_by_config_rules_response} type *)

val make_config_rule_compliance_filters :
  ?aws_region:string ->
  ?account_id:string ->
  ?compliance_type:compliance_type ->
  ?config_rule_name:string ->
  unit
-> config_rule_compliance_filters
(** Create a {!type-config_rule_compliance_filters} type *)

val make_describe_aggregate_compliance_by_config_rules_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:config_rule_compliance_filters ->
  configuration_aggregator_name:string ->
  unit
-> describe_aggregate_compliance_by_config_rules_request
(** Create a {!type-describe_aggregate_compliance_by_config_rules_request} type *)

val make_deliver_config_snapshot_response :
  ?config_snapshot_id:string -> unit
-> deliver_config_snapshot_response
(** Create a {!type-deliver_config_snapshot_response} type *)

val make_deliver_config_snapshot_request :
  delivery_channel_name:string -> unit
-> deliver_config_snapshot_request
(** Create a {!type-deliver_config_snapshot_request} type *)

val make_delete_stored_query_response : unit
-> delete_stored_query_response
(** Create a {!type-delete_stored_query_response} type *)

val make_delete_stored_query_request : query_name:string -> unit
-> delete_stored_query_request
(** Create a {!type-delete_stored_query_request} type *)

val make_delete_retention_configuration_request :
  retention_configuration_name:string -> unit
-> delete_retention_configuration_request
(** Create a {!type-delete_retention_configuration_request} type *)

val make_delete_resource_config_request :
  resource_id:string -> resource_type:string -> unit
-> delete_resource_config_request
(** Create a {!type-delete_resource_config_request} type *)

val make_failed_delete_remediation_exceptions_batch :
  ?failed_items:remediation_exception_resource_key list ->
  ?failure_message:string ->
  unit
-> failed_delete_remediation_exceptions_batch
(** Create a {!type-failed_delete_remediation_exceptions_batch} type *)

val make_delete_remediation_exceptions_response :
  ?failed_batches:failed_delete_remediation_exceptions_batch list -> unit
-> delete_remediation_exceptions_response
(** Create a {!type-delete_remediation_exceptions_response} type *)

val make_delete_remediation_exceptions_request :
  resource_keys:remediation_exception_resource_key list ->
  config_rule_name:string ->
  unit
-> delete_remediation_exceptions_request
(** Create a {!type-delete_remediation_exceptions_request} type *)

val make_delete_remediation_configuration_response : unit
-> delete_remediation_configuration_response
(** Create a {!type-delete_remediation_configuration_response} type *)

val make_delete_remediation_configuration_request :
  ?resource_type:string -> config_rule_name:string -> unit
-> delete_remediation_configuration_request
(** Create a {!type-delete_remediation_configuration_request} type *)

val make_delete_pending_aggregation_request_request :
  requester_aws_region:string -> requester_account_id:string -> unit
-> delete_pending_aggregation_request_request
(** Create a {!type-delete_pending_aggregation_request_request} type *)

val make_delete_organization_conformance_pack_request :
  organization_conformance_pack_name:string -> unit
-> delete_organization_conformance_pack_request
(** Create a {!type-delete_organization_conformance_pack_request} type *)

val make_delete_organization_config_rule_request :
  organization_config_rule_name:string -> unit
-> delete_organization_config_rule_request
(** Create a {!type-delete_organization_config_rule_request} type *)

val make_delete_evaluation_results_response : unit
-> delete_evaluation_results_response
(** Create a {!type-delete_evaluation_results_response} type *)

val make_delete_evaluation_results_request : config_rule_name:string -> unit
-> delete_evaluation_results_request
(** Create a {!type-delete_evaluation_results_request} type *)

val make_delete_delivery_channel_request :
  delivery_channel_name:string -> unit
-> delete_delivery_channel_request
(** Create a {!type-delete_delivery_channel_request} type *)

val make_delete_conformance_pack_request :
  conformance_pack_name:string -> unit
-> delete_conformance_pack_request
(** Create a {!type-delete_conformance_pack_request} type *)

val make_delete_configuration_recorder_request :
  configuration_recorder_name:string -> unit
-> delete_configuration_recorder_request
(** Create a {!type-delete_configuration_recorder_request} type *)

val make_delete_configuration_aggregator_request :
  configuration_aggregator_name:string -> unit
-> delete_configuration_aggregator_request
(** Create a {!type-delete_configuration_aggregator_request} type *)

val make_delete_config_rule_request : config_rule_name:string -> unit
-> delete_config_rule_request
(** Create a {!type-delete_config_rule_request} type *)

val make_delete_aggregation_authorization_request :
  authorized_aws_region:string -> authorized_account_id:string -> unit
-> delete_aggregation_authorization_request
(** Create a {!type-delete_aggregation_authorization_request} type *)

val make_base_configuration_item :
  ?configuration_item_delivery_time:float ->
  ?recording_frequency:recording_frequency ->
  ?supplementary_configuration:(string * string) list ->
  ?configuration:string ->
  ?resource_creation_time:float ->
  ?availability_zone:string ->
  ?aws_region:string ->
  ?resource_name:string ->
  ?resource_id:string ->
  ?resource_type:resource_type ->
  ?arn:string ->
  ?configuration_state_id:string ->
  ?configuration_item_status:configuration_item_status ->
  ?configuration_item_capture_time:float ->
  ?account_id:string ->
  ?version:string ->
  unit
-> base_configuration_item
(** Create a {!type-base_configuration_item} type *)

val make_batch_get_resource_config_response :
  ?unprocessed_resource_keys:resource_key list ->
  ?base_configuration_items:base_configuration_item list ->
  unit
-> batch_get_resource_config_response
(** Create a {!type-batch_get_resource_config_response} type *)

val make_batch_get_resource_config_request :
  resource_keys:resource_key list -> unit
-> batch_get_resource_config_request
(** Create a {!type-batch_get_resource_config_request} type *)

val make_batch_get_aggregate_resource_config_response :
  ?unprocessed_resource_identifiers:aggregate_resource_identifier list ->
  ?base_configuration_items:base_configuration_item list ->
  unit
-> batch_get_aggregate_resource_config_response
(** Create a {!type-batch_get_aggregate_resource_config_response} type *)

val make_batch_get_aggregate_resource_config_request :
  resource_identifiers:aggregate_resource_identifier list ->
  configuration_aggregator_name:string ->
  unit
-> batch_get_aggregate_resource_config_request
(** Create a {!type-batch_get_aggregate_resource_config_request} type *)

(** {1:operations Operations} *)

module BatchGetAggregateResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_aggregate_resource_config_request ->
        (batch_get_aggregate_resource_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns the current configuration items for resources that are present in your Config aggregator. The operation also returns a list of resources that are not processed in the current request. If there are no unprocessed resources, the operation returns an empty [unprocessedResourceIdentifiers] list.
    
     {ul
          {- The API does not return results for deleted resources.
             
             }
           {- The API does not return tags and relationships.
              
              }
          
      }
       *)

  
end

module BatchGetResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_resource_config_request ->
        (batch_get_resource_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns the [BaseConfigurationItem] for one or more requested resources. The operation also returns a list of resources that are not processed in the current request. If there are no unprocessed resources, the operation returns an empty unprocessedResourceKeys list.
    
     {ul
          {- The API does not return results for deleted resources.
             
             }
           {- The API does not return any tags for the requested resources. This information is filtered out of the supplementaryConfiguration section of the API response.
              
              }
          
      }
       *)

  
end

module DeleteAggregationAuthorization : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_aggregation_authorization_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Deletes the authorization granted to the specified configuration aggregator account in a specified region.
     *)

  
end

module DeleteConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_config_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigRuleException of no_such_config_rule_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** 
    Deletes the specified Config rule and all of its evaluation results.
    
     Config sets the state of a rule to [DELETING] until the deletion is complete. You cannot update a rule while it is in this state. If you make a [PutConfigRule] or [DeleteConfigRule] request for the rule, you will receive a [ResourceInUseException].
     
      You can check the state of a rule by using the [DescribeConfigRules] request.
       *)

  
end

module DeleteConfigurationAggregator : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_configuration_aggregator_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            
        ]
      ) result
  (** 
    Deletes the specified configuration aggregator and the aggregated data associated with the aggregator.
     *)

  
end

module DeleteConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_configuration_recorder_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
            
        ]
      ) result
  (** 
    Deletes the configuration recorder.
    
     After the configuration recorder is deleted, Config will not record resource configuration changes until you create a new configuration recorder.
     
      This action does not delete the configuration information that was previously recorded. You will be able to access the previously recorded information by using the [GetResourceConfigHistory] action, but you will not be able to access this information in the Config console until you create a new configuration recorder.
       *)

  
end

module DeleteConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_conformance_pack_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConformancePackException of no_such_conformance_pack_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** 
    Deletes the specified conformance pack and all the Config rules, remediation actions, and all evaluation results within that conformance pack.
    
     Config sets the conformance pack to [DELETE_IN_PROGRESS] until the deletion is complete. You cannot update a conformance pack while it is in this state.
      *)

  
end

module DeleteDeliveryChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_delivery_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LastDeliveryChannelDeleteFailedException of last_delivery_channel_delete_failed_exception
            | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception
            
        ]
      ) result
  (** 
    Deletes the delivery channel.
    
     Before you can delete the delivery channel, you must stop the configuration recorder by using the [StopConfigurationRecorder] action.
      *)

  
end

module DeleteEvaluationResults : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_evaluation_results_request ->
        (delete_evaluation_results_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigRuleException of no_such_config_rule_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** 
    Deletes the evaluation results for the specified Config rule. You can specify one Config rule per request. After you delete the evaluation results, you can call the [StartConfigRulesEvaluation] API to start evaluating your Amazon Web Services resources against the rule.
     *)

  
end

module DeleteOrganizationConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_organization_config_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** 
    Deletes the specified organization Config rule and all of its evaluation results from all member accounts in that organization.
    
     Only a management account and a delegated administrator account can delete an organization Config rule. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added.
     
      Config sets the state of a rule to DELETE_IN_PROGRESS until the deletion is complete. You cannot update a rule while it is in this state.
       *)

  
end

module DeleteOrganizationConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_organization_conformance_pack_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchOrganizationConformancePackException of no_such_organization_conformance_pack_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** 
    Deletes the specified organization conformance pack and all of the Config rules and remediation actions from all member accounts in that organization.
    
     Only a management account or a delegated administrator account can delete an organization conformance pack. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added.
     
      Config sets the state of a conformance pack to DELETE_IN_PROGRESS until the deletion is complete. You cannot update a conformance pack while it is in this state.
       *)

  
end

module DeletePendingAggregationRequest : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_pending_aggregation_request_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Deletes pending authorization requests for a specified aggregator account in a specified region.
     *)

  
end

module DeleteRemediationConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_remediation_configuration_request ->
        (delete_remediation_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchRemediationConfigurationException of no_such_remediation_configuration_exception
            | `RemediationInProgressException of remediation_in_progress_exception
            
        ]
      ) result
  (** 
    Deletes the remediation configuration.
     *)

  
end

module DeleteRemediationExceptions : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_remediation_exceptions_request ->
        (delete_remediation_exceptions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchRemediationExceptionException of no_such_remediation_exception_exception
            
        ]
      ) result
  (** 
    Deletes one or more remediation exceptions mentioned in the resource keys.
    
     Config generates a remediation exception when a problem occurs executing a remediation action to a specific resource. Remediation exceptions blocks auto-remediation until the exception is cleared.
     
      *)

  
end

module DeleteResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_config_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoRunningConfigurationRecorderException of no_running_configuration_recorder_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Records the configuration state for a custom resource that has been deleted. This API records a new ConfigurationItem with a ResourceDeleted status. You can retrieve the ConfigurationItems recorded for this resource in your Config History.
     *)

  
end

module DeleteRetentionConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_retention_configuration_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchRetentionConfigurationException of no_such_retention_configuration_exception
            
        ]
      ) result
  (** 
    Deletes the retention configuration.
     *)

  
end

module DeleteStoredQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_stored_query_request ->
        (delete_stored_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Deletes the stored query for a single Amazon Web Services account and a single Amazon Web Services Region.
     *)

  
end

module DeliverConfigSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      deliver_config_snapshot_request ->
        (deliver_config_snapshot_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `NoRunningConfigurationRecorderException of no_running_configuration_recorder_exception
            | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception
            
        ]
      ) result
  (** 
    Schedules delivery of a configuration snapshot to the Amazon S3 bucket in the specified delivery channel. After the delivery has started, Config sends the following notifications using an Amazon SNS topic that you have specified.
    
     {ul
          {- Notification of the start of the delivery.
             
             }
           {- Notification of the completion of the delivery, if the delivery was successfully completed.
              
              }
           {- Notification of delivery failure, if the delivery failed.
              
              }
          
      }
       *)

  
end

module DescribeAggregateComplianceByConfigRules : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_aggregate_compliance_by_config_rules_request ->
        (describe_aggregate_compliance_by_config_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns a list of compliant and noncompliant rules with the number of resources for compliant and noncompliant rules. Does not display rules that do not have compliance results.
    
     The results can return an empty result page, but if you have a [nextToken], the results are displayed on the next page.
     
      *)

  
end

module DescribeAggregateComplianceByConformancePacks : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_aggregate_compliance_by_conformance_packs_request ->
        (describe_aggregate_compliance_by_conformance_packs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns a list of the conformance packs and their associated compliance status with the count of compliant and noncompliant Config rules within each conformance pack. Also returns the total rule count which includes compliant rules, noncompliant rules, and rules that cannot be evaluated due to insufficient data.
    
     The results can return an empty result page, but if you have a [nextToken], the results are displayed on the next page.
     
      *)

  
end

module DescribeAggregationAuthorizations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_aggregation_authorizations_request ->
        (describe_aggregation_authorizations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Returns a list of authorizations granted to various aggregator accounts and regions.
     *)

  
end

module DescribeComplianceByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_compliance_by_config_rule_request ->
        (describe_compliance_by_config_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** 
    Indicates whether the specified Config rules are compliant. If a rule is noncompliant, this action returns the number of Amazon Web Services resources that do not comply with the rule.
    
     A rule is compliant if all of the evaluated resources comply with it. It is noncompliant if any of these resources do not comply.
     
      If Config has no current evaluation results for the rule, it returns [INSUFFICIENT_DATA]. This result might indicate one of the following conditions:
      
       {ul
            {- Config has never invoked an evaluation for the rule. To check whether it has, use the [DescribeConfigRuleEvaluationStatus] action to get the [LastSuccessfulInvocationTime] and [LastFailedInvocationTime].
               
               }
             {- The rule's Lambda function is failing to send evaluation results to Config. Verify that the role you assigned to your configuration recorder includes the [config:PutEvaluations] permission. If the rule is a custom rule, verify that the Lambda execution role includes the [config:PutEvaluations] permission.
                
                }
             {- The rule's Lambda function has returned [NOT_APPLICABLE] for all evaluation results. This can occur if the resources were deleted or removed from the rule's scope.
                
                }
            
      }
       *)

  
end

module DescribeComplianceByResource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_compliance_by_resource_request ->
        (describe_compliance_by_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Indicates whether the specified Amazon Web Services resources are compliant. If a resource is noncompliant, this action returns the number of Config rules that the resource does not comply with.
    
     A resource is compliant if it complies with all the Config rules that evaluate it. It is noncompliant if it does not comply with one or more of these rules.
     
      If Config has no current evaluation results for the resource, it returns [INSUFFICIENT_DATA]. This result might indicate one of the following conditions about the rules that evaluate the resource:
      
       {ul
            {- Config has never invoked an evaluation for the rule. To check whether it has, use the [DescribeConfigRuleEvaluationStatus] action to get the [LastSuccessfulInvocationTime] and [LastFailedInvocationTime].
               
               }
             {- The rule's Lambda function is failing to send evaluation results to Config. Verify that the role that you assigned to your configuration recorder includes the [config:PutEvaluations] permission. If the rule is a custom rule, verify that the Lambda execution role includes the [config:PutEvaluations] permission.
                
                }
             {- The rule's Lambda function has returned [NOT_APPLICABLE] for all evaluation results. This can occur if the resources were deleted or removed from the rule's scope.
                
                }
            
      }
       *)

  
end

module DescribeConfigRuleEvaluationStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_config_rule_evaluation_status_request ->
        (describe_config_rule_evaluation_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** 
    Returns status information for each of your Config managed rules. The status includes information such as the last time Config invoked the rule, the last time Config failed to invoke the rule, and the related error for the last failure.
     *)

  
end

module DescribeConfigRules : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_config_rules_request ->
        (describe_config_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** 
    Returns details about your Config rules.
     *)

  
end

module DescribeConfigurationAggregators : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_aggregators_request ->
        (describe_configuration_aggregators_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            
        ]
      ) result
  (** 
    Returns the details of one or more configuration aggregators. If the configuration aggregator is not specified, this action returns the details for all the configuration aggregators associated with the account.
     *)

  
end

module DescribeConfigurationAggregatorSourcesStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_aggregator_sources_status_request ->
        (describe_configuration_aggregator_sources_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            
        ]
      ) result
  (** 
    Returns status information for sources within an aggregator. The status includes information about the last time Config verified authorization between the source account and an aggregator account. In case of a failure, the status contains the related error code or message.
     *)

  
end

module DescribeConfigurationRecorders : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_recorders_request ->
        (describe_configuration_recorders_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
            
        ]
      ) result
  (** 
    Returns the details for the specified configuration recorders. If the configuration recorder is not specified, this action returns the details for all configuration recorders associated with the account.
    
     You can specify only one configuration recorder for each Amazon Web Services Region for each account.
     
      *)

  
end

module DescribeConfigurationRecorderStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_configuration_recorder_status_request ->
        (describe_configuration_recorder_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
            
        ]
      ) result
  (** 
    Returns the current status of the specified configuration recorder as well as the status of the last recording event for the recorder. If a configuration recorder is not specified, this action returns the status of all configuration recorders associated with the account.
    
     >You can specify only one configuration recorder for each Amazon Web Services Region for each account. For a detailed status of recording events over time, add your Config events to Amazon CloudWatch metrics and use CloudWatch metrics.
     
      *)

  
end

module DescribeConformancePackCompliance : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conformance_pack_compliance_request ->
        (describe_conformance_pack_compliance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleInConformancePackException of no_such_config_rule_in_conformance_pack_exception
            | `NoSuchConformancePackException of no_such_conformance_pack_exception
            
        ]
      ) result
  (** 
    Returns compliance details for each rule in that conformance pack.
    
     You must provide exact rule names.
     
      *)

  
end

module DescribeConformancePacks : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conformance_packs_request ->
        (describe_conformance_packs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConformancePackException of no_such_conformance_pack_exception
            
        ]
      ) result
  (** 
    Returns a list of one or more conformance packs.
     *)

  
end

module DescribeConformancePackStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conformance_pack_status_request ->
        (describe_conformance_pack_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Provides one or more conformance packs deployment status.
    
     If there are no conformance packs then you will see an empty result.
     
      *)

  
end

module DescribeDeliveryChannels : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_delivery_channels_request ->
        (describe_delivery_channels_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception
            
        ]
      ) result
  (** 
    Returns details about the specified delivery channel. If a delivery channel is not specified, this action returns the details of all delivery channels associated with the account.
    
     Currently, you can specify only one delivery channel per region in your account.
     
      *)

  
end

module DescribeDeliveryChannelStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_delivery_channel_status_request ->
        (describe_delivery_channel_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception
            
        ]
      ) result
  (** 
    Returns the current status of the specified delivery channel. If a delivery channel is not specified, this action returns the current status of all delivery channels associated with the account.
    
     Currently, you can specify only one delivery channel per region in your account.
     
      *)

  
end

module DescribeOrganizationConfigRules : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_config_rules_request ->
        (describe_organization_config_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** 
    Returns a list of organization Config rules.
    
     When you specify the limit and the next token, you receive a paginated response.
     
      Limit and next token are not applicable if you specify organization Config rule names. It is only applicable, when you request all the organization Config rules.
      
       {i For accounts within an organization}
       
        If you deploy an organizational rule or conformance pack in an organization administrator account, and then establish a delegated administrator and deploy an organizational rule or conformance pack in the delegated administrator account, you won't be able to see the organizational rule or conformance pack in the organization administrator account from the delegated administrator account or see the organizational rule or conformance pack in the delegated administrator account from organization administrator account. The [DescribeOrganizationConfigRules] and [DescribeOrganizationConformancePacks] APIs can only see and interact with the organization-related resource that were deployed from within the account calling those APIs.
        
         *)

  
end

module DescribeOrganizationConfigRuleStatuses : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_config_rule_statuses_request ->
        (describe_organization_config_rule_statuses_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** 
    Provides organization Config rule deployment status for an organization.
    
     The status is not considered successful until organization Config rule is successfully deployed in all the member accounts with an exception of excluded accounts.
     
      When you specify the limit and the next token, you receive a paginated response. Limit and next token are not applicable if you specify organization Config rule names. It is only applicable, when you request all the organization Config rules.
      
       *)

  
end

module DescribeOrganizationConformancePacks : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_conformance_packs_request ->
        (describe_organization_conformance_packs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConformancePackException of no_such_organization_conformance_pack_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** 
    Returns a list of organization conformance packs.
    
     When you specify the limit and the next token, you receive a paginated response.
     
      Limit and next token are not applicable if you specify organization conformance packs names. They are only applicable, when you request all the organization conformance packs.
      
       {i For accounts within an organization}
       
        If you deploy an organizational rule or conformance pack in an organization administrator account, and then establish a delegated administrator and deploy an organizational rule or conformance pack in the delegated administrator account, you won't be able to see the organizational rule or conformance pack in the organization administrator account from the delegated administrator account or see the organizational rule or conformance pack in the delegated administrator account from organization administrator account. The [DescribeOrganizationConfigRules] and [DescribeOrganizationConformancePacks] APIs can only see and interact with the organization-related resource that were deployed from within the account calling those APIs.
        
         *)

  
end

module DescribeOrganizationConformancePackStatuses : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_conformance_pack_statuses_request ->
        (describe_organization_conformance_pack_statuses_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConformancePackException of no_such_organization_conformance_pack_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** 
    Provides organization conformance pack deployment status for an organization.
    
     The status is not considered successful until organization conformance pack is successfully deployed in all the member accounts with an exception of excluded accounts.
     
      When you specify the limit and the next token, you receive a paginated response. Limit and next token are not applicable if you specify organization conformance pack names. They are only applicable, when you request all the organization conformance packs.
      
       *)

  
end

module DescribePendingAggregationRequests : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_pending_aggregation_requests_request ->
        (describe_pending_aggregation_requests_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Returns a list of all pending aggregation requests.
     *)

  
end

module DescribeRemediationConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_remediation_configurations_request ->
        (describe_remediation_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** 
    Returns the details of one or more remediation configurations.
     *)

  
end

module DescribeRemediationExceptions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_remediation_exceptions_request ->
        (describe_remediation_exceptions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Returns the details of one or more remediation exceptions. A detailed view of a remediation exception for a set of resources that includes an explanation of an exception and the time when the exception will be deleted. When you specify the limit and the next token, you receive a paginated response.
    
     Config generates a remediation exception when a problem occurs executing a remediation action to a specific resource. Remediation exceptions blocks auto-remediation until the exception is cleared.
     
      When you specify the limit and the next token, you receive a paginated response.
      
       Limit and next token are not applicable if you request resources in batch. It is only applicable, when you request all resources.
       
        *)

  
end

module DescribeRemediationExecutionStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_remediation_execution_status_request ->
        (describe_remediation_execution_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchRemediationConfigurationException of no_such_remediation_configuration_exception
            
        ]
      ) result
  (** 
    Provides a detailed view of a Remediation Execution for a set of resources including state, timestamps for when steps for the remediation execution occur, and any error messages for steps that have failed. When you specify the limit and the next token, you receive a paginated response.
     *)

  
end

module DescribeRetentionConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_retention_configurations_request ->
        (describe_retention_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchRetentionConfigurationException of no_such_retention_configuration_exception
            
        ]
      ) result
  (** 
    Returns the details of one or more retention configurations. If the retention configuration name is not specified, this action returns the details for all the retention configurations for that account.
    
     Currently, Config supports only one retention configuration per region in your account.
     
      *)

  
end

module GetAggregateComplianceDetailsByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_compliance_details_by_config_rule_request ->
        (get_aggregate_compliance_details_by_config_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns the evaluation results for the specified Config rule for a specific resource in a rule. The results indicate which Amazon Web Services resources were evaluated by the rule, when each resource was last evaluated, and whether each resource complies with the rule.
    
     The results can return an empty result page. But if you have a [nextToken], the results are displayed on the next page.
     
      *)

  
end

module GetAggregateConfigRuleComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_config_rule_compliance_summary_request ->
        (get_aggregate_config_rule_compliance_summary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns the number of compliant and noncompliant rules for one or more accounts and regions in an aggregator.
    
     The results can return an empty result page, but if you have a nextToken, the results are displayed on the next page.
     
      *)

  
end

module GetAggregateConformancePackComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_conformance_pack_compliance_summary_request ->
        (get_aggregate_conformance_pack_compliance_summary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns the count of compliant and noncompliant conformance packs across all Amazon Web Services accounts and Amazon Web Services Regions in an aggregator. You can filter based on Amazon Web Services account ID or Amazon Web Services Region.
    
     The results can return an empty result page, but if you have a nextToken, the results are displayed on the next page.
     
      *)

  
end

module GetAggregateDiscoveredResourceCounts : sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_discovered_resource_counts_request ->
        (get_aggregate_discovered_resource_counts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns the resource counts across accounts and regions that are present in your Config aggregator. You can request the resource counts by providing filters and GroupByKey.
    
     For example, if the input contains accountID 12345678910 and region us-east-1 in filters, the API returns the count of resources in account ID 12345678910 and region us-east-1. If the input contains ACCOUNT_ID as a GroupByKey, the API returns resource counts for all source accounts that are present in your aggregator.
      *)

  
end

module GetAggregateResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      get_aggregate_resource_config_request ->
        (get_aggregate_resource_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `OversizedConfigurationItemException of oversized_configuration_item_exception
            | `ResourceNotDiscoveredException of resource_not_discovered_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns configuration item that is aggregated for your specific resource in a specific source account and region.
     *)

  
end

module GetComplianceDetailsByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_details_by_config_rule_request ->
        (get_compliance_details_by_config_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** 
    Returns the evaluation results for the specified Config rule. The results indicate which Amazon Web Services resources were evaluated by the rule, when each resource was last evaluated, and whether each resource complies with the rule.
     *)

  
end

module GetComplianceDetailsByResource : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_details_by_resource_request ->
        (get_compliance_details_by_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Returns the evaluation results for the specified Amazon Web Services resource. The results indicate which Config rules were used to evaluate the resource, when each rule was last invoked, and whether the resource complies with each rule.
     *)

  
end

module GetComplianceSummaryByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_compliance_summary_by_config_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
  (** 
    Returns the number of Config rules that are compliant and noncompliant, up to a maximum of 25 for each.
     *)

  
end

module GetComplianceSummaryByResourceType : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_summary_by_resource_type_request ->
        (get_compliance_summary_by_resource_type_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Returns the number of resources that are compliant and the number that are noncompliant. You can specify one or more resource types to get these numbers for each resource type. The maximum number returned is 100.
     *)

  
end

module GetConformancePackComplianceDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_conformance_pack_compliance_details_request ->
        (get_conformance_pack_compliance_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleInConformancePackException of no_such_config_rule_in_conformance_pack_exception
            | `NoSuchConformancePackException of no_such_conformance_pack_exception
            
        ]
      ) result
  (** 
    Returns compliance details of a conformance pack for all Amazon Web Services resources that are monitered by conformance pack.
     *)

  
end

module GetConformancePackComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_conformance_pack_compliance_summary_request ->
        (get_conformance_pack_compliance_summary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConformancePackException of no_such_conformance_pack_exception
            
        ]
      ) result
  (** 
    Returns compliance details for the conformance pack based on the cumulative compliance results of all the rules in that conformance pack.
     *)

  
end

module GetCustomRulePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_custom_rule_policy_request ->
        (get_custom_rule_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** 
    Returns the policy definition containing the logic for your Config Custom Policy rule.
     *)

  
end

module GetDiscoveredResourceCounts : sig
  val request :
    Smaws_Lib.Context.t ->
      get_discovered_resource_counts_request ->
        (get_discovered_resource_counts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns the resource types, the number of each resource type, and the total number of resources that Config is recording in this region for your Amazon Web Services account.
    
     {b Example}
     
      {ol
           {- Config is recording three resource types in the US East (Ohio) Region for your account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets.
              
              }
            {- You make a call to the [GetDiscoveredResourceCounts] action and specify that you want all resource types.
               
               }
            {- Config returns the following:
               
                {ul
                     {- The resource types (EC2 instances, IAM users, and S3 buckets).
                        
                        }
                      {- The number of each resource type (25, 20, and 15).
                         
                         }
                      {- The total number of all resources (60).
                         
                         }
                     
             }
             }
           
      }
       The response is paginated. By default, Config lists 100 [ResourceCount] objects on each page. You can customize this number with the [limit] parameter. The response includes a [nextToken] string. To get the next page of results, run the request again and specify the string for the [nextToken] parameter.
       
        If you make a call to the [GetDiscoveredResourceCounts] action, you might not immediately receive resource counts in the following situations:
        
         {ul
              {- You are a new Config customer.
                 
                 }
               {- You just enabled resource recording.
                  
                  }
              
      }
       It might take a few minutes for Config to record and count your resources. Wait a few minutes and then retry the [GetDiscoveredResourceCounts] action.
       
        *)

  
end

module GetOrganizationConfigRuleDetailedStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_organization_config_rule_detailed_status_request ->
        (get_organization_config_rule_detailed_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** 
    Returns detailed status for each member account within an organization for a given organization Config rule.
     *)

  
end

module GetOrganizationConformancePackDetailedStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_organization_conformance_pack_detailed_status_request ->
        (get_organization_conformance_pack_detailed_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchOrganizationConformancePackException of no_such_organization_conformance_pack_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** 
    Returns detailed status for each member account within an organization for a given organization conformance pack.
     *)

  
end

module GetOrganizationCustomRulePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_organization_custom_rule_policy_request ->
        (get_organization_custom_rule_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            
        ]
      ) result
  (** 
    Returns the policy definition containing the logic for your organization Config Custom Policy rule.
     *)

  
end

module GetResourceConfigHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_config_history_request ->
        (get_resource_config_history_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidTimeRangeException of invalid_time_range_exception
            | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `ResourceNotDiscoveredException of resource_not_discovered_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    For accurate reporting on the compliance status, you must record the [AWS::Config::ResourceCompliance] resource type. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html}Selecting Which Resources Config Records}.
    
     Returns a list of [ConfigurationItems] for the specified resource. The list contains details about each state of the resource during the specified time interval. If you specified a retention period to retain your [ConfigurationItems] between a minimum of 30 days and a maximum of 7 years (2557 days), Config returns the [ConfigurationItems] for the specified retention period.
     
      The response is paginated. By default, Config returns a limit of 10 configuration items per page. You can customize this number with the [limit] parameter. The response includes a [nextToken] string. To get the next page of results, run the request again and specify the string for the [nextToken] parameter.
      
       Each call to the API is limited to span a duration of seven days. It is likely that the number of records returned is smaller than the specified [limit]. In such cases, you can make another call, using the [nextToken].
       
        *)

  
end

module GetResourceEvaluationSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_evaluation_summary_request ->
        (get_resource_evaluation_summary_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns a summary of resource evaluation for the specified resource evaluation ID from the proactive rules that were run. The results indicate which evaluation context was used to evaluate the rules, which resource details were evaluated, the evaluation mode that was run, and whether the resource details comply with the configuration of the proactive rules.
    
     To see additional information about the evaluation result, such as which rule flagged a resource as NON_COMPLIANT, use the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetComplianceDetailsByResource.html}GetComplianceDetailsByResource} API. For more information, see the {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetResourceEvaluationSummary.html#API_GetResourceEvaluationSummary_Examples}Examples} section.
     
      *)

  
end

module GetStoredQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      get_stored_query_request ->
        (get_stored_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Returns the details of a specific stored query.
     *)

  
end

module ListAggregateDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_aggregate_discovered_resources_request ->
        (list_aggregate_discovered_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Accepts a resource type and returns a list of resource identifiers that are aggregated for a specific resource type across accounts and regions. A resource identifier includes the resource type, ID, (if available) the custom resource name, source account, and source region. You can narrow the results to include only resources that have specific resource IDs, or a resource name, or source account ID, or source region.
    
     For example, if the input consists of accountID 12345678910 and the region is us-east-1 for resource type [AWS::EC2::Instance] then the API returns all the EC2 instance identifiers of accountID 12345678910 and region us-east-1.
      *)

  
end

module ListConformancePackComplianceScores : sig
  val request :
    Smaws_Lib.Context.t ->
      list_conformance_pack_compliance_scores_request ->
        (list_conformance_pack_compliance_scores_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Returns a list of conformance pack compliance scores. A compliance score is the percentage of the number of compliant rule-resource combinations in a conformance pack compared to the number of total possible rule-resource combinations in the conformance pack. This metric provides you with a high-level view of the compliance state of your conformance packs. You can use it to identify, investigate, and understand the level of compliance in your conformance packs.
    
     Conformance packs with no evaluation results will have a compliance score of [INSUFFICIENT_DATA].
     
      *)

  
end

module ListDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_discovered_resources_request ->
        (list_discovered_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Accepts a resource type and returns a list of resource identifiers for the resources of that type. A resource identifier includes the resource type, ID, and (if available) the custom resource name. The results consist of resources that Config has discovered, including those that Config is not currently recording. You can narrow the results to include only resources that have specific resource IDs or a resource name.
    
     You can specify either resource IDs or a resource name, but not both, in the same request.
     
      The response is paginated. By default, Config lists 100 resource identifiers on each page. You can customize this number with the [limit] parameter. The response includes a [nextToken] string. To get the next page of results, run the request again and specify the string for the [nextToken] parameter.
       *)

  
end

module ListResourceEvaluations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_evaluations_request ->
        (list_resource_evaluations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `InvalidTimeRangeException of invalid_time_range_exception
            
        ]
      ) result
  (** 
    Returns a list of proactive resource evaluations.
     *)

  
end

module ListStoredQueries : sig
  val request :
    Smaws_Lib.Context.t ->
      list_stored_queries_request ->
        (list_stored_queries_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Lists the stored queries for a single Amazon Web Services account and a single Amazon Web Services Region. The default is 100.
     *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    List the tags for Config resource.
     *)

  
end

module PutAggregationAuthorization : sig
  val request :
    Smaws_Lib.Context.t ->
      put_aggregation_authorization_request ->
        (put_aggregation_authorization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Authorizes the aggregator account and region to collect data from the source account and region.
    
     [PutAggregationAuthorization] is an idempotent API. Subsequent requests won’t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.
     
      *)

  
end

module PutConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_config_rule_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `MaxNumberOfConfigRulesExceededException of max_number_of_config_rules_exceeded_exception
            | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** 
    Adds or updates an Config rule to evaluate if your Amazon Web Services resources comply with your desired configurations. For information on how many Config rules you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html}{b Service Limits}} in the {i Config Developer Guide}.
    
     There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}. You can use [PutConfigRule] to create both Config Managed Rules and Config Custom Rules.
     
      Config Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}. If you are adding an Config managed rule, you must specify the rule's identifier for the [SourceIdentifier] key.
      
       Config Custom Rules are rules that you create from scratch. There are two ways to create Config custom rules: with Lambda functions ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function}Lambda Developer Guide}) and with Guard ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a policy-as-code language. Config custom rules created with Lambda are called {i Config Custom Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy Rules}.
       
        If you are adding a new Config Custom Lambda rule, you first need to create an Lambda function that the rule invokes to evaluate your resources. When you use [PutConfigRule] to add a Custom Lambda rule to Config, you must specify the Amazon Resource Name (ARN) that Lambda assigns to the function. You specify the ARN in the [SourceIdentifier] key. This key is part of the [Source] object, which is part of the [ConfigRule] object.
        
         For any new Config rule that you add, specify the [ConfigRuleName] in the [ConfigRule] object. Do not specify the [ConfigRuleArn] or the [ConfigRuleId]. These values are generated by Config for new rules.
         
          If you are updating a rule that you added previously, you can specify the rule by [ConfigRuleName], [ConfigRuleId], or [ConfigRuleArn] in the [ConfigRule] data type that you use in this request.
          
           For more information about developing and using Config rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html}Evaluating Resources with Config Rules} in the {i Config Developer Guide}.
           
            [PutConfigRule] is an idempotent API. Subsequent requests won’t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.
            
             *)

  
end

module PutConfigurationAggregator : sig
  val request :
    Smaws_Lib.Context.t ->
      put_configuration_aggregator_request ->
        (put_configuration_aggregator_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `InvalidRoleException of invalid_role_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NoAvailableOrganizationException of no_available_organization_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            | `OrganizationAllFeaturesNotEnabledException of organization_all_features_not_enabled_exception
            
        ]
      ) result
  (** 
    Creates and updates the configuration aggregator with the selected source accounts and regions. The source account can be individual account(s) or an organization.
    
     [accountIds] that are passed will be replaced with existing accounts. If you want to add additional accounts into the aggregator, call [DescribeConfigurationAggregators] to get the previous accounts and then append new ones.
     
      Config should be enabled in source accounts and regions you want to aggregate.
      
       If your source type is an organization, you must be signed in to the management account or a registered delegated administrator and all the features must be enabled in your organization. If the caller is a management account, Config calls [EnableAwsServiceAccess] API to enable integration between Config and Organizations. If the caller is a registered delegated administrator, Config calls [ListDelegatedAdministrators] API to verify whether the caller is a valid delegated administrator.
       
        To register a delegated administrator, see {{:https://docs.aws.amazon.com/config/latest/developerguide/set-up-aggregator-cli.html#register-a-delegated-administrator-cli}Register a Delegated Administrator} in the {i Config developer guide}.
        
         [PutConfigurationAggregator] is an idempotent API. Subsequent requests won’t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.
         
          *)

  
end

module PutConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
      put_configuration_recorder_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidConfigurationRecorderNameException of invalid_configuration_recorder_name_exception
            | `InvalidRecordingGroupException of invalid_recording_group_exception
            | `InvalidRoleException of invalid_role_exception
            | `MaxNumberOfConfigurationRecordersExceededException of max_number_of_configuration_recorders_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Creates a new configuration recorder to record configuration changes for specified resource types.
    
     You can also use this action to change the [roleARN] or the [recordingGroup] of an existing recorder. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html}{b Managing the Configuration Recorder}} in the {i Config Developer Guide}.
     
      You can specify only one configuration recorder for each Amazon Web Services Region for each account.
      
       If the configuration recorder does not have the [recordingGroup] field specified, the default is to record all supported resource types.
       
        *)

  
end

module PutConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
      put_conformance_pack_request ->
        (put_conformance_pack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConformancePackTemplateValidationException of conformance_pack_template_validation_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `MaxNumberOfConformancePacksExceededException of max_number_of_conformance_packs_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** 
    Creates or updates a conformance pack. A conformance pack is a collection of Config rules that can be easily deployed in an account and a region and across an organization. For information on how many conformance packs you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html}{b Service Limits}} in the {i Config Developer Guide}.
    
     This API creates a service-linked role [AWSServiceRoleForConfigConforms] in your account. The service-linked role is created only when the role does not exist in your account.
     
      You must specify only one of the follow parameters: [TemplateS3Uri], [TemplateBody] or [TemplateSSMDocumentDetails].
      
       *)

  
end

module PutDeliveryChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      put_delivery_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientDeliveryPolicyException of insufficient_delivery_policy_exception
            | `InvalidDeliveryChannelNameException of invalid_delivery_channel_name_exception
            | `InvalidS3KeyPrefixException of invalid_s3_key_prefix_exception
            | `InvalidS3KmsKeyArnException of invalid_s3_kms_key_arn_exception
            | `InvalidSNSTopicARNException of invalid_sns_topic_arn_exception
            | `MaxNumberOfDeliveryChannelsExceededException of max_number_of_delivery_channels_exceeded_exception
            | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
            | `NoSuchBucketException of no_such_bucket_exception
            
        ]
      ) result
  (** 
    Creates a delivery channel object to deliver configuration information and other compliance information to an Amazon S3 bucket and Amazon SNS topic. For more information, see {{:https://docs.aws.amazon.com/config/latest/developerguide/notifications-for-AWS-Config.html}Notifications that Config Sends to an Amazon SNS topic}.
    
     Before you can create a delivery channel, you must create a configuration recorder.
     
      You can use this action to change the Amazon S3 bucket or an Amazon SNS topic of the existing delivery channel. To change the Amazon S3 bucket or an Amazon SNS topic, call this action and specify the changed values for the S3 bucket and the SNS topic. If you specify a different value for either the S3 bucket or the SNS topic, this action will keep the existing value for the parameter that is not changed.
      
       You can have only one delivery channel per region in your account.
       
        *)

  
end

module PutEvaluations : sig
  val request :
    Smaws_Lib.Context.t ->
      put_evaluations_request ->
        (put_evaluations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `InvalidResultTokenException of invalid_result_token_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** 
    Used by an Lambda function to deliver evaluation results to Config. This action is required in every Lambda function that is invoked by an Config rule.
     *)

  
end

module PutExternalEvaluation : sig
  val request :
    Smaws_Lib.Context.t ->
      put_external_evaluation_request ->
        (put_external_evaluation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            
        ]
      ) result
  (** 
    Add or updates the evaluations for process checks. This API checks if the rule is a process check when the name of the Config rule is provided.
     *)

  
end

module PutOrganizationConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_organization_config_rule_request ->
        (put_organization_config_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `MaxNumberOfOrganizationConfigRulesExceededException of max_number_of_organization_config_rules_exceeded_exception
            | `NoAvailableOrganizationException of no_available_organization_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            | `OrganizationAllFeaturesNotEnabledException of organization_all_features_not_enabled_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Adds or updates an Config rule for your entire organization to evaluate if your Amazon Web Services resources comply with your desired configurations. For information on how many organization Config rules you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html}{b Service Limits}} in the {i Config Developer Guide}.
    
     Only a management account and a delegated administrator can create or update an organization Config rule. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added. An organization can have up to 3 delegated administrators.
     
      This API enables organization service access through the [EnableAWSServiceAccess] action and creates a service-linked role [AWSServiceRoleForConfigMultiAccountSetup] in the management or delegated administrator account of your organization. The service-linked role is created only when the role does not exist in the caller account. Config verifies the existence of role with [GetRole] action.
      
       To use this API with delegated administrator, register a delegated administrator by calling Amazon Web Services Organization [register-delegated-administrator] for [config-multiaccountsetup.amazonaws.com].
       
        There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}. You can use [PutOrganizationConfigRule] to create both Config Managed Rules and Config Custom Rules.
        
         Config Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List of Config Managed Rules}. If you are adding an Config managed rule, you must specify the rule's identifier for the [RuleIdentifier] key.
         
          Config Custom Rules are rules that you create from scratch. There are two ways to create Config custom rules: with Lambda functions ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function}Lambda Developer Guide}) and with Guard ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a policy-as-code language. Config custom rules created with Lambda are called {i Config Custom Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy Rules}.
          
           If you are adding a new Config Custom Lambda rule, you first need to create an Lambda function in the management account or a delegated administrator that the rule invokes to evaluate your resources. You also need to create an IAM role in the managed account that can be assumed by the Lambda function. When you use [PutOrganizationConfigRule] to add a Custom Lambda rule to Config, you must specify the Amazon Resource Name (ARN) that Lambda assigns to the function.
           
            Prerequisite: Ensure you call [EnableAllFeatures] API to enable all features in an organization.
            
             Make sure to specify one of either [OrganizationCustomPolicyRuleMetadata] for Custom Policy rules, [OrganizationCustomRuleMetadata] for Custom Lambda rules, or [OrganizationManagedRuleMetadata] for managed rules.
             
              *)

  
end

module PutOrganizationConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
      put_organization_conformance_pack_request ->
        (put_organization_conformance_pack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `MaxNumberOfOrganizationConformancePacksExceededException of max_number_of_organization_conformance_packs_exceeded_exception
            | `NoAvailableOrganizationException of no_available_organization_exception
            | `OrganizationAccessDeniedException of organization_access_denied_exception
            | `OrganizationAllFeaturesNotEnabledException of organization_all_features_not_enabled_exception
            | `OrganizationConformancePackTemplateValidationException of organization_conformance_pack_template_validation_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Deploys conformance packs across member accounts in an Amazon Web Services Organization. For information on how many organization conformance packs and how many Config rules you can have per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html}{b Service Limits}} in the {i Config Developer Guide}.
    
     Only a management account and a delegated administrator can call this API. When calling this API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] permissions are added. An organization can have up to 3 delegated administrators.
     
      This API enables organization service access for [config-multiaccountsetup.amazonaws.com] through the [EnableAWSServiceAccess] action and creates a service-linked role [AWSServiceRoleForConfigMultiAccountSetup] in the management or delegated administrator account of your organization. The service-linked role is created only when the role does not exist in the caller account. To use this API with delegated administrator, register a delegated administrator by calling Amazon Web Services Organization [register-delegate-admin] for [config-multiaccountsetup.amazonaws.com].
      
       Prerequisite: Ensure you call [EnableAllFeatures] API to enable all features in an organization.
       
        You must specify either the [TemplateS3Uri] or the [TemplateBody] parameter, but not both. If you provide both Config uses the [TemplateS3Uri] parameter and ignores the [TemplateBody] parameter.
        
         Config sets the state of a conformance pack to CREATE_IN_PROGRESS and UPDATE_IN_PROGRESS until the conformance pack is created or updated. You cannot update a conformance pack while it is in this state.
         
          *)

  
end

module PutRemediationConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      put_remediation_configurations_request ->
        (put_remediation_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    Adds or updates the remediation configuration with a specific Config rule with the selected target or action. The API creates the [RemediationConfiguration] object for the Config rule. The Config rule must already exist for you to add a remediation configuration. The target (SSM document) must exist and have permissions to use the target.
    
     {b Be aware of backward incompatible changes}
     
      If you make backward incompatible changes to the SSM document, you must call this again to ensure the remediations can run.
      
       This API does not support adding remediation configurations for service-linked Config Rules such as Organization Config rules, the rules deployed by conformance packs, and rules deployed by Amazon Web Services Security Hub.
       
        {b Required fields}
        
         For manual remediation configuration, you need to provide a value for [automationAssumeRole] or use a value in the [assumeRole]field to remediate your resources. The SSM automation document can use either as long as it maps to a valid parameter.
         
          However, for automatic remediation configuration, the only valid [assumeRole] field value is [AutomationAssumeRole] and you need to provide a value for [AutomationAssumeRole] to remediate your resources.
          
           {b Auto remediation can be initiated even for compliant resources}
           
            If you enable auto remediation for a specific Config rule using the {{:https://docs.aws.amazon.com/config/latest/APIReference/emAPI_PutRemediationConfigurations.html}PutRemediationConfigurations} API or the Config console, it initiates the remediation process for all non-compliant resources for that specific rule. The auto remediation process relies on the compliance data snapshot which is captured on a periodic basis. Any non-compliant resource that is updated between the snapshot schedule will continue to be remediated based on the last known compliance data snapshot.
            
             This means that in some cases auto remediation can be initiated even for compliant resources, since the bootstrap processor uses a database that can have stale evaluation results based on the last known compliance data snapshot.
             
              *)

  
end

module PutRemediationExceptions : sig
  val request :
    Smaws_Lib.Context.t ->
      put_remediation_exceptions_request ->
        (put_remediation_exceptions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  (** 
    A remediation exception is when a specified resource is no longer considered for auto-remediation. This API adds a new exception or updates an existing exception for a specified resource with a specified Config rule.
    
     {b Exceptions block auto remediation}
     
      Config generates a remediation exception when a problem occurs running a remediation action for a specified resource. Remediation exceptions blocks auto-remediation until the exception is cleared.
      
       {b Manual remediation is recommended when placing an exception}
       
        When placing an exception on an Amazon Web Services resource, it is recommended that remediation is set as manual remediation until the given Config rule for the specified resource evaluates the resource as [NON_COMPLIANT]. Once the resource has been evaluated as [NON_COMPLIANT], you can add remediation exceptions and change the remediation type back from Manual to Auto if you want to use auto-remediation. Otherwise, using auto-remediation before a [NON_COMPLIANT] evaluation result can delete resources before the exception is applied.
        
         {b Exceptions can only be performed on non-compliant resources}
         
          Placing an exception can only be performed on resources that are [NON_COMPLIANT]. If you use this API for [COMPLIANT] resources or resources that are [NOT_APPLICABLE], a remediation exception will not be generated. For more information on the conditions that initiate the possible Config evaluation results, see {{:https://docs.aws.amazon.com/config/latest/developerguide/config-concepts.html#aws-config-rules}Concepts | Config Rules} in the {i Config Developer Guide}.
          
           {b Auto remediation can be initiated even for compliant resources}
           
            If you enable auto remediation for a specific Config rule using the {{:https://docs.aws.amazon.com/config/latest/APIReference/emAPI_PutRemediationConfigurations.html}PutRemediationConfigurations} API or the Config console, it initiates the remediation process for all non-compliant resources for that specific rule. The auto remediation process relies on the compliance data snapshot which is captured on a periodic basis. Any non-compliant resource that is updated between the snapshot schedule will continue to be remediated based on the last known compliance data snapshot.
            
             This means that in some cases auto remediation can be initiated even for compliant resources, since the bootstrap processor uses a database that can have stale evaluation results based on the last known compliance data snapshot.
             
              *)

  
end

module PutResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_config_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `MaxActiveResourcesExceededException of max_active_resources_exceeded_exception
            | `NoRunningConfigurationRecorderException of no_running_configuration_recorder_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Records the configuration state for the resource provided in the request. The configuration state of a resource is represented in Config as Configuration Items. Once this API records the configuration item, you can retrieve the list of configuration items for the custom resource type using existing Config APIs.
    
     The custom resource type must be registered with CloudFormation. This API accepts the configuration item registered with CloudFormation.
     
      When you call this API, Config only stores configuration state of the resource provided in the request. This API does not change or remediate the configuration of the resource.
      
       Write-only schema properites are not recorded as part of the published configuration item.
       
        *)

  
end

module PutRetentionConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_retention_configuration_request ->
        (put_retention_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `MaxNumberOfRetentionConfigurationsExceededException of max_number_of_retention_configurations_exceeded_exception
            
        ]
      ) result
  (** 
    Creates and updates the retention configuration with details about retention period (number of days) that Config stores your historical information. The API creates the [RetentionConfiguration] object and names the object as {b default}. When you have a [RetentionConfiguration] object named {b default}, calling the API modifies the default object.
    
     Currently, Config supports only one retention configuration per region in your account.
     
      *)

  
end

module PutStoredQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      put_stored_query_request ->
        (put_stored_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceConcurrentModificationException of resource_concurrent_modification_exception
            | `TooManyTagsException of too_many_tags_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Saves a new query or updates an existing saved query. The [QueryName] must be unique for a single Amazon Web Services account and a single Amazon Web Services Region. You can create upto 300 queries in a single Amazon Web Services account and a single Amazon Web Services Region.
    
     [PutStoredQuery] is an idempotent API. Subsequent requests won’t create a duplicate resource if one was already created. If a following request has different [tags] values, Config will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.
     
      *)

  
end

module SelectAggregateResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      select_aggregate_resource_config_request ->
        (select_aggregate_resource_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidExpressionException of invalid_expression_exception
            | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
            
        ]
      ) result
  [@@ocaml.doc {| 
    Accepts a structured query language (SQL) SELECT command and an aggregator to query configuration state of Amazon Web Services resources across multiple accounts and regions, performs the corresponding search, and returns resource configurations matching the properties.
    
     For more information about query components, see the {{:https://docs.aws.amazon.com/config/latest/developerguide/query-components.html}{b Query Components}} section in the {i Config Developer Guide}.
     
      If you run an aggregation query (i.e., using [GROUP BY] or using aggregate functions such as [COUNT]; e.g., [SELECT resourceId, COUNT(*) WHERE resourceType = 'AWS::IAM::Role' GROUP BY resourceId]) and do not specify the [MaxResults] or the [Limit] query parameters, the default page size is set to 500.
      
       If you run a non-aggregation query (i.e., not using [GROUP BY] or aggregate function; e.g., [SELECT * WHERE resourceType = 'AWS::IAM::Role']) and do not specify the [MaxResults] or the [Limit] query parameters, the default page size is set to 25.
       
        |}]

  
end

module SelectResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      select_resource_config_request ->
        (select_resource_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidExpressionException of invalid_expression_exception
            | `InvalidLimitException of invalid_limit_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            
        ]
      ) result
  (** 
    Accepts a structured query language (SQL) [SELECT] command, performs the corresponding search, and returns resource configurations matching the properties.
    
     For more information about query components, see the {{:https://docs.aws.amazon.com/config/latest/developerguide/query-components.html}{b Query Components}} section in the {i Config Developer Guide}.
      *)

  
end

module StartConfigRulesEvaluation : sig
  val request :
    Smaws_Lib.Context.t ->
      start_config_rules_evaluation_request ->
        (start_config_rules_evaluation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterValueException of invalid_parameter_value_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NoSuchConfigRuleException of no_such_config_rule_exception
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** 
    Runs an on-demand evaluation for the specified Config rules against the last known configuration state of the resources. Use [StartConfigRulesEvaluation] when you want to test that a rule you updated is working as expected. [StartConfigRulesEvaluation] does not re-record the latest configuration state for your resources. It re-runs an evaluation against the last known state of your resources.
    
     You can specify up to 25 Config rules per request.
     
      An existing [StartConfigRulesEvaluation] call for the specified rules must complete before you can call the API again. If you chose to have Config stream to an Amazon SNS topic, you will receive a [ConfigRuleEvaluationStarted] notification when the evaluation starts.
      
       You don't need to call the [StartConfigRulesEvaluation] API to run an evaluation for a new rule. When you create a rule, Config evaluates your resources against the rule automatically.
       
        The [StartConfigRulesEvaluation] API is useful if you want to run on-demand evaluations, such as the following example:
        
         {ol
              {- You have a custom rule that evaluates your IAM resources every 24 hours.
                 
                 }
               {- You update your Lambda function to add additional conditions to your rule.
                  
                  }
               {- Instead of waiting for the next periodic evaluation, you call the [StartConfigRulesEvaluation] API.
                  
                  }
               {- Config invokes your Lambda function and evaluates your IAM resources.
                  
                  }
               {- Your custom rule will still run periodic evaluations every 24 hours.
                  
                  }
              
      }
       *)

  
end

module StartConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
      start_configuration_recorder_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoAvailableDeliveryChannelException of no_available_delivery_channel_exception
            | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
            
        ]
      ) result
  (** 
    Starts recording configurations of the Amazon Web Services resources you have selected to record in your Amazon Web Services account.
    
     You must have created at least one delivery channel to successfully start the configuration recorder.
      *)

  
end

module StartRemediationExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_remediation_execution_request ->
        (start_remediation_execution_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InsufficientPermissionsException of insufficient_permissions_exception
            | `InvalidParameterValueException of invalid_parameter_value_exception
            | `NoSuchRemediationConfigurationException of no_such_remediation_configuration_exception
            
        ]
      ) result
  (** 
    Runs an on-demand remediation for the specified Config rules against the last known remediation configuration. It runs an execution against the current state of your resources. Remediation execution is asynchronous.
    
     You can specify up to 100 resource keys per request. An existing StartRemediationExecution call for the specified resource keys must complete before you can call the API again.
      *)

  
end

module StartResourceEvaluation : sig
  val request :
    Smaws_Lib.Context.t ->
      start_resource_evaluation_request ->
        (start_resource_evaluation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InvalidParameterValueException of invalid_parameter_value_exception
            
        ]
      ) result
  [@@ocaml.doc {| 
    Runs an on-demand evaluation for the specified resource to determine whether the resource details will comply with configured Config rules. You can also use it for evaluation purposes. Config recommends using an evaluation context. It runs an execution against the resource details with all of the Config rules in your account that match with the specified proactive mode and resource type.
    
     Ensure you have the [cloudformation:DescribeType] role setup to validate the resource type schema.
     
      You can find the {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}Resource type schema} in "{i Amazon Web Services public extensions}" within the CloudFormation registry or with the following CLI commmand: [aws cloudformation describe-type --type-name "AWS::S3::Bucket" --type RESOURCE].
      
       For more information, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-view}Managing extensions through the CloudFormation registry} and {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the CloudFormation User Guide.
       
        |}]

  
end

module StopConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_configuration_recorder_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
            
        ]
      ) result
  (** 
    Stops recording configurations of the Amazon Web Services resources you have selected to record in your Amazon Web Services account.
     *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Associates the specified tags to a resource with the specified resourceArn. If existing tags on a resource are not specified in the request parameters, they are not changed. If existing tags are specified, however, then their values will be updated. When a resource is deleted, the tags associated with that resource are deleted as well.
     *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** 
    Deletes specified tags from a resource.
     *)

  
end

