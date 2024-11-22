open Smaws_Lib.Json.SerializeHelpers

open Types

let version_to_yojson = string_to_yojson

let value_to_yojson = string_to_yojson

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson = 
  fun (x: validation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let amazon_resource_name_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "ResourceArn",
         (Some (amazon_resource_name_to_yojson x.resource_arn)));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let base_unit_to_yojson = unit_to_yojson

let account_id_to_yojson = string_to_yojson

let aws_region_to_yojson = string_to_yojson

let resource_id_to_yojson = string_to_yojson

let resource_type_to_yojson = 
  fun (x: resource_type) -> match x with 
 
| SSMDocument -> `String "AWS::SSM::Document"
  | Route53ResolverFirewallRuleGroup -> `String "AWS::Route53Resolver::FirewallRuleGroup"
  | RedshiftEndpointAccess -> `String "AWS::Redshift::EndpointAccess"
  | RDSOptionGroup -> `String "AWS::RDS::OptionGroup"
  | QuickSightTheme -> `String "AWS::QuickSight::Theme"
  | QuickSightTemplate -> `String "AWS::QuickSight::Template"
  | QuickSightDataSource -> `String "AWS::QuickSight::DataSource"
  | M2Environment -> `String "AWS::M2::Environment"
  | KMSAlias -> `String "AWS::KMS::Alias"
  | ImageBuilderImageRecipe -> `String "AWS::ImageBuilder::ImageRecipe"
  | GroundStationDataflowEndpointGroup -> `String "AWS::GroundStation::DataflowEndpointGroup"
  | GrafanaWorkspace -> `String "AWS::Grafana::Workspace"
  | EC2NetworkInsightsAnalysis -> `String "AWS::EC2::NetworkInsightsAnalysis"
  | EC2NetworkInsightsAccessScope -> `String "AWS::EC2::NetworkInsightsAccessScope"
  | CognitoUserPoolGroup -> `String "AWS::Cognito::UserPoolGroup"
  | CognitoUserPoolClient -> `String "AWS::Cognito::UserPoolClient"
  | CognitoUserPool -> `String "AWS::Cognito::UserPool"
  | AppStreamFleet -> `String "AWS::AppStream::Fleet"
  | ResourceExplorer2Index -> `String "AWS::ResourceExplorer2::Index"
  | NetworkManagerConnectPeer -> `String "AWS::NetworkManager::ConnectPeer"
  | LambdaCodeSigningConfig -> `String "AWS::Lambda::CodeSigningConfig"
  | KafkaConnectConnector -> `String "AWS::KafkaConnect::Connector"
  | IoTTwinMakerSyncJob -> `String "AWS::IoTTwinMaker::SyncJob"
  | IoTCACertificate -> `String "AWS::IoT::CACertificate"
  | IAMInstanceProfile -> `String "AWS::IAM::InstanceProfile"
  | ECSCapacityProvider -> `String "AWS::ECS::CapacityProvider"
  | EC2TransitGatewayMulticastDomain -> `String "AWS::EC2::TransitGatewayMulticastDomain"
  | EC2TransitGatewayConnect -> `String "AWS::EC2::TransitGatewayConnect"
  | EC2IPAMPool -> `String "AWS::EC2::IPAMPool"
  | EC2CarrierGateway -> `String "AWS::EC2::CarrierGateway"
  | ConnectQuickConnect -> `String "AWS::Connect::QuickConnect"
  | ConnectInstance -> `String "AWS::Connect::Instance"
  | AppMeshMesh -> `String "AWS::AppMesh::Mesh"
  | AppMeshGatewayRoute -> `String "AWS::AppMesh::GatewayRoute"
  | ACMPCACertificateAuthorityActivation -> `String "AWS::ACMPCA::CertificateAuthorityActivation"
  | BatchSchedulingPolicy -> `String "AWS::Batch::SchedulingPolicy"
  | Route53ResolverResolverQueryLoggingConfig -> `String "AWS::Route53Resolver::ResolverQueryLoggingConfig"
  | CodeGuruProfilerProfilingGroup -> `String "AWS::CodeGuruProfiler::ProfilingGroup"
  | APSRuleGroupsNamespace -> `String "AWS::APS::RuleGroupsNamespace"
  | MediaConnectFlowSource -> `String "AWS::MediaConnect::FlowSource"
  | TransferCertificate -> `String "AWS::Transfer::Certificate"
  | ServiceDiscoveryInstance -> `String "AWS::ServiceDiscovery::Instance"
  | Route53ResolverResolverQueryLoggingConfigAssociation -> `String "AWS::Route53Resolver::ResolverQueryLoggingConfigAssociation"
  | InspectorV2Filter -> `String "AWS::InspectorV2::Filter"
  | IoTProvisioningTemplate -> `String "AWS::IoT::ProvisioningTemplate"
  | IoTWirelessFuotaTask -> `String "AWS::IoTWireless::FuotaTask"
  | IoTJobTemplate -> `String "AWS::IoT::JobTemplate"
  | AppStreamStack -> `String "AWS::AppStream::Stack"
  | MSKBatchScramSecret -> `String "AWS::MSK::BatchScramSecret"
  | SageMakerFeatureGroup -> `String "AWS::SageMaker::FeatureGroup"
  | CodeBuildReportGroup -> `String "AWS::CodeBuild::ReportGroup"
  | IoTTwinMakerComponentType -> `String "AWS::IoTTwinMaker::ComponentType"
  | PersonalizeDatasetGroup -> `String "AWS::Personalize::DatasetGroup"
  | IoTWirelessMulticastGroup -> `String "AWS::IoTWireless::MulticastGroup"
  | NetworkManagerLinkAssociation -> `String "AWS::NetworkManager::LinkAssociation"
  | NetworkManagerCustomerGatewayAssociation -> `String "AWS::NetworkManager::CustomerGatewayAssociation"
  | S3AccessPoint -> `String "AWS::S3::AccessPoint"
  | PinpointEmailChannel -> `String "AWS::Pinpoint::EmailChannel"
  | LogsDestination -> `String "AWS::Logs::Destination"
  | KinesisVideoStream -> `String "AWS::KinesisVideo::Stream"
  | KendraIndex -> `String "AWS::Kendra::Index"
  | EC2ClientVpnEndpoint -> `String "AWS::EC2::ClientVpnEndpoint"
  | EC2CapacityReservation -> `String "AWS::EC2::CapacityReservation"
  | DMSEndpoint -> `String "AWS::DMS::Endpoint"
  | CustomerProfilesObjectType -> `String "AWS::CustomerProfiles::ObjectType"
  | AppRunnerService -> `String "AWS::AppRunner::Service"
  | AppMeshVirtualRouter -> `String "AWS::AppMesh::VirtualRouter"
  | AppMeshVirtualGateway -> `String "AWS::AppMesh::VirtualGateway"
  | AppConfigHostedConfigurationVersion -> `String "AWS::AppConfig::HostedConfigurationVersion"
  | ACMPCACertificateAuthority -> `String "AWS::ACMPCA::CertificateAuthority"
  | ResilienceHubApp -> `String "AWS::ResilienceHub::App"
  | PinpointEventStream -> `String "AWS::Pinpoint::EventStream"
  | PinpointEmailTemplate -> `String "AWS::Pinpoint::EmailTemplate"
  | PersonalizeSolution -> `String "AWS::Personalize::Solution"
  | PersonalizeSchema -> `String "AWS::Personalize::Schema"
  | PersonalizeDataset -> `String "AWS::Personalize::Dataset"
  | MSKConfiguration -> `String "AWS::MSK::Configuration"
  | MediaTailorPlaybackConfiguration -> `String "AWS::MediaTailor::PlaybackConfiguration"
  | MediaConnectFlowVpcInterface -> `String "AWS::MediaConnect::FlowVpcInterface"
  | MediaConnectFlowEntitlement -> `String "AWS::MediaConnect::FlowEntitlement"
  | GroundStationMissionProfile -> `String "AWS::GroundStation::MissionProfile"
  | GreengrassV2ComponentVersion -> `String "AWS::GreengrassV2::ComponentVersion"
  | ForecastDatasetGroup -> `String "AWS::Forecast::DatasetGroup"
  | EvidentlyLaunch -> `String "AWS::Evidently::Launch"
  | EC2IPAMScope -> `String "AWS::EC2::IPAMScope"
  | AthenaPreparedStatement -> `String "AWS::Athena::PreparedStatement"
  | AppMeshRoute -> `String "AWS::AppMesh::Route"
  | AppIntegrationsEventIntegration -> `String "AWS::AppIntegrations::EventIntegration"
  | AmplifyBranch -> `String "AWS::Amplify::Branch"
  | KinesisFirehoseDeliveryStream -> `String "AWS::KinesisFirehose::DeliveryStream"
  | TransferConnector -> `String "AWS::Transfer::Connector"
  | TransferAgreement -> `String "AWS::Transfer::Agreement"
  | SageMakerDomain -> `String "AWS::SageMaker::Domain"
  | PinpointInAppTemplate -> `String "AWS::Pinpoint::InAppTemplate"
  | PinpointCampaign -> `String "AWS::Pinpoint::Campaign"
  | IAMServerCertificate -> `String "AWS::IAM::ServerCertificate"
  | IAMSAMLProvider -> `String "AWS::IAM::SAMLProvider"
  | ForecastDataset -> `String "AWS::Forecast::Dataset"
  | EvidentlyProject -> `String "AWS::Evidently::Project"
  | EC2SpotFleet -> `String "AWS::EC2::SpotFleet"
  | EC2PrefixList -> `String "AWS::EC2::PrefixList"
  | CodeArtifactRepository -> `String "AWS::CodeArtifact::Repository"
  | AppStreamApplication -> `String "AWS::AppStream::Application"
  | AppRunnerVpcConnector -> `String "AWS::AppRunner::VpcConnector"
  | AppMeshVirtualService -> `String "AWS::AppMesh::VirtualService"
  | AppMeshVirtualNode -> `String "AWS::AppMesh::VirtualNode"
  | AmplifyApp -> `String "AWS::Amplify::App"
  | SignerSigningProfile -> `String "AWS::Signer::SigningProfile"
  | CassandraKeyspace -> `String "AWS::Cassandra::Keyspace"
  | ECSTaskSet -> `String "AWS::ECS::TaskSet"
  | SageMakerImage -> `String "AWS::SageMaker::Image"
  | SageMakerAppImageConfig -> `String "AWS::SageMaker::AppImageConfig"
  | Route53ResolverFirewallRuleGroupAssociation -> `String "AWS::Route53Resolver::FirewallRuleGroupAssociation"
  | RedshiftScheduledAction -> `String "AWS::Redshift::ScheduledAction"
  | PinpointApp -> `String "AWS::Pinpoint::App"
  | PanoramaPackage -> `String "AWS::Panorama::Package"
  | NetworkManagerSite -> `String "AWS::NetworkManager::Site"
  | NetworkManagerLink -> `String "AWS::NetworkManager::Link"
  | NetworkManagerGlobalNetwork -> `String "AWS::NetworkManager::GlobalNetwork"
  | NetworkManagerDevice -> `String "AWS::NetworkManager::Device"
  | IoTWirelessServiceProfile -> `String "AWS::IoTWireless::ServiceProfile"
  | IoTFleetMetric -> `String "AWS::IoT::FleetMetric"
  | ImageBuilderImagePipeline -> `String "AWS::ImageBuilder::ImagePipeline"
  | GroundStationConfig -> `String "AWS::GroundStation::Config"
  | ECRPullThroughCacheRule -> `String "AWS::ECR::PullThroughCacheRule"
  | EC2SubnetRouteTableAssociation -> `String "AWS::EC2::SubnetRouteTableAssociation"
  | EC2EC2Fleet -> `String "AWS::EC2::EC2Fleet"
  | DeviceFarmProject -> `String "AWS::DeviceFarm::Project"
  | DeviceFarmInstanceProfile -> `String "AWS::DeviceFarm::InstanceProfile"
  | CloudWatchMetricStream -> `String "AWS::CloudWatch::MetricStream"
  | AuditManagerAssessment -> `String "AWS::AuditManager::Assessment"
  | AppFlowFlow -> `String "AWS::AppFlow::Flow"
  | AppConfigDeploymentStrategy -> `String "AWS::AppConfig::DeploymentStrategy"
  | ConnectPhoneNumber -> `String "AWS::Connect::PhoneNumber"
  | AutoScalingWarmPool -> `String "AWS::AutoScaling::WarmPool"
  | CustomerProfilesDomain -> `String "AWS::CustomerProfiles::Domain"
  | NetworkManagerTransitGatewayRegistration -> `String "AWS::NetworkManager::TransitGatewayRegistration"
  | IoTTwinMakerScene -> `String "AWS::IoTTwinMaker::Scene"
  | EC2IPAM -> `String "AWS::EC2::IPAM"
  | EC2TrafficMirrorFilter -> `String "AWS::EC2::TrafficMirrorFilter"
  | EC2NetworkInsightsPath -> `String "AWS::EC2::NetworkInsightsPath"
  | EC2DHCPOptions -> `String "AWS::EC2::DHCPOptions"
  | EventsRule -> `String "AWS::Events::Rule"
  | PinpointApplicationSettings -> `String "AWS::Pinpoint::ApplicationSettings"
  | PinpointSegment -> `String "AWS::Pinpoint::Segment"
  | HealthLakeFHIRDatastore -> `String "AWS::HealthLake::FHIRDatastore"
  | RoboMakerRobotApplication -> `String "AWS::RoboMaker::RobotApplication"
  | RoboMakerSimulationApplication -> `String "AWS::RoboMaker::SimulationApplication"
  | Route53RecoveryReadinessResourceSet -> `String "AWS::Route53RecoveryReadiness::ResourceSet"
  | Route53RecoveryControlRoutingControl -> `String "AWS::Route53RecoveryControl::RoutingControl"
  | Route53RecoveryControlControlPanel -> `String "AWS::Route53RecoveryControl::ControlPanel"
  | Route53RecoveryControlSafetyRule -> `String "AWS::Route53RecoveryControl::SafetyRule"
  | Route53RecoveryControlCluster -> `String "AWS::Route53RecoveryControl::Cluster"
  | LookoutVisionProject -> `String "AWS::LookoutVision::Project"
  | AppStreamDirectoryConfig -> `String "AWS::AppStream::DirectoryConfig"
  | KinesisVideoSignalingChannel -> `String "AWS::KinesisVideo::SignalingChannel"
  | MediaPackagePackagingConfiguration -> `String "AWS::MediaPackage::PackagingConfiguration"
  | EventSchemasSchema -> `String "AWS::EventSchemas::Schema"
  | EventsConnection -> `String "AWS::Events::Connection"
  | IoTScheduledAudit -> `String "AWS::IoT::ScheduledAudit"
  | S3StorageLens -> `String "AWS::S3::StorageLens"
  | EC2TrafficMirrorTarget -> `String "AWS::EC2::TrafficMirrorTarget"
  | IoTAccountAuditConfiguration -> `String "AWS::IoT::AccountAuditConfiguration"
  | LookoutMetricsAlert -> `String "AWS::LookoutMetrics::Alert"
  | LexBotAlias -> `String "AWS::Lex::BotAlias"
  | IoTSiteWiseGateway -> `String "AWS::IoTSiteWise::Gateway"
  | EC2TrafficMirrorSession -> `String "AWS::EC2::TrafficMirrorSession"
  | RoboMakerRobotApplicationVersion -> `String "AWS::RoboMaker::RobotApplicationVersion"
  | Route53ResolverFirewallDomainList -> `String "AWS::Route53Resolver::FirewallDomainList"
  | IoTCustomMetric -> `String "AWS::IoT::CustomMetric"
  | CodeGuruReviewerRepositoryAssociation -> `String "AWS::CodeGuruReviewer::RepositoryAssociation"
  | LexBot -> `String "AWS::Lex::Bot"
  | BudgetsBudgetsAction -> `String "AWS::Budgets::BudgetsAction"
  | DeviceFarmTestGridProject -> `String "AWS::DeviceFarm::TestGridProject"
  | S3MultiRegionAccessPoint -> `String "AWS::S3::MultiRegionAccessPoint"
  | RDSGlobalCluster -> `String "AWS::RDS::GlobalCluster"
  | KinesisAnalyticsV2Application -> `String "AWS::KinesisAnalyticsV2::Application"
  | IVSPlaybackKeyPair -> `String "AWS::IVS::PlaybackKeyPair"
  | IVSRecordingConfiguration -> `String "AWS::IVS::RecordingConfiguration"
  | IVSChannel -> `String "AWS::IVS::Channel"
  | IoTSiteWiseAssetModel -> `String "AWS::IoTSiteWise::AssetModel"
  | IoTSiteWisePortal -> `String "AWS::IoTSiteWise::Portal"
  | IoTSiteWiseProject -> `String "AWS::IoTSiteWise::Project"
  | IoTSiteWiseDashboard -> `String "AWS::IoTSiteWise::Dashboard"
  | IoTAnalyticsChannel -> `String "AWS::IoTAnalytics::Channel"
  | IoTAnalyticsPipeline -> `String "AWS::IoTAnalytics::Pipeline"
  | IoTAnalyticsDataset -> `String "AWS::IoTAnalytics::Dataset"
  | IoTTwinMakerEntity -> `String "AWS::IoTTwinMaker::Entity"
  | IoTTwinMakerWorkspace -> `String "AWS::IoTTwinMaker::Workspace"
  | IoTMitigationAction -> `String "AWS::IoT::MitigationAction"
  | IoTPolicy -> `String "AWS::IoT::Policy"
  | GlueMLTransform -> `String "AWS::Glue::MLTransform"
  | EKSAddon -> `String "AWS::EKS::Addon"
  | EKSIdentityProviderConfig -> `String "AWS::EKS::IdentityProviderConfig"
  | TransferWorkflow -> `String "AWS::Transfer::Workflow"
  | ResilienceHubResiliencyPolicy -> `String "AWS::ResilienceHub::ResiliencyPolicy"
  | Route53RecoveryReadinessRecoveryGroup -> `String "AWS::Route53RecoveryReadiness::RecoveryGroup"
  | MediaPackagePackagingGroup -> `String "AWS::MediaPackage::PackagingGroup"
  | LightsailStaticIp -> `String "AWS::Lightsail::StaticIp"
  | LightsailBucket -> `String "AWS::Lightsail::Bucket"
  | IoTAnalyticsDatastore -> `String "AWS::IoTAnalytics::Datastore"
  | IoTDimension -> `String "AWS::IoT::Dimension"
  | IoTRoleAlias -> `String "AWS::IoT::RoleAlias"
  | IoTSecurityProfile -> `String "AWS::IoT::SecurityProfile"
  | IoTAuthorizer -> `String "AWS::IoT::Authorizer"
  | FraudDetectorOutcome -> `String "AWS::FraudDetector::Outcome"
  | FraudDetectorVariable -> `String "AWS::FraudDetector::Variable"
  | FraudDetectorEntityType -> `String "AWS::FraudDetector::EntityType"
  | FraudDetectorLabel -> `String "AWS::FraudDetector::Label"
  | EventSchemasDiscoverer -> `String "AWS::EventSchemas::Discoverer"
  | EventSchemasRegistryPolicy -> `String "AWS::EventSchemas::RegistryPolicy"
  | EventSchemasRegistry -> `String "AWS::EventSchemas::Registry"
  | Cloud9EnvironmentEC2 -> `String "AWS::Cloud9::EnvironmentEC2"
  | AppConfigConfigurationProfile -> `String "AWS::AppConfig::ConfigurationProfile"
  | AppConfigEnvironment -> `String "AWS::AppConfig::Environment"
  | AmazonMQBroker -> `String "AWS::AmazonMQ::Broker"
  | SESTemplate -> `String "AWS::SES::Template"
  | GuardDutyFilter -> `String "AWS::GuardDuty::Filter"
  | SESReceiptFilter -> `String "AWS::SES::ReceiptFilter"
  | DataSyncLocationFSxWindows -> `String "AWS::DataSync::LocationFSxWindows"
  | FISExperimentTemplate -> `String "AWS::FIS::ExperimentTemplate"
  | LightsailDisk -> `String "AWS::Lightsail::Disk"
  | EventsApiDestination -> `String "AWS::Events::ApiDestination"
  | EventsArchive -> `String "AWS::Events::Archive"
  | SESReceiptRuleSet -> `String "AWS::SES::ReceiptRuleSet"
  | EventsEndpoint -> `String "AWS::Events::Endpoint"
  | RUMAppMonitor -> `String "AWS::RUM::AppMonitor"
  | LightsailCertificate -> `String "AWS::Lightsail::Certificate"
  | BackupReportPlan -> `String "AWS::Backup::ReportPlan"
  | ECRRegistryPolicy -> `String "AWS::ECR::RegistryPolicy"
  | Route53RecoveryReadinessReadinessCheck -> `String "AWS::Route53RecoveryReadiness::ReadinessCheck"
  | Route53RecoveryReadinessCell -> `String "AWS::Route53RecoveryReadiness::Cell"
  | GlueClassifier -> `String "AWS::Glue::Classifier"
  | DataSyncLocationHDFS -> `String "AWS::DataSync::LocationHDFS"
  | DataSyncLocationObjectStorage -> `String "AWS::DataSync::LocationObjectStorage"
  | ImageBuilderInfrastructureConfiguration -> `String "AWS::ImageBuilder::InfrastructureConfiguration"
  | ImageBuilderDistributionConfiguration -> `String "AWS::ImageBuilder::DistributionConfiguration"
  | ImageBuilderContainerRecipe -> `String "AWS::ImageBuilder::ContainerRecipe"
  | EventsEventBus -> `String "AWS::Events::EventBus"
  | ServiceDiscoveryHttpNamespace -> `String "AWS::ServiceDiscovery::HttpNamespace"
  | IoTEventsAlarmModel -> `String "AWS::IoTEvents::AlarmModel"
  | IoTEventsDetectorModel -> `String "AWS::IoTEvents::DetectorModel"
  | IoTEventsInput -> `String "AWS::IoTEvents::Input"
  | Route53HostedZone -> `String "AWS::Route53::HostedZone"
  | SESConfigurationSet -> `String "AWS::SES::ConfigurationSet"
  | SESContactList -> `String "AWS::SES::ContactList"
  | ServiceDiscoveryPublicDnsNamespace -> `String "AWS::ServiceDiscovery::PublicDnsNamespace"
  | ServiceDiscoveryService -> `String "AWS::ServiceDiscovery::Service"
  | SageMakerNotebookInstanceLifecycleConfig -> `String "AWS::SageMaker::NotebookInstanceLifecycleConfig"
  | SageMakerWorkteam -> `String "AWS::SageMaker::Workteam"
  | GuardDutyIPSet -> `String "AWS::GuardDuty::IPSet"
  | GuardDutyThreatIntelSet -> `String "AWS::GuardDuty::ThreatIntelSet"
  | GlueJob -> `String "AWS::Glue::Job"
  | EKSFargateProfile -> `String "AWS::EKS::FargateProfile"
  | NetworkInsightsAccessScopeAnalysis -> `String "AWS::EC2::NetworkInsightsAccessScopeAnalysis"
  | DataSyncLocationNFS -> `String "AWS::DataSync::LocationNFS"
  | DataSyncTask -> `String "AWS::DataSync::Task"
  | DataSyncLocationEFS -> `String "AWS::DataSync::LocationEFS"
  | DataSyncLocationS3 -> `String "AWS::DataSync::LocationS3"
  | DataSyncLocationFSxLustre -> `String "AWS::DataSync::LocationFSxLustre"
  | DataSyncLocationSMB -> `String "AWS::DataSync::LocationSMB"
  | AppSyncGraphQLApi -> `String "AWS::AppSync::GraphQLApi"
  | AppConfigApplication -> `String "AWS::AppConfig::Application"
  | DMSCertificate -> `String "AWS::DMS::Certificate"
  | TransitGatewayRouteTable -> `String "AWS::EC2::TransitGatewayRouteTable"
  | TransitGatewayAttachment -> `String "AWS::EC2::TransitGatewayAttachment"
  | GlobalAcceleratorListener -> `String "AWS::GlobalAccelerator::Listener"
  | GlobalAcceleratorEndpointGroup -> `String "AWS::GlobalAccelerator::EndpointGroup"
  | GlobalAcceleratorAccelerator -> `String "AWS::GlobalAccelerator::Accelerator"
  | DetectiveGraph -> `String "AWS::Detective::Graph"
  | AthenaDataCatalog -> `String "AWS::Athena::DataCatalog"
  | AthenaWorkGroup -> `String "AWS::Athena::WorkGroup"
  | AccessAnalyzerAnalyzer -> `String "AWS::AccessAnalyzer::Analyzer"
  | BatchComputeEnvironment -> `String "AWS::Batch::ComputeEnvironment"
  | BatchJobQueue -> `String "AWS::Batch::JobQueue"
  | StepFunctionsStateMachine -> `String "AWS::StepFunctions::StateMachine"
  | ListenerV2 -> `String "AWS::ElasticLoadBalancingV2::Listener"
  | SageMakerModel -> `String "AWS::SageMaker::Model"
  | WorkSpacesConnectionAlias -> `String "AWS::WorkSpaces::ConnectionAlias"
  | WorkSpacesWorkspace -> `String "AWS::WorkSpaces::Workspace"
  | StepFunctionsActivity -> `String "AWS::StepFunctions::Activity"
  | MSKCluster -> `String "AWS::MSK::Cluster"
  | DMSEventSubscription -> `String "AWS::DMS::EventSubscription"
  | DMSReplicationSubnetGroup -> `String "AWS::DMS::ReplicationSubnetGroup"
  | Route53ResolverResolverRuleAssociation -> `String "AWS::Route53Resolver::ResolverRuleAssociation"
  | Route53ResolverResolverRule -> `String "AWS::Route53Resolver::ResolverRule"
  | Route53ResolverResolverEndpoint -> `String "AWS::Route53Resolver::ResolverEndpoint"
  | SageMakerCodeRepository -> `String "AWS::SageMaker::CodeRepository"
  | EMRSecurityConfiguration -> `String "AWS::EMR::SecurityConfiguration"
  | GuardDutyDetector -> `String "AWS::GuardDuty::Detector"
  | ECRPublicRepository -> `String "AWS::ECR::PublicRepository"
  | LaunchTemplate -> `String "AWS::EC2::LaunchTemplate"
  | CodeDeployDeploymentGroup -> `String "AWS::CodeDeploy::DeploymentGroup"
  | CodeDeployDeploymentConfig -> `String "AWS::CodeDeploy::DeploymentConfig"
  | CodeDeployApplication -> `String "AWS::CodeDeploy::Application"
  | KinesisStreamConsumer -> `String "AWS::Kinesis::StreamConsumer"
  | KinesisStream -> `String "AWS::Kinesis::Stream"
  | TransitGateway -> `String "AWS::EC2::TransitGateway"
  | OpenSearchDomain -> `String "AWS::OpenSearch::Domain"
  | EKSCluster -> `String "AWS::EKS::Cluster"
  | EFSFileSystem -> `String "AWS::EFS::FileSystem"
  | EFSAccessPoint -> `String "AWS::EFS::AccessPoint"
  | ECSTaskDefinition -> `String "AWS::ECS::TaskDefinition"
  | ECSService -> `String "AWS::ECS::Service"
  | ECSCluster -> `String "AWS::ECS::Cluster"
  | ECRRepository -> `String "AWS::ECR::Repository"
  | BackupRecoveryPoint -> `String "AWS::Backup::RecoveryPoint"
  | BackupVault -> `String "AWS::Backup::BackupVault"
  | BackupSelection -> `String "AWS::Backup::BackupSelection"
  | BackupPlan -> `String "AWS::Backup::BackupPlan"
  | FileData -> `String "AWS::SSM::FileData"
  | Topic -> `String "AWS::SNS::Topic"
  | Secret -> `String "AWS::SecretsManager::Secret"
  | QLDBLedger -> `String "AWS::QLDB::Ledger"
  | Key -> `String "AWS::KMS::Key"
  | Queue -> `String "AWS::SQS::Queue"
  | Portfolio -> `String "AWS::ServiceCatalog::Portfolio"
  | CloudFormationProduct -> `String "AWS::ServiceCatalog::CloudFormationProduct"
  | CloudFormationProvisionedProduct -> `String "AWS::ServiceCatalog::CloudFormationProvisionedProduct"
  | Pipeline -> `String "AWS::CodePipeline::Pipeline"
  | Api -> `String "AWS::ApiGatewayV2::Api"
  | StageV2 -> `String "AWS::ApiGatewayV2::Stage"
  | RestApi -> `String "AWS::ApiGateway::RestApi"
  | Stage -> `String "AWS::ApiGateway::Stage"
  | ResourceCompliance -> `String "AWS::Config::ResourceCompliance"
  | ConformancePackCompliance -> `String "AWS::Config::ConformancePackCompliance"
  | RegionalProtection -> `String "AWS::ShieldRegional::Protection"
  | Protection -> `String "AWS::Shield::Protection"
  | PatchCompliance -> `String "AWS::SSM::PatchCompliance"
  | AssociationCompliance -> `String "AWS::SSM::AssociationCompliance"
  | EncryptionConfig -> `String "AWS::XRay::EncryptionConfig"
  | ManagedRuleSetV2 -> `String "AWS::WAFv2::ManagedRuleSet"
  | RegexPatternSetV2 -> `String "AWS::WAFv2::RegexPatternSet"
  | IPSetV2 -> `String "AWS::WAFv2::IPSet"
  | RuleGroupV2 -> `String "AWS::WAFv2::RuleGroup"
  | WebACLV2 -> `String "AWS::WAFv2::WebACL"
  | Environment -> `String "AWS::ElasticBeanstalk::Environment"
  | ApplicationVersion -> `String "AWS::ElasticBeanstalk::ApplicationVersion"
  | Application -> `String "AWS::ElasticBeanstalk::Application"
  | NetworkFirewallRuleGroup -> `String "AWS::NetworkFirewall::RuleGroup"
  | NetworkFirewallFirewallPolicy -> `String "AWS::NetworkFirewall::FirewallPolicy"
  | NetworkFirewallFirewall -> `String "AWS::NetworkFirewall::Firewall"
  | Function -> `String "AWS::Lambda::Function"
  | StreamingDistribution -> `String "AWS::CloudFront::StreamingDistribution"
  | Distribution -> `String "AWS::CloudFront::Distribution"
  | RegionalWebACL -> `String "AWS::WAFRegional::WebACL"
  | RegionalRuleGroup -> `String "AWS::WAFRegional::RuleGroup"
  | RegionalRule -> `String "AWS::WAFRegional::Rule"
  | RegionalRateBasedRule -> `String "AWS::WAFRegional::RateBasedRule"
  | WebACL -> `String "AWS::WAF::WebACL"
  | RuleGroup -> `String "AWS::WAF::RuleGroup"
  | Rule -> `String "AWS::WAF::Rule"
  | RateBasedRule -> `String "AWS::WAF::RateBasedRule"
  | Project -> `String "AWS::CodeBuild::Project"
  | Table -> `String "AWS::DynamoDB::Table"
  | ScheduledAction -> `String "AWS::AutoScaling::ScheduledAction"
  | ScalingPolicy -> `String "AWS::AutoScaling::ScalingPolicy"
  | LaunchConfiguration -> `String "AWS::AutoScaling::LaunchConfiguration"
  | AutoScalingGroup -> `String "AWS::AutoScaling::AutoScalingGroup"
  | LoadBalancer -> `String "AWS::ElasticLoadBalancing::LoadBalancer"
  | Stack -> `String "AWS::CloudFormation::Stack"
  | Alarm -> `String "AWS::CloudWatch::Alarm"
  | ManagedInstanceInventory -> `String "AWS::SSM::ManagedInstanceInventory"
  | RedshiftEventSubscription -> `String "AWS::Redshift::EventSubscription"
  | ClusterSubnetGroup -> `String "AWS::Redshift::ClusterSubnetGroup"
  | ClusterSecurityGroup -> `String "AWS::Redshift::ClusterSecurityGroup"
  | ClusterParameterGroup -> `String "AWS::Redshift::ClusterParameterGroup"
  | ClusterSnapshot -> `String "AWS::Redshift::ClusterSnapshot"
  | Cluster -> `String "AWS::Redshift::Cluster"
  | AccountPublicAccessBlock -> `String "AWS::S3::AccountPublicAccessBlock"
  | Bucket -> `String "AWS::S3::Bucket"
  | EventSubscription -> `String "AWS::RDS::EventSubscription"
  | DBClusterSnapshot -> `String "AWS::RDS::DBClusterSnapshot"
  | DBCluster -> `String "AWS::RDS::DBCluster"
  | DBSnapshot -> `String "AWS::RDS::DBSnapshot"
  | DBSecurityGroup -> `String "AWS::RDS::DBSecurityGroup"
  | DBSubnetGroup -> `String "AWS::RDS::DBSubnetGroup"
  | DBInstance -> `String "AWS::RDS::DBInstance"
  | Certificate -> `String "AWS::ACM::Certificate"
  | LoadBalancerV2 -> `String "AWS::ElasticLoadBalancingV2::LoadBalancer"
  | User -> `String "AWS::IAM::User"
  | Role -> `String "AWS::IAM::Role"
  | Policy -> `String "AWS::IAM::Policy"
  | Group -> `String "AWS::IAM::Group"
  | Domain -> `String "AWS::Elasticsearch::Domain"
  | VPCPeeringConnection -> `String "AWS::EC2::VPCPeeringConnection"
  | FlowLog -> `String "AWS::EC2::FlowLog"
  | VPCEndpointService -> `String "AWS::EC2::VPCEndpointService"
  | VPCEndpoint -> `String "AWS::EC2::VPCEndpoint"
  | EgressOnlyInternetGateway -> `String "AWS::EC2::EgressOnlyInternetGateway"
  | NatGateway -> `String "AWS::EC2::NatGateway"
  | RegisteredHAInstance -> `String "AWS::EC2::RegisteredHAInstance"
  | VPNGateway -> `String "AWS::EC2::VPNGateway"
  | VPNConnection -> `String "AWS::EC2::VPNConnection"
  | VPC -> `String "AWS::EC2::VPC"
  | Volume -> `String "AWS::EC2::Volume"
  | Trail -> `String "AWS::CloudTrail::Trail"
  | Subnet -> `String "AWS::EC2::Subnet"
  | SecurityGroup -> `String "AWS::EC2::SecurityGroup"
  | RouteTable -> `String "AWS::EC2::RouteTable"
  | NetworkInterface -> `String "AWS::EC2::NetworkInterface"
  | NetworkAcl -> `String "AWS::EC2::NetworkAcl"
  | InternetGateway -> `String "AWS::EC2::InternetGateway"
  | Instance -> `String "AWS::EC2::Instance"
  | Host -> `String "AWS::EC2::Host"
  | EIP -> `String "AWS::EC2::EIP"
  | CustomerGateway -> `String "AWS::EC2::CustomerGateway"
   

let resource_name_to_yojson = string_to_yojson

let aggregate_resource_identifier_to_yojson = 
  fun (x: aggregate_resource_identifier) -> assoc_to_yojson(
    [(
         "ResourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       (
         "ResourceType",
         (Some (resource_type_to_yojson x.resource_type)));
       (
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       (
         "SourceRegion",
         (Some (aws_region_to_yojson x.source_region)));
       (
         "SourceAccountId",
         (Some (account_id_to_yojson x.source_account_id)));
       
  ])

let unprocessed_resource_identifier_list_to_yojson = 
  fun tree -> list_to_yojson aggregate_resource_identifier_to_yojson tree

let too_many_tags_exception_to_yojson = 
  fun (x: too_many_tags_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let date_to_yojson = timestamp_to_yojson

let time_window_to_yojson = 
  fun (x: time_window) -> assoc_to_yojson(
    [(
         "EndTime",
         (option_to_yojson date_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_to_yojson x.start_time));
       
  ])

let ssm_document_name_to_yojson = string_to_yojson

let ssm_document_version_to_yojson = string_to_yojson

let template_ssm_document_details_to_yojson = 
  fun (x: template_ssm_document_details) -> assoc_to_yojson(
    [(
         "DocumentVersion",
         (option_to_yojson ssm_document_version_to_yojson x.document_version));
       (
         "DocumentName",
         (Some (ssm_document_name_to_yojson x.document_name)));
       
  ])

let template_s3_uri_to_yojson = string_to_yojson

let template_body_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson tag_value_to_yojson x.value));
       (
         "Key",
         (option_to_yojson tag_key_to_yojson x.key));
       
  ])

let tags_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let name_to_yojson = string_to_yojson

let tags_to_yojson = fun tree -> map_to_yojson value_to_yojson tree

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceArn",
         (Some (amazon_resource_name_to_yojson x.resource_arn)));
       
  ])

let supplementary_configuration_value_to_yojson = string_to_yojson

let supplementary_configuration_name_to_yojson = string_to_yojson

let supplementary_configuration_to_yojson = 
  fun tree -> map_to_yojson supplementary_configuration_value_to_yojson tree

let string_with_char_limit768_to_yojson = string_to_yojson

let string_with_char_limit64_to_yojson = string_to_yojson

let string_with_char_limit256_min0_to_yojson = string_to_yojson

let string_with_char_limit256_to_yojson = string_to_yojson

let string_with_char_limit2048_to_yojson = string_to_yojson

let string_with_char_limit128_to_yojson = string_to_yojson

let string_with_char_limit1024_to_yojson = string_to_yojson

let string__to_yojson = string_to_yojson

let query_id_to_yojson = string_to_yojson

let query_arn_to_yojson = string_to_yojson

let query_name_to_yojson = string_to_yojson

let query_description_to_yojson = string_to_yojson

let stored_query_metadata_to_yojson = 
  fun (x: stored_query_metadata) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson query_description_to_yojson x.description));
       (
         "QueryName",
         (Some (query_name_to_yojson x.query_name)));
       (
         "QueryArn",
         (Some (query_arn_to_yojson x.query_arn)));
       (
         "QueryId",
         (Some (query_id_to_yojson x.query_id)));
       
  ])

let stored_query_metadata_list_to_yojson = 
  fun tree -> list_to_yojson stored_query_metadata_to_yojson tree

let query_expression_to_yojson = string_to_yojson

let stored_query_to_yojson = 
  fun (x: stored_query) -> assoc_to_yojson(
    [(
         "Expression",
         (option_to_yojson query_expression_to_yojson x.expression));
       (
         "Description",
         (option_to_yojson query_description_to_yojson x.description));
       (
         "QueryName",
         (Some (query_name_to_yojson x.query_name)));
       (
         "QueryArn",
         (option_to_yojson query_arn_to_yojson x.query_arn));
       (
         "QueryId",
         (option_to_yojson query_id_to_yojson x.query_id));
       
  ])

let recorder_name_to_yojson = string_to_yojson

let stop_configuration_recorder_request_to_yojson = 
  fun (x: stop_configuration_recorder_request) -> assoc_to_yojson(
    [(
         "ConfigurationRecorderName",
         (Some (recorder_name_to_yojson x.configuration_recorder_name)));
       
  ])

let no_such_configuration_recorder_exception_to_yojson = 
  fun (x: no_such_configuration_recorder_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let member_account_rule_status_to_yojson = 
  fun (x: member_account_rule_status) -> match x with 
 
| UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_SUCCESSFUL -> `String "UPDATE_SUCCESSFUL"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_SUCCESSFUL -> `String "DELETE_SUCCESSFUL"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_SUCCESSFUL -> `String "CREATE_SUCCESSFUL"
   

