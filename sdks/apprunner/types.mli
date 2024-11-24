open Smaws_Lib
val service : Service.descriptor

(**{|
    Provides summary information about an VPC Ingress Connection, which
    includes its VPC Ingress Connection ARN and its associated Service ARN.|}*)
type vpc_ingress_connection_summary = {
  service_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the service associated with the VPC
    Ingress Connection.|}*)

  vpc_ingress_connection_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the VPC Ingress Connection.|}*)

}

type vpc_ingress_connection_status = | DELETED
  | FAILED_DELETION
  | FAILED_UPDATE
  | FAILED_CREATION
  | PENDING_DELETION
  | PENDING_UPDATE
  | PENDING_CREATION
  | AVAILABLE

(**{|
    The configuration of your VPC and the associated VPC endpoint. The VPC
    endpoint is an Amazon Web Services PrivateLink resource that allows
    access to your App Runner services from within an Amazon VPC.|}*)
type ingress_vpc_configuration = {
  vpc_endpoint_id: string option;
   (**{|
    The ID of the VPC endpoint that your App Runner service connects to.|}*)

  vpc_id: string option;
   (**{|
    The ID of the VPC that is used for the VPC endpoint.|}*)

}

(**{|
    The App Runner resource that specifies an App Runner endpoint for
    incoming traffic. It establishes a connection between a VPC interface
    endpoint and a App Runner service, to make your App Runner service
    accessible from only within an Amazon VPC.|}*)
type vpc_ingress_connection = {
  deleted_at: float option;
   (**{|
    The time when the App Runner service was deleted. It's in the Unix time
    stamp format.
    
    {ol 
          {- Type: Timestamp
             }
          
          {- Required: No
             }
          
    }
    |}*)

  created_at: float option;
   (**{|
    The time when the VPC Ingress Connection was created. It's in the Unix
    time stamp format.
    
    {ol 
          {- Type: Timestamp
             }
          
          {- Required: Yes
             }
          
    }
    |}*)

  ingress_vpc_configuration: ingress_vpc_configuration option;
   (**{|
    Specifications for the customer’s VPC and related PrivateLink VPC
    endpoint that are used to associate with the VPC Ingress Connection
    resource.|}*)

  domain_name: string option;
   (**{|
    The domain name associated with the VPC Ingress Connection resource.|}*)

  account_id: string option;
   (**{|
    The Account Id you use to create the VPC Ingress Connection resource.|}*)

  status: vpc_ingress_connection_status option;
   (**{|
    The current status of the VPC Ingress Connection. The VPC Ingress
    Connection displays one of the following statuses: [AVAILABLE],
    [PENDING_CREATION], [PENDING_UPDATE],
    [PENDING_DELETION],[FAILED_CREATION], [FAILED_UPDATE], [FAILED_DELETION],
    and [DELETED]..|}*)

  service_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the service associated with the VPC
    Ingress Connection.|}*)

  vpc_ingress_connection_name: string option;
   (**{|
    The customer-provided VPC Ingress Connection name.|}*)

  vpc_ingress_connection_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the VPC Ingress Connection.|}*)

}

(**{|
    DNS Target record for a custom domain of this Amazon VPC.|}*)
type vpc_dns_target = {
  domain_name: string option;
   (**{|
    The domain name of your target DNS that is associated with the Amazon VPC.|}*)

  vpc_id: string option;
   (**{|
    The ID of the Amazon VPC that is associated with the custom domain name
    of the target DNS.|}*)

  vpc_ingress_connection_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the VPC Ingress Connection that is
    associated with your service.|}*)

}

type vpc_connector_status = | INACTIVE
  | ACTIVE

(**{|
    Describes an App Runner VPC connector resource. A VPC connector describes
    the Amazon Virtual Private Cloud (Amazon VPC) that an App Runner service
    is associated with, and the subnets and security group that are used.
    
    Multiple revisions of a connector might have the same [Name] and
    different [Revision] values.
    
    At this time, App Runner supports only one revision per name.
    |}*)
type vpc_connector = {
  deleted_at: float option;
   (**{|
    The time when the VPC connector was deleted. It's in Unix time stamp
    format.|}*)

  created_at: float option;
   (**{|
    The time when the VPC connector was created. It's in Unix time stamp
    format.|}*)

  status: vpc_connector_status option;
   (**{|
    The current state of the VPC connector. If the status of a connector
    revision is [INACTIVE], it was deleted and can't be used. Inactive
    connector revisions are permanently removed some time after they are
    deleted.|}*)

  security_groups: string list option;
   (**{|
    A list of IDs of security groups that App Runner uses for access to
    Amazon Web Services resources under the specified subnets. If not
    specified, App Runner uses the default security group of the Amazon VPC.
    The default security group allows all outbound traffic.|}*)

  subnets: string list option;
   (**{|
    A list of IDs of subnets that App Runner uses for your service. All IDs
    are of subnets of a single Amazon VPC.|}*)

  vpc_connector_revision: int option;
   (**{|
    The revision of this VPC connector. It's unique among all the active
    connectors (["Status": "ACTIVE"]) that share the same [Name].
    
    At this time, App Runner supports only one revision per name.
    |}*)

  vpc_connector_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of this VPC connector.|}*)

  vpc_connector_name: string option;
   (**{|
    The customer-provided VPC connector name.|}*)

}

type update_vpc_ingress_connection_response = {
  vpc_ingress_connection: vpc_ingress_connection;
   (**{|
    A description of the App Runner VPC Ingress Connection resource that's
    updated by this request.|}*)

}

type update_vpc_ingress_connection_request = {
  ingress_vpc_configuration: ingress_vpc_configuration;
   (**{|
    Specifications for the customer’s Amazon VPC and the related Amazon Web
    Services PrivateLink VPC endpoint that are used to update the VPC Ingress
    Connection resource.|}*)

  vpc_ingress_connection_arn: string;
   (**{|
    The Amazon Resource Name (Arn) for the App Runner VPC Ingress Connection
    resource that you want to update.|}*)

}

(**{|
    A resource doesn't exist for the specified Amazon Resource Name (ARN) in
    your Amazon Web Services account.|}*)
type resource_not_found_exception = {
  message: string option;
  
}

