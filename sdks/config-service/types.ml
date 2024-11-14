open Smaws_Lib
let service =
  Service.{
    namespace = "config";
    endpointPrefix = "config";
    version = "2014-11-12";
    protocol = AwsJson_1_1
  };
type validation_exception = {
  message: string option
}

type untag_resource_request = {
  tag_keys: string list;
  resource_arn: string
}

type resource_not_found_exception = {
  message: string option
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

type aggregate_resource_identifier = {
  resource_name: string option;
  resource_type: resource_type;
  resource_id: string;
  source_region: string;
  source_account_id: string
}

type too_many_tags_exception = {
  message: string option
}

type time_window = {
  end_time: float option;
  start_time: float option
}

type template_ssm_document_details = {
  document_version: string option;
  document_name: string
}

type tag = {
  value: string option;
  key: string option
}

type tag_resource_request = {
  tags: tag list;
  resource_arn: string
}

type stored_query_metadata = {
  description: string option;
  query_name: string;
  query_arn: string;
  query_id: string
}

type stored_query = {
  expression: string option;
  description: string option;
  query_name: string;
  query_arn: string option;
  query_id: string option
}

type stop_configuration_recorder_request = {
  configuration_recorder_name: string
}

type no_such_configuration_recorder_exception = {
  message: string option
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

type status_detail_filters = {
  member_account_rule_status: member_account_rule_status option;
  account_id: string option
}

type static_value = {
  values: string list
}

type start_resource_evaluation_response = {
  resource_evaluation_id: string option
}

type resource_configuration_schema_type = | CFN_RESOURCE_SCHEMA

type resource_details = {
  resource_configuration_schema_type: resource_configuration_schema_type option;
  resource_configuration: string;
  resource_type: string;
  resource_id: string
}

type evaluation_context = {
  evaluation_context_identifier: string option
}

type evaluation_mode = | PROACTIVE
  | DETECTIVE

type start_resource_evaluation_request = {
  client_token: string option;
  evaluation_timeout: int option;
  evaluation_mode: evaluation_mode;
  evaluation_context: evaluation_context option;
  resource_details: resource_details
}

type invalid_parameter_value_exception = {
  message: string option
}

type idempotent_parameter_mismatch = {
  message: string option
}

type resource_key = {
  resource_id: string;
  resource_type: resource_type
}

type start_remediation_execution_response = {
  failed_items: resource_key list option;
  failure_message: string option
}

type start_remediation_execution_request = {
  resource_keys: resource_key list;
  config_rule_name: string
}

type no_such_remediation_configuration_exception = {
  message: string option
}

type insufficient_permissions_exception = {
  message: string option
}

type start_configuration_recorder_request = {
  configuration_recorder_name: string
}

type no_available_delivery_channel_exception = {
  message: string option
}

type start_config_rules_evaluation_response = unit

type start_config_rules_evaluation_request = {
  config_rule_names: string list option
}

type resource_in_use_exception = {
  message: string option
}

type no_such_config_rule_exception = {
  message: string option
}

type limit_exceeded_exception = {
  message: string option
}

type invalid_next_token_exception = {
  message: string option
}

type invalid_limit_exception = {
  message: string option
}

type invalid_expression_exception = {
  message: string option
}

type field_info = {
  name: string option
}

type query_info = {
  select_fields: field_info list option
}

type select_resource_config_response = {
  next_token: string option;
  query_info: query_info option;
  results: string list option
}

type select_resource_config_request = {
  next_token: string option;
  limit: int option;
  expression: string
}

type no_such_configuration_aggregator_exception = {
  message: string option
}

type select_aggregate_resource_config_response = {
  next_token: string option;
  query_info: query_info option;
  results: string list option
}

type select_aggregate_resource_config_request = {
  next_token: string option;
  max_results: int option;
  limit: int option;
  configuration_aggregator_name: string;
  expression: string
}

type resource_concurrent_modification_exception = {
  message: string option
}

type put_stored_query_response = {
  query_arn: string option
}

type put_stored_query_request = {
  tags: tag list option;
  stored_query: stored_query
}

type max_number_of_retention_configurations_exceeded_exception = {
  message: string option
}

type retention_configuration = {
  retention_period_in_days: int;
  name: string
}

type put_retention_configuration_response = {
  retention_configuration: retention_configuration option
}

type put_retention_configuration_request = {
  retention_period_in_days: int
}

type no_running_configuration_recorder_exception = {
  message: string option
}

type max_active_resources_exceeded_exception = {
  message: string option
}

type put_resource_config_request = {
  tags: (string * string) list option;
  configuration: string;
  resource_name: string option;
  resource_id: string;
  schema_version_id: string;
  resource_type: string
}

type remediation_exception = {
  expiration_time: float option;
  message: string option;
  resource_id: string;
  resource_type: string;
  config_rule_name: string
}

type failed_remediation_exception_batch = {
  failed_items: remediation_exception list option;
  failure_message: string option
}

type put_remediation_exceptions_response = {
  failed_batches: failed_remediation_exception_batch list option
}

type remediation_exception_resource_key = {
  resource_id: string option;
  resource_type: string option
}

type put_remediation_exceptions_request = {
  expiration_time: float option;
  message: string option;
  resource_keys: remediation_exception_resource_key list;
  config_rule_name: string
}

type remediation_target_type = | SSM_DOCUMENT

type resource_value_type = | RESOURCE_ID

type resource_value = {
  value: resource_value_type
}

type remediation_parameter_value = {
  static_value: static_value option;
  resource_value: resource_value option
}

type ssm_controls = {
  error_percentage: int option;
  concurrent_execution_rate_percentage: int option
}

type execution_controls = {
  ssm_controls: ssm_controls option
}

type remediation_configuration = {
  created_by_service: string option;
  arn: string option;
  retry_attempt_seconds: int option;
  maximum_automatic_attempts: int option;
  execution_controls: execution_controls option;
  automatic: bool option;
  resource_type: string option;
  parameters: (string * remediation_parameter_value) list option;
  target_version: string option;
  target_id: string;
  target_type: remediation_target_type;
  config_rule_name: string
}

type failed_remediation_batch = {
  failed_items: remediation_configuration list option;
  failure_message: string option
}

type put_remediation_configurations_response = {
  failed_batches: failed_remediation_batch list option
}

type put_remediation_configurations_request = {
  remediation_configurations: remediation_configuration list
}

type organization_conformance_pack_template_validation_exception = {
  message: string option
}

type organization_all_features_not_enabled_exception = {
  message: string option
}

type organization_access_denied_exception = {
  message: string option
}

type no_available_organization_exception = {
  message: string option
}

type max_number_of_organization_conformance_packs_exceeded_exception = {
  message: string option
}

type put_organization_conformance_pack_response = {
  organization_conformance_pack_arn: string option
}

type conformance_pack_input_parameter = {
  parameter_value: string;
  parameter_name: string
}

type put_organization_conformance_pack_request = {
  excluded_accounts: string list option;
  conformance_pack_input_parameters: conformance_pack_input_parameter list option;
  delivery_s3_key_prefix: string option;
  delivery_s3_bucket: string option;
  template_body: string option;
  template_s3_uri: string option;
  organization_conformance_pack_name: string
}

type max_number_of_organization_config_rules_exceeded_exception = {
  message: string option
}

type put_organization_config_rule_response = {
  organization_config_rule_arn: string option
}

type maximum_execution_frequency = | TwentyFour_Hours
  | Twelve_Hours
  | Six_Hours
  | Three_Hours
  | One_Hour

type organization_managed_rule_metadata = {
  tag_value_scope: string option;
  tag_key_scope: string option;
  resource_id_scope: string option;
  resource_types_scope: string list option;
  maximum_execution_frequency: maximum_execution_frequency option;
  input_parameters: string option;
  rule_identifier: string;
  description: string option
}

type organization_config_rule_trigger_type = | SCHEDULED_NOTIFICATION
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION

type organization_custom_rule_metadata = {
  tag_value_scope: string option;
  tag_key_scope: string option;
  resource_id_scope: string option;
  resource_types_scope: string list option;
  maximum_execution_frequency: maximum_execution_frequency option;
  input_parameters: string option;
  organization_config_rule_trigger_types: organization_config_rule_trigger_type list;
  lambda_function_arn: string;
  description: string option
}

type organization_config_rule_trigger_type_no_s_n = | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION

type organization_custom_policy_rule_metadata = {
  debug_log_delivery_accounts: string list option;
  policy_text: string;
  policy_runtime: string;
  tag_value_scope: string option;
  tag_key_scope: string option;
  resource_id_scope: string option;
  resource_types_scope: string list option;
  maximum_execution_frequency: maximum_execution_frequency option;
  input_parameters: string option;
  organization_config_rule_trigger_types: organization_config_rule_trigger_type_no_s_n list option;
  description: string option
}

type put_organization_config_rule_request = {
  organization_custom_policy_rule_metadata: organization_custom_policy_rule_metadata option;
  excluded_accounts: string list option;
  organization_custom_rule_metadata: organization_custom_rule_metadata option;
  organization_managed_rule_metadata: organization_managed_rule_metadata option;
  organization_config_rule_name: string
}

type put_external_evaluation_response = unit

type compliance_type = | Insufficient_Data
  | Not_Applicable
  | Non_Compliant
  | Compliant

type external_evaluation = {
  ordering_timestamp: float;
  annotation: string option;
  compliance_type: compliance_type;
  compliance_resource_id: string;
  compliance_resource_type: string
}

type put_external_evaluation_request = {
  external_evaluation: external_evaluation;
  config_rule_name: string
}

type invalid_result_token_exception = {
  message: string option
}

type evaluation = {
  ordering_timestamp: float;
  annotation: string option;
  compliance_type: compliance_type;
  compliance_resource_id: string;
  compliance_resource_type: string
}

type put_evaluations_response = {
  failed_evaluations: evaluation list option
}

type put_evaluations_request = {
  test_mode: bool option;
  result_token: string;
  evaluations: evaluation list option
}

type no_such_bucket_exception = {
  message: string option
}

type no_available_configuration_recorder_exception = {
  message: string option
}

type max_number_of_delivery_channels_exceeded_exception = {
  message: string option
}

type invalid_sns_topic_arn_exception = {
  message: string option
}

type invalid_s3_kms_key_arn_exception = {
  message: string option
}

type invalid_s3_key_prefix_exception = {
  message: string option
}

type invalid_delivery_channel_name_exception = {
  message: string option
}

type insufficient_delivery_policy_exception = {
  message: string option
}

type config_snapshot_delivery_properties = {
  delivery_frequency: maximum_execution_frequency option
}

type delivery_channel = {
  config_snapshot_delivery_properties: config_snapshot_delivery_properties option;
  sns_topic_ar_n: string option;
  s3_kms_key_arn: string option;
  s3_key_prefix: string option;
  s3_bucket_name: string option;
  name: string option
}

type put_delivery_channel_request = {
  delivery_channel: delivery_channel
}

type max_number_of_conformance_packs_exceeded_exception = {
  message: string option
}

type conformance_pack_template_validation_exception = {
  message: string option
}

type put_conformance_pack_response = {
  conformance_pack_arn: string option
}

type put_conformance_pack_request = {
  template_ssm_document_details: template_ssm_document_details option;
  conformance_pack_input_parameters: conformance_pack_input_parameter list option;
  delivery_s3_key_prefix: string option;
  delivery_s3_bucket: string option;
  template_body: string option;
  template_s3_uri: string option;
  conformance_pack_name: string
}

type max_number_of_configuration_recorders_exceeded_exception = {
  message: string option
}

type invalid_role_exception = {
  message: string option
}

type invalid_recording_group_exception = {
  message: string option
}

type invalid_configuration_recorder_name_exception = {
  message: string option
}

type exclusion_by_resource_types = {
  resource_types: resource_type list option
}

type recording_strategy_type = | EXCLUSION_BY_RESOURCE_TYPES
  | INCLUSION_BY_RESOURCE_TYPES
  | ALL_SUPPORTED_RESOURCE_TYPES

type recording_strategy = {
  use_only: recording_strategy_type option
}

type recording_group = {
  recording_strategy: recording_strategy option;
  exclusion_by_resource_types: exclusion_by_resource_types option;
  resource_types: resource_type list option;
  include_global_resource_types: bool option;
  all_supported: bool option
}

type recording_frequency = | DAILY
  | CONTINUOUS

type recording_mode_override = {
  recording_frequency: recording_frequency;
  resource_types: resource_type list;
  description: string option
}

type recording_mode = {
  recording_mode_overrides: recording_mode_override list option;
  recording_frequency: recording_frequency
}

type configuration_recorder = {
  recording_mode: recording_mode option;
  recording_group: recording_group option;
  role_ar_n: string option;
  name: string option
}

type put_configuration_recorder_request = {
  configuration_recorder: configuration_recorder
}

type account_aggregation_source = {
  aws_regions: string list option;
  all_aws_regions: bool option;
  account_ids: string list
}

type organization_aggregation_source = {
  all_aws_regions: bool option;
  aws_regions: string list option;
  role_arn: string
}

type configuration_aggregator = {
  created_by: string option;
  last_updated_time: float option;
  creation_time: float option;
  organization_aggregation_source: organization_aggregation_source option;
  account_aggregation_sources: account_aggregation_source list option;
  configuration_aggregator_arn: string option;
  configuration_aggregator_name: string option
}

type put_configuration_aggregator_response = {
  configuration_aggregator: configuration_aggregator option
}

type put_configuration_aggregator_request = {
  tags: tag list option;
  organization_aggregation_source: organization_aggregation_source option;
  account_aggregation_sources: account_aggregation_source list option;
  configuration_aggregator_name: string
}

type max_number_of_config_rules_exceeded_exception = {
  message: string option
}

type scope = {
  compliance_resource_id: string option;
  tag_value: string option;
  tag_key: string option;
  compliance_resource_types: string list option
}

type owner = | Custom_Policy
  | Aws
  | Custom_Lambda

type event_source = | Aws_Config

type message_type = | OversizedConfigurationItemChangeNotification
  | ScheduledNotification
  | ConfigurationSnapshotDeliveryCompleted
  | ConfigurationItemChangeNotification

type source_detail = {
  maximum_execution_frequency: maximum_execution_frequency option;
  message_type: message_type option;
  event_source: event_source option
}

type custom_policy_details = {
  enable_debug_log_delivery: bool option;
  policy_text: string;
  policy_runtime: string
}

type source = {
  custom_policy_details: custom_policy_details option;
  source_details: source_detail list option;
  source_identifier: string option;
  owner: owner
}

type config_rule_state = | EVALUATING
  | DELETING_RESULTS
  | DELETING
  | ACTIVE

type evaluation_mode_configuration = {
  mode: evaluation_mode option
}

type config_rule = {
  evaluation_modes: evaluation_mode_configuration list option;
  created_by: string option;
  config_rule_state: config_rule_state option;
  maximum_execution_frequency: maximum_execution_frequency option;
  input_parameters: string option;
  source: source;
  scope: scope option;
  description: string option;
  config_rule_id: string option;
  config_rule_arn: string option;
  config_rule_name: string option
}

type put_config_rule_request = {
  tags: tag list option;
  config_rule: config_rule
}

type aggregation_authorization = {
  creation_time: float option;
  authorized_aws_region: string option;
  authorized_account_id: string option;
  aggregation_authorization_arn: string option
}

type put_aggregation_authorization_response = {
  aggregation_authorization: aggregation_authorization option
}

type put_aggregation_authorization_request = {
  tags: tag list option;
  authorized_aws_region: string;
  authorized_account_id: string
}

type list_tags_for_resource_response = {
  next_token: string option;
  tags: tag list option
}

type list_tags_for_resource_request = {
  next_token: string option;
  limit: int option;
  resource_arn: string
}

type list_stored_queries_response = {
  next_token: string option;
  stored_query_metadata: stored_query_metadata list option
}

type list_stored_queries_request = {
  max_results: int option;
  next_token: string option
}

type invalid_time_range_exception = {
  message: string option
}

type resource_evaluation = {
  evaluation_start_timestamp: float option;
  evaluation_mode: evaluation_mode option;
  resource_evaluation_id: string option
}

type list_resource_evaluations_response = {
  next_token: string option;
  resource_evaluations: resource_evaluation list option
}

type resource_evaluation_filters = {
  evaluation_context_identifier: string option;
  time_window: time_window option;
  evaluation_mode: evaluation_mode option
}

type list_resource_evaluations_request = {
  next_token: string option;
  limit: int option;
  filters: resource_evaluation_filters option
}

type resource_identifier = {
  resource_deletion_time: float option;
  resource_name: string option;
  resource_id: string option;
  resource_type: resource_type option
}

type list_discovered_resources_response = {
  next_token: string option;
  resource_identifiers: resource_identifier list option
}

type list_discovered_resources_request = {
  next_token: string option;
  include_deleted_resources: bool option;
  limit: int option;
  resource_name: string option;
  resource_ids: string list option;
  resource_type: resource_type
}

type conformance_pack_compliance_score = {
  last_updated_time: float option;
  conformance_pack_name: string option;
  score: string option
}

type list_conformance_pack_compliance_scores_response = {
  conformance_pack_compliance_scores: conformance_pack_compliance_score list;
  next_token: string option
}

type conformance_pack_compliance_scores_filters = {
  conformance_pack_names: string list
}

type sort_order = | DESCENDING
  | ASCENDING

type sort_by = | SCORE

type list_conformance_pack_compliance_scores_request = {
  next_token: string option;
  limit: int option;
  sort_by: sort_by option;
  sort_order: sort_order option;
  filters: conformance_pack_compliance_scores_filters option
}

type list_aggregate_discovered_resources_response = {
  next_token: string option;
  resource_identifiers: aggregate_resource_identifier list option
}

type resource_filters = {
  region: string option;
  resource_name: string option;
  resource_id: string option;
  account_id: string option
}

type list_aggregate_discovered_resources_request = {
  next_token: string option;
  limit: int option;
  filters: resource_filters option;
  resource_type: resource_type;
  configuration_aggregator_name: string
}

type get_stored_query_response = {
  stored_query: stored_query option
}

type get_stored_query_request = {
  query_name: string
}

type resource_evaluation_status = | SUCCEEDED
  | FAILED
  | IN_PROGRESS

type evaluation_status = {
  failure_reason: string option;
  status: resource_evaluation_status
}

type get_resource_evaluation_summary_response = {
  resource_details: resource_details option;
  evaluation_context: evaluation_context option;
  compliance: compliance_type option;
  evaluation_start_timestamp: float option;
  evaluation_status: evaluation_status option;
  evaluation_mode: evaluation_mode option;
  resource_evaluation_id: string option
}

type get_resource_evaluation_summary_request = {
  resource_evaluation_id: string
}

type resource_not_discovered_exception = {
  message: string option
}

type configuration_item_status = | ResourceDeletedNotRecorded
  | ResourceDeleted
  | ResourceNotRecorded
  | ResourceDiscovered
  | OK

type relationship = {
  relationship_name: string option;
  resource_name: string option;
  resource_id: string option;
  resource_type: resource_type option
}

type configuration_item = {
  configuration_item_delivery_time: float option;
  recording_frequency: recording_frequency option;
  supplementary_configuration: (string * string) list option;
  configuration: string option;
  relationships: relationship list option;
  related_events: string list option;
  tags: (string * string) list option;
  resource_creation_time: float option;
  availability_zone: string option;
  aws_region: string option;
  resource_name: string option;
  resource_id: string option;
  resource_type: resource_type option;
  arn: string option;
  configuration_item_md5_hash: string option;
  configuration_state_id: string option;
  configuration_item_status: configuration_item_status option;
  configuration_item_capture_time: float option;
  account_id: string option;
  version: string option
}

type get_resource_config_history_response = {
  next_token: string option;
  configuration_items: configuration_item list option
}

type chronological_order = | Forward
  | Reverse

type get_resource_config_history_request = {
  next_token: string option;
  limit: int option;
  chronological_order: chronological_order option;
  earlier_time: float option;
  later_time: float option;
  resource_id: string;
  resource_type: resource_type
}

type no_such_organization_config_rule_exception = {
  message: string option
}

type get_organization_custom_rule_policy_response = {
  policy_text: string option
}

type get_organization_custom_rule_policy_request = {
  organization_config_rule_name: string
}

type no_such_organization_conformance_pack_exception = {
  message: string option
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

type organization_conformance_pack_detailed_status = {
  last_update_time: float option;
  error_message: string option;
  error_code: string option;
  status: organization_resource_detailed_status;
  conformance_pack_name: string;
  account_id: string
}

type get_organization_conformance_pack_detailed_status_response = {
  next_token: string option;
  organization_conformance_pack_detailed_statuses: organization_conformance_pack_detailed_status list option
}

type organization_resource_detailed_status_filters = {
  status: organization_resource_detailed_status option;
  account_id: string option
}

type get_organization_conformance_pack_detailed_status_request = {
  next_token: string option;
  limit: int option;
  filters: organization_resource_detailed_status_filters option;
  organization_conformance_pack_name: string
}

type member_account_status = {
  last_update_time: float option;
  error_message: string option;
  error_code: string option;
  member_account_rule_status: member_account_rule_status;
  config_rule_name: string;
  account_id: string
}

type get_organization_config_rule_detailed_status_response = {
  next_token: string option;
  organization_config_rule_detailed_status: member_account_status list option
}

type get_organization_config_rule_detailed_status_request = {
  next_token: string option;
  limit: int option;
  filters: status_detail_filters option;
  organization_config_rule_name: string
}

type resource_count = {
  count: int option;
  resource_type: resource_type option
}

type get_discovered_resource_counts_response = {
  next_token: string option;
  resource_counts: resource_count list option;
  total_discovered_resources: int option
}

type get_discovered_resource_counts_request = {
  next_token: string option;
  limit: int option;
  resource_types: string list option
}

type get_custom_rule_policy_response = {
  policy_text: string option
}

type get_custom_rule_policy_request = {
  config_rule_name: string option
}

type no_such_conformance_pack_exception = {
  message: string option
}

type conformance_pack_compliance_type = | INSUFFICIENT_DATA
  | NON_COMPLIANT
  | COMPLIANT

type conformance_pack_compliance_summary = {
  conformance_pack_compliance_status: conformance_pack_compliance_type;
  conformance_pack_name: string
}

type get_conformance_pack_compliance_summary_response = {
  next_token: string option;
  conformance_pack_compliance_summary_list: conformance_pack_compliance_summary list option
}

type get_conformance_pack_compliance_summary_request = {
  next_token: string option;
  limit: int option;
  conformance_pack_names: string list
}

type no_such_config_rule_in_conformance_pack_exception = {
  message: string option
}

type evaluation_result_qualifier = {
  evaluation_mode: evaluation_mode option;
  resource_id: string option;
  resource_type: string option;
  config_rule_name: string option
}

type evaluation_result_identifier = {
  resource_evaluation_id: string option;
  ordering_timestamp: float option;
  evaluation_result_qualifier: evaluation_result_qualifier option
}

type conformance_pack_evaluation_result = {
  annotation: string option;
  result_recorded_time: float;
  config_rule_invoked_time: float;
  evaluation_result_identifier: evaluation_result_identifier;
  compliance_type: conformance_pack_compliance_type
}

type get_conformance_pack_compliance_details_response = {
  next_token: string option;
  conformance_pack_rule_evaluation_results: conformance_pack_evaluation_result list option;
  conformance_pack_name: string
}

type conformance_pack_evaluation_filters = {
  resource_ids: string list option;
  resource_type: string option;
  compliance_type: conformance_pack_compliance_type option;
  config_rule_names: string list option
}

type get_conformance_pack_compliance_details_request = {
  next_token: string option;
  limit: int option;
  filters: conformance_pack_evaluation_filters option;
  conformance_pack_name: string
}

type compliance_contributor_count = {
  cap_exceeded: bool option;
  capped_count: int option
}

type compliance_summary = {
  compliance_summary_timestamp: float option;
  non_compliant_resource_count: compliance_contributor_count option;
  compliant_resource_count: compliance_contributor_count option
}

type compliance_summary_by_resource_type = {
  compliance_summary: compliance_summary option;
  resource_type: string option
}

type get_compliance_summary_by_resource_type_response = {
  compliance_summaries_by_resource_type: compliance_summary_by_resource_type list option
}

type get_compliance_summary_by_resource_type_request = {
  resource_types: string list option
}

type get_compliance_summary_by_config_rule_response = {
  compliance_summary: compliance_summary option
}

type evaluation_result = {
  result_token: string option;
  annotation: string option;
  config_rule_invoked_time: float option;
  result_recorded_time: float option;
  compliance_type: compliance_type option;
  evaluation_result_identifier: evaluation_result_identifier option
}

type get_compliance_details_by_resource_response = {
  next_token: string option;
  evaluation_results: evaluation_result list option
}

type get_compliance_details_by_resource_request = {
  resource_evaluation_id: string option;
  next_token: string option;
  compliance_types: compliance_type list option;
  resource_id: string option;
  resource_type: string option
}

type get_compliance_details_by_config_rule_response = {
  next_token: string option;
  evaluation_results: evaluation_result list option
}

type get_compliance_details_by_config_rule_request = {
  next_token: string option;
  limit: int option;
  compliance_types: compliance_type list option;
  config_rule_name: string
}

type oversized_configuration_item_exception = {
  message: string option
}

type get_aggregate_resource_config_response = {
  configuration_item: configuration_item option
}

type get_aggregate_resource_config_request = {
  resource_identifier: aggregate_resource_identifier;
  configuration_aggregator_name: string
}

type grouped_resource_count = {
  resource_count: int;
  group_name: string
}

type get_aggregate_discovered_resource_counts_response = {
  next_token: string option;
  grouped_resource_counts: grouped_resource_count list option;
  group_by_key: string option;
  total_discovered_resources: int
}

type resource_count_filters = {
  region: string option;
  account_id: string option;
  resource_type: resource_type option
}

type resource_count_group_key = | AWS_REGION
  | ACCOUNT_ID
  | RESOURCE_TYPE

type get_aggregate_discovered_resource_counts_request = {
  next_token: string option;
  limit: int option;
  group_by_key: resource_count_group_key option;
  filters: resource_count_filters option;
  configuration_aggregator_name: string
}

type aggregate_conformance_pack_compliance_count = {
  non_compliant_conformance_pack_count: int option;
  compliant_conformance_pack_count: int option
}

type aggregate_conformance_pack_compliance_summary = {
  group_name: string option;
  compliance_summary: aggregate_conformance_pack_compliance_count option
}

type get_aggregate_conformance_pack_compliance_summary_response = {
  next_token: string option;
  group_by_key: string option;
  aggregate_conformance_pack_compliance_summaries: aggregate_conformance_pack_compliance_summary list option
}

type aggregate_conformance_pack_compliance_summary_filters = {
  aws_region: string option;
  account_id: string option
}

type aggregate_conformance_pack_compliance_summary_group_key = | AWS_REGION
  | ACCOUNT_ID

type get_aggregate_conformance_pack_compliance_summary_request = {
  next_token: string option;
  limit: int option;
  group_by_key: aggregate_conformance_pack_compliance_summary_group_key option;
  filters: aggregate_conformance_pack_compliance_summary_filters option;
  configuration_aggregator_name: string
}

type aggregate_compliance_count = {
  compliance_summary: compliance_summary option;
  group_name: string option
}

type get_aggregate_config_rule_compliance_summary_response = {
  next_token: string option;
  aggregate_compliance_counts: aggregate_compliance_count list option;
  group_by_key: string option
}

type config_rule_compliance_summary_filters = {
  aws_region: string option;
  account_id: string option
}

type config_rule_compliance_summary_group_key = | AWS_REGION
  | ACCOUNT_ID

type get_aggregate_config_rule_compliance_summary_request = {
  next_token: string option;
  limit: int option;
  group_by_key: config_rule_compliance_summary_group_key option;
  filters: config_rule_compliance_summary_filters option;
  configuration_aggregator_name: string
}

type aggregate_evaluation_result = {
  aws_region: string option;
  account_id: string option;
  annotation: string option;
  config_rule_invoked_time: float option;
  result_recorded_time: float option;
  compliance_type: compliance_type option;
  evaluation_result_identifier: evaluation_result_identifier option
}

type get_aggregate_compliance_details_by_config_rule_response = {
  next_token: string option;
  aggregate_evaluation_results: aggregate_evaluation_result list option
}

type get_aggregate_compliance_details_by_config_rule_request = {
  next_token: string option;
  limit: int option;
  compliance_type: compliance_type option;
  aws_region: string;
  account_id: string;
  config_rule_name: string;
  configuration_aggregator_name: string
}

type no_such_retention_configuration_exception = {
  message: string option
}

type describe_retention_configurations_response = {
  next_token: string option;
  retention_configurations: retention_configuration list option
}

type describe_retention_configurations_request = {
  next_token: string option;
  retention_configuration_names: string list option
}

type remediation_execution_state = | FAILED
  | SUCCEEDED
  | IN_PROGRESS
  | QUEUED

type remediation_execution_step_state = | FAILED
  | PENDING
  | SUCCEEDED

type remediation_execution_step = {
  stop_time: float option;
  start_time: float option;
  error_message: string option;
  state: remediation_execution_step_state option;
  name: string option
}

type remediation_execution_status = {
  last_updated_time: float option;
  invocation_time: float option;
  step_details: remediation_execution_step list option;
  state: remediation_execution_state option;
  resource_key: resource_key option
}

type describe_remediation_execution_status_response = {
  next_token: string option;
  remediation_execution_statuses: remediation_execution_status list option
}

type describe_remediation_execution_status_request = {
  next_token: string option;
  limit: int option;
  resource_keys: resource_key list option;
  config_rule_name: string
}

type describe_remediation_exceptions_response = {
  next_token: string option;
  remediation_exceptions: remediation_exception list option
}

type describe_remediation_exceptions_request = {
  next_token: string option;
  limit: int option;
  resource_keys: remediation_exception_resource_key list option;
  config_rule_name: string
}

type describe_remediation_configurations_response = {
  remediation_configurations: remediation_configuration list option
}

type describe_remediation_configurations_request = {
  config_rule_names: string list
}

type pending_aggregation_request = {
  requester_aws_region: string option;
  requester_account_id: string option
}

type describe_pending_aggregation_requests_response = {
  next_token: string option;
  pending_aggregation_requests: pending_aggregation_request list option
}

type describe_pending_aggregation_requests_request = {
  next_token: string option;
  limit: int option
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

type organization_conformance_pack_status = {
  last_update_time: float option;
  error_message: string option;
  error_code: string option;
  status: organization_resource_status;
  organization_conformance_pack_name: string
}

type describe_organization_conformance_pack_statuses_response = {
  next_token: string option;
  organization_conformance_pack_statuses: organization_conformance_pack_status list option
}

type describe_organization_conformance_pack_statuses_request = {
  next_token: string option;
  limit: int option;
  organization_conformance_pack_names: string list option
}

type organization_conformance_pack = {
  last_update_time: float;
  excluded_accounts: string list option;
  conformance_pack_input_parameters: conformance_pack_input_parameter list option;
  delivery_s3_key_prefix: string option;
  delivery_s3_bucket: string option;
  organization_conformance_pack_arn: string;
  organization_conformance_pack_name: string
}

type describe_organization_conformance_packs_response = {
  next_token: string option;
  organization_conformance_packs: organization_conformance_pack list option
}

type describe_organization_conformance_packs_request = {
  next_token: string option;
  limit: int option;
  organization_conformance_pack_names: string list option
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

type organization_config_rule_status = {
  last_update_time: float option;
  error_message: string option;
  error_code: string option;
  organization_rule_status: organization_rule_status;
  organization_config_rule_name: string
}

type describe_organization_config_rule_statuses_response = {
  next_token: string option;
  organization_config_rule_statuses: organization_config_rule_status list option
}

type describe_organization_config_rule_statuses_request = {
  next_token: string option;
  limit: int option;
  organization_config_rule_names: string list option
}

type organization_custom_policy_rule_metadata_no_policy = {
  debug_log_delivery_accounts: string list option;
  policy_runtime: string option;
  tag_value_scope: string option;
  tag_key_scope: string option;
  resource_id_scope: string option;
  resource_types_scope: string list option;
  maximum_execution_frequency: maximum_execution_frequency option;
  input_parameters: string option;
  organization_config_rule_trigger_types: organization_config_rule_trigger_type_no_s_n list option;
  description: string option
}

type organization_config_rule = {
  organization_custom_policy_rule_metadata: organization_custom_policy_rule_metadata_no_policy option;
  last_update_time: float option;
  excluded_accounts: string list option;
  organization_custom_rule_metadata: organization_custom_rule_metadata option;
  organization_managed_rule_metadata: organization_managed_rule_metadata option;
  organization_config_rule_arn: string;
  organization_config_rule_name: string
}

type describe_organization_config_rules_response = {
  next_token: string option;
  organization_config_rules: organization_config_rule list option
}

type describe_organization_config_rules_request = {
  next_token: string option;
  limit: int option;
  organization_config_rule_names: string list option
}

type no_such_delivery_channel_exception = {
  message: string option
}

type delivery_status = | Not_Applicable
  | Failure
  | Success

type config_export_delivery_info = {
  next_delivery_time: float option;
  last_successful_time: float option;
  last_attempt_time: float option;
  last_error_message: string option;
  last_error_code: string option;
  last_status: delivery_status option
}

type config_stream_delivery_info = {
  last_status_change_time: float option;
  last_error_message: string option;
  last_error_code: string option;
  last_status: delivery_status option
}

type delivery_channel_status = {
  config_stream_delivery_info: config_stream_delivery_info option;
  config_history_delivery_info: config_export_delivery_info option;
  config_snapshot_delivery_info: config_export_delivery_info option;
  name: string option
}

type describe_delivery_channel_status_response = {
  delivery_channels_status: delivery_channel_status list option
}

type describe_delivery_channel_status_request = {
  delivery_channel_names: string list option
}

type describe_delivery_channels_response = {
  delivery_channels: delivery_channel list option
}

type describe_delivery_channels_request = {
  delivery_channel_names: string list option
}

type conformance_pack_state = | DELETE_FAILED
  | DELETE_IN_PROGRESS
  | CREATE_FAILED
  | CREATE_COMPLETE
  | CREATE_IN_PROGRESS

type conformance_pack_status_detail = {
  last_update_completed_time: float option;
  last_update_requested_time: float;
  conformance_pack_status_reason: string option;
  stack_arn: string;
  conformance_pack_state: conformance_pack_state;
  conformance_pack_arn: string;
  conformance_pack_id: string;
  conformance_pack_name: string
}

type describe_conformance_pack_status_response = {
  next_token: string option;
  conformance_pack_status_details: conformance_pack_status_detail list option
}

type describe_conformance_pack_status_request = {
  next_token: string option;
  limit: int option;
  conformance_pack_names: string list option
}

type conformance_pack_detail = {
  template_ssm_document_details: template_ssm_document_details option;
  created_by: string option;
  last_update_requested_time: float option;
  conformance_pack_input_parameters: conformance_pack_input_parameter list option;
  delivery_s3_key_prefix: string option;
  delivery_s3_bucket: string option;
  conformance_pack_id: string;
  conformance_pack_arn: string;
  conformance_pack_name: string
}

type describe_conformance_packs_response = {
  next_token: string option;
  conformance_pack_details: conformance_pack_detail list option
}

type describe_conformance_packs_request = {
  next_token: string option;
  limit: int option;
  conformance_pack_names: string list option
}

type conformance_pack_rule_compliance = {
  controls: string list option;
  compliance_type: conformance_pack_compliance_type option;
  config_rule_name: string option
}

type describe_conformance_pack_compliance_response = {
  next_token: string option;
  conformance_pack_rule_compliance_list: conformance_pack_rule_compliance list;
  conformance_pack_name: string
}

type conformance_pack_compliance_filters = {
  compliance_type: conformance_pack_compliance_type option;
  config_rule_names: string list option
}

type describe_conformance_pack_compliance_request = {
  next_token: string option;
  limit: int option;
  filters: conformance_pack_compliance_filters option;
  conformance_pack_name: string
}

type recorder_status = | Failure
  | Success
  | Pending

type configuration_recorder_status = {
  last_status_change_time: float option;
  last_error_message: string option;
  last_error_code: string option;
  last_status: recorder_status option;
  recording: bool option;
  last_stop_time: float option;
  last_start_time: float option;
  name: string option
}

type describe_configuration_recorder_status_response = {
  configuration_recorders_status: configuration_recorder_status list option
}

type describe_configuration_recorder_status_request = {
  configuration_recorder_names: string list option
}

type describe_configuration_recorders_response = {
  configuration_recorders: configuration_recorder list option
}

type describe_configuration_recorders_request = {
  configuration_recorder_names: string list option
}

type aggregated_source_type = | ORGANIZATION
  | ACCOUNT

type aggregated_source_status_type = | OUTDATED
  | SUCCEEDED
  | FAILED

type aggregated_source_status = {
  last_error_message: string option;
  last_error_code: string option;
  last_update_time: float option;
  last_update_status: aggregated_source_status_type option;
  aws_region: string option;
  source_type: aggregated_source_type option;
  source_id: string option
}

type describe_configuration_aggregator_sources_status_response = {
  next_token: string option;
  aggregated_source_status_list: aggregated_source_status list option
}

type describe_configuration_aggregator_sources_status_request = {
  limit: int option;
  next_token: string option;
  update_status: aggregated_source_status_type list option;
  configuration_aggregator_name: string
}

type describe_configuration_aggregators_response = {
  next_token: string option;
  configuration_aggregators: configuration_aggregator list option
}

type describe_configuration_aggregators_request = {
  limit: int option;
  next_token: string option;
  configuration_aggregator_names: string list option
}

type describe_config_rules_response = {
  next_token: string option;
  config_rules: config_rule list option
}

type describe_config_rules_filters = {
  evaluation_mode: evaluation_mode option
}

type describe_config_rules_request = {
  filters: describe_config_rules_filters option;
  next_token: string option;
  config_rule_names: string list option
}

type config_rule_evaluation_status = {
  last_debug_log_delivery_time: float option;
  last_debug_log_delivery_status_reason: string option;
  last_debug_log_delivery_status: string option;
  first_evaluation_started: bool option;
  last_error_message: string option;
  last_error_code: string option;
  last_deactivated_time: float option;
  first_activated_time: float option;
  last_failed_evaluation_time: float option;
  last_successful_evaluation_time: float option;
  last_failed_invocation_time: float option;
  last_successful_invocation_time: float option;
  config_rule_id: string option;
  config_rule_arn: string option;
  config_rule_name: string option
}

type describe_config_rule_evaluation_status_response = {
  next_token: string option;
  config_rules_evaluation_status: config_rule_evaluation_status list option
}

type describe_config_rule_evaluation_status_request = {
  limit: int option;
  next_token: string option;
  config_rule_names: string list option
}

type compliance = {
  compliance_contributor_count: compliance_contributor_count option;
  compliance_type: compliance_type option
}

type compliance_by_resource = {
  compliance: compliance option;
  resource_id: string option;
  resource_type: string option
}

type describe_compliance_by_resource_response = {
  next_token: string option;
  compliance_by_resources: compliance_by_resource list option
}

type describe_compliance_by_resource_request = {
  next_token: string option;
  limit: int option;
  compliance_types: compliance_type list option;
  resource_id: string option;
  resource_type: string option
}

type compliance_by_config_rule = {
  compliance: compliance option;
  config_rule_name: string option
}

type describe_compliance_by_config_rule_response = {
  next_token: string option;
  compliance_by_config_rules: compliance_by_config_rule list option
}

type describe_compliance_by_config_rule_request = {
  next_token: string option;
  compliance_types: compliance_type list option;
  config_rule_names: string list option
}

type describe_aggregation_authorizations_response = {
  next_token: string option;
  aggregation_authorizations: aggregation_authorization list option
}

type describe_aggregation_authorizations_request = {
  next_token: string option;
  limit: int option
}

type aggregate_conformance_pack_compliance = {
  total_rule_count: int option;
  non_compliant_rule_count: int option;
  compliant_rule_count: int option;
  compliance_type: conformance_pack_compliance_type option
}

type aggregate_compliance_by_conformance_pack = {
  aws_region: string option;
  account_id: string option;
  compliance: aggregate_conformance_pack_compliance option;
  conformance_pack_name: string option
}

type describe_aggregate_compliance_by_conformance_packs_response = {
  next_token: string option;
  aggregate_compliance_by_conformance_packs: aggregate_compliance_by_conformance_pack list option
}

type aggregate_conformance_pack_compliance_filters = {
  aws_region: string option;
  account_id: string option;
  compliance_type: conformance_pack_compliance_type option;
  conformance_pack_name: string option
}

type describe_aggregate_compliance_by_conformance_packs_request = {
  next_token: string option;
  limit: int option;
  filters: aggregate_conformance_pack_compliance_filters option;
  configuration_aggregator_name: string
}

type aggregate_compliance_by_config_rule = {
  aws_region: string option;
  account_id: string option;
  compliance: compliance option;
  config_rule_name: string option
}

type describe_aggregate_compliance_by_config_rules_response = {
  next_token: string option;
  aggregate_compliance_by_config_rules: aggregate_compliance_by_config_rule list option
}

type config_rule_compliance_filters = {
  aws_region: string option;
  account_id: string option;
  compliance_type: compliance_type option;
  config_rule_name: string option
}

type describe_aggregate_compliance_by_config_rules_request = {
  next_token: string option;
  limit: int option;
  filters: config_rule_compliance_filters option;
  configuration_aggregator_name: string
}

type deliver_config_snapshot_response = {
  config_snapshot_id: string option
}

type deliver_config_snapshot_request = {
  delivery_channel_name: string
}

type delete_stored_query_response = unit

type delete_stored_query_request = {
  query_name: string
}

type delete_retention_configuration_request = {
  retention_configuration_name: string
}

type delete_resource_config_request = {
  resource_id: string;
  resource_type: string
}

type no_such_remediation_exception_exception = {
  message: string option
}

type failed_delete_remediation_exceptions_batch = {
  failed_items: remediation_exception_resource_key list option;
  failure_message: string option
}

type delete_remediation_exceptions_response = {
  failed_batches: failed_delete_remediation_exceptions_batch list option
}

type delete_remediation_exceptions_request = {
  resource_keys: remediation_exception_resource_key list;
  config_rule_name: string
}

type remediation_in_progress_exception = {
  message: string option
}

type delete_remediation_configuration_response = unit

type delete_remediation_configuration_request = {
  resource_type: string option;
  config_rule_name: string
}

type delete_pending_aggregation_request_request = {
  requester_aws_region: string;
  requester_account_id: string
}

type delete_organization_conformance_pack_request = {
  organization_conformance_pack_name: string
}

type delete_organization_config_rule_request = {
  organization_config_rule_name: string
}

type delete_evaluation_results_response = unit

type delete_evaluation_results_request = {
  config_rule_name: string
}

type last_delivery_channel_delete_failed_exception = {
  message: string option
}

type delete_delivery_channel_request = {
  delivery_channel_name: string
}

type delete_conformance_pack_request = {
  conformance_pack_name: string
}

type delete_configuration_recorder_request = {
  configuration_recorder_name: string
}

type delete_configuration_aggregator_request = {
  configuration_aggregator_name: string
}

type delete_config_rule_request = {
  config_rule_name: string
}

type delete_aggregation_authorization_request = {
  authorized_aws_region: string;
  authorized_account_id: string
}

type base_configuration_item = {
  configuration_item_delivery_time: float option;
  recording_frequency: recording_frequency option;
  supplementary_configuration: (string * string) list option;
  configuration: string option;
  resource_creation_time: float option;
  availability_zone: string option;
  aws_region: string option;
  resource_name: string option;
  resource_id: string option;
  resource_type: resource_type option;
  arn: string option;
  configuration_state_id: string option;
  configuration_item_status: configuration_item_status option;
  configuration_item_capture_time: float option;
  account_id: string option;
  version: string option
}

type batch_get_resource_config_response = {
  unprocessed_resource_keys: resource_key list option;
  base_configuration_items: base_configuration_item list option
}

type batch_get_resource_config_request = {
  resource_keys: resource_key list
}

type batch_get_aggregate_resource_config_response = {
  unprocessed_resource_identifiers: aggregate_resource_identifier list option;
  base_configuration_items: base_configuration_item list option
}

type batch_get_aggregate_resource_config_request = {
  resource_identifiers: aggregate_resource_identifier list;
  configuration_aggregator_name: string
}



type base_document = Json.t