let status_detail_filters_to_yojson = 
  fun (x: status_detail_filters) -> assoc_to_yojson(
    [(
         "MemberAccountRuleStatus",
         (option_to_yojson member_account_rule_status_to_yojson x.member_account_rule_status));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       
  ])

let static_parameter_values_to_yojson = 
  fun tree -> list_to_yojson string_with_char_limit256_to_yojson tree

let static_value_to_yojson = 
  fun (x: static_value) -> assoc_to_yojson(
    [(
         "Values",
         (Some (static_parameter_values_to_yojson x.values)));
       
  ])

let resource_evaluation_id_to_yojson = string_to_yojson

let start_resource_evaluation_response_to_yojson = 
  fun (x: start_resource_evaluation_response) -> assoc_to_yojson(
    [(
         "ResourceEvaluationId",
         (option_to_yojson resource_evaluation_id_to_yojson x.resource_evaluation_id));
       
  ])

let base_resource_id_to_yojson = string_to_yojson

let resource_configuration_to_yojson = string_to_yojson

let resource_configuration_schema_type_to_yojson = 
  fun (x: resource_configuration_schema_type) -> match x with 
  | CFN_RESOURCE_SCHEMA -> `String "CFN_RESOURCE_SCHEMA"
     

let resource_details_to_yojson = 
  fun (x: resource_details) -> assoc_to_yojson(
    [(
         "ResourceConfigurationSchemaType",
         (option_to_yojson resource_configuration_schema_type_to_yojson x.resource_configuration_schema_type));
       (
         "ResourceConfiguration",
         (Some (resource_configuration_to_yojson x.resource_configuration)));
       (
         "ResourceType",
         (Some (string_with_char_limit256_to_yojson x.resource_type)));
       (
         "ResourceId",
         (Some (base_resource_id_to_yojson x.resource_id)));
       
  ])

let evaluation_context_identifier_to_yojson = string_to_yojson

let evaluation_context_to_yojson = 
  fun (x: evaluation_context) -> assoc_to_yojson(
    [(
         "EvaluationContextIdentifier",
         (option_to_yojson evaluation_context_identifier_to_yojson x.evaluation_context_identifier));
       
  ])

let evaluation_mode_to_yojson = 
  fun (x: evaluation_mode) -> match x with 
  | PROACTIVE -> `String "PROACTIVE"
    | DETECTIVE -> `String "DETECTIVE"
     

let evaluation_timeout_to_yojson = int_to_yojson

let client_token_to_yojson = string_to_yojson

let start_resource_evaluation_request_to_yojson = 
  fun (x: start_resource_evaluation_request) -> assoc_to_yojson(
    [(
         "ClientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "EvaluationTimeout",
         (option_to_yojson evaluation_timeout_to_yojson x.evaluation_timeout));
       (
         "EvaluationMode",
         (Some (evaluation_mode_to_yojson x.evaluation_mode)));
       (
         "EvaluationContext",
         (option_to_yojson evaluation_context_to_yojson x.evaluation_context));
       (
         "ResourceDetails",
         (Some (resource_details_to_yojson x.resource_details)));
       
  ])

let invalid_parameter_value_exception_to_yojson = 
  fun (x: invalid_parameter_value_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let idempotent_parameter_mismatch_to_yojson = 
  fun (x: idempotent_parameter_mismatch) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let resource_key_to_yojson = 
  fun (x: resource_key) -> assoc_to_yojson(
    [(
         "resourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       (
         "resourceType",
         (Some (resource_type_to_yojson x.resource_type)));
       
  ])

let resource_keys_to_yojson = 
  fun tree -> list_to_yojson resource_key_to_yojson tree

let start_remediation_execution_response_to_yojson = 
  fun (x: start_remediation_execution_response) -> assoc_to_yojson(
    [(
         "FailedItems",
         (option_to_yojson resource_keys_to_yojson x.failed_items));
       (
         "FailureMessage",
         (option_to_yojson string__to_yojson x.failure_message));
       
  ])

let config_rule_name_to_yojson = string_to_yojson

let start_remediation_execution_request_to_yojson = 
  fun (x: start_remediation_execution_request) -> assoc_to_yojson(
    [(
         "ResourceKeys",
         (Some (resource_keys_to_yojson x.resource_keys)));
       (
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       
  ])

let no_such_remediation_configuration_exception_to_yojson = 
  fun (x: no_such_remediation_configuration_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let insufficient_permissions_exception_to_yojson = 
  fun (x: insufficient_permissions_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let start_configuration_recorder_request_to_yojson = 
  fun (x: start_configuration_recorder_request) -> assoc_to_yojson(
    [(
         "ConfigurationRecorderName",
         (Some (recorder_name_to_yojson x.configuration_recorder_name)));
       
  ])

let no_available_delivery_channel_exception_to_yojson = 
  fun (x: no_available_delivery_channel_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let start_config_rules_evaluation_response_to_yojson = 
  fun (x: start_config_rules_evaluation_response) -> assoc_to_yojson(
    [
  ])

let reevaluate_config_rule_names_to_yojson = 
  fun tree -> list_to_yojson config_rule_name_to_yojson tree

let start_config_rules_evaluation_request_to_yojson = 
  fun (x: start_config_rules_evaluation_request) -> assoc_to_yojson(
    [(
         "ConfigRuleNames",
         (option_to_yojson reevaluate_config_rule_names_to_yojson x.config_rule_names));
       
  ])

let resource_in_use_exception_to_yojson = 
  fun (x: resource_in_use_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let no_such_config_rule_exception_to_yojson = 
  fun (x: no_such_config_rule_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let limit_exceeded_exception_to_yojson = 
  fun (x: limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_next_token_exception_to_yojson = 
  fun (x: invalid_next_token_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_limit_exception_to_yojson = 
  fun (x: invalid_limit_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_expression_exception_to_yojson = 
  fun (x: invalid_expression_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let results_to_yojson = fun tree -> list_to_yojson string__to_yojson tree

let field_name_to_yojson = string_to_yojson

let field_info_to_yojson = 
  fun (x: field_info) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson field_name_to_yojson x.name));
       
  ])

let field_info_list_to_yojson = 
  fun tree -> list_to_yojson field_info_to_yojson tree

let query_info_to_yojson = 
  fun (x: query_info) -> assoc_to_yojson(
    [(
         "SelectFields",
         (option_to_yojson field_info_list_to_yojson x.select_fields));
       
  ])

let next_token_to_yojson = string_to_yojson

let select_resource_config_response_to_yojson = 
  fun (x: select_resource_config_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "QueryInfo",
         (option_to_yojson query_info_to_yojson x.query_info));
       (
         "Results",
         (option_to_yojson results_to_yojson x.results));
       
  ])

let expression_to_yojson = string_to_yojson

let limit_to_yojson = int_to_yojson

let select_resource_config_request_to_yojson = 
  fun (x: select_resource_config_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "Expression",
         (Some (expression_to_yojson x.expression)));
       
  ])

let no_such_configuration_aggregator_exception_to_yojson = 
  fun (x: no_such_configuration_aggregator_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let select_aggregate_resource_config_response_to_yojson = 
  fun (x: select_aggregate_resource_config_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "QueryInfo",
         (option_to_yojson query_info_to_yojson x.query_info));
       (
         "Results",
         (option_to_yojson results_to_yojson x.results));
       
  ])

let configuration_aggregator_name_to_yojson = string_to_yojson

let select_aggregate_resource_config_request_to_yojson = 
  fun (x: select_aggregate_resource_config_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson limit_to_yojson x.max_results));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       (
         "Expression",
         (Some (expression_to_yojson x.expression)));
       
  ])

let resource_concurrent_modification_exception_to_yojson = 
  fun (x: resource_concurrent_modification_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let put_stored_query_response_to_yojson = 
  fun (x: put_stored_query_response) -> assoc_to_yojson(
    [(
         "QueryArn",
         (option_to_yojson query_arn_to_yojson x.query_arn));
       
  ])

let put_stored_query_request_to_yojson = 
  fun (x: put_stored_query_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_list_to_yojson x.tags));
       (
         "StoredQuery",
         (Some (stored_query_to_yojson x.stored_query)));
       
  ])

let max_number_of_retention_configurations_exceeded_exception_to_yojson = 
  fun (x: max_number_of_retention_configurations_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let retention_configuration_name_to_yojson = string_to_yojson

let retention_period_in_days_to_yojson = int_to_yojson

let retention_configuration_to_yojson = 
  fun (x: retention_configuration) -> assoc_to_yojson(
    [(
         "RetentionPeriodInDays",
         (Some (retention_period_in_days_to_yojson x.retention_period_in_days)));
       (
         "Name",
         (Some (retention_configuration_name_to_yojson x.name)));
       
  ])

let put_retention_configuration_response_to_yojson = 
  fun (x: put_retention_configuration_response) -> assoc_to_yojson(
    [(
         "RetentionConfiguration",
         (option_to_yojson retention_configuration_to_yojson x.retention_configuration));
       
  ])

let put_retention_configuration_request_to_yojson = 
  fun (x: put_retention_configuration_request) -> assoc_to_yojson(
    [(
         "RetentionPeriodInDays",
         (Some (retention_period_in_days_to_yojson x.retention_period_in_days)));
       
  ])

let no_running_configuration_recorder_exception_to_yojson = 
  fun (x: no_running_configuration_recorder_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let max_active_resources_exceeded_exception_to_yojson = 
  fun (x: max_active_resources_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_type_string_to_yojson = string_to_yojson

let schema_version_id_to_yojson = string_to_yojson

let configuration_to_yojson = string_to_yojson

let put_resource_config_request_to_yojson = 
  fun (x: put_resource_config_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "Configuration",
         (Some (configuration_to_yojson x.configuration)));
       (
         "ResourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       (
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       (
         "SchemaVersionId",
         (Some (schema_version_id_to_yojson x.schema_version_id)));
       (
         "ResourceType",
         (Some (resource_type_string_to_yojson x.resource_type)));
       
  ])

let remediation_exception_to_yojson = 
  fun (x: remediation_exception) -> assoc_to_yojson(
    [(
         "ExpirationTime",
         (option_to_yojson date_to_yojson x.expiration_time));
       (
         "Message",
         (option_to_yojson string_with_char_limit1024_to_yojson x.message));
       (
         "ResourceId",
         (Some (string_with_char_limit1024_to_yojson x.resource_id)));
       (
         "ResourceType",
         (Some (string_with_char_limit256_to_yojson x.resource_type)));
       (
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       
  ])

let remediation_exceptions_to_yojson = 
  fun tree -> list_to_yojson remediation_exception_to_yojson tree

let failed_remediation_exception_batch_to_yojson = 
  fun (x: failed_remediation_exception_batch) -> assoc_to_yojson(
    [(
         "FailedItems",
         (option_to_yojson remediation_exceptions_to_yojson x.failed_items));
       (
         "FailureMessage",
         (option_to_yojson string__to_yojson x.failure_message));
       
  ])

let failed_remediation_exception_batches_to_yojson = 
  fun tree -> list_to_yojson failed_remediation_exception_batch_to_yojson tree

let put_remediation_exceptions_response_to_yojson = 
  fun (x: put_remediation_exceptions_response) -> assoc_to_yojson(
    [(
         "FailedBatches",
         (option_to_yojson failed_remediation_exception_batches_to_yojson x.failed_batches));
       
  ])

let remediation_exception_resource_key_to_yojson = 
  fun (x: remediation_exception_resource_key) -> assoc_to_yojson(
    [(
         "ResourceId",
         (option_to_yojson string_with_char_limit1024_to_yojson x.resource_id));
       (
         "ResourceType",
         (option_to_yojson string_with_char_limit256_to_yojson x.resource_type));
       
  ])

let remediation_exception_resource_keys_to_yojson = 
  fun tree -> list_to_yojson remediation_exception_resource_key_to_yojson tree

let put_remediation_exceptions_request_to_yojson = 
  fun (x: put_remediation_exceptions_request) -> assoc_to_yojson(
    [(
         "ExpirationTime",
         (option_to_yojson date_to_yojson x.expiration_time));
       (
         "Message",
         (option_to_yojson string_with_char_limit1024_to_yojson x.message));
       (
         "ResourceKeys",
         (Some (remediation_exception_resource_keys_to_yojson x.resource_keys)));
       (
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       
  ])

let remediation_target_type_to_yojson = 
  fun (x: remediation_target_type) -> match x with 
  | SSM_DOCUMENT -> `String "SSM_DOCUMENT"
     

