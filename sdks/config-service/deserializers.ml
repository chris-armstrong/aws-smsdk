open Smaws_Lib.Json.DeserializeHelpers

open Types

let version_of_yojson = string_of_yojson

let value_of_yojson = string_of_yojson

let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson = 
  fun tree path : validation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : validation_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let amazon_resource_name_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "TagKeys" _list path;
    resource_arn = value_for_key (amazon_resource_name_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let base_unit_of_yojson = unit_of_yojson

let account_id_of_yojson = string_of_yojson

let aws_region_of_yojson = string_of_yojson

let resource_id_of_yojson = string_of_yojson

let resource_type_of_yojson = 
  fun (tree: t) path : resource_type -> match tree with 
    | `String "AWS::SSM::Document" -> SSMDocument
    | `String "AWS::Route53Resolver::FirewallRuleGroup" -> Route53ResolverFirewallRuleGroup
    | `String "AWS::Redshift::EndpointAccess" -> RedshiftEndpointAccess
    | `String "AWS::RDS::OptionGroup" -> RDSOptionGroup
    | `String "AWS::QuickSight::Theme" -> QuickSightTheme
    | `String "AWS::QuickSight::Template" -> QuickSightTemplate
    | `String "AWS::QuickSight::DataSource" -> QuickSightDataSource
    | `String "AWS::M2::Environment" -> M2Environment
    | `String "AWS::KMS::Alias" -> KMSAlias
    | `String "AWS::ImageBuilder::ImageRecipe" -> ImageBuilderImageRecipe
    | `String "AWS::GroundStation::DataflowEndpointGroup" -> GroundStationDataflowEndpointGroup
    | `String "AWS::Grafana::Workspace" -> GrafanaWorkspace
    | `String "AWS::EC2::NetworkInsightsAnalysis" -> EC2NetworkInsightsAnalysis
    | `String "AWS::EC2::NetworkInsightsAccessScope" -> EC2NetworkInsightsAccessScope
    | `String "AWS::Cognito::UserPoolGroup" -> CognitoUserPoolGroup
    | `String "AWS::Cognito::UserPoolClient" -> CognitoUserPoolClient
    | `String "AWS::Cognito::UserPool" -> CognitoUserPool
    | `String "AWS::AppStream::Fleet" -> AppStreamFleet
    | `String "AWS::ResourceExplorer2::Index" -> ResourceExplorer2Index
    | `String "AWS::NetworkManager::ConnectPeer" -> NetworkManagerConnectPeer
    | `String "AWS::Lambda::CodeSigningConfig" -> LambdaCodeSigningConfig
    | `String "AWS::KafkaConnect::Connector" -> KafkaConnectConnector
    | `String "AWS::IoTTwinMaker::SyncJob" -> IoTTwinMakerSyncJob
    | `String "AWS::IoT::CACertificate" -> IoTCACertificate
    | `String "AWS::IAM::InstanceProfile" -> IAMInstanceProfile
    | `String "AWS::ECS::CapacityProvider" -> ECSCapacityProvider
    | `String "AWS::EC2::TransitGatewayMulticastDomain" -> EC2TransitGatewayMulticastDomain
    | `String "AWS::EC2::TransitGatewayConnect" -> EC2TransitGatewayConnect
    | `String "AWS::EC2::IPAMPool" -> EC2IPAMPool
    | `String "AWS::EC2::CarrierGateway" -> EC2CarrierGateway
    | `String "AWS::Connect::QuickConnect" -> ConnectQuickConnect
    | `String "AWS::Connect::Instance" -> ConnectInstance
    | `String "AWS::AppMesh::Mesh" -> AppMeshMesh
    | `String "AWS::AppMesh::GatewayRoute" -> AppMeshGatewayRoute
    | `String "AWS::ACMPCA::CertificateAuthorityActivation" -> ACMPCACertificateAuthorityActivation
    | `String "AWS::Batch::SchedulingPolicy" -> BatchSchedulingPolicy
    | `String "AWS::Route53Resolver::ResolverQueryLoggingConfig" -> Route53ResolverResolverQueryLoggingConfig
    | `String "AWS::CodeGuruProfiler::ProfilingGroup" -> CodeGuruProfilerProfilingGroup
    | `String "AWS::APS::RuleGroupsNamespace" -> APSRuleGroupsNamespace
    | `String "AWS::MediaConnect::FlowSource" -> MediaConnectFlowSource
    | `String "AWS::Transfer::Certificate" -> TransferCertificate
    | `String "AWS::ServiceDiscovery::Instance" -> ServiceDiscoveryInstance
    | `String "AWS::Route53Resolver::ResolverQueryLoggingConfigAssociation" -> Route53ResolverResolverQueryLoggingConfigAssociation
    | `String "AWS::InspectorV2::Filter" -> InspectorV2Filter
    | `String "AWS::IoT::ProvisioningTemplate" -> IoTProvisioningTemplate
    | `String "AWS::IoTWireless::FuotaTask" -> IoTWirelessFuotaTask
    | `String "AWS::IoT::JobTemplate" -> IoTJobTemplate
    | `String "AWS::AppStream::Stack" -> AppStreamStack
    | `String "AWS::MSK::BatchScramSecret" -> MSKBatchScramSecret
    | `String "AWS::SageMaker::FeatureGroup" -> SageMakerFeatureGroup
    | `String "AWS::CodeBuild::ReportGroup" -> CodeBuildReportGroup
    | `String "AWS::IoTTwinMaker::ComponentType" -> IoTTwinMakerComponentType
    | `String "AWS::Personalize::DatasetGroup" -> PersonalizeDatasetGroup
    | `String "AWS::IoTWireless::MulticastGroup" -> IoTWirelessMulticastGroup
    | `String "AWS::NetworkManager::LinkAssociation" -> NetworkManagerLinkAssociation
    | `String "AWS::NetworkManager::CustomerGatewayAssociation" -> NetworkManagerCustomerGatewayAssociation
    | `String "AWS::S3::AccessPoint" -> S3AccessPoint
    | `String "AWS::Pinpoint::EmailChannel" -> PinpointEmailChannel
    | `String "AWS::Logs::Destination" -> LogsDestination
    | `String "AWS::KinesisVideo::Stream" -> KinesisVideoStream
    | `String "AWS::Kendra::Index" -> KendraIndex
    | `String "AWS::EC2::ClientVpnEndpoint" -> EC2ClientVpnEndpoint
    | `String "AWS::EC2::CapacityReservation" -> EC2CapacityReservation
    | `String "AWS::DMS::Endpoint" -> DMSEndpoint
    | `String "AWS::CustomerProfiles::ObjectType" -> CustomerProfilesObjectType
    | `String "AWS::AppRunner::Service" -> AppRunnerService
    | `String "AWS::AppMesh::VirtualRouter" -> AppMeshVirtualRouter
    | `String "AWS::AppMesh::VirtualGateway" -> AppMeshVirtualGateway
    | `String "AWS::AppConfig::HostedConfigurationVersion" -> AppConfigHostedConfigurationVersion
    | `String "AWS::ACMPCA::CertificateAuthority" -> ACMPCACertificateAuthority
    | `String "AWS::ResilienceHub::App" -> ResilienceHubApp
    | `String "AWS::Pinpoint::EventStream" -> PinpointEventStream
    | `String "AWS::Pinpoint::EmailTemplate" -> PinpointEmailTemplate
    | `String "AWS::Personalize::Solution" -> PersonalizeSolution
    | `String "AWS::Personalize::Schema" -> PersonalizeSchema
    | `String "AWS::Personalize::Dataset" -> PersonalizeDataset
    | `String "AWS::MSK::Configuration" -> MSKConfiguration
    | `String "AWS::MediaTailor::PlaybackConfiguration" -> MediaTailorPlaybackConfiguration
    | `String "AWS::MediaConnect::FlowVpcInterface" -> MediaConnectFlowVpcInterface
    | `String "AWS::MediaConnect::FlowEntitlement" -> MediaConnectFlowEntitlement
    | `String "AWS::GroundStation::MissionProfile" -> GroundStationMissionProfile
    | `String "AWS::GreengrassV2::ComponentVersion" -> GreengrassV2ComponentVersion
    | `String "AWS::Forecast::DatasetGroup" -> ForecastDatasetGroup
    | `String "AWS::Evidently::Launch" -> EvidentlyLaunch
    | `String "AWS::EC2::IPAMScope" -> EC2IPAMScope
    | `String "AWS::Athena::PreparedStatement" -> AthenaPreparedStatement
    | `String "AWS::AppMesh::Route" -> AppMeshRoute
    | `String "AWS::AppIntegrations::EventIntegration" -> AppIntegrationsEventIntegration
    | `String "AWS::Amplify::Branch" -> AmplifyBranch
    | `String "AWS::KinesisFirehose::DeliveryStream" -> KinesisFirehoseDeliveryStream
    | `String "AWS::Transfer::Connector" -> TransferConnector
    | `String "AWS::Transfer::Agreement" -> TransferAgreement
    | `String "AWS::SageMaker::Domain" -> SageMakerDomain
    | `String "AWS::Pinpoint::InAppTemplate" -> PinpointInAppTemplate
    | `String "AWS::Pinpoint::Campaign" -> PinpointCampaign
    | `String "AWS::IAM::ServerCertificate" -> IAMServerCertificate
    | `String "AWS::IAM::SAMLProvider" -> IAMSAMLProvider
    | `String "AWS::Forecast::Dataset" -> ForecastDataset
    | `String "AWS::Evidently::Project" -> EvidentlyProject
    | `String "AWS::EC2::SpotFleet" -> EC2SpotFleet
    | `String "AWS::EC2::PrefixList" -> EC2PrefixList
    | `String "AWS::CodeArtifact::Repository" -> CodeArtifactRepository
    | `String "AWS::AppStream::Application" -> AppStreamApplication
    | `String "AWS::AppRunner::VpcConnector" -> AppRunnerVpcConnector
    | `String "AWS::AppMesh::VirtualService" -> AppMeshVirtualService
    | `String "AWS::AppMesh::VirtualNode" -> AppMeshVirtualNode
    | `String "AWS::Amplify::App" -> AmplifyApp
    | `String "AWS::Signer::SigningProfile" -> SignerSigningProfile
    | `String "AWS::Cassandra::Keyspace" -> CassandraKeyspace
    | `String "AWS::ECS::TaskSet" -> ECSTaskSet
    | `String "AWS::SageMaker::Image" -> SageMakerImage
    | `String "AWS::SageMaker::AppImageConfig" -> SageMakerAppImageConfig
    | `String "AWS::Route53Resolver::FirewallRuleGroupAssociation" -> Route53ResolverFirewallRuleGroupAssociation
    | `String "AWS::Redshift::ScheduledAction" -> RedshiftScheduledAction
    | `String "AWS::Pinpoint::App" -> PinpointApp
    | `String "AWS::Panorama::Package" -> PanoramaPackage
    | `String "AWS::NetworkManager::Site" -> NetworkManagerSite
    | `String "AWS::NetworkManager::Link" -> NetworkManagerLink
    | `String "AWS::NetworkManager::GlobalNetwork" -> NetworkManagerGlobalNetwork
    | `String "AWS::NetworkManager::Device" -> NetworkManagerDevice
    | `String "AWS::IoTWireless::ServiceProfile" -> IoTWirelessServiceProfile
    | `String "AWS::IoT::FleetMetric" -> IoTFleetMetric
    | `String "AWS::ImageBuilder::ImagePipeline" -> ImageBuilderImagePipeline
    | `String "AWS::GroundStation::Config" -> GroundStationConfig
    | `String "AWS::ECR::PullThroughCacheRule" -> ECRPullThroughCacheRule
    | `String "AWS::EC2::SubnetRouteTableAssociation" -> EC2SubnetRouteTableAssociation
    | `String "AWS::EC2::EC2Fleet" -> EC2EC2Fleet
    | `String "AWS::DeviceFarm::Project" -> DeviceFarmProject
    | `String "AWS::DeviceFarm::InstanceProfile" -> DeviceFarmInstanceProfile
    | `String "AWS::CloudWatch::MetricStream" -> CloudWatchMetricStream
    | `String "AWS::AuditManager::Assessment" -> AuditManagerAssessment
    | `String "AWS::AppFlow::Flow" -> AppFlowFlow
    | `String "AWS::AppConfig::DeploymentStrategy" -> AppConfigDeploymentStrategy
    | `String "AWS::Connect::PhoneNumber" -> ConnectPhoneNumber
    | `String "AWS::AutoScaling::WarmPool" -> AutoScalingWarmPool
    | `String "AWS::CustomerProfiles::Domain" -> CustomerProfilesDomain
    | `String "AWS::NetworkManager::TransitGatewayRegistration" -> NetworkManagerTransitGatewayRegistration
    | `String "AWS::IoTTwinMaker::Scene" -> IoTTwinMakerScene
    | `String "AWS::EC2::IPAM" -> EC2IPAM
    | `String "AWS::EC2::TrafficMirrorFilter" -> EC2TrafficMirrorFilter
    | `String "AWS::EC2::NetworkInsightsPath" -> EC2NetworkInsightsPath
    | `String "AWS::EC2::DHCPOptions" -> EC2DHCPOptions
    | `String "AWS::Events::Rule" -> EventsRule
    | `String "AWS::Pinpoint::ApplicationSettings" -> PinpointApplicationSettings
    | `String "AWS::Pinpoint::Segment" -> PinpointSegment
    | `String "AWS::HealthLake::FHIRDatastore" -> HealthLakeFHIRDatastore
    | `String "AWS::RoboMaker::RobotApplication" -> RoboMakerRobotApplication
    | `String "AWS::RoboMaker::SimulationApplication" -> RoboMakerSimulationApplication
    | `String "AWS::Route53RecoveryReadiness::ResourceSet" -> Route53RecoveryReadinessResourceSet
    | `String "AWS::Route53RecoveryControl::RoutingControl" -> Route53RecoveryControlRoutingControl
    | `String "AWS::Route53RecoveryControl::ControlPanel" -> Route53RecoveryControlControlPanel
    | `String "AWS::Route53RecoveryControl::SafetyRule" -> Route53RecoveryControlSafetyRule
    | `String "AWS::Route53RecoveryControl::Cluster" -> Route53RecoveryControlCluster
    | `String "AWS::LookoutVision::Project" -> LookoutVisionProject
    | `String "AWS::AppStream::DirectoryConfig" -> AppStreamDirectoryConfig
    | `String "AWS::KinesisVideo::SignalingChannel" -> KinesisVideoSignalingChannel
    | `String "AWS::MediaPackage::PackagingConfiguration" -> MediaPackagePackagingConfiguration
    | `String "AWS::EventSchemas::Schema" -> EventSchemasSchema
    | `String "AWS::Events::Connection" -> EventsConnection
    | `String "AWS::IoT::ScheduledAudit" -> IoTScheduledAudit
    | `String "AWS::S3::StorageLens" -> S3StorageLens
    | `String "AWS::EC2::TrafficMirrorTarget" -> EC2TrafficMirrorTarget
    | `String "AWS::IoT::AccountAuditConfiguration" -> IoTAccountAuditConfiguration
    | `String "AWS::LookoutMetrics::Alert" -> LookoutMetricsAlert
    | `String "AWS::Lex::BotAlias" -> LexBotAlias
    | `String "AWS::IoTSiteWise::Gateway" -> IoTSiteWiseGateway
    | `String "AWS::EC2::TrafficMirrorSession" -> EC2TrafficMirrorSession
    | `String "AWS::RoboMaker::RobotApplicationVersion" -> RoboMakerRobotApplicationVersion
    | `String "AWS::Route53Resolver::FirewallDomainList" -> Route53ResolverFirewallDomainList
    | `String "AWS::IoT::CustomMetric" -> IoTCustomMetric
    | `String "AWS::CodeGuruReviewer::RepositoryAssociation" -> CodeGuruReviewerRepositoryAssociation
    | `String "AWS::Lex::Bot" -> LexBot
    | `String "AWS::Budgets::BudgetsAction" -> BudgetsBudgetsAction
    | `String "AWS::DeviceFarm::TestGridProject" -> DeviceFarmTestGridProject
    | `String "AWS::S3::MultiRegionAccessPoint" -> S3MultiRegionAccessPoint
    | `String "AWS::RDS::GlobalCluster" -> RDSGlobalCluster
    | `String "AWS::KinesisAnalyticsV2::Application" -> KinesisAnalyticsV2Application
    | `String "AWS::IVS::PlaybackKeyPair" -> IVSPlaybackKeyPair
    | `String "AWS::IVS::RecordingConfiguration" -> IVSRecordingConfiguration
    | `String "AWS::IVS::Channel" -> IVSChannel
    | `String "AWS::IoTSiteWise::AssetModel" -> IoTSiteWiseAssetModel
    | `String "AWS::IoTSiteWise::Portal" -> IoTSiteWisePortal
    | `String "AWS::IoTSiteWise::Project" -> IoTSiteWiseProject
    | `String "AWS::IoTSiteWise::Dashboard" -> IoTSiteWiseDashboard
    | `String "AWS::IoTAnalytics::Channel" -> IoTAnalyticsChannel
    | `String "AWS::IoTAnalytics::Pipeline" -> IoTAnalyticsPipeline
    | `String "AWS::IoTAnalytics::Dataset" -> IoTAnalyticsDataset
    | `String "AWS::IoTTwinMaker::Entity" -> IoTTwinMakerEntity
    | `String "AWS::IoTTwinMaker::Workspace" -> IoTTwinMakerWorkspace
    | `String "AWS::IoT::MitigationAction" -> IoTMitigationAction
    | `String "AWS::IoT::Policy" -> IoTPolicy
    | `String "AWS::Glue::MLTransform" -> GlueMLTransform
    | `String "AWS::EKS::Addon" -> EKSAddon
    | `String "AWS::EKS::IdentityProviderConfig" -> EKSIdentityProviderConfig
    | `String "AWS::Transfer::Workflow" -> TransferWorkflow
    | `String "AWS::ResilienceHub::ResiliencyPolicy" -> ResilienceHubResiliencyPolicy
    | `String "AWS::Route53RecoveryReadiness::RecoveryGroup" -> Route53RecoveryReadinessRecoveryGroup
    | `String "AWS::MediaPackage::PackagingGroup" -> MediaPackagePackagingGroup
    | `String "AWS::Lightsail::StaticIp" -> LightsailStaticIp
    | `String "AWS::Lightsail::Bucket" -> LightsailBucket
    | `String "AWS::IoTAnalytics::Datastore" -> IoTAnalyticsDatastore
    | `String "AWS::IoT::Dimension" -> IoTDimension
    | `String "AWS::IoT::RoleAlias" -> IoTRoleAlias
    | `String "AWS::IoT::SecurityProfile" -> IoTSecurityProfile
    | `String "AWS::IoT::Authorizer" -> IoTAuthorizer
    | `String "AWS::FraudDetector::Outcome" -> FraudDetectorOutcome
    | `String "AWS::FraudDetector::Variable" -> FraudDetectorVariable
    | `String "AWS::FraudDetector::EntityType" -> FraudDetectorEntityType
    | `String "AWS::FraudDetector::Label" -> FraudDetectorLabel
    | `String "AWS::EventSchemas::Discoverer" -> EventSchemasDiscoverer
    | `String "AWS::EventSchemas::RegistryPolicy" -> EventSchemasRegistryPolicy
    | `String "AWS::EventSchemas::Registry" -> EventSchemasRegistry
    | `String "AWS::Cloud9::EnvironmentEC2" -> Cloud9EnvironmentEC2
    | `String "AWS::AppConfig::ConfigurationProfile" -> AppConfigConfigurationProfile
    | `String "AWS::AppConfig::Environment" -> AppConfigEnvironment
    | `String "AWS::AmazonMQ::Broker" -> AmazonMQBroker
    | `String "AWS::SES::Template" -> SESTemplate
    | `String "AWS::GuardDuty::Filter" -> GuardDutyFilter
    | `String "AWS::SES::ReceiptFilter" -> SESReceiptFilter
    | `String "AWS::DataSync::LocationFSxWindows" -> DataSyncLocationFSxWindows
    | `String "AWS::FIS::ExperimentTemplate" -> FISExperimentTemplate
    | `String "AWS::Lightsail::Disk" -> LightsailDisk
    | `String "AWS::Events::ApiDestination" -> EventsApiDestination
    | `String "AWS::Events::Archive" -> EventsArchive
    | `String "AWS::SES::ReceiptRuleSet" -> SESReceiptRuleSet
    | `String "AWS::Events::Endpoint" -> EventsEndpoint
    | `String "AWS::RUM::AppMonitor" -> RUMAppMonitor
    | `String "AWS::Lightsail::Certificate" -> LightsailCertificate
    | `String "AWS::Backup::ReportPlan" -> BackupReportPlan
    | `String "AWS::ECR::RegistryPolicy" -> ECRRegistryPolicy
    | `String "AWS::Route53RecoveryReadiness::ReadinessCheck" -> Route53RecoveryReadinessReadinessCheck
    | `String "AWS::Route53RecoveryReadiness::Cell" -> Route53RecoveryReadinessCell
    | `String "AWS::Glue::Classifier" -> GlueClassifier
    | `String "AWS::DataSync::LocationHDFS" -> DataSyncLocationHDFS
    | `String "AWS::DataSync::LocationObjectStorage" -> DataSyncLocationObjectStorage
    | `String "AWS::ImageBuilder::InfrastructureConfiguration" -> ImageBuilderInfrastructureConfiguration
    | `String "AWS::ImageBuilder::DistributionConfiguration" -> ImageBuilderDistributionConfiguration
    | `String "AWS::ImageBuilder::ContainerRecipe" -> ImageBuilderContainerRecipe
    | `String "AWS::Events::EventBus" -> EventsEventBus
    | `String "AWS::ServiceDiscovery::HttpNamespace" -> ServiceDiscoveryHttpNamespace
    | `String "AWS::IoTEvents::AlarmModel" -> IoTEventsAlarmModel
    | `String "AWS::IoTEvents::DetectorModel" -> IoTEventsDetectorModel
    | `String "AWS::IoTEvents::Input" -> IoTEventsInput
    | `String "AWS::Route53::HostedZone" -> Route53HostedZone
    | `String "AWS::SES::ConfigurationSet" -> SESConfigurationSet
    | `String "AWS::SES::ContactList" -> SESContactList
    | `String "AWS::ServiceDiscovery::PublicDnsNamespace" -> ServiceDiscoveryPublicDnsNamespace
    | `String "AWS::ServiceDiscovery::Service" -> ServiceDiscoveryService
    | `String "AWS::SageMaker::NotebookInstanceLifecycleConfig" -> SageMakerNotebookInstanceLifecycleConfig
    | `String "AWS::SageMaker::Workteam" -> SageMakerWorkteam
    | `String "AWS::GuardDuty::IPSet" -> GuardDutyIPSet
    | `String "AWS::GuardDuty::ThreatIntelSet" -> GuardDutyThreatIntelSet
    | `String "AWS::Glue::Job" -> GlueJob
    | `String "AWS::EKS::FargateProfile" -> EKSFargateProfile
    | `String "AWS::EC2::NetworkInsightsAccessScopeAnalysis" -> NetworkInsightsAccessScopeAnalysis
    | `String "AWS::DataSync::LocationNFS" -> DataSyncLocationNFS
    | `String "AWS::DataSync::Task" -> DataSyncTask
    | `String "AWS::DataSync::LocationEFS" -> DataSyncLocationEFS
    | `String "AWS::DataSync::LocationS3" -> DataSyncLocationS3
    | `String "AWS::DataSync::LocationFSxLustre" -> DataSyncLocationFSxLustre
    | `String "AWS::DataSync::LocationSMB" -> DataSyncLocationSMB
    | `String "AWS::AppSync::GraphQLApi" -> AppSyncGraphQLApi
    | `String "AWS::AppConfig::Application" -> AppConfigApplication
    | `String "AWS::DMS::Certificate" -> DMSCertificate
    | `String "AWS::EC2::TransitGatewayRouteTable" -> TransitGatewayRouteTable
    | `String "AWS::EC2::TransitGatewayAttachment" -> TransitGatewayAttachment
    | `String "AWS::GlobalAccelerator::Listener" -> GlobalAcceleratorListener
    | `String "AWS::GlobalAccelerator::EndpointGroup" -> GlobalAcceleratorEndpointGroup
    | `String "AWS::GlobalAccelerator::Accelerator" -> GlobalAcceleratorAccelerator
    | `String "AWS::Detective::Graph" -> DetectiveGraph
    | `String "AWS::Athena::DataCatalog" -> AthenaDataCatalog
    | `String "AWS::Athena::WorkGroup" -> AthenaWorkGroup
    | `String "AWS::AccessAnalyzer::Analyzer" -> AccessAnalyzerAnalyzer
    | `String "AWS::Batch::ComputeEnvironment" -> BatchComputeEnvironment
    | `String "AWS::Batch::JobQueue" -> BatchJobQueue
    | `String "AWS::StepFunctions::StateMachine" -> StepFunctionsStateMachine
    | `String "AWS::ElasticLoadBalancingV2::Listener" -> ListenerV2
    | `String "AWS::SageMaker::Model" -> SageMakerModel
    | `String "AWS::WorkSpaces::ConnectionAlias" -> WorkSpacesConnectionAlias
    | `String "AWS::WorkSpaces::Workspace" -> WorkSpacesWorkspace
    | `String "AWS::StepFunctions::Activity" -> StepFunctionsActivity
    | `String "AWS::MSK::Cluster" -> MSKCluster
    | `String "AWS::DMS::EventSubscription" -> DMSEventSubscription
    | `String "AWS::DMS::ReplicationSubnetGroup" -> DMSReplicationSubnetGroup
    | `String "AWS::Route53Resolver::ResolverRuleAssociation" -> Route53ResolverResolverRuleAssociation
    | `String "AWS::Route53Resolver::ResolverRule" -> Route53ResolverResolverRule
    | `String "AWS::Route53Resolver::ResolverEndpoint" -> Route53ResolverResolverEndpoint
    | `String "AWS::SageMaker::CodeRepository" -> SageMakerCodeRepository
    | `String "AWS::EMR::SecurityConfiguration" -> EMRSecurityConfiguration
    | `String "AWS::GuardDuty::Detector" -> GuardDutyDetector
    | `String "AWS::ECR::PublicRepository" -> ECRPublicRepository
    | `String "AWS::EC2::LaunchTemplate" -> LaunchTemplate
    | `String "AWS::CodeDeploy::DeploymentGroup" -> CodeDeployDeploymentGroup
    | `String "AWS::CodeDeploy::DeploymentConfig" -> CodeDeployDeploymentConfig
    | `String "AWS::CodeDeploy::Application" -> CodeDeployApplication
    | `String "AWS::Kinesis::StreamConsumer" -> KinesisStreamConsumer
    | `String "AWS::Kinesis::Stream" -> KinesisStream
    | `String "AWS::EC2::TransitGateway" -> TransitGateway
    | `String "AWS::OpenSearch::Domain" -> OpenSearchDomain
    | `String "AWS::EKS::Cluster" -> EKSCluster
    | `String "AWS::EFS::FileSystem" -> EFSFileSystem
    | `String "AWS::EFS::AccessPoint" -> EFSAccessPoint
    | `String "AWS::ECS::TaskDefinition" -> ECSTaskDefinition
    | `String "AWS::ECS::Service" -> ECSService
    | `String "AWS::ECS::Cluster" -> ECSCluster
    | `String "AWS::ECR::Repository" -> ECRRepository
    | `String "AWS::Backup::RecoveryPoint" -> BackupRecoveryPoint
    | `String "AWS::Backup::BackupVault" -> BackupVault
    | `String "AWS::Backup::BackupSelection" -> BackupSelection
    | `String "AWS::Backup::BackupPlan" -> BackupPlan
    | `String "AWS::SSM::FileData" -> FileData
    | `String "AWS::SNS::Topic" -> Topic
    | `String "AWS::SecretsManager::Secret" -> Secret
    | `String "AWS::QLDB::Ledger" -> QLDBLedger
    | `String "AWS::KMS::Key" -> Key
    | `String "AWS::SQS::Queue" -> Queue
    | `String "AWS::ServiceCatalog::Portfolio" -> Portfolio
    | `String "AWS::ServiceCatalog::CloudFormationProduct" -> CloudFormationProduct
    | `String "AWS::ServiceCatalog::CloudFormationProvisionedProduct" -> CloudFormationProvisionedProduct
    | `String "AWS::CodePipeline::Pipeline" -> Pipeline
    | `String "AWS::ApiGatewayV2::Api" -> Api
    | `String "AWS::ApiGatewayV2::Stage" -> StageV2
    | `String "AWS::ApiGateway::RestApi" -> RestApi
    | `String "AWS::ApiGateway::Stage" -> Stage
    | `String "AWS::Config::ResourceCompliance" -> ResourceCompliance
    | `String "AWS::Config::ConformancePackCompliance" -> ConformancePackCompliance
    | `String "AWS::ShieldRegional::Protection" -> RegionalProtection
    | `String "AWS::Shield::Protection" -> Protection
    | `String "AWS::SSM::PatchCompliance" -> PatchCompliance
    | `String "AWS::SSM::AssociationCompliance" -> AssociationCompliance
    | `String "AWS::XRay::EncryptionConfig" -> EncryptionConfig
    | `String "AWS::WAFv2::ManagedRuleSet" -> ManagedRuleSetV2
    | `String "AWS::WAFv2::RegexPatternSet" -> RegexPatternSetV2
    | `String "AWS::WAFv2::IPSet" -> IPSetV2
    | `String "AWS::WAFv2::RuleGroup" -> RuleGroupV2
    | `String "AWS::WAFv2::WebACL" -> WebACLV2
    | `String "AWS::ElasticBeanstalk::Environment" -> Environment
    | `String "AWS::ElasticBeanstalk::ApplicationVersion" -> ApplicationVersion
    | `String "AWS::ElasticBeanstalk::Application" -> Application
    | `String "AWS::NetworkFirewall::RuleGroup" -> NetworkFirewallRuleGroup
    | `String "AWS::NetworkFirewall::FirewallPolicy" -> NetworkFirewallFirewallPolicy
    | `String "AWS::NetworkFirewall::Firewall" -> NetworkFirewallFirewall
    | `String "AWS::Lambda::Function" -> Function
    | `String "AWS::CloudFront::StreamingDistribution" -> StreamingDistribution
    | `String "AWS::CloudFront::Distribution" -> Distribution
    | `String "AWS::WAFRegional::WebACL" -> RegionalWebACL
    | `String "AWS::WAFRegional::RuleGroup" -> RegionalRuleGroup
    | `String "AWS::WAFRegional::Rule" -> RegionalRule
    | `String "AWS::WAFRegional::RateBasedRule" -> RegionalRateBasedRule
    | `String "AWS::WAF::WebACL" -> WebACL
    | `String "AWS::WAF::RuleGroup" -> RuleGroup
    | `String "AWS::WAF::Rule" -> Rule
    | `String "AWS::WAF::RateBasedRule" -> RateBasedRule
    | `String "AWS::CodeBuild::Project" -> Project
    | `String "AWS::DynamoDB::Table" -> Table
    | `String "AWS::AutoScaling::ScheduledAction" -> ScheduledAction
    | `String "AWS::AutoScaling::ScalingPolicy" -> ScalingPolicy
    | `String "AWS::AutoScaling::LaunchConfiguration" -> LaunchConfiguration
    | `String "AWS::AutoScaling::AutoScalingGroup" -> AutoScalingGroup
    | `String "AWS::ElasticLoadBalancing::LoadBalancer" -> LoadBalancer
    | `String "AWS::CloudFormation::Stack" -> Stack
    | `String "AWS::CloudWatch::Alarm" -> Alarm
    | `String "AWS::SSM::ManagedInstanceInventory" -> ManagedInstanceInventory
    | `String "AWS::Redshift::EventSubscription" -> RedshiftEventSubscription
    | `String "AWS::Redshift::ClusterSubnetGroup" -> ClusterSubnetGroup
    | `String "AWS::Redshift::ClusterSecurityGroup" -> ClusterSecurityGroup
    | `String "AWS::Redshift::ClusterParameterGroup" -> ClusterParameterGroup
    | `String "AWS::Redshift::ClusterSnapshot" -> ClusterSnapshot
    | `String "AWS::Redshift::Cluster" -> Cluster
    | `String "AWS::S3::AccountPublicAccessBlock" -> AccountPublicAccessBlock
    | `String "AWS::S3::Bucket" -> Bucket
    | `String "AWS::RDS::EventSubscription" -> EventSubscription
    | `String "AWS::RDS::DBClusterSnapshot" -> DBClusterSnapshot
    | `String "AWS::RDS::DBCluster" -> DBCluster
    | `String "AWS::RDS::DBSnapshot" -> DBSnapshot
    | `String "AWS::RDS::DBSecurityGroup" -> DBSecurityGroup
    | `String "AWS::RDS::DBSubnetGroup" -> DBSubnetGroup
    | `String "AWS::RDS::DBInstance" -> DBInstance
    | `String "AWS::ACM::Certificate" -> Certificate
    | `String "AWS::ElasticLoadBalancingV2::LoadBalancer" -> LoadBalancerV2
    | `String "AWS::IAM::User" -> User
    | `String "AWS::IAM::Role" -> Role
    | `String "AWS::IAM::Policy" -> Policy
    | `String "AWS::IAM::Group" -> Group
    | `String "AWS::Elasticsearch::Domain" -> Domain
    | `String "AWS::EC2::VPCPeeringConnection" -> VPCPeeringConnection
    | `String "AWS::EC2::FlowLog" -> FlowLog
    | `String "AWS::EC2::VPCEndpointService" -> VPCEndpointService
    | `String "AWS::EC2::VPCEndpoint" -> VPCEndpoint
    | `String "AWS::EC2::EgressOnlyInternetGateway" -> EgressOnlyInternetGateway
    | `String "AWS::EC2::NatGateway" -> NatGateway
    | `String "AWS::EC2::RegisteredHAInstance" -> RegisteredHAInstance
    | `String "AWS::EC2::VPNGateway" -> VPNGateway
    | `String "AWS::EC2::VPNConnection" -> VPNConnection
    | `String "AWS::EC2::VPC" -> VPC
    | `String "AWS::EC2::Volume" -> Volume
    | `String "AWS::CloudTrail::Trail" -> Trail
    | `String "AWS::EC2::Subnet" -> Subnet
    | `String "AWS::EC2::SecurityGroup" -> SecurityGroup
    | `String "AWS::EC2::RouteTable" -> RouteTable
    | `String "AWS::EC2::NetworkInterface" -> NetworkInterface
    | `String "AWS::EC2::NetworkAcl" -> NetworkAcl
    | `String "AWS::EC2::InternetGateway" -> InternetGateway
    | `String "AWS::EC2::Instance" -> Instance
    | `String "AWS::EC2::Host" -> Host
    | `String "AWS::EC2::EIP" -> EIP
    | `String "AWS::EC2::CustomerGateway" -> CustomerGateway
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")

let resource_name_of_yojson = string_of_yojson

let aggregate_resource_identifier_of_yojson = 
  fun tree path : aggregate_resource_identifier ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregate_resource_identifier = {
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "ResourceName") _list path;
    resource_type = value_for_key (resource_type_of_yojson) "ResourceType" _list path;
    resource_id = value_for_key (resource_id_of_yojson) "ResourceId" _list path;
    source_region = value_for_key (aws_region_of_yojson) "SourceRegion" _list path;
    source_account_id = value_for_key (account_id_of_yojson) "SourceAccountId" _list path;
    
  }
  in _res

let unprocessed_resource_identifier_list_of_yojson = 
  fun tree path -> list_of_yojson aggregate_resource_identifier_of_yojson tree path 

let too_many_tags_exception_of_yojson = 
  fun tree path : too_many_tags_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : too_many_tags_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let date_of_yojson = timestamp_of_yojson

let time_window_of_yojson = 
  fun tree path : time_window ->
  let _list = assoc_of_yojson tree path in
  let _res : time_window = {
    end_time = option_of_yojson (value_for_key (date_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_of_yojson) "StartTime") _list path;
    
  }
  in _res

let ssm_document_name_of_yojson = string_of_yojson

let ssm_document_version_of_yojson = string_of_yojson

let template_ssm_document_details_of_yojson = 
  fun tree path : template_ssm_document_details ->
  let _list = assoc_of_yojson tree path in
  let _res : template_ssm_document_details = {
    document_version = option_of_yojson (value_for_key (ssm_document_version_of_yojson) "DocumentVersion") _list path;
    document_name = value_for_key (ssm_document_name_of_yojson) "DocumentName" _list path;
    
  }
  in _res

let template_s3_uri_of_yojson = string_of_yojson

let template_body_of_yojson = string_of_yojson

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = option_of_yojson (value_for_key (tag_value_of_yojson) "Value") _list path;
    key = option_of_yojson (value_for_key (tag_key_of_yojson) "Key") _list path;
    
  }
  in _res

let tags_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let name_of_yojson = string_of_yojson

let tags_of_yojson = 
  fun tree path -> map_of_yojson value_of_yojson tree path

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let tag_resource_request_of_yojson = 
  fun tree path : tag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    resource_arn = value_for_key (amazon_resource_name_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let supplementary_configuration_value_of_yojson = string_of_yojson

let supplementary_configuration_name_of_yojson = string_of_yojson

let supplementary_configuration_of_yojson = 
  fun tree path -> map_of_yojson supplementary_configuration_value_of_yojson tree path

let string_with_char_limit768_of_yojson = string_of_yojson

let string_with_char_limit64_of_yojson = string_of_yojson

let string_with_char_limit256_min0_of_yojson = string_of_yojson

let string_with_char_limit256_of_yojson = string_of_yojson

let string_with_char_limit2048_of_yojson = string_of_yojson

let string_with_char_limit128_of_yojson = string_of_yojson

let string_with_char_limit1024_of_yojson = string_of_yojson

let string__of_yojson = string_of_yojson

let query_id_of_yojson = string_of_yojson

let query_arn_of_yojson = string_of_yojson

let query_name_of_yojson = string_of_yojson

let query_description_of_yojson = string_of_yojson

let stored_query_metadata_of_yojson = 
  fun tree path : stored_query_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : stored_query_metadata = {
    description = option_of_yojson (value_for_key (query_description_of_yojson) "Description") _list path;
    query_name = value_for_key (query_name_of_yojson) "QueryName" _list path;
    query_arn = value_for_key (query_arn_of_yojson) "QueryArn" _list path;
    query_id = value_for_key (query_id_of_yojson) "QueryId" _list path;
    
  }
  in _res

let stored_query_metadata_list_of_yojson = 
  fun tree path -> list_of_yojson stored_query_metadata_of_yojson tree path 

let query_expression_of_yojson = string_of_yojson

let stored_query_of_yojson = 
  fun tree path : stored_query ->
  let _list = assoc_of_yojson tree path in
  let _res : stored_query = {
    expression = option_of_yojson (value_for_key (query_expression_of_yojson) "Expression") _list path;
    description = option_of_yojson (value_for_key (query_description_of_yojson) "Description") _list path;
    query_name = value_for_key (query_name_of_yojson) "QueryName" _list path;
    query_arn = option_of_yojson (value_for_key (query_arn_of_yojson) "QueryArn") _list path;
    query_id = option_of_yojson (value_for_key (query_id_of_yojson) "QueryId") _list path;
    
  }
  in _res

let recorder_name_of_yojson = string_of_yojson

let stop_configuration_recorder_request_of_yojson = 
  fun tree path : stop_configuration_recorder_request ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_configuration_recorder_request = {
    configuration_recorder_name = value_for_key (recorder_name_of_yojson) "ConfigurationRecorderName" _list path;
    
  }
  in _res

let no_such_configuration_recorder_exception_of_yojson = 
  fun tree path : no_such_configuration_recorder_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_configuration_recorder_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let member_account_rule_status_of_yojson = 
  fun (tree: t) path : member_account_rule_status -> match tree with 
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
    | `String value -> raise (deserialize_unknown_enum_value_error path "MemberAccountRuleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MemberAccountRuleStatus")

let status_detail_filters_of_yojson = 
  fun tree path : status_detail_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : status_detail_filters = {
    member_account_rule_status = option_of_yojson (value_for_key (member_account_rule_status_of_yojson) "MemberAccountRuleStatus") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    
  }
  in _res

let static_parameter_values_of_yojson = 
  fun tree path -> list_of_yojson string_with_char_limit256_of_yojson tree path 

let static_value_of_yojson = 
  fun tree path : static_value ->
  let _list = assoc_of_yojson tree path in
  let _res : static_value = {
    values = value_for_key (static_parameter_values_of_yojson) "Values" _list path;
    
  }
  in _res

let resource_evaluation_id_of_yojson = string_of_yojson

let start_resource_evaluation_response_of_yojson = 
  fun tree path : start_resource_evaluation_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_resource_evaluation_response = {
    resource_evaluation_id = option_of_yojson (value_for_key (resource_evaluation_id_of_yojson) "ResourceEvaluationId") _list path;
    
  }
  in _res

let base_resource_id_of_yojson = string_of_yojson

let resource_configuration_of_yojson = string_of_yojson

let resource_configuration_schema_type_of_yojson = 
  fun (tree: t) path : resource_configuration_schema_type -> match tree with 
    | `String "CFN_RESOURCE_SCHEMA" -> CFN_RESOURCE_SCHEMA
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceConfigurationSchemaType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceConfigurationSchemaType")

let resource_details_of_yojson = 
  fun tree path : resource_details ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_details = {
    resource_configuration_schema_type = option_of_yojson (value_for_key (resource_configuration_schema_type_of_yojson) "ResourceConfigurationSchemaType") _list path;
    resource_configuration = value_for_key (resource_configuration_of_yojson) "ResourceConfiguration" _list path;
    resource_type = value_for_key (string_with_char_limit256_of_yojson) "ResourceType" _list path;
    resource_id = value_for_key (base_resource_id_of_yojson) "ResourceId" _list path;
    
  }
  in _res

let evaluation_context_identifier_of_yojson = string_of_yojson

let evaluation_context_of_yojson = 
  fun tree path : evaluation_context ->
  let _list = assoc_of_yojson tree path in
  let _res : evaluation_context = {
    evaluation_context_identifier = option_of_yojson (value_for_key (evaluation_context_identifier_of_yojson) "EvaluationContextIdentifier") _list path;
    
  }
  in _res

let evaluation_mode_of_yojson = 
  fun (tree: t) path : evaluation_mode -> match tree with 
    | `String "PROACTIVE" -> PROACTIVE
    | `String "DETECTIVE" -> DETECTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EvaluationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "EvaluationMode")

let evaluation_timeout_of_yojson = int_of_yojson

let client_token_of_yojson = string_of_yojson

let start_resource_evaluation_request_of_yojson = 
  fun tree path : start_resource_evaluation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_resource_evaluation_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "ClientToken") _list path;
    evaluation_timeout = option_of_yojson (value_for_key (evaluation_timeout_of_yojson) "EvaluationTimeout") _list path;
    evaluation_mode = value_for_key (evaluation_mode_of_yojson) "EvaluationMode" _list path;
    evaluation_context = option_of_yojson (value_for_key (evaluation_context_of_yojson) "EvaluationContext") _list path;
    resource_details = value_for_key (resource_details_of_yojson) "ResourceDetails" _list path;
    
  }
  in _res

let invalid_parameter_value_exception_of_yojson = 
  fun tree path : invalid_parameter_value_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameter_value_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let idempotent_parameter_mismatch_of_yojson = 
  fun tree path : idempotent_parameter_mismatch ->
  let _list = assoc_of_yojson tree path in
  let _res : idempotent_parameter_mismatch = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let resource_key_of_yojson = 
  fun tree path : resource_key ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_key = {
    resource_id = value_for_key (resource_id_of_yojson) "resourceId" _list path;
    resource_type = value_for_key (resource_type_of_yojson) "resourceType" _list path;
    
  }
  in _res

let resource_keys_of_yojson = 
  fun tree path -> list_of_yojson resource_key_of_yojson tree path 

let start_remediation_execution_response_of_yojson = 
  fun tree path : start_remediation_execution_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_remediation_execution_response = {
    failed_items = option_of_yojson (value_for_key (resource_keys_of_yojson) "FailedItems") _list path;
    failure_message = option_of_yojson (value_for_key (string__of_yojson) "FailureMessage") _list path;
    
  }
  in _res

let config_rule_name_of_yojson = string_of_yojson

let start_remediation_execution_request_of_yojson = 
  fun tree path : start_remediation_execution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_remediation_execution_request = {
    resource_keys = value_for_key (resource_keys_of_yojson) "ResourceKeys" _list path;
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let no_such_remediation_configuration_exception_of_yojson = 
  fun tree path : no_such_remediation_configuration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_remediation_configuration_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let insufficient_permissions_exception_of_yojson = 
  fun tree path : insufficient_permissions_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : insufficient_permissions_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let start_configuration_recorder_request_of_yojson = 
  fun tree path : start_configuration_recorder_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_configuration_recorder_request = {
    configuration_recorder_name = value_for_key (recorder_name_of_yojson) "ConfigurationRecorderName" _list path;
    
  }
  in _res

let no_available_delivery_channel_exception_of_yojson = 
  fun tree path : no_available_delivery_channel_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_available_delivery_channel_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let start_config_rules_evaluation_response_of_yojson = 
  fun tree path : start_config_rules_evaluation_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_config_rules_evaluation_response = ()
  in _res

let reevaluate_config_rule_names_of_yojson = 
  fun tree path -> list_of_yojson config_rule_name_of_yojson tree path 

let start_config_rules_evaluation_request_of_yojson = 
  fun tree path : start_config_rules_evaluation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_config_rules_evaluation_request = {
    config_rule_names = option_of_yojson (value_for_key (reevaluate_config_rule_names_of_yojson) "ConfigRuleNames") _list path;
    
  }
  in _res

let resource_in_use_exception_of_yojson = 
  fun tree path : resource_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_in_use_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let no_such_config_rule_exception_of_yojson = 
  fun tree path : no_such_config_rule_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_config_rule_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let limit_exceeded_exception_of_yojson = 
  fun tree path : limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_next_token_exception_of_yojson = 
  fun tree path : invalid_next_token_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_next_token_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_limit_exception_of_yojson = 
  fun tree path : invalid_limit_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_limit_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_expression_exception_of_yojson = 
  fun tree path : invalid_expression_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_expression_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let results_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let field_name_of_yojson = string_of_yojson

let field_info_of_yojson = 
  fun tree path : field_info ->
  let _list = assoc_of_yojson tree path in
  let _res : field_info = {
    name = option_of_yojson (value_for_key (field_name_of_yojson) "Name") _list path;
    
  }
  in _res

let field_info_list_of_yojson = 
  fun tree path -> list_of_yojson field_info_of_yojson tree path 

let query_info_of_yojson = 
  fun tree path : query_info ->
  let _list = assoc_of_yojson tree path in
  let _res : query_info = {
    select_fields = option_of_yojson (value_for_key (field_info_list_of_yojson) "SelectFields") _list path;
    
  }
  in _res

let next_token_of_yojson = string_of_yojson

let select_resource_config_response_of_yojson = 
  fun tree path : select_resource_config_response ->
  let _list = assoc_of_yojson tree path in
  let _res : select_resource_config_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    query_info = option_of_yojson (value_for_key (query_info_of_yojson) "QueryInfo") _list path;
    results = option_of_yojson (value_for_key (results_of_yojson) "Results") _list path;
    
  }
  in _res

let expression_of_yojson = string_of_yojson

let limit_of_yojson = int_of_yojson

let select_resource_config_request_of_yojson = 
  fun tree path : select_resource_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : select_resource_config_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    expression = value_for_key (expression_of_yojson) "Expression" _list path;
    
  }
  in _res

let no_such_configuration_aggregator_exception_of_yojson = 
  fun tree path : no_such_configuration_aggregator_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_configuration_aggregator_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let select_aggregate_resource_config_response_of_yojson = 
  fun tree path : select_aggregate_resource_config_response ->
  let _list = assoc_of_yojson tree path in
  let _res : select_aggregate_resource_config_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    query_info = option_of_yojson (value_for_key (query_info_of_yojson) "QueryInfo") _list path;
    results = option_of_yojson (value_for_key (results_of_yojson) "Results") _list path;
    
  }
  in _res

let configuration_aggregator_name_of_yojson = string_of_yojson

let select_aggregate_resource_config_request_of_yojson = 
  fun tree path : select_aggregate_resource_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : select_aggregate_resource_config_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (limit_of_yojson) "MaxResults") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    expression = value_for_key (expression_of_yojson) "Expression" _list path;
    
  }
  in _res

let resource_concurrent_modification_exception_of_yojson = 
  fun tree path : resource_concurrent_modification_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_concurrent_modification_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let put_stored_query_response_of_yojson = 
  fun tree path : put_stored_query_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_stored_query_response = {
    query_arn = option_of_yojson (value_for_key (query_arn_of_yojson) "QueryArn") _list path;
    
  }
  in _res

let put_stored_query_request_of_yojson = 
  fun tree path : put_stored_query_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_stored_query_request = {
    tags = option_of_yojson (value_for_key (tags_list_of_yojson) "Tags") _list path;
    stored_query = value_for_key (stored_query_of_yojson) "StoredQuery" _list path;
    
  }
  in _res

let max_number_of_retention_configurations_exceeded_exception_of_yojson = 
  fun tree path : max_number_of_retention_configurations_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : max_number_of_retention_configurations_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let retention_configuration_name_of_yojson = string_of_yojson

let retention_period_in_days_of_yojson = int_of_yojson

let retention_configuration_of_yojson = 
  fun tree path : retention_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : retention_configuration = {
    retention_period_in_days = value_for_key (retention_period_in_days_of_yojson) "RetentionPeriodInDays" _list path;
    name = value_for_key (retention_configuration_name_of_yojson) "Name" _list path;
    
  }
  in _res

let put_retention_configuration_response_of_yojson = 
  fun tree path : put_retention_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_retention_configuration_response = {
    retention_configuration = option_of_yojson (value_for_key (retention_configuration_of_yojson) "RetentionConfiguration") _list path;
    
  }
  in _res

let put_retention_configuration_request_of_yojson = 
  fun tree path : put_retention_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_retention_configuration_request = {
    retention_period_in_days = value_for_key (retention_period_in_days_of_yojson) "RetentionPeriodInDays" _list path;
    
  }
  in _res

let no_running_configuration_recorder_exception_of_yojson = 
  fun tree path : no_running_configuration_recorder_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_running_configuration_recorder_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let max_active_resources_exceeded_exception_of_yojson = 
  fun tree path : max_active_resources_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : max_active_resources_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let resource_type_string_of_yojson = string_of_yojson

let schema_version_id_of_yojson = string_of_yojson

let configuration_of_yojson = string_of_yojson

let put_resource_config_request_of_yojson = 
  fun tree path : put_resource_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_resource_config_request = {
    tags = option_of_yojson (value_for_key (tags_of_yojson) "Tags") _list path;
    configuration = value_for_key (configuration_of_yojson) "Configuration" _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "ResourceName") _list path;
    resource_id = value_for_key (resource_id_of_yojson) "ResourceId" _list path;
    schema_version_id = value_for_key (schema_version_id_of_yojson) "SchemaVersionId" _list path;
    resource_type = value_for_key (resource_type_string_of_yojson) "ResourceType" _list path;
    
  }
  in _res

let remediation_exception_of_yojson = 
  fun tree path : remediation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : remediation_exception = {
    expiration_time = option_of_yojson (value_for_key (date_of_yojson) "ExpirationTime") _list path;
    message = option_of_yojson (value_for_key (string_with_char_limit1024_of_yojson) "Message") _list path;
    resource_id = value_for_key (string_with_char_limit1024_of_yojson) "ResourceId" _list path;
    resource_type = value_for_key (string_with_char_limit256_of_yojson) "ResourceType" _list path;
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let remediation_exceptions_of_yojson = 
  fun tree path -> list_of_yojson remediation_exception_of_yojson tree path 

let failed_remediation_exception_batch_of_yojson = 
  fun tree path : failed_remediation_exception_batch ->
  let _list = assoc_of_yojson tree path in
  let _res : failed_remediation_exception_batch = {
    failed_items = option_of_yojson (value_for_key (remediation_exceptions_of_yojson) "FailedItems") _list path;
    failure_message = option_of_yojson (value_for_key (string__of_yojson) "FailureMessage") _list path;
    
  }
  in _res

let failed_remediation_exception_batches_of_yojson = 
  fun tree path -> list_of_yojson failed_remediation_exception_batch_of_yojson tree path 

let put_remediation_exceptions_response_of_yojson = 
  fun tree path : put_remediation_exceptions_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_remediation_exceptions_response = {
    failed_batches = option_of_yojson (value_for_key (failed_remediation_exception_batches_of_yojson) "FailedBatches") _list path;
    
  }
  in _res

let remediation_exception_resource_key_of_yojson = 
  fun tree path : remediation_exception_resource_key ->
  let _list = assoc_of_yojson tree path in
  let _res : remediation_exception_resource_key = {
    resource_id = option_of_yojson (value_for_key (string_with_char_limit1024_of_yojson) "ResourceId") _list path;
    resource_type = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "ResourceType") _list path;
    
  }
  in _res

let remediation_exception_resource_keys_of_yojson = 
  fun tree path -> list_of_yojson remediation_exception_resource_key_of_yojson tree path 

let put_remediation_exceptions_request_of_yojson = 
  fun tree path : put_remediation_exceptions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_remediation_exceptions_request = {
    expiration_time = option_of_yojson (value_for_key (date_of_yojson) "ExpirationTime") _list path;
    message = option_of_yojson (value_for_key (string_with_char_limit1024_of_yojson) "Message") _list path;
    resource_keys = value_for_key (remediation_exception_resource_keys_of_yojson) "ResourceKeys" _list path;
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let remediation_target_type_of_yojson = 
  fun (tree: t) path : remediation_target_type -> match tree with 
    | `String "SSM_DOCUMENT" -> SSM_DOCUMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "RemediationTargetType" value)
    | _ -> raise (deserialize_wrong_type_error path "RemediationTargetType")