(**{|
    You can't perform this action when the resource is in its current state.|}*)
type invalid_state_exception = {
  message: string option;
  
}

(**{|
    One or more input parameters aren't valid. Refer to the API action's
    document page, correct the input parameters, and try the action again.|}*)
type invalid_request_exception = {
  message: string option;
  
}

(**{|
    An unexpected service exception occurred.|}*)
type internal_service_error_exception = {
  message: string option;
  
}

type service_status = | OPERATION_IN_PROGRESS
  | PAUSED
  | DELETE_FAILED
  | DELETED
  | RUNNING
  | CREATE_FAILED

type source_code_version_type = | BRANCH

(**{|
    Identifies a version of code that App Runner refers to within a source
    code repository.|}*)
type source_code_version = {
  value: string;
   (**{|
    A source code version.
    
    For a git-based repository, a branch name maps to a specific version. App
    Runner uses the most recent commit to the branch.|}*)

  type_: source_code_version_type;
   (**{|
    The type of version identifier.
    
    For a git-based repository, branches represent versions.|}*)

}

type configuration_source = | API
  | REPOSITORY

type runtime = | NODEJS_18
  | PYTHON_311
  | RUBY_31
  | PHP_81
  | DOTNET_6
  | GO_1
  | NODEJS_16
  | CORRETTO_11
  | CORRETTO_8
  | NODEJS_14
  | NODEJS_12
  | PYTHON_3

(**{|
    Describes the basic configuration needed for building and running an App
    Runner service. This type doesn't support the full set of possible
    configuration options. Fur full configuration capabilities, use a
    [apprunner.yaml] file in the source code repository.|}*)
type code_configuration_values = {
  runtime_environment_secrets: (string * string) list option;
   (**{|
    An array of key-value pairs representing the secrets and parameters that
    get referenced to your service as an environment variable. The supported
    values are either the full Amazon Resource Name (ARN) of the Secrets
    Manager secret or the full ARN of the parameter in the Amazon Web
    Services Systems Manager Parameter Store.
    
    {ol 
          {- If the Amazon Web Services Systems Manager Parameter Store
             parameter exists in the same Amazon Web Services Region as the
             service that you're launching, you can use either the full ARN
             or name of the secret. If the parameter exists in a different
             Region, then the full ARN must be specified.
             }
          
          {- Currently, cross account referencing of Amazon Web Services
             Systems Manager Parameter Store parameter is not supported.
             }
          
    }
    |}*)

  runtime_environment_variables: (string * string) list option;
   (**{|
    The environment variables that are available to your running App Runner
    service. An array of key-value pairs.|}*)

  port: string option;
   (**{|
    The port that your application listens to in the container.
    
    Default: [8080]|}*)

  start_command: string option;
   (**{|
    The command App Runner runs to start your application.|}*)

  build_command: string option;
   (**{|
    The command App Runner runs to build your application.|}*)

  runtime: runtime;
   (**{|
    A runtime environment type for building and running an App Runner
    service. It represents a programming language runtime.|}*)

}

(**{|
    Describes the configuration that App Runner uses to build and run an App
    Runner service from a source code repository.|}*)
type code_configuration = {
  code_configuration_values: code_configuration_values option;
   (**{|
    The basic configuration for building and running the App Runner service.
    Use it to quickly launch an App Runner service without providing a
    [apprunner.yaml] file in the source code repository (or ignoring the file
    if it exists).|}*)

  configuration_source: configuration_source;
   (**{|
    The source of the App Runner configuration. Values are interpreted as
    follows:
    
    {ol 
          {- [REPOSITORY] – App Runner reads configuration values from the
             [apprunner.yaml] file in the source code repository and ignores
             [CodeConfigurationValues].
             }
          
          {- [API] – App Runner uses configuration values provided in
             [CodeConfigurationValues] and ignores the [apprunner.yaml] file
             in the source code repository.
             }
          
    }
    |}*)

}

(**{|
    Describes a source code repository.|}*)
type code_repository = {
  source_directory: string option;
   (**{|
    The path of the directory that stores source code and configuration
    files. The build and start commands also execute from here. The path is
    absolute from root and, if not specified, defaults to the repository
    root.|}*)

  code_configuration: code_configuration option;
   (**{|
    Configuration for building and running the service from a source code
    repository.
    
    [CodeConfiguration] is required only for [CreateService] request.
    |}*)

  source_code_version: source_code_version;
   (**{|
    The version that should be used within the source code repository.|}*)

  repository_url: string;
   (**{|
    The location of the repository that contains the source code.|}*)

}

(**{|
    Describes the configuration that App Runner uses to run an App Runner
    service using an image pulled from a source image repository.|}*)
type image_configuration = {
  runtime_environment_secrets: (string * string) list option;
   (**{|
    An array of key-value pairs representing the secrets and parameters that
    get referenced to your service as an environment variable. The supported
    values are either the full Amazon Resource Name (ARN) of the Secrets
    Manager secret or the full ARN of the parameter in the Amazon Web
    Services Systems Manager Parameter Store.
    
    {ol 
          {- If the Amazon Web Services Systems Manager Parameter Store
             parameter exists in the same Amazon Web Services Region as the
             service that you're launching, you can use either the full ARN
             or name of the secret. If the parameter exists in a different
             Region, then the full ARN must be specified.
             }
          
          {- Currently, cross account referencing of Amazon Web Services
             Systems Manager Parameter Store parameter is not supported.
             }
          
    }
    |}*)

  port: string option;
   (**{|
    The port that your application listens to in the container.
    
    Default: [8080]|}*)

  start_command: string option;
   (**{|
    An optional command that App Runner runs to start the application in the
    source image. If specified, this command overrides the Docker image’s
    default start command.|}*)

  runtime_environment_variables: (string * string) list option;
   (**{|
    Environment variables that are available to your running App Runner
    service. An array of key-value pairs.|}*)

}

type image_repository_type = | ECR_PUBLIC
  | ECR

(**{|
    Describes a source image repository.|}*)
type image_repository = {
  image_repository_type: image_repository_type;
   (**{|
    The type of the image repository. This reflects the repository provider
    and whether the repository is private or public.|}*)

  image_configuration: image_configuration option;
   (**{|
    Configuration for running the identified image.|}*)

  image_identifier: string;
   (**{|
    The identifier of an image.
    
    For an image in Amazon Elastic Container Registry (Amazon ECR), this is
    an image name. For the image name format, see
    {{: https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-pull-ecr-image.html }Pulling
    an image} in the {i Amazon ECR User Guide}.|}*)

}

(**{|
    Describes resources needed to authenticate access to some source
    repositories. The specific resource depends on the repository provider.|}*)
type authentication_configuration = {
  access_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the IAM role that grants the App Runner
    service access to a source repository. It's required for ECR image
    repositories (but not for ECR Public repositories).|}*)

  connection_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner connection that enables
    the App Runner service to connect to a source repository. It's required
    for GitHub code repositories.|}*)

}

(**{|
    Describes the source deployed to an App Runner service. It can be a code
    or an image repository.|}*)
type source_configuration = {
  authentication_configuration: authentication_configuration option;
   (**{|
    Describes the resources that are needed to authenticate access to some
    source repositories.|}*)

  auto_deployments_enabled: bool option;
   (**{|
    If [true], continuous integration from the source repository is enabled
    for the App Runner service. Each repository change (including any source
    code commit or new image version) starts a deployment.
    
    Default: App Runner sets to [false] for a source image that uses an ECR
    Public repository or an ECR repository that's in an Amazon Web Services
    account other than the one that the service is in. App Runner sets to
    [true] in all other cases (which currently include a source code
    repository or a source image using a same-account ECR repository).|}*)

  image_repository: image_repository option;
   (**{|
    The description of a source image repository.
    
    You must provide either this member or [CodeRepository] (but not both).|}*)

  code_repository: code_repository option;
   (**{|
    The description of a source code repository.
    
    You must provide either this member or [ImageRepository] (but not both).|}*)

}

(**{|
    Describes the runtime configuration of an App Runner service instance
    (scaling unit).|}*)
type instance_configuration = {
  instance_role_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an IAM role that provides permissions
    to your App Runner service. These are permissions that your code needs
    when it calls any Amazon Web Services APIs.|}*)

  memory: string option;
   (**{|
    The amount of memory, in MB or GB, reserved for each instance of your App
    Runner service.
    
    Default: [2 GB]|}*)

  cpu: string option;
   (**{|
    The number of CPU units reserved for each instance of your App Runner
    service.
    
    Default: [1 vCPU]|}*)

}

(**{|
    Describes a custom encryption key that App Runner uses to encrypt copies
    of the source repository and service logs.|}*)
type encryption_configuration = {
  kms_key: string;
   (**{|
    The ARN of the KMS key that's used for encryption.|}*)

}

type health_check_protocol = | HTTP
  | TCP

(**{|
    Describes the settings for the health check that App Runner performs to
    monitor the health of a service.|}*)
type health_check_configuration = {
  unhealthy_threshold: int option;
   (**{|
    The number of consecutive checks that must fail before App Runner decides
    that the service is unhealthy.
    
    Default: [5]|}*)

  healthy_threshold: int option;
   (**{|
    The number of consecutive checks that must succeed before App Runner
    decides that the service is healthy.
    
    Default: [1]|}*)

  timeout: int option;
   (**{|
    The time, in seconds, to wait for a health check response before deciding
    it failed.
    
    Default: [2]|}*)

  interval: int option;
   (**{|
    The time interval, in seconds, between health checks.
    
    Default: [5]|}*)

  path: string option;
   (**{|
    The URL that health check requests are sent to.
    
    [Path] is only applicable when you set [Protocol] to [HTTP].
    
    Default: ["/"]|}*)

  protocol: health_check_protocol option;
   (**{|
    The IP protocol that App Runner uses to perform health checks for your
    service.
    
    If you set [Protocol] to [HTTP], App Runner sends health check requests
    to the HTTP path specified by [Path].
    
    Default: [TCP]|}*)

}

type auto_scaling_configuration_status = | INACTIVE
  | ACTIVE

(**{|
    Provides summary information about an App Runner automatic scaling
    configuration resource.
    
    This type contains limited information about an auto scaling
    configuration. It includes only identification information, without
    configuration details. It's returned by the
    {{:  }ListAutoScalingConfigurations} action. Complete configuration
    information is returned by the {{:  }CreateAutoScalingConfiguration},
    {{:  }DescribeAutoScalingConfiguration}, and
    {{:  }DeleteAutoScalingConfiguration} actions using the
    {{:  }AutoScalingConfiguration} type.|}*)
type auto_scaling_configuration_summary = {
  is_default: bool option;
   (**{|
    Indicates if this auto scaling configuration should be used as the
    default for a new App Runner service that does not have an auto scaling
    configuration ARN specified during creation. Each account can have only
    one default [AutoScalingConfiguration] per region. The default
    [AutoScalingConfiguration] can be any revision under the same
    [AutoScalingConfigurationName].|}*)

  has_associated_service: bool option;
   (**{|
    Indicates if this auto scaling configuration has an App Runner service
    associated with it. A value of [true] indicates one or more services are
    associated. A value of [false] indicates no services are associated.|}*)

  created_at: float option;
   (**{|
    The time when the auto scaling configuration was created. It's in Unix
    time stamp format.|}*)

  status: auto_scaling_configuration_status option;
   (**{|
    The current state of the auto scaling configuration. If the status of a
    configuration revision is [INACTIVE], it was deleted and can't be used.
    Inactive configuration revisions are permanently removed some time after
    they are deleted.|}*)

  auto_scaling_configuration_revision: int option;
   (**{|
    The revision of this auto scaling configuration. It's unique among all
    the active configurations (["Status": "ACTIVE"]) with the same
    [AutoScalingConfigurationName].|}*)

  auto_scaling_configuration_name: string option;
   (**{|
    The customer-provided auto scaling configuration name. It can be used in
    multiple revisions of a configuration.|}*)

  auto_scaling_configuration_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of this auto scaling configuration.|}*)

}