let resource_value_type_to_yojson = 
  fun (x: resource_value_type) -> match x with 
  | RESOURCE_ID -> `String "RESOURCE_ID"
     

let resource_value_to_yojson = 
  fun (x: resource_value) -> assoc_to_yojson(
    [(
         "Value",
         (Some (resource_value_type_to_yojson x.value)));
       
  ])

let remediation_parameter_value_to_yojson = 
  fun (x: remediation_parameter_value) -> assoc_to_yojson(
    [(
         "StaticValue",
         (option_to_yojson static_value_to_yojson x.static_value));
       (
         "ResourceValue",
         (option_to_yojson resource_value_to_yojson x.resource_value));
       
  ])

let remediation_parameters_to_yojson = 
  fun tree -> map_to_yojson remediation_parameter_value_to_yojson tree

let boolean__to_yojson = bool_to_yojson

let percentage_to_yojson = int_to_yojson

let ssm_controls_to_yojson = 
  fun (x: ssm_controls) -> assoc_to_yojson(
    [(
         "ErrorPercentage",
         (option_to_yojson percentage_to_yojson x.error_percentage));
       (
         "ConcurrentExecutionRatePercentage",
         (option_to_yojson percentage_to_yojson x.concurrent_execution_rate_percentage));
       
  ])

let execution_controls_to_yojson = 
  fun (x: execution_controls) -> assoc_to_yojson(
    [(
         "SsmControls",
         (option_to_yojson ssm_controls_to_yojson x.ssm_controls));
       
  ])

let auto_remediation_attempts_to_yojson = int_to_yojson

let auto_remediation_attempt_seconds_to_yojson = long_to_yojson

let remediation_configuration_to_yojson = 
  fun (x: remediation_configuration) -> assoc_to_yojson(
    [(
         "CreatedByService",
         (option_to_yojson string_with_char_limit1024_to_yojson x.created_by_service));
       (
         "Arn",
         (option_to_yojson string_with_char_limit1024_to_yojson x.arn));
       (
         "RetryAttemptSeconds",
         (option_to_yojson auto_remediation_attempt_seconds_to_yojson x.retry_attempt_seconds));
       (
         "MaximumAutomaticAttempts",
         (option_to_yojson auto_remediation_attempts_to_yojson x.maximum_automatic_attempts));
       (
         "ExecutionControls",
         (option_to_yojson execution_controls_to_yojson x.execution_controls));
       (
         "Automatic",
         (option_to_yojson boolean__to_yojson x.automatic));
       (
         "ResourceType",
         (option_to_yojson string__to_yojson x.resource_type));
       (
         "Parameters",
         (option_to_yojson remediation_parameters_to_yojson x.parameters));
       (
         "TargetVersion",
         (option_to_yojson string__to_yojson x.target_version));
       (
         "TargetId",
         (Some (string_with_char_limit256_to_yojson x.target_id)));
       (
         "TargetType",
         (Some (remediation_target_type_to_yojson x.target_type)));
       (
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       
  ])

let remediation_configurations_to_yojson = 
  fun tree -> list_to_yojson remediation_configuration_to_yojson tree

let failed_remediation_batch_to_yojson = 
  fun (x: failed_remediation_batch) -> assoc_to_yojson(
    [(
         "FailedItems",
         (option_to_yojson remediation_configurations_to_yojson x.failed_items));
       (
         "FailureMessage",
         (option_to_yojson string__to_yojson x.failure_message));
       
  ])

let failed_remediation_batches_to_yojson = 
  fun tree -> list_to_yojson failed_remediation_batch_to_yojson tree

let put_remediation_configurations_response_to_yojson = 
  fun (x: put_remediation_configurations_response) -> assoc_to_yojson(
    [(
         "FailedBatches",
         (option_to_yojson failed_remediation_batches_to_yojson x.failed_batches));
       
  ])

let put_remediation_configurations_request_to_yojson = 
  fun (x: put_remediation_configurations_request) -> assoc_to_yojson(
    [(
         "RemediationConfigurations",
         (Some (remediation_configurations_to_yojson x.remediation_configurations)));
       
  ])

let organization_conformance_pack_template_validation_exception_to_yojson = 
  fun (x: organization_conformance_pack_template_validation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let organization_all_features_not_enabled_exception_to_yojson = 
  fun (x: organization_all_features_not_enabled_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let organization_access_denied_exception_to_yojson = 
  fun (x: organization_access_denied_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let no_available_organization_exception_to_yojson = 
  fun (x: no_available_organization_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let max_number_of_organization_conformance_packs_exceeded_exception_to_yojson
= 
  fun (x: max_number_of_organization_conformance_packs_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let put_organization_conformance_pack_response_to_yojson = 
  fun (x: put_organization_conformance_pack_response) -> assoc_to_yojson(
    [(
         "OrganizationConformancePackArn",
         (option_to_yojson string_with_char_limit256_to_yojson x.organization_conformance_pack_arn));
       
  ])

let organization_conformance_pack_name_to_yojson = string_to_yojson

let delivery_s3_bucket_to_yojson = string_to_yojson

let delivery_s3_key_prefix_to_yojson = string_to_yojson

let parameter_name_to_yojson = string_to_yojson

let parameter_value_to_yojson = string_to_yojson

let conformance_pack_input_parameter_to_yojson = 
  fun (x: conformance_pack_input_parameter) -> assoc_to_yojson(
    [(
         "ParameterValue",
         (Some (parameter_value_to_yojson x.parameter_value)));
       (
         "ParameterName",
         (Some (parameter_name_to_yojson x.parameter_name)));
       
  ])

let conformance_pack_input_parameters_to_yojson = 
  fun tree -> list_to_yojson conformance_pack_input_parameter_to_yojson tree

let excluded_accounts_to_yojson = 
  fun tree -> list_to_yojson account_id_to_yojson tree

let put_organization_conformance_pack_request_to_yojson = 
  fun (x: put_organization_conformance_pack_request) -> assoc_to_yojson(
    [(
         "ExcludedAccounts",
         (option_to_yojson excluded_accounts_to_yojson x.excluded_accounts));
       (
         "ConformancePackInputParameters",
         (option_to_yojson conformance_pack_input_parameters_to_yojson x.conformance_pack_input_parameters));
       (
         "DeliveryS3KeyPrefix",
         (option_to_yojson delivery_s3_key_prefix_to_yojson x.delivery_s3_key_prefix));
       (
         "DeliveryS3Bucket",
         (option_to_yojson delivery_s3_bucket_to_yojson x.delivery_s3_bucket));
       (
         "TemplateBody",
         (option_to_yojson template_body_to_yojson x.template_body));
       (
         "TemplateS3Uri",
         (option_to_yojson template_s3_uri_to_yojson x.template_s3_uri));
       (
         "OrganizationConformancePackName",
         (Some (organization_conformance_pack_name_to_yojson x.organization_conformance_pack_name)));
       
  ])

let max_number_of_organization_config_rules_exceeded_exception_to_yojson = 
  fun (x: max_number_of_organization_config_rules_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let put_organization_config_rule_response_to_yojson = 
  fun (x: put_organization_config_rule_response) -> assoc_to_yojson(
    [(
         "OrganizationConfigRuleArn",
         (option_to_yojson string_with_char_limit256_to_yojson x.organization_config_rule_arn));
       
  ])

let organization_config_rule_name_to_yojson = string_to_yojson

let maximum_execution_frequency_to_yojson = 
  fun (x: maximum_execution_frequency) -> match x with 
 
| TwentyFour_Hours -> `String "TwentyFour_Hours"
  | Twelve_Hours -> `String "Twelve_Hours"
  | Six_Hours -> `String "Six_Hours"
  | Three_Hours -> `String "Three_Hours"
  | One_Hour -> `String "One_Hour"
   

let resource_types_scope_to_yojson = 
  fun tree -> list_to_yojson string_with_char_limit256_to_yojson tree

let organization_managed_rule_metadata_to_yojson = 
  fun (x: organization_managed_rule_metadata) -> assoc_to_yojson(
    [(
         "TagValueScope",
         (option_to_yojson string_with_char_limit256_to_yojson x.tag_value_scope));
       (
         "TagKeyScope",
         (option_to_yojson string_with_char_limit128_to_yojson x.tag_key_scope));
       (
         "ResourceIdScope",
         (option_to_yojson string_with_char_limit768_to_yojson x.resource_id_scope));
       (
         "ResourceTypesScope",
         (option_to_yojson resource_types_scope_to_yojson x.resource_types_scope));
       (
         "MaximumExecutionFrequency",
         (option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency));
       (
         "InputParameters",
         (option_to_yojson string_with_char_limit2048_to_yojson x.input_parameters));
       (
         "RuleIdentifier",
         (Some (string_with_char_limit256_to_yojson x.rule_identifier)));
       (
         "Description",
         (option_to_yojson string_with_char_limit256_min0_to_yojson x.description));
       
  ])

let organization_config_rule_trigger_type_to_yojson = 
  fun (x: organization_config_rule_trigger_type) -> match x with 
 