let resource_value_type_of_yojson = 
  fun (tree: t) path : resource_value_type -> match tree with 
    | `String "RESOURCE_ID" -> RESOURCE_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceValueType")

let resource_value_of_yojson = 
  fun tree path : resource_value ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_value = {
    value = value_for_key (resource_value_type_of_yojson) "Value" _list path;
    
  }
  in _res

let remediation_parameter_value_of_yojson = 
  fun tree path : remediation_parameter_value ->
  let _list = assoc_of_yojson tree path in
  let _res : remediation_parameter_value = {
    static_value = option_of_yojson (value_for_key (static_value_of_yojson) "StaticValue") _list path;
    resource_value = option_of_yojson (value_for_key (resource_value_of_yojson) "ResourceValue") _list path;
    
  }
  in _res

let remediation_parameters_of_yojson = 
  fun tree path -> map_of_yojson remediation_parameter_value_of_yojson tree path

let boolean__of_yojson = bool_of_yojson

let percentage_of_yojson = int_of_yojson

let ssm_controls_of_yojson = 
  fun tree path : ssm_controls ->
  let _list = assoc_of_yojson tree path in
  let _res : ssm_controls = {
    error_percentage = option_of_yojson (value_for_key (percentage_of_yojson) "ErrorPercentage") _list path;
    concurrent_execution_rate_percentage = option_of_yojson (value_for_key (percentage_of_yojson) "ConcurrentExecutionRatePercentage") _list path;
    
  }
  in _res

let execution_controls_of_yojson = 
  fun tree path : execution_controls ->
  let _list = assoc_of_yojson tree path in
  let _res : execution_controls = {
    ssm_controls = option_of_yojson (value_for_key (ssm_controls_of_yojson) "SsmControls") _list path;
    
  }
  in _res

let auto_remediation_attempts_of_yojson = int_of_yojson

let auto_remediation_attempt_seconds_of_yojson = long_of_yojson

let remediation_configuration_of_yojson = 
  fun tree path : remediation_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : remediation_configuration = {
    created_by_service = option_of_yojson (value_for_key (string_with_char_limit1024_of_yojson) "CreatedByService") _list path;
    arn = option_of_yojson (value_for_key (string_with_char_limit1024_of_yojson) "Arn") _list path;
    retry_attempt_seconds = option_of_yojson (value_for_key (auto_remediation_attempt_seconds_of_yojson) "RetryAttemptSeconds") _list path;
    maximum_automatic_attempts = option_of_yojson (value_for_key (auto_remediation_attempts_of_yojson) "MaximumAutomaticAttempts") _list path;
    execution_controls = option_of_yojson (value_for_key (execution_controls_of_yojson) "ExecutionControls") _list path;
    automatic = option_of_yojson (value_for_key (boolean__of_yojson) "Automatic") _list path;
    resource_type = option_of_yojson (value_for_key (string__of_yojson) "ResourceType") _list path;
    parameters = option_of_yojson (value_for_key (remediation_parameters_of_yojson) "Parameters") _list path;
    target_version = option_of_yojson (value_for_key (string__of_yojson) "TargetVersion") _list path;
    target_id = value_for_key (string_with_char_limit256_of_yojson) "TargetId" _list path;
    target_type = value_for_key (remediation_target_type_of_yojson) "TargetType" _list path;
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let remediation_configurations_of_yojson = 
  fun tree path -> list_of_yojson remediation_configuration_of_yojson tree path 

let failed_remediation_batch_of_yojson = 
  fun tree path : failed_remediation_batch ->
  let _list = assoc_of_yojson tree path in
  let _res : failed_remediation_batch = {
    failed_items = option_of_yojson (value_for_key (remediation_configurations_of_yojson) "FailedItems") _list path;
    failure_message = option_of_yojson (value_for_key (string__of_yojson) "FailureMessage") _list path;
    
  }
  in _res

let failed_remediation_batches_of_yojson = 
  fun tree path -> list_of_yojson failed_remediation_batch_of_yojson tree path 

let put_remediation_configurations_response_of_yojson = 
  fun tree path : put_remediation_configurations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_remediation_configurations_response = {
    failed_batches = option_of_yojson (value_for_key (failed_remediation_batches_of_yojson) "FailedBatches") _list path;
    
  }
  in _res

let put_remediation_configurations_request_of_yojson = 
  fun tree path : put_remediation_configurations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_remediation_configurations_request = {
    remediation_configurations = value_for_key (remediation_configurations_of_yojson) "RemediationConfigurations" _list path;
    
  }
  in _res

let organization_conformance_pack_template_validation_exception_of_yojson = 
  fun tree path : organization_conformance_pack_template_validation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_conformance_pack_template_validation_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let organization_all_features_not_enabled_exception_of_yojson = 
  fun tree path : organization_all_features_not_enabled_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_all_features_not_enabled_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let organization_access_denied_exception_of_yojson = 
  fun tree path : organization_access_denied_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_access_denied_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let no_available_organization_exception_of_yojson = 
  fun tree path : no_available_organization_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_available_organization_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let max_number_of_organization_conformance_packs_exceeded_exception_of_yojson
= 
  fun tree path : max_number_of_organization_conformance_packs_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : max_number_of_organization_conformance_packs_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let put_organization_conformance_pack_response_of_yojson = 
  fun tree path : put_organization_conformance_pack_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_organization_conformance_pack_response = {
    organization_conformance_pack_arn = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "OrganizationConformancePackArn") _list path;
    
  }
  in _res

let organization_conformance_pack_name_of_yojson = string_of_yojson

let delivery_s3_bucket_of_yojson = string_of_yojson

let delivery_s3_key_prefix_of_yojson = string_of_yojson

let parameter_name_of_yojson = string_of_yojson

let parameter_value_of_yojson = string_of_yojson

let conformance_pack_input_parameter_of_yojson = 
  fun tree path : conformance_pack_input_parameter ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_input_parameter = {
    parameter_value = value_for_key (parameter_value_of_yojson) "ParameterValue" _list path;
    parameter_name = value_for_key (parameter_name_of_yojson) "ParameterName" _list path;
    
  }
  in _res

let conformance_pack_input_parameters_of_yojson = 
  fun tree path -> list_of_yojson conformance_pack_input_parameter_of_yojson tree path 

let excluded_accounts_of_yojson = 
  fun tree path -> list_of_yojson account_id_of_yojson tree path 

let put_organization_conformance_pack_request_of_yojson = 
  fun tree path : put_organization_conformance_pack_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_organization_conformance_pack_request = {
    excluded_accounts = option_of_yojson (value_for_key (excluded_accounts_of_yojson) "ExcludedAccounts") _list path;
    conformance_pack_input_parameters = option_of_yojson (value_for_key (conformance_pack_input_parameters_of_yojson) "ConformancePackInputParameters") _list path;
    delivery_s3_key_prefix = option_of_yojson (value_for_key (delivery_s3_key_prefix_of_yojson) "DeliveryS3KeyPrefix") _list path;
    delivery_s3_bucket = option_of_yojson (value_for_key (delivery_s3_bucket_of_yojson) "DeliveryS3Bucket") _list path;
    template_body = option_of_yojson (value_for_key (template_body_of_yojson) "TemplateBody") _list path;
    template_s3_uri = option_of_yojson (value_for_key (template_s3_uri_of_yojson) "TemplateS3Uri") _list path;
    organization_conformance_pack_name = value_for_key (organization_conformance_pack_name_of_yojson) "OrganizationConformancePackName" _list path;
    
  }
  in _res

let max_number_of_organization_config_rules_exceeded_exception_of_yojson = 
  fun tree path : max_number_of_organization_config_rules_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : max_number_of_organization_config_rules_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let put_organization_config_rule_response_of_yojson = 
  fun tree path : put_organization_config_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_organization_config_rule_response = {
    organization_config_rule_arn = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "OrganizationConfigRuleArn") _list path;
    
  }
  in _res

let organization_config_rule_name_of_yojson = string_of_yojson

let maximum_execution_frequency_of_yojson = 
  fun (tree: t) path : maximum_execution_frequency -> match tree with 
    | `String "TwentyFour_Hours" -> TwentyFour_Hours
    | `String "Twelve_Hours" -> Twelve_Hours
    | `String "Six_Hours" -> Six_Hours
    | `String "Three_Hours" -> Three_Hours
    | `String "One_Hour" -> One_Hour
    | `String value -> raise (deserialize_unknown_enum_value_error path "MaximumExecutionFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "MaximumExecutionFrequency")

let resource_types_scope_of_yojson = 
  fun tree path -> list_of_yojson string_with_char_limit256_of_yojson tree path 

let organization_managed_rule_metadata_of_yojson = 
  fun tree path : organization_managed_rule_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_managed_rule_metadata = {
    tag_value_scope = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "TagValueScope") _list path;
    tag_key_scope = option_of_yojson (value_for_key (string_with_char_limit128_of_yojson) "TagKeyScope") _list path;
    resource_id_scope = option_of_yojson (value_for_key (string_with_char_limit768_of_yojson) "ResourceIdScope") _list path;
    resource_types_scope = option_of_yojson (value_for_key (resource_types_scope_of_yojson) "ResourceTypesScope") _list path;
    maximum_execution_frequency = option_of_yojson (value_for_key (maximum_execution_frequency_of_yojson) "MaximumExecutionFrequency") _list path;
    input_parameters = option_of_yojson (value_for_key (string_with_char_limit2048_of_yojson) "InputParameters") _list path;
    rule_identifier = value_for_key (string_with_char_limit256_of_yojson) "RuleIdentifier" _list path;
    description = option_of_yojson (value_for_key (string_with_char_limit256_min0_of_yojson) "Description") _list path;
    
  }
  in _res

let organization_config_rule_trigger_type_of_yojson = 
  fun (tree: t) path : organization_config_rule_trigger_type -> match tree with 
    | `String "ScheduledNotification" -> SCHEDULED_NOTIFICATION
    | `String "OversizedConfigurationItemChangeNotification" -> OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION
    | `String "ConfigurationItemChangeNotification" -> CONFIGURATION_ITEM_CHANGE_NOTIFICATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "OrganizationConfigRuleTriggerType" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationConfigRuleTriggerType")