type egress_type = | VPC
  | DEFAULT

(**{|
    Describes configuration settings related to outbound network traffic of
    an App Runner service.|}*)
type egress_configuration = {
  vpc_connector_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner VPC connector that you
    want to associate with your App Runner service. Only valid when
    [EgressType = VPC].|}*)

  egress_type: egress_type option;
   (**{|
    The type of egress configuration.
    
    Set to [DEFAULT] for access to resources hosted on public networks.
    
    Set to [VPC] to associate your service to a custom VPC specified by
    [VpcConnectorArn].|}*)

}

(**{|
    Network configuration settings for inbound network traffic.|}*)
type ingress_configuration = {
  is_publicly_accessible: bool option;
   (**{|
    Specifies whether your App Runner service is publicly accessible. To make
    the service publicly accessible set it to [True]. To make the service
    privately accessible, from only within an Amazon VPC set it to [False].|}*)

}

type ip_address_type = | DUAL_STACK
  | IPV4

(**{|
    Describes configuration settings related to network traffic of an App
    Runner service. Consists of embedded objects for each configurable
    network feature.|}*)
type network_configuration = {
  ip_address_type: ip_address_type option;
   (**{|
    App Runner provides you with the option to choose between {i Internet
    Protocol version 4 (IPv4)} and {i dual stack} (IPv4 and IPv6) for your
    incoming public network configuration. This is an optional parameter. If
    you do not specify an [IpAddressType], it defaults to select IPv4.
    
    Currently, App Runner supports dual stack for only Public endpoint. Only
    IPv4 is supported for Private endpoint. If you update a service that's
    using dual-stack Public endpoint to a Private endpoint, your App Runner
    service will default to support only IPv4 for Private endpoint and fail
    to receive traffic originating from IPv6 endpoint.
    |}*)

  ingress_configuration: ingress_configuration option;
   (**{|
    Network configuration settings for inbound message traffic.|}*)

  egress_configuration: egress_configuration option;
   (**{|
    Network configuration settings for outbound message traffic.|}*)

}

(**{|
    Describes the observability configuration of an App Runner service. These
    are additional observability features, like tracing, that you choose to
    enable. They're configured in a separate resource that you associate with
    your service.|}*)
type service_observability_configuration = {
  observability_configuration_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the observability configuration that is
    associated with the service. Specified only when [ObservabilityEnabled]
    is [true].
    
    Specify an ARN with a name and a revision number to associate that
    revision. For example:
    [arn:aws:apprunner:us-east-1:123456789012:observabilityconfiguration/xray-tracing/3]
    
    
    Specify just the name to associate the latest revision. For example:
    [arn:aws:apprunner:us-east-1:123456789012:observabilityconfiguration/xray-tracing]
    |}*)

  observability_enabled: bool;
   (**{|
    When [true], an observability configuration resource is associated with
    the service, and an [ObservabilityConfigurationArn] is specified.|}*)

}

(**{|
    Describes an App Runner service. It can describe a service in any state,
    including deleted services.
    
    This type contains the full information about a service, including
    configuration details. It's returned by the
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_CreateService.html }CreateService},
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_DescribeService.html }DescribeService},
    and
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_DeleteService.html }DeleteService}
    actions. A subset of this information is returned by the
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_ListServices.html }ListServices}
    action using the
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_ServiceSummary.html }ServiceSummary}
    type.|}*)
type service = {
  observability_configuration: service_observability_configuration option;
   (**{|
    The observability configuration of this service.|}*)

  network_configuration: network_configuration;
   (**{|
    Configuration settings related to network traffic of the web application
    that this service runs.|}*)

  auto_scaling_configuration_summary: auto_scaling_configuration_summary;
   (**{|
    Summary information for the App Runner automatic scaling configuration
    resource that's associated with this service.|}*)

  health_check_configuration: health_check_configuration option;
   (**{|
    The settings for the health check that App Runner performs to monitor the
    health of this service.|}*)

  encryption_configuration: encryption_configuration option;
   (**{|
    The encryption key that App Runner uses to encrypt the service logs and
    the copy of the source repository that App Runner maintains for the
    service. It can be either a customer-provided encryption key or an Amazon
    Web Services managed key.|}*)

  instance_configuration: instance_configuration;
   (**{|
    The runtime configuration of instances (scaling units) of this service.|}*)

  source_configuration: source_configuration;
   (**{|
    The source deployed to the App Runner service. It can be a code or an
    image repository.|}*)

  status: service_status;
   (**{|
    The current state of the App Runner service. These particular values mean
    the following.
    
    {ol 
          {- [CREATE_FAILED] – The service failed to create. The failed
             service isn't usable, and still counts towards your service
             quota. To troubleshoot this failure, read the failure events and
             logs, change any parameters that need to be fixed, and rebuild
             your service using [UpdateService].
             }
          
          {- [DELETE_FAILED] – The service failed to delete and can't be
             successfully recovered. Retry the service deletion call to
             ensure that all related resources are removed.
             }
          
    }
    |}*)

  deleted_at: float option;
   (**{|
    The time when the App Runner service was deleted. It's in the Unix time
    stamp format.|}*)

  updated_at: float;
   (**{|
    The time when the App Runner service was last updated at. It's in the
    Unix time stamp format.|}*)

  created_at: float;
   (**{|
    The time when the App Runner service was created. It's in the Unix time
    stamp format.|}*)

  service_url: string option;
   (**{|
    A subdomain URL that App Runner generated for this service. You can use
    this URL to access your service web application.|}*)

  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of this service.|}*)

  service_id: string;
   (**{|
    An ID that App Runner generated for this service. It's unique within the
    Amazon Web Services Region.|}*)

  service_name: string;
   (**{|
    The customer-provided service name.|}*)

}

type update_service_response = {
  operation_id: string;
   (**{|
    The unique ID of the asynchronous operation that this request started.
    You can use it combined with the {{:  }ListOperations} call to track the
    operation's progress.|}*)

  service: service;
   (**{|
    A description of the App Runner service updated by this request. All
    configuration values in the returned [Service] structure reflect
    configuration changes that are being applied by this request.|}*)

}

type update_service_request = {
  observability_configuration: service_observability_configuration option;
   (**{|
    The observability configuration of your service.|}*)

  network_configuration: network_configuration option;
   (**{|
    Configuration settings related to network traffic of the web application
    that the App Runner service runs.|}*)

  health_check_configuration: health_check_configuration option;
   (**{|
    The settings for the health check that App Runner performs to monitor the
    health of the App Runner service.|}*)

  auto_scaling_configuration_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an App Runner automatic scaling
    configuration resource that you want to associate with the App Runner
    service.|}*)

  instance_configuration: instance_configuration option;
   (**{|
    The runtime configuration to apply to instances (scaling units) of your
    service.|}*)

  source_configuration: source_configuration option;
   (**{|
    The source configuration to apply to the App Runner service.
    
    You can change the configuration of the code or image repository that the
    service uses. However, you can't switch from code to image or the other
    way around. This means that you must provide the same structure member of
    [SourceConfiguration] that you originally included when you created the
    service. Specifically, you can include either [CodeRepository] or
    [ImageRepository]. To update the source configuration, set the values to
    members of the structure that you include.|}*)

  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that you want to
    update.|}*)

}