| SCHEDULED_NOTIFICATION -> `String "ScheduledNotification"
  | OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION -> `String "OversizedConfigurationItemChangeNotification"
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION -> `String "ConfigurationItemChangeNotification"
   

let organization_config_rule_trigger_types_to_yojson = 
  fun tree -> list_to_yojson organization_config_rule_trigger_type_to_yojson tree

let organization_custom_rule_metadata_to_yojson = 
  fun (x: organization_custom_rule_metadata) -> assoc_to_yojson(
    [(
         "TagValueScope",
         (option_to_yojson string_with_char_limit256_to_yojson x.tag_value_scope));
       (
         "TagKeyScope",
         (option_to_yojson string_with_char_limit128_to_yojson x.tag_key_scope));
       (
         "ResourceIdScope",
         (option_to_yojson string_with_char_limit768_to_yojson x.resource_id_scope));
       (
         "ResourceTypesScope",
         (option_to_yojson resource_types_scope_to_yojson x.resource_types_scope));
       (
         "MaximumExecutionFrequency",
         (option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency));
       (
         "InputParameters",
         (option_to_yojson string_with_char_limit2048_to_yojson x.input_parameters));
       (
         "OrganizationConfigRuleTriggerTypes",
         (Some (organization_config_rule_trigger_types_to_yojson x.organization_config_rule_trigger_types)));
       (
         "LambdaFunctionArn",
         (Some (string_with_char_limit256_to_yojson x.lambda_function_arn)));
       (
         "Description",
         (option_to_yojson string_with_char_limit256_min0_to_yojson x.description));
       
  ])

let organization_config_rule_trigger_type_no_s_n_to_yojson = 
  fun (x: organization_config_rule_trigger_type_no_s_n) -> match x with 
 
| OVERSIZED_CONFIGURATION_ITEM_CHANGE_NOTIFCATION -> `String "OversizedConfigurationItemChangeNotification"
  | CONFIGURATION_ITEM_CHANGE_NOTIFICATION -> `String "ConfigurationItemChangeNotification"
   

let organization_config_rule_trigger_type_no_s_ns_to_yojson = 
  fun tree -> list_to_yojson organization_config_rule_trigger_type_no_s_n_to_yojson tree

let policy_runtime_to_yojson = string_to_yojson

let policy_text_to_yojson = string_to_yojson

let debug_log_delivery_accounts_to_yojson = 
  fun tree -> list_to_yojson account_id_to_yojson tree

let organization_custom_policy_rule_metadata_to_yojson = 
  fun (x: organization_custom_policy_rule_metadata) -> assoc_to_yojson(
    [(
         "DebugLogDeliveryAccounts",
         (option_to_yojson debug_log_delivery_accounts_to_yojson x.debug_log_delivery_accounts));
       (
         "PolicyText",
         (Some (policy_text_to_yojson x.policy_text)));
       (
         "PolicyRuntime",
         (Some (policy_runtime_to_yojson x.policy_runtime)));
       (
         "TagValueScope",
         (option_to_yojson string_with_char_limit256_to_yojson x.tag_value_scope));
       (
         "TagKeyScope",
         (option_to_yojson string_with_char_limit128_to_yojson x.tag_key_scope));
       (
         "ResourceIdScope",
         (option_to_yojson string_with_char_limit768_to_yojson x.resource_id_scope));
       (
         "ResourceTypesScope",
         (option_to_yojson resource_types_scope_to_yojson x.resource_types_scope));
       (
         "MaximumExecutionFrequency",
         (option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency));
       (
         "InputParameters",
         (option_to_yojson string_with_char_limit2048_to_yojson x.input_parameters));
       (
         "OrganizationConfigRuleTriggerTypes",
         (option_to_yojson organization_config_rule_trigger_type_no_s_ns_to_yojson x.organization_config_rule_trigger_types));
       (
         "Description",
         (option_to_yojson string_with_char_limit256_min0_to_yojson x.description));
       
  ])

let put_organization_config_rule_request_to_yojson = 
  fun (x: put_organization_config_rule_request) -> assoc_to_yojson(
    [(
         "OrganizationCustomPolicyRuleMetadata",
         (option_to_yojson organization_custom_policy_rule_metadata_to_yojson x.organization_custom_policy_rule_metadata));
       (
         "ExcludedAccounts",
         (option_to_yojson excluded_accounts_to_yojson x.excluded_accounts));
       (
         "OrganizationCustomRuleMetadata",
         (option_to_yojson organization_custom_rule_metadata_to_yojson x.organization_custom_rule_metadata));
       (
         "OrganizationManagedRuleMetadata",
         (option_to_yojson organization_managed_rule_metadata_to_yojson x.organization_managed_rule_metadata));
       (
         "OrganizationConfigRuleName",
         (Some (organization_config_rule_name_to_yojson x.organization_config_rule_name)));
       
  ])

let put_external_evaluation_response_to_yojson = 
  fun (x: put_external_evaluation_response) -> assoc_to_yojson(
    [
  ])

let compliance_type_to_yojson = 
  fun (x: compliance_type) -> match x with 
 
| Insufficient_Data -> `String "INSUFFICIENT_DATA"
  | Not_Applicable -> `String "NOT_APPLICABLE"
  | Non_Compliant -> `String "NON_COMPLIANT"
  | Compliant -> `String "COMPLIANT"
   

let ordering_timestamp_to_yojson = timestamp_to_yojson

let external_evaluation_to_yojson = 
  fun (x: external_evaluation) -> assoc_to_yojson(
    [(
         "OrderingTimestamp",
         (Some (ordering_timestamp_to_yojson x.ordering_timestamp)));
       (
         "Annotation",
         (option_to_yojson string_with_char_limit256_to_yojson x.annotation));
       (
         "ComplianceType",
         (Some (compliance_type_to_yojson x.compliance_type)));
       (
         "ComplianceResourceId",
         (Some (base_resource_id_to_yojson x.compliance_resource_id)));
       (
         "ComplianceResourceType",
         (Some (string_with_char_limit256_to_yojson x.compliance_resource_type)));
       
  ])

let put_external_evaluation_request_to_yojson = 
  fun (x: put_external_evaluation_request) -> assoc_to_yojson(
    [(
         "ExternalEvaluation",
         (Some (external_evaluation_to_yojson x.external_evaluation)));
       (
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       
  ])

let invalid_result_token_exception_to_yojson = 
  fun (x: invalid_result_token_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let evaluation_to_yojson = 
  fun (x: evaluation) -> assoc_to_yojson(
    [(
         "OrderingTimestamp",
         (Some (ordering_timestamp_to_yojson x.ordering_timestamp)));
       (
         "Annotation",
         (option_to_yojson string_with_char_limit256_to_yojson x.annotation));
       (
         "ComplianceType",
         (Some (compliance_type_to_yojson x.compliance_type)));
       (
         "ComplianceResourceId",
         (Some (base_resource_id_to_yojson x.compliance_resource_id)));
       (
         "ComplianceResourceType",
         (Some (string_with_char_limit256_to_yojson x.compliance_resource_type)));
       
  ])

let evaluations_to_yojson = 
  fun tree -> list_to_yojson evaluation_to_yojson tree

let put_evaluations_response_to_yojson = 
  fun (x: put_evaluations_response) -> assoc_to_yojson(
    [(
         "FailedEvaluations",
         (option_to_yojson evaluations_to_yojson x.failed_evaluations));
       
  ])

let put_evaluations_request_to_yojson = 
  fun (x: put_evaluations_request) -> assoc_to_yojson(
    [(
         "TestMode",
         (option_to_yojson boolean__to_yojson x.test_mode));
       (
         "ResultToken",
         (Some (string__to_yojson x.result_token)));
       (
         "Evaluations",
         (option_to_yojson evaluations_to_yojson x.evaluations));
       
  ])

let no_such_bucket_exception_to_yojson = 
  fun (x: no_such_bucket_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let no_available_configuration_recorder_exception_to_yojson = 
  fun (x: no_available_configuration_recorder_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let max_number_of_delivery_channels_exceeded_exception_to_yojson = 
  fun (x: max_number_of_delivery_channels_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_sns_topic_arn_exception_to_yojson = 
  fun (x: invalid_sns_topic_arn_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_s3_kms_key_arn_exception_to_yojson = 
  fun (x: invalid_s3_kms_key_arn_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_s3_key_prefix_exception_to_yojson = 
  fun (x: invalid_s3_key_prefix_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_delivery_channel_name_exception_to_yojson = 
  fun (x: invalid_delivery_channel_name_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let insufficient_delivery_policy_exception_to_yojson = 
  fun (x: insufficient_delivery_policy_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let channel_name_to_yojson = string_to_yojson

let config_snapshot_delivery_properties_to_yojson = 
  fun (x: config_snapshot_delivery_properties) -> assoc_to_yojson(
    [(
         "deliveryFrequency",
         (option_to_yojson maximum_execution_frequency_to_yojson x.delivery_frequency));
       
  ])

let delivery_channel_to_yojson = 
  fun (x: delivery_channel) -> assoc_to_yojson(
    [(
         "configSnapshotDeliveryProperties",
         (option_to_yojson config_snapshot_delivery_properties_to_yojson x.config_snapshot_delivery_properties));
       (
         "snsTopicARN",
         (option_to_yojson string__to_yojson x.sns_topic_ar_n));
       (
         "s3KmsKeyArn",
         (option_to_yojson string__to_yojson x.s3_kms_key_arn));
       (
         "s3KeyPrefix",
         (option_to_yojson string__to_yojson x.s3_key_prefix));
       (
         "s3BucketName",
         (option_to_yojson string__to_yojson x.s3_bucket_name));
       (
         "name",
         (option_to_yojson channel_name_to_yojson x.name));
       
  ])

let put_delivery_channel_request_to_yojson = 
  fun (x: put_delivery_channel_request) -> assoc_to_yojson(
    [(
         "DeliveryChannel",
         (Some (delivery_channel_to_yojson x.delivery_channel)));
       
  ])

let max_number_of_conformance_packs_exceeded_exception_to_yojson = 
  fun (x: max_number_of_conformance_packs_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let conformance_pack_template_validation_exception_to_yojson = 
  fun (x: conformance_pack_template_validation_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let conformance_pack_arn_to_yojson = string_to_yojson

let put_conformance_pack_response_to_yojson = 
  fun (x: put_conformance_pack_response) -> assoc_to_yojson(
    [(
         "ConformancePackArn",
         (option_to_yojson conformance_pack_arn_to_yojson x.conformance_pack_arn));
       
  ])

let conformance_pack_name_to_yojson = string_to_yojson

let put_conformance_pack_request_to_yojson = 
  fun (x: put_conformance_pack_request) -> assoc_to_yojson(
    [(
         "TemplateSSMDocumentDetails",
         (option_to_yojson template_ssm_document_details_to_yojson x.template_ssm_document_details));
       (
         "ConformancePackInputParameters",
         (option_to_yojson conformance_pack_input_parameters_to_yojson x.conformance_pack_input_parameters));
       (
         "DeliveryS3KeyPrefix",
         (option_to_yojson delivery_s3_key_prefix_to_yojson x.delivery_s3_key_prefix));
       (
         "DeliveryS3Bucket",
         (option_to_yojson delivery_s3_bucket_to_yojson x.delivery_s3_bucket));
       (
         "TemplateBody",
         (option_to_yojson template_body_to_yojson x.template_body));
       (
         "TemplateS3Uri",
         (option_to_yojson template_s3_uri_to_yojson x.template_s3_uri));
       (
         "ConformancePackName",
         (Some (conformance_pack_name_to_yojson x.conformance_pack_name)));
       
  ])

let max_number_of_configuration_recorders_exceeded_exception_to_yojson = 
  fun (x: max_number_of_configuration_recorders_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_role_exception_to_yojson = 
  fun (x: invalid_role_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_recording_group_exception_to_yojson = 
  fun (x: invalid_recording_group_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let invalid_configuration_recorder_name_exception_to_yojson = 
  fun (x: invalid_configuration_recorder_name_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let all_supported_to_yojson = bool_to_yojson

let include_global_resource_types_to_yojson = bool_to_yojson

let resource_type_list_to_yojson = 
  fun tree -> list_to_yojson resource_type_to_yojson tree

let exclusion_by_resource_types_to_yojson = 
  fun (x: exclusion_by_resource_types) -> assoc_to_yojson(
    [(
         "resourceTypes",
         (option_to_yojson resource_type_list_to_yojson x.resource_types));
       
  ])

let recording_strategy_type_to_yojson = 
  fun (x: recording_strategy_type) -> match x with 
 
| EXCLUSION_BY_RESOURCE_TYPES -> `String "EXCLUSION_BY_RESOURCE_TYPES"
  | INCLUSION_BY_RESOURCE_TYPES -> `String "INCLUSION_BY_RESOURCE_TYPES"
  | ALL_SUPPORTED_RESOURCE_TYPES -> `String "ALL_SUPPORTED_RESOURCE_TYPES"
   

let recording_strategy_to_yojson = 
  fun (x: recording_strategy) -> assoc_to_yojson(
    [(
         "useOnly",
         (option_to_yojson recording_strategy_type_to_yojson x.use_only));
       
  ])

let recording_group_to_yojson = 
  fun (x: recording_group) -> assoc_to_yojson(
    [(
         "recordingStrategy",
         (option_to_yojson recording_strategy_to_yojson x.recording_strategy));
       (
         "exclusionByResourceTypes",
         (option_to_yojson exclusion_by_resource_types_to_yojson x.exclusion_by_resource_types));
       (
         "resourceTypes",
         (option_to_yojson resource_type_list_to_yojson x.resource_types));
       (
         "includeGlobalResourceTypes",
         (option_to_yojson include_global_resource_types_to_yojson x.include_global_resource_types));
       (
         "allSupported",
         (option_to_yojson all_supported_to_yojson x.all_supported));
       
  ])

let recording_frequency_to_yojson = 
  fun (x: recording_frequency) -> match x with 
  | DAILY -> `String "DAILY"
    | CONTINUOUS -> `String "CONTINUOUS"
     

let description_to_yojson = string_to_yojson

let recording_mode_resource_types_list_to_yojson = 
  fun tree -> list_to_yojson resource_type_to_yojson tree

let recording_mode_override_to_yojson = 
  fun (x: recording_mode_override) -> assoc_to_yojson(
    [(
         "recordingFrequency",
         (Some (recording_frequency_to_yojson x.recording_frequency)));
       (
         "resourceTypes",
         (Some (recording_mode_resource_types_list_to_yojson x.resource_types)));
       (
         "description",
         (option_to_yojson description_to_yojson x.description));
       
  ])

let recording_mode_overrides_to_yojson = 
  fun tree -> list_to_yojson recording_mode_override_to_yojson tree

let recording_mode_to_yojson = 
  fun (x: recording_mode) -> assoc_to_yojson(
    [(
         "recordingModeOverrides",
         (option_to_yojson recording_mode_overrides_to_yojson x.recording_mode_overrides));
       (
         "recordingFrequency",
         (Some (recording_frequency_to_yojson x.recording_frequency)));
       
  ])

let configuration_recorder_to_yojson = 
  fun (x: configuration_recorder) -> assoc_to_yojson(
    [(
         "recordingMode",
         (option_to_yojson recording_mode_to_yojson x.recording_mode));
       (
         "recordingGroup",
         (option_to_yojson recording_group_to_yojson x.recording_group));
       (
         "roleARN",
         (option_to_yojson string__to_yojson x.role_ar_n));
       (
         "name",
         (option_to_yojson recorder_name_to_yojson x.name));
       
  ])

let put_configuration_recorder_request_to_yojson = 
  fun (x: put_configuration_recorder_request) -> assoc_to_yojson(
    [(
         "ConfigurationRecorder",
         (Some (configuration_recorder_to_yojson x.configuration_recorder)));
       
  ])

let configuration_aggregator_arn_to_yojson = string_to_yojson

let account_aggregation_source_account_list_to_yojson = 
  fun tree -> list_to_yojson account_id_to_yojson tree

let aggregator_region_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let account_aggregation_source_to_yojson = 
  fun (x: account_aggregation_source) -> assoc_to_yojson(
    [(
         "AwsRegions",
         (option_to_yojson aggregator_region_list_to_yojson x.aws_regions));
       (
         "AllAwsRegions",
         (option_to_yojson boolean__to_yojson x.all_aws_regions));
       (
         "AccountIds",
         (Some (account_aggregation_source_account_list_to_yojson x.account_ids)));
       
  ])

let account_aggregation_source_list_to_yojson = 
  fun tree -> list_to_yojson account_aggregation_source_to_yojson tree

let organization_aggregation_source_to_yojson = 
  fun (x: organization_aggregation_source) -> assoc_to_yojson(
    [(
         "AllAwsRegions",
         (option_to_yojson boolean__to_yojson x.all_aws_regions));
       (
         "AwsRegions",
         (option_to_yojson aggregator_region_list_to_yojson x.aws_regions));
       (
         "RoleArn",
         (Some (string__to_yojson x.role_arn)));
       
  ])

let configuration_aggregator_to_yojson = 
  fun (x: configuration_aggregator) -> assoc_to_yojson(
    [(
         "CreatedBy",
         (option_to_yojson string_with_char_limit256_to_yojson x.created_by));
       (
         "LastUpdatedTime",
         (option_to_yojson date_to_yojson x.last_updated_time));
       (
         "CreationTime",
         (option_to_yojson date_to_yojson x.creation_time));
       (
         "OrganizationAggregationSource",
         (option_to_yojson organization_aggregation_source_to_yojson x.organization_aggregation_source));
       (
         "AccountAggregationSources",
         (option_to_yojson account_aggregation_source_list_to_yojson x.account_aggregation_sources));
       (
         "ConfigurationAggregatorArn",
         (option_to_yojson configuration_aggregator_arn_to_yojson x.configuration_aggregator_arn));
       (
         "ConfigurationAggregatorName",
         (option_to_yojson configuration_aggregator_name_to_yojson x.configuration_aggregator_name));
       
  ])

let put_configuration_aggregator_response_to_yojson = 
  fun (x: put_configuration_aggregator_response) -> assoc_to_yojson(
    [(
         "ConfigurationAggregator",
         (option_to_yojson configuration_aggregator_to_yojson x.configuration_aggregator));
       
  ])

let put_configuration_aggregator_request_to_yojson = 
  fun (x: put_configuration_aggregator_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_list_to_yojson x.tags));
       (
         "OrganizationAggregationSource",
         (option_to_yojson organization_aggregation_source_to_yojson x.organization_aggregation_source));
       (
         "AccountAggregationSources",
         (option_to_yojson account_aggregation_source_list_to_yojson x.account_aggregation_sources));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let max_number_of_config_rules_exceeded_exception_to_yojson = 
  fun (x: max_number_of_config_rules_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let emptiable_string_with_char_limit256_to_yojson = string_to_yojson

let compliance_resource_types_to_yojson = 
  fun tree -> list_to_yojson string_with_char_limit256_to_yojson tree

let scope_to_yojson = 
  fun (x: scope) -> assoc_to_yojson(
    [(
         "ComplianceResourceId",
         (option_to_yojson base_resource_id_to_yojson x.compliance_resource_id));
       (
         "TagValue",
         (option_to_yojson string_with_char_limit256_to_yojson x.tag_value));
       (
         "TagKey",
         (option_to_yojson string_with_char_limit128_to_yojson x.tag_key));
       (
         "ComplianceResourceTypes",
         (option_to_yojson compliance_resource_types_to_yojson x.compliance_resource_types));
       
  ])

let owner_to_yojson = 
  fun (x: owner) -> match x with 
 
| Custom_Policy -> `String "CUSTOM_POLICY"
  | Aws -> `String "AWS"
  | Custom_Lambda -> `String "CUSTOM_LAMBDA"
   

let event_source_to_yojson = 
  fun (x: event_source) -> match x with 
  | Aws_Config -> `String "aws.config"
     

let message_type_to_yojson = 
  fun (x: message_type) -> match x with 
 
| OversizedConfigurationItemChangeNotification -> `String "OversizedConfigurationItemChangeNotification"
  | ScheduledNotification -> `String "ScheduledNotification"
  | ConfigurationSnapshotDeliveryCompleted -> `String "ConfigurationSnapshotDeliveryCompleted"
  | ConfigurationItemChangeNotification -> `String "ConfigurationItemChangeNotification"
   

let source_detail_to_yojson = 
  fun (x: source_detail) -> assoc_to_yojson(
    [(
         "MaximumExecutionFrequency",
         (option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency));
       (
         "MessageType",
         (option_to_yojson message_type_to_yojson x.message_type));
       (
         "EventSource",
         (option_to_yojson event_source_to_yojson x.event_source));
       
  ])

let source_details_to_yojson = 
  fun tree -> list_to_yojson source_detail_to_yojson tree

let custom_policy_details_to_yojson = 
  fun (x: custom_policy_details) -> assoc_to_yojson(
    [(
         "EnableDebugLogDelivery",
         (option_to_yojson boolean__to_yojson x.enable_debug_log_delivery));
       (
         "PolicyText",
         (Some (policy_text_to_yojson x.policy_text)));
       (
         "PolicyRuntime",
         (Some (policy_runtime_to_yojson x.policy_runtime)));
       
  ])

let source_to_yojson = 
  fun (x: source) -> assoc_to_yojson(
    [(
         "CustomPolicyDetails",
         (option_to_yojson custom_policy_details_to_yojson x.custom_policy_details));
       (
         "SourceDetails",
         (option_to_yojson source_details_to_yojson x.source_details));
       (
         "SourceIdentifier",
         (option_to_yojson string_with_char_limit256_to_yojson x.source_identifier));
       (
         "Owner",
         (Some (owner_to_yojson x.owner)));
       
  ])

let config_rule_state_to_yojson = 
  fun (x: config_rule_state) -> match x with 
 
| EVALUATING -> `String "EVALUATING"
  | DELETING_RESULTS -> `String "DELETING_RESULTS"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
   

let evaluation_mode_configuration_to_yojson = 
  fun (x: evaluation_mode_configuration) -> assoc_to_yojson(
    [(
         "Mode",
         (option_to_yojson evaluation_mode_to_yojson x.mode));
       
  ])

let evaluation_modes_to_yojson = 
  fun tree -> list_to_yojson evaluation_mode_configuration_to_yojson tree

let config_rule_to_yojson = 
  fun (x: config_rule) -> assoc_to_yojson(
    [(
         "EvaluationModes",
         (option_to_yojson evaluation_modes_to_yojson x.evaluation_modes));
       (
         "CreatedBy",
         (option_to_yojson string_with_char_limit256_to_yojson x.created_by));
       (
         "ConfigRuleState",
         (option_to_yojson config_rule_state_to_yojson x.config_rule_state));
       (
         "MaximumExecutionFrequency",
         (option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency));
       (
         "InputParameters",
         (option_to_yojson string_with_char_limit1024_to_yojson x.input_parameters));
       (
         "Source",
         (Some (source_to_yojson x.source)));
       (
         "Scope",
         (option_to_yojson scope_to_yojson x.scope));
       (
         "Description",
         (option_to_yojson emptiable_string_with_char_limit256_to_yojson x.description));
       (
         "ConfigRuleId",
         (option_to_yojson string_with_char_limit64_to_yojson x.config_rule_id));
       (
         "ConfigRuleArn",
         (option_to_yojson string_with_char_limit256_to_yojson x.config_rule_arn));
       (
         "ConfigRuleName",
         (option_to_yojson config_rule_name_to_yojson x.config_rule_name));
       
  ])

let put_config_rule_request_to_yojson = 
  fun (x: put_config_rule_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_list_to_yojson x.tags));
       (
         "ConfigRule",
         (Some (config_rule_to_yojson x.config_rule)));
       
  ])

let aggregation_authorization_to_yojson = 
  fun (x: aggregation_authorization) -> assoc_to_yojson(
    [(
         "CreationTime",
         (option_to_yojson date_to_yojson x.creation_time));
       (
         "AuthorizedAwsRegion",
         (option_to_yojson aws_region_to_yojson x.authorized_aws_region));
       (
         "AuthorizedAccountId",
         (option_to_yojson account_id_to_yojson x.authorized_account_id));
       (
         "AggregationAuthorizationArn",
         (option_to_yojson string__to_yojson x.aggregation_authorization_arn));
       
  ])

let put_aggregation_authorization_response_to_yojson = 
  fun (x: put_aggregation_authorization_response) -> assoc_to_yojson(
    [(
         "AggregationAuthorization",
         (option_to_yojson aggregation_authorization_to_yojson x.aggregation_authorization));
       
  ])

let put_aggregation_authorization_request_to_yojson = 
  fun (x: put_aggregation_authorization_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tags_list_to_yojson x.tags));
       (
         "AuthorizedAwsRegion",
         (Some (aws_region_to_yojson x.authorized_aws_region)));
       (
         "AuthorizedAccountId",
         (Some (account_id_to_yojson x.authorized_account_id)));
       
  ])

let list_tags_for_resource_response_to_yojson = 
  fun (x: list_tags_for_resource_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "ResourceArn",
         (Some (amazon_resource_name_to_yojson x.resource_arn)));
       
  ])

let list_stored_queries_response_to_yojson = 
  fun (x: list_stored_queries_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "StoredQueryMetadata",
         (option_to_yojson stored_query_metadata_list_to_yojson x.stored_query_metadata));
       
  ])