let organization_config_rule_trigger_types_of_yojson = 
  fun tree path -> list_of_yojson organization_config_rule_trigger_type_of_yojson tree path 

let organization_custom_rule_metadata_of_yojson = 
  fun tree path : organization_custom_rule_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_custom_rule_metadata = {
    tag_value_scope = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "TagValueScope") _list path;
    tag_key_scope = option_of_yojson (value_for_key (string_with_char_limit128_of_yojson) "TagKeyScope") _list path;
    resource_id_scope = option_of_yojson (value_for_key (string_with_char_limit768_of_yojson) "ResourceIdScope") _list path;
    resource_types_scope = option_of_yojson (value_for_key (resource_types_scope_of_yojson) "ResourceTypesScope") _list path;
    maximum_execution_frequency = option_of_yojson (value_for_key (maximum_execution_frequency_of_yojson) "MaximumExecutionFrequency") _list path;
    input_parameters = option_of_yojson (value_for_key (string_with_char_limit2048_of_yojson) "InputParameters") _list path;
    organization_config_rule_trigger_types = value_for_key (organization_config_rule_trigger_types_of_yojson) "OrganizationConfigRuleTriggerTypes" _list path;
    lambda_function_arn = value_for_key (string_with_char_limit256_of_yojson) "LambdaFunctionArn" _list path;
    description = option_of_yojson (value_for_key (string_with_char_limit256_min0_of_yojson) "Description") _list path;
    
  }
  in _res

let organization_config_rule_trigger_type_no_s_n_of_yojson = 
  fun (tree: t) path : organization_config_rule_trigger_type_no_s_n -> match tree with 
    | `String "OversizedConfigurationItemChangeNotification" -> OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION
    | `String "ConfigurationItemChangeNotification" -> CONFIGURATION_ITEM_CHANGE_NOTIFICATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "OrganizationConfigRuleTriggerTypeNoSN" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationConfigRuleTriggerTypeNoSN")

let organization_config_rule_trigger_type_no_s_ns_of_yojson = 
  fun tree path -> list_of_yojson organization_config_rule_trigger_type_no_s_n_of_yojson tree path 

let policy_runtime_of_yojson = string_of_yojson

let policy_text_of_yojson = string_of_yojson

let debug_log_delivery_accounts_of_yojson = 
  fun tree path -> list_of_yojson account_id_of_yojson tree path 

let organization_custom_policy_rule_metadata_of_yojson = 
  fun tree path : organization_custom_policy_rule_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_custom_policy_rule_metadata = {
    debug_log_delivery_accounts = option_of_yojson (value_for_key (debug_log_delivery_accounts_of_yojson) "DebugLogDeliveryAccounts") _list path;
    policy_text = value_for_key (policy_text_of_yojson) "PolicyText" _list path;
    policy_runtime = value_for_key (policy_runtime_of_yojson) "PolicyRuntime" _list path;
    tag_value_scope = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "TagValueScope") _list path;
    tag_key_scope = option_of_yojson (value_for_key (string_with_char_limit128_of_yojson) "TagKeyScope") _list path;
    resource_id_scope = option_of_yojson (value_for_key (string_with_char_limit768_of_yojson) "ResourceIdScope") _list path;
    resource_types_scope = option_of_yojson (value_for_key (resource_types_scope_of_yojson) "ResourceTypesScope") _list path;
    maximum_execution_frequency = option_of_yojson (value_for_key (maximum_execution_frequency_of_yojson) "MaximumExecutionFrequency") _list path;
    input_parameters = option_of_yojson (value_for_key (string_with_char_limit2048_of_yojson) "InputParameters") _list path;
    organization_config_rule_trigger_types = option_of_yojson (value_for_key (organization_config_rule_trigger_type_no_s_ns_of_yojson) "OrganizationConfigRuleTriggerTypes") _list path;
    description = option_of_yojson (value_for_key (string_with_char_limit256_min0_of_yojson) "Description") _list path;
    
  }
  in _res

let put_organization_config_rule_request_of_yojson = 
  fun tree path : put_organization_config_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_organization_config_rule_request = {
    organization_custom_policy_rule_metadata = option_of_yojson (value_for_key (organization_custom_policy_rule_metadata_of_yojson) "OrganizationCustomPolicyRuleMetadata") _list path;
    excluded_accounts = option_of_yojson (value_for_key (excluded_accounts_of_yojson) "ExcludedAccounts") _list path;
    organization_custom_rule_metadata = option_of_yojson (value_for_key (organization_custom_rule_metadata_of_yojson) "OrganizationCustomRuleMetadata") _list path;
    organization_managed_rule_metadata = option_of_yojson (value_for_key (organization_managed_rule_metadata_of_yojson) "OrganizationManagedRuleMetadata") _list path;
    organization_config_rule_name = value_for_key (organization_config_rule_name_of_yojson) "OrganizationConfigRuleName" _list path;
    
  }
  in _res

let put_external_evaluation_response_of_yojson = 
  fun tree path : put_external_evaluation_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_external_evaluation_response = ()
  in _res

let compliance_type_of_yojson = 
  fun (tree: t) path : compliance_type -> match tree with 
    | `String "INSUFFICIENT_DATA" -> Insufficient_Data
    | `String "NOT_APPLICABLE" -> Not_Applicable
    | `String "NON_COMPLIANT" -> Non_Compliant
    | `String "COMPLIANT" -> Compliant
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComplianceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComplianceType")

let ordering_timestamp_of_yojson = timestamp_of_yojson

let external_evaluation_of_yojson = 
  fun tree path : external_evaluation ->
  let _list = assoc_of_yojson tree path in
  let _res : external_evaluation = {
    ordering_timestamp = value_for_key (ordering_timestamp_of_yojson) "OrderingTimestamp" _list path;
    annotation = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "Annotation") _list path;
    compliance_type = value_for_key (compliance_type_of_yojson) "ComplianceType" _list path;
    compliance_resource_id = value_for_key (base_resource_id_of_yojson) "ComplianceResourceId" _list path;
    compliance_resource_type = value_for_key (string_with_char_limit256_of_yojson) "ComplianceResourceType" _list path;
    
  }
  in _res