(**{|
    Describes an App Runner automatic scaling configuration resource.
    
    A higher [MinSize] increases the spread of your App Runner service over
    more Availability Zones in the Amazon Web Services Region. The tradeoff
    is a higher minimal cost.
    
    A lower [MaxSize] controls your cost. The tradeoff is lower
    responsiveness during peak demand.
    
    Multiple revisions of a configuration might have the same
    [AutoScalingConfigurationName] and different
    [AutoScalingConfigurationRevision] values.|}*)
type auto_scaling_configuration = {
  is_default: bool option;
   (**{|
    Indicates if this auto scaling configuration should be used as the
    default for a new App Runner service that does not have an auto scaling
    configuration ARN specified during creation. Each account can have only
    one default [AutoScalingConfiguration] per region. The default
    [AutoScalingConfiguration] can be any revision under the same
    [AutoScalingConfigurationName].|}*)

  has_associated_service: bool option;
   (**{|
    Indicates if this auto scaling configuration has an App Runner service
    associated with it. A value of [true] indicates one or more services are
    associated. A value of [false] indicates no services are associated.|}*)

  deleted_at: float option;
   (**{|
    The time when the auto scaling configuration was deleted. It's in Unix
    time stamp format.|}*)

  created_at: float option;
   (**{|
    The time when the auto scaling configuration was created. It's in Unix
    time stamp format.|}*)

  max_size: int option;
   (**{|
    The maximum number of instances that a service scales up to. At most
    [MaxSize] instances actively serve traffic for your service.|}*)

  min_size: int option;
   (**{|
    The minimum number of instances that App Runner provisions for a service.
    The service always has at least [MinSize] provisioned instances. Some of
    them actively serve traffic. The rest of them (provisioned and inactive
    instances) are a cost-effective compute capacity reserve and are ready to
    be quickly activated. You pay for memory usage of all the provisioned
    instances. You pay for CPU usage of only the active subset.
    
    App Runner temporarily doubles the number of provisioned instances during
    deployments, to maintain the same capacity for both old and new code.|}*)

  max_concurrency: int option;
   (**{|
    The maximum number of concurrent requests that an instance processes. If
    the number of concurrent requests exceeds this limit, App Runner scales
    the service up.|}*)

  status: auto_scaling_configuration_status option;
   (**{|
    The current state of the auto scaling configuration. If the status of a
    configuration revision is [INACTIVE], it was deleted and can't be used.
    Inactive configuration revisions are permanently removed some time after
    they are deleted.|}*)

  latest: bool option;
   (**{|
    It's set to [true] for the configuration with the highest [Revision]
    among all configurations that share the same
    [AutoScalingConfigurationName]. It's set to [false] otherwise.|}*)

  auto_scaling_configuration_revision: int option;
   (**{|
    The revision of this auto scaling configuration. It's unique among all
    the active configurations (["Status": "ACTIVE"]) that share the same
    [AutoScalingConfigurationName].|}*)

  auto_scaling_configuration_name: string option;
   (**{|
    The customer-provided auto scaling configuration name. It can be used in
    multiple revisions of a configuration.|}*)

  auto_scaling_configuration_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of this auto scaling configuration.|}*)

}

type update_default_auto_scaling_configuration_response = {
  auto_scaling_configuration: auto_scaling_configuration;
   (**{|
    A description of the App Runner auto scaling configuration that was set
    as default.|}*)

}

type update_default_auto_scaling_configuration_request = {
  auto_scaling_configuration_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner auto scaling
    configuration that you want to set as the default.
    
    The ARN can be a full auto scaling configuration ARN, or a partial ARN
    ending with either [.../{i name}] or [.../{i name}/{i revision}]. If a
    revision isn't specified, the latest active revision is set as the
    default.|}*)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
   (**{|
    A list of tag keys that you want to remove.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource that you want to remove
    tags from.
    
    It must be the ARN of an App Runner resource.|}*)

}

type tracing_vendor = | AWSXRAY

(**{|
    Describes the configuration of the tracing feature within an App Runner
    observability configuration.|}*)
type trace_configuration = {
  vendor: tracing_vendor;
   (**{|
    The implementation provider chosen for tracing App Runner services.|}*)

}

type tag_resource_response = unit

(**{|
    Describes a tag that is applied to an App Runner resource. A tag is a
    metadata item consisting of a key-value pair.|}*)
type tag = {
  value: string option;
   (**{|
    The value of the tag.|}*)

  key: string option;
   (**{|
    The key of the tag.|}*)

}

type tag_resource_request = {
  tags: tag list;
   (**{|
    A list of tag key-value pairs to add or update. If a key is new to the
    resource, the tag is added with the provided value. If a key is already
    associated with the resource, the value of the tag is updated.|}*)

  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource that you want to update
    tags for.
    
    It must be the ARN of an App Runner resource.|}*)

}

type start_deployment_response = {
  operation_id: string;
   (**{|
    The unique ID of the asynchronous operation that this request started.
    You can use it combined with the {{:  }ListOperations} call to track the
    operation's progress.|}*)

}

type start_deployment_request = {
  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that you want to
    manually deploy to.|}*)

}

(**{|
    Provides summary information for an App Runner service.
    
    This type contains limited information about a service. It doesn't
    include configuration details. It's returned by the
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_ListServices.html }ListServices}
    action. Complete service information is returned by the
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_CreateService.html }CreateService},
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_DescribeService.html }DescribeService},
    and
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_DeleteService.html }DeleteService}
    actions using the
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_Service.html }Service}
    type.|}*)
type service_summary = {
  status: service_status option;
   (**{|
    The current state of the App Runner service. These particular values mean
    the following.
    
    {ol 
          {- [CREATE_FAILED] – The service failed to create. The failed
             service isn't usable, and still counts towards your service
             quota. To troubleshoot this failure, read the failure events and
             logs, change any parameters that need to be fixed, and rebuild
             your service using [UpdateService].
             }
          
          {- [DELETE_FAILED] – The service failed to delete and can't be
             successfully recovered. Retry the service deletion call to
             ensure that all related resources are removed.
             }
          
    }
    |}*)

  updated_at: float option;
   (**{|
    The time when the App Runner service was last updated. It's in theUnix
    time stamp format.|}*)

  created_at: float option;
   (**{|
    The time when the App Runner service was created. It's in the Unix time
    stamp format.|}*)

  service_url: string option;
   (**{|
    A subdomain URL that App Runner generated for this service. You can use
    this URL to access your service web application.|}*)

  service_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of this service.|}*)

  service_id: string option;
   (**{|
    An ID that App Runner generated for this service. It's unique within the
    Amazon Web Services Region.|}*)

  service_name: string option;
   (**{|
    The customer-provided service name.|}*)

}