let list_stored_queries_request_to_yojson = 
  fun (x: list_stored_queries_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson limit_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let invalid_time_range_exception_to_yojson = 
  fun (x: invalid_time_range_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let resource_evaluation_to_yojson = 
  fun (x: resource_evaluation) -> assoc_to_yojson(
    [(
         "EvaluationStartTimestamp",
         (option_to_yojson date_to_yojson x.evaluation_start_timestamp));
       (
         "EvaluationMode",
         (option_to_yojson evaluation_mode_to_yojson x.evaluation_mode));
       (
         "ResourceEvaluationId",
         (option_to_yojson resource_evaluation_id_to_yojson x.resource_evaluation_id));
       
  ])

let resource_evaluations_to_yojson = 
  fun tree -> list_to_yojson resource_evaluation_to_yojson tree

let list_resource_evaluations_response_to_yojson = 
  fun (x: list_resource_evaluations_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ResourceEvaluations",
         (option_to_yojson resource_evaluations_to_yojson x.resource_evaluations));
       
  ])

let resource_evaluation_filters_to_yojson = 
  fun (x: resource_evaluation_filters) -> assoc_to_yojson(
    [(
         "EvaluationContextIdentifier",
         (option_to_yojson evaluation_context_identifier_to_yojson x.evaluation_context_identifier));
       (
         "TimeWindow",
         (option_to_yojson time_window_to_yojson x.time_window));
       (
         "EvaluationMode",
         (option_to_yojson evaluation_mode_to_yojson x.evaluation_mode));
       
  ])

let list_resource_evaluations_page_item_limit_to_yojson = int_to_yojson

let list_resource_evaluations_request_to_yojson = 
  fun (x: list_resource_evaluations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson list_resource_evaluations_page_item_limit_to_yojson x.limit));
       (
         "Filters",
         (option_to_yojson resource_evaluation_filters_to_yojson x.filters));
       
  ])

let resource_deletion_time_to_yojson = timestamp_to_yojson

let resource_identifier_to_yojson = 
  fun (x: resource_identifier) -> assoc_to_yojson(
    [(
         "resourceDeletionTime",
         (option_to_yojson resource_deletion_time_to_yojson x.resource_deletion_time));
       (
         "resourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       (
         "resourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       
  ])

let resource_identifier_list_to_yojson = 
  fun tree -> list_to_yojson resource_identifier_to_yojson tree

let list_discovered_resources_response_to_yojson = 
  fun (x: list_discovered_resources_response) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "resourceIdentifiers",
         (option_to_yojson resource_identifier_list_to_yojson x.resource_identifiers));
       
  ])

let resource_id_list_to_yojson = 
  fun tree -> list_to_yojson resource_id_to_yojson tree

let list_discovered_resources_request_to_yojson = 
  fun (x: list_discovered_resources_request) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "includeDeletedResources",
         (option_to_yojson boolean__to_yojson x.include_deleted_resources));
       (
         "limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "resourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       (
         "resourceIds",
         (option_to_yojson resource_id_list_to_yojson x.resource_ids));
       (
         "resourceType",
         (Some (resource_type_to_yojson x.resource_type)));
       
  ])

let compliance_score_to_yojson = string_to_yojson

let last_updated_time_to_yojson = timestamp_to_yojson

let conformance_pack_compliance_score_to_yojson = 
  fun (x: conformance_pack_compliance_score) -> assoc_to_yojson(
    [(
         "LastUpdatedTime",
         (option_to_yojson last_updated_time_to_yojson x.last_updated_time));
       (
         "ConformancePackName",
         (option_to_yojson conformance_pack_name_to_yojson x.conformance_pack_name));
       (
         "Score",
         (option_to_yojson compliance_score_to_yojson x.score));
       
  ])

let conformance_pack_compliance_scores_to_yojson = 
  fun tree -> list_to_yojson conformance_pack_compliance_score_to_yojson tree

let list_conformance_pack_compliance_scores_response_to_yojson = 
  fun (x: list_conformance_pack_compliance_scores_response) -> assoc_to_yojson(
    [(
         "ConformancePackComplianceScores",
         (Some (conformance_pack_compliance_scores_to_yojson x.conformance_pack_compliance_scores)));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       
  ])

let conformance_pack_name_filter_to_yojson = 
  fun tree -> list_to_yojson conformance_pack_name_to_yojson tree

let conformance_pack_compliance_scores_filters_to_yojson = 
  fun (x: conformance_pack_compliance_scores_filters) -> assoc_to_yojson(
    [(
         "ConformancePackNames",
         (Some (conformance_pack_name_filter_to_yojson x.conformance_pack_names)));
       
  ])

let sort_order_to_yojson = 
  fun (x: sort_order) -> match x with 
  | DESCENDING -> `String "DESCENDING"
    | ASCENDING -> `String "ASCENDING"
     

let sort_by_to_yojson = 
  fun (x: sort_by) -> match x with 
  | SCORE -> `String "SCORE"
     

let page_size_limit_to_yojson = int_to_yojson

let list_conformance_pack_compliance_scores_request_to_yojson = 
  fun (x: list_conformance_pack_compliance_scores_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson page_size_limit_to_yojson x.limit));
       (
         "SortBy",
         (option_to_yojson sort_by_to_yojson x.sort_by));
       (
         "SortOrder",
         (option_to_yojson sort_order_to_yojson x.sort_order));
       (
         "Filters",
         (option_to_yojson conformance_pack_compliance_scores_filters_to_yojson x.filters));
       
  ])

let discovered_resource_identifier_list_to_yojson = 
  fun tree -> list_to_yojson aggregate_resource_identifier_to_yojson tree

let list_aggregate_discovered_resources_response_to_yojson = 
  fun (x: list_aggregate_discovered_resources_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ResourceIdentifiers",
         (option_to_yojson discovered_resource_identifier_list_to_yojson x.resource_identifiers));
       
  ])

let resource_filters_to_yojson = 
  fun (x: resource_filters) -> assoc_to_yojson(
    [(
         "Region",
         (option_to_yojson aws_region_to_yojson x.region));
       (
         "ResourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       (
         "ResourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       
  ])

let list_aggregate_discovered_resources_request_to_yojson = 
  fun (x: list_aggregate_discovered_resources_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "Filters",
         (option_to_yojson resource_filters_to_yojson x.filters));
       (
         "ResourceType",
         (Some (resource_type_to_yojson x.resource_type)));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let get_stored_query_response_to_yojson = 
  fun (x: get_stored_query_response) -> assoc_to_yojson(
    [(
         "StoredQuery",
         (option_to_yojson stored_query_to_yojson x.stored_query));
       
  ])

let get_stored_query_request_to_yojson = 
  fun (x: get_stored_query_request) -> assoc_to_yojson(
    [(
         "QueryName",
         (Some (query_name_to_yojson x.query_name)));
       
  ])

let resource_evaluation_status_to_yojson = 
  fun (x: resource_evaluation_status) -> match x with 
 
| SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
   

let evaluation_status_to_yojson = 
  fun (x: evaluation_status) -> assoc_to_yojson(
    [(
         "FailureReason",
         (option_to_yojson string_with_char_limit1024_to_yojson x.failure_reason));
       (
         "Status",
         (Some (resource_evaluation_status_to_yojson x.status)));
       
  ])

let get_resource_evaluation_summary_response_to_yojson = 
  fun (x: get_resource_evaluation_summary_response) -> assoc_to_yojson(
    [(
         "ResourceDetails",
         (option_to_yojson resource_details_to_yojson x.resource_details));
       (
         "EvaluationContext",
         (option_to_yojson evaluation_context_to_yojson x.evaluation_context));
       (
         "Compliance",
         (option_to_yojson compliance_type_to_yojson x.compliance));
       (
         "EvaluationStartTimestamp",
         (option_to_yojson date_to_yojson x.evaluation_start_timestamp));
       (
         "EvaluationStatus",
         (option_to_yojson evaluation_status_to_yojson x.evaluation_status));
       (
         "EvaluationMode",
         (option_to_yojson evaluation_mode_to_yojson x.evaluation_mode));
       (
         "ResourceEvaluationId",
         (option_to_yojson resource_evaluation_id_to_yojson x.resource_evaluation_id));
       
  ])

let get_resource_evaluation_summary_request_to_yojson = 
  fun (x: get_resource_evaluation_summary_request) -> assoc_to_yojson(
    [(
         "ResourceEvaluationId",
         (Some (resource_evaluation_id_to_yojson x.resource_evaluation_id)));
       
  ])

let resource_not_discovered_exception_to_yojson = 
  fun (x: resource_not_discovered_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let configuration_item_capture_time_to_yojson = timestamp_to_yojson

let configuration_item_status_to_yojson = 
  fun (x: configuration_item_status) -> match x with 
 
| ResourceDeletedNotRecorded -> `String "ResourceDeletedNotRecorded"
  | ResourceDeleted -> `String "ResourceDeleted"
  | ResourceNotRecorded -> `String "ResourceNotRecorded"
  | ResourceDiscovered -> `String "ResourceDiscovered"
  | OK -> `String "OK"
   

let configuration_state_id_to_yojson = string_to_yojson

let configuration_item_md5_hash_to_yojson = string_to_yojson

let ar_n_to_yojson = string_to_yojson

let availability_zone_to_yojson = string_to_yojson

let resource_creation_time_to_yojson = timestamp_to_yojson

let related_event_to_yojson = string_to_yojson

let related_event_list_to_yojson = 
  fun tree -> list_to_yojson related_event_to_yojson tree

let relationship_name_to_yojson = string_to_yojson

let relationship_to_yojson = 
  fun (x: relationship) -> assoc_to_yojson(
    [(
         "relationshipName",
         (option_to_yojson relationship_name_to_yojson x.relationship_name));
       (
         "resourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       (
         "resourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       
  ])

let relationship_list_to_yojson = 
  fun tree -> list_to_yojson relationship_to_yojson tree

let configuration_item_delivery_time_to_yojson = timestamp_to_yojson

let configuration_item_to_yojson = 
  fun (x: configuration_item) -> assoc_to_yojson(
    [(
         "configurationItemDeliveryTime",
         (option_to_yojson configuration_item_delivery_time_to_yojson x.configuration_item_delivery_time));
       (
         "recordingFrequency",
         (option_to_yojson recording_frequency_to_yojson x.recording_frequency));
       (
         "supplementaryConfiguration",
         (option_to_yojson supplementary_configuration_to_yojson x.supplementary_configuration));
       (
         "configuration",
         (option_to_yojson configuration_to_yojson x.configuration));
       (
         "relationships",
         (option_to_yojson relationship_list_to_yojson x.relationships));
       (
         "relatedEvents",
         (option_to_yojson related_event_list_to_yojson x.related_events));
       (
         "tags",
         (option_to_yojson tags_to_yojson x.tags));
       (
         "resourceCreationTime",
         (option_to_yojson resource_creation_time_to_yojson x.resource_creation_time));
       (
         "availabilityZone",
         (option_to_yojson availability_zone_to_yojson x.availability_zone));
       (
         "awsRegion",
         (option_to_yojson aws_region_to_yojson x.aws_region));
       (
         "resourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       (
         "resourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "arn",
         (option_to_yojson ar_n_to_yojson x.arn));
       (
         "configurationItemMD5Hash",
         (option_to_yojson configuration_item_md5_hash_to_yojson x.configuration_item_md5_hash));
       (
         "configurationStateId",
         (option_to_yojson configuration_state_id_to_yojson x.configuration_state_id));
       (
         "configurationItemStatus",
         (option_to_yojson configuration_item_status_to_yojson x.configuration_item_status));
       (
         "configurationItemCaptureTime",
         (option_to_yojson configuration_item_capture_time_to_yojson x.configuration_item_capture_time));
       (
         "accountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       (
         "version",
         (option_to_yojson version_to_yojson x.version));
       
  ])

let configuration_item_list_to_yojson = 
  fun tree -> list_to_yojson configuration_item_to_yojson tree

let get_resource_config_history_response_to_yojson = 
  fun (x: get_resource_config_history_response) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "configurationItems",
         (option_to_yojson configuration_item_list_to_yojson x.configuration_items));
       
  ])

let later_time_to_yojson = timestamp_to_yojson

let earlier_time_to_yojson = timestamp_to_yojson

let chronological_order_to_yojson = 
  fun (x: chronological_order) -> match x with 
  | Forward -> `String "Forward"
    | Reverse -> `String "Reverse"
     

let get_resource_config_history_request_to_yojson = 
  fun (x: get_resource_config_history_request) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "chronologicalOrder",
         (option_to_yojson chronological_order_to_yojson x.chronological_order));
       (
         "earlierTime",
         (option_to_yojson earlier_time_to_yojson x.earlier_time));
       (
         "laterTime",
         (option_to_yojson later_time_to_yojson x.later_time));
       (
         "resourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       (
         "resourceType",
         (Some (resource_type_to_yojson x.resource_type)));
       
  ])

let no_such_organization_config_rule_exception_to_yojson = 
  fun (x: no_such_organization_config_rule_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let get_organization_custom_rule_policy_response_to_yojson = 
  fun (x: get_organization_custom_rule_policy_response) -> assoc_to_yojson(
    [(
         "PolicyText",
         (option_to_yojson policy_text_to_yojson x.policy_text));
       
  ])

let get_organization_custom_rule_policy_request_to_yojson = 
  fun (x: get_organization_custom_rule_policy_request) -> assoc_to_yojson(
    [(
         "OrganizationConfigRuleName",
         (Some (organization_config_rule_name_to_yojson x.organization_config_rule_name)));
       
  ])

let no_such_organization_conformance_pack_exception_to_yojson = 
  fun (x: no_such_organization_conformance_pack_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let organization_resource_detailed_status_to_yojson = 
  fun (x: organization_resource_detailed_status) -> match x with 
 
| UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_SUCCESSFUL -> `String "UPDATE_SUCCESSFUL"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_SUCCESSFUL -> `String "DELETE_SUCCESSFUL"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_SUCCESSFUL -> `String "CREATE_SUCCESSFUL"
   

let organization_conformance_pack_detailed_status_to_yojson = 
  fun (x: organization_conformance_pack_detailed_status) -> assoc_to_yojson(
    [(
         "LastUpdateTime",
         (option_to_yojson date_to_yojson x.last_update_time));
       (
         "ErrorMessage",
         (option_to_yojson string__to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson string__to_yojson x.error_code));
       (
         "Status",
         (Some (organization_resource_detailed_status_to_yojson x.status)));
       (
         "ConformancePackName",
         (Some (string_with_char_limit256_to_yojson x.conformance_pack_name)));
       (
         "AccountId",
         (Some (account_id_to_yojson x.account_id)));
       
  ])

let organization_conformance_pack_detailed_statuses_to_yojson = 
  fun tree -> list_to_yojson organization_conformance_pack_detailed_status_to_yojson tree

let get_organization_conformance_pack_detailed_status_response_to_yojson = 
  fun (x: get_organization_conformance_pack_detailed_status_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "OrganizationConformancePackDetailedStatuses",
         (option_to_yojson organization_conformance_pack_detailed_statuses_to_yojson x.organization_conformance_pack_detailed_statuses));
       
  ])

let organization_resource_detailed_status_filters_to_yojson = 
  fun (x: organization_resource_detailed_status_filters) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson organization_resource_detailed_status_to_yojson x.status));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       
  ])

let cosmos_page_limit_to_yojson = int_to_yojson

let get_organization_conformance_pack_detailed_status_request_to_yojson = 
  fun (x: get_organization_conformance_pack_detailed_status_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson cosmos_page_limit_to_yojson x.limit));
       (
         "Filters",
         (option_to_yojson organization_resource_detailed_status_filters_to_yojson x.filters));
       (
         "OrganizationConformancePackName",
         (Some (organization_conformance_pack_name_to_yojson x.organization_conformance_pack_name)));
       
  ])

let member_account_status_to_yojson = 
  fun (x: member_account_status) -> assoc_to_yojson(
    [(
         "LastUpdateTime",
         (option_to_yojson date_to_yojson x.last_update_time));
       (
         "ErrorMessage",
         (option_to_yojson string__to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson string__to_yojson x.error_code));
       (
         "MemberAccountRuleStatus",
         (Some (member_account_rule_status_to_yojson x.member_account_rule_status)));
       (
         "ConfigRuleName",
         (Some (string_with_char_limit64_to_yojson x.config_rule_name)));
       (
         "AccountId",
         (Some (account_id_to_yojson x.account_id)));
       
  ])

let organization_config_rule_detailed_status_to_yojson = 
  fun tree -> list_to_yojson member_account_status_to_yojson tree

let get_organization_config_rule_detailed_status_response_to_yojson = 
  fun (x: get_organization_config_rule_detailed_status_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "OrganizationConfigRuleDetailedStatus",
         (option_to_yojson organization_config_rule_detailed_status_to_yojson x.organization_config_rule_detailed_status));
       
  ])

let get_organization_config_rule_detailed_status_request_to_yojson = 
  fun (x: get_organization_config_rule_detailed_status_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson cosmos_page_limit_to_yojson x.limit));
       (
         "Filters",
         (option_to_yojson status_detail_filters_to_yojson x.filters));
       (
         "OrganizationConfigRuleName",
         (Some (organization_config_rule_name_to_yojson x.organization_config_rule_name)));
       
  ])

let long_to_yojson = long_to_yojson

let resource_count_to_yojson = 
  fun (x: resource_count) -> assoc_to_yojson(
    [(
         "count",
         (option_to_yojson long_to_yojson x.count));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       
  ])

let resource_counts_to_yojson = 
  fun tree -> list_to_yojson resource_count_to_yojson tree

let get_discovered_resource_counts_response_to_yojson = 
  fun (x: get_discovered_resource_counts_response) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "resourceCounts",
         (option_to_yojson resource_counts_to_yojson x.resource_counts));
       (
         "totalDiscoveredResources",
         (option_to_yojson long_to_yojson x.total_discovered_resources));
       
  ])

let resource_types_to_yojson = 
  fun tree -> list_to_yojson string_with_char_limit256_to_yojson tree

let get_discovered_resource_counts_request_to_yojson = 
  fun (x: get_discovered_resource_counts_request) -> assoc_to_yojson(
    [(
         "nextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "resourceTypes",
         (option_to_yojson resource_types_to_yojson x.resource_types));
       
  ])

let get_custom_rule_policy_response_to_yojson = 
  fun (x: get_custom_rule_policy_response) -> assoc_to_yojson(
    [(
         "PolicyText",
         (option_to_yojson policy_text_to_yojson x.policy_text));
       
  ])

let get_custom_rule_policy_request_to_yojson = 
  fun (x: get_custom_rule_policy_request) -> assoc_to_yojson(
    [(
         "ConfigRuleName",
         (option_to_yojson config_rule_name_to_yojson x.config_rule_name));
       
  ])

let no_such_conformance_pack_exception_to_yojson = 
  fun (x: no_such_conformance_pack_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let conformance_pack_compliance_type_to_yojson = 
  fun (x: conformance_pack_compliance_type) -> match x with 
 
| INSUFFICIENT_DATA -> `String "INSUFFICIENT_DATA"
  | NON_COMPLIANT -> `String "NON_COMPLIANT"
  | COMPLIANT -> `String "COMPLIANT"
   

let conformance_pack_compliance_summary_to_yojson = 
  fun (x: conformance_pack_compliance_summary) -> assoc_to_yojson(
    [(
         "ConformancePackComplianceStatus",
         (Some (conformance_pack_compliance_type_to_yojson x.conformance_pack_compliance_status)));
       (
         "ConformancePackName",
         (Some (conformance_pack_name_to_yojson x.conformance_pack_name)));
       
  ])

let conformance_pack_compliance_summary_list_to_yojson = 
  fun tree -> list_to_yojson conformance_pack_compliance_summary_to_yojson tree

let get_conformance_pack_compliance_summary_response_to_yojson = 
  fun (x: get_conformance_pack_compliance_summary_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ConformancePackComplianceSummaryList",
         (option_to_yojson conformance_pack_compliance_summary_list_to_yojson x.conformance_pack_compliance_summary_list));
       
  ])

let conformance_pack_names_to_summarize_list_to_yojson = 
  fun tree -> list_to_yojson conformance_pack_name_to_yojson tree

let get_conformance_pack_compliance_summary_request_to_yojson = 
  fun (x: get_conformance_pack_compliance_summary_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson page_size_limit_to_yojson x.limit));
       (
         "ConformancePackNames",
         (Some (conformance_pack_names_to_summarize_list_to_yojson x.conformance_pack_names)));
       
  ])

let no_such_config_rule_in_conformance_pack_exception_to_yojson = 
  fun (x: no_such_config_rule_in_conformance_pack_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let evaluation_result_qualifier_to_yojson = 
  fun (x: evaluation_result_qualifier) -> assoc_to_yojson(
    [(
         "EvaluationMode",
         (option_to_yojson evaluation_mode_to_yojson x.evaluation_mode));
       (
         "ResourceId",
         (option_to_yojson base_resource_id_to_yojson x.resource_id));
       (
         "ResourceType",
         (option_to_yojson string_with_char_limit256_to_yojson x.resource_type));
       (
         "ConfigRuleName",
         (option_to_yojson config_rule_name_to_yojson x.config_rule_name));
       
  ])

let evaluation_result_identifier_to_yojson = 
  fun (x: evaluation_result_identifier) -> assoc_to_yojson(
    [(
         "ResourceEvaluationId",
         (option_to_yojson resource_evaluation_id_to_yojson x.resource_evaluation_id));
       (
         "OrderingTimestamp",
         (option_to_yojson date_to_yojson x.ordering_timestamp));
       (
         "EvaluationResultQualifier",
         (option_to_yojson evaluation_result_qualifier_to_yojson x.evaluation_result_qualifier));
       
  ])

let annotation_to_yojson = string_to_yojson

let conformance_pack_evaluation_result_to_yojson = 
  fun (x: conformance_pack_evaluation_result) -> assoc_to_yojson(
    [(
         "Annotation",
         (option_to_yojson annotation_to_yojson x.annotation));
       (
         "ResultRecordedTime",
         (Some (date_to_yojson x.result_recorded_time)));
       (
         "ConfigRuleInvokedTime",
         (Some (date_to_yojson x.config_rule_invoked_time)));
       (
         "EvaluationResultIdentifier",
         (Some (evaluation_result_identifier_to_yojson x.evaluation_result_identifier)));
       (
         "ComplianceType",
         (Some (conformance_pack_compliance_type_to_yojson x.compliance_type)));
       
  ])

let conformance_pack_rule_evaluation_results_list_to_yojson = 
  fun tree -> list_to_yojson conformance_pack_evaluation_result_to_yojson tree

let get_conformance_pack_compliance_details_response_to_yojson = 
  fun (x: get_conformance_pack_compliance_details_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ConformancePackRuleEvaluationResults",
         (option_to_yojson conformance_pack_rule_evaluation_results_list_to_yojson x.conformance_pack_rule_evaluation_results));
       (
         "ConformancePackName",
         (Some (conformance_pack_name_to_yojson x.conformance_pack_name)));
       
  ])