let put_external_evaluation_request_of_yojson = 
  fun tree path : put_external_evaluation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_external_evaluation_request = {
    external_evaluation = value_for_key (external_evaluation_of_yojson) "ExternalEvaluation" _list path;
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let invalid_result_token_exception_of_yojson = 
  fun tree path : invalid_result_token_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_result_token_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let evaluation_of_yojson = 
  fun tree path : evaluation ->
  let _list = assoc_of_yojson tree path in
  let _res : evaluation = {
    ordering_timestamp = value_for_key (ordering_timestamp_of_yojson) "OrderingTimestamp" _list path;
    annotation = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "Annotation") _list path;
    compliance_type = value_for_key (compliance_type_of_yojson) "ComplianceType" _list path;
    compliance_resource_id = value_for_key (base_resource_id_of_yojson) "ComplianceResourceId" _list path;
    compliance_resource_type = value_for_key (string_with_char_limit256_of_yojson) "ComplianceResourceType" _list path;
    
  }
  in _res

let evaluations_of_yojson = 
  fun tree path -> list_of_yojson evaluation_of_yojson tree path 

let put_evaluations_response_of_yojson = 
  fun tree path : put_evaluations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_evaluations_response = {
    failed_evaluations = option_of_yojson (value_for_key (evaluations_of_yojson) "FailedEvaluations") _list path;
    
  }
  in _res

let put_evaluations_request_of_yojson = 
  fun tree path : put_evaluations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_evaluations_request = {
    test_mode = option_of_yojson (value_for_key (boolean__of_yojson) "TestMode") _list path;
    result_token = value_for_key (string__of_yojson) "ResultToken" _list path;
    evaluations = option_of_yojson (value_for_key (evaluations_of_yojson) "Evaluations") _list path;
    
  }
  in _res

let no_such_bucket_exception_of_yojson = 
  fun tree path : no_such_bucket_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_bucket_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let no_available_configuration_recorder_exception_of_yojson = 
  fun tree path : no_available_configuration_recorder_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_available_configuration_recorder_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let max_number_of_delivery_channels_exceeded_exception_of_yojson = 
  fun tree path : max_number_of_delivery_channels_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : max_number_of_delivery_channels_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_sns_topic_arn_exception_of_yojson = 
  fun tree path : invalid_sns_topic_arn_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_sns_topic_arn_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_s3_kms_key_arn_exception_of_yojson = 
  fun tree path : invalid_s3_kms_key_arn_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_s3_kms_key_arn_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_s3_key_prefix_exception_of_yojson = 
  fun tree path : invalid_s3_key_prefix_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_s3_key_prefix_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_delivery_channel_name_exception_of_yojson = 
  fun tree path : invalid_delivery_channel_name_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_delivery_channel_name_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let insufficient_delivery_policy_exception_of_yojson = 
  fun tree path : insufficient_delivery_policy_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : insufficient_delivery_policy_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let channel_name_of_yojson = string_of_yojson

let config_snapshot_delivery_properties_of_yojson = 
  fun tree path : config_snapshot_delivery_properties ->
  let _list = assoc_of_yojson tree path in
  let _res : config_snapshot_delivery_properties = {
    delivery_frequency = option_of_yojson (value_for_key (maximum_execution_frequency_of_yojson) "deliveryFrequency") _list path;
    
  }
  in _res

let delivery_channel_of_yojson = 
  fun tree path : delivery_channel ->
  let _list = assoc_of_yojson tree path in
  let _res : delivery_channel = {
    config_snapshot_delivery_properties = option_of_yojson (value_for_key (config_snapshot_delivery_properties_of_yojson) "configSnapshotDeliveryProperties") _list path;
    sns_topic_ar_n = option_of_yojson (value_for_key (string__of_yojson) "snsTopicARN") _list path;
    s3_kms_key_arn = option_of_yojson (value_for_key (string__of_yojson) "s3KmsKeyArn") _list path;
    s3_key_prefix = option_of_yojson (value_for_key (string__of_yojson) "s3KeyPrefix") _list path;
    s3_bucket_name = option_of_yojson (value_for_key (string__of_yojson) "s3BucketName") _list path;
    name = option_of_yojson (value_for_key (channel_name_of_yojson) "name") _list path;
    
  }
  in _res

let put_delivery_channel_request_of_yojson = 
  fun tree path : put_delivery_channel_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_delivery_channel_request = {
    delivery_channel = value_for_key (delivery_channel_of_yojson) "DeliveryChannel" _list path;
    
  }
  in _res

let max_number_of_conformance_packs_exceeded_exception_of_yojson = 
  fun tree path : max_number_of_conformance_packs_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : max_number_of_conformance_packs_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let conformance_pack_template_validation_exception_of_yojson = 
  fun tree path : conformance_pack_template_validation_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_template_validation_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let conformance_pack_arn_of_yojson = string_of_yojson

let put_conformance_pack_response_of_yojson = 
  fun tree path : put_conformance_pack_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_conformance_pack_response = {
    conformance_pack_arn = option_of_yojson (value_for_key (conformance_pack_arn_of_yojson) "ConformancePackArn") _list path;
    
  }
  in _res

let conformance_pack_name_of_yojson = string_of_yojson

let put_conformance_pack_request_of_yojson = 
  fun tree path : put_conformance_pack_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_conformance_pack_request = {
    template_ssm_document_details = option_of_yojson (value_for_key (template_ssm_document_details_of_yojson) "TemplateSSMDocumentDetails") _list path;
    conformance_pack_input_parameters = option_of_yojson (value_for_key (conformance_pack_input_parameters_of_yojson) "ConformancePackInputParameters") _list path;
    delivery_s3_key_prefix = option_of_yojson (value_for_key (delivery_s3_key_prefix_of_yojson) "DeliveryS3KeyPrefix") _list path;
    delivery_s3_bucket = option_of_yojson (value_for_key (delivery_s3_bucket_of_yojson) "DeliveryS3Bucket") _list path;
    template_body = option_of_yojson (value_for_key (template_body_of_yojson) "TemplateBody") _list path;
    template_s3_uri = option_of_yojson (value_for_key (template_s3_uri_of_yojson) "TemplateS3Uri") _list path;
    conformance_pack_name = value_for_key (conformance_pack_name_of_yojson) "ConformancePackName" _list path;
    
  }
  in _res

let max_number_of_configuration_recorders_exceeded_exception_of_yojson = 
  fun tree path : max_number_of_configuration_recorders_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : max_number_of_configuration_recorders_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_role_exception_of_yojson = 
  fun tree path : invalid_role_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_role_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_recording_group_exception_of_yojson = 
  fun tree path : invalid_recording_group_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_recording_group_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let invalid_configuration_recorder_name_exception_of_yojson = 
  fun tree path : invalid_configuration_recorder_name_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_configuration_recorder_name_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let all_supported_of_yojson = bool_of_yojson

let include_global_resource_types_of_yojson = bool_of_yojson

let resource_type_list_of_yojson = 
  fun tree path -> list_of_yojson resource_type_of_yojson tree path 

let exclusion_by_resource_types_of_yojson = 
  fun tree path : exclusion_by_resource_types ->
  let _list = assoc_of_yojson tree path in
  let _res : exclusion_by_resource_types = {
    resource_types = option_of_yojson (value_for_key (resource_type_list_of_yojson) "resourceTypes") _list path;
    
  }
  in _res

let recording_strategy_type_of_yojson = 
  fun (tree: t) path : recording_strategy_type -> match tree with 
    | `String "EXCLUSION_BY_RESOURCE_TYPES" -> EXCLUSION_BY_RESOURCE_TYPES
    | `String "INCLUSION_BY_RESOURCE_TYPES" -> INCLUSION_BY_RESOURCE_TYPES
    | `String "ALL_SUPPORTED_RESOURCE_TYPES" -> ALL_SUPPORTED_RESOURCE_TYPES
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordingStrategyType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordingStrategyType")

let recording_strategy_of_yojson = 
  fun tree path : recording_strategy ->
  let _list = assoc_of_yojson tree path in
  let _res : recording_strategy = {
    use_only = option_of_yojson (value_for_key (recording_strategy_type_of_yojson) "useOnly") _list path;
    
  }
  in _res

let recording_group_of_yojson = 
  fun tree path : recording_group ->
  let _list = assoc_of_yojson tree path in
  let _res : recording_group = {
    recording_strategy = option_of_yojson (value_for_key (recording_strategy_of_yojson) "recordingStrategy") _list path;
    exclusion_by_resource_types = option_of_yojson (value_for_key (exclusion_by_resource_types_of_yojson) "exclusionByResourceTypes") _list path;
    resource_types = option_of_yojson (value_for_key (resource_type_list_of_yojson) "resourceTypes") _list path;
    include_global_resource_types = option_of_yojson (value_for_key (include_global_resource_types_of_yojson) "includeGlobalResourceTypes") _list path;
    all_supported = option_of_yojson (value_for_key (all_supported_of_yojson) "allSupported") _list path;
    
  }
  in _res

let recording_frequency_of_yojson = 
  fun (tree: t) path : recording_frequency -> match tree with 
    | `String "DAILY" -> DAILY
    | `String "CONTINUOUS" -> CONTINUOUS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordingFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordingFrequency")

let description_of_yojson = string_of_yojson

let recording_mode_resource_types_list_of_yojson = 
  fun tree path -> list_of_yojson resource_type_of_yojson tree path 

let recording_mode_override_of_yojson = 
  fun tree path : recording_mode_override ->
  let _list = assoc_of_yojson tree path in
  let _res : recording_mode_override = {
    recording_frequency = value_for_key (recording_frequency_of_yojson) "recordingFrequency" _list path;
    resource_types = value_for_key (recording_mode_resource_types_list_of_yojson) "resourceTypes" _list path;
    description = option_of_yojson (value_for_key (description_of_yojson) "description") _list path;
    
  }
  in _res

let recording_mode_overrides_of_yojson = 
  fun tree path -> list_of_yojson recording_mode_override_of_yojson tree path 

let recording_mode_of_yojson = 
  fun tree path : recording_mode ->
  let _list = assoc_of_yojson tree path in
  let _res : recording_mode = {
    recording_mode_overrides = option_of_yojson (value_for_key (recording_mode_overrides_of_yojson) "recordingModeOverrides") _list path;
    recording_frequency = value_for_key (recording_frequency_of_yojson) "recordingFrequency" _list path;
    
  }
  in _res

let configuration_recorder_of_yojson = 
  fun tree path : configuration_recorder ->
  let _list = assoc_of_yojson tree path in
  let _res : configuration_recorder = {
    recording_mode = option_of_yojson (value_for_key (recording_mode_of_yojson) "recordingMode") _list path;
    recording_group = option_of_yojson (value_for_key (recording_group_of_yojson) "recordingGroup") _list path;
    role_ar_n = option_of_yojson (value_for_key (string__of_yojson) "roleARN") _list path;
    name = option_of_yojson (value_for_key (recorder_name_of_yojson) "name") _list path;
    
  }
  in _res

let put_configuration_recorder_request_of_yojson = 
  fun tree path : put_configuration_recorder_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_configuration_recorder_request = {
    configuration_recorder = value_for_key (configuration_recorder_of_yojson) "ConfigurationRecorder" _list path;
    
  }
  in _res

let configuration_aggregator_arn_of_yojson = string_of_yojson

let account_aggregation_source_account_list_of_yojson = 
  fun tree path -> list_of_yojson account_id_of_yojson tree path 

let aggregator_region_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let account_aggregation_source_of_yojson = 
  fun tree path : account_aggregation_source ->
  let _list = assoc_of_yojson tree path in
  let _res : account_aggregation_source = {
    aws_regions = option_of_yojson (value_for_key (aggregator_region_list_of_yojson) "AwsRegions") _list path;
    all_aws_regions = option_of_yojson (value_for_key (boolean__of_yojson) "AllAwsRegions") _list path;
    account_ids = value_for_key (account_aggregation_source_account_list_of_yojson) "AccountIds" _list path;
    
  }
  in _res

let account_aggregation_source_list_of_yojson = 
  fun tree path -> list_of_yojson account_aggregation_source_of_yojson tree path 

let organization_aggregation_source_of_yojson = 
  fun tree path : organization_aggregation_source ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_aggregation_source = {
    all_aws_regions = option_of_yojson (value_for_key (boolean__of_yojson) "AllAwsRegions") _list path;
    aws_regions = option_of_yojson (value_for_key (aggregator_region_list_of_yojson) "AwsRegions") _list path;
    role_arn = value_for_key (string__of_yojson) "RoleArn" _list path;
    
  }
  in _res

let configuration_aggregator_of_yojson = 
  fun tree path : configuration_aggregator ->
  let _list = assoc_of_yojson tree path in
  let _res : configuration_aggregator = {
    created_by = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "CreatedBy") _list path;
    last_updated_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdatedTime") _list path;
    creation_time = option_of_yojson (value_for_key (date_of_yojson) "CreationTime") _list path;
    organization_aggregation_source = option_of_yojson (value_for_key (organization_aggregation_source_of_yojson) "OrganizationAggregationSource") _list path;
    account_aggregation_sources = option_of_yojson (value_for_key (account_aggregation_source_list_of_yojson) "AccountAggregationSources") _list path;
    configuration_aggregator_arn = option_of_yojson (value_for_key (configuration_aggregator_arn_of_yojson) "ConfigurationAggregatorArn") _list path;
    configuration_aggregator_name = option_of_yojson (value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName") _list path;
    
  }
  in _res

let put_configuration_aggregator_response_of_yojson = 
  fun tree path : put_configuration_aggregator_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_configuration_aggregator_response = {
    configuration_aggregator = option_of_yojson (value_for_key (configuration_aggregator_of_yojson) "ConfigurationAggregator") _list path;
    
  }
  in _res

let put_configuration_aggregator_request_of_yojson = 
  fun tree path : put_configuration_aggregator_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_configuration_aggregator_request = {
    tags = option_of_yojson (value_for_key (tags_list_of_yojson) "Tags") _list path;
    organization_aggregation_source = option_of_yojson (value_for_key (organization_aggregation_source_of_yojson) "OrganizationAggregationSource") _list path;
    account_aggregation_sources = option_of_yojson (value_for_key (account_aggregation_source_list_of_yojson) "AccountAggregationSources") _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let max_number_of_config_rules_exceeded_exception_of_yojson = 
  fun tree path : max_number_of_config_rules_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : max_number_of_config_rules_exceeded_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let emptiable_string_with_char_limit256_of_yojson = string_of_yojson

let compliance_resource_types_of_yojson = 
  fun tree path -> list_of_yojson string_with_char_limit256_of_yojson tree path 

let scope_of_yojson = 
  fun tree path : scope ->
  let _list = assoc_of_yojson tree path in
  let _res : scope = {
    compliance_resource_id = option_of_yojson (value_for_key (base_resource_id_of_yojson) "ComplianceResourceId") _list path;
    tag_value = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "TagValue") _list path;
    tag_key = option_of_yojson (value_for_key (string_with_char_limit128_of_yojson) "TagKey") _list path;
    compliance_resource_types = option_of_yojson (value_for_key (compliance_resource_types_of_yojson) "ComplianceResourceTypes") _list path;
    
  }
  in _res

let owner_of_yojson = 
  fun (tree: t) path : owner -> match tree with 
    | `String "CUSTOM_POLICY" -> Custom_Policy
    | `String "AWS" -> Aws
    | `String "CUSTOM_LAMBDA" -> Custom_Lambda
    | `String value -> raise (deserialize_unknown_enum_value_error path "Owner" value)
    | _ -> raise (deserialize_wrong_type_error path "Owner")

let event_source_of_yojson = 
  fun (tree: t) path : event_source -> match tree with 
    | `String "aws.config" -> Aws_Config
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventSource" value)
    | _ -> raise (deserialize_wrong_type_error path "EventSource")

let message_type_of_yojson = 
  fun (tree: t) path : message_type -> match tree with 
    | `String "OversizedConfigurationItemChangeNotification" -> OversizedConfigurationItemChangeNotification
    | `String "ScheduledNotification" -> ScheduledNotification
    | `String "ConfigurationSnapshotDeliveryCompleted" -> ConfigurationSnapshotDeliveryCompleted
    | `String "ConfigurationItemChangeNotification" -> ConfigurationItemChangeNotification
    | `String value -> raise (deserialize_unknown_enum_value_error path "MessageType" value)
    | _ -> raise (deserialize_wrong_type_error path "MessageType")

let source_detail_of_yojson = 
  fun tree path : source_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : source_detail = {
    maximum_execution_frequency = option_of_yojson (value_for_key (maximum_execution_frequency_of_yojson) "MaximumExecutionFrequency") _list path;
    message_type = option_of_yojson (value_for_key (message_type_of_yojson) "MessageType") _list path;
    event_source = option_of_yojson (value_for_key (event_source_of_yojson) "EventSource") _list path;
    
  }
  in _res

let source_details_of_yojson = 
  fun tree path -> list_of_yojson source_detail_of_yojson tree path 

let custom_policy_details_of_yojson = 
  fun tree path : custom_policy_details ->
  let _list = assoc_of_yojson tree path in
  let _res : custom_policy_details = {
    enable_debug_log_delivery = option_of_yojson (value_for_key (boolean__of_yojson) "EnableDebugLogDelivery") _list path;
    policy_text = value_for_key (policy_text_of_yojson) "PolicyText" _list path;
    policy_runtime = value_for_key (policy_runtime_of_yojson) "PolicyRuntime" _list path;
    
  }
  in _res

let source_of_yojson = 
  fun tree path : source ->
  let _list = assoc_of_yojson tree path in
  let _res : source = {
    custom_policy_details = option_of_yojson (value_for_key (custom_policy_details_of_yojson) "CustomPolicyDetails") _list path;
    source_details = option_of_yojson (value_for_key (source_details_of_yojson) "SourceDetails") _list path;
    source_identifier = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "SourceIdentifier") _list path;
    owner = value_for_key (owner_of_yojson) "Owner" _list path;
    
  }
  in _res

let config_rule_state_of_yojson = 
  fun (tree: t) path : config_rule_state -> match tree with 
    | `String "EVALUATING" -> EVALUATING
    | `String "DELETING_RESULTS" -> DELETING_RESULTS
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConfigRuleState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigRuleState")

let evaluation_mode_configuration_of_yojson = 
  fun tree path : evaluation_mode_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : evaluation_mode_configuration = {
    mode = option_of_yojson (value_for_key (evaluation_mode_of_yojson) "Mode") _list path;
    
  }
  in _res

let evaluation_modes_of_yojson = 
  fun tree path -> list_of_yojson evaluation_mode_configuration_of_yojson tree path 

let config_rule_of_yojson = 
  fun tree path : config_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : config_rule = {
    evaluation_modes = option_of_yojson (value_for_key (evaluation_modes_of_yojson) "EvaluationModes") _list path;
    created_by = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "CreatedBy") _list path;
    config_rule_state = option_of_yojson (value_for_key (config_rule_state_of_yojson) "ConfigRuleState") _list path;
    maximum_execution_frequency = option_of_yojson (value_for_key (maximum_execution_frequency_of_yojson) "MaximumExecutionFrequency") _list path;
    input_parameters = option_of_yojson (value_for_key (string_with_char_limit1024_of_yojson) "InputParameters") _list path;
    source = value_for_key (source_of_yojson) "Source" _list path;
    scope = option_of_yojson (value_for_key (scope_of_yojson) "Scope") _list path;
    description = option_of_yojson (value_for_key (emptiable_string_with_char_limit256_of_yojson) "Description") _list path;
    config_rule_id = option_of_yojson (value_for_key (string_with_char_limit64_of_yojson) "ConfigRuleId") _list path;
    config_rule_arn = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "ConfigRuleArn") _list path;
    config_rule_name = option_of_yojson (value_for_key (config_rule_name_of_yojson) "ConfigRuleName") _list path;
    
  }
  in _res

let put_config_rule_request_of_yojson = 
  fun tree path : put_config_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_config_rule_request = {
    tags = option_of_yojson (value_for_key (tags_list_of_yojson) "Tags") _list path;
    config_rule = value_for_key (config_rule_of_yojson) "ConfigRule" _list path;
    
  }
  in _res

let aggregation_authorization_of_yojson = 
  fun tree path : aggregation_authorization ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregation_authorization = {
    creation_time = option_of_yojson (value_for_key (date_of_yojson) "CreationTime") _list path;
    authorized_aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "AuthorizedAwsRegion") _list path;
    authorized_account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AuthorizedAccountId") _list path;
    aggregation_authorization_arn = option_of_yojson (value_for_key (string__of_yojson) "AggregationAuthorizationArn") _list path;
    
  }
  in _res

let put_aggregation_authorization_response_of_yojson = 
  fun tree path : put_aggregation_authorization_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_aggregation_authorization_response = {
    aggregation_authorization = option_of_yojson (value_for_key (aggregation_authorization_of_yojson) "AggregationAuthorization") _list path;
    
  }
  in _res

let put_aggregation_authorization_request_of_yojson = 
  fun tree path : put_aggregation_authorization_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_aggregation_authorization_request = {
    tags = option_of_yojson (value_for_key (tags_list_of_yojson) "Tags") _list path;
    authorized_aws_region = value_for_key (aws_region_of_yojson) "AuthorizedAwsRegion" _list path;
    authorized_account_id = value_for_key (account_id_of_yojson) "AuthorizedAccountId" _list path;
    
  }
  in _res

let list_tags_for_resource_response_of_yojson = 
  fun tree path : list_tags_for_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    
  }
  in _res

let list_tags_for_resource_request_of_yojson = 
  fun tree path : list_tags_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    resource_arn = value_for_key (amazon_resource_name_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let list_stored_queries_response_of_yojson = 
  fun tree path : list_stored_queries_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_stored_queries_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    stored_query_metadata = option_of_yojson (value_for_key (stored_query_metadata_list_of_yojson) "StoredQueryMetadata") _list path;
    
  }
  in _res

let list_stored_queries_request_of_yojson = 
  fun tree path : list_stored_queries_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_stored_queries_request = {
    max_results = option_of_yojson (value_for_key (limit_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let invalid_time_range_exception_of_yojson = 
  fun tree path : invalid_time_range_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_time_range_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let resource_evaluation_of_yojson = 
  fun tree path : resource_evaluation ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_evaluation = {
    evaluation_start_timestamp = option_of_yojson (value_for_key (date_of_yojson) "EvaluationStartTimestamp") _list path;
    evaluation_mode = option_of_yojson (value_for_key (evaluation_mode_of_yojson) "EvaluationMode") _list path;
    resource_evaluation_id = option_of_yojson (value_for_key (resource_evaluation_id_of_yojson) "ResourceEvaluationId") _list path;
    
  }
  in _res

let resource_evaluations_of_yojson = 
  fun tree path -> list_of_yojson resource_evaluation_of_yojson tree path 

let list_resource_evaluations_response_of_yojson = 
  fun tree path : list_resource_evaluations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resource_evaluations_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    resource_evaluations = option_of_yojson (value_for_key (resource_evaluations_of_yojson) "ResourceEvaluations") _list path;
    
  }
  in _res

let resource_evaluation_filters_of_yojson = 
  fun tree path : resource_evaluation_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_evaluation_filters = {
    evaluation_context_identifier = option_of_yojson (value_for_key (evaluation_context_identifier_of_yojson) "EvaluationContextIdentifier") _list path;
    time_window = option_of_yojson (value_for_key (time_window_of_yojson) "TimeWindow") _list path;
    evaluation_mode = option_of_yojson (value_for_key (evaluation_mode_of_yojson) "EvaluationMode") _list path;
    
  }
  in _res

let list_resource_evaluations_page_item_limit_of_yojson = int_of_yojson

let list_resource_evaluations_request_of_yojson = 
  fun tree path : list_resource_evaluations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resource_evaluations_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (list_resource_evaluations_page_item_limit_of_yojson) "Limit") _list path;
    filters = option_of_yojson (value_for_key (resource_evaluation_filters_of_yojson) "Filters") _list path;
    
  }
  in _res

let resource_deletion_time_of_yojson = timestamp_of_yojson

let resource_identifier_of_yojson = 
  fun tree path : resource_identifier ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_identifier = {
    resource_deletion_time = option_of_yojson (value_for_key (resource_deletion_time_of_yojson) "resourceDeletionTime") _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "resourceName") _list path;
    resource_id = option_of_yojson (value_for_key (resource_id_of_yojson) "resourceId") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    
  }
  in _res

let resource_identifier_list_of_yojson = 
  fun tree path -> list_of_yojson resource_identifier_of_yojson tree path 

let list_discovered_resources_response_of_yojson = 
  fun tree path : list_discovered_resources_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_discovered_resources_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    resource_identifiers = option_of_yojson (value_for_key (resource_identifier_list_of_yojson) "resourceIdentifiers") _list path;
    
  }
  in _res

let resource_id_list_of_yojson = 
  fun tree path -> list_of_yojson resource_id_of_yojson tree path 

let list_discovered_resources_request_of_yojson = 
  fun tree path : list_discovered_resources_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_discovered_resources_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    include_deleted_resources = option_of_yojson (value_for_key (boolean__of_yojson) "includeDeletedResources") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "limit") _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "resourceName") _list path;
    resource_ids = option_of_yojson (value_for_key (resource_id_list_of_yojson) "resourceIds") _list path;
    resource_type = value_for_key (resource_type_of_yojson) "resourceType" _list path;
    
  }
  in _res

let compliance_score_of_yojson = string_of_yojson

let last_updated_time_of_yojson = timestamp_of_yojson

let conformance_pack_compliance_score_of_yojson = 
  fun tree path : conformance_pack_compliance_score ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_compliance_score = {
    last_updated_time = option_of_yojson (value_for_key (last_updated_time_of_yojson) "LastUpdatedTime") _list path;
    conformance_pack_name = option_of_yojson (value_for_key (conformance_pack_name_of_yojson) "ConformancePackName") _list path;
    score = option_of_yojson (value_for_key (compliance_score_of_yojson) "Score") _list path;
    
  }
  in _res

let conformance_pack_compliance_scores_of_yojson = 
  fun tree path -> list_of_yojson conformance_pack_compliance_score_of_yojson tree path 

let list_conformance_pack_compliance_scores_response_of_yojson = 
  fun tree path : list_conformance_pack_compliance_scores_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_conformance_pack_compliance_scores_response = {
    conformance_pack_compliance_scores = value_for_key (conformance_pack_compliance_scores_of_yojson) "ConformancePackComplianceScores" _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    
  }
  in _res

let conformance_pack_name_filter_of_yojson = 
  fun tree path -> list_of_yojson conformance_pack_name_of_yojson tree path 

let conformance_pack_compliance_scores_filters_of_yojson = 
  fun tree path : conformance_pack_compliance_scores_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_compliance_scores_filters = {
    conformance_pack_names = value_for_key (conformance_pack_name_filter_of_yojson) "ConformancePackNames" _list path;
    
  }
  in _res

let sort_order_of_yojson = 
  fun (tree: t) path : sort_order -> match tree with 
    | `String "DESCENDING" -> DESCENDING
    | `String "ASCENDING" -> ASCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")

let sort_by_of_yojson = 
  fun (tree: t) path : sort_by -> match tree with 
    | `String "SCORE" -> SCORE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortBy" value)
    | _ -> raise (deserialize_wrong_type_error path "SortBy")