(**{|
    App Runner can't create this resource. You've reached your account quota
    for this resource type.
    
    For App Runner per-resource quotas, see
    {{: https://docs.aws.amazon.com/general/latest/gr/apprunner.html }App
    Runner endpoints and quotas} in the {i Amazon Web Services General
    Reference}.|}*)
type service_quota_exceeded_exception = {
  message: string option;
  
}

type resume_service_response = {
  operation_id: string option;
   (**{|
    The unique ID of the asynchronous operation that this request started.
    You can use it combined with the {{:  }ListOperations} call to track the
    operation's progress.|}*)

  service: service;
   (**{|
    A description of the App Runner service that this request just resumed.|}*)

}

type resume_service_request = {
  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that you want to
    resume.|}*)

}

type provider_type = | BITBUCKET
  | GITHUB

type pause_service_response = {
  operation_id: string option;
   (**{|
    The unique ID of the asynchronous operation that this request started.
    You can use it combined with the {{:  }ListOperations} call to track the
    operation's progress.|}*)

  service: service;
   (**{|
    A description of the App Runner service that this request just paused.|}*)

}

type pause_service_request = {
  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that you want to
    pause.|}*)

}

type operation_type = | UPDATE_SERVICE
  | DELETE_SERVICE
  | RESUME_SERVICE
  | PAUSE_SERVICE
  | CREATE_SERVICE
  | START_DEPLOYMENT

type operation_status = | ROLLBACK_SUCCEEDED
  | ROLLBACK_FAILED
  | ROLLBACK_IN_PROGRESS
  | SUCCEEDED
  | FAILED
  | IN_PROGRESS
  | PENDING

(**{|
    Provides summary information for an operation that occurred on an App
    Runner service.|}*)
type operation_summary = {
  updated_at: float option;
   (**{|
    The time when the operation was last updated. It's in the Unix time stamp
    format.|}*)

  ended_at: float option;
   (**{|
    The time when the operation ended. It's in the Unix time stamp format.|}*)

  started_at: float option;
   (**{|
    The time when the operation started. It's in the Unix time stamp format.|}*)

  target_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the resource that the operation acted
    on (for example, an App Runner service).|}*)

  status: operation_status option;
   (**{|
    The current state of the operation.|}*)

  type_: operation_type option;
   (**{|
    The type of operation. It indicates a specific action that occured.|}*)

  id: string option;
   (**{|
    A unique ID of this operation. It's unique in the scope of the App Runner
    service.|}*)

}

(**{|
    Provides summary information about an App Runner observability
    configuration resource.
    
    This type contains limited information about an observability
    configuration. It includes only identification information, without
    configuration details. It's returned by the
    {{:  }ListObservabilityConfigurations} action. Complete configuration
    information is returned by the {{:  }CreateObservabilityConfiguration},
    {{:  }DescribeObservabilityConfiguration}, and
    {{:  }DeleteObservabilityConfiguration} actions using the
    {{:  }ObservabilityConfiguration} type.|}*)
type observability_configuration_summary = {
  observability_configuration_revision: int option;
   (**{|
    The revision of this observability configuration. It's unique among all
    the active configurations (["Status": "ACTIVE"]) that share the same
    [ObservabilityConfigurationName].|}*)

  observability_configuration_name: string option;
   (**{|
    The customer-provided observability configuration name. It can be used in
    multiple revisions of a configuration.|}*)

  observability_configuration_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of this observability configuration.|}*)

}

type observability_configuration_status = | INACTIVE
  | ACTIVE

(**{|
    Describes an App Runner observability configuration resource. Multiple
    revisions of a configuration have the same
    [ObservabilityConfigurationName] and different
    [ObservabilityConfigurationRevision] values.
    
    The resource is designed to configure multiple features (currently one
    feature, tracing). This type contains optional members that describe the
    configuration of these features (currently one member,
    [TraceConfiguration]). If a feature member isn't specified, the feature
    isn't enabled.|}*)
type observability_configuration = {
  deleted_at: float option;
   (**{|
    The time when the observability configuration was deleted. It's in Unix
    time stamp format.|}*)

  created_at: float option;
   (**{|
    The time when the observability configuration was created. It's in Unix
    time stamp format.|}*)

  status: observability_configuration_status option;
   (**{|
    The current state of the observability configuration. If the status of a
    configuration revision is [INACTIVE], it was deleted and can't be used.
    Inactive configuration revisions are permanently removed some time after
    they are deleted.|}*)

  latest: bool option;
   (**{|
    It's set to [true] for the configuration with the highest [Revision]
    among all configurations that share the same
    [ObservabilityConfigurationName]. It's set to [false] otherwise.|}*)

  observability_configuration_revision: int option;
   (**{|
    The revision of this observability configuration. It's unique among all
    the active configurations (["Status": "ACTIVE"]) that share the same
    [ObservabilityConfigurationName].|}*)

  trace_configuration: trace_configuration option;
   (**{|
    The configuration of the tracing feature within this observability
    configuration. If not specified, tracing isn't enabled.|}*)

  observability_configuration_name: string option;
   (**{|
    The customer-provided observability configuration name. It can be used in
    multiple revisions of a configuration.|}*)

  observability_configuration_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of this observability configuration.|}*)

}

type list_vpc_ingress_connections_response = {
  next_token: string option;
   (**{|
    The token that you can pass in a subsequent request to get the next
    result page. It's returned in a paginated request.|}*)

  vpc_ingress_connection_summary_list: vpc_ingress_connection_summary list;
   (**{|
    A list of summary information records for VPC Ingress Connections. In a
    paginated request, the request returns up to [MaxResults] records for
    each call.|}*)

}

(**{|
    Returns a list of VPC Ingress Connections based on the filter provided.
    It can return either [ServiceArn] or [VpcEndpointId], or both.|}*)
type list_vpc_ingress_connections_filter = {
  vpc_endpoint_id: string option;
   (**{|
    The ID of a VPC Endpoint to filter by.|}*)

  service_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of a service to filter by.|}*)

}

type list_vpc_ingress_connections_request = {
  next_token: string option;
   (**{|
    A token from a previous result page. It's used for a paginated request.
    The request retrieves the next result page. All other parameter values
    must be identical to the ones that are specified in the initial request.
    
    If you don't specify [NextToken], the request retrieves the first result
    page.|}*)

  max_results: int option;
   (**{|
    The maximum number of results to include in each response (result page).
    It's used for a paginated request.
    
    If you don't specify [MaxResults], the request retrieves all available
    results in a single response.|}*)

  filter: list_vpc_ingress_connections_filter option;
   (**{|
    The VPC Ingress Connections to be listed based on either the Service Arn
    or Vpc Endpoint Id, or both.|}*)

}

type list_vpc_connectors_response = {
  next_token: string option;
   (**{|
    The token that you can pass in a subsequent request to get the next
    result page. It's returned in a paginated request.|}*)

  vpc_connectors: vpc_connector list;
   (**{|
    A list of information records for VPC connectors. In a paginated request,
    the request returns up to [MaxResults] records for each call.|}*)

}

type list_vpc_connectors_request = {
  next_token: string option;
   (**{|
    A token from a previous result page. It's used for a paginated request.
    The request retrieves the next result page. All other parameter values
    must be identical to the ones that are specified in the initial request.
    
    If you don't specify [NextToken], the request retrieves the first result
    page.|}*)

  max_results: int option;
   (**{|
    The maximum number of results to include in each response (result page).
    It's used for a paginated request.
    
    If you don't specify [MaxResults], the request retrieves all available
    results in a single response.|}*)

}

type list_tags_for_resource_response = {
  tags: tag list option;
   (**{|
    A list of the tag key-value pairs that are associated with the resource.|}*)

}

type list_tags_for_resource_request = {
  resource_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the resource that a tag list is
    requested for.
    
    It must be the ARN of an App Runner resource.|}*)

}

type list_services_response = {
  next_token: string option;
   (**{|
    The token that you can pass in a subsequent request to get the next
    result page. It's returned in a paginated request.|}*)

  service_summary_list: service_summary list;
   (**{|
    A list of service summary information records. In a paginated request,
    the request returns up to [MaxResults] records for each call.|}*)

}

type list_services_request = {
  max_results: int option;
   (**{|
    The maximum number of results to include in each response (result page).
    It's used for a paginated request.
    
    If you don't specify [MaxResults], the request retrieves all available
    results in a single response.|}*)

  next_token: string option;
   (**{|
    A token from a previous result page. Used for a paginated request. The
    request retrieves the next result page. All other parameter values must
    be identical to the ones specified in the initial request.
    
    If you don't specify [NextToken], the request retrieves the first result
    page.|}*)

}

type list_services_for_auto_scaling_configuration_response = {
  next_token: string option;
   (**{|
    The token that you can pass in a subsequent request to get the next
    result page. It's returned in a paginated request.|}*)

  service_arn_list: string list;
   (**{|
    A list of service ARN records. In a paginated request, the request
    returns up to [MaxResults] records for each call.|}*)

}

type list_services_for_auto_scaling_configuration_request = {
  next_token: string option;
   (**{|
    A token from a previous result page. It's used for a paginated request.
    The request retrieves the next result page. All other parameter values
    must be identical to the ones specified in the initial request.
    
    If you don't specify [NextToken], the request retrieves the first result
    page.|}*)

  max_results: int option;
   (**{|
    The maximum number of results to include in each response (result page).
    It's used for a paginated request.
    
    If you don't specify [MaxResults], the request retrieves all available
    results in a single response.|}*)

  auto_scaling_configuration_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner auto scaling
    configuration that you want to list the services for.
    
    The ARN can be a full auto scaling configuration ARN, or a partial ARN
    ending with either [.../{i name}] or [.../{i name}/{i revision}]. If a
    revision isn't specified, the latest active revision is used.|}*)

}

type list_operations_response = {
  next_token: string option;
   (**{|
    The token that you can pass in a subsequent request to get the next
    result page. It's returned in a paginated request.|}*)

  operation_summary_list: operation_summary list option;
   (**{|
    A list of operation summary information records. In a paginated request,
    the request returns up to [MaxResults] records for each call.|}*)

}

type list_operations_request = {
  max_results: int option;
   (**{|
    The maximum number of results to include in each response (result page).
    It's used for a paginated request.
    
    If you don't specify [MaxResults], the request retrieves all available
    results in a single response.|}*)

  next_token: string option;
   (**{|
    A token from a previous result page. It's used for a paginated request.
    The request retrieves the next result page. All other parameter values
    must be identical to the ones specified in the initial request.
    
    If you don't specify [NextToken], the request retrieves the first result
    page.|}*)

  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that you want a
    list of operations for.|}*)

}

type list_observability_configurations_response = {
  next_token: string option;
   (**{|
    The token that you can pass in a subsequent request to get the next
    result page. It's returned in a paginated request.|}*)

  observability_configuration_summary_list: observability_configuration_summary list;
   (**{|
    A list of summary information records for observability configurations.
    In a paginated request, the request returns up to [MaxResults] records
    for each call.|}*)

}

type list_observability_configurations_request = {
  next_token: string option;
   (**{|
    A token from a previous result page. It's used for a paginated request.
    The request retrieves the next result page. All other parameter values
    must be identical to the ones that are specified in the initial request.
    
    If you don't specify [NextToken], the request retrieves the first result
    page.|}*)

  max_results: int option;
   (**{|
    The maximum number of results to include in each response (result page).
    It's used for a paginated request.
    
    If you don't specify [MaxResults], the request retrieves all available
    results in a single response.|}*)

  latest_only: bool option;
   (**{|
    Set to [true] to list only the latest revision for each requested
    configuration name.
    
    Set to [false] to list all revisions for each requested configuration
    name.
    
    Default: [true]|}*)

  observability_configuration_name: string option;
   (**{|
    The name of the App Runner observability configuration that you want to
    list. If specified, App Runner lists revisions that share this name. If
    not specified, App Runner returns revisions of all active configurations.|}*)

}

type connection_status = | DELETED
  | ERROR
  | AVAILABLE
  | PENDING_HANDSHAKE

(**{|
    Provides summary information about an App Runner connection resource.|}*)
type connection_summary = {
  created_at: float option;
   (**{|
    The App Runner connection creation time, expressed as a Unix time stamp.|}*)

  status: connection_status option;
   (**{|
    The current state of the App Runner connection. When the state is
    [AVAILABLE], you can use the connection to create an App Runner service.|}*)

  provider_type: provider_type option;
   (**{|
    The source repository provider.|}*)

  connection_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of this connection.|}*)

  connection_name: string option;
   (**{|
    The customer-provided connection name.|}*)

}

type list_connections_response = {
  next_token: string option;
   (**{|
    The token that you can pass in a subsequent request to get the next
    result page. Returned in a paginated request.|}*)

  connection_summary_list: connection_summary list;
   (**{|
    A list of summary information records for connections. In a paginated
    request, the request returns up to [MaxResults] records for each call.|}*)

}

type list_connections_request = {
  next_token: string option;
   (**{|
    A token from a previous result page. Used for a paginated request. The
    request retrieves the next result page. All other parameter values must
    be identical to the ones specified in the initial request.
    
    If you don't specify [NextToken], the request retrieves the first result
    page.|}*)

  max_results: int option;
   (**{|
    The maximum number of results to include in each response (result page).
    Used for a paginated request.
    
    If you don't specify [MaxResults], the request retrieves all available
    results in a single response.|}*)

  connection_name: string option;
   (**{|
    If specified, only this connection is returned. If not specified, the
    result isn't filtered by name.|}*)

}

type list_auto_scaling_configurations_response = {
  next_token: string option;
   (**{|
    The token that you can pass in a subsequent request to get the next
    result page. It's returned in a paginated request.|}*)

  auto_scaling_configuration_summary_list: auto_scaling_configuration_summary list;
   (**{|
    A list of summary information records for auto scaling configurations. In
    a paginated request, the request returns up to [MaxResults] records for
    each call.|}*)

}

type list_auto_scaling_configurations_request = {
  next_token: string option;
   (**{|
    A token from a previous result page. It's used for a paginated request.
    The request retrieves the next result page. All other parameter values
    must be identical to the ones that are specified in the initial request.
    
    If you don't specify [NextToken], the request retrieves the first result
    page.|}*)

  max_results: int option;
   (**{|
    The maximum number of results to include in each response (result page).
    It's used for a paginated request.
    
    If you don't specify [MaxResults], the request retrieves all available
    results in a single response.|}*)

  latest_only: bool option;
   (**{|
    Set to [true] to list only the latest revision for each requested
    configuration name.
    
    Set to [false] to list all revisions for each requested configuration
    name.
    
    Default: [true]|}*)

  auto_scaling_configuration_name: string option;
   (**{|
    The name of the App Runner auto scaling configuration that you want to
    list. If specified, App Runner lists revisions that share this name. If
    not specified, App Runner returns revisions of all active configurations.|}*)

}

type certificate_validation_record_status = | FAILED
  | SUCCESS
  | PENDING_VALIDATION

(**{|
    Describes a certificate CNAME record to add to your DNS. For more
    information, see
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_AssociateCustomDomain.html }AssociateCustomDomain}.
    |}*)
type certificate_validation_record = {
  status: certificate_validation_record_status option;
   (**{|
    The current state of the certificate CNAME record validation. It should
    change to [SUCCESS] after App Runner completes validation with your DNS.|}*)

  value: string option;
   (**{|
    The certificate CNAME record value.|}*)

  type_: string option;
   (**{|
    The record type, always [CNAME].|}*)

  name: string option;
   (**{|
    The certificate CNAME record name.|}*)

}

type custom_domain_association_status = | BINDING_CERTIFICATE
  | PENDING_CERTIFICATE_DNS_VALIDATION
  | DELETE_FAILED
  | DELETING
  | ACTIVE
  | CREATE_FAILED
  | CREATING

(**{|
    Describes a custom domain that's associated with an App Runner service.|}*)
type custom_domain = {
  status: custom_domain_association_status;
   (**{|
    The current state of the domain name association.|}*)

  certificate_validation_records: certificate_validation_record list option;
   (**{|
    A list of certificate CNAME records that's used for this domain name.|}*)

  enable_www_subdomain: bool;
   (**{|
    When [true], the subdomain [www.{i DomainName}] is associated with the
    App Runner service in addition to the base domain.|}*)

  domain_name: string;
   (**{|
    An associated custom domain endpoint. It can be a root domain (for
    example, [example.com]), a subdomain (for example, [login.example.com] or
    [admin.login.example.com]), or a wildcard (for example, [*.example.com]).|}*)

}

type disassociate_custom_domain_response = {
  vpc_dns_targets: vpc_dns_target list;
   (**{|
    DNS Target records for the custom domains of this Amazon VPC.|}*)

  custom_domain: custom_domain;
   (**{|
    A description of the domain name that's being disassociated.|}*)

  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that a custom
    domain name is disassociated from.|}*)

  dns_target: string;
   (**{|
    The App Runner subdomain of the App Runner service. The disassociated
    custom domain name was mapped to this target name.|}*)

}

type disassociate_custom_domain_request = {
  domain_name: string;
   (**{|
    The domain name that you want to disassociate from the App Runner service.|}*)

  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that you want to
    disassociate a custom domain name from.|}*)

}

type describe_vpc_ingress_connection_response = {
  vpc_ingress_connection: vpc_ingress_connection;
   (**{|
    A description of the App Runner VPC Ingress Connection that you specified
    in this request.|}*)

}

type describe_vpc_ingress_connection_request = {
  vpc_ingress_connection_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner VPC Ingress Connection
    that you want a description for.|}*)

}

type describe_vpc_connector_response = {
  vpc_connector: vpc_connector;
   (**{|
    A description of the App Runner VPC connector that you specified in this
    request.|}*)

}

type describe_vpc_connector_request = {
  vpc_connector_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner VPC connector that you
    want a description for.
    
    The ARN must be a full VPC connector ARN.|}*)

}

type describe_service_response = {
  service: service;
   (**{|
    A full description of the App Runner service that you specified in this
    request.|}*)

}

type describe_service_request = {
  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that you want a
    description for.|}*)

}

type describe_observability_configuration_response = {
  observability_configuration: observability_configuration;
   (**{|
    A full description of the App Runner observability configuration that you
    specified in this request.|}*)

}

type describe_observability_configuration_request = {
  observability_configuration_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner observability
    configuration that you want a description for.
    
    The ARN can be a full observability configuration ARN, or a partial ARN
    ending with either [.../{i name}] or [.../{i name}/{i revision}]. If a
    revision isn't specified, the latest active revision is described.|}*)

}

type describe_custom_domains_response = {
  next_token: string option;
   (**{|
    The token that you can pass in a subsequent request to get the next
    result page. It's returned in a paginated request.|}*)

  vpc_dns_targets: vpc_dns_target list;
   (**{|
    DNS Target records for the custom domains of this Amazon VPC.|}*)

  custom_domains: custom_domain list;
   (**{|
    A list of descriptions of custom domain names that are associated with
    the service. In a paginated request, the request returns up to
    [MaxResults] records per call.|}*)

  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service whose associated
    custom domain names you want to describe.|}*)

  dns_target: string;
   (**{|
    The App Runner subdomain of the App Runner service. The associated custom
    domain names are mapped to this target name.|}*)

}

type describe_custom_domains_request = {
  max_results: int option;
   (**{|
    The maximum number of results that each response (result page) can
    include. It's used for a paginated request.
    
    If you don't specify [MaxResults], the request retrieves all available
    results in a single response.|}*)

  next_token: string option;
   (**{|
    A token from a previous result page. It's used for a paginated request.
    The request retrieves the next result page. All other parameter values
    must be identical to the ones that are specified in the initial request.
    
    If you don't specify [NextToken], the request retrieves the first result
    page.|}*)

  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that you want
    associated custom domain names to be described for.|}*)

}

type describe_auto_scaling_configuration_response = {
  auto_scaling_configuration: auto_scaling_configuration;
   (**{|
    A full description of the App Runner auto scaling configuration that you
    specified in this request.|}*)

}

type describe_auto_scaling_configuration_request = {
  auto_scaling_configuration_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner auto scaling
    configuration that you want a description for.
    
    The ARN can be a full auto scaling configuration ARN, or a partial ARN
    ending with either [.../{i name}] or [.../{i name}/{i revision}]. If a
    revision isn't specified, the latest active revision is described.|}*)

}

type delete_vpc_ingress_connection_response = {
  vpc_ingress_connection: vpc_ingress_connection;
   (**{|
    A description of the App Runner VPC Ingress Connection that this request
    just deleted.|}*)

}

type delete_vpc_ingress_connection_request = {
  vpc_ingress_connection_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner VPC Ingress Connection
    that you want to delete.|}*)

}

type delete_vpc_connector_response = {
  vpc_connector: vpc_connector;
   (**{|
    A description of the App Runner VPC connector that this request just
    deleted.|}*)

}

type delete_vpc_connector_request = {
  vpc_connector_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner VPC connector that you
    want to delete.
    
    The ARN must be a full VPC connector ARN.|}*)

}

type delete_service_response = {
  operation_id: string;
   (**{|
    The unique ID of the asynchronous operation that this request started.
    You can use it combined with the {{:  }ListOperations} call to track the
    operation's progress.|}*)

  service: service;
   (**{|
    A description of the App Runner service that this request just deleted.|}*)

}

type delete_service_request = {
  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that you want to
    delete.|}*)

}

type delete_observability_configuration_response = {
  observability_configuration: observability_configuration;
   (**{|
    A description of the App Runner observability configuration that this
    request just deleted.|}*)

}

type delete_observability_configuration_request = {
  observability_configuration_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner observability
    configuration that you want to delete.
    
    The ARN can be a full observability configuration ARN, or a partial ARN
    ending with either [.../{i name}] or [.../{i name}/{i revision}]. If a
    revision isn't specified, the latest active revision is deleted.|}*)

}

(**{|
    Describes an App Runner connection resource.|}*)
type connection = {
  created_at: float option;
   (**{|
    The App Runner connection creation time, expressed as a Unix time stamp.|}*)

  status: connection_status option;
   (**{|
    The current state of the App Runner connection. When the state is
    [AVAILABLE], you can use the connection to create an App Runner service.|}*)

  provider_type: provider_type option;
   (**{|
    The source repository provider.|}*)

  connection_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of this connection.|}*)

  connection_name: string option;
   (**{|
    The customer-provided connection name.|}*)

}