let conformance_pack_config_rule_names_to_yojson = 
  fun tree -> list_to_yojson string_with_char_limit64_to_yojson tree

let conformance_pack_compliance_resource_ids_to_yojson = 
  fun tree -> list_to_yojson string_with_char_limit256_to_yojson tree

let conformance_pack_evaluation_filters_to_yojson = 
  fun (x: conformance_pack_evaluation_filters) -> assoc_to_yojson(
    [(
         "ResourceIds",
         (option_to_yojson conformance_pack_compliance_resource_ids_to_yojson x.resource_ids));
       (
         "ResourceType",
         (option_to_yojson string_with_char_limit256_to_yojson x.resource_type));
       (
         "ComplianceType",
         (option_to_yojson conformance_pack_compliance_type_to_yojson x.compliance_type));
       (
         "ConfigRuleNames",
         (option_to_yojson conformance_pack_config_rule_names_to_yojson x.config_rule_names));
       
  ])

let get_conformance_pack_compliance_details_limit_to_yojson = 
  int_to_yojson

let get_conformance_pack_compliance_details_request_to_yojson = 
  fun (x: get_conformance_pack_compliance_details_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson get_conformance_pack_compliance_details_limit_to_yojson x.limit));
       (
         "Filters",
         (option_to_yojson conformance_pack_evaluation_filters_to_yojson x.filters));
       (
         "ConformancePackName",
         (Some (conformance_pack_name_to_yojson x.conformance_pack_name)));
       
  ])

let integer__to_yojson = int_to_yojson

let compliance_contributor_count_to_yojson = 
  fun (x: compliance_contributor_count) -> assoc_to_yojson(
    [(
         "CapExceeded",
         (option_to_yojson boolean__to_yojson x.cap_exceeded));
       (
         "CappedCount",
         (option_to_yojson integer__to_yojson x.capped_count));
       
  ])

let compliance_summary_to_yojson = 
  fun (x: compliance_summary) -> assoc_to_yojson(
    [(
         "ComplianceSummaryTimestamp",
         (option_to_yojson date_to_yojson x.compliance_summary_timestamp));
       (
         "NonCompliantResourceCount",
         (option_to_yojson compliance_contributor_count_to_yojson x.non_compliant_resource_count));
       (
         "CompliantResourceCount",
         (option_to_yojson compliance_contributor_count_to_yojson x.compliant_resource_count));
       
  ])

let compliance_summary_by_resource_type_to_yojson = 
  fun (x: compliance_summary_by_resource_type) -> assoc_to_yojson(
    [(
         "ComplianceSummary",
         (option_to_yojson compliance_summary_to_yojson x.compliance_summary));
       (
         "ResourceType",
         (option_to_yojson string_with_char_limit256_to_yojson x.resource_type));
       
  ])

let compliance_summaries_by_resource_type_to_yojson = 
  fun tree -> list_to_yojson compliance_summary_by_resource_type_to_yojson tree

let get_compliance_summary_by_resource_type_response_to_yojson = 
  fun (x: get_compliance_summary_by_resource_type_response) -> assoc_to_yojson(
    [(
         "ComplianceSummariesByResourceType",
         (option_to_yojson compliance_summaries_by_resource_type_to_yojson x.compliance_summaries_by_resource_type));
       
  ])

let get_compliance_summary_by_resource_type_request_to_yojson = 
  fun (x: get_compliance_summary_by_resource_type_request) -> assoc_to_yojson(
    [(
         "ResourceTypes",
         (option_to_yojson resource_types_to_yojson x.resource_types));
       
  ])

let get_compliance_summary_by_config_rule_response_to_yojson = 
  fun (x: get_compliance_summary_by_config_rule_response) -> assoc_to_yojson(
    [(
         "ComplianceSummary",
         (option_to_yojson compliance_summary_to_yojson x.compliance_summary));
       
  ])

let evaluation_result_to_yojson = 
  fun (x: evaluation_result) -> assoc_to_yojson(
    [(
         "ResultToken",
         (option_to_yojson string__to_yojson x.result_token));
       (
         "Annotation",
         (option_to_yojson string_with_char_limit256_to_yojson x.annotation));
       (
         "ConfigRuleInvokedTime",
         (option_to_yojson date_to_yojson x.config_rule_invoked_time));
       (
         "ResultRecordedTime",
         (option_to_yojson date_to_yojson x.result_recorded_time));
       (
         "ComplianceType",
         (option_to_yojson compliance_type_to_yojson x.compliance_type));
       (
         "EvaluationResultIdentifier",
         (option_to_yojson evaluation_result_identifier_to_yojson x.evaluation_result_identifier));
       
  ])

let evaluation_results_to_yojson = 
  fun tree -> list_to_yojson evaluation_result_to_yojson tree

let get_compliance_details_by_resource_response_to_yojson = 
  fun (x: get_compliance_details_by_resource_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "EvaluationResults",
         (option_to_yojson evaluation_results_to_yojson x.evaluation_results));
       
  ])

let compliance_types_to_yojson = 
  fun tree -> list_to_yojson compliance_type_to_yojson tree

let get_compliance_details_by_resource_request_to_yojson = 
  fun (x: get_compliance_details_by_resource_request) -> assoc_to_yojson(
    [(
         "ResourceEvaluationId",
         (option_to_yojson resource_evaluation_id_to_yojson x.resource_evaluation_id));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ComplianceTypes",
         (option_to_yojson compliance_types_to_yojson x.compliance_types));
       (
         "ResourceId",
         (option_to_yojson base_resource_id_to_yojson x.resource_id));
       (
         "ResourceType",
         (option_to_yojson string_with_char_limit256_to_yojson x.resource_type));
       
  ])

let get_compliance_details_by_config_rule_response_to_yojson = 
  fun (x: get_compliance_details_by_config_rule_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EvaluationResults",
         (option_to_yojson evaluation_results_to_yojson x.evaluation_results));
       
  ])

let get_compliance_details_by_config_rule_request_to_yojson = 
  fun (x: get_compliance_details_by_config_rule_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "ComplianceTypes",
         (option_to_yojson compliance_types_to_yojson x.compliance_types));
       (
         "ConfigRuleName",
         (Some (string_with_char_limit64_to_yojson x.config_rule_name)));
       
  ])

let oversized_configuration_item_exception_to_yojson = 
  fun (x: oversized_configuration_item_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let get_aggregate_resource_config_response_to_yojson = 
  fun (x: get_aggregate_resource_config_response) -> assoc_to_yojson(
    [(
         "ConfigurationItem",
         (option_to_yojson configuration_item_to_yojson x.configuration_item));
       
  ])

let get_aggregate_resource_config_request_to_yojson = 
  fun (x: get_aggregate_resource_config_request) -> assoc_to_yojson(
    [(
         "ResourceIdentifier",
         (Some (aggregate_resource_identifier_to_yojson x.resource_identifier)));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let grouped_resource_count_to_yojson = 
  fun (x: grouped_resource_count) -> assoc_to_yojson(
    [(
         "ResourceCount",
         (Some (long_to_yojson x.resource_count)));
       (
         "GroupName",
         (Some (string_with_char_limit256_to_yojson x.group_name)));
       
  ])

let grouped_resource_count_list_to_yojson = 
  fun tree -> list_to_yojson grouped_resource_count_to_yojson tree

let get_aggregate_discovered_resource_counts_response_to_yojson = 
  fun (x: get_aggregate_discovered_resource_counts_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "GroupedResourceCounts",
         (option_to_yojson grouped_resource_count_list_to_yojson x.grouped_resource_counts));
       (
         "GroupByKey",
         (option_to_yojson string_with_char_limit256_to_yojson x.group_by_key));
       (
         "TotalDiscoveredResources",
         (Some (long_to_yojson x.total_discovered_resources)));
       
  ])

let resource_count_filters_to_yojson = 
  fun (x: resource_count_filters) -> assoc_to_yojson(
    [(
         "Region",
         (option_to_yojson aws_region_to_yojson x.region));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       (
         "ResourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       
  ])

let resource_count_group_key_to_yojson = 
  fun (x: resource_count_group_key) -> match x with 
 
| AWS_REGION -> `String "AWS_REGION"
  | ACCOUNT_ID -> `String "ACCOUNT_ID"
  | RESOURCE_TYPE -> `String "RESOURCE_TYPE"
   

let group_by_api_limit_to_yojson = int_to_yojson

let get_aggregate_discovered_resource_counts_request_to_yojson = 
  fun (x: get_aggregate_discovered_resource_counts_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson group_by_api_limit_to_yojson x.limit));
       (
         "GroupByKey",
         (option_to_yojson resource_count_group_key_to_yojson x.group_by_key));
       (
         "Filters",
         (option_to_yojson resource_count_filters_to_yojson x.filters));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let aggregate_conformance_pack_compliance_count_to_yojson = 
  fun (x: aggregate_conformance_pack_compliance_count) -> assoc_to_yojson(
    [(
         "NonCompliantConformancePackCount",
         (option_to_yojson integer__to_yojson x.non_compliant_conformance_pack_count));
       (
         "CompliantConformancePackCount",
         (option_to_yojson integer__to_yojson x.compliant_conformance_pack_count));
       
  ])

let aggregate_conformance_pack_compliance_summary_to_yojson = 
  fun (x: aggregate_conformance_pack_compliance_summary) -> assoc_to_yojson(
    [(
         "GroupName",
         (option_to_yojson string_with_char_limit256_to_yojson x.group_name));
       (
         "ComplianceSummary",
         (option_to_yojson aggregate_conformance_pack_compliance_count_to_yojson x.compliance_summary));
       
  ])

let aggregate_conformance_pack_compliance_summary_list_to_yojson = 
  fun tree -> list_to_yojson aggregate_conformance_pack_compliance_summary_to_yojson tree

let get_aggregate_conformance_pack_compliance_summary_response_to_yojson = 
  fun (x: get_aggregate_conformance_pack_compliance_summary_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "GroupByKey",
         (option_to_yojson string_with_char_limit256_to_yojson x.group_by_key));
       (
         "AggregateConformancePackComplianceSummaries",
         (option_to_yojson aggregate_conformance_pack_compliance_summary_list_to_yojson x.aggregate_conformance_pack_compliance_summaries));
       
  ])

let aggregate_conformance_pack_compliance_summary_filters_to_yojson = 
  fun (x: aggregate_conformance_pack_compliance_summary_filters) -> assoc_to_yojson(
    [(
         "AwsRegion",
         (option_to_yojson aws_region_to_yojson x.aws_region));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       
  ])

let aggregate_conformance_pack_compliance_summary_group_key_to_yojson = 
  fun (x: aggregate_conformance_pack_compliance_summary_group_key) -> match x with 
  | AWS_REGION -> `String "AWS_REGION"
    | ACCOUNT_ID -> `String "ACCOUNT_ID"
     

let get_aggregate_conformance_pack_compliance_summary_request_to_yojson = 
  fun (x: get_aggregate_conformance_pack_compliance_summary_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "GroupByKey",
         (option_to_yojson aggregate_conformance_pack_compliance_summary_group_key_to_yojson x.group_by_key));
       (
         "Filters",
         (option_to_yojson aggregate_conformance_pack_compliance_summary_filters_to_yojson x.filters));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let aggregate_compliance_count_to_yojson = 
  fun (x: aggregate_compliance_count) -> assoc_to_yojson(
    [(
         "ComplianceSummary",
         (option_to_yojson compliance_summary_to_yojson x.compliance_summary));
       (
         "GroupName",
         (option_to_yojson string_with_char_limit256_to_yojson x.group_name));
       
  ])

let aggregate_compliance_count_list_to_yojson = 
  fun tree -> list_to_yojson aggregate_compliance_count_to_yojson tree

let get_aggregate_config_rule_compliance_summary_response_to_yojson = 
  fun (x: get_aggregate_config_rule_compliance_summary_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AggregateComplianceCounts",
         (option_to_yojson aggregate_compliance_count_list_to_yojson x.aggregate_compliance_counts));
       (
         "GroupByKey",
         (option_to_yojson string_with_char_limit256_to_yojson x.group_by_key));
       
  ])

let config_rule_compliance_summary_filters_to_yojson = 
  fun (x: config_rule_compliance_summary_filters) -> assoc_to_yojson(
    [(
         "AwsRegion",
         (option_to_yojson aws_region_to_yojson x.aws_region));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       
  ])

let config_rule_compliance_summary_group_key_to_yojson = 
  fun (x: config_rule_compliance_summary_group_key) -> match x with 
  | AWS_REGION -> `String "AWS_REGION"
    | ACCOUNT_ID -> `String "ACCOUNT_ID"
     

let get_aggregate_config_rule_compliance_summary_request_to_yojson = 
  fun (x: get_aggregate_config_rule_compliance_summary_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson group_by_api_limit_to_yojson x.limit));
       (
         "GroupByKey",
         (option_to_yojson config_rule_compliance_summary_group_key_to_yojson x.group_by_key));
       (
         "Filters",
         (option_to_yojson config_rule_compliance_summary_filters_to_yojson x.filters));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let aggregate_evaluation_result_to_yojson = 
  fun (x: aggregate_evaluation_result) -> assoc_to_yojson(
    [(
         "AwsRegion",
         (option_to_yojson aws_region_to_yojson x.aws_region));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       (
         "Annotation",
         (option_to_yojson string_with_char_limit256_to_yojson x.annotation));
       (
         "ConfigRuleInvokedTime",
         (option_to_yojson date_to_yojson x.config_rule_invoked_time));
       (
         "ResultRecordedTime",
         (option_to_yojson date_to_yojson x.result_recorded_time));
       (
         "ComplianceType",
         (option_to_yojson compliance_type_to_yojson x.compliance_type));
       (
         "EvaluationResultIdentifier",
         (option_to_yojson evaluation_result_identifier_to_yojson x.evaluation_result_identifier));
       
  ])

let aggregate_evaluation_result_list_to_yojson = 
  fun tree -> list_to_yojson aggregate_evaluation_result_to_yojson tree

let get_aggregate_compliance_details_by_config_rule_response_to_yojson = 
  fun (x: get_aggregate_compliance_details_by_config_rule_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AggregateEvaluationResults",
         (option_to_yojson aggregate_evaluation_result_list_to_yojson x.aggregate_evaluation_results));
       
  ])

let get_aggregate_compliance_details_by_config_rule_request_to_yojson = 
  fun (x: get_aggregate_compliance_details_by_config_rule_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "ComplianceType",
         (option_to_yojson compliance_type_to_yojson x.compliance_type));
       (
         "AwsRegion",
         (Some (aws_region_to_yojson x.aws_region)));
       (
         "AccountId",
         (Some (account_id_to_yojson x.account_id)));
       (
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let no_such_retention_configuration_exception_to_yojson = 
  fun (x: no_such_retention_configuration_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let retention_configuration_list_to_yojson = 
  fun tree -> list_to_yojson retention_configuration_to_yojson tree

let describe_retention_configurations_response_to_yojson = 
  fun (x: describe_retention_configurations_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "RetentionConfigurations",
         (option_to_yojson retention_configuration_list_to_yojson x.retention_configurations));
       
  ])

let retention_configuration_name_list_to_yojson = 
  fun tree -> list_to_yojson retention_configuration_name_to_yojson tree

let describe_retention_configurations_request_to_yojson = 
  fun (x: describe_retention_configurations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "RetentionConfigurationNames",
         (option_to_yojson retention_configuration_name_list_to_yojson x.retention_configuration_names));
       
  ])

let remediation_execution_state_to_yojson = 
  fun (x: remediation_execution_state) -> match x with 
 
| FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | QUEUED -> `String "QUEUED"
   

let remediation_execution_step_state_to_yojson = 
  fun (x: remediation_execution_step_state) -> match x with 
 
| FAILED -> `String "FAILED"
  | PENDING -> `String "PENDING"
  | SUCCEEDED -> `String "SUCCEEDED"
   

let remediation_execution_step_to_yojson = 
  fun (x: remediation_execution_step) -> assoc_to_yojson(
    [(
         "StopTime",
         (option_to_yojson date_to_yojson x.stop_time));
       (
         "StartTime",
         (option_to_yojson date_to_yojson x.start_time));
       (
         "ErrorMessage",
         (option_to_yojson string__to_yojson x.error_message));
       (
         "State",
         (option_to_yojson remediation_execution_step_state_to_yojson x.state));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let remediation_execution_steps_to_yojson = 
  fun tree -> list_to_yojson remediation_execution_step_to_yojson tree

let remediation_execution_status_to_yojson = 
  fun (x: remediation_execution_status) -> assoc_to_yojson(
    [(
         "LastUpdatedTime",
         (option_to_yojson date_to_yojson x.last_updated_time));
       (
         "InvocationTime",
         (option_to_yojson date_to_yojson x.invocation_time));
       (
         "StepDetails",
         (option_to_yojson remediation_execution_steps_to_yojson x.step_details));
       (
         "State",
         (option_to_yojson remediation_execution_state_to_yojson x.state));
       (
         "ResourceKey",
         (option_to_yojson resource_key_to_yojson x.resource_key));
       
  ])

let remediation_execution_statuses_to_yojson = 
  fun tree -> list_to_yojson remediation_execution_status_to_yojson tree

let describe_remediation_execution_status_response_to_yojson = 
  fun (x: describe_remediation_execution_status_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "RemediationExecutionStatuses",
         (option_to_yojson remediation_execution_statuses_to_yojson x.remediation_execution_statuses));
       
  ])

let describe_remediation_execution_status_request_to_yojson = 
  fun (x: describe_remediation_execution_status_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "ResourceKeys",
         (option_to_yojson resource_keys_to_yojson x.resource_keys));
       (
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       
  ])

let describe_remediation_exceptions_response_to_yojson = 
  fun (x: describe_remediation_exceptions_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "RemediationExceptions",
         (option_to_yojson remediation_exceptions_to_yojson x.remediation_exceptions));
       
  ])

let describe_remediation_exceptions_request_to_yojson = 
  fun (x: describe_remediation_exceptions_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "ResourceKeys",
         (option_to_yojson remediation_exception_resource_keys_to_yojson x.resource_keys));
       (
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       
  ])

let describe_remediation_configurations_response_to_yojson = 
  fun (x: describe_remediation_configurations_response) -> assoc_to_yojson(
    [(
         "RemediationConfigurations",
         (option_to_yojson remediation_configurations_to_yojson x.remediation_configurations));
       
  ])

let config_rule_names_to_yojson = 
  fun tree -> list_to_yojson config_rule_name_to_yojson tree

let describe_remediation_configurations_request_to_yojson = 
  fun (x: describe_remediation_configurations_request) -> assoc_to_yojson(
    [(
         "ConfigRuleNames",
         (Some (config_rule_names_to_yojson x.config_rule_names)));
       
  ])

let pending_aggregation_request_to_yojson = 
  fun (x: pending_aggregation_request) -> assoc_to_yojson(
    [(
         "RequesterAwsRegion",
         (option_to_yojson aws_region_to_yojson x.requester_aws_region));
       (
         "RequesterAccountId",
         (option_to_yojson account_id_to_yojson x.requester_account_id));
       
  ])

let pending_aggregation_request_list_to_yojson = 
  fun tree -> list_to_yojson pending_aggregation_request_to_yojson tree

let describe_pending_aggregation_requests_response_to_yojson = 
  fun (x: describe_pending_aggregation_requests_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "PendingAggregationRequests",
         (option_to_yojson pending_aggregation_request_list_to_yojson x.pending_aggregation_requests));
       
  ])

let describe_pending_aggregation_requests_limit_to_yojson = int_to_yojson

let describe_pending_aggregation_requests_request_to_yojson = 
  fun (x: describe_pending_aggregation_requests_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson describe_pending_aggregation_requests_limit_to_yojson x.limit));
       
  ])

let organization_resource_status_to_yojson = 
  fun (x: organization_resource_status) -> match x with 
 
| UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_SUCCESSFUL -> `String "UPDATE_SUCCESSFUL"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_SUCCESSFUL -> `String "DELETE_SUCCESSFUL"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_SUCCESSFUL -> `String "CREATE_SUCCESSFUL"
   

let organization_conformance_pack_status_to_yojson = 
  fun (x: organization_conformance_pack_status) -> assoc_to_yojson(
    [(
         "LastUpdateTime",
         (option_to_yojson date_to_yojson x.last_update_time));
       (
         "ErrorMessage",
         (option_to_yojson string__to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson string__to_yojson x.error_code));
       (
         "Status",
         (Some (organization_resource_status_to_yojson x.status)));
       (
         "OrganizationConformancePackName",
         (Some (organization_conformance_pack_name_to_yojson x.organization_conformance_pack_name)));
       
  ])

let organization_conformance_pack_statuses_to_yojson = 
  fun tree -> list_to_yojson organization_conformance_pack_status_to_yojson tree

let describe_organization_conformance_pack_statuses_response_to_yojson = 
  fun (x: describe_organization_conformance_pack_statuses_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "OrganizationConformancePackStatuses",
         (option_to_yojson organization_conformance_pack_statuses_to_yojson x.organization_conformance_pack_statuses));
       
  ])