let page_size_limit_of_yojson = int_of_yojson

let list_conformance_pack_compliance_scores_request_of_yojson = 
  fun tree path : list_conformance_pack_compliance_scores_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_conformance_pack_compliance_scores_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (page_size_limit_of_yojson) "Limit") _list path;
    sort_by = option_of_yojson (value_for_key (sort_by_of_yojson) "SortBy") _list path;
    sort_order = option_of_yojson (value_for_key (sort_order_of_yojson) "SortOrder") _list path;
    filters = option_of_yojson (value_for_key (conformance_pack_compliance_scores_filters_of_yojson) "Filters") _list path;
    
  }
  in _res

let discovered_resource_identifier_list_of_yojson = 
  fun tree path -> list_of_yojson aggregate_resource_identifier_of_yojson tree path 

let list_aggregate_discovered_resources_response_of_yojson = 
  fun tree path : list_aggregate_discovered_resources_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_aggregate_discovered_resources_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    resource_identifiers = option_of_yojson (value_for_key (discovered_resource_identifier_list_of_yojson) "ResourceIdentifiers") _list path;
    
  }
  in _res

let resource_filters_of_yojson = 
  fun tree path : resource_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_filters = {
    region = option_of_yojson (value_for_key (aws_region_of_yojson) "Region") _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "ResourceName") _list path;
    resource_id = option_of_yojson (value_for_key (resource_id_of_yojson) "ResourceId") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    
  }
  in _res

let list_aggregate_discovered_resources_request_of_yojson = 
  fun tree path : list_aggregate_discovered_resources_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_aggregate_discovered_resources_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    filters = option_of_yojson (value_for_key (resource_filters_of_yojson) "Filters") _list path;
    resource_type = value_for_key (resource_type_of_yojson) "ResourceType" _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let get_stored_query_response_of_yojson = 
  fun tree path : get_stored_query_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_stored_query_response = {
    stored_query = option_of_yojson (value_for_key (stored_query_of_yojson) "StoredQuery") _list path;
    
  }
  in _res

let get_stored_query_request_of_yojson = 
  fun tree path : get_stored_query_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_stored_query_request = {
    query_name = value_for_key (query_name_of_yojson) "QueryName" _list path;
    
  }
  in _res

let resource_evaluation_status_of_yojson = 
  fun (tree: t) path : resource_evaluation_status -> match tree with 
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceEvaluationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceEvaluationStatus")

let evaluation_status_of_yojson = 
  fun tree path : evaluation_status ->
  let _list = assoc_of_yojson tree path in
  let _res : evaluation_status = {
    failure_reason = option_of_yojson (value_for_key (string_with_char_limit1024_of_yojson) "FailureReason") _list path;
    status = value_for_key (resource_evaluation_status_of_yojson) "Status" _list path;
    
  }
  in _res

let get_resource_evaluation_summary_response_of_yojson = 
  fun tree path : get_resource_evaluation_summary_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_evaluation_summary_response = {
    resource_details = option_of_yojson (value_for_key (resource_details_of_yojson) "ResourceDetails") _list path;
    evaluation_context = option_of_yojson (value_for_key (evaluation_context_of_yojson) "EvaluationContext") _list path;
    compliance = option_of_yojson (value_for_key (compliance_type_of_yojson) "Compliance") _list path;
    evaluation_start_timestamp = option_of_yojson (value_for_key (date_of_yojson) "EvaluationStartTimestamp") _list path;
    evaluation_status = option_of_yojson (value_for_key (evaluation_status_of_yojson) "EvaluationStatus") _list path;
    evaluation_mode = option_of_yojson (value_for_key (evaluation_mode_of_yojson) "EvaluationMode") _list path;
    resource_evaluation_id = option_of_yojson (value_for_key (resource_evaluation_id_of_yojson) "ResourceEvaluationId") _list path;
    
  }
  in _res

let get_resource_evaluation_summary_request_of_yojson = 
  fun tree path : get_resource_evaluation_summary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_evaluation_summary_request = {
    resource_evaluation_id = value_for_key (resource_evaluation_id_of_yojson) "ResourceEvaluationId" _list path;
    
  }
  in _res

let resource_not_discovered_exception_of_yojson = 
  fun tree path : resource_not_discovered_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_discovered_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let configuration_item_capture_time_of_yojson = timestamp_of_yojson

let configuration_item_status_of_yojson = 
  fun (tree: t) path : configuration_item_status -> match tree with 
    | `String "ResourceDeletedNotRecorded" -> ResourceDeletedNotRecorded
    | `String "ResourceDeleted" -> ResourceDeleted
    | `String "ResourceNotRecorded" -> ResourceNotRecorded
    | `String "ResourceDiscovered" -> ResourceDiscovered
    | `String "OK" -> OK
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConfigurationItemStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigurationItemStatus")

let configuration_state_id_of_yojson = string_of_yojson

let configuration_item_md5_hash_of_yojson = string_of_yojson

let ar_n_of_yojson = string_of_yojson

let availability_zone_of_yojson = string_of_yojson

let resource_creation_time_of_yojson = timestamp_of_yojson

let related_event_of_yojson = string_of_yojson

let related_event_list_of_yojson = 
  fun tree path -> list_of_yojson related_event_of_yojson tree path 

let relationship_name_of_yojson = string_of_yojson

let relationship_of_yojson = 
  fun tree path : relationship ->
  let _list = assoc_of_yojson tree path in
  let _res : relationship = {
    relationship_name = option_of_yojson (value_for_key (relationship_name_of_yojson) "relationshipName") _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "resourceName") _list path;
    resource_id = option_of_yojson (value_for_key (resource_id_of_yojson) "resourceId") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    
  }
  in _res

let relationship_list_of_yojson = 
  fun tree path -> list_of_yojson relationship_of_yojson tree path 

let configuration_item_delivery_time_of_yojson = timestamp_of_yojson

let configuration_item_of_yojson = 
  fun tree path : configuration_item ->
  let _list = assoc_of_yojson tree path in
  let _res : configuration_item = {
    configuration_item_delivery_time = option_of_yojson (value_for_key (configuration_item_delivery_time_of_yojson) "configurationItemDeliveryTime") _list path;
    recording_frequency = option_of_yojson (value_for_key (recording_frequency_of_yojson) "recordingFrequency") _list path;
    supplementary_configuration = option_of_yojson (value_for_key (supplementary_configuration_of_yojson) "supplementaryConfiguration") _list path;
    configuration = option_of_yojson (value_for_key (configuration_of_yojson) "configuration") _list path;
    relationships = option_of_yojson (value_for_key (relationship_list_of_yojson) "relationships") _list path;
    related_events = option_of_yojson (value_for_key (related_event_list_of_yojson) "relatedEvents") _list path;
    tags = option_of_yojson (value_for_key (tags_of_yojson) "tags") _list path;
    resource_creation_time = option_of_yojson (value_for_key (resource_creation_time_of_yojson) "resourceCreationTime") _list path;
    availability_zone = option_of_yojson (value_for_key (availability_zone_of_yojson) "availabilityZone") _list path;
    aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "awsRegion") _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "resourceName") _list path;
    resource_id = option_of_yojson (value_for_key (resource_id_of_yojson) "resourceId") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    arn = option_of_yojson (value_for_key (ar_n_of_yojson) "arn") _list path;
    configuration_item_md5_hash = option_of_yojson (value_for_key (configuration_item_md5_hash_of_yojson) "configurationItemMD5Hash") _list path;
    configuration_state_id = option_of_yojson (value_for_key (configuration_state_id_of_yojson) "configurationStateId") _list path;
    configuration_item_status = option_of_yojson (value_for_key (configuration_item_status_of_yojson) "configurationItemStatus") _list path;
    configuration_item_capture_time = option_of_yojson (value_for_key (configuration_item_capture_time_of_yojson) "configurationItemCaptureTime") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "accountId") _list path;
    version = option_of_yojson (value_for_key (version_of_yojson) "version") _list path;
    
  }
  in _res

let configuration_item_list_of_yojson = 
  fun tree path -> list_of_yojson configuration_item_of_yojson tree path 

let get_resource_config_history_response_of_yojson = 
  fun tree path : get_resource_config_history_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_config_history_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    configuration_items = option_of_yojson (value_for_key (configuration_item_list_of_yojson) "configurationItems") _list path;
    
  }
  in _res

let later_time_of_yojson = timestamp_of_yojson

let earlier_time_of_yojson = timestamp_of_yojson

let chronological_order_of_yojson = 
  fun (tree: t) path : chronological_order -> match tree with 
    | `String "Forward" -> Forward
    | `String "Reverse" -> Reverse
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChronologicalOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "ChronologicalOrder")

let get_resource_config_history_request_of_yojson = 
  fun tree path : get_resource_config_history_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_config_history_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "limit") _list path;
    chronological_order = option_of_yojson (value_for_key (chronological_order_of_yojson) "chronologicalOrder") _list path;
    earlier_time = option_of_yojson (value_for_key (earlier_time_of_yojson) "earlierTime") _list path;
    later_time = option_of_yojson (value_for_key (later_time_of_yojson) "laterTime") _list path;
    resource_id = value_for_key (resource_id_of_yojson) "resourceId" _list path;
    resource_type = value_for_key (resource_type_of_yojson) "resourceType" _list path;
    
  }
  in _res

let no_such_organization_config_rule_exception_of_yojson = 
  fun tree path : no_such_organization_config_rule_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_organization_config_rule_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let get_organization_custom_rule_policy_response_of_yojson = 
  fun tree path : get_organization_custom_rule_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_organization_custom_rule_policy_response = {
    policy_text = option_of_yojson (value_for_key (policy_text_of_yojson) "PolicyText") _list path;
    
  }
  in _res

let get_organization_custom_rule_policy_request_of_yojson = 
  fun tree path : get_organization_custom_rule_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_organization_custom_rule_policy_request = {
    organization_config_rule_name = value_for_key (organization_config_rule_name_of_yojson) "OrganizationConfigRuleName" _list path;
    
  }
  in _res

let no_such_organization_conformance_pack_exception_of_yojson = 
  fun tree path : no_such_organization_conformance_pack_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_organization_conformance_pack_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let organization_resource_detailed_status_of_yojson = 
  fun (tree: t) path : organization_resource_detailed_status -> match tree with 
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
    | `String value -> raise (deserialize_unknown_enum_value_error path "OrganizationResourceDetailedStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationResourceDetailedStatus")

let organization_conformance_pack_detailed_status_of_yojson = 
  fun tree path : organization_conformance_pack_detailed_status ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_conformance_pack_detailed_status = {
    last_update_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdateTime") _list path;
    error_message = option_of_yojson (value_for_key (string__of_yojson) "ErrorMessage") _list path;
    error_code = option_of_yojson (value_for_key (string__of_yojson) "ErrorCode") _list path;
    status = value_for_key (organization_resource_detailed_status_of_yojson) "Status" _list path;
    conformance_pack_name = value_for_key (string_with_char_limit256_of_yojson) "ConformancePackName" _list path;
    account_id = value_for_key (account_id_of_yojson) "AccountId" _list path;
    
  }
  in _res

let organization_conformance_pack_detailed_statuses_of_yojson = 
  fun tree path -> list_of_yojson organization_conformance_pack_detailed_status_of_yojson tree path 

let get_organization_conformance_pack_detailed_status_response_of_yojson = 
  fun tree path : get_organization_conformance_pack_detailed_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_organization_conformance_pack_detailed_status_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    organization_conformance_pack_detailed_statuses = option_of_yojson (value_for_key (organization_conformance_pack_detailed_statuses_of_yojson) "OrganizationConformancePackDetailedStatuses") _list path;
    
  }
  in _res

let organization_resource_detailed_status_filters_of_yojson = 
  fun tree path : organization_resource_detailed_status_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_resource_detailed_status_filters = {
    status = option_of_yojson (value_for_key (organization_resource_detailed_status_of_yojson) "Status") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    
  }
  in _res

let cosmos_page_limit_of_yojson = int_of_yojson

let get_organization_conformance_pack_detailed_status_request_of_yojson = 
  fun tree path : get_organization_conformance_pack_detailed_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_organization_conformance_pack_detailed_status_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (cosmos_page_limit_of_yojson) "Limit") _list path;
    filters = option_of_yojson (value_for_key (organization_resource_detailed_status_filters_of_yojson) "Filters") _list path;
    organization_conformance_pack_name = value_for_key (organization_conformance_pack_name_of_yojson) "OrganizationConformancePackName" _list path;
    
  }
  in _res

let member_account_status_of_yojson = 
  fun tree path : member_account_status ->
  let _list = assoc_of_yojson tree path in
  let _res : member_account_status = {
    last_update_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdateTime") _list path;
    error_message = option_of_yojson (value_for_key (string__of_yojson) "ErrorMessage") _list path;
    error_code = option_of_yojson (value_for_key (string__of_yojson) "ErrorCode") _list path;
    member_account_rule_status = value_for_key (member_account_rule_status_of_yojson) "MemberAccountRuleStatus" _list path;
    config_rule_name = value_for_key (string_with_char_limit64_of_yojson) "ConfigRuleName" _list path;
    account_id = value_for_key (account_id_of_yojson) "AccountId" _list path;
    
  }
  in _res

let organization_config_rule_detailed_status_of_yojson = 
  fun tree path -> list_of_yojson member_account_status_of_yojson tree path 

let get_organization_config_rule_detailed_status_response_of_yojson = 
  fun tree path : get_organization_config_rule_detailed_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_organization_config_rule_detailed_status_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    organization_config_rule_detailed_status = option_of_yojson (value_for_key (organization_config_rule_detailed_status_of_yojson) "OrganizationConfigRuleDetailedStatus") _list path;
    
  }
  in _res

let get_organization_config_rule_detailed_status_request_of_yojson = 
  fun tree path : get_organization_config_rule_detailed_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_organization_config_rule_detailed_status_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (cosmos_page_limit_of_yojson) "Limit") _list path;
    filters = option_of_yojson (value_for_key (status_detail_filters_of_yojson) "Filters") _list path;
    organization_config_rule_name = value_for_key (organization_config_rule_name_of_yojson) "OrganizationConfigRuleName" _list path;
    
  }
  in _res

let long_of_yojson = long_of_yojson

let resource_count_of_yojson = 
  fun tree path : resource_count ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_count = {
    count = option_of_yojson (value_for_key (long_of_yojson) "count") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    
  }
  in _res

let resource_counts_of_yojson = 
  fun tree path -> list_of_yojson resource_count_of_yojson tree path 

let get_discovered_resource_counts_response_of_yojson = 
  fun tree path : get_discovered_resource_counts_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_discovered_resource_counts_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    resource_counts = option_of_yojson (value_for_key (resource_counts_of_yojson) "resourceCounts") _list path;
    total_discovered_resources = option_of_yojson (value_for_key (long_of_yojson) "totalDiscoveredResources") _list path;
    
  }
  in _res

let resource_types_of_yojson = 
  fun tree path -> list_of_yojson string_with_char_limit256_of_yojson tree path 

let get_discovered_resource_counts_request_of_yojson = 
  fun tree path : get_discovered_resource_counts_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_discovered_resource_counts_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "nextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "limit") _list path;
    resource_types = option_of_yojson (value_for_key (resource_types_of_yojson) "resourceTypes") _list path;
    
  }
  in _res

let get_custom_rule_policy_response_of_yojson = 
  fun tree path : get_custom_rule_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_custom_rule_policy_response = {
    policy_text = option_of_yojson (value_for_key (policy_text_of_yojson) "PolicyText") _list path;
    
  }
  in _res

let get_custom_rule_policy_request_of_yojson = 
  fun tree path : get_custom_rule_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_custom_rule_policy_request = {
    config_rule_name = option_of_yojson (value_for_key (config_rule_name_of_yojson) "ConfigRuleName") _list path;
    
  }
  in _res