type delete_connection_response = {
  connection: connection option;
   (**{|
    A description of the App Runner connection that this request just deleted.|}*)

}

type delete_connection_request = {
  connection_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner connection that you want
    to delete.|}*)

}

type delete_auto_scaling_configuration_response = {
  auto_scaling_configuration: auto_scaling_configuration;
   (**{|
    A description of the App Runner auto scaling configuration that this
    request just deleted.|}*)

}

type delete_auto_scaling_configuration_request = {
  delete_all_revisions: bool option;
   (**{|
    Set to [true] to delete all of the revisions associated with the
    [AutoScalingConfigurationArn] parameter value.
    
    When [DeleteAllRevisions] is set to [true], the only valid value for the
    Amazon Resource Name (ARN) is a partial ARN ending with: [.../name].|}*)

  auto_scaling_configuration_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner auto scaling
    configuration that you want to delete.
    
    The ARN can be a full auto scaling configuration ARN, or a partial ARN
    ending with either [.../{i name}] or [.../{i name}/{i revision}]. If a
    revision isn't specified, the latest active revision is deleted.|}*)

}

type create_vpc_ingress_connection_response = {
  vpc_ingress_connection: vpc_ingress_connection;
   (**{|
    A description of the App Runner VPC Ingress Connection resource that's
    created by this request.|}*)

}