let organization_conformance_pack_names_to_yojson = 
  fun tree -> list_to_yojson organization_conformance_pack_name_to_yojson tree

let describe_organization_conformance_pack_statuses_request_to_yojson = 
  fun (x: describe_organization_conformance_pack_statuses_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson cosmos_page_limit_to_yojson x.limit));
       (
         "OrganizationConformancePackNames",
         (option_to_yojson organization_conformance_pack_names_to_yojson x.organization_conformance_pack_names));
       
  ])

let organization_conformance_pack_to_yojson = 
  fun (x: organization_conformance_pack) -> assoc_to_yojson(
    [(
         "LastUpdateTime",
         (Some (date_to_yojson x.last_update_time)));
       (
         "ExcludedAccounts",
         (option_to_yojson excluded_accounts_to_yojson x.excluded_accounts));
       (
         "ConformancePackInputParameters",
         (option_to_yojson conformance_pack_input_parameters_to_yojson x.conformance_pack_input_parameters));
       (
         "DeliveryS3KeyPrefix",
         (option_to_yojson delivery_s3_key_prefix_to_yojson x.delivery_s3_key_prefix));
       (
         "DeliveryS3Bucket",
         (option_to_yojson delivery_s3_bucket_to_yojson x.delivery_s3_bucket));
       (
         "OrganizationConformancePackArn",
         (Some (string_with_char_limit256_to_yojson x.organization_conformance_pack_arn)));
       (
         "OrganizationConformancePackName",
         (Some (organization_conformance_pack_name_to_yojson x.organization_conformance_pack_name)));
       
  ])

let organization_conformance_packs_to_yojson = 
  fun tree -> list_to_yojson organization_conformance_pack_to_yojson tree

let describe_organization_conformance_packs_response_to_yojson = 
  fun (x: describe_organization_conformance_packs_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "OrganizationConformancePacks",
         (option_to_yojson organization_conformance_packs_to_yojson x.organization_conformance_packs));
       
  ])

let describe_organization_conformance_packs_request_to_yojson = 
  fun (x: describe_organization_conformance_packs_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson cosmos_page_limit_to_yojson x.limit));
       (
         "OrganizationConformancePackNames",
         (option_to_yojson organization_conformance_pack_names_to_yojson x.organization_conformance_pack_names));
       
  ])

let organization_rule_status_to_yojson = 
  fun (x: organization_rule_status) -> match x with 
 
| UPDATE_FAILED -> `String "UPDATE_FAILED"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_SUCCESSFUL -> `String "UPDATE_SUCCESSFUL"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_SUCCESSFUL -> `String "DELETE_SUCCESSFUL"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
  | CREATE_SUCCESSFUL -> `String "CREATE_SUCCESSFUL"
   

let organization_config_rule_status_to_yojson = 
  fun (x: organization_config_rule_status) -> assoc_to_yojson(
    [(
         "LastUpdateTime",
         (option_to_yojson date_to_yojson x.last_update_time));
       (
         "ErrorMessage",
         (option_to_yojson string__to_yojson x.error_message));
       (
         "ErrorCode",
         (option_to_yojson string__to_yojson x.error_code));
       (
         "OrganizationRuleStatus",
         (Some (organization_rule_status_to_yojson x.organization_rule_status)));
       (
         "OrganizationConfigRuleName",
         (Some (organization_config_rule_name_to_yojson x.organization_config_rule_name)));
       
  ])

let organization_config_rule_statuses_to_yojson = 
  fun tree -> list_to_yojson organization_config_rule_status_to_yojson tree

let describe_organization_config_rule_statuses_response_to_yojson = 
  fun (x: describe_organization_config_rule_statuses_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "OrganizationConfigRuleStatuses",
         (option_to_yojson organization_config_rule_statuses_to_yojson x.organization_config_rule_statuses));
       
  ])

let organization_config_rule_names_to_yojson = 
  fun tree -> list_to_yojson string_with_char_limit64_to_yojson tree

let describe_organization_config_rule_statuses_request_to_yojson = 
  fun (x: describe_organization_config_rule_statuses_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson cosmos_page_limit_to_yojson x.limit));
       (
         "OrganizationConfigRuleNames",
         (option_to_yojson organization_config_rule_names_to_yojson x.organization_config_rule_names));
       
  ])

let organization_custom_policy_rule_metadata_no_policy_to_yojson = 
  fun (x: organization_custom_policy_rule_metadata_no_policy) -> assoc_to_yojson(
    [(
         "DebugLogDeliveryAccounts",
         (option_to_yojson debug_log_delivery_accounts_to_yojson x.debug_log_delivery_accounts));
       (
         "PolicyRuntime",
         (option_to_yojson policy_runtime_to_yojson x.policy_runtime));
       (
         "TagValueScope",
         (option_to_yojson string_with_char_limit256_to_yojson x.tag_value_scope));
       (
         "TagKeyScope",
         (option_to_yojson string_with_char_limit128_to_yojson x.tag_key_scope));
       (
         "ResourceIdScope",
         (option_to_yojson string_with_char_limit768_to_yojson x.resource_id_scope));
       (
         "ResourceTypesScope",
         (option_to_yojson resource_types_scope_to_yojson x.resource_types_scope));
       (
         "MaximumExecutionFrequency",
         (option_to_yojson maximum_execution_frequency_to_yojson x.maximum_execution_frequency));
       (
         "InputParameters",
         (option_to_yojson string_with_char_limit2048_to_yojson x.input_parameters));
       (
         "OrganizationConfigRuleTriggerTypes",
         (option_to_yojson organization_config_rule_trigger_type_no_s_ns_to_yojson x.organization_config_rule_trigger_types));
       (
         "Description",
         (option_to_yojson string_with_char_limit256_min0_to_yojson x.description));
       
  ])

let organization_config_rule_to_yojson = 
  fun (x: organization_config_rule) -> assoc_to_yojson(
    [(
         "OrganizationCustomPolicyRuleMetadata",
         (option_to_yojson organization_custom_policy_rule_metadata_no_policy_to_yojson x.organization_custom_policy_rule_metadata));
       (
         "LastUpdateTime",
         (option_to_yojson date_to_yojson x.last_update_time));
       (
         "ExcludedAccounts",
         (option_to_yojson excluded_accounts_to_yojson x.excluded_accounts));
       (
         "OrganizationCustomRuleMetadata",
         (option_to_yojson organization_custom_rule_metadata_to_yojson x.organization_custom_rule_metadata));
       (
         "OrganizationManagedRuleMetadata",
         (option_to_yojson organization_managed_rule_metadata_to_yojson x.organization_managed_rule_metadata));
       (
         "OrganizationConfigRuleArn",
         (Some (string_with_char_limit256_to_yojson x.organization_config_rule_arn)));
       (
         "OrganizationConfigRuleName",
         (Some (organization_config_rule_name_to_yojson x.organization_config_rule_name)));
       
  ])

let organization_config_rules_to_yojson = 
  fun tree -> list_to_yojson organization_config_rule_to_yojson tree

let describe_organization_config_rules_response_to_yojson = 
  fun (x: describe_organization_config_rules_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "OrganizationConfigRules",
         (option_to_yojson organization_config_rules_to_yojson x.organization_config_rules));
       
  ])

let describe_organization_config_rules_request_to_yojson = 
  fun (x: describe_organization_config_rules_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson cosmos_page_limit_to_yojson x.limit));
       (
         "OrganizationConfigRuleNames",
         (option_to_yojson organization_config_rule_names_to_yojson x.organization_config_rule_names));
       
  ])