let no_such_conformance_pack_exception_of_yojson = 
  fun tree path : no_such_conformance_pack_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_conformance_pack_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let conformance_pack_compliance_type_of_yojson = 
  fun (tree: t) path : conformance_pack_compliance_type -> match tree with 
    | `String "INSUFFICIENT_DATA" -> INSUFFICIENT_DATA
    | `String "NON_COMPLIANT" -> NON_COMPLIANT
    | `String "COMPLIANT" -> COMPLIANT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConformancePackComplianceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ConformancePackComplianceType")

let conformance_pack_compliance_summary_of_yojson = 
  fun tree path : conformance_pack_compliance_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_compliance_summary = {
    conformance_pack_compliance_status = value_for_key (conformance_pack_compliance_type_of_yojson) "ConformancePackComplianceStatus" _list path;
    conformance_pack_name = value_for_key (conformance_pack_name_of_yojson) "ConformancePackName" _list path;
    
  }
  in _res

let conformance_pack_compliance_summary_list_of_yojson = 
  fun tree path -> list_of_yojson conformance_pack_compliance_summary_of_yojson tree path 

let get_conformance_pack_compliance_summary_response_of_yojson = 
  fun tree path : get_conformance_pack_compliance_summary_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_conformance_pack_compliance_summary_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    conformance_pack_compliance_summary_list = option_of_yojson (value_for_key (conformance_pack_compliance_summary_list_of_yojson) "ConformancePackComplianceSummaryList") _list path;
    
  }
  in _res

let conformance_pack_names_to_summarize_list_of_yojson = 
  fun tree path -> list_of_yojson conformance_pack_name_of_yojson tree path 

let get_conformance_pack_compliance_summary_request_of_yojson = 
  fun tree path : get_conformance_pack_compliance_summary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_conformance_pack_compliance_summary_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (page_size_limit_of_yojson) "Limit") _list path;
    conformance_pack_names = value_for_key (conformance_pack_names_to_summarize_list_of_yojson) "ConformancePackNames" _list path;
    
  }
  in _res

let no_such_config_rule_in_conformance_pack_exception_of_yojson = 
  fun tree path : no_such_config_rule_in_conformance_pack_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_config_rule_in_conformance_pack_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let evaluation_result_qualifier_of_yojson = 
  fun tree path : evaluation_result_qualifier ->
  let _list = assoc_of_yojson tree path in
  let _res : evaluation_result_qualifier = {
    evaluation_mode = option_of_yojson (value_for_key (evaluation_mode_of_yojson) "EvaluationMode") _list path;
    resource_id = option_of_yojson (value_for_key (base_resource_id_of_yojson) "ResourceId") _list path;
    resource_type = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "ResourceType") _list path;
    config_rule_name = option_of_yojson (value_for_key (config_rule_name_of_yojson) "ConfigRuleName") _list path;
    
  }
  in _res

let evaluation_result_identifier_of_yojson = 
  fun tree path : evaluation_result_identifier ->
  let _list = assoc_of_yojson tree path in
  let _res : evaluation_result_identifier = {
    resource_evaluation_id = option_of_yojson (value_for_key (resource_evaluation_id_of_yojson) "ResourceEvaluationId") _list path;
    ordering_timestamp = option_of_yojson (value_for_key (date_of_yojson) "OrderingTimestamp") _list path;
    evaluation_result_qualifier = option_of_yojson (value_for_key (evaluation_result_qualifier_of_yojson) "EvaluationResultQualifier") _list path;
    
  }
  in _res

let annotation_of_yojson = string_of_yojson

let conformance_pack_evaluation_result_of_yojson = 
  fun tree path : conformance_pack_evaluation_result ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_evaluation_result = {
    annotation = option_of_yojson (value_for_key (annotation_of_yojson) "Annotation") _list path;
    result_recorded_time = value_for_key (date_of_yojson) "ResultRecordedTime" _list path;
    config_rule_invoked_time = value_for_key (date_of_yojson) "ConfigRuleInvokedTime" _list path;
    evaluation_result_identifier = value_for_key (evaluation_result_identifier_of_yojson) "EvaluationResultIdentifier" _list path;
    compliance_type = value_for_key (conformance_pack_compliance_type_of_yojson) "ComplianceType" _list path;
    
  }
  in _res

let conformance_pack_rule_evaluation_results_list_of_yojson = 
  fun tree path -> list_of_yojson conformance_pack_evaluation_result_of_yojson tree path 

let get_conformance_pack_compliance_details_response_of_yojson = 
  fun tree path : get_conformance_pack_compliance_details_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_conformance_pack_compliance_details_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    conformance_pack_rule_evaluation_results = option_of_yojson (value_for_key (conformance_pack_rule_evaluation_results_list_of_yojson) "ConformancePackRuleEvaluationResults") _list path;
    conformance_pack_name = value_for_key (conformance_pack_name_of_yojson) "ConformancePackName" _list path;
    
  }
  in _res

let conformance_pack_config_rule_names_of_yojson = 
  fun tree path -> list_of_yojson string_with_char_limit64_of_yojson tree path 

let conformance_pack_compliance_resource_ids_of_yojson = 
  fun tree path -> list_of_yojson string_with_char_limit256_of_yojson tree path 

let conformance_pack_evaluation_filters_of_yojson = 
  fun tree path : conformance_pack_evaluation_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_evaluation_filters = {
    resource_ids = option_of_yojson (value_for_key (conformance_pack_compliance_resource_ids_of_yojson) "ResourceIds") _list path;
    resource_type = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "ResourceType") _list path;
    compliance_type = option_of_yojson (value_for_key (conformance_pack_compliance_type_of_yojson) "ComplianceType") _list path;
    config_rule_names = option_of_yojson (value_for_key (conformance_pack_config_rule_names_of_yojson) "ConfigRuleNames") _list path;
    
  }
  in _res

let get_conformance_pack_compliance_details_limit_of_yojson = 
  int_of_yojson

let get_conformance_pack_compliance_details_request_of_yojson = 
  fun tree path : get_conformance_pack_compliance_details_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_conformance_pack_compliance_details_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (get_conformance_pack_compliance_details_limit_of_yojson) "Limit") _list path;
    filters = option_of_yojson (value_for_key (conformance_pack_evaluation_filters_of_yojson) "Filters") _list path;
    conformance_pack_name = value_for_key (conformance_pack_name_of_yojson) "ConformancePackName" _list path;
    
  }
  in _res

let integer__of_yojson = int_of_yojson

let compliance_contributor_count_of_yojson = 
  fun tree path : compliance_contributor_count ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_contributor_count = {
    cap_exceeded = option_of_yojson (value_for_key (boolean__of_yojson) "CapExceeded") _list path;
    capped_count = option_of_yojson (value_for_key (integer__of_yojson) "CappedCount") _list path;
    
  }
  in _res

let compliance_summary_of_yojson = 
  fun tree path : compliance_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_summary = {
    compliance_summary_timestamp = option_of_yojson (value_for_key (date_of_yojson) "ComplianceSummaryTimestamp") _list path;
    non_compliant_resource_count = option_of_yojson (value_for_key (compliance_contributor_count_of_yojson) "NonCompliantResourceCount") _list path;
    compliant_resource_count = option_of_yojson (value_for_key (compliance_contributor_count_of_yojson) "CompliantResourceCount") _list path;
    
  }
  in _res

let compliance_summary_by_resource_type_of_yojson = 
  fun tree path : compliance_summary_by_resource_type ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_summary_by_resource_type = {
    compliance_summary = option_of_yojson (value_for_key (compliance_summary_of_yojson) "ComplianceSummary") _list path;
    resource_type = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "ResourceType") _list path;
    
  }
  in _res

let compliance_summaries_by_resource_type_of_yojson = 
  fun tree path -> list_of_yojson compliance_summary_by_resource_type_of_yojson tree path 

let get_compliance_summary_by_resource_type_response_of_yojson = 
  fun tree path : get_compliance_summary_by_resource_type_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_compliance_summary_by_resource_type_response = {
    compliance_summaries_by_resource_type = option_of_yojson (value_for_key (compliance_summaries_by_resource_type_of_yojson) "ComplianceSummariesByResourceType") _list path;
    
  }
  in _res

let get_compliance_summary_by_resource_type_request_of_yojson = 
  fun tree path : get_compliance_summary_by_resource_type_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_compliance_summary_by_resource_type_request = {
    resource_types = option_of_yojson (value_for_key (resource_types_of_yojson) "ResourceTypes") _list path;
    
  }
  in _res

let get_compliance_summary_by_config_rule_response_of_yojson = 
  fun tree path : get_compliance_summary_by_config_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_compliance_summary_by_config_rule_response = {
    compliance_summary = option_of_yojson (value_for_key (compliance_summary_of_yojson) "ComplianceSummary") _list path;
    
  }
  in _res

let evaluation_result_of_yojson = 
  fun tree path : evaluation_result ->
  let _list = assoc_of_yojson tree path in
  let _res : evaluation_result = {
    result_token = option_of_yojson (value_for_key (string__of_yojson) "ResultToken") _list path;
    annotation = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "Annotation") _list path;
    config_rule_invoked_time = option_of_yojson (value_for_key (date_of_yojson) "ConfigRuleInvokedTime") _list path;
    result_recorded_time = option_of_yojson (value_for_key (date_of_yojson) "ResultRecordedTime") _list path;
    compliance_type = option_of_yojson (value_for_key (compliance_type_of_yojson) "ComplianceType") _list path;
    evaluation_result_identifier = option_of_yojson (value_for_key (evaluation_result_identifier_of_yojson) "EvaluationResultIdentifier") _list path;
    
  }
  in _res

let evaluation_results_of_yojson = 
  fun tree path -> list_of_yojson evaluation_result_of_yojson tree path 

let get_compliance_details_by_resource_response_of_yojson = 
  fun tree path : get_compliance_details_by_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_compliance_details_by_resource_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    evaluation_results = option_of_yojson (value_for_key (evaluation_results_of_yojson) "EvaluationResults") _list path;
    
  }
  in _res

let compliance_types_of_yojson = 
  fun tree path -> list_of_yojson compliance_type_of_yojson tree path 

let get_compliance_details_by_resource_request_of_yojson = 
  fun tree path : get_compliance_details_by_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_compliance_details_by_resource_request = {
    resource_evaluation_id = option_of_yojson (value_for_key (resource_evaluation_id_of_yojson) "ResourceEvaluationId") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    compliance_types = option_of_yojson (value_for_key (compliance_types_of_yojson) "ComplianceTypes") _list path;
    resource_id = option_of_yojson (value_for_key (base_resource_id_of_yojson) "ResourceId") _list path;
    resource_type = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "ResourceType") _list path;
    
  }
  in _res

let get_compliance_details_by_config_rule_response_of_yojson = 
  fun tree path : get_compliance_details_by_config_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_compliance_details_by_config_rule_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    evaluation_results = option_of_yojson (value_for_key (evaluation_results_of_yojson) "EvaluationResults") _list path;
    
  }
  in _res

let get_compliance_details_by_config_rule_request_of_yojson = 
  fun tree path : get_compliance_details_by_config_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_compliance_details_by_config_rule_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    compliance_types = option_of_yojson (value_for_key (compliance_types_of_yojson) "ComplianceTypes") _list path;
    config_rule_name = value_for_key (string_with_char_limit64_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let oversized_configuration_item_exception_of_yojson = 
  fun tree path : oversized_configuration_item_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : oversized_configuration_item_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let get_aggregate_resource_config_response_of_yojson = 
  fun tree path : get_aggregate_resource_config_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_aggregate_resource_config_response = {
    configuration_item = option_of_yojson (value_for_key (configuration_item_of_yojson) "ConfigurationItem") _list path;
    
  }
  in _res

let get_aggregate_resource_config_request_of_yojson = 
  fun tree path : get_aggregate_resource_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_aggregate_resource_config_request = {
    resource_identifier = value_for_key (aggregate_resource_identifier_of_yojson) "ResourceIdentifier" _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let grouped_resource_count_of_yojson = 
  fun tree path : grouped_resource_count ->
  let _list = assoc_of_yojson tree path in
  let _res : grouped_resource_count = {
    resource_count = value_for_key (long_of_yojson) "ResourceCount" _list path;
    group_name = value_for_key (string_with_char_limit256_of_yojson) "GroupName" _list path;
    
  }
  in _res

let grouped_resource_count_list_of_yojson = 
  fun tree path -> list_of_yojson grouped_resource_count_of_yojson tree path 

let get_aggregate_discovered_resource_counts_response_of_yojson = 
  fun tree path : get_aggregate_discovered_resource_counts_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_aggregate_discovered_resource_counts_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    grouped_resource_counts = option_of_yojson (value_for_key (grouped_resource_count_list_of_yojson) "GroupedResourceCounts") _list path;
    group_by_key = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "GroupByKey") _list path;
    total_discovered_resources = value_for_key (long_of_yojson) "TotalDiscoveredResources" _list path;
    
  }
  in _res

let resource_count_filters_of_yojson = 
  fun tree path : resource_count_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_count_filters = {
    region = option_of_yojson (value_for_key (aws_region_of_yojson) "Region") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "ResourceType") _list path;
    
  }
  in _res

let resource_count_group_key_of_yojson = 
  fun (tree: t) path : resource_count_group_key -> match tree with 
    | `String "AWS_REGION" -> AWS_REGION
    | `String "ACCOUNT_ID" -> ACCOUNT_ID
    | `String "RESOURCE_TYPE" -> RESOURCE_TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceCountGroupKey" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceCountGroupKey")

let group_by_api_limit_of_yojson = int_of_yojson

let get_aggregate_discovered_resource_counts_request_of_yojson = 
  fun tree path : get_aggregate_discovered_resource_counts_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_aggregate_discovered_resource_counts_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (group_by_api_limit_of_yojson) "Limit") _list path;
    group_by_key = option_of_yojson (value_for_key (resource_count_group_key_of_yojson) "GroupByKey") _list path;
    filters = option_of_yojson (value_for_key (resource_count_filters_of_yojson) "Filters") _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let aggregate_conformance_pack_compliance_count_of_yojson = 
  fun tree path : aggregate_conformance_pack_compliance_count ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregate_conformance_pack_compliance_count = {
    non_compliant_conformance_pack_count = option_of_yojson (value_for_key (integer__of_yojson) "NonCompliantConformancePackCount") _list path;
    compliant_conformance_pack_count = option_of_yojson (value_for_key (integer__of_yojson) "CompliantConformancePackCount") _list path;
    
  }
  in _res

let aggregate_conformance_pack_compliance_summary_of_yojson = 
  fun tree path : aggregate_conformance_pack_compliance_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregate_conformance_pack_compliance_summary = {
    group_name = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "GroupName") _list path;
    compliance_summary = option_of_yojson (value_for_key (aggregate_conformance_pack_compliance_count_of_yojson) "ComplianceSummary") _list path;
    
  }
  in _res

let aggregate_conformance_pack_compliance_summary_list_of_yojson = 
  fun tree path -> list_of_yojson aggregate_conformance_pack_compliance_summary_of_yojson tree path 

let get_aggregate_conformance_pack_compliance_summary_response_of_yojson = 
  fun tree path : get_aggregate_conformance_pack_compliance_summary_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_aggregate_conformance_pack_compliance_summary_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    group_by_key = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "GroupByKey") _list path;
    aggregate_conformance_pack_compliance_summaries = option_of_yojson (value_for_key (aggregate_conformance_pack_compliance_summary_list_of_yojson) "AggregateConformancePackComplianceSummaries") _list path;
    
  }
  in _res

let aggregate_conformance_pack_compliance_summary_filters_of_yojson = 
  fun tree path : aggregate_conformance_pack_compliance_summary_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregate_conformance_pack_compliance_summary_filters = {
    aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "AwsRegion") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    
  }
  in _res

let aggregate_conformance_pack_compliance_summary_group_key_of_yojson = 
  fun (tree: t) path : aggregate_conformance_pack_compliance_summary_group_key -> match tree with 
    | `String "AWS_REGION" -> AWS_REGION
    | `String "ACCOUNT_ID" -> ACCOUNT_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "AggregateConformancePackComplianceSummaryGroupKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AggregateConformancePackComplianceSummaryGroupKey")

let get_aggregate_conformance_pack_compliance_summary_request_of_yojson = 
  fun tree path : get_aggregate_conformance_pack_compliance_summary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_aggregate_conformance_pack_compliance_summary_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    group_by_key = option_of_yojson (value_for_key (aggregate_conformance_pack_compliance_summary_group_key_of_yojson) "GroupByKey") _list path;
    filters = option_of_yojson (value_for_key (aggregate_conformance_pack_compliance_summary_filters_of_yojson) "Filters") _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let aggregate_compliance_count_of_yojson = 
  fun tree path : aggregate_compliance_count ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregate_compliance_count = {
    compliance_summary = option_of_yojson (value_for_key (compliance_summary_of_yojson) "ComplianceSummary") _list path;
    group_name = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "GroupName") _list path;
    
  }
  in _res

let aggregate_compliance_count_list_of_yojson = 
  fun tree path -> list_of_yojson aggregate_compliance_count_of_yojson tree path 

let get_aggregate_config_rule_compliance_summary_response_of_yojson = 
  fun tree path : get_aggregate_config_rule_compliance_summary_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_aggregate_config_rule_compliance_summary_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    aggregate_compliance_counts = option_of_yojson (value_for_key (aggregate_compliance_count_list_of_yojson) "AggregateComplianceCounts") _list path;
    group_by_key = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "GroupByKey") _list path;
    
  }
  in _res

let config_rule_compliance_summary_filters_of_yojson = 
  fun tree path : config_rule_compliance_summary_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : config_rule_compliance_summary_filters = {
    aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "AwsRegion") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    
  }
  in _res

let config_rule_compliance_summary_group_key_of_yojson = 
  fun (tree: t) path : config_rule_compliance_summary_group_key -> match tree with 
    | `String "AWS_REGION" -> AWS_REGION
    | `String "ACCOUNT_ID" -> ACCOUNT_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConfigRuleComplianceSummaryGroupKey" value)
    | _ -> raise (deserialize_wrong_type_error path "ConfigRuleComplianceSummaryGroupKey")

let get_aggregate_config_rule_compliance_summary_request_of_yojson = 
  fun tree path : get_aggregate_config_rule_compliance_summary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_aggregate_config_rule_compliance_summary_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (group_by_api_limit_of_yojson) "Limit") _list path;
    group_by_key = option_of_yojson (value_for_key (config_rule_compliance_summary_group_key_of_yojson) "GroupByKey") _list path;
    filters = option_of_yojson (value_for_key (config_rule_compliance_summary_filters_of_yojson) "Filters") _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let aggregate_evaluation_result_of_yojson = 
  fun tree path : aggregate_evaluation_result ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregate_evaluation_result = {
    aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "AwsRegion") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    annotation = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "Annotation") _list path;
    config_rule_invoked_time = option_of_yojson (value_for_key (date_of_yojson) "ConfigRuleInvokedTime") _list path;
    result_recorded_time = option_of_yojson (value_for_key (date_of_yojson) "ResultRecordedTime") _list path;
    compliance_type = option_of_yojson (value_for_key (compliance_type_of_yojson) "ComplianceType") _list path;
    evaluation_result_identifier = option_of_yojson (value_for_key (evaluation_result_identifier_of_yojson) "EvaluationResultIdentifier") _list path;
    
  }
  in _res

let aggregate_evaluation_result_list_of_yojson = 
  fun tree path -> list_of_yojson aggregate_evaluation_result_of_yojson tree path 

let get_aggregate_compliance_details_by_config_rule_response_of_yojson = 
  fun tree path : get_aggregate_compliance_details_by_config_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_aggregate_compliance_details_by_config_rule_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    aggregate_evaluation_results = option_of_yojson (value_for_key (aggregate_evaluation_result_list_of_yojson) "AggregateEvaluationResults") _list path;
    
  }
  in _res

let get_aggregate_compliance_details_by_config_rule_request_of_yojson = 
  fun tree path : get_aggregate_compliance_details_by_config_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_aggregate_compliance_details_by_config_rule_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    compliance_type = option_of_yojson (value_for_key (compliance_type_of_yojson) "ComplianceType") _list path;
    aws_region = value_for_key (aws_region_of_yojson) "AwsRegion" _list path;
    account_id = value_for_key (account_id_of_yojson) "AccountId" _list path;
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let no_such_retention_configuration_exception_of_yojson = 
  fun tree path : no_such_retention_configuration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_retention_configuration_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let retention_configuration_list_of_yojson = 
  fun tree path -> list_of_yojson retention_configuration_of_yojson tree path 

let describe_retention_configurations_response_of_yojson = 
  fun tree path : describe_retention_configurations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_retention_configurations_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    retention_configurations = option_of_yojson (value_for_key (retention_configuration_list_of_yojson) "RetentionConfigurations") _list path;
    
  }
  in _res

let retention_configuration_name_list_of_yojson = 
  fun tree path -> list_of_yojson retention_configuration_name_of_yojson tree path 

let describe_retention_configurations_request_of_yojson = 
  fun tree path : describe_retention_configurations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_retention_configurations_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    retention_configuration_names = option_of_yojson (value_for_key (retention_configuration_name_list_of_yojson) "RetentionConfigurationNames") _list path;
    
  }
  in _res

let remediation_execution_state_of_yojson = 
  fun (tree: t) path : remediation_execution_state -> match tree with 
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RemediationExecutionState" value)
    | _ -> raise (deserialize_wrong_type_error path "RemediationExecutionState")

let remediation_execution_step_state_of_yojson = 
  fun (tree: t) path : remediation_execution_step_state -> match tree with 
    | `String "FAILED" -> FAILED
    | `String "PENDING" -> PENDING
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RemediationExecutionStepState" value)
    | _ -> raise (deserialize_wrong_type_error path "RemediationExecutionStepState")

let remediation_execution_step_of_yojson = 
  fun tree path : remediation_execution_step ->
  let _list = assoc_of_yojson tree path in
  let _res : remediation_execution_step = {
    stop_time = option_of_yojson (value_for_key (date_of_yojson) "StopTime") _list path;
    start_time = option_of_yojson (value_for_key (date_of_yojson) "StartTime") _list path;
    error_message = option_of_yojson (value_for_key (string__of_yojson) "ErrorMessage") _list path;
    state = option_of_yojson (value_for_key (remediation_execution_step_state_of_yojson) "State") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    
  }
  in _res

let remediation_execution_steps_of_yojson = 
  fun tree path -> list_of_yojson remediation_execution_step_of_yojson tree path 

let remediation_execution_status_of_yojson = 
  fun tree path : remediation_execution_status ->
  let _list = assoc_of_yojson tree path in
  let _res : remediation_execution_status = {
    last_updated_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdatedTime") _list path;
    invocation_time = option_of_yojson (value_for_key (date_of_yojson) "InvocationTime") _list path;
    step_details = option_of_yojson (value_for_key (remediation_execution_steps_of_yojson) "StepDetails") _list path;
    state = option_of_yojson (value_for_key (remediation_execution_state_of_yojson) "State") _list path;
    resource_key = option_of_yojson (value_for_key (resource_key_of_yojson) "ResourceKey") _list path;
    
  }
  in _res

let remediation_execution_statuses_of_yojson = 
  fun tree path -> list_of_yojson remediation_execution_status_of_yojson tree path 

let describe_remediation_execution_status_response_of_yojson = 
  fun tree path : describe_remediation_execution_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_remediation_execution_status_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    remediation_execution_statuses = option_of_yojson (value_for_key (remediation_execution_statuses_of_yojson) "RemediationExecutionStatuses") _list path;
    
  }
  in _res

let describe_remediation_execution_status_request_of_yojson = 
  fun tree path : describe_remediation_execution_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_remediation_execution_status_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    resource_keys = option_of_yojson (value_for_key (resource_keys_of_yojson) "ResourceKeys") _list path;
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let describe_remediation_exceptions_response_of_yojson = 
  fun tree path : describe_remediation_exceptions_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_remediation_exceptions_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    remediation_exceptions = option_of_yojson (value_for_key (remediation_exceptions_of_yojson) "RemediationExceptions") _list path;
    
  }
  in _res

let describe_remediation_exceptions_request_of_yojson = 
  fun tree path : describe_remediation_exceptions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_remediation_exceptions_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    resource_keys = option_of_yojson (value_for_key (remediation_exception_resource_keys_of_yojson) "ResourceKeys") _list path;
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let describe_remediation_configurations_response_of_yojson = 
  fun tree path : describe_remediation_configurations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_remediation_configurations_response = {
    remediation_configurations = option_of_yojson (value_for_key (remediation_configurations_of_yojson) "RemediationConfigurations") _list path;
    
  }
  in _res

let config_rule_names_of_yojson = 
  fun tree path -> list_of_yojson config_rule_name_of_yojson tree path 

let describe_remediation_configurations_request_of_yojson = 
  fun tree path : describe_remediation_configurations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_remediation_configurations_request = {
    config_rule_names = value_for_key (config_rule_names_of_yojson) "ConfigRuleNames" _list path;
    
  }
  in _res

let pending_aggregation_request_of_yojson = 
  fun tree path : pending_aggregation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : pending_aggregation_request = {
    requester_aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "RequesterAwsRegion") _list path;
    requester_account_id = option_of_yojson (value_for_key (account_id_of_yojson) "RequesterAccountId") _list path;
    
  }
  in _res

let pending_aggregation_request_list_of_yojson = 
  fun tree path -> list_of_yojson pending_aggregation_request_of_yojson tree path 

let describe_pending_aggregation_requests_response_of_yojson = 
  fun tree path : describe_pending_aggregation_requests_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_pending_aggregation_requests_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    pending_aggregation_requests = option_of_yojson (value_for_key (pending_aggregation_request_list_of_yojson) "PendingAggregationRequests") _list path;
    
  }
  in _res

let describe_pending_aggregation_requests_limit_of_yojson = int_of_yojson

let describe_pending_aggregation_requests_request_of_yojson = 
  fun tree path : describe_pending_aggregation_requests_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_pending_aggregation_requests_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (describe_pending_aggregation_requests_limit_of_yojson) "Limit") _list path;
    
  }
  in _res