type create_vpc_ingress_connection_request = {
  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the VPC
    Ingress Connection resource. A tag is a key-value pair.|}*)

  ingress_vpc_configuration: ingress_vpc_configuration;
   (**{|
    Specifications for the customer’s Amazon VPC and the related Amazon Web
    Services PrivateLink VPC endpoint that are used to create the VPC Ingress
    Connection resource.|}*)

  vpc_ingress_connection_name: string;
   (**{|
    A name for the VPC Ingress Connection resource. It must be unique across
    all the active VPC Ingress Connections in your Amazon Web Services
    account in the Amazon Web Services Region.|}*)

  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) for this App Runner service that is used
    to create the VPC Ingress Connection resource.|}*)

}

type create_vpc_connector_response = {
  vpc_connector: vpc_connector;
   (**{|
    A description of the App Runner VPC connector that's created by this
    request.|}*)

}

type create_vpc_connector_request = {
  tags: tag list option;
   (**{|
    A list of metadata items that you can associate with your VPC connector
    resource. A tag is a key-value pair.|}*)

  security_groups: string list option;
   (**{|
    A list of IDs of security groups that App Runner should use for access to
    Amazon Web Services resources under the specified subnets. If not
    specified, App Runner uses the default security group of the Amazon VPC.
    The default security group allows all outbound traffic.|}*)

  subnets: string list;
   (**{|
    A list of IDs of subnets that App Runner should use when it associates
    your service with a custom Amazon VPC. Specify IDs of subnets of a single
    Amazon VPC. App Runner determines the Amazon VPC from the subnets you
    specify.
    
    App Runner currently only provides support for IPv4.
    |}*)

  vpc_connector_name: string;
   (**{|
    A name for the VPC connector.|}*)

}