let no_such_delivery_channel_exception_to_yojson = 
  fun (x: no_such_delivery_channel_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let delivery_status_to_yojson = 
  fun (x: delivery_status) -> match x with 
 
| Not_Applicable -> `String "Not_Applicable"
  | Failure -> `String "Failure"
  | Success -> `String "Success"
   

let config_export_delivery_info_to_yojson = 
  fun (x: config_export_delivery_info) -> assoc_to_yojson(
    [(
         "nextDeliveryTime",
         (option_to_yojson date_to_yojson x.next_delivery_time));
       (
         "lastSuccessfulTime",
         (option_to_yojson date_to_yojson x.last_successful_time));
       (
         "lastAttemptTime",
         (option_to_yojson date_to_yojson x.last_attempt_time));
       (
         "lastErrorMessage",
         (option_to_yojson string__to_yojson x.last_error_message));
       (
         "lastErrorCode",
         (option_to_yojson string__to_yojson x.last_error_code));
       (
         "lastStatus",
         (option_to_yojson delivery_status_to_yojson x.last_status));
       
  ])

let config_stream_delivery_info_to_yojson = 
  fun (x: config_stream_delivery_info) -> assoc_to_yojson(
    [(
         "lastStatusChangeTime",
         (option_to_yojson date_to_yojson x.last_status_change_time));
       (
         "lastErrorMessage",
         (option_to_yojson string__to_yojson x.last_error_message));
       (
         "lastErrorCode",
         (option_to_yojson string__to_yojson x.last_error_code));
       (
         "lastStatus",
         (option_to_yojson delivery_status_to_yojson x.last_status));
       
  ])

let delivery_channel_status_to_yojson = 
  fun (x: delivery_channel_status) -> assoc_to_yojson(
    [(
         "configStreamDeliveryInfo",
         (option_to_yojson config_stream_delivery_info_to_yojson x.config_stream_delivery_info));
       (
         "configHistoryDeliveryInfo",
         (option_to_yojson config_export_delivery_info_to_yojson x.config_history_delivery_info));
       (
         "configSnapshotDeliveryInfo",
         (option_to_yojson config_export_delivery_info_to_yojson x.config_snapshot_delivery_info));
       (
         "name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let delivery_channel_status_list_to_yojson = 
  fun tree -> list_to_yojson delivery_channel_status_to_yojson tree

let describe_delivery_channel_status_response_to_yojson = 
  fun (x: describe_delivery_channel_status_response) -> assoc_to_yojson(
    [(
         "DeliveryChannelsStatus",
         (option_to_yojson delivery_channel_status_list_to_yojson x.delivery_channels_status));
       
  ])

let delivery_channel_name_list_to_yojson = 
  fun tree -> list_to_yojson channel_name_to_yojson tree

let describe_delivery_channel_status_request_to_yojson = 
  fun (x: describe_delivery_channel_status_request) -> assoc_to_yojson(
    [(
         "DeliveryChannelNames",
         (option_to_yojson delivery_channel_name_list_to_yojson x.delivery_channel_names));
       
  ])

let delivery_channel_list_to_yojson = 
  fun tree -> list_to_yojson delivery_channel_to_yojson tree

let describe_delivery_channels_response_to_yojson = 
  fun (x: describe_delivery_channels_response) -> assoc_to_yojson(
    [(
         "DeliveryChannels",
         (option_to_yojson delivery_channel_list_to_yojson x.delivery_channels));
       
  ])

let describe_delivery_channels_request_to_yojson = 
  fun (x: describe_delivery_channels_request) -> assoc_to_yojson(
    [(
         "DeliveryChannelNames",
         (option_to_yojson delivery_channel_name_list_to_yojson x.delivery_channel_names));
       
  ])

let conformance_pack_id_to_yojson = string_to_yojson

let conformance_pack_state_to_yojson = 
  fun (x: conformance_pack_state) -> match x with 
 
| DELETE_FAILED -> `String "DELETE_FAILED"
  | DELETE_IN_PROGRESS -> `String "DELETE_IN_PROGRESS"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | CREATE_COMPLETE -> `String "CREATE_COMPLETE"
  | CREATE_IN_PROGRESS -> `String "CREATE_IN_PROGRESS"
   

let stack_arn_to_yojson = string_to_yojson

let conformance_pack_status_reason_to_yojson = string_to_yojson

let conformance_pack_status_detail_to_yojson = 
  fun (x: conformance_pack_status_detail) -> assoc_to_yojson(
    [(
         "LastUpdateCompletedTime",
         (option_to_yojson date_to_yojson x.last_update_completed_time));
       (
         "LastUpdateRequestedTime",
         (Some (date_to_yojson x.last_update_requested_time)));
       (
         "ConformancePackStatusReason",
         (option_to_yojson conformance_pack_status_reason_to_yojson x.conformance_pack_status_reason));
       (
         "StackArn",
         (Some (stack_arn_to_yojson x.stack_arn)));
       (
         "ConformancePackState",
         (Some (conformance_pack_state_to_yojson x.conformance_pack_state)));
       (
         "ConformancePackArn",
         (Some (conformance_pack_arn_to_yojson x.conformance_pack_arn)));
       (
         "ConformancePackId",
         (Some (conformance_pack_id_to_yojson x.conformance_pack_id)));
       (
         "ConformancePackName",
         (Some (conformance_pack_name_to_yojson x.conformance_pack_name)));
       
  ])

let conformance_pack_status_details_list_to_yojson = 
  fun tree -> list_to_yojson conformance_pack_status_detail_to_yojson tree

let describe_conformance_pack_status_response_to_yojson = 
  fun (x: describe_conformance_pack_status_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ConformancePackStatusDetails",
         (option_to_yojson conformance_pack_status_details_list_to_yojson x.conformance_pack_status_details));
       
  ])

let conformance_pack_names_list_to_yojson = 
  fun tree -> list_to_yojson conformance_pack_name_to_yojson tree

let describe_conformance_pack_status_request_to_yojson = 
  fun (x: describe_conformance_pack_status_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson page_size_limit_to_yojson x.limit));
       (
         "ConformancePackNames",
         (option_to_yojson conformance_pack_names_list_to_yojson x.conformance_pack_names));
       
  ])

let conformance_pack_detail_to_yojson = 
  fun (x: conformance_pack_detail) -> assoc_to_yojson(
    [(
         "TemplateSSMDocumentDetails",
         (option_to_yojson template_ssm_document_details_to_yojson x.template_ssm_document_details));
       (
         "CreatedBy",
         (option_to_yojson string_with_char_limit256_to_yojson x.created_by));
       (
         "LastUpdateRequestedTime",
         (option_to_yojson date_to_yojson x.last_update_requested_time));
       (
         "ConformancePackInputParameters",
         (option_to_yojson conformance_pack_input_parameters_to_yojson x.conformance_pack_input_parameters));
       (
         "DeliveryS3KeyPrefix",
         (option_to_yojson delivery_s3_key_prefix_to_yojson x.delivery_s3_key_prefix));
       (
         "DeliveryS3Bucket",
         (option_to_yojson delivery_s3_bucket_to_yojson x.delivery_s3_bucket));
       (
         "ConformancePackId",
         (Some (conformance_pack_id_to_yojson x.conformance_pack_id)));
       (
         "ConformancePackArn",
         (Some (conformance_pack_arn_to_yojson x.conformance_pack_arn)));
       (
         "ConformancePackName",
         (Some (conformance_pack_name_to_yojson x.conformance_pack_name)));
       
  ])

let conformance_pack_detail_list_to_yojson = 
  fun tree -> list_to_yojson conformance_pack_detail_to_yojson tree

let describe_conformance_packs_response_to_yojson = 
  fun (x: describe_conformance_packs_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ConformancePackDetails",
         (option_to_yojson conformance_pack_detail_list_to_yojson x.conformance_pack_details));
       
  ])

let describe_conformance_packs_request_to_yojson = 
  fun (x: describe_conformance_packs_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson page_size_limit_to_yojson x.limit));
       (
         "ConformancePackNames",
         (option_to_yojson conformance_pack_names_list_to_yojson x.conformance_pack_names));
       
  ])

let controls_list_to_yojson = 
  fun tree -> list_to_yojson string_with_char_limit128_to_yojson tree

let conformance_pack_rule_compliance_to_yojson = 
  fun (x: conformance_pack_rule_compliance) -> assoc_to_yojson(
    [(
         "Controls",
         (option_to_yojson controls_list_to_yojson x.controls));
       (
         "ComplianceType",
         (option_to_yojson conformance_pack_compliance_type_to_yojson x.compliance_type));
       (
         "ConfigRuleName",
         (option_to_yojson config_rule_name_to_yojson x.config_rule_name));
       
  ])

let conformance_pack_rule_compliance_list_to_yojson = 
  fun tree -> list_to_yojson conformance_pack_rule_compliance_to_yojson tree

let describe_conformance_pack_compliance_response_to_yojson = 
  fun (x: describe_conformance_pack_compliance_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ConformancePackRuleComplianceList",
         (Some (conformance_pack_rule_compliance_list_to_yojson x.conformance_pack_rule_compliance_list)));
       (
         "ConformancePackName",
         (Some (conformance_pack_name_to_yojson x.conformance_pack_name)));
       
  ])

let conformance_pack_compliance_filters_to_yojson = 
  fun (x: conformance_pack_compliance_filters) -> assoc_to_yojson(
    [(
         "ComplianceType",
         (option_to_yojson conformance_pack_compliance_type_to_yojson x.compliance_type));
       (
         "ConfigRuleNames",
         (option_to_yojson conformance_pack_config_rule_names_to_yojson x.config_rule_names));
       
  ])

let describe_conformance_pack_compliance_limit_to_yojson = int_to_yojson

let describe_conformance_pack_compliance_request_to_yojson = 
  fun (x: describe_conformance_pack_compliance_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson describe_conformance_pack_compliance_limit_to_yojson x.limit));
       (
         "Filters",
         (option_to_yojson conformance_pack_compliance_filters_to_yojson x.filters));
       (
         "ConformancePackName",
         (Some (conformance_pack_name_to_yojson x.conformance_pack_name)));
       
  ])

let recorder_status_to_yojson = 
  fun (x: recorder_status) -> match x with 
 
| Failure -> `String "Failure"
  | Success -> `String "Success"
  | Pending -> `String "Pending"
   

let configuration_recorder_status_to_yojson = 
  fun (x: configuration_recorder_status) -> assoc_to_yojson(
    [(
         "lastStatusChangeTime",
         (option_to_yojson date_to_yojson x.last_status_change_time));
       (
         "lastErrorMessage",
         (option_to_yojson string__to_yojson x.last_error_message));
       (
         "lastErrorCode",
         (option_to_yojson string__to_yojson x.last_error_code));
       (
         "lastStatus",
         (option_to_yojson recorder_status_to_yojson x.last_status));
       (
         "recording",
         (option_to_yojson boolean__to_yojson x.recording));
       (
         "lastStopTime",
         (option_to_yojson date_to_yojson x.last_stop_time));
       (
         "lastStartTime",
         (option_to_yojson date_to_yojson x.last_start_time));
       (
         "name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let configuration_recorder_status_list_to_yojson = 
  fun tree -> list_to_yojson configuration_recorder_status_to_yojson tree

let describe_configuration_recorder_status_response_to_yojson = 
  fun (x: describe_configuration_recorder_status_response) -> assoc_to_yojson(
    [(
         "ConfigurationRecordersStatus",
         (option_to_yojson configuration_recorder_status_list_to_yojson x.configuration_recorders_status));
       
  ])

let configuration_recorder_name_list_to_yojson = 
  fun tree -> list_to_yojson recorder_name_to_yojson tree

let describe_configuration_recorder_status_request_to_yojson = 
  fun (x: describe_configuration_recorder_status_request) -> assoc_to_yojson(
    [(
         "ConfigurationRecorderNames",
         (option_to_yojson configuration_recorder_name_list_to_yojson x.configuration_recorder_names));
       
  ])

let configuration_recorder_list_to_yojson = 
  fun tree -> list_to_yojson configuration_recorder_to_yojson tree

let describe_configuration_recorders_response_to_yojson = 
  fun (x: describe_configuration_recorders_response) -> assoc_to_yojson(
    [(
         "ConfigurationRecorders",
         (option_to_yojson configuration_recorder_list_to_yojson x.configuration_recorders));
       
  ])

let describe_configuration_recorders_request_to_yojson = 
  fun (x: describe_configuration_recorders_request) -> assoc_to_yojson(
    [(
         "ConfigurationRecorderNames",
         (option_to_yojson configuration_recorder_name_list_to_yojson x.configuration_recorder_names));
       
  ])

let aggregated_source_type_to_yojson = 
  fun (x: aggregated_source_type) -> match x with 
  | ORGANIZATION -> `String "ORGANIZATION"
    | ACCOUNT -> `String "ACCOUNT"
     

let aggregated_source_status_type_to_yojson = 
  fun (x: aggregated_source_status_type) -> match x with 
 
| OUTDATED -> `String "OUTDATED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
   

let aggregated_source_status_to_yojson = 
  fun (x: aggregated_source_status) -> assoc_to_yojson(
    [(
         "LastErrorMessage",
         (option_to_yojson string__to_yojson x.last_error_message));
       (
         "LastErrorCode",
         (option_to_yojson string__to_yojson x.last_error_code));
       (
         "LastUpdateTime",
         (option_to_yojson date_to_yojson x.last_update_time));
       (
         "LastUpdateStatus",
         (option_to_yojson aggregated_source_status_type_to_yojson x.last_update_status));
       (
         "AwsRegion",
         (option_to_yojson aws_region_to_yojson x.aws_region));
       (
         "SourceType",
         (option_to_yojson aggregated_source_type_to_yojson x.source_type));
       (
         "SourceId",
         (option_to_yojson string__to_yojson x.source_id));
       
  ])

let aggregated_source_status_list_to_yojson = 
  fun tree -> list_to_yojson aggregated_source_status_to_yojson tree

let describe_configuration_aggregator_sources_status_response_to_yojson = 
  fun (x: describe_configuration_aggregator_sources_status_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "AggregatedSourceStatusList",
         (option_to_yojson aggregated_source_status_list_to_yojson x.aggregated_source_status_list));
       
  ])

let aggregated_source_status_type_list_to_yojson = 
  fun tree -> list_to_yojson aggregated_source_status_type_to_yojson tree

let describe_configuration_aggregator_sources_status_request_to_yojson = 
  fun (x: describe_configuration_aggregator_sources_status_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "UpdateStatus",
         (option_to_yojson aggregated_source_status_type_list_to_yojson x.update_status));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let configuration_aggregator_list_to_yojson = 
  fun tree -> list_to_yojson configuration_aggregator_to_yojson tree

let describe_configuration_aggregators_response_to_yojson = 
  fun (x: describe_configuration_aggregators_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ConfigurationAggregators",
         (option_to_yojson configuration_aggregator_list_to_yojson x.configuration_aggregators));
       
  ])

let configuration_aggregator_name_list_to_yojson = 
  fun tree -> list_to_yojson configuration_aggregator_name_to_yojson tree

let describe_configuration_aggregators_request_to_yojson = 
  fun (x: describe_configuration_aggregators_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ConfigurationAggregatorNames",
         (option_to_yojson configuration_aggregator_name_list_to_yojson x.configuration_aggregator_names));
       
  ])

let config_rules_to_yojson = 
  fun tree -> list_to_yojson config_rule_to_yojson tree

let describe_config_rules_response_to_yojson = 
  fun (x: describe_config_rules_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ConfigRules",
         (option_to_yojson config_rules_to_yojson x.config_rules));
       
  ])

let describe_config_rules_filters_to_yojson = 
  fun (x: describe_config_rules_filters) -> assoc_to_yojson(
    [(
         "EvaluationMode",
         (option_to_yojson evaluation_mode_to_yojson x.evaluation_mode));
       
  ])

let describe_config_rules_request_to_yojson = 
  fun (x: describe_config_rules_request) -> assoc_to_yojson(
    [(
         "Filters",
         (option_to_yojson describe_config_rules_filters_to_yojson x.filters));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ConfigRuleNames",
         (option_to_yojson config_rule_names_to_yojson x.config_rule_names));
       
  ])

let config_rule_evaluation_status_to_yojson = 
  fun (x: config_rule_evaluation_status) -> assoc_to_yojson(
    [(
         "LastDebugLogDeliveryTime",
         (option_to_yojson date_to_yojson x.last_debug_log_delivery_time));
       (
         "LastDebugLogDeliveryStatusReason",
         (option_to_yojson string__to_yojson x.last_debug_log_delivery_status_reason));
       (
         "LastDebugLogDeliveryStatus",
         (option_to_yojson string__to_yojson x.last_debug_log_delivery_status));
       (
         "FirstEvaluationStarted",
         (option_to_yojson boolean__to_yojson x.first_evaluation_started));
       (
         "LastErrorMessage",
         (option_to_yojson string__to_yojson x.last_error_message));
       (
         "LastErrorCode",
         (option_to_yojson string__to_yojson x.last_error_code));
       (
         "LastDeactivatedTime",
         (option_to_yojson date_to_yojson x.last_deactivated_time));
       (
         "FirstActivatedTime",
         (option_to_yojson date_to_yojson x.first_activated_time));
       (
         "LastFailedEvaluationTime",
         (option_to_yojson date_to_yojson x.last_failed_evaluation_time));
       (
         "LastSuccessfulEvaluationTime",
         (option_to_yojson date_to_yojson x.last_successful_evaluation_time));
       (
         "LastFailedInvocationTime",
         (option_to_yojson date_to_yojson x.last_failed_invocation_time));
       (
         "LastSuccessfulInvocationTime",
         (option_to_yojson date_to_yojson x.last_successful_invocation_time));
       (
         "ConfigRuleId",
         (option_to_yojson string__to_yojson x.config_rule_id));
       (
         "ConfigRuleArn",
         (option_to_yojson string__to_yojson x.config_rule_arn));
       (
         "ConfigRuleName",
         (option_to_yojson config_rule_name_to_yojson x.config_rule_name));
       
  ])

let config_rule_evaluation_status_list_to_yojson = 
  fun tree -> list_to_yojson config_rule_evaluation_status_to_yojson tree

let describe_config_rule_evaluation_status_response_to_yojson = 
  fun (x: describe_config_rule_evaluation_status_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ConfigRulesEvaluationStatus",
         (option_to_yojson config_rule_evaluation_status_list_to_yojson x.config_rules_evaluation_status));
       
  ])

let rule_limit_to_yojson = int_to_yojson

let describe_config_rule_evaluation_status_request_to_yojson = 
  fun (x: describe_config_rule_evaluation_status_request) -> assoc_to_yojson(
    [(
         "Limit",
         (option_to_yojson rule_limit_to_yojson x.limit));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ConfigRuleNames",
         (option_to_yojson config_rule_names_to_yojson x.config_rule_names));
       
  ])

let compliance_to_yojson = 
  fun (x: compliance) -> assoc_to_yojson(
    [(
         "ComplianceContributorCount",
         (option_to_yojson compliance_contributor_count_to_yojson x.compliance_contributor_count));
       (
         "ComplianceType",
         (option_to_yojson compliance_type_to_yojson x.compliance_type));
       
  ])

let compliance_by_resource_to_yojson = 
  fun (x: compliance_by_resource) -> assoc_to_yojson(
    [(
         "Compliance",
         (option_to_yojson compliance_to_yojson x.compliance));
       (
         "ResourceId",
         (option_to_yojson base_resource_id_to_yojson x.resource_id));
       (
         "ResourceType",
         (option_to_yojson string_with_char_limit256_to_yojson x.resource_type));
       
  ])

let compliance_by_resources_to_yojson = 
  fun tree -> list_to_yojson compliance_by_resource_to_yojson tree

let describe_compliance_by_resource_response_to_yojson = 
  fun (x: describe_compliance_by_resource_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ComplianceByResources",
         (option_to_yojson compliance_by_resources_to_yojson x.compliance_by_resources));
       
  ])

let describe_compliance_by_resource_request_to_yojson = 
  fun (x: describe_compliance_by_resource_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "ComplianceTypes",
         (option_to_yojson compliance_types_to_yojson x.compliance_types));
       (
         "ResourceId",
         (option_to_yojson base_resource_id_to_yojson x.resource_id));
       (
         "ResourceType",
         (option_to_yojson string_with_char_limit256_to_yojson x.resource_type));
       
  ])

let compliance_by_config_rule_to_yojson = 
  fun (x: compliance_by_config_rule) -> assoc_to_yojson(
    [(
         "Compliance",
         (option_to_yojson compliance_to_yojson x.compliance));
       (
         "ConfigRuleName",
         (option_to_yojson string_with_char_limit64_to_yojson x.config_rule_name));
       
  ])

let compliance_by_config_rules_to_yojson = 
  fun tree -> list_to_yojson compliance_by_config_rule_to_yojson tree

let describe_compliance_by_config_rule_response_to_yojson = 
  fun (x: describe_compliance_by_config_rule_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ComplianceByConfigRules",
         (option_to_yojson compliance_by_config_rules_to_yojson x.compliance_by_config_rules));
       
  ])

let describe_compliance_by_config_rule_request_to_yojson = 
  fun (x: describe_compliance_by_config_rule_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ComplianceTypes",
         (option_to_yojson compliance_types_to_yojson x.compliance_types));
       (
         "ConfigRuleNames",
         (option_to_yojson config_rule_names_to_yojson x.config_rule_names));
       
  ])

let aggregation_authorization_list_to_yojson = 
  fun tree -> list_to_yojson aggregation_authorization_to_yojson tree

let describe_aggregation_authorizations_response_to_yojson = 
  fun (x: describe_aggregation_authorizations_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "AggregationAuthorizations",
         (option_to_yojson aggregation_authorization_list_to_yojson x.aggregation_authorizations));
       
  ])

let describe_aggregation_authorizations_request_to_yojson = 
  fun (x: describe_aggregation_authorizations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       
  ])

let aggregate_conformance_pack_compliance_to_yojson = 
  fun (x: aggregate_conformance_pack_compliance) -> assoc_to_yojson(
    [(
         "TotalRuleCount",
         (option_to_yojson integer__to_yojson x.total_rule_count));
       (
         "NonCompliantRuleCount",
         (option_to_yojson integer__to_yojson x.non_compliant_rule_count));
       (
         "CompliantRuleCount",
         (option_to_yojson integer__to_yojson x.compliant_rule_count));
       (
         "ComplianceType",
         (option_to_yojson conformance_pack_compliance_type_to_yojson x.compliance_type));
       
  ])

let aggregate_compliance_by_conformance_pack_to_yojson = 
  fun (x: aggregate_compliance_by_conformance_pack) -> assoc_to_yojson(
    [(
         "AwsRegion",
         (option_to_yojson aws_region_to_yojson x.aws_region));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       (
         "Compliance",
         (option_to_yojson aggregate_conformance_pack_compliance_to_yojson x.compliance));
       (
         "ConformancePackName",
         (option_to_yojson conformance_pack_name_to_yojson x.conformance_pack_name));
       
  ])

let aggregate_compliance_by_conformance_pack_list_to_yojson = 
  fun tree -> list_to_yojson aggregate_compliance_by_conformance_pack_to_yojson tree

let describe_aggregate_compliance_by_conformance_packs_response_to_yojson = 
  fun (x: describe_aggregate_compliance_by_conformance_packs_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AggregateComplianceByConformancePacks",
         (option_to_yojson aggregate_compliance_by_conformance_pack_list_to_yojson x.aggregate_compliance_by_conformance_packs));
       
  ])

let aggregate_conformance_pack_compliance_filters_to_yojson = 
  fun (x: aggregate_conformance_pack_compliance_filters) -> assoc_to_yojson(
    [(
         "AwsRegion",
         (option_to_yojson aws_region_to_yojson x.aws_region));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       (
         "ComplianceType",
         (option_to_yojson conformance_pack_compliance_type_to_yojson x.compliance_type));
       (
         "ConformancePackName",
         (option_to_yojson conformance_pack_name_to_yojson x.conformance_pack_name));
       
  ])

let describe_aggregate_compliance_by_conformance_packs_request_to_yojson = 
  fun (x: describe_aggregate_compliance_by_conformance_packs_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson limit_to_yojson x.limit));
       (
         "Filters",
         (option_to_yojson aggregate_conformance_pack_compliance_filters_to_yojson x.filters));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let aggregate_compliance_by_config_rule_to_yojson = 
  fun (x: aggregate_compliance_by_config_rule) -> assoc_to_yojson(
    [(
         "AwsRegion",
         (option_to_yojson aws_region_to_yojson x.aws_region));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       (
         "Compliance",
         (option_to_yojson compliance_to_yojson x.compliance));
       (
         "ConfigRuleName",
         (option_to_yojson config_rule_name_to_yojson x.config_rule_name));
       
  ])

let aggregate_compliance_by_config_rule_list_to_yojson = 
  fun tree -> list_to_yojson aggregate_compliance_by_config_rule_to_yojson tree

let describe_aggregate_compliance_by_config_rules_response_to_yojson = 
  fun (x: describe_aggregate_compliance_by_config_rules_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AggregateComplianceByConfigRules",
         (option_to_yojson aggregate_compliance_by_config_rule_list_to_yojson x.aggregate_compliance_by_config_rules));
       
  ])

let config_rule_compliance_filters_to_yojson = 
  fun (x: config_rule_compliance_filters) -> assoc_to_yojson(
    [(
         "AwsRegion",
         (option_to_yojson aws_region_to_yojson x.aws_region));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       (
         "ComplianceType",
         (option_to_yojson compliance_type_to_yojson x.compliance_type));
       (
         "ConfigRuleName",
         (option_to_yojson config_rule_name_to_yojson x.config_rule_name));
       
  ])

let describe_aggregate_compliance_by_config_rules_request_to_yojson = 
  fun (x: describe_aggregate_compliance_by_config_rules_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Limit",
         (option_to_yojson group_by_api_limit_to_yojson x.limit));
       (
         "Filters",
         (option_to_yojson config_rule_compliance_filters_to_yojson x.filters));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let deliver_config_snapshot_response_to_yojson = 
  fun (x: deliver_config_snapshot_response) -> assoc_to_yojson(
    [(
         "configSnapshotId",
         (option_to_yojson string__to_yojson x.config_snapshot_id));
       
  ])

let deliver_config_snapshot_request_to_yojson = 
  fun (x: deliver_config_snapshot_request) -> assoc_to_yojson(
    [(
         "deliveryChannelName",
         (Some (channel_name_to_yojson x.delivery_channel_name)));
       
  ])

let delete_stored_query_response_to_yojson = 
  fun (x: delete_stored_query_response) -> assoc_to_yojson(
    [
  ])

let delete_stored_query_request_to_yojson = 
  fun (x: delete_stored_query_request) -> assoc_to_yojson(
    [(
         "QueryName",
         (Some (query_name_to_yojson x.query_name)));
       
  ])

let delete_retention_configuration_request_to_yojson = 
  fun (x: delete_retention_configuration_request) -> assoc_to_yojson(
    [(
         "RetentionConfigurationName",
         (Some (retention_configuration_name_to_yojson x.retention_configuration_name)));
       
  ])

let delete_resource_config_request_to_yojson = 
  fun (x: delete_resource_config_request) -> assoc_to_yojson(
    [(
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       (
         "ResourceType",
         (Some (resource_type_string_to_yojson x.resource_type)));
       
  ])

let no_such_remediation_exception_exception_to_yojson = 
  fun (x: no_such_remediation_exception_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let failed_delete_remediation_exceptions_batch_to_yojson = 
  fun (x: failed_delete_remediation_exceptions_batch) -> assoc_to_yojson(
    [(
         "FailedItems",
         (option_to_yojson remediation_exception_resource_keys_to_yojson x.failed_items));
       (
         "FailureMessage",
         (option_to_yojson string__to_yojson x.failure_message));
       
  ])

let failed_delete_remediation_exceptions_batches_to_yojson = 
  fun tree -> list_to_yojson failed_delete_remediation_exceptions_batch_to_yojson tree

let delete_remediation_exceptions_response_to_yojson = 
  fun (x: delete_remediation_exceptions_response) -> assoc_to_yojson(
    [(
         "FailedBatches",
         (option_to_yojson failed_delete_remediation_exceptions_batches_to_yojson x.failed_batches));
       
  ])

let delete_remediation_exceptions_request_to_yojson = 
  fun (x: delete_remediation_exceptions_request) -> assoc_to_yojson(
    [(
         "ResourceKeys",
         (Some (remediation_exception_resource_keys_to_yojson x.resource_keys)));
       (
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       
  ])

let remediation_in_progress_exception_to_yojson = 
  fun (x: remediation_in_progress_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let delete_remediation_configuration_response_to_yojson = 
  fun (x: delete_remediation_configuration_response) -> assoc_to_yojson(
    [
  ])

let delete_remediation_configuration_request_to_yojson = 
  fun (x: delete_remediation_configuration_request) -> assoc_to_yojson(
    [(
         "ResourceType",
         (option_to_yojson string__to_yojson x.resource_type));
       (
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       
  ])

let delete_pending_aggregation_request_request_to_yojson = 
  fun (x: delete_pending_aggregation_request_request) -> assoc_to_yojson(
    [(
         "RequesterAwsRegion",
         (Some (aws_region_to_yojson x.requester_aws_region)));
       (
         "RequesterAccountId",
         (Some (account_id_to_yojson x.requester_account_id)));
       
  ])

let delete_organization_conformance_pack_request_to_yojson = 
  fun (x: delete_organization_conformance_pack_request) -> assoc_to_yojson(
    [(
         "OrganizationConformancePackName",
         (Some (organization_conformance_pack_name_to_yojson x.organization_conformance_pack_name)));
       
  ])

let delete_organization_config_rule_request_to_yojson = 
  fun (x: delete_organization_config_rule_request) -> assoc_to_yojson(
    [(
         "OrganizationConfigRuleName",
         (Some (organization_config_rule_name_to_yojson x.organization_config_rule_name)));
       
  ])

let delete_evaluation_results_response_to_yojson = 
  fun (x: delete_evaluation_results_response) -> assoc_to_yojson(
    [
  ])

let delete_evaluation_results_request_to_yojson = 
  fun (x: delete_evaluation_results_request) -> assoc_to_yojson(
    [(
         "ConfigRuleName",
         (Some (string_with_char_limit64_to_yojson x.config_rule_name)));
       
  ])

let last_delivery_channel_delete_failed_exception_to_yojson = 
  fun (x: last_delivery_channel_delete_failed_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson error_message_to_yojson x.message));
       
  ])

let delete_delivery_channel_request_to_yojson = 
  fun (x: delete_delivery_channel_request) -> assoc_to_yojson(
    [(
         "DeliveryChannelName",
         (Some (channel_name_to_yojson x.delivery_channel_name)));
       
  ])

let delete_conformance_pack_request_to_yojson = 
  fun (x: delete_conformance_pack_request) -> assoc_to_yojson(
    [(
         "ConformancePackName",
         (Some (conformance_pack_name_to_yojson x.conformance_pack_name)));
       
  ])

let delete_configuration_recorder_request_to_yojson = 
  fun (x: delete_configuration_recorder_request) -> assoc_to_yojson(
    [(
         "ConfigurationRecorderName",
         (Some (recorder_name_to_yojson x.configuration_recorder_name)));
       
  ])

let delete_configuration_aggregator_request_to_yojson = 
  fun (x: delete_configuration_aggregator_request) -> assoc_to_yojson(
    [(
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let delete_config_rule_request_to_yojson = 
  fun (x: delete_config_rule_request) -> assoc_to_yojson(
    [(
         "ConfigRuleName",
         (Some (config_rule_name_to_yojson x.config_rule_name)));
       
  ])

let delete_aggregation_authorization_request_to_yojson = 
  fun (x: delete_aggregation_authorization_request) -> assoc_to_yojson(
    [(
         "AuthorizedAwsRegion",
         (Some (aws_region_to_yojson x.authorized_aws_region)));
       (
         "AuthorizedAccountId",
         (Some (account_id_to_yojson x.authorized_account_id)));
       
  ])

let base_configuration_item_to_yojson = 
  fun (x: base_configuration_item) -> assoc_to_yojson(
    [(
         "configurationItemDeliveryTime",
         (option_to_yojson configuration_item_delivery_time_to_yojson x.configuration_item_delivery_time));
       (
         "recordingFrequency",
         (option_to_yojson recording_frequency_to_yojson x.recording_frequency));
       (
         "supplementaryConfiguration",
         (option_to_yojson supplementary_configuration_to_yojson x.supplementary_configuration));
       (
         "configuration",
         (option_to_yojson configuration_to_yojson x.configuration));
       (
         "resourceCreationTime",
         (option_to_yojson resource_creation_time_to_yojson x.resource_creation_time));
       (
         "availabilityZone",
         (option_to_yojson availability_zone_to_yojson x.availability_zone));
       (
         "awsRegion",
         (option_to_yojson aws_region_to_yojson x.aws_region));
       (
         "resourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       (
         "resourceId",
         (option_to_yojson resource_id_to_yojson x.resource_id));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "arn",
         (option_to_yojson ar_n_to_yojson x.arn));
       (
         "configurationStateId",
         (option_to_yojson configuration_state_id_to_yojson x.configuration_state_id));
       (
         "configurationItemStatus",
         (option_to_yojson configuration_item_status_to_yojson x.configuration_item_status));
       (
         "configurationItemCaptureTime",
         (option_to_yojson configuration_item_capture_time_to_yojson x.configuration_item_capture_time));
       (
         "accountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       (
         "version",
         (option_to_yojson version_to_yojson x.version));
       
  ])

let base_configuration_items_to_yojson = 
  fun tree -> list_to_yojson base_configuration_item_to_yojson tree

let batch_get_resource_config_response_to_yojson = 
  fun (x: batch_get_resource_config_response) -> assoc_to_yojson(
    [(
         "unprocessedResourceKeys",
         (option_to_yojson resource_keys_to_yojson x.unprocessed_resource_keys));
       (
         "baseConfigurationItems",
         (option_to_yojson base_configuration_items_to_yojson x.base_configuration_items));
       
  ])

let batch_get_resource_config_request_to_yojson = 
  fun (x: batch_get_resource_config_request) -> assoc_to_yojson(
    [(
         "resourceKeys",
         (Some (resource_keys_to_yojson x.resource_keys)));
       
  ])

let batch_get_aggregate_resource_config_response_to_yojson = 
  fun (x: batch_get_aggregate_resource_config_response) -> assoc_to_yojson(
    [(
         "UnprocessedResourceIdentifiers",
         (option_to_yojson unprocessed_resource_identifier_list_to_yojson x.unprocessed_resource_identifiers));
       (
         "BaseConfigurationItems",
         (option_to_yojson base_configuration_items_to_yojson x.base_configuration_items));
       
  ])

let resource_identifiers_list_to_yojson = 
  fun tree -> list_to_yojson aggregate_resource_identifier_to_yojson tree

let batch_get_aggregate_resource_config_request_to_yojson = 
  fun (x: batch_get_aggregate_resource_config_request) -> assoc_to_yojson(
    [(
         "ResourceIdentifiers",
         (Some (resource_identifiers_list_to_yojson x.resource_identifiers)));
       (
         "ConfigurationAggregatorName",
         (Some (configuration_aggregator_name_to_yojson x.configuration_aggregator_name)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