let organization_resource_status_of_yojson = 
  fun (tree: t) path : organization_resource_status -> match tree with 
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
    | `String value -> raise (deserialize_unknown_enum_value_error path "OrganizationResourceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationResourceStatus")

let organization_conformance_pack_status_of_yojson = 
  fun tree path : organization_conformance_pack_status ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_conformance_pack_status = {
    last_update_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdateTime") _list path;
    error_message = option_of_yojson (value_for_key (string__of_yojson) "ErrorMessage") _list path;
    error_code = option_of_yojson (value_for_key (string__of_yojson) "ErrorCode") _list path;
    status = value_for_key (organization_resource_status_of_yojson) "Status" _list path;
    organization_conformance_pack_name = value_for_key (organization_conformance_pack_name_of_yojson) "OrganizationConformancePackName" _list path;
    
  }
  in _res

let organization_conformance_pack_statuses_of_yojson = 
  fun tree path -> list_of_yojson organization_conformance_pack_status_of_yojson tree path 

let describe_organization_conformance_pack_statuses_response_of_yojson = 
  fun tree path : describe_organization_conformance_pack_statuses_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_organization_conformance_pack_statuses_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    organization_conformance_pack_statuses = option_of_yojson (value_for_key (organization_conformance_pack_statuses_of_yojson) "OrganizationConformancePackStatuses") _list path;
    
  }
  in _res

let organization_conformance_pack_names_of_yojson = 
  fun tree path -> list_of_yojson organization_conformance_pack_name_of_yojson tree path 

let describe_organization_conformance_pack_statuses_request_of_yojson = 
  fun tree path : describe_organization_conformance_pack_statuses_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_organization_conformance_pack_statuses_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (cosmos_page_limit_of_yojson) "Limit") _list path;
    organization_conformance_pack_names = option_of_yojson (value_for_key (organization_conformance_pack_names_of_yojson) "OrganizationConformancePackNames") _list path;
    
  }
  in _res

let organization_conformance_pack_of_yojson = 
  fun tree path : organization_conformance_pack ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_conformance_pack = {
    last_update_time = value_for_key (date_of_yojson) "LastUpdateTime" _list path;
    excluded_accounts = option_of_yojson (value_for_key (excluded_accounts_of_yojson) "ExcludedAccounts") _list path;
    conformance_pack_input_parameters = option_of_yojson (value_for_key (conformance_pack_input_parameters_of_yojson) "ConformancePackInputParameters") _list path;
    delivery_s3_key_prefix = option_of_yojson (value_for_key (delivery_s3_key_prefix_of_yojson) "DeliveryS3KeyPrefix") _list path;
    delivery_s3_bucket = option_of_yojson (value_for_key (delivery_s3_bucket_of_yojson) "DeliveryS3Bucket") _list path;
    organization_conformance_pack_arn = value_for_key (string_with_char_limit256_of_yojson) "OrganizationConformancePackArn" _list path;
    organization_conformance_pack_name = value_for_key (organization_conformance_pack_name_of_yojson) "OrganizationConformancePackName" _list path;
    
  }
  in _res

let organization_conformance_packs_of_yojson = 
  fun tree path -> list_of_yojson organization_conformance_pack_of_yojson tree path 

let describe_organization_conformance_packs_response_of_yojson = 
  fun tree path : describe_organization_conformance_packs_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_organization_conformance_packs_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    organization_conformance_packs = option_of_yojson (value_for_key (organization_conformance_packs_of_yojson) "OrganizationConformancePacks") _list path;
    
  }
  in _res

let describe_organization_conformance_packs_request_of_yojson = 
  fun tree path : describe_organization_conformance_packs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_organization_conformance_packs_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (cosmos_page_limit_of_yojson) "Limit") _list path;
    organization_conformance_pack_names = option_of_yojson (value_for_key (organization_conformance_pack_names_of_yojson) "OrganizationConformancePackNames") _list path;
    
  }
  in _res

let organization_rule_status_of_yojson = 
  fun (tree: t) path : organization_rule_status -> match tree with 
    | `String "UPDATE_FAILED" -> UPDATE_FAILED
    | `String "UPDATE_IN_PROGRESS" -> UPDATE_IN_PROGRESS
    | `String "UPDATE_SUCCESSFUL" -> UPDATE_SUCCESSFUL
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_SUCCESSFUL" -> DELETE_SUCCESSFUL
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String "CREATE_SUCCESSFUL" -> CREATE_SUCCESSFUL
    | `String value -> raise (deserialize_unknown_enum_value_error path "OrganizationRuleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationRuleStatus")

let organization_config_rule_status_of_yojson = 
  fun tree path : organization_config_rule_status ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_config_rule_status = {
    last_update_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdateTime") _list path;
    error_message = option_of_yojson (value_for_key (string__of_yojson) "ErrorMessage") _list path;
    error_code = option_of_yojson (value_for_key (string__of_yojson) "ErrorCode") _list path;
    organization_rule_status = value_for_key (organization_rule_status_of_yojson) "OrganizationRuleStatus" _list path;
    organization_config_rule_name = value_for_key (organization_config_rule_name_of_yojson) "OrganizationConfigRuleName" _list path;
    
  }
  in _res

let organization_config_rule_statuses_of_yojson = 
  fun tree path -> list_of_yojson organization_config_rule_status_of_yojson tree path 

let describe_organization_config_rule_statuses_response_of_yojson = 
  fun tree path : describe_organization_config_rule_statuses_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_organization_config_rule_statuses_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    organization_config_rule_statuses = option_of_yojson (value_for_key (organization_config_rule_statuses_of_yojson) "OrganizationConfigRuleStatuses") _list path;
    
  }
  in _res

let organization_config_rule_names_of_yojson = 
  fun tree path -> list_of_yojson string_with_char_limit64_of_yojson tree path 

let describe_organization_config_rule_statuses_request_of_yojson = 
  fun tree path : describe_organization_config_rule_statuses_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_organization_config_rule_statuses_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (cosmos_page_limit_of_yojson) "Limit") _list path;
    organization_config_rule_names = option_of_yojson (value_for_key (organization_config_rule_names_of_yojson) "OrganizationConfigRuleNames") _list path;
    
  }
  in _res

let organization_custom_policy_rule_metadata_no_policy_of_yojson = 
  fun tree path : organization_custom_policy_rule_metadata_no_policy ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_custom_policy_rule_metadata_no_policy = {
    debug_log_delivery_accounts = option_of_yojson (value_for_key (debug_log_delivery_accounts_of_yojson) "DebugLogDeliveryAccounts") _list path;
    policy_runtime = option_of_yojson (value_for_key (policy_runtime_of_yojson) "PolicyRuntime") _list path;
    tag_value_scope = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "TagValueScope") _list path;
    tag_key_scope = option_of_yojson (value_for_key (string_with_char_limit128_of_yojson) "TagKeyScope") _list path;
    resource_id_scope = option_of_yojson (value_for_key (string_with_char_limit768_of_yojson) "ResourceIdScope") _list path;
    resource_types_scope = option_of_yojson (value_for_key (resource_types_scope_of_yojson) "ResourceTypesScope") _list path;
    maximum_execution_frequency = option_of_yojson (value_for_key (maximum_execution_frequency_of_yojson) "MaximumExecutionFrequency") _list path;
    input_parameters = option_of_yojson (value_for_key (string_with_char_limit2048_of_yojson) "InputParameters") _list path;
    organization_config_rule_trigger_types = option_of_yojson (value_for_key (organization_config_rule_trigger_type_no_s_ns_of_yojson) "OrganizationConfigRuleTriggerTypes") _list path;
    description = option_of_yojson (value_for_key (string_with_char_limit256_min0_of_yojson) "Description") _list path;
    
  }
  in _res

let organization_config_rule_of_yojson = 
  fun tree path : organization_config_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : organization_config_rule = {
    organization_custom_policy_rule_metadata = option_of_yojson (value_for_key (organization_custom_policy_rule_metadata_no_policy_of_yojson) "OrganizationCustomPolicyRuleMetadata") _list path;
    last_update_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdateTime") _list path;
    excluded_accounts = option_of_yojson (value_for_key (excluded_accounts_of_yojson) "ExcludedAccounts") _list path;
    organization_custom_rule_metadata = option_of_yojson (value_for_key (organization_custom_rule_metadata_of_yojson) "OrganizationCustomRuleMetadata") _list path;
    organization_managed_rule_metadata = option_of_yojson (value_for_key (organization_managed_rule_metadata_of_yojson) "OrganizationManagedRuleMetadata") _list path;
    organization_config_rule_arn = value_for_key (string_with_char_limit256_of_yojson) "OrganizationConfigRuleArn" _list path;
    organization_config_rule_name = value_for_key (organization_config_rule_name_of_yojson) "OrganizationConfigRuleName" _list path;
    
  }
  in _res

let organization_config_rules_of_yojson = 
  fun tree path -> list_of_yojson organization_config_rule_of_yojson tree path 

let describe_organization_config_rules_response_of_yojson = 
  fun tree path : describe_organization_config_rules_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_organization_config_rules_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    organization_config_rules = option_of_yojson (value_for_key (organization_config_rules_of_yojson) "OrganizationConfigRules") _list path;
    
  }
  in _res

let describe_organization_config_rules_request_of_yojson = 
  fun tree path : describe_organization_config_rules_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_organization_config_rules_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (cosmos_page_limit_of_yojson) "Limit") _list path;
    organization_config_rule_names = option_of_yojson (value_for_key (organization_config_rule_names_of_yojson) "OrganizationConfigRuleNames") _list path;
    
  }
  in _res

let no_such_delivery_channel_exception_of_yojson = 
  fun tree path : no_such_delivery_channel_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_delivery_channel_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let delivery_status_of_yojson = 
  fun (tree: t) path : delivery_status -> match tree with 
    | `String "Not_Applicable" -> Not_Applicable
    | `String "Failure" -> Failure
    | `String "Success" -> Success
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeliveryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryStatus")

let config_export_delivery_info_of_yojson = 
  fun tree path : config_export_delivery_info ->
  let _list = assoc_of_yojson tree path in
  let _res : config_export_delivery_info = {
    next_delivery_time = option_of_yojson (value_for_key (date_of_yojson) "nextDeliveryTime") _list path;
    last_successful_time = option_of_yojson (value_for_key (date_of_yojson) "lastSuccessfulTime") _list path;
    last_attempt_time = option_of_yojson (value_for_key (date_of_yojson) "lastAttemptTime") _list path;
    last_error_message = option_of_yojson (value_for_key (string__of_yojson) "lastErrorMessage") _list path;
    last_error_code = option_of_yojson (value_for_key (string__of_yojson) "lastErrorCode") _list path;
    last_status = option_of_yojson (value_for_key (delivery_status_of_yojson) "lastStatus") _list path;
    
  }
  in _res

let config_stream_delivery_info_of_yojson = 
  fun tree path : config_stream_delivery_info ->
  let _list = assoc_of_yojson tree path in
  let _res : config_stream_delivery_info = {
    last_status_change_time = option_of_yojson (value_for_key (date_of_yojson) "lastStatusChangeTime") _list path;
    last_error_message = option_of_yojson (value_for_key (string__of_yojson) "lastErrorMessage") _list path;
    last_error_code = option_of_yojson (value_for_key (string__of_yojson) "lastErrorCode") _list path;
    last_status = option_of_yojson (value_for_key (delivery_status_of_yojson) "lastStatus") _list path;
    
  }
  in _res

let delivery_channel_status_of_yojson = 
  fun tree path : delivery_channel_status ->
  let _list = assoc_of_yojson tree path in
  let _res : delivery_channel_status = {
    config_stream_delivery_info = option_of_yojson (value_for_key (config_stream_delivery_info_of_yojson) "configStreamDeliveryInfo") _list path;
    config_history_delivery_info = option_of_yojson (value_for_key (config_export_delivery_info_of_yojson) "configHistoryDeliveryInfo") _list path;
    config_snapshot_delivery_info = option_of_yojson (value_for_key (config_export_delivery_info_of_yojson) "configSnapshotDeliveryInfo") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "name") _list path;
    
  }
  in _res

let delivery_channel_status_list_of_yojson = 
  fun tree path -> list_of_yojson delivery_channel_status_of_yojson tree path 

let describe_delivery_channel_status_response_of_yojson = 
  fun tree path : describe_delivery_channel_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_delivery_channel_status_response = {
    delivery_channels_status = option_of_yojson (value_for_key (delivery_channel_status_list_of_yojson) "DeliveryChannelsStatus") _list path;
    
  }
  in _res

let delivery_channel_name_list_of_yojson = 
  fun tree path -> list_of_yojson channel_name_of_yojson tree path 

let describe_delivery_channel_status_request_of_yojson = 
  fun tree path : describe_delivery_channel_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_delivery_channel_status_request = {
    delivery_channel_names = option_of_yojson (value_for_key (delivery_channel_name_list_of_yojson) "DeliveryChannelNames") _list path;
    
  }
  in _res

let delivery_channel_list_of_yojson = 
  fun tree path -> list_of_yojson delivery_channel_of_yojson tree path 

let describe_delivery_channels_response_of_yojson = 
  fun tree path : describe_delivery_channels_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_delivery_channels_response = {
    delivery_channels = option_of_yojson (value_for_key (delivery_channel_list_of_yojson) "DeliveryChannels") _list path;
    
  }
  in _res

let describe_delivery_channels_request_of_yojson = 
  fun tree path : describe_delivery_channels_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_delivery_channels_request = {
    delivery_channel_names = option_of_yojson (value_for_key (delivery_channel_name_list_of_yojson) "DeliveryChannelNames") _list path;
    
  }
  in _res

let conformance_pack_id_of_yojson = string_of_yojson

let conformance_pack_state_of_yojson = 
  fun (tree: t) path : conformance_pack_state -> match tree with 
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String "DELETE_IN_PROGRESS" -> DELETE_IN_PROGRESS
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "CREATE_COMPLETE" -> CREATE_COMPLETE
    | `String "CREATE_IN_PROGRESS" -> CREATE_IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConformancePackState" value)
    | _ -> raise (deserialize_wrong_type_error path "ConformancePackState")

let stack_arn_of_yojson = string_of_yojson

let conformance_pack_status_reason_of_yojson = string_of_yojson

let conformance_pack_status_detail_of_yojson = 
  fun tree path : conformance_pack_status_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_status_detail = {
    last_update_completed_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdateCompletedTime") _list path;
    last_update_requested_time = value_for_key (date_of_yojson) "LastUpdateRequestedTime" _list path;
    conformance_pack_status_reason = option_of_yojson (value_for_key (conformance_pack_status_reason_of_yojson) "ConformancePackStatusReason") _list path;
    stack_arn = value_for_key (stack_arn_of_yojson) "StackArn" _list path;
    conformance_pack_state = value_for_key (conformance_pack_state_of_yojson) "ConformancePackState" _list path;
    conformance_pack_arn = value_for_key (conformance_pack_arn_of_yojson) "ConformancePackArn" _list path;
    conformance_pack_id = value_for_key (conformance_pack_id_of_yojson) "ConformancePackId" _list path;
    conformance_pack_name = value_for_key (conformance_pack_name_of_yojson) "ConformancePackName" _list path;
    
  }
  in _res

let conformance_pack_status_details_list_of_yojson = 
  fun tree path -> list_of_yojson conformance_pack_status_detail_of_yojson tree path 

let describe_conformance_pack_status_response_of_yojson = 
  fun tree path : describe_conformance_pack_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_conformance_pack_status_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    conformance_pack_status_details = option_of_yojson (value_for_key (conformance_pack_status_details_list_of_yojson) "ConformancePackStatusDetails") _list path;
    
  }
  in _res

let conformance_pack_names_list_of_yojson = 
  fun tree path -> list_of_yojson conformance_pack_name_of_yojson tree path 

let describe_conformance_pack_status_request_of_yojson = 
  fun tree path : describe_conformance_pack_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_conformance_pack_status_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (page_size_limit_of_yojson) "Limit") _list path;
    conformance_pack_names = option_of_yojson (value_for_key (conformance_pack_names_list_of_yojson) "ConformancePackNames") _list path;
    
  }
  in _res

let conformance_pack_detail_of_yojson = 
  fun tree path : conformance_pack_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_detail = {
    template_ssm_document_details = option_of_yojson (value_for_key (template_ssm_document_details_of_yojson) "TemplateSSMDocumentDetails") _list path;
    created_by = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "CreatedBy") _list path;
    last_update_requested_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdateRequestedTime") _list path;
    conformance_pack_input_parameters = option_of_yojson (value_for_key (conformance_pack_input_parameters_of_yojson) "ConformancePackInputParameters") _list path;
    delivery_s3_key_prefix = option_of_yojson (value_for_key (delivery_s3_key_prefix_of_yojson) "DeliveryS3KeyPrefix") _list path;
    delivery_s3_bucket = option_of_yojson (value_for_key (delivery_s3_bucket_of_yojson) "DeliveryS3Bucket") _list path;
    conformance_pack_id = value_for_key (conformance_pack_id_of_yojson) "ConformancePackId" _list path;
    conformance_pack_arn = value_for_key (conformance_pack_arn_of_yojson) "ConformancePackArn" _list path;
    conformance_pack_name = value_for_key (conformance_pack_name_of_yojson) "ConformancePackName" _list path;
    
  }
  in _res

let conformance_pack_detail_list_of_yojson = 
  fun tree path -> list_of_yojson conformance_pack_detail_of_yojson tree path 

let describe_conformance_packs_response_of_yojson = 
  fun tree path : describe_conformance_packs_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_conformance_packs_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    conformance_pack_details = option_of_yojson (value_for_key (conformance_pack_detail_list_of_yojson) "ConformancePackDetails") _list path;
    
  }
  in _res

let describe_conformance_packs_request_of_yojson = 
  fun tree path : describe_conformance_packs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_conformance_packs_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (page_size_limit_of_yojson) "Limit") _list path;
    conformance_pack_names = option_of_yojson (value_for_key (conformance_pack_names_list_of_yojson) "ConformancePackNames") _list path;
    
  }
  in _res

let controls_list_of_yojson = 
  fun tree path -> list_of_yojson string_with_char_limit128_of_yojson tree path 

let conformance_pack_rule_compliance_of_yojson = 
  fun tree path : conformance_pack_rule_compliance ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_rule_compliance = {
    controls = option_of_yojson (value_for_key (controls_list_of_yojson) "Controls") _list path;
    compliance_type = option_of_yojson (value_for_key (conformance_pack_compliance_type_of_yojson) "ComplianceType") _list path;
    config_rule_name = option_of_yojson (value_for_key (config_rule_name_of_yojson) "ConfigRuleName") _list path;
    
  }
  in _res

let conformance_pack_rule_compliance_list_of_yojson = 
  fun tree path -> list_of_yojson conformance_pack_rule_compliance_of_yojson tree path 

let describe_conformance_pack_compliance_response_of_yojson = 
  fun tree path : describe_conformance_pack_compliance_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_conformance_pack_compliance_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    conformance_pack_rule_compliance_list = value_for_key (conformance_pack_rule_compliance_list_of_yojson) "ConformancePackRuleComplianceList" _list path;
    conformance_pack_name = value_for_key (conformance_pack_name_of_yojson) "ConformancePackName" _list path;
    
  }
  in _res

let conformance_pack_compliance_filters_of_yojson = 
  fun tree path : conformance_pack_compliance_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : conformance_pack_compliance_filters = {
    compliance_type = option_of_yojson (value_for_key (conformance_pack_compliance_type_of_yojson) "ComplianceType") _list path;
    config_rule_names = option_of_yojson (value_for_key (conformance_pack_config_rule_names_of_yojson) "ConfigRuleNames") _list path;
    
  }
  in _res

let describe_conformance_pack_compliance_limit_of_yojson = int_of_yojson

let describe_conformance_pack_compliance_request_of_yojson = 
  fun tree path : describe_conformance_pack_compliance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_conformance_pack_compliance_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (describe_conformance_pack_compliance_limit_of_yojson) "Limit") _list path;
    filters = option_of_yojson (value_for_key (conformance_pack_compliance_filters_of_yojson) "Filters") _list path;
    conformance_pack_name = value_for_key (conformance_pack_name_of_yojson) "ConformancePackName" _list path;
    
  }
  in _res

let recorder_status_of_yojson = 
  fun (tree: t) path : recorder_status -> match tree with 
    | `String "Failure" -> Failure
    | `String "Success" -> Success
    | `String "Pending" -> Pending
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecorderStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RecorderStatus")

let configuration_recorder_status_of_yojson = 
  fun tree path : configuration_recorder_status ->
  let _list = assoc_of_yojson tree path in
  let _res : configuration_recorder_status = {
    last_status_change_time = option_of_yojson (value_for_key (date_of_yojson) "lastStatusChangeTime") _list path;
    last_error_message = option_of_yojson (value_for_key (string__of_yojson) "lastErrorMessage") _list path;
    last_error_code = option_of_yojson (value_for_key (string__of_yojson) "lastErrorCode") _list path;
    last_status = option_of_yojson (value_for_key (recorder_status_of_yojson) "lastStatus") _list path;
    recording = option_of_yojson (value_for_key (boolean__of_yojson) "recording") _list path;
    last_stop_time = option_of_yojson (value_for_key (date_of_yojson) "lastStopTime") _list path;
    last_start_time = option_of_yojson (value_for_key (date_of_yojson) "lastStartTime") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "name") _list path;
    
  }
  in _res

let configuration_recorder_status_list_of_yojson = 
  fun tree path -> list_of_yojson configuration_recorder_status_of_yojson tree path 

let describe_configuration_recorder_status_response_of_yojson = 
  fun tree path : describe_configuration_recorder_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_configuration_recorder_status_response = {
    configuration_recorders_status = option_of_yojson (value_for_key (configuration_recorder_status_list_of_yojson) "ConfigurationRecordersStatus") _list path;
    
  }
  in _res

let configuration_recorder_name_list_of_yojson = 
  fun tree path -> list_of_yojson recorder_name_of_yojson tree path 

let describe_configuration_recorder_status_request_of_yojson = 
  fun tree path : describe_configuration_recorder_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_configuration_recorder_status_request = {
    configuration_recorder_names = option_of_yojson (value_for_key (configuration_recorder_name_list_of_yojson) "ConfigurationRecorderNames") _list path;
    
  }
  in _res

let configuration_recorder_list_of_yojson = 
  fun tree path -> list_of_yojson configuration_recorder_of_yojson tree path 

let describe_configuration_recorders_response_of_yojson = 
  fun tree path : describe_configuration_recorders_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_configuration_recorders_response = {
    configuration_recorders = option_of_yojson (value_for_key (configuration_recorder_list_of_yojson) "ConfigurationRecorders") _list path;
    
  }
  in _res

let describe_configuration_recorders_request_of_yojson = 
  fun tree path : describe_configuration_recorders_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_configuration_recorders_request = {
    configuration_recorder_names = option_of_yojson (value_for_key (configuration_recorder_name_list_of_yojson) "ConfigurationRecorderNames") _list path;
    
  }
  in _res

let aggregated_source_type_of_yojson = 
  fun (tree: t) path : aggregated_source_type -> match tree with 
    | `String "ORGANIZATION" -> ORGANIZATION
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "AggregatedSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "AggregatedSourceType")

let aggregated_source_status_type_of_yojson = 
  fun (tree: t) path : aggregated_source_status_type -> match tree with 
    | `String "OUTDATED" -> OUTDATED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AggregatedSourceStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "AggregatedSourceStatusType")

let aggregated_source_status_of_yojson = 
  fun tree path : aggregated_source_status ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregated_source_status = {
    last_error_message = option_of_yojson (value_for_key (string__of_yojson) "LastErrorMessage") _list path;
    last_error_code = option_of_yojson (value_for_key (string__of_yojson) "LastErrorCode") _list path;
    last_update_time = option_of_yojson (value_for_key (date_of_yojson) "LastUpdateTime") _list path;
    last_update_status = option_of_yojson (value_for_key (aggregated_source_status_type_of_yojson) "LastUpdateStatus") _list path;
    aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "AwsRegion") _list path;
    source_type = option_of_yojson (value_for_key (aggregated_source_type_of_yojson) "SourceType") _list path;
    source_id = option_of_yojson (value_for_key (string__of_yojson) "SourceId") _list path;
    
  }
  in _res

let aggregated_source_status_list_of_yojson = 
  fun tree path -> list_of_yojson aggregated_source_status_of_yojson tree path 