type create_service_response = {
  operation_id: string;
   (**{|
    The unique ID of the asynchronous operation that this request started.
    You can use it combined with the
    {{: https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html }ListOperations}
    call to track the operation's progress.|}*)

  service: service;
   (**{|
    A description of the App Runner service that's created by this request.|}*)

}

type create_service_request = {
  observability_configuration: service_observability_configuration option;
   (**{|
    The observability configuration of your service.|}*)

  network_configuration: network_configuration option;
   (**{|
    Configuration settings related to network traffic of the web application
    that the App Runner service runs.|}*)

  auto_scaling_configuration_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of an App Runner automatic scaling
    configuration resource that you want to associate with your service. If
    not provided, App Runner associates the latest revision of a default auto
    scaling configuration.
    
    Specify an ARN with a name and a revision number to associate that
    revision. For example:
    [arn:aws:apprunner:us-east-1:123456789012:autoscalingconfiguration/high-availability/3]
    
    
    Specify just the name to associate the latest revision. For example:
    [arn:aws:apprunner:us-east-1:123456789012:autoscalingconfiguration/high-availability]
    |}*)

  health_check_configuration: health_check_configuration option;
   (**{|
    The settings for the health check that App Runner performs to monitor the
    health of the App Runner service.|}*)

  encryption_configuration: encryption_configuration option;
   (**{|
    An optional custom encryption key that App Runner uses to encrypt the
    copy of your source repository that it maintains and your service logs.
    By default, App Runner uses an Amazon Web Services managed key.|}*)

  tags: tag list option;
   (**{|
    An optional list of metadata items that you can associate with the App
    Runner service resource. A tag is a key-value pair.|}*)

  instance_configuration: instance_configuration option;
   (**{|
    The runtime configuration of instances (scaling units) of your service.|}*)

  source_configuration: source_configuration;
   (**{|
    The source to deploy to the App Runner service. It can be a code or an
    image repository.|}*)

  service_name: string;
   (**{|
    A name for the App Runner service. It must be unique across all the
    running App Runner services in your Amazon Web Services account in the
    Amazon Web Services Region.|}*)

}

type create_observability_configuration_response = {
  observability_configuration: observability_configuration;
   (**{|
    A description of the App Runner observability configuration that's
    created by this request.|}*)

}

type create_observability_configuration_request = {
  tags: tag list option;
   (**{|
    A list of metadata items that you can associate with your observability
    configuration resource. A tag is a key-value pair.|}*)

  trace_configuration: trace_configuration option;
   (**{|
    The configuration of the tracing feature within this observability
    configuration. If you don't specify it, App Runner doesn't enable
    tracing.|}*)

  observability_configuration_name: string;
   (**{|
    A name for the observability configuration. When you use it for the first
    time in an Amazon Web Services Region, App Runner creates revision number
    [1] of this name. When you use the same name in subsequent calls, App
    Runner creates incremental revisions of the configuration.
    
    The name [DefaultConfiguration] is reserved. You can't use it to create a
    new observability configuration, and you can't create a revision of it.
    
    When you want to use your own observability configuration for your App
    Runner service, {i create a configuration with a different name}, and
    then provide it when you create or update your service.
    |}*)

}

type create_connection_response = {
  connection: connection;
   (**{|
    A description of the App Runner connection that's created by this request.|}*)

}

type create_connection_request = {
  tags: tag list option;
   (**{|
    A list of metadata items that you can associate with your connection
    resource. A tag is a key-value pair.|}*)

  provider_type: provider_type;
   (**{|
    The source repository provider.|}*)

  connection_name: string;
   (**{|
    A name for the new connection. It must be unique across all App Runner
    connections for the Amazon Web Services account in the Amazon Web
    Services Region.|}*)

}

type create_auto_scaling_configuration_response = {
  auto_scaling_configuration: auto_scaling_configuration;
   (**{|
    A description of the App Runner auto scaling configuration that's created
    by this request.|}*)

}

type create_auto_scaling_configuration_request = {
  tags: tag list option;
   (**{|
    A list of metadata items that you can associate with your auto scaling
    configuration resource. A tag is a key-value pair.|}*)

  max_size: int option;
   (**{|
    The maximum number of instances that your service scales up to. At most
    [MaxSize] instances actively serve traffic for your service.
    
    Default: [25]|}*)

  min_size: int option;
   (**{|
    The minimum number of instances that App Runner provisions for your
    service. The service always has at least [MinSize] provisioned instances.
    Some of them actively serve traffic. The rest of them (provisioned and
    inactive instances) are a cost-effective compute capacity reserve and are
    ready to be quickly activated. You pay for memory usage of all the
    provisioned instances. You pay for CPU usage of only the active subset.
    
    App Runner temporarily doubles the number of provisioned instances during
    deployments, to maintain the same capacity for both old and new code.
    
    Default: [1]|}*)

  max_concurrency: int option;
   (**{|
    The maximum number of concurrent requests that you want an instance to
    process. If the number of concurrent requests exceeds this limit, App
    Runner scales up your service.
    
    Default: [100]|}*)

  auto_scaling_configuration_name: string;
   (**{|
    A name for the auto scaling configuration. When you use it for the first
    time in an Amazon Web Services Region, App Runner creates revision number
    [1] of this name. When you use the same name in subsequent calls, App
    Runner creates incremental revisions of the configuration.
    
    Prior to the release of
    {{: https://docs.aws.amazon.com/apprunner/latest/relnotes/release-2023-09-22-auto-scale-config.html }Auto
    scale configuration enhancements}, the name [DefaultConfiguration] was
    reserved.
    
    This restriction is no longer in place. You can now manage
    [DefaultConfiguration] the same way you manage your custom auto scaling
    configurations. This means you can do the following with the
    [DefaultConfiguration] that App Runner provides:
    
    {ol 
          {- Create new revisions of the [DefaultConfiguration].
             }
          
          {- Delete the revisions of the [DefaultConfiguration].
             }
          
          {- Delete the auto scaling configuration for which the App Runner
             [DefaultConfiguration] was created.
             }
          
          {- If you delete the auto scaling configuration you can create
             another custom auto scaling configuration with the same
             [DefaultConfiguration] name. The original [DefaultConfiguration]
             resource provided by App Runner remains in your account unless
             you make changes to it.
             }
          
    }
    |}*)

}

type associate_custom_domain_response = {
  vpc_dns_targets: vpc_dns_target list;
   (**{|
    DNS Target records for the custom domains of this Amazon VPC.|}*)

  custom_domain: custom_domain;
   (**{|
    A description of the domain name that's being associated.|}*)

  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service with which a
    custom domain name is associated.|}*)

  dns_target: string;
   (**{|
    The App Runner subdomain of the App Runner service. The custom domain
    name is mapped to this target name.|}*)

}

type associate_custom_domain_request = {
  enable_www_subdomain: bool option;
   (**{|
    Set to [true] to associate the subdomain [www.{i DomainName}] with the
    App Runner service in addition to the base domain.
    
    Default: [true]|}*)

  domain_name: string;
   (**{|
    A custom domain endpoint to associate. Specify a root domain (for
    example, [example.com]), a subdomain (for example, [login.example.com] or
    [admin.login.example.com]), or a wildcard (for example, [*.example.com]).|}*)

  service_arn: string;
   (**{|
    The Amazon Resource Name (ARN) of the App Runner service that you want to
    associate a custom domain name with.|}*)

}

(**{|
    App
    Runner
    App Runner is an application service that provides a fast, simple, and
    cost-effective way to go directly from an existing container image or
    source code to a running service in the Amazon Web Services Cloud in
    seconds. You don't need to learn new technologies, decide which compute
    service to use, or understand how to provision and configure Amazon Web
    Services resources.
    
    App Runner connects directly to your container registry or source code
    repository. It provides an automatic delivery pipeline with fully managed
    operations, high performance, scalability, and security.
    
    For more information about App Runner, see the
    {{: https://docs.aws.amazon.com/apprunner/latest/dg/ }App Runner
    Developer Guide}. For release information, see the
    {{: https://docs.aws.amazon.com/apprunner/latest/relnotes/ }App Runner
    Release Notes}.
    
    To install the Software Development Kits (SDKs), Integrated Development
    Environment (IDE) Toolkits, and command line tools that you can use to
    access the API, see {{: http://aws.amazon.com/tools/ }Tools for Amazon
    Web Services}.
    
    {b Endpoints}
    
    For a list of Region-specific endpoints that App Runner supports, see
    {{: https://docs.aws.amazon.com/general/latest/gr/apprunner.html }App
    Runner endpoints and quotas} in the {i Amazon Web Services General
    Reference}.|}*)


type base_document = Json.t