let describe_configuration_aggregator_sources_status_response_of_yojson = 
  fun tree path : describe_configuration_aggregator_sources_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_configuration_aggregator_sources_status_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    aggregated_source_status_list = option_of_yojson (value_for_key (aggregated_source_status_list_of_yojson) "AggregatedSourceStatusList") _list path;
    
  }
  in _res

let aggregated_source_status_type_list_of_yojson = 
  fun tree path -> list_of_yojson aggregated_source_status_type_of_yojson tree path 

let describe_configuration_aggregator_sources_status_request_of_yojson = 
  fun tree path : describe_configuration_aggregator_sources_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_configuration_aggregator_sources_status_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    update_status = option_of_yojson (value_for_key (aggregated_source_status_type_list_of_yojson) "UpdateStatus") _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let configuration_aggregator_list_of_yojson = 
  fun tree path -> list_of_yojson configuration_aggregator_of_yojson tree path 

let describe_configuration_aggregators_response_of_yojson = 
  fun tree path : describe_configuration_aggregators_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_configuration_aggregators_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    configuration_aggregators = option_of_yojson (value_for_key (configuration_aggregator_list_of_yojson) "ConfigurationAggregators") _list path;
    
  }
  in _res

let configuration_aggregator_name_list_of_yojson = 
  fun tree path -> list_of_yojson configuration_aggregator_name_of_yojson tree path 

let describe_configuration_aggregators_request_of_yojson = 
  fun tree path : describe_configuration_aggregators_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_configuration_aggregators_request = {
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    configuration_aggregator_names = option_of_yojson (value_for_key (configuration_aggregator_name_list_of_yojson) "ConfigurationAggregatorNames") _list path;
    
  }
  in _res

let config_rules_of_yojson = 
  fun tree path -> list_of_yojson config_rule_of_yojson tree path 

let describe_config_rules_response_of_yojson = 
  fun tree path : describe_config_rules_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_config_rules_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    config_rules = option_of_yojson (value_for_key (config_rules_of_yojson) "ConfigRules") _list path;
    
  }
  in _res

let describe_config_rules_filters_of_yojson = 
  fun tree path : describe_config_rules_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_config_rules_filters = {
    evaluation_mode = option_of_yojson (value_for_key (evaluation_mode_of_yojson) "EvaluationMode") _list path;
    
  }
  in _res

let describe_config_rules_request_of_yojson = 
  fun tree path : describe_config_rules_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_config_rules_request = {
    filters = option_of_yojson (value_for_key (describe_config_rules_filters_of_yojson) "Filters") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    config_rule_names = option_of_yojson (value_for_key (config_rule_names_of_yojson) "ConfigRuleNames") _list path;
    
  }
  in _res

let config_rule_evaluation_status_of_yojson = 
  fun tree path : config_rule_evaluation_status ->
  let _list = assoc_of_yojson tree path in
  let _res : config_rule_evaluation_status = {
    last_debug_log_delivery_time = option_of_yojson (value_for_key (date_of_yojson) "LastDebugLogDeliveryTime") _list path;
    last_debug_log_delivery_status_reason = option_of_yojson (value_for_key (string__of_yojson) "LastDebugLogDeliveryStatusReason") _list path;
    last_debug_log_delivery_status = option_of_yojson (value_for_key (string__of_yojson) "LastDebugLogDeliveryStatus") _list path;
    first_evaluation_started = option_of_yojson (value_for_key (boolean__of_yojson) "FirstEvaluationStarted") _list path;
    last_error_message = option_of_yojson (value_for_key (string__of_yojson) "LastErrorMessage") _list path;
    last_error_code = option_of_yojson (value_for_key (string__of_yojson) "LastErrorCode") _list path;
    last_deactivated_time = option_of_yojson (value_for_key (date_of_yojson) "LastDeactivatedTime") _list path;
    first_activated_time = option_of_yojson (value_for_key (date_of_yojson) "FirstActivatedTime") _list path;
    last_failed_evaluation_time = option_of_yojson (value_for_key (date_of_yojson) "LastFailedEvaluationTime") _list path;
    last_successful_evaluation_time = option_of_yojson (value_for_key (date_of_yojson) "LastSuccessfulEvaluationTime") _list path;
    last_failed_invocation_time = option_of_yojson (value_for_key (date_of_yojson) "LastFailedInvocationTime") _list path;
    last_successful_invocation_time = option_of_yojson (value_for_key (date_of_yojson) "LastSuccessfulInvocationTime") _list path;
    config_rule_id = option_of_yojson (value_for_key (string__of_yojson) "ConfigRuleId") _list path;
    config_rule_arn = option_of_yojson (value_for_key (string__of_yojson) "ConfigRuleArn") _list path;
    config_rule_name = option_of_yojson (value_for_key (config_rule_name_of_yojson) "ConfigRuleName") _list path;
    
  }
  in _res

let config_rule_evaluation_status_list_of_yojson = 
  fun tree path -> list_of_yojson config_rule_evaluation_status_of_yojson tree path 

let describe_config_rule_evaluation_status_response_of_yojson = 
  fun tree path : describe_config_rule_evaluation_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_config_rule_evaluation_status_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    config_rules_evaluation_status = option_of_yojson (value_for_key (config_rule_evaluation_status_list_of_yojson) "ConfigRulesEvaluationStatus") _list path;
    
  }
  in _res

let rule_limit_of_yojson = int_of_yojson

let describe_config_rule_evaluation_status_request_of_yojson = 
  fun tree path : describe_config_rule_evaluation_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_config_rule_evaluation_status_request = {
    limit = option_of_yojson (value_for_key (rule_limit_of_yojson) "Limit") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    config_rule_names = option_of_yojson (value_for_key (config_rule_names_of_yojson) "ConfigRuleNames") _list path;
    
  }
  in _res

let compliance_of_yojson = 
  fun tree path : compliance ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance = {
    compliance_contributor_count = option_of_yojson (value_for_key (compliance_contributor_count_of_yojson) "ComplianceContributorCount") _list path;
    compliance_type = option_of_yojson (value_for_key (compliance_type_of_yojson) "ComplianceType") _list path;
    
  }
  in _res

let compliance_by_resource_of_yojson = 
  fun tree path : compliance_by_resource ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_by_resource = {
    compliance = option_of_yojson (value_for_key (compliance_of_yojson) "Compliance") _list path;
    resource_id = option_of_yojson (value_for_key (base_resource_id_of_yojson) "ResourceId") _list path;
    resource_type = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "ResourceType") _list path;
    
  }
  in _res

let compliance_by_resources_of_yojson = 
  fun tree path -> list_of_yojson compliance_by_resource_of_yojson tree path 

let describe_compliance_by_resource_response_of_yojson = 
  fun tree path : describe_compliance_by_resource_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_compliance_by_resource_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    compliance_by_resources = option_of_yojson (value_for_key (compliance_by_resources_of_yojson) "ComplianceByResources") _list path;
    
  }
  in _res

let describe_compliance_by_resource_request_of_yojson = 
  fun tree path : describe_compliance_by_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_compliance_by_resource_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    compliance_types = option_of_yojson (value_for_key (compliance_types_of_yojson) "ComplianceTypes") _list path;
    resource_id = option_of_yojson (value_for_key (base_resource_id_of_yojson) "ResourceId") _list path;
    resource_type = option_of_yojson (value_for_key (string_with_char_limit256_of_yojson) "ResourceType") _list path;
    
  }
  in _res

let compliance_by_config_rule_of_yojson = 
  fun tree path : compliance_by_config_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_by_config_rule = {
    compliance = option_of_yojson (value_for_key (compliance_of_yojson) "Compliance") _list path;
    config_rule_name = option_of_yojson (value_for_key (string_with_char_limit64_of_yojson) "ConfigRuleName") _list path;
    
  }
  in _res

let compliance_by_config_rules_of_yojson = 
  fun tree path -> list_of_yojson compliance_by_config_rule_of_yojson tree path 

let describe_compliance_by_config_rule_response_of_yojson = 
  fun tree path : describe_compliance_by_config_rule_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_compliance_by_config_rule_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    compliance_by_config_rules = option_of_yojson (value_for_key (compliance_by_config_rules_of_yojson) "ComplianceByConfigRules") _list path;
    
  }
  in _res

let describe_compliance_by_config_rule_request_of_yojson = 
  fun tree path : describe_compliance_by_config_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_compliance_by_config_rule_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    compliance_types = option_of_yojson (value_for_key (compliance_types_of_yojson) "ComplianceTypes") _list path;
    config_rule_names = option_of_yojson (value_for_key (config_rule_names_of_yojson) "ConfigRuleNames") _list path;
    
  }
  in _res

let aggregation_authorization_list_of_yojson = 
  fun tree path -> list_of_yojson aggregation_authorization_of_yojson tree path 

let describe_aggregation_authorizations_response_of_yojson = 
  fun tree path : describe_aggregation_authorizations_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_aggregation_authorizations_response = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    aggregation_authorizations = option_of_yojson (value_for_key (aggregation_authorization_list_of_yojson) "AggregationAuthorizations") _list path;
    
  }
  in _res

let describe_aggregation_authorizations_request_of_yojson = 
  fun tree path : describe_aggregation_authorizations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_aggregation_authorizations_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    
  }
  in _res

let aggregate_conformance_pack_compliance_of_yojson = 
  fun tree path : aggregate_conformance_pack_compliance ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregate_conformance_pack_compliance = {
    total_rule_count = option_of_yojson (value_for_key (integer__of_yojson) "TotalRuleCount") _list path;
    non_compliant_rule_count = option_of_yojson (value_for_key (integer__of_yojson) "NonCompliantRuleCount") _list path;
    compliant_rule_count = option_of_yojson (value_for_key (integer__of_yojson) "CompliantRuleCount") _list path;
    compliance_type = option_of_yojson (value_for_key (conformance_pack_compliance_type_of_yojson) "ComplianceType") _list path;
    
  }
  in _res

let aggregate_compliance_by_conformance_pack_of_yojson = 
  fun tree path : aggregate_compliance_by_conformance_pack ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregate_compliance_by_conformance_pack = {
    aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "AwsRegion") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    compliance = option_of_yojson (value_for_key (aggregate_conformance_pack_compliance_of_yojson) "Compliance") _list path;
    conformance_pack_name = option_of_yojson (value_for_key (conformance_pack_name_of_yojson) "ConformancePackName") _list path;
    
  }
  in _res

let aggregate_compliance_by_conformance_pack_list_of_yojson = 
  fun tree path -> list_of_yojson aggregate_compliance_by_conformance_pack_of_yojson tree path 

let describe_aggregate_compliance_by_conformance_packs_response_of_yojson = 
  fun tree path : describe_aggregate_compliance_by_conformance_packs_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_aggregate_compliance_by_conformance_packs_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    aggregate_compliance_by_conformance_packs = option_of_yojson (value_for_key (aggregate_compliance_by_conformance_pack_list_of_yojson) "AggregateComplianceByConformancePacks") _list path;
    
  }
  in _res

let aggregate_conformance_pack_compliance_filters_of_yojson = 
  fun tree path : aggregate_conformance_pack_compliance_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregate_conformance_pack_compliance_filters = {
    aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "AwsRegion") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    compliance_type = option_of_yojson (value_for_key (conformance_pack_compliance_type_of_yojson) "ComplianceType") _list path;
    conformance_pack_name = option_of_yojson (value_for_key (conformance_pack_name_of_yojson) "ConformancePackName") _list path;
    
  }
  in _res

let describe_aggregate_compliance_by_conformance_packs_request_of_yojson = 
  fun tree path : describe_aggregate_compliance_by_conformance_packs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_aggregate_compliance_by_conformance_packs_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (limit_of_yojson) "Limit") _list path;
    filters = option_of_yojson (value_for_key (aggregate_conformance_pack_compliance_filters_of_yojson) "Filters") _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let aggregate_compliance_by_config_rule_of_yojson = 
  fun tree path : aggregate_compliance_by_config_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : aggregate_compliance_by_config_rule = {
    aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "AwsRegion") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    compliance = option_of_yojson (value_for_key (compliance_of_yojson) "Compliance") _list path;
    config_rule_name = option_of_yojson (value_for_key (config_rule_name_of_yojson) "ConfigRuleName") _list path;
    
  }
  in _res

let aggregate_compliance_by_config_rule_list_of_yojson = 
  fun tree path -> list_of_yojson aggregate_compliance_by_config_rule_of_yojson tree path 

let describe_aggregate_compliance_by_config_rules_response_of_yojson = 
  fun tree path : describe_aggregate_compliance_by_config_rules_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_aggregate_compliance_by_config_rules_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    aggregate_compliance_by_config_rules = option_of_yojson (value_for_key (aggregate_compliance_by_config_rule_list_of_yojson) "AggregateComplianceByConfigRules") _list path;
    
  }
  in _res

let config_rule_compliance_filters_of_yojson = 
  fun tree path : config_rule_compliance_filters ->
  let _list = assoc_of_yojson tree path in
  let _res : config_rule_compliance_filters = {
    aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "AwsRegion") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    compliance_type = option_of_yojson (value_for_key (compliance_type_of_yojson) "ComplianceType") _list path;
    config_rule_name = option_of_yojson (value_for_key (config_rule_name_of_yojson) "ConfigRuleName") _list path;
    
  }
  in _res

let describe_aggregate_compliance_by_config_rules_request_of_yojson = 
  fun tree path : describe_aggregate_compliance_by_config_rules_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_aggregate_compliance_by_config_rules_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    limit = option_of_yojson (value_for_key (group_by_api_limit_of_yojson) "Limit") _list path;
    filters = option_of_yojson (value_for_key (config_rule_compliance_filters_of_yojson) "Filters") _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let deliver_config_snapshot_response_of_yojson = 
  fun tree path : deliver_config_snapshot_response ->
  let _list = assoc_of_yojson tree path in
  let _res : deliver_config_snapshot_response = {
    config_snapshot_id = option_of_yojson (value_for_key (string__of_yojson) "configSnapshotId") _list path;
    
  }
  in _res

let deliver_config_snapshot_request_of_yojson = 
  fun tree path : deliver_config_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deliver_config_snapshot_request = {
    delivery_channel_name = value_for_key (channel_name_of_yojson) "deliveryChannelName" _list path;
    
  }
  in _res

let delete_stored_query_response_of_yojson = 
  fun tree path : delete_stored_query_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_stored_query_response = ()
  in _res

let delete_stored_query_request_of_yojson = 
  fun tree path : delete_stored_query_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_stored_query_request = {
    query_name = value_for_key (query_name_of_yojson) "QueryName" _list path;
    
  }
  in _res

let delete_retention_configuration_request_of_yojson = 
  fun tree path : delete_retention_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_retention_configuration_request = {
    retention_configuration_name = value_for_key (retention_configuration_name_of_yojson) "RetentionConfigurationName" _list path;
    
  }
  in _res

let delete_resource_config_request_of_yojson = 
  fun tree path : delete_resource_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_resource_config_request = {
    resource_id = value_for_key (resource_id_of_yojson) "ResourceId" _list path;
    resource_type = value_for_key (resource_type_string_of_yojson) "ResourceType" _list path;
    
  }
  in _res

let no_such_remediation_exception_exception_of_yojson = 
  fun tree path : no_such_remediation_exception_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : no_such_remediation_exception_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let failed_delete_remediation_exceptions_batch_of_yojson = 
  fun tree path : failed_delete_remediation_exceptions_batch ->
  let _list = assoc_of_yojson tree path in
  let _res : failed_delete_remediation_exceptions_batch = {
    failed_items = option_of_yojson (value_for_key (remediation_exception_resource_keys_of_yojson) "FailedItems") _list path;
    failure_message = option_of_yojson (value_for_key (string__of_yojson) "FailureMessage") _list path;
    
  }
  in _res

let failed_delete_remediation_exceptions_batches_of_yojson = 
  fun tree path -> list_of_yojson failed_delete_remediation_exceptions_batch_of_yojson tree path 

let delete_remediation_exceptions_response_of_yojson = 
  fun tree path : delete_remediation_exceptions_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_remediation_exceptions_response = {
    failed_batches = option_of_yojson (value_for_key (failed_delete_remediation_exceptions_batches_of_yojson) "FailedBatches") _list path;
    
  }
  in _res

let delete_remediation_exceptions_request_of_yojson = 
  fun tree path : delete_remediation_exceptions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_remediation_exceptions_request = {
    resource_keys = value_for_key (remediation_exception_resource_keys_of_yojson) "ResourceKeys" _list path;
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let remediation_in_progress_exception_of_yojson = 
  fun tree path : remediation_in_progress_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : remediation_in_progress_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let delete_remediation_configuration_response_of_yojson = 
  fun tree path : delete_remediation_configuration_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_remediation_configuration_response = ()
  in _res

let delete_remediation_configuration_request_of_yojson = 
  fun tree path : delete_remediation_configuration_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_remediation_configuration_request = {
    resource_type = option_of_yojson (value_for_key (string__of_yojson) "ResourceType") _list path;
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let delete_pending_aggregation_request_request_of_yojson = 
  fun tree path : delete_pending_aggregation_request_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_pending_aggregation_request_request = {
    requester_aws_region = value_for_key (aws_region_of_yojson) "RequesterAwsRegion" _list path;
    requester_account_id = value_for_key (account_id_of_yojson) "RequesterAccountId" _list path;
    
  }
  in _res

let delete_organization_conformance_pack_request_of_yojson = 
  fun tree path : delete_organization_conformance_pack_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_organization_conformance_pack_request = {
    organization_conformance_pack_name = value_for_key (organization_conformance_pack_name_of_yojson) "OrganizationConformancePackName" _list path;
    
  }
  in _res

let delete_organization_config_rule_request_of_yojson = 
  fun tree path : delete_organization_config_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_organization_config_rule_request = {
    organization_config_rule_name = value_for_key (organization_config_rule_name_of_yojson) "OrganizationConfigRuleName" _list path;
    
  }
  in _res

let delete_evaluation_results_response_of_yojson = 
  fun tree path : delete_evaluation_results_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_evaluation_results_response = ()
  in _res

let delete_evaluation_results_request_of_yojson = 
  fun tree path : delete_evaluation_results_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_evaluation_results_request = {
    config_rule_name = value_for_key (string_with_char_limit64_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let last_delivery_channel_delete_failed_exception_of_yojson = 
  fun tree path : last_delivery_channel_delete_failed_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : last_delivery_channel_delete_failed_exception = {
    message = option_of_yojson (value_for_key (error_message_of_yojson) "message") _list path;
    
  }
  in _res

let delete_delivery_channel_request_of_yojson = 
  fun tree path : delete_delivery_channel_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_delivery_channel_request = {
    delivery_channel_name = value_for_key (channel_name_of_yojson) "DeliveryChannelName" _list path;
    
  }
  in _res

let delete_conformance_pack_request_of_yojson = 
  fun tree path : delete_conformance_pack_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_conformance_pack_request = {
    conformance_pack_name = value_for_key (conformance_pack_name_of_yojson) "ConformancePackName" _list path;
    
  }
  in _res

let delete_configuration_recorder_request_of_yojson = 
  fun tree path : delete_configuration_recorder_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_configuration_recorder_request = {
    configuration_recorder_name = value_for_key (recorder_name_of_yojson) "ConfigurationRecorderName" _list path;
    
  }
  in _res

let delete_configuration_aggregator_request_of_yojson = 
  fun tree path : delete_configuration_aggregator_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_configuration_aggregator_request = {
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let delete_config_rule_request_of_yojson = 
  fun tree path : delete_config_rule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_config_rule_request = {
    config_rule_name = value_for_key (config_rule_name_of_yojson) "ConfigRuleName" _list path;
    
  }
  in _res

let delete_aggregation_authorization_request_of_yojson = 
  fun tree path : delete_aggregation_authorization_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_aggregation_authorization_request = {
    authorized_aws_region = value_for_key (aws_region_of_yojson) "AuthorizedAwsRegion" _list path;
    authorized_account_id = value_for_key (account_id_of_yojson) "AuthorizedAccountId" _list path;
    
  }
  in _res

let base_configuration_item_of_yojson = 
  fun tree path : base_configuration_item ->
  let _list = assoc_of_yojson tree path in
  let _res : base_configuration_item = {
    configuration_item_delivery_time = option_of_yojson (value_for_key (configuration_item_delivery_time_of_yojson) "configurationItemDeliveryTime") _list path;
    recording_frequency = option_of_yojson (value_for_key (recording_frequency_of_yojson) "recordingFrequency") _list path;
    supplementary_configuration = option_of_yojson (value_for_key (supplementary_configuration_of_yojson) "supplementaryConfiguration") _list path;
    configuration = option_of_yojson (value_for_key (configuration_of_yojson) "configuration") _list path;
    resource_creation_time = option_of_yojson (value_for_key (resource_creation_time_of_yojson) "resourceCreationTime") _list path;
    availability_zone = option_of_yojson (value_for_key (availability_zone_of_yojson) "availabilityZone") _list path;
    aws_region = option_of_yojson (value_for_key (aws_region_of_yojson) "awsRegion") _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "resourceName") _list path;
    resource_id = option_of_yojson (value_for_key (resource_id_of_yojson) "resourceId") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    arn = option_of_yojson (value_for_key (ar_n_of_yojson) "arn") _list path;
    configuration_state_id = option_of_yojson (value_for_key (configuration_state_id_of_yojson) "configurationStateId") _list path;
    configuration_item_status = option_of_yojson (value_for_key (configuration_item_status_of_yojson) "configurationItemStatus") _list path;
    configuration_item_capture_time = option_of_yojson (value_for_key (configuration_item_capture_time_of_yojson) "configurationItemCaptureTime") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "accountId") _list path;
    version = option_of_yojson (value_for_key (version_of_yojson) "version") _list path;
    
  }
  in _res

let base_configuration_items_of_yojson = 
  fun tree path -> list_of_yojson base_configuration_item_of_yojson tree path 

let batch_get_resource_config_response_of_yojson = 
  fun tree path : batch_get_resource_config_response ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_resource_config_response = {
    unprocessed_resource_keys = option_of_yojson (value_for_key (resource_keys_of_yojson) "unprocessedResourceKeys") _list path;
    base_configuration_items = option_of_yojson (value_for_key (base_configuration_items_of_yojson) "baseConfigurationItems") _list path;
    
  }
  in _res

let batch_get_resource_config_request_of_yojson = 
  fun tree path : batch_get_resource_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_resource_config_request = {
    resource_keys = value_for_key (resource_keys_of_yojson) "resourceKeys" _list path;
    
  }
  in _res

let batch_get_aggregate_resource_config_response_of_yojson = 
  fun tree path : batch_get_aggregate_resource_config_response ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_aggregate_resource_config_response = {
    unprocessed_resource_identifiers = option_of_yojson (value_for_key (unprocessed_resource_identifier_list_of_yojson) "UnprocessedResourceIdentifiers") _list path;
    base_configuration_items = option_of_yojson (value_for_key (base_configuration_items_of_yojson) "BaseConfigurationItems") _list path;
    
  }
  in _res

let resource_identifiers_list_of_yojson = 
  fun tree path -> list_of_yojson aggregate_resource_identifier_of_yojson tree path 

let batch_get_aggregate_resource_config_request_of_yojson = 
  fun tree path : batch_get_aggregate_resource_config_request ->
  let _list = assoc_of_yojson tree path in
  let _res : batch_get_aggregate_resource_config_request = {
    resource_identifiers = value_for_key (resource_identifiers_list_of_yojson) "ResourceIdentifiers" _list path;
    configuration_aggregator_name = value_for_key (configuration_aggregator_name_of_yojson) "ConfigurationAggregatorName" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

