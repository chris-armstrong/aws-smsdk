open Smaws_Lib
let service =
  Service.{
    namespace = "lightsail";
    endpointPrefix = "lightsail";
    version = "2016-11-28";
    protocol = AwsJson_1_1
  };

type certificate_provider = | LetsEncrypt

(**{|
    Returns information that was submitted during the [SetupInstanceHttps]
    request. Email information is redacted for privacy.|}*)
type setup_request = {
  certificate_provider: certificate_provider option;
   (**{|
    The Certificate Authority (CA) that issues the SSL/TLS certificate.|}*)

  domain_names: string list option;
   (**{|
    The name of the domain and subdomains that the SSL/TLS certificate
    secures.|}*)

  instance_name: string option;
   (**{|
    The name of the Lightsail instance.|}*)

}

type region_name = | EU_NORTH_1
  | AP_NORTHEAST_2
  | AP_NORTHEAST_1
  | AP_SOUTHEAST_2
  | AP_SOUTHEAST_1
  | AP_SOUTH_1
  | CA_CENTRAL_1
  | EU_CENTRAL_1
  | EU_WEST_3
  | EU_WEST_2
  | EU_WEST_1
  | US_WEST_2
  | US_WEST_1
  | US_EAST_2
  | US_EAST_1

(**{|
    Describes the resource location.|}*)
type resource_location = {
  region_name: region_name option;
   (**{|
    The Amazon Web Services Region name.|}*)

  availability_zone: string option;
   (**{|
    The Availability Zone. Follows the format [us-east-2a] (case-sensitive).|}*)

}

type resource_type = | Bucket
  | Certificate
  | Distribution
  | ContactMethod
  | Alarm
  | CloudFormationStackRecord
  | ExportSnapshotRecord
  | RelationalDatabaseSnapshot
  | RelationalDatabase
  | DiskSnapshot
  | Disk
  | LoadBalancerTlsCertificate
  | LoadBalancer
  | PeeredVpc
  | Domain
  | InstanceSnapshot
  | KeyPair
  | StaticIp
  | Instance
  | ContainerService

(**{|
    The Lightsail resource that [SetupHistory] was ran on.|}*)
type setup_history_resource = {
  resource_type: resource_type option;
   (**{|
    The Lightsail resource type. For example, [Instance].|}*)

  location: resource_location option;
  
  created_at: float option;
   (**{|
    The timestamp for when the resource was created.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the Lightsail resource.|}*)

  name: string option;
   (**{|
    The name of the Lightsail resource.|}*)

}

type setup_status = | InProgress
  | Failed
  | Succeeded

(**{|
    Returns details about the commands that were run.|}*)
type setup_execution_details = {
  version: string option;
   (**{|
    The current version of the script..|}*)

  standard_output: string option;
   (**{|
    The text written by the command to stdout.|}*)

  standard_error: string option;
   (**{|
    The text written by the command to stderr.|}*)

  status: setup_status option;
   (**{|
    The status of the [SetupInstanceHttps] request.|}*)

  name: string option;
   (**{|
    The name of the target resource.|}*)

  date_time: float option;
   (**{|
    The timestamp for when the request was run.|}*)

  command: string option;
   (**{|
    The command that was executed.|}*)

}

(**{|
    Returns a list of the commands that were ran on the target resource.
    
    The status of each command is also returned.|}*)
type setup_history = {
  status: setup_status option;
   (**{|
    The status of the request.|}*)

  execution_details: setup_execution_details list option;
   (**{|
    Describes the full details of the request.|}*)

  resource: setup_history_resource option;
   (**{|
    The target resource name for the request.|}*)

  request: setup_request option;
   (**{|
    Information about the specified request.|}*)

  operation_id: string option;
   (**{|
    A GUID that's used to identify the operation.|}*)

}

type viewer_minimum_tls_protocol_version_enum = | TLSv12_2021
  | TLSv12_2019
  | TLSv12_2018
  | TLSv11_2016

type operation_type = | SetupInstanceHttps
  | StopGUISession
  | StartGUISession
  | UpdateInstanceMetadataOptions
  | SetResourceAccessForBucket
  | UpdateBucket
  | UpdateBucketBundle
  | DeleteBucketAccessKey
  | CreateBucketAccessKey
  | DeleteBucket
  | CreateBucket
  | DeleteContainerImage
  | RegisterContainerImage
  | CreateContainerServiceRegistryLogin
  | CreateContainerServiceDeployment
  | DeleteContainerService
  | UpdateContainerService
  | CreateContainerService
  | DeleteCertificate
  | CreateCertificate
  | SetIpAddressType
  | UpdateDistributionBundle
  | DetachCertificateFromDistribution
  | AttachCertificateToDistribution
  | ResetDistributionCache
  | DeleteDistribution
  | UpdateDistribution
  | CreateDistribution
  | DeleteContactMethod
  | SendContactMethodVerification
  | GetContactMethods
  | CreateContactMethod
  | TestAlarm
  | DeleteAlarm
  | GetAlarms
  | PutAlarm
  | DisableAddOn
  | EnableAddOn
  | StopRelationalDatabase
  | RebootRelationalDatabase
  | StartRelationalDatabase
  | UpdateRelationalDatabaseParameters
  | DeleteRelationalDatabaseSnapshot
  | CreateRelationalDatabaseSnapshot
  | CreateRelationalDatabaseFromSnapshot
  | DeleteRelationalDatabase
  | UpdateRelationalDatabase
  | CreateRelationalDatabase
  | CreateDiskFromSnapshot
  | DeleteDiskSnapshot
  | CreateDiskSnapshot
  | DetachDisk
  | AttachDisk
  | DeleteDisk
  | CreateDisk
  | AttachLoadBalancerTlsCertificate
  | DeleteLoadBalancerTlsCertificate
  | CreateLoadBalancerTlsCertificate
  | UpdateLoadBalancerAttribute
  | DetachInstancesFromLoadBalancer
  | AttachInstancesToLoadBalancer
  | DeleteLoadBalancer
  | CreateLoadBalancer
  | CreateInstancesFromSnapshot
  | DeleteInstanceSnapshot
  | CreateInstanceSnapshot
  | DeleteDomain
  | CreateDomain
  | DeleteDomainEntry
  | UpdateDomainEntry
  | DetachStaticIp
  | AttachStaticIp
  | ReleaseStaticIp
  | AllocateStaticIp
  | CloseInstancePublicPorts
  | PutInstancePublicPorts
  | OpenInstancePublicPorts
  | RebootInstance
  | StartInstance
  | StopInstance
  | CreateInstance
  | DeleteInstance
  | DeleteKnownHostKeys

type operation_status = | Succeeded
  | Completed
  | Failed
  | Started
  | NotStarted

(**{|
    Describes the API operation.|}*)
type operation = {
  error_details: string option;
   (**{|
    The error details.|}*)

  error_code: string option;
   (**{|
    The error code.|}*)

  status_changed_at: float option;
   (**{|
    The timestamp when the status was changed ([1479816991.349]).|}*)

  status: operation_status option;
   (**{|
    The status of the operation.|}*)

  operation_type: operation_type option;
   (**{|
    The type of operation.|}*)

  operation_details: string option;
   (**{|
    Details about the operation ([Debian-1GB-Ohio-1]).|}*)

  is_terminal: bool option;
   (**{|
    A Boolean value indicating whether the operation is terminal.|}*)

  location: resource_location option;
   (**{|
    The Amazon Web Services Region and Availability Zone.|}*)

  created_at: float option;
   (**{|
    The timestamp when the operation was initialized ([1479816991.349]).|}*)

  resource_type: resource_type option;
   (**{|
    The resource type.|}*)

  resource_name: string option;
   (**{|
    The resource name.|}*)

  id: string option;
   (**{|
    The ID of the operation.|}*)

}

type update_relational_database_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type update_relational_database_request = {
  relational_database_blueprint_id: string option;
   (**{|
    This parameter is used to update the major version of the database. Enter
    the [blueprintId] for the major version that you want to update to.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRelationalDatabaseBlueprints.html }GetRelationalDatabaseBlueprints}
    action to get a list of available blueprint IDs.|}*)

  ca_certificate_identifier: string option;
   (**{|
    Indicates the certificate that needs to be associated with the database.|}*)

  apply_immediately: bool option;
   (**{|
    When [true], applies changes immediately. When [false], applies changes
    during the preferred maintenance window. Some changes may cause an
    outage.
    
    Default: [false]|}*)

  publicly_accessible: bool option;
   (**{|
    Specifies the accessibility options for your database. A value of [true]
    specifies a database that is available to resources outside of your
    Lightsail account. A value of [false] specifies a database that is
    available only to your Lightsail resources in the same region as your
    database.|}*)

  disable_backup_retention: bool option;
   (**{|
    When [true], disables automated backup retention for your database.
    
    Disabling backup retention deletes all automated database backups. Before
    disabling this, you may want to create a snapshot of your database using
    the [create relational database snapshot] operation.
    
    Updates are applied during the next maintenance window because this can
    result in an outage.|}*)

  enable_backup_retention: bool option;
   (**{|
    When [true], enables automated backup retention for your database.
    
    Updates are applied during the next maintenance window because this can
    result in an outage.|}*)

  preferred_maintenance_window: string option;
   (**{|
    The weekly time range during which system maintenance can occur on your
    database.
    
    The default is a 30-minute window selected at random from an 8-hour block
    of time for each Amazon Web Services Region, occurring on a random day of
    the week.
    
    Constraints:
    
    {ol 
          {- Must be in the [ddd:hh24:mi-ddd:hh24:mi] format.
             }
          
          {- Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
             }
          
          {- Must be at least 30 minutes.
             }
          
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Example: [Tue:17:00-Tue:17:30]
             }
          
    }
    |}*)

  preferred_backup_window: string option;
   (**{|
    The daily time range during which automated backups are created for your
    database if automated backups are enabled.
    
    Constraints:
    
    {ol 
          {- Must be in the [hh24:mi-hh24:mi] format.
             
          Example: [16:00-16:30]
          }
          
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Must not conflict with the preferred maintenance window.
             }
          
          {- Must be at least 30 minutes.
             }
          
    }
    |}*)

  rotate_master_user_password: bool option;
   (**{|
    When [true], the master user password is changed to a new strong password
    generated by Lightsail.
    
    Use the [get relational database master user password] operation to get
    the new password.|}*)

  master_user_password: string option;
   (**{|
    The password for the master user. The password can include any printable
    ASCII character except "/", """, or "@".
    
    My{b SQL}
    
    Constraints: Must contain from 8 to 41 characters.
    
    {b PostgreSQL}
    
    Constraints: Must contain from 8 to 128 characters.|}*)

  relational_database_name: string;
   (**{|
    The name of your Lightsail database resource to update.|}*)

}

type update_relational_database_parameters_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

(**{|
    Describes the parameters of a database.|}*)
type relational_database_parameter = {
  parameter_value: string option;
   (**{|
    Specifies the value of the parameter.|}*)

  parameter_name: string option;
   (**{|
    Specifies the name of the parameter.|}*)

  is_modifiable: bool option;
   (**{|
    A Boolean value indicating whether the parameter can be modified.|}*)

  description: string option;
   (**{|
    Provides a description of the parameter.|}*)

  data_type: string option;
   (**{|
    Specifies the valid data type for the parameter.|}*)

  apply_type: string option;
   (**{|
    Specifies the engine-specific parameter type.|}*)

  apply_method: string option;
   (**{|
    Indicates when parameter updates are applied.
    
    Can be [immediate] or [pending-reboot].|}*)

  allowed_values: string option;
   (**{|
    Specifies the valid range of values for the parameter.|}*)

}

type update_relational_database_parameters_request = {
  parameters: relational_database_parameter list;
   (**{|
    The database parameters to update.|}*)

  relational_database_name: string;
   (**{|
    The name of your database for which to update parameters.|}*)

}

(**{|
    Lightsail throws this exception when the user has not been authenticated.|}*)
type unauthenticated_exception = {
  tip: string option;
  
  message: string option;
  
  docs: string option;
  
  code: string option;
  
}

(**{|
    A general service exception.|}*)
type service_exception = {
  tip: string option;
  
  message: string option;
  
  docs: string option;
  
  code: string option;
  
}

(**{|
    Lightsail throws this exception when an operation fails to execute.|}*)
type operation_failure_exception = {
  tip: string option;
  
  message: string option;
  
  docs: string option;
  
  code: string option;
  
}

(**{|
    Lightsail throws this exception when it cannot find a resource.|}*)
type not_found_exception = {
  tip: string option;
  
  message: string option;
  
  docs: string option;
  
  code: string option;
  
}

(**{|
    Lightsail throws this exception when user input does not conform to the
    validation rules of an input field.
    
    Domain and distribution APIs are only available in the N. Virginia
    ([us-east-1]) Amazon Web Services Region. Please set your Amazon Web
    Services Region configuration to [us-east-1] to create, view, or edit
    these resources.
    |}*)
type invalid_input_exception = {
  tip: string option;
  
  message: string option;
  
  docs: string option;
  
  code: string option;
  
}

(**{|
    Lightsail throws this exception when an account is still in the setup in
    progress state.|}*)
type account_setup_in_progress_exception = {
  tip: string option;
  
  message: string option;
  
  docs: string option;
  
  code: string option;
  
}

(**{|
    Lightsail throws this exception when the user cannot be authenticated or
    uses invalid credentials to access a resource.|}*)
type access_denied_exception = {
  tip: string option;
  
  message: string option;
  
  docs: string option;
  
  code: string option;
  
}

type update_load_balancer_attribute_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type load_balancer_attribute_name = | TlsPolicyName
  | HttpsRedirectionEnabled
  | SessionStickiness_LB_CookieDurationSeconds
  | SessionStickinessEnabled
  | HealthCheckPath

type update_load_balancer_attribute_request = {
  attribute_value: string;
   (**{|
    The value that you want to specify for the attribute name.
    
    The following values are supported depending on what you specify for the
    [attributeName] request parameter:
    
    {ol 
          {- If you specify [HealthCheckPath] for the [attributeName] request
             parameter, then the [attributeValue] request parameter must be
             the path to ping on the target (for example,
             [/weather/us/wa/seattle]).
             }
          
          {- If you specify [SessionStickinessEnabled] for the
             [attributeName] request parameter, then the [attributeValue]
             request parameter must be [true] to activate session stickiness
             or [false] to deactivate session stickiness.
             }
          
          {- If you specify [SessionStickiness_LB_CookieDurationSeconds] for
             the [attributeName] request parameter, then the [attributeValue]
             request parameter must be an interger that represents the cookie
             duration in seconds.
             }
          
          {- If you specify [HttpsRedirectionEnabled] for the [attributeName]
             request parameter, then the [attributeValue] request parameter
             must be [true] to activate HTTP to HTTPS redirection or [false]
             to deactivate HTTP to HTTPS redirection.
             }
          
          {- If you specify [TlsPolicyName] for the [attributeName] request
             parameter, then the [attributeValue] request parameter must be
             the name of the TLS policy.
             
          Use the
          {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetLoadBalancerTlsPolicies.html }GetLoadBalancerTlsPolicies}
          action to get a list of TLS policy names that you can specify.
          }
          
    }
    |}*)

  attribute_name: load_balancer_attribute_name;
   (**{|
    The name of the attribute you want to update.|}*)

  load_balancer_name: string;
   (**{|
    The name of the load balancer that you want to modify ([my-load-balancer].|}*)

}

type update_instance_metadata_options_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type http_tokens = | Required
  | Optional

type http_endpoint = | Enabled
  | Disabled

type http_protocol_ipv6 = | Enabled
  | Disabled

type update_instance_metadata_options_request = {
  http_protocol_ipv6: http_protocol_ipv6 option;
   (**{|
    Enables or disables the IPv6 endpoint for the instance metadata service.
    This setting applies only when the HTTP metadata endpoint is enabled.
    
    This parameter is available only for instances in the Europe (Stockholm)
    Amazon Web Services Region ([eu-north-1]).
    |}*)

  http_put_response_hop_limit: int option;
   (**{|
    The desired HTTP PUT response hop limit for instance metadata requests. A
    larger number means that the instance metadata requests can travel
    farther. If no parameter is specified, the existing state is maintained.|}*)

  http_endpoint: http_endpoint option;
   (**{|
    Enables or disables the HTTP metadata endpoint on your instances. If this
    parameter is not specified, the existing state is maintained.
    
    If you specify a value of [disabled], you cannot access your instance
    metadata.|}*)

  http_tokens: http_tokens option;
   (**{|
    The state of token usage for your instance metadata requests. If the
    parameter is not specified in the request, the default state is
    [optional].
    
    If the state is [optional], you can choose whether to retrieve instance
    metadata with a signed token header on your request. If you retrieve the
    IAM role credentials without a token, the version 1.0 role credentials
    are returned. If you retrieve the IAM role credentials by using a valid
    signed token, the version 2.0 role credentials are returned.
    
    If the state is [required], you must send a signed token header with all
    instance metadata retrieval requests. In this state, retrieving the IAM
    role credential always returns the version 2.0 credentials. The version
    1.0 credentials are not available.|}*)

  instance_name: string;
   (**{|
    The name of the instance for which to update metadata parameters.|}*)

}

type update_domain_entry_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

(**{|
    Describes a domain recordset entry.|}*)
type domain_entry = {
  options: (string * string) list option;
   (**{|
    (Discontinued) The options for the domain entry.
    
    In releases prior to November 29, 2017, this parameter was not included
    in the API response. It is now discontinued.
    |}*)

  type_: string option;
   (**{|
    The type of domain entry, such as address for IPv4 (A), address for IPv6
    (AAAA), canonical name (CNAME), mail exchanger (MX), name server (NS),
    start of authority (SOA), service locator (SRV), or text (TXT).
    
    The following domain entry types can be used:
    
    {ol 
          {- [A]
             }
          
          {- [AAAA]
             }
          
          {- [CNAME]
             }
          
          {- [MX]
             }
          
          {- [NS]
             }
          
          {- [SOA]
             }
          
          {- [SRV]
             }
          
          {- [TXT]
             }
          
    }
    |}*)

  is_alias: bool option;
   (**{|
    When [true], specifies whether the domain entry is an alias used by the
    Lightsail load balancer, Lightsail container service, Lightsail content
    delivery network (CDN) distribution, or another Amazon Web Services
    resource. You can include an alias (A type) record in your request, which
    points to the DNS name of a load balancer, container service, CDN
    distribution, or other Amazon Web Services resource and routes traffic to
    that resource.|}*)

  target: string option;
   (**{|
    The target IP address ([192.0.2.0]), or AWS name server
    ([ns-111.awsdns-22.com.]).
    
    For Lightsail load balancers, the value looks like
    [ab1234c56789c6b86aba6fb203d443bc-123456789.us-east-2.elb.amazonaws.com].
    For Lightsail distributions, the value looks like
    [exampled1182ne.cloudfront.net]. For Lightsail container services, the
    value looks like
    [container-service-1.example23scljs.us-west-2.cs.amazonlightsail.com]. Be
    sure to also set [isAlias] to [true] when setting up an A record for a
    Lightsail load balancer, distribution, or container service.|}*)

  name: string option;
   (**{|
    The name of the domain.|}*)

  id: string option;
   (**{|
    The ID of the domain recordset entry.|}*)

}

type update_domain_entry_request = {
  domain_entry: domain_entry;
   (**{|
    An array of key-value pairs containing information about the domain entry.|}*)

  domain_name: string;
   (**{|
    The name of the domain recordset to update.|}*)

}

type update_distribution_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type origin_protocol_policy_enum = | HTTPSOnly
  | HTTPOnly

(**{|
    Describes the origin resource of an Amazon Lightsail content delivery
    network (CDN) distribution.
    
    An origin can be a Lightsail instance, bucket, container service, or load
    balancer. A distribution pulls content from an origin, caches it, and
    serves it to viewers via a worldwide network of edge servers.|}*)
type input_origin = {
  response_timeout: int option;
   (**{|
    The amount of time, in seconds, that the distribution waits for a
    response after forwarding a request to the origin. The minimum timeout is
    1 second, the maximum is 60 seconds, and the default (if you don't
    specify otherwise) is 30 seconds.|}*)

  protocol_policy: origin_protocol_policy_enum option;
   (**{|
    The protocol that your Amazon Lightsail distribution uses when
    establishing a connection with your origin to pull content.|}*)

  region_name: region_name option;
   (**{|
    The AWS Region name of the origin resource.|}*)

  name: string option;
   (**{|
    The name of the origin resource.|}*)

}

type behavior_enum = | CacheSetting
  | DontCacheSetting

(**{|
    Describes the default cache behavior of an Amazon Lightsail content
    delivery network (CDN) distribution.|}*)
type cache_behavior = {
  behavior: behavior_enum option;
   (**{|
    The cache behavior of the distribution.
    
    The following cache behaviors can be specified:
    
    {ol 
          {- {b [cache]} - This option is best for static sites. When
             specified, your distribution caches and serves your entire
             website as static content. This behavior is ideal for websites
             with static content that doesn't change depending on who views
             it, or for websites that don't use cookies, headers, or query
             strings to personalize content.
             }
          
          {- {b [dont-cache]} - This option is best for sites that serve a
             mix of static and dynamic content. When specified, your
             distribution caches and serve only the content that is specified
             in the distribution's [CacheBehaviorPerPath] parameter. This
             behavior is ideal for websites or web applications that use
             cookies, headers, and query strings to personalize content for
             individual users.
             }
          
    }
    |}*)

}

type forward_values = | All
  | AllowList
  | None

(**{|
    Describes whether an Amazon Lightsail content delivery network (CDN)
    distribution forwards cookies to the origin and, if so, which ones.
    
    For the cookies that you specify, your distribution caches separate
    versions of the specified content based on the cookie values in viewer
    requests.|}*)
type cookie_object = {
  cookies_allow_list: string list option;
   (**{|
    The specific cookies to forward to your distribution's origin.|}*)

  option_: forward_values option;
   (**{|
    Specifies which cookies to forward to the distribution's origin for a
    cache behavior: [all], [none], or [allow-list] to forward only the
    cookies specified in the [cookiesAllowList] parameter.|}*)

}

type header_enum = | Referer
  | Origin
  | Host
  | CloudFrontViewerCountry
  | CloudFrontIsTabletViewer
  | CloudFrontIsSmartTVViewer
  | CloudFrontIsMobileViewer
  | CloudFrontIsDesktopViewer
  | CloudFrontForwardedProto
  | Authorization
  | AcceptLanguage
  | AcceptEncoding
  | AcceptDatetime
  | AcceptCharset
  | Accept

(**{|
    Describes the request headers that a Lightsail distribution bases caching
    on.
    
    For the headers that you specify, your distribution caches separate
    versions of the specified content based on the header values in viewer
    requests. For example, suppose viewer requests for [logo.jpg] contain a
    custom [product] header that has a value of either [acme] or [apex], and
    you configure your distribution to cache your content based on values in
    the [product] header. Your distribution forwards the [product] header to
    the origin and caches the response from the origin once for each header
    value.|}*)
type header_object = {
  headers_allow_list: header_enum list option;
   (**{|
    The specific headers to forward to your distribution's origin.|}*)

  option_: forward_values option;
   (**{|
    The headers that you want your distribution to forward to your origin and
    base caching on.
    
    You can configure your distribution to do one of the following:
    
    {ol 
          {- {b [all]} - Forward all headers to your origin.
             }
          
          {- {b [none]} - Forward only the default headers.
             }
          
          {- {b [allow-list]} - Forward only the headers you specify using
             the [headersAllowList] parameter.
             }
          
    }
    |}*)

}

(**{|
    Describes the query string parameters that an Amazon Lightsail content
    delivery network (CDN) distribution to bases caching on.
    
    For the query strings that you specify, your distribution caches separate
    versions of the specified content based on the query string values in
    viewer requests.|}*)
type query_string_object = {
  query_strings_allow_list: string list option;
   (**{|
    The specific query strings that the distribution forwards to the origin.
    
    Your distribution will cache content based on the specified query
    strings.
    
    If the [option] parameter is true, then your distribution forwards all
    query strings, regardless of what you specify using the
    [queryStringsAllowList] parameter.|}*)

  option_: bool option;
   (**{|
    Indicates whether the distribution forwards and caches based on query
    strings.|}*)

}

(**{|
    Describes the cache settings of an Amazon Lightsail content delivery
    network (CDN) distribution.
    
    These settings apply only to your distribution's [cacheBehaviors]
    (including the [defaultCacheBehavior]) that have a [behavior] of [cache].|}*)
type cache_settings = {
  forwarded_query_strings: query_string_object option;
   (**{|
    An object that describes the query strings that are forwarded to the
    origin. Your content is cached based on the query strings that are
    forwarded.|}*)

  forwarded_headers: header_object option;
   (**{|
    An object that describes the headers that are forwarded to the origin.
    Your content is cached based on the headers that are forwarded.|}*)

  forwarded_cookies: cookie_object option;
   (**{|
    An object that describes the cookies that are forwarded to the origin.
    Your content is cached based on the cookies that are forwarded.|}*)

  cached_http_methods: string option;
   (**{|
    The HTTP method responses that are cached by your distribution.
    
    You can specify the following options:
    
    {ol 
          {- [GET,HEAD] - The distribution caches responses to the [GET] and
             [HEAD] methods.
             }
          
          {- [GET,HEAD,OPTIONS] - The distribution caches responses to the
             [GET], [HEAD], and [OPTIONS] methods.
             }
          
    }
    |}*)

  allowed_http_methods: string option;
   (**{|
    The HTTP methods that are processed and forwarded to the distribution's
    origin.
    
    You can specify the following options:
    
    {ol 
          {- [GET,HEAD] - The distribution forwards the [GET] and [HEAD]
             methods.
             }
          
          {- [GET,HEAD,OPTIONS] - The distribution forwards the [GET],
             [HEAD], and [OPTIONS] methods.
             }
          
          {- [GET,HEAD,OPTIONS,PUT,PATCH,POST,DELETE] - The distribution
             forwards the [GET], [HEAD], [OPTIONS], [PUT], [PATCH], [POST],
             and [DELETE] methods.
             }
          
    }
    
    If you specify the third option, you might need to restrict access to
    your distribution's origin so users can't perform operations that you
    don't want them to. For example, you might not want users to have
    permission to delete objects from your origin.|}*)

  maximum_tt_l: int option;
   (**{|
    The maximum amount of time that objects stay in the distribution's cache
    before the distribution forwards another request to the origin to
    determine whether the object has been updated.
    
    The value specified applies only when the origin adds HTTP headers such
    as [Cache-Control max-age], [Cache-Control s-maxage], and [Expires] to
    objects.|}*)

  minimum_tt_l: int option;
   (**{|
    The minimum amount of time that objects stay in the distribution's cache
    before the distribution forwards another request to the origin to
    determine whether the object has been updated.
    
    A value of [0] must be specified for [minimumTTL] if the distribution is
    configured to forward all headers to the origin.|}*)

  default_tt_l: int option;
   (**{|
    The default amount of time that objects stay in the distribution's cache
    before the distribution forwards another request to the origin to
    determine whether the content has been updated.
    
    The value specified applies only when the origin does not add HTTP
    headers such as [Cache-Control max-age], [Cache-Control s-maxage], and
    [Expires] to objects.
    |}*)

}

(**{|
    Describes the per-path cache behavior of an Amazon Lightsail content
    delivery network (CDN) distribution.
    
    A per-path cache behavior is used to override, or add an exception to,
    the default cache behavior of a distribution. For example, if the
    [cacheBehavior] is set to [cache], then a per-path cache behavior can be
    used to specify a directory, file, or file type that your distribution
    will cache. Alternately, if the distribution's [cacheBehavior] is
    [dont-cache], then a per-path cache behavior can be used to specify a
    directory, file, or file type that your distribution will not cache.|}*)
type cache_behavior_per_path = {
  behavior: behavior_enum option;
   (**{|
    The cache behavior for the specified path.
    
    You can specify one of the following per-path cache behaviors:
    
    {ol 
          {- {b [cache]} - This behavior caches the specified path.
             }
          
          {- {b [dont-cache]} - This behavior doesn't cache the specified
             path.
             }
          
    }
    |}*)

  path: string option;
   (**{|
    The path to a directory or file to cached, or not cache. Use an asterisk
    symbol to specify wildcard directories ([path/to/assets/*]), and file
    types ([*.html, *jpg, *js]). Directories and file paths are
    case-sensitive.
    
    Examples:
    
    {ol 
          {- Specify the following to cache all files in the document root of
             an Apache web server running on a Lightsail instance.
             
          [var/www/html/]
          }
          
          {- Specify the following file to cache only the index page in the
             document root of an Apache web server.
             
          [var/www/html/index.html]
          }
          
          {- Specify the following to cache only the .html files in the
             document root of an Apache web server.
             
          [var/www/html/*.html]
          }
          
          {- Specify the following to cache only the .jpg, .png, and .gif
             files in the images sub-directory of the document root of an
             Apache web server.
             
          [var/www/html/images/*.jpg]
          
          [var/www/html/images/*.png]
          
          [var/www/html/images/*.gif]
          
          Specify the following to cache all files in the images
          sub-directory of the document root of an Apache web server.
          
          [var/www/html/images/]
          }
          
    }
    |}*)

}

type update_distribution_request = {
  use_default_certificate: bool option;
   (**{|
    Indicates whether the default SSL/TLS certificate is attached to the
    distribution. The default value is [true]. When [true], the distribution
    uses the default domain name such as [d111111abcdef8.cloudfront.net].
    
    Set this value to [false] to attach a new certificate to the
    distribution.|}*)

  certificate_name: string option;
   (**{|
    The name of the SSL/TLS certificate that you want to attach to the
    distribution.
    
    Only certificates with a status of [ISSUED] can be attached to a
    distribution.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetCertificates.html }GetCertificates}
    action to get a list of certificate names that you can specify.|}*)

  viewer_minimum_tls_protocol_version: viewer_minimum_tls_protocol_version_enum option;
   (**{|
    Use this parameter to update the minimum TLS protocol version for the
    SSL/TLS certificate that's attached to the distribution.|}*)

  is_enabled: bool option;
   (**{|
    Indicates whether to enable the distribution.|}*)

  cache_behaviors: cache_behavior_per_path list option;
   (**{|
    An array of objects that describe the per-path cache behavior for the
    distribution.|}*)

  cache_behavior_settings: cache_settings option;
   (**{|
    An object that describes the cache behavior settings for the distribution.
    
    The [cacheBehaviorSettings] specified in your [UpdateDistributionRequest]
    will replace your distribution's existing settings.
    |}*)

  default_cache_behavior: cache_behavior option;
   (**{|
    An object that describes the default cache behavior for the distribution.|}*)

  origin: input_origin option;
   (**{|
    An object that describes the origin resource for the distribution, such
    as a Lightsail instance, bucket, or load balancer.
    
    The distribution pulls, caches, and serves content from the origin.|}*)

  distribution_name: string;
   (**{|
    The name of the distribution to update.
    
    Use the [GetDistributions] action to get a list of distribution names
    that you can specify.|}*)

}

type update_distribution_bundle_result = {
  operation: operation option;
   (**{|
    An object that describes the result of the action, such as the status of
    the request, the timestamp of the request, and the resources affected by
    the request.|}*)

}

type update_distribution_bundle_request = {
  bundle_id: string option;
   (**{|
    The bundle ID of the new bundle to apply to your distribution.
    
    Use the [GetDistributionBundles] action to get a list of distribution
    bundle IDs that you can specify.|}*)

  distribution_name: string option;
   (**{|
    The name of the distribution for which to update the bundle.
    
    Use the [GetDistributions] action to get a list of distribution names
    that you can specify.|}*)

}

(**{|
    Describes a tag key and optional value assigned to an Amazon Lightsail
    resource.
    
    For more information about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)
type tag = {
  value: string option;
   (**{|
    The value of the tag.
    
    Constraints: Tag values accept a maximum of 256 letters, numbers, spaces
    in UTF-8, or the following characters: + - = . _ : / @|}*)

  key: string option;
   (**{|
    The key of the tag.
    
    Constraints: Tag keys accept a maximum of 128 letters, numbers, spaces in
    UTF-8, or the following characters: + - = . _ : / @|}*)

}

type container_service_power_name = | Xlarge
  | Large
  | Medium
  | Small
  | Micro
  | Nano

type container_service_state = | DEPLOYING
  | DISABLED
  | DELETING
  | UPDATING
  | RUNNING
  | READY
  | PENDING

type container_service_state_detail_code = | UNKNOWN_ERROR
  | CERTIFICATE_LIMIT_EXCEEDED
  | ACTIVATING_DEPLOYMENT
  | EVALUATING_HEALTH_CHECK
  | CREATING_DEPLOYMENT
  | PROVISIONING_SERVICE
  | PROVISIONING_CERTIFICATE
  | CREATING_NETWORK_INFRASTRUCTURE
  | CREATING_SYSTEM_RESOURCES

(**{|
    Describes the current state of a container service.|}*)
type container_service_state_detail = {
  message: string option;
   (**{|
    A message that provides more information for the state code.
    
    The state detail is populated only when a container service is in a
    [PENDING], [DEPLOYING], or [UPDATING] state.
    |}*)

  code: container_service_state_detail_code option;
   (**{|
    The state code of the container service.
    
    The following state codes are possible:
    
    {ol 
          {- The following state codes are possible if your container service
             is in a [DEPLOYING] or [UPDATING] state:
             
          {ol 
                {- [CREATING_SYSTEM_RESOURCES] - The system resources for
                   your container service are being created.
                   }
                
                {- [CREATING_NETWORK_INFRASTRUCTURE] - The network
                   infrastructure for your container service are being
                   created.
                   }
                
                {- [PROVISIONING_CERTIFICATE] - The SSL/TLS certificate for
                   your container service is being created.
                   }
                
                {- [PROVISIONING_SERVICE] - Your container service is being
                   provisioned.
                   }
                
                {- [CREATING_DEPLOYMENT] - Your deployment is being created
                   on your container service.
                   }
                
                {- [EVALUATING_HEALTH_CHECK] - The health of your deployment
                   is being evaluated.
                   }
                
                {- [ACTIVATING_DEPLOYMENT] - Your deployment is being
                   activated.
                   }
                
          }
          }
          
          {- The following state codes are possible if your container service
             is in a [PENDING] state:
             
          {ol 
                {- [CERTIFICATE_LIMIT_EXCEEDED] - The SSL/TLS certificate
                   required for your container service exceeds the maximum
                   number of certificates allowed for your account.
                   }
                
                {- [UNKNOWN_ERROR] - An error was experienced when your
                   container service was being created.
                   }
                
          }
          }
          
    }
    |}*)

}

type container_service_deployment_state = | FAILED
  | INACTIVE
  | ACTIVE
  | ACTIVATING

type container_service_protocol = | UDP
  | TCP
  | HTTPS
  | HTTP

(**{|
    Describes the settings of a container that will be launched, or that is
    launched, to an Amazon Lightsail container service.|}*)
type container = {
  ports: (string * container_service_protocol) list option;
   (**{|
    The open firewall ports of the container.|}*)

  environment: (string * string) list option;
   (**{|
    The environment variables of the container.|}*)

  command: string list option;
   (**{|
    The launch command for the container.|}*)

  image: string option;
   (**{|
    The name of the image used for the container.
    
    Container images sourced from your Lightsail container service, that are
    registered and stored on your service, start with a colon ([:]). For
    example, if your container service name is [container-service-1], the
    container image label is [mystaticsite], and you want to use the third
    ([3]) version of the registered container image, then you should specify
    [:container-service-1.mystaticsite.3]. To use the latest version of a
    container image, specify [latest] instead of a version number (for
    example, [:container-service-1.mystaticsite.latest]). Lightsail will
    automatically use the highest numbered version of the registered
    container image.
    
    Container images sourced from a public registry like Docker Hub don't
    start with a colon. For example, [nginx:latest] or [nginx].|}*)

}

(**{|
    Describes the health check configuration of an Amazon Lightsail container
    service.|}*)
type container_service_health_check_config = {
  success_codes: string option;
   (**{|
    The HTTP codes to use when checking for a successful response from a
    container. You can specify values between [200] and [499]. You can
    specify multiple values (for example, [200,202]) or a range of values
    (for example, [200-299]).|}*)

  path: string option;
   (**{|
    The path on the container on which to perform the health check. The
    default value is [/].|}*)

  interval_seconds: int option;
   (**{|
    The approximate interval, in seconds, between health checks of an
    individual container. You can specify between 5 and 300 seconds. The
    default value is [5].|}*)

  timeout_seconds: int option;
   (**{|
    The amount of time, in seconds, during which no response means a failed
    health check. You can specify between 2 and 60 seconds. The default value
    is [2].|}*)

  unhealthy_threshold: int option;
   (**{|
    The number of consecutive health check failures required before moving
    the container to the [Unhealthy] state. The default value is [2].|}*)

  healthy_threshold: int option;
   (**{|
    The number of consecutive health checks successes required before moving
    the container to the [Healthy] state. The default value is [2].|}*)

}

(**{|
    Describes the public endpoint configuration of a deployment of an Amazon
    Lightsail container service.|}*)
type container_service_endpoint = {
  health_check: container_service_health_check_config option;
   (**{|
    An object that describes the health check configuration of the container.|}*)

  container_port: int option;
   (**{|
    The port of the specified container to which traffic is forwarded to.|}*)

  container_name: string option;
   (**{|
    The name of the container entry of the deployment that the endpoint
    configuration applies to.|}*)

}

(**{|
    Describes a container deployment configuration of an Amazon Lightsail
    container service.
    
    A deployment specifies the settings, such as the ports and launch
    command, of containers that are deployed to your container service.|}*)
type container_service_deployment = {
  created_at: float option;
   (**{|
    The timestamp when the deployment was created.|}*)

  public_endpoint: container_service_endpoint option;
   (**{|
    An object that describes the endpoint of the deployment.|}*)

  containers: (string * container) list option;
   (**{|
    An object that describes the configuration for the containers of the
    deployment.|}*)

  state: container_service_deployment_state option;
   (**{|
    The state of the deployment.
    
    A deployment can be in one of the following states:
    
    {ol 
          {- [ACTIVATING] - The deployment is being created.
             }
          
          {- [ACTIVE] - The deployment was successfully created, and it's
             currently running on the container service. The container
             service can have only one deployment in an active state at a
             time.
             }
          
          {- [INACTIVE] - The deployment was previously successfully created,
             but it is not currently running on the container service.
             }
          
          {- [FAILED] - The deployment failed. Use the [GetContainerLog]
             action to view the log events for the containers in the
             deployment to try to determine the reason for the failure.
             }
          
    }
    |}*)

  version: int option;
   (**{|
    The version number of the deployment.|}*)

}

(**{|
    Describes the activation status of the role that you can use to grant an
    Amazon Lightsail container service access to Amazon Elastic Container
    Registry (Amazon ECR) private repositories.
    
    When activated, Lightsail creates an Identity and Access Management (IAM)
    role for the specified Lightsail container service. You can use the ARN
    of the role to create a trust relationship between your Lightsail
    container service and an Amazon ECR private repository in your Amazon Web
    Services account. This allows your container service to pull images from
    Amazon ECR private repositories. For more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access }Configuring
    access to an Amazon ECR private repository for an Amazon Lightsail
    container service} in the {i Amazon Lightsail Developer Guide}.|}*)
type container_service_ecr_image_puller_role = {
  principal_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the role, if it is activated.|}*)

  is_active: bool option;
   (**{|
    A Boolean value that indicates whether the role is activated.|}*)

}

(**{|
    Describes the configuration for an Amazon Lightsail container service to
    access private container image repositories, such as Amazon Elastic
    Container Registry (Amazon ECR) private repositories.
    
    For more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access }Configuring
    access to an Amazon ECR private repository for an Amazon Lightsail
    container service} in the {i Amazon Lightsail Developer Guide}.|}*)
type private_registry_access = {
  ecr_image_puller_role: container_service_ecr_image_puller_role option;
   (**{|
    An object that describes the activation status of the role that you can
    use to grant a Lightsail container service access to Amazon ECR private
    repositories. If the role is activated, the Amazon Resource Name (ARN) of
    the role is also listed.|}*)

}

(**{|
    Describes an Amazon Lightsail container service.|}*)
type container_service = {
  private_registry_access: private_registry_access option;
   (**{|
    An object that describes the configuration for the container service to
    access private container image repositories, such as Amazon Elastic
    Container Registry (Amazon ECR) private repositories.
    
    For more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access }Configuring
    access to an Amazon ECR private repository for an Amazon Lightsail
    container service} in the {i Amazon Lightsail Developer Guide}.|}*)

  url: string option;
   (**{|
    The publicly accessible URL of the container service.
    
    If no public endpoint is specified in the [currentDeployment], this URL
    returns a 404 response.|}*)

  public_domain_names: (string * string list) list option;
   (**{|
    The public domain name of the container service, such as [example.com]
    and [www.example.com].
    
    You can specify up to four public domain names for a container service.
    The domain names that you specify are used when you create a deployment
    with a container configured as the public endpoint of your container
    service.
    
    If you don't specify public domain names, then you can use the default
    domain of the container service.
    
    You must create and validate an SSL/TLS certificate before you can use
    public domain names with your container service. Use the
    [CreateCertificate] action to create a certificate for the public domain
    names you want to use with your container service.
    
    See [CreateContainerService] or [UpdateContainerService] for information
    about how to specify public domain names for your Lightsail container
    service.|}*)

  private_domain_name: string option;
   (**{|
    The private domain name of the container service.
    
    The private domain name is accessible only by other resources within the
    default virtual private cloud (VPC) of your Lightsail account.|}*)

  principal_arn: string option;
   (**{|
    The principal ARN of the container service.
    
    The principal ARN can be used to create a trust relationship between your
    standard Amazon Web Services account and your Lightsail container
    service. This allows you to give your service permission to access
    resources in your standard Amazon Web Services account.|}*)

  is_disabled: bool option;
   (**{|
    A Boolean value indicating whether the container service is disabled.|}*)

  next_deployment: container_service_deployment option;
   (**{|
    An object that describes the next deployment of the container service.
    
    This value is [null] when there is no deployment in a [pending] state.|}*)

  current_deployment: container_service_deployment option;
   (**{|
    An object that describes the current container deployment of the
    container service.|}*)

  scale: int option;
   (**{|
    The scale specification of the container service.
    
    The scale specifies the allocated compute nodes of the container service.|}*)

  state_detail: container_service_state_detail option;
   (**{|
    An object that describes the current state of the container service.
    
    The state detail is populated only when a container service is in a
    [PENDING], [DEPLOYING], or [UPDATING] state.
    |}*)

  state: container_service_state option;
   (**{|
    The current state of the container service.
    
    The following container service states are possible:
    
    {ol 
          {- [PENDING] - The container service is being created.
             }
          
          {- [READY] - The container service is running but it does not have
             an active container deployment.
             }
          
          {- [DEPLOYING] - The container service is launching a container
             deployment.
             }
          
          {- [RUNNING] - The container service is running and it has an
             active container deployment.
             }
          
          {- [UPDATING] - The container service capacity or its custom
             domains are being updated.
             }
          
          {- [DELETING] - The container service is being deleted.
             }
          
          {- [DISABLED] - The container service is disabled, and its active
             deployment and containers, if any, are shut down.
             }
          
    }
    |}*)

  power_id: string option;
   (**{|
    The ID of the power of the container service.|}*)

  power: container_service_power_name option;
   (**{|
    The power specification of the container service.
    
    The power specifies the amount of RAM, the number of vCPUs, and the base
    price of the container service.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The Lightsail resource type of the container service.|}*)

  location: resource_location option;
   (**{|
    An object that describes the location of the container service, such as
    the Amazon Web Services Region and Availability Zone.|}*)

  created_at: float option;
   (**{|
    The timestamp when the container service was created.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the container service.|}*)

  container_service_name: string option;
   (**{|
    The name of the container service.|}*)

}

type update_container_service_result = {
  container_service: container_service option;
   (**{|
    An object that describes a container service.|}*)

}

(**{|
    Describes a request to activate or deactivate the role that you can use
    to grant an Amazon Lightsail container service access to Amazon Elastic
    Container Registry (Amazon ECR) private repositories.
    
    When activated, Lightsail creates an Identity and Access Management (IAM)
    role for the specified Lightsail container service. You can use the ARN
    of the role to create a trust relationship between your Lightsail
    container service and an Amazon ECR private repository in your Amazon Web
    Services account. This allows your container service to pull images from
    Amazon ECR private repositories. For more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access }Configuring
    access to an Amazon ECR private repository for an Amazon Lightsail
    container service} in the {i Amazon Lightsail Developer Guide}.|}*)
type container_service_ecr_image_puller_role_request = {
  is_active: bool option;
   (**{|
    A Boolean value that indicates whether to activate the role.|}*)

}

(**{|
    Describes a request to configure an Amazon Lightsail container service to
    access private container image repositories, such as Amazon Elastic
    Container Registry (Amazon ECR) private repositories.
    
    For more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access }Configuring
    access to an Amazon ECR private repository for an Amazon Lightsail
    container service} in the {i Amazon Lightsail Developer Guide}.|}*)
type private_registry_access_request = {
  ecr_image_puller_role: container_service_ecr_image_puller_role_request option;
   (**{|
    An object to describe a request to activate or deactivate the role that
    you can use to grant an Amazon Lightsail container service access to
    Amazon Elastic Container Registry (Amazon ECR) private repositories.|}*)

}

type update_container_service_request = {
  private_registry_access: private_registry_access_request option;
   (**{|
    An object to describe the configuration for the container service to
    access private container image repositories, such as Amazon Elastic
    Container Registry (Amazon ECR) private repositories.
    
    For more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access }Configuring
    access to an Amazon ECR private repository for an Amazon Lightsail
    container service} in the {i Amazon Lightsail Developer Guide}.|}*)

  public_domain_names: (string * string list) list option;
   (**{|
    The public domain names to use with the container service, such as
    [example.com] and [www.example.com].
    
    You can specify up to four public domain names for a container service.
    The domain names that you specify are used when you create a deployment
    with a container configured as the public endpoint of your container
    service.
    
    If you don't specify public domain names, then you can use the default
    domain of the container service.
    
    You must create and validate an SSL/TLS certificate before you can use
    public domain names with your container service. Use the
    [CreateCertificate] action to create a certificate for the public domain
    names you want to use with your container service.
    
    You can specify public domain names using a string to array map as shown
    in the example later on this page.|}*)

  is_disabled: bool option;
   (**{|
    A Boolean value to indicate whether the container service is disabled.|}*)

  scale: int option;
   (**{|
    The scale for the container service.
    
    The scale specifies the allocated compute nodes of the container service.
    The [power] and [scale] of a container service makes up its configured
    capacity. To determine the monthly price of your container service,
    multiply the base price of the [power] with the [scale] (the number of
    nodes) of the service.|}*)

  power: container_service_power_name option;
   (**{|
    The power for the container service.
    
    The power specifies the amount of memory, vCPUs, and base monthly cost of
    each node of the container service. The [power] and [scale] of a
    container service makes up its configured capacity. To determine the
    monthly price of your container service, multiply the base price of the
    [power] with the [scale] (the number of nodes) of the service.
    
    Use the [GetContainerServicePowers] action to view the specifications of
    each power option.|}*)

  service_name: string;
   (**{|
    The name of the container service to update.|}*)

}

type access_type = | Private
  | Public

(**{|
    Describes the anonymous access permissions for an Amazon Lightsail bucket
    and its objects.
    
    For more information about bucket access permissions, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-understanding-bucket-permissions }Understanding
    bucket permissions in Amazon Lightsail} in the
    
    {i Amazon Lightsail Developer Guide}.|}*)
type access_rules = {
  allow_public_overrides: bool option;
   (**{|
    A Boolean value that indicates whether the access control list (ACL)
    permissions that are applied to individual objects override the
    [getObject] option that is currently specified.
    
    When this is true, you can use the
    {{: https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectAcl.html }PutObjectAcl}
    Amazon S3 API action to set individual objects to public (read-only)
    using the [public-read] ACL, or to private using the [private] ACL.|}*)

  get_object: access_type option;
   (**{|
    Specifies the anonymous access to all objects in a bucket.
    
    The following options can be specified:
    
    {ol 
          {- [public] - Sets all objects in the bucket to public (read-only),
             making them readable by anyone in the world.
             
          If the [getObject] value is set to [public], then all objects in
          the bucket default to public regardless of the
          [allowPublicOverrides] value.
          }
          
          {- [private] - Sets all objects in the bucket to private, making
             them readable only by you or anyone you give access to.
             
          If the [getObject] value is set to [private], and the
          [allowPublicOverrides] value is set to [true], then all objects in
          the bucket default to private unless they are configured with a
          [public-read] ACL. Individual objects with a [public-read] ACL are
          readable by anyone in the world.
          }
          
    }
    |}*)

}

(**{|
    Describes an Amazon Lightsail instance that has access to a Lightsail
    bucket.|}*)
type resource_receiving_access = {
  resource_type: string option;
   (**{|
    The Lightsail resource type (for example, [Instance]).|}*)

  name: string option;
   (**{|
    The name of the Lightsail instance.|}*)

}

(**{|
    Describes the state of an Amazon Lightsail bucket.|}*)
type bucket_state = {
  message: string option;
   (**{|
    A message that describes the state of the bucket.|}*)

  code: string option;
   (**{|
    The state code of the bucket.
    
    The following codes are possible:
    
    {ol 
          {- [OK] - The bucket is in a running state.
             }
          
          {- [Unknown] - Creation of the bucket might have timed-out. You
             might want to delete the bucket and create a new one.
             }
          
    }
    |}*)

}

(**{|
    Describes the access log configuration for a bucket in the Amazon
    Lightsail object storage service.
    
    For more information about bucket access logs, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-bucket-access-logs }Logging
    bucket requests using access logging in Amazon Lightsail} in the
    {i Amazon Lightsail Developer Guide}.|}*)
type bucket_access_log_config = {
  prefix: string option;
   (**{|
    The optional object prefix for the bucket access log.
    
    The prefix is an optional addition to the object key that organizes your
    access log files in the destination bucket. For example, if you specify a
    [logs/] prefix, then each log object will begin with the [logs/] prefix
    in its key (for example, [logs/2021-11-01-21-32-16-E568B2907131C0C0]).
    
    This parameter can be optionally specified when enabling the access log
    for a bucket, and should be omitted when disabling the access log.
    |}*)

  destination: string option;
   (**{|
    The name of the bucket where the access logs are saved. The destination
    can be a Lightsail bucket in the same account, and in the same Amazon Web
    Services Region as the source bucket.
    
    This parameter is required when enabling the access log for a bucket, and
    should be omitted when disabling the access log.
    |}*)

  enabled: bool;
   (**{|
    A Boolean value that indicates whether bucket access logging is enabled
    for the bucket.|}*)

}

(**{|
    Describes an Amazon Lightsail bucket.|}*)
type bucket = {
  access_log_config: bucket_access_log_config option;
   (**{|
    An object that describes the access log configuration for the bucket.|}*)

  state: bucket_state option;
   (**{|
    An object that describes the state of the bucket.|}*)

  resources_receiving_access: resource_receiving_access list option;
   (**{|
    An array of objects that describe Lightsail instances that have access to
    the bucket.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_SetResourceAccessForBucket.html }SetResourceAccessForBucket}
    action to update the instances that have access to a bucket.|}*)

  readonly_access_accounts: string list option;
   (**{|
    An array of strings that specify the Amazon Web Services account IDs that
    have read-only access to the bucket.|}*)

  able_to_update_bundle: bool option;
   (**{|
    Indicates whether the bundle that is currently applied to a bucket can be
    changed to another bundle.
    
    You can update a bucket's bundle only one time within a monthly Amazon
    Web Services billing cycle.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html }UpdateBucketBundle}
    action to change a bucket's bundle.|}*)

  object_versioning: string option;
   (**{|
    Indicates whether object versioning is enabled for the bucket.
    
    The following options can be configured:
    
    {ol 
          {- [Enabled] - Object versioning is enabled.
             }
          
          {- [Suspended] - Object versioning was previously enabled but is
             currently suspended. Existing object versions are retained.
             }
          
          {- [NeverEnabled] - Object versioning has never been enabled.
             }
          
    }
    |}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the bucket. For more information,
    see
    {{: https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags }Tags
    in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.|}*)

  support_code: string option;
   (**{|
    The support code for a bucket. Include this code in your email to support
    when you have questions about a Lightsail bucket. This code enables our
    support team to look up your Lightsail information more easily.|}*)

  name: string option;
   (**{|
    The name of the bucket.|}*)

  location: resource_location option;
   (**{|
    An object that describes the location of the bucket, such as the Amazon
    Web Services Region and Availability Zone.|}*)

  url: string option;
   (**{|
    The URL of the bucket.|}*)

  created_at: float option;
   (**{|
    The timestamp when the distribution was created.|}*)

  bundle_id: string option;
   (**{|
    The ID of the bundle currently applied to the bucket.
    
    A bucket bundle specifies the monthly cost, storage space, and data
    transfer quota for a bucket.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html }UpdateBucketBundle}
    action to change the bundle of a bucket.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the bucket.|}*)

  access_rules: access_rules option;
   (**{|
    An object that describes the access rules of the bucket.|}*)

  resource_type: string option;
   (**{|
    The Lightsail resource type of the bucket.|}*)

}

type update_bucket_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

  bucket: bucket option;
   (**{|
    An object that describes the bucket that is updated.|}*)

}

type update_bucket_request = {
  access_log_config: bucket_access_log_config option;
   (**{|
    An object that describes the access log configuration for the bucket.|}*)

  readonly_access_accounts: string list option;
   (**{|
    An array of strings to specify the Amazon Web Services account IDs that
    can access the bucket.
    
    You can give a maximum of 10 Amazon Web Services accounts access to a
    bucket.|}*)

  versioning: string option;
   (**{|
    Specifies whether to enable or suspend versioning of objects in the
    bucket.
    
    The following options can be specified:
    
    {ol 
          {- [Enabled] - Enables versioning of objects in the specified
             bucket.
             }
          
          {- [Suspended] - Suspends versioning of objects in the specified
             bucket. Existing object versions are retained.
             }
          
    }
    |}*)

  access_rules: access_rules option;
   (**{|
    An object that sets the public accessibility of objects in the specified
    bucket.|}*)

  bucket_name: string;
   (**{|
    The name of the bucket to update.|}*)

}

type update_bucket_bundle_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type update_bucket_bundle_request = {
  bundle_id: string;
   (**{|
    The ID of the new bundle to apply to the bucket.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketBundles.html }GetBucketBundles}
    action to get a list of bundle IDs that you can specify.|}*)

  bucket_name: string;
   (**{|
    The name of the bucket for which to update the bundle.|}*)

}

type untag_resource_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type untag_resource_request = {
  tag_keys: string list;
   (**{|
    The tag keys to delete from the specified resource.|}*)

  resource_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the resource from which you want to
    remove a tag.|}*)

  resource_name: string;
   (**{|
    The name of the resource from which you are removing a tag.|}*)

}

type unpeer_vpc_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type unpeer_vpc_request = unit

type treat_missing_data = | Missing
  | Ignore
  | NotBreaching
  | Breaching

(**{|
    Sets the start date and end date for retrieving a cost estimate. The
    start date is inclusive, but the end date is exclusive. For example, if
    [start] is [2017-01-01] and [end] is [2017-05-01], then the cost and
    usage data is retrieved from [2017-01-01] up to and including
    [2017-04-30] but not including [2017-05-01].|}*)
type time_period = {
  end_: float option;
   (**{|
    The end of the time period. The end date is exclusive. For example, if
    [end] is [2017-05-01], Lightsail for Research retrieves cost and usage
    data from the start date up to, but not including, [2017-05-01].|}*)

  start: float option;
   (**{|
    The beginning of the time period. The start date is inclusive. For
    example, if [start] is [2017-01-01], Lightsail for Research retrieves
    cost and usage data starting at [2017-01-01] up to the end date. The
    start date must be equal to or no later than the current date to avoid a
    validation error.|}*)

}

type test_alarm_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type alarm_state = | INSUFFICIENT_DATA
  | ALARM
  | OK

type test_alarm_request = {
  state: alarm_state;
   (**{|
    The alarm state to test.
    
    An alarm has the following possible states that can be tested:
    
    {ol 
          {- [ALARM] - The metric is outside of the defined threshold.
             }
          
          {- [INSUFFICIENT_DATA] - The alarm has just started, the metric is
             not available, or not enough data is available for the metric to
             determine the alarm state.
             }
          
          {- [OK] - The metric is within the defined threshold.
             }
          
    }
    |}*)

  alarm_name: string;
   (**{|
    The name of the alarm to test.|}*)

}

type tag_resource_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type tag_resource_request = {
  tags: tag list;
   (**{|
    The tag key and optional value.|}*)

  resource_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the resource to which you want to add a
    tag.|}*)

  resource_name: string;
   (**{|
    The name of the resource to which you are adding tags.|}*)

}

type stop_relational_database_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type stop_relational_database_request = {
  relational_database_snapshot_name: string option;
   (**{|
    The name of your new database snapshot to be created before stopping your
    database.|}*)

  relational_database_name: string;
   (**{|
    The name of your database to stop.|}*)

}

type stop_instance_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type stop_instance_request = {
  force: bool option;
   (**{|
    When set to [True], forces a Lightsail instance that is stuck in a
    [stopping] state to stop.
    
    Only use the [force] parameter if your instance is stuck in the
    [stopping] state. In any other state, your instance should stop normally
    without adding this parameter to your API request.
    |}*)

  instance_name: string;
   (**{|
    The name of the instance (a virtual private server) to stop.|}*)

}

(**{|
    Describes a request to create or edit the [StopInstanceOnIdle] add-on.
    
    This add-on only applies to Lightsail for Research resources.
    |}*)
type stop_instance_on_idle_request = {
  duration: string option;
   (**{|
    The amount of idle time in minutes after which your virtual computer will
    automatically stop.|}*)

  threshold: string option;
   (**{|
    The value to compare with the duration.|}*)

}

type stop_gui_session_result = {
  operations: operation list option;
   (**{|
    The available API operations.|}*)

}

type stop_gui_session_request = {
  resource_name: string;
   (**{|
    The resource name.|}*)

}

type status_type = | Inactive
  | Active

type status = | FailedStoppingGUISession
  | FailedStartingGUISession
  | FailedInstanceCreation
  | SettingUpInstance
  | Stopping
  | Stopped
  | Starting
  | Started
  | NotStarted
  | StartExpired

(**{|
    Describes a static IP.|}*)
type static_ip = {
  is_attached: bool option;
   (**{|
    A Boolean value indicating whether the static IP is attached.|}*)

  attached_to: string option;
   (**{|
    The instance where the static IP is attached ([Amazon_Linux-1GB-Ohio-1]).|}*)

  ip_address: string option;
   (**{|
    The static IP address.|}*)

  resource_type: resource_type option;
   (**{|
    The resource type (usually [StaticIp]).|}*)

  location: resource_location option;
   (**{|
    The region and Availability Zone where the static IP was created.|}*)

  created_at: float option;
   (**{|
    The timestamp when the static IP was created ([1479735304.222]).|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about an instance or another resource in Lightsail. This
    code enables our support team to look up your Lightsail information more
    easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the static IP
    ([arn:aws:lightsail:us-east-2:123456789101:StaticIp/9cbb4a9e-f8e3-4dfe-b57e-12345EXAMPLE]).
    |}*)

  name: string option;
   (**{|
    The name of the static IP ([StaticIP-Ohio-EXAMPLE]).|}*)

}

type start_relational_database_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type start_relational_database_request = {
  relational_database_name: string;
   (**{|
    The name of your database to start.|}*)

}

type start_instance_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type start_instance_request = {
  instance_name: string;
   (**{|
    The name of the instance (a virtual private server) to start.|}*)

}

type start_gui_session_result = {
  operations: operation list option;
   (**{|
    The available API operations.|}*)

}

type start_gui_session_request = {
  resource_name: string;
   (**{|
    The resource name.|}*)

}

type setup_instance_https_result = {
  operations: operation list option;
   (**{|
    The available API operations for [SetupInstanceHttps].|}*)

}

type setup_instance_https_request = {
  certificate_provider: certificate_provider;
   (**{|
    The certificate authority that issues the SSL/TLS certificate.|}*)

  domain_names: string list;
   (**{|
    The name of the domain and subdomains that were specified for the SSL/TLS
    certificate.|}*)

  email_address: string;
   (**{|
    The contact method for SSL/TLS certificate renewal alerts. You can enter
    one email address.|}*)

  instance_name: string;
   (**{|
    The name of the Lightsail instance.|}*)

}

type set_resource_access_for_bucket_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type resource_bucket_access = | Deny
  | Allow

type set_resource_access_for_bucket_request = {
  access: resource_bucket_access;
   (**{|
    The access setting.
    
    The following access settings are available:
    
    {ol 
          {- [allow] - Allows access to the bucket and its objects.
             }
          
          {- [deny] - Denies access to the bucket and its objects. Use this
             setting to remove access for a resource previously set to
             [allow].
             }
          
    }
    |}*)

  bucket_name: string;
   (**{|
    The name of the bucket for which to set access to another Lightsail
    resource.|}*)

  resource_name: string;
   (**{|
    The name of the Lightsail instance for which to set bucket access. The
    instance must be in a running or stopped state.|}*)

}

type set_ip_address_type_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type ip_address_type = | IPV6
  | IPV4
  | DUALSTACK

type set_ip_address_type_request = {
  accept_bundle_update: bool option;
   (**{|
    Required parameter to accept the instance bundle update when changing to,
    and from, IPv6-only.
    
    An instance bundle will change when switching from [dual-stack] or
    [ipv4], to [ipv6]. It also changes when switching from [ipv6], to
    [dual-stack] or [ipv4].
    
    You must include this parameter in the command to update the bundle. For
    example, if you switch from [dual-stack] to [ipv6], the bundle will be
    updated, and billing for the IPv6-only instance bundle begins
    immediately.
    |}*)

  ip_address_type: ip_address_type;
   (**{|
    The IP address type to set for the specified resource.
    
    The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and
    [dualstack] for IPv4 and IPv6.|}*)

  resource_name: string;
   (**{|
    The name of the resource for which to set the IP address type.|}*)

  resource_type: resource_type;
   (**{|
    The resource type.
    
    The resource values are [Distribution], [Instance], and [LoadBalancer].
    
    Distribution-related APIs are available only in the N. Virginia
    ([us-east-1]) Amazon Web Services Region. Set your Amazon Web Services
    Region configuration to [us-east-1] to create, view, or edit
    distributions.
    |}*)

}

(**{|
    Describes a web-based, remote graphical user interface (GUI), NICE DCV
    session. The session is used to access a virtual computer’s operating
    system or application.|}*)
type session = {
  is_primary: bool option;
   (**{|
    When true, this Boolean value indicates the primary session for the
    specified resource.|}*)

  url: string option;
   (**{|
    The session URL.|}*)

  name: string option;
   (**{|
    The session name.|}*)

}

type send_contact_method_verification_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type contact_method_verification_protocol = | Email

type send_contact_method_verification_request = {
  protocol: contact_method_verification_protocol;
   (**{|
    The protocol to verify, such as [Email] or [SMS] (text messaging).|}*)

}

type pricing_unit = | Queries
  | Bundles
  | GBMo
  | Hrs
  | GB

type currency = | USD

(**{|
    An estimate that's associated with a time period.|}*)
type estimate_by_time = {
  time_period: time_period option;
   (**{|
    The period of time, in days, that an estimate covers. The period has a
    start date and an end date. The start date must come before the end date.|}*)

  currency: currency option;
   (**{|
    The currency of the estimate in USD.|}*)

  unit_: float option;
   (**{|
    The number of pricing units used to calculate the total number of hours.
    For example, 1 unit equals 1 hour.|}*)

  pricing_unit: pricing_unit option;
   (**{|
    The unit of measurement that's used for the cost estimate.|}*)

  usage_cost: float option;
   (**{|
    The amount of cost or usage that's measured for the cost estimate.|}*)

}

(**{|
    Describes the estimated cost for resources in your Lightsail for Research
    account.|}*)
type cost_estimate = {
  results_by_time: estimate_by_time list option;
   (**{|
    The cost estimate result that's associated with a time period.|}*)

  usage_type: string option;
   (**{|
    The types of usage that are included in the estimate, such as costs,
    usage, or data transfer.|}*)

}

(**{|
    Describes the estimated cost or usage that a budget tracks.|}*)
type resource_budget_estimate = {
  end_time: float option;
   (**{|
    The estimate end time.|}*)

  start_time: float option;
   (**{|
    The estimate start time.|}*)

  cost_estimates: cost_estimate list option;
   (**{|
    The cost estimate for the specified budget.|}*)

  resource_type: resource_type option;
   (**{|
    The type of resource the budget will track.|}*)

  resource_name: string option;
   (**{|
    The resource name.|}*)

}

(**{|
    Describes the domain name system (DNS) records to add to your domain's
    DNS to validate it for an Amazon Lightsail certificate.|}*)
type resource_record = {
  value: string option;
   (**{|
    The value for the DNS record.|}*)

  type_: string option;
   (**{|
    The DNS record type.|}*)

  name: string option;
   (**{|
    The name of the record.|}*)

}

type reset_distribution_cache_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

  create_time: float option;
   (**{|
    The timestamp of the reset cache request ([1479734909.17]) in Unix time
    format.|}*)

  status: string option;
   (**{|
    The status of the reset cache request.|}*)

}

type reset_distribution_cache_request = {
  distribution_name: string option;
   (**{|
    The name of the distribution for which to reset cache.
    
    Use the [GetDistributions] action to get a list of distribution names
    that you can specify.|}*)

}

type dns_record_creation_state_code = | Failed
  | Started
  | Succeeded

(**{|
    Describes the creation state of the canonical name (CNAME) records that
    are automatically added by Amazon Lightsail to the DNS of a domain to
    validate domain ownership for an SSL/TLS certificate.
    
    When you create an SSL/TLS certificate for a Lightsail resource, you must
    add a set of CNAME records to the DNS of the domains for the certificate
    to validate that you own the domains. Lightsail can automatically add the
    CNAME records to the DNS of the domain if the DNS zone for the domain
    exists within your Lightsail account. If automatic record addition fails,
    or if you manage the DNS of your domain using a third-party service, then
    you must manually add the CNAME records to the DNS of your domain. For
    more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/verify-tls-ssl-certificate-using-dns-cname-https }Verify
    an SSL/TLS certificate in Amazon Lightsail} in the {i Amazon Lightsail
    Developer Guide}.|}*)
type dns_record_creation_state = {
  message: string option;
   (**{|
    The message that describes the reason for the status code.|}*)

  code: dns_record_creation_state_code option;
   (**{|
    The status code for the automated DNS record creation.
    
    Following are the possible values:
    
    {ol 
          {- [SUCCEEDED] - The validation records were successfully added to
             the domain.
             }
          
          {- [STARTED] - The automatic DNS record creation has started.
             }
          
          {- [FAILED] - The validation records failed to be added to the
             domain.
             }
          
    }
    |}*)

}

type certificate_domain_validation_status = | Success
  | Failed
  | PendingValidation

(**{|
    Describes the domain name system (DNS) records that you must add to the
    DNS of your registered domain to validate ownership for an Amazon
    Lightsail SSL/TLS certificate.|}*)
type domain_validation_record = {
  validation_status: certificate_domain_validation_status option;
   (**{|
    The validation status of the record.|}*)

  dns_record_creation_state: dns_record_creation_state option;
   (**{|
    An object that describes the state of the canonical name (CNAME) records
    that are automatically added by Lightsail to the DNS of the domain to
    validate domain ownership.|}*)

  resource_record: resource_record option;
   (**{|
    An object that describes the DNS records to add to your domain's DNS to
    validate it for the certificate.|}*)

  domain_name: string option;
   (**{|
    The domain name of the certificate validation record. For example,
    [example.com] or [www.example.com].|}*)

}

type renewal_status = | Failed
  | Success
  | PendingValidation
  | PendingAutoRenewal

(**{|
    Describes the status of a SSL/TLS certificate renewal managed by Amazon
    Lightsail.|}*)
type renewal_summary = {
  updated_at: float option;
   (**{|
    The timestamp when the certificate was last updated.|}*)

  renewal_status_reason: string option;
   (**{|
    The reason for the renewal status of the certificate.|}*)

  renewal_status: renewal_status option;
   (**{|
    The renewal status of the certificate.
    
    The following renewal status are possible:
    
    {ol 
          {- {b [PendingAutoRenewal]} - Lightsail is attempting to
             automatically validate the domain names of the certificate. No
             further action is required.
             }
          
          {- {b [PendingValidation]} - Lightsail couldn't automatically
             validate one or more domain names of the certificate. You must
             take action to validate these domain names or the certificate
             won't be renewed. Check to make sure your certificate's domain
             validation records exist in your domain's DNS, and that your
             certificate remains in use.
             }
          
          {- {b [Success]} - All domain names in the certificate are
             validated, and Lightsail renewed the certificate. No further
             action is required.
             }
          
          {- {b [Failed]} - One or more domain names were not validated
             before the certificate expired, and Lightsail did not renew the
             certificate. You can request a new certificate using the
             [CreateCertificate] action.
             }
          
    }
    |}*)

  domain_validation_records: domain_validation_record list option;
   (**{|
    An array of objects that describe the domain validation records of the
    certificate.|}*)

}

type release_static_ip_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type release_static_ip_request = {
  static_ip_name: string;
   (**{|
    The name of the static IP to delete.|}*)

}

(**{|
    Describes a database snapshot.|}*)
type relational_database_snapshot = {
  from_relational_database_blueprint_id: string option;
   (**{|
    The blueprint ID of the database from which the database snapshot was
    created. A blueprint describes the major engine version of a database.|}*)

  from_relational_database_bundle_id: string option;
   (**{|
    The bundle ID of the database from which the database snapshot was
    created.|}*)

  from_relational_database_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the database from which the database
    snapshot was created.|}*)

  from_relational_database_name: string option;
   (**{|
    The name of the source database from which the database snapshot was
    created.|}*)

  state: string option;
   (**{|
    The state of the database snapshot.|}*)

  size_in_gb: int option;
   (**{|
    The size of the disk in GB (for example, [32]) for the database snapshot.|}*)

  engine_version: string option;
   (**{|
    The database engine version for the database snapshot (for example,
    [5.7.23]).|}*)

  engine: string option;
   (**{|
    The software of the database snapshot (for example, [MySQL])|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The Lightsail resource type.|}*)

  location: resource_location option;
   (**{|
    The Region name and Availability Zone where the database snapshot is
    located.|}*)

  created_at: float option;
   (**{|
    The timestamp when the database snapshot was created.|}*)

  support_code: string option;
   (**{|
    The support code for the database snapshot. Include this code in your
    email to support when you have questions about a database snapshot in
    Lightsail. This code enables our support team to look up your Lightsail
    information more easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the database snapshot.|}*)

  name: string option;
   (**{|
    The name of the database snapshot.|}*)

}

type relational_database_password_version = | PENDING
  | PREVIOUS
  | CURRENT

type relational_database_metric_name = | NetworkTransmitThroughput
  | NetworkReceiveThroughput
  | FreeStorageSpace
  | DiskQueueDepth
  | DatabaseConnections
  | CPUUtilization

(**{|
    Describes the hardware of a database.|}*)
type relational_database_hardware = {
  ram_size_in_gb: float option;
   (**{|
    The amount of RAM in GB for the database.|}*)

  disk_size_in_gb: int option;
   (**{|
    The size of the disk for the database.|}*)

  cpu_count: int option;
   (**{|
    The number of vCPUs for the database.|}*)

}

(**{|
    Describes a pending database value modification.|}*)
type pending_modified_relational_database_values = {
  backup_retention_enabled: bool option;
   (**{|
    A Boolean value indicating whether automated backup retention is enabled.|}*)

  engine_version: string option;
   (**{|
    The database engine version.|}*)

  master_user_password: string option;
   (**{|
    The password for the master user of the database.|}*)

}

(**{|
    Describes an endpoint for a database.|}*)
type relational_database_endpoint = {
  address: string option;
   (**{|
    Specifies the DNS address of the database.|}*)

  port: int option;
   (**{|
    Specifies the port that the database is listening on.|}*)

}

(**{|
    Describes a pending database maintenance action.|}*)
type pending_maintenance_action = {
  current_apply_date: float option;
   (**{|
    The effective date of the pending database maintenance action.|}*)

  description: string option;
   (**{|
    Additional detail about the pending database maintenance action.|}*)

  action: string option;
   (**{|
    The type of pending database maintenance action.|}*)

}

(**{|
    Describes a database.|}*)
type relational_database = {
  ca_certificate_identifier: string option;
   (**{|
    The certificate associated with the database.|}*)

  pending_maintenance_actions: pending_maintenance_action list option;
   (**{|
    Describes the pending maintenance actions for the database.|}*)

  master_endpoint: relational_database_endpoint option;
   (**{|
    The master endpoint for the database.|}*)

  publicly_accessible: bool option;
   (**{|
    A Boolean value indicating whether the database is publicly accessible.|}*)

  preferred_maintenance_window: string option;
   (**{|
    The weekly time range during which system maintenance can occur on the
    database.
    
    In the format [ddd:hh24:mi-ddd:hh24:mi]. For example,
    [Tue:17:00-Tue:17:30].|}*)

  preferred_backup_window: string option;
   (**{|
    The daily time range during which automated backups are created for the
    database (for example, [16:00-16:30]).|}*)

  parameter_apply_status: string option;
   (**{|
    The status of parameter updates for the database.|}*)

  master_username: string option;
   (**{|
    The master user name of the database.|}*)

  latest_restorable_time: float option;
   (**{|
    The latest point in time to which the database can be restored. Formatted
    in Unix time.|}*)

  engine_version: string option;
   (**{|
    The database engine version (for example, [5.7.23]).|}*)

  engine: string option;
   (**{|
    The database software (for example, [MySQL]).|}*)

  pending_modified_values: pending_modified_relational_database_values option;
   (**{|
    Describes pending database value modifications.|}*)

  backup_retention_enabled: bool option;
   (**{|
    A Boolean value indicating whether automated backup retention is enabled
    for the database.|}*)

  secondary_availability_zone: string option;
   (**{|
    Describes the secondary Availability Zone of a high availability database.
    
    The secondary database is used for failover support of a high
    availability database.|}*)

  state: string option;
   (**{|
    Describes the current state of the database.|}*)

  hardware: relational_database_hardware option;
   (**{|
    Describes the hardware of the database.|}*)

  master_database_name: string option;
   (**{|
    The name of the master database created when the Lightsail database
    resource is created.|}*)

  relational_database_bundle_id: string option;
   (**{|
    The bundle ID for the database. A bundle describes the performance
    specifications for your database.|}*)

  relational_database_blueprint_id: string option;
   (**{|
    The blueprint ID for the database. A blueprint describes the major engine
    version of a database.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The Lightsail resource type for the database (for example,
    [RelationalDatabase]).|}*)

  location: resource_location option;
   (**{|
    The Region name and Availability Zone where the database is located.|}*)

  created_at: float option;
   (**{|
    The timestamp when the database was created. Formatted in Unix time.|}*)

  support_code: string option;
   (**{|
    The support code for the database. Include this code in your email to
    support when you have questions about a database in Lightsail. This code
    enables our support team to look up your Lightsail information more
    easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the database.|}*)

  name: string option;
   (**{|
    The unique name of the database resource in Lightsail.|}*)

}

(**{|
    Describes an event for a database.|}*)
type relational_database_event = {
  event_categories: string list option;
   (**{|
    The category that the database event belongs to.|}*)

  message: string option;
   (**{|
    The message of the database event.|}*)

  created_at: float option;
   (**{|
    The timestamp when the database event was created.|}*)

  resource: string option;
   (**{|
    The database that the database event relates to.|}*)

}

type relational_database_engine = | MYSQL

(**{|
    Describes a database bundle. A bundle describes the performance
    specifications of the database.|}*)
type relational_database_bundle = {
  is_active: bool option;
   (**{|
    A Boolean value indicating whether the database bundle is active.|}*)

  is_encrypted: bool option;
   (**{|
    A Boolean value indicating whether the database bundle is encrypted.|}*)

  cpu_count: int option;
   (**{|
    The number of virtual CPUs (vCPUs) for the database bundle.|}*)

  transfer_per_month_in_gb: int option;
   (**{|
    The data transfer rate per month in GB for the database bundle.|}*)

  disk_size_in_gb: int option;
   (**{|
    The size of the disk for the database bundle.|}*)

  ram_size_in_gb: float option;
   (**{|
    The amount of RAM in GB (for example, [2.0]) for the database bundle.|}*)

  price: float option;
   (**{|
    The cost of the database bundle in US currency.|}*)

  name: string option;
   (**{|
    The name for the database bundle.|}*)

  bundle_id: string option;
   (**{|
    The ID for the database bundle.|}*)

}

(**{|
    Describes a database image, or blueprint. A blueprint describes the major
    engine version of a database.|}*)
type relational_database_blueprint = {
  is_engine_default: bool option;
   (**{|
    A Boolean value indicating whether the engine version is the default for
    the database blueprint.|}*)

  engine_version_description: string option;
   (**{|
    The description of the database engine version for the database blueprint.|}*)

  engine_description: string option;
   (**{|
    The description of the database engine for the database blueprint.|}*)

  engine_version: string option;
   (**{|
    The database engine version for the database blueprint (for example,
    [5.7.23]).|}*)

  engine: relational_database_engine option;
   (**{|
    The database software of the database blueprint (for example, [MySQL]).|}*)

  blueprint_id: string option;
   (**{|
    The ID for the database blueprint.|}*)

}

type name_servers_update_state_code = | Started
  | Failed
  | Pending
  | Succeeded

(**{|
    Describes the state of the name server records update made by Amazon
    Lightsail to an Amazon Route 53 registered domain.
    
    For more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/understanding-dns-in-amazon-lightsail }DNS
    in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.|}*)
type name_servers_update_state = {
  message: string option;
   (**{|
    The message that describes the reason for the status code.|}*)

  code: name_servers_update_state_code option;
   (**{|
    The status code for the name servers update.
    
    Following are the possible values:
    
    {ol 
          {- [SUCCEEDED] - The name server records were successfully updated.
             }
          
          {- [PENDING] - The name server record update is in progress.
             }
          
          {- [FAILED] - The name server record update failed.
             }
          
          {- [STARTED] - The automatic name server record update started.
             }
          
    }
    |}*)

}

type r53_hosted_zone_deletion_state_code = | Started
  | Failed
  | Pending
  | Succeeded

(**{|
    Describes the deletion state of an Amazon Route 53 hosted zone for a
    domain that is being automatically delegated to an Amazon Lightsail DNS
    zone.|}*)
type r53_hosted_zone_deletion_state = {
  message: string option;
   (**{|
    The message that describes the reason for the status code.|}*)

  code: r53_hosted_zone_deletion_state_code option;
   (**{|
    The status code for the deletion state.
    
    Following are the possible values:
    
    {ol 
          {- [SUCCEEDED] - The hosted zone was successfully deleted.
             }
          
          {- [PENDING] - The hosted zone deletion is in progress.
             }
          
          {- [FAILED] - The hosted zone deletion failed.
             }
          
          {- [STARTED] - The hosted zone deletion started.
             }
          
    }
    |}*)

}

(**{|
    Describes the delegation state of an Amazon Route 53 registered domain
    to Amazon Lightsail.
    
    When you delegate an Amazon Route 53 registered domain to Lightsail, you
    can manage the DNS of the domain using a Lightsail DNS zone. You no
    longer use the Route 53 hosted zone to manage the DNS of the domain. To
    delegate the domain, Lightsail automatically updates the domain's name
    servers in Route 53 to the name servers of the Lightsail DNS zone. Then,
    Lightsail automatically deletes the Route 53 hosted zone for the domain.
    
    All of the following conditions must be true for automatic domain
    delegation to be successful:
    
    {ol 
          {- The registered domain must be in the same Amazon Web Services
             account as the Lightsail account making the request.
             }
          
          {- The user or entity making the request must have permission to
             manage domains in Route 53.
             }
          
          {- The Route 53 hosted zone for the domain must be empty. It
             cannot contain DNS records other than start of authority (SOA)
             and name server records.
             }
          
    }
    
    If automatic domain delegation fails, or if you manage the DNS of your
    domain using a service other than Route 53, then you must manually add
    the Lightsail DNS zone name servers to your domain in order to delegate
    management of its DNS to Lightsail. For more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-how-to-create-dns-entry }Creating
    a DNS zone to manage your domain’s records in Amazon Lightsail} in the
    {i Amazon Lightsail Developer Guide}.|}*)
type registered_domain_delegation_info = {
  r53_hosted_zone_deletion_state: r53_hosted_zone_deletion_state option;
   (**{|
    Describes the deletion state of an Amazon Route 53 hosted zone for a
    domain that is being automatically delegated to an Amazon Lightsail DNS
    zone.|}*)

  name_servers_update_state: name_servers_update_state option;
   (**{|
    An object that describes the state of the name server records that are
    automatically added to the Route 53 domain by Lightsail.|}*)

}

(**{|
    Describes a container image that is registered to an Amazon Lightsail
    container service.|}*)
type container_image = {
  created_at: float option;
   (**{|
    The timestamp when the container image was created.|}*)

  digest: string option;
   (**{|
    The digest of the container image.|}*)

  image: string option;
   (**{|
    The name of the container image.|}*)

}

type register_container_image_result = {
  container_image: container_image option;
   (**{|
    An object that describes a container image that is registered to a
    Lightsail container service|}*)

}

type register_container_image_request = {
  digest: string;
   (**{|
    The digest of the container image to be registered.|}*)

  label: string;
   (**{|
    The label for the container image when it's registered to the container
    service.
    
    Use a descriptive label that you can use to track the different versions
    of your registered container images.
    
    Use the [GetContainerImages] action to return the container images
    registered to a Lightsail container service. The label is the [] portion
    of the following image name example:
    
    {ol 
          {- [:container-service-1..1]
             }
          
    }
    
    If the name of your container service is [mycontainerservice], and the
    label that you specify is [mystaticwebsite], then the name of the
    registered container image will be
    [:mycontainerservice.mystaticwebsite.1].
    
    The number at the end of these image name examples represents the version
    of the registered container image. If you push and register another
    container image to the same Lightsail container service, with the same
    label, then the version number for the new registered container image
    will be [2]. If you push and register another container image, the
    version number will be [3], and so on.|}*)

  service_name: string;
   (**{|
    The name of the container service for which to register a container image.|}*)

}

(**{|
    Describes an Availability Zone. This is returned only as part of a
    [GetRegions] request.|}*)
type availability_zone = {
  state: string option;
   (**{|
    The state of the Availability Zone.|}*)

  zone_name: string option;
   (**{|
    The name of the Availability Zone. The format is [us-east-2a]
    (case-sensitive).|}*)

}

(**{|
    Describes the Amazon Web Services Region.|}*)
type region = {
  relational_database_availability_zones: availability_zone list option;
   (**{|
    The Availability Zones for databases. Follows the format [us-east-2a]
    (case-sensitive).|}*)

  availability_zones: availability_zone list option;
   (**{|
    The Availability Zones. Follows the format [us-east-2a] (case-sensitive).|}*)

  name: region_name option;
   (**{|
    The region name ([us-east-2]).|}*)

  display_name: string option;
   (**{|
    The display name ([Ohio]).|}*)

  description: string option;
   (**{|
    The description of the Amazon Web Services Region ([This region is
    recommended to serve users in the eastern United States and eastern
    Canada]).|}*)

  continent_code: string option;
   (**{|
    The continent code ([NA], meaning North America).|}*)

}

type record_state = | Failed
  | Succeeded
  | Started

type reboot_relational_database_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type reboot_relational_database_request = {
  relational_database_name: string;
   (**{|
    The name of your database to reboot.|}*)

}

type reboot_instance_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type reboot_instance_request = {
  instance_name: string;
   (**{|
    The name of the instance to reboot.|}*)

}

type put_instance_public_ports_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type network_protocol = | ICMPV6
  | ICMP
  | UDP
  | ALL
  | TCP

(**{|
    Describes ports to open on an instance, the IP addresses allowed to
    connect to the instance through the ports, and the protocol.|}*)
type port_info = {
  cidr_list_aliases: string list option;
   (**{|
    An alias that defines access for a preconfigured range of IP addresses.
    
    The only alias currently supported is [lightsail-connect], which allows
    IP addresses of the browser-based RDP/SSH client in the Lightsail console
    to connect to your instance.|}*)

  ipv6_cidrs: string list option;
   (**{|
    The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are
    allowed to connect to an instance through the ports, and the protocol.
    Only devices with an IPv6 address can connect to an instance through
    IPv6; otherwise, IPv4 should be used.
    
    The [cidrs] parameter lists the IPv4 addresses that are allowed to
    connect to an instance.
    
    For more information about CIDR block notation, see
    {{: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation }Classless
    Inter-Domain Routing} on {i Wikipedia}.|}*)

  cidrs: string list option;
   (**{|
    The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are
    allowed to connect to an instance through the ports, and the protocol.
    
    The [ipv6Cidrs] parameter lists the IPv6 addresses that are allowed to
    connect to an instance.
    
    Examples:
    
    {ol 
          {- To allow the IP address [192.0.2.44], specify [192.0.2.44] or
             [192.0.2.44/32].
             }
          
          {- To allow the IP addresses [192.0.2.0] to [192.0.2.255], specify
             [192.0.2.0/24].
             }
          
    }
    
    For more information about CIDR block notation, see
    {{: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation }Classless
    Inter-Domain Routing} on {i Wikipedia}.|}*)

  protocol: network_protocol option;
   (**{|
    The IP protocol name.
    
    The name can be one of the following:
    
    {ol 
          {- [tcp] - Transmission Control Protocol (TCP) provides reliable,
             ordered, and error-checked delivery of streamed data between
             applications running on hosts communicating by an IP network. If
             you have an application that doesn't require reliable data
             stream service, use UDP instead.
             }
          
          {- [all] - All transport layer protocol types. For more general
             information, see
             {{: https://en.wikipedia.org/wiki/Transport_layer }Transport
             layer} on {i Wikipedia}.
             }
          
          {- [udp] - With User Datagram Protocol (UDP), computer applications
             can send messages (or datagrams) to other hosts on an Internet
             Protocol (IP) network. Prior communications are not required to
             set up transmission channels or data paths. Applications that
             don't require reliable data stream service can use UDP, which
             provides a connectionless datagram service that emphasizes
             reduced latency over reliability. If you do require reliable
             data stream service, use TCP instead.
             }
          
          {- [icmp] - Internet Control Message Protocol (ICMP) is used to
             send error messages and operational information indicating
             success or failure when communicating with an instance. For
             example, an error is indicated when an instance could not be
             reached. When you specify [icmp] as the [protocol], you must
             specify the ICMP type using the [fromPort] parameter, and ICMP
             code using the [toPort] parameter.
             }
          
          {- [icmp6] - Internet Control Message Protocol (ICMP) for IPv6.
             When you specify [icmp6] as the [protocol], you must specify the
             ICMP type using the [fromPort] parameter, and ICMP code using
             the [toPort] parameter.
             }
          
    }
    |}*)

  to_port: int option;
   (**{|
    The last port in a range of open ports on an instance.
    
    Allowed ports:
    
    {ol 
          {- TCP and UDP - [0] to [65535]
             }
          
          {- ICMP - The ICMP code for IPv4 addresses. For example, specify
             [8] as the [fromPort] (ICMP type), and [-1] as the [toPort]
             (ICMP code), to enable ICMP Ping. For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages }Control
             Messages} on {i Wikipedia}.
             }
          
          {- ICMPv6 - The ICMP code for IPv6 addresses. For example, specify
             [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort]
             (ICMPv6 code). For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6 }Internet
             Control Message Protocol for IPv6}.
             }
          
    }
    |}*)

  from_port: int option;
   (**{|
    The first port in a range of open ports on an instance.
    
    Allowed ports:
    
    {ol 
          {- TCP and UDP - [0] to [65535]
             }
          
          {- ICMP - The ICMP type for IPv4 addresses. For example, specify
             [8] as the [fromPort] (ICMP type), and [-1] as the [toPort]
             (ICMP code), to enable ICMP Ping. For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages }Control
             Messages} on {i Wikipedia}.
             }
          
          {- ICMPv6 - The ICMP type for IPv6 addresses. For example, specify
             [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort]
             (ICMPv6 code). For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6 }Internet
             Control Message Protocol for IPv6}.
             }
          
    }
    |}*)

}

type put_instance_public_ports_request = {
  instance_name: string;
   (**{|
    The name of the instance for which to open ports.|}*)

  port_infos: port_info list;
   (**{|
    An array of objects to describe the ports to open for the specified
    instance.|}*)

}

type put_alarm_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type metric_name = | BurstCapacityPercentage
  | BurstCapacityTime
  | NetworkTransmitThroughput
  | NetworkReceiveThroughput
  | FreeStorageSpace
  | DiskQueueDepth
  | DatabaseConnections
  | RequestCount
  | RejectedConnectionCount
  | InstanceResponseTime
  | HTTPCode_Instance_5XX_Count
  | HTTPCode_Instance_4XX_Count
  | HTTPCode_Instance_3XX_Count
  | HTTPCode_Instance_2XX_Count
  | HTTPCode_LB_5XX_Count
  | HTTPCode_LB_4XX_Count
  | UnhealthyHostCount
  | HealthyHostCount
  | ClientTLSNegotiationErrorCount
  | StatusCheckFailed_System
  | StatusCheckFailed_Instance
  | StatusCheckFailed
  | NetworkOut
  | NetworkIn
  | CPUUtilization

type comparison_operator = | LessThanOrEqualToThreshold
  | LessThanThreshold
  | GreaterThanThreshold
  | GreaterThanOrEqualToThreshold

type contact_protocol = | SMS
  | Email

type put_alarm_request = {
  notification_enabled: bool option;
   (**{|
    Indicates whether the alarm is enabled.
    
    Notifications are enabled by default if you don't specify this parameter.|}*)

  notification_triggers: alarm_state list option;
   (**{|
    The alarm states that trigger a notification.
    
    An alarm has the following possible states:
    
    {ol 
          {- [ALARM] - The metric is outside of the defined threshold.
             }
          
          {- [INSUFFICIENT_DATA] - The alarm has just started, the metric is
             not available, or not enough data is available for the metric to
             determine the alarm state.
             }
          
          {- [OK] - The metric is within the defined threshold.
             }
          
    }
    
    When you specify a notification trigger, the [ALARM] state must be
    specified. The [INSUFFICIENT_DATA] and [OK] states can be specified in
    addition to the [ALARM] state.
    
    {ol 
          {- If you specify [OK] as an alarm trigger, a notification is sent
             when the alarm switches from an [ALARM] or [INSUFFICIENT_DATA]
             alarm state to an [OK] state. This can be thought of as an
             {i all clear} alarm notification.
             }
          
          {- If you specify [INSUFFICIENT_DATA] as the alarm trigger, a
             notification is sent when the alarm switches from an [OK] or
             [ALARM] alarm state to an [INSUFFICIENT_DATA] state.
             }
          
    }
    
    The notification trigger defaults to [ALARM] if you don't specify this
    parameter.|}*)

  contact_protocols: contact_protocol list option;
   (**{|
    The contact protocols to use for the alarm, such as [Email], [SMS] (text
    messaging), or both.
    
    A notification is sent via the specified contact protocol if
    notifications are enabled for the alarm, and when the alarm is triggered.
    
    A notification is not sent if a contact protocol is not specified, if the
    specified contact protocol is not configured in the Amazon Web Services
    Region, or if notifications are not enabled for the alarm using the
    [notificationEnabled] paramater.
    
    Use the [CreateContactMethod] action to configure a contact protocol in
    an Amazon Web Services Region.|}*)

  treat_missing_data: treat_missing_data option;
   (**{|
    Sets how this alarm will handle missing data points.
    
    An alarm can treat missing data in the following ways:
    
    {ol 
          {- [breaching] - Assume the missing data is not within the
             threshold. Missing data counts towards the number of times the
             metric is not within the threshold.
             }
          
          {- [notBreaching] - Assume the missing data is within the
             threshold. Missing data does not count towards the number of
             times the metric is not within the threshold.
             }
          
          {- [ignore] - Ignore the missing data. Maintains the current alarm
             state.
             }
          
          {- [missing] - Missing data is treated as missing.
             }
          
    }
    
    If [treatMissingData] is not specified, the default behavior of [missing]
    is used.|}*)

  datapoints_to_alarm: int option;
   (**{|
    The number of data points that must be not within the specified threshold
    to trigger the alarm. If you are setting an "M out of N" alarm, this
    value ([datapointsToAlarm]) is the M.|}*)

  evaluation_periods: int;
   (**{|
    The number of most recent periods over which data is compared to the
    specified threshold. If you are setting an "M out of N" alarm, this value
    ([evaluationPeriods]) is the N.
    
    If you are setting an alarm that requires that a number of consecutive
    data points be breaching to trigger the alarm, this value specifies the
    rolling period of time in which data points are evaluated.
    
    Each evaluation period is five minutes long. For example, specify an
    evaluation period of 24 to evaluate a metric over a rolling period of two
    hours.
    
    You can specify a minimum valuation period of 1 (5 minutes), and a
    maximum evaluation period of 288 (24 hours).|}*)

  threshold: float;
   (**{|
    The value against which the specified statistic is compared.|}*)

  comparison_operator: comparison_operator;
   (**{|
    The arithmetic operation to use when comparing the specified statistic to
    the threshold. The specified statistic value is used as the first
    operand.|}*)

  monitored_resource_name: string;
   (**{|
    The name of the Lightsail resource that will be monitored.
    
    Instances, load balancers, and relational databases are the only
    Lightsail resources that can currently be monitored by alarms.|}*)

  metric_name: metric_name;
   (**{|
    The name of the metric to associate with the alarm.
    
    You can configure up to two alarms per metric.
    
    The following metrics are available for each resource type:
    
    {ol 
          {- {b Instances}: [BurstCapacityPercentage], [BurstCapacityTime],
             [CPUUtilization], [NetworkIn], [NetworkOut],
             [StatusCheckFailed], [StatusCheckFailed_Instance], and
             [StatusCheckFailed_System].
             }
          
          {- {b Load balancers}: [ClientTLSNegotiationErrorCount],
             [HealthyHostCount], [UnhealthyHostCount],
             [HTTPCode_LB_4XX_Count], [HTTPCode_LB_5XX_Count],
             [HTTPCode_Instance_2XX_Count], [HTTPCode_Instance_3XX_Count],
             [HTTPCode_Instance_4XX_Count], [HTTPCode_Instance_5XX_Count],
             [InstanceResponseTime], [RejectedConnectionCount], and
             [RequestCount].
             }
          
          {- {b Relational databases}: [CPUUtilization],
             [DatabaseConnections], [DiskQueueDepth], [FreeStorageSpace],
             [NetworkReceiveThroughput], and [NetworkTransmitThroughput].
             }
          
    }
    
    For more information about these metrics, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-resource-health-metrics#available-metrics }Metrics
    available in Lightsail}.|}*)

  alarm_name: string;
   (**{|
    The name for the alarm. Specify the name of an existing alarm to update,
    and overwrite the previous configuration of the alarm.|}*)

}

type port_state = | Closed
  | Open

type port_info_source_type = | Closed
  | None
  | Instance
  | Default

type port_access_type = | Private
  | Public

type peer_vpc_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type peer_vpc_request = unit

(**{|
    The password data for the Windows Server-based instance, including the
    ciphertext and the key pair name.|}*)
type password_data = {
  key_pair_name: string option;
   (**{|
    The name of the key pair that you used when creating your instance. If no
    key pair name was specified when creating the instance, Lightsail uses
    the default key pair ([LightsailDefaultKeyPair]).
    
    If you are using a custom key pair, you need to use your own means of
    decrypting your password using the [ciphertext]. Lightsail creates the
    ciphertext by encrypting your password with the public key part of this
    key pair.|}*)

  ciphertext: string option;
   (**{|
    The encrypted password. Ciphertext will be an empty string if access to
    your new instance is not ready yet. When you create an instance, it can
    take up to 15 minutes for the instance to be ready.
    
    If you use the default key pair ([LightsailDefaultKeyPair]), the
    decrypted password will be available in the password field.
    
    If you are using a custom key pair, you need to use your own means of
    decryption.
    
    If you change the Administrator password on the instance, Lightsail will
    continue to return the original ciphertext value. When accessing the
    instance using RDP, you need to manually enter the Administrator password
    after changing it from the default.
    |}*)

}

(**{|
    Describes the origin resource of an Amazon Lightsail content delivery
    network (CDN) distribution.
    
    An origin can be a Lightsail instance, bucket, or load balancer. A
    distribution pulls content from an origin, caches it, and serves it to
    viewers via a worldwide network of edge servers.|}*)
type origin = {
  response_timeout: int option;
   (**{|
    The amount of time, in seconds, that the distribution waits for a
    response after forwarding a request to the origin. The minimum timeout is
    1 second, the maximum is 60 seconds, and the default (if you don't
    specify otherwise) is 30 seconds.|}*)

  protocol_policy: origin_protocol_policy_enum option;
   (**{|
    The protocol that your Amazon Lightsail distribution uses when
    establishing a connection with your origin to pull content.|}*)

  region_name: region_name option;
   (**{|
    The AWS Region name of the origin resource.|}*)

  resource_type: resource_type option;
   (**{|
    The resource type of the origin resource ({i Instance}).|}*)

  name: string option;
   (**{|
    The name of the origin resource.|}*)

}

type open_instance_public_ports_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type open_instance_public_ports_request = {
  instance_name: string;
   (**{|
    The name of the instance for which to open ports.|}*)

  port_info: port_info;
   (**{|
    An object to describe the ports to open for the specified instance.|}*)

}

(**{|
    Describes the monthly data transfer in and out of your virtual private
    server (or {i instance}).|}*)
type monthly_transfer = {
  gb_per_month_allocated: int option;
   (**{|
    The amount allocated per month (in GB).|}*)

}

(**{|
    Describes resource being monitored by an alarm.
    
    An alarm is a way to monitor your Amazon Lightsail resource metrics. For
    more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms }Alarms
    in Amazon Lightsail}.|}*)
type monitored_resource_info = {
  resource_type: resource_type option;
   (**{|
    The Lightsail resource type of the resource being monitored.
    
    Instances, load balancers, and relational databases are the only
    Lightsail resources that can currently be monitored by alarms.|}*)

  name: string option;
   (**{|
    The name of the Lightsail resource being monitored.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the resource being monitored.|}*)

}

type metric_unit = | None
  | CountSecond
  | TerabitsSecond
  | GigabitsSecond
  | MegabitsSecond
  | KilobitsSecond
  | BitsSecond
  | TerabytesSecond
  | GigabytesSecond
  | MegabytesSecond
  | KilobytesSecond
  | BytesSecond
  | Count
  | Percent
  | Terabits
  | Gigabits
  | Megabits
  | Kilobits
  | Bits
  | Terabytes
  | Gigabytes
  | Megabytes
  | Kilobytes
  | Bytes
  | Milliseconds
  | Microseconds
  | Seconds

type metric_statistic = | SampleCount
  | Average
  | Sum
  | Maximum
  | Minimum

(**{|
    Describes the metric data point.|}*)
type metric_datapoint = {
  unit_: metric_unit option;
   (**{|
    The unit.|}*)

  timestamp_: float option;
   (**{|
    The timestamp ([1479816991.349]).|}*)

  sum: float option;
   (**{|
    The sum.|}*)

  sample_count: float option;
   (**{|
    The sample count.|}*)

  minimum: float option;
   (**{|
    The minimum.|}*)

  maximum: float option;
   (**{|
    The maximum.|}*)

  average: float option;
   (**{|
    The average.|}*)

}

(**{|
    Describes a database log event.|}*)
type log_event = {
  message: string option;
   (**{|
    The message of the database log event.|}*)

  created_at: float option;
   (**{|
    The timestamp when the database log event was created.|}*)

}

(**{|
    Describes the TLS security policies that are available for Lightsail load
    balancers.
    
    For more information about load balancer TLS security policies, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configure-load-balancer-tls-security-policy }Configuring
    TLS security policies on your Amazon Lightsail load balancers} in the
    {i Amazon Lightsail Developer Guide}.|}*)
type load_balancer_tls_policy = {
  ciphers: string list option;
   (**{|
    The ciphers used by the TLS security policy.
    
    The ciphers are listed in order of preference.|}*)

  protocols: string list option;
   (**{|
    The protocols used in a given TLS security policy.|}*)

  description: string option;
   (**{|
    The description of the TLS security policy.|}*)

  is_default: bool option;
   (**{|
    A Boolean value that indicates whether the TLS security policy is the
    default.|}*)

  name: string option;
   (**{|
    The name of the TLS security policy.|}*)

}

(**{|
    Provides a summary of SSL/TLS certificate metadata.|}*)
type load_balancer_tls_certificate_summary = {
  is_attached: bool option;
   (**{|
    When [true], the SSL/TLS certificate is attached to the Lightsail load
    balancer.|}*)

  name: string option;
   (**{|
    The name of the SSL/TLS certificate.|}*)

}

type load_balancer_tls_certificate_status = | Unknown
  | Failed
  | Revoked
  | ValidationTimedOut
  | Expired
  | Inactive
  | Issued
  | PendingValidation

type load_balancer_tls_certificate_revocation_reason = | AACompromise
  | PrivilegeWithdrawn
  | RemoveFromCrl
  | CertificateHold
  | CessationOfOperation
  | Superceded
  | AffiliationChanged
  | CaCompromise
  | KeyCompromise
  | Unspecified

type load_balancer_tls_certificate_renewal_status = | Failed
  | Success
  | PendingValidation
  | PendingAutoRenewal

type load_balancer_tls_certificate_domain_status = | Success
  | Failed
  | PendingValidation

(**{|
    Contains information about the domain names on an SSL/TLS certificate
    that you will use to validate domain ownership.|}*)
type load_balancer_tls_certificate_domain_validation_option = {
  validation_status: load_balancer_tls_certificate_domain_status option;
   (**{|
    The status of the domain validation. Valid values are listed below.|}*)

  domain_name: string option;
   (**{|
    The fully qualified domain name in the certificate request.|}*)

}

(**{|
    Contains information about the status of Lightsail's managed renewal for
    the certificate.
    
    The renewal status of the certificate.
    
    The following renewal status are possible:
    
    {ol 
          {- {b [PendingAutoRenewal]} - Lightsail is attempting to
             automatically validate the domain names in the certificate. No
             further action is required.
             }
          
          {- {b [PendingValidation]} - Lightsail couldn't automatically
             validate one or more domain names in the certificate. You must
             take action to validate these domain names or the certificate
             won't be renewed. If you used DNS validation, check to make sure
             your certificate's domain validation records exist in your
             domain's DNS, and that your certificate remains in use.
             }
          
          {- {b [Success]} - All domain names in the certificate are
             validated, and Lightsail renewed the certificate. No further
             action is required.
             }
          
          {- {b [Failed]} - One or more domain names were not validated
             before the certificate expired, and Lightsail did not renew the
             certificate. You can request a new certificate using the
             [CreateCertificate] action.
             }
          
    }
    |}*)
type load_balancer_tls_certificate_renewal_summary = {
  domain_validation_options: load_balancer_tls_certificate_domain_validation_option list option;
   (**{|
    Contains information about the validation of each domain name in the
    certificate, as it pertains to Lightsail's managed renewal. This is
    different from the initial validation that occurs as a result of the
    RequestCertificate request.|}*)

  renewal_status: load_balancer_tls_certificate_renewal_status option;
   (**{|
    The renewal status of the certificate.
    
    The following renewal status are possible:
    
    {ol 
          {- {b [PendingAutoRenewal]} - Lightsail is attempting to
             automatically validate the domain names of the certificate. No
             further action is required.
             }
          
          {- {b [PendingValidation]} - Lightsail couldn't automatically
             validate one or more domain names of the certificate. You must
             take action to validate these domain names or the certificate
             won't be renewed. Check to make sure your certificate's domain
             validation records exist in your domain's DNS, and that your
             certificate remains in use.
             }
          
          {- {b [Success]} - All domain names in the certificate are
             validated, and Lightsail renewed the certificate. No further
             action is required.
             }
          
          {- {b [Failed]} - One or more domain names were not validated
             before the certificate expired, and Lightsail did not renew the
             certificate. You can request a new certificate using the
             [CreateCertificate] action.
             }
          
    }
    |}*)

}

type load_balancer_tls_certificate_dns_record_creation_state_code = | Failed
  | Started
  | Succeeded

(**{|
    An object that describes the state of the canonical name (CNAME) records
    that are automatically added by Lightsail to the DNS of the domain to
    validate domain ownership.|}*)
type load_balancer_tls_certificate_dns_record_creation_state = {
  message: string option;
   (**{|
    The message that describes the reason for the status code.|}*)

  code: load_balancer_tls_certificate_dns_record_creation_state_code option;
   (**{|
    The status code for the automated DNS record creation.
    
    Following are the possible values:
    
    {ol 
          {- [SUCCEEDED] - The validation records were successfully added.
             }
          
          {- [STARTED] - The automatic DNS record creation has started.
             }
          
          {- [FAILED] - The validation record addition failed.
             }
          
    }
    |}*)

}

(**{|
    Describes the validation record of each domain name in the SSL/TLS
    certificate.|}*)
type load_balancer_tls_certificate_domain_validation_record = {
  dns_record_creation_state: load_balancer_tls_certificate_dns_record_creation_state option;
   (**{|
    An object that describes the state of the canonical name (CNAME) records
    that are automatically added by Lightsail to the DNS of a domain to
    validate domain ownership.|}*)

  domain_name: string option;
   (**{|
    The domain name against which your SSL/TLS certificate was validated.|}*)

  validation_status: load_balancer_tls_certificate_domain_status option;
   (**{|
    The validation status. Valid values are listed below.|}*)

  value: string option;
   (**{|
    The value for that type.|}*)

  type_: string option;
   (**{|
    The type of validation record. For example, [CNAME] for domain validation.|}*)

  name: string option;
   (**{|
    A fully qualified domain name in the certificate. For example,
    [example.com].|}*)

}

type load_balancer_tls_certificate_failure_reason = | Other
  | InvalidPublicDomain
  | DomainNotAllowed
  | AdditionalVerificationRequired
  | NoAvailableContacts

(**{|
    Describes a load balancer SSL/TLS certificate.
    
    TLS is just an updated, more secure version of Secure Socket Layer (SSL).|}*)
type load_balancer_tls_certificate = {
  subject_alternative_names: string list option;
   (**{|
    An array of strings that specify the alternate domains ([example2.com])
    and subdomains ([blog.example.com]) for the certificate.|}*)

  subject: string option;
   (**{|
    The name of the entity that is associated with the public key contained
    in the certificate.|}*)

  signature_algorithm: string option;
   (**{|
    The algorithm that was used to sign the certificate.|}*)

  serial: string option;
   (**{|
    The serial number of the certificate.|}*)

  revoked_at: float option;
   (**{|
    The timestamp when the certificate was revoked. This value is present
    only when the certificate status is [REVOKED].|}*)

  revocation_reason: load_balancer_tls_certificate_revocation_reason option;
   (**{|
    The reason the certificate was revoked. This value is present only when
    the certificate status is [REVOKED].|}*)

  renewal_summary: load_balancer_tls_certificate_renewal_summary option;
   (**{|
    An object that describes the status of the certificate renewal managed by
    Lightsail.|}*)

  not_before: float option;
   (**{|
    The timestamp when the SSL/TLS certificate is first valid.|}*)

  not_after: float option;
   (**{|
    The timestamp when the SSL/TLS certificate expires.|}*)

  key_algorithm: string option;
   (**{|
    The algorithm used to generate the key pair (the public and private key).|}*)

  issuer: string option;
   (**{|
    The issuer of the certificate.|}*)

  issued_at: float option;
   (**{|
    The time when the SSL/TLS certificate was issued.|}*)

  failure_reason: load_balancer_tls_certificate_failure_reason option;
   (**{|
    The validation failure reason, if any, of the certificate.
    
    The following failure reasons are possible:
    
    {ol 
          {- {b [NO_AVAILABLE_CONTACTS]} - This failure applies to email
             validation, which is not available for Lightsail certificates.
             }
          
          {- {b [ADDITIONAL_VERIFICATION_REQUIRED]} - Lightsail requires
             additional information to process this certificate request. This
             can happen as a fraud-protection measure, such as when the
             domain ranks within the Alexa top 1000 websites. To provide the
             required information, use the
             {{: https://console.aws.amazon.com/support/home }AWS Support
             Center} to contact AWS Support.
             
          You cannot request a certificate for Amazon-owned domain names such
          as those ending in amazonaws.com, cloudfront.net, or
          elasticbeanstalk.com.
          }
          
          {- {b [DOMAIN_NOT_ALLOWED]} - One or more of the domain names in
             the certificate request was reported as an unsafe domain by
             {{: https://www.virustotal.com/gui/home/url }VirusTotal}. To
             correct the problem, search for your domain name on the
             {{: https://www.virustotal.com/gui/home/url }VirusTotal}
             website. If your domain is reported as suspicious, see
             {{: https://developers.google.com/web/fundamentals/security/hacked }Google
             Help for Hacked Websites} to learn what you can do.
             
          If you believe that the result is a false positive, notify the
          organization that is reporting the domain. VirusTotal is an
          aggregate of several antivirus and URL scanners and cannot remove
          your domain from a block list itself. After you correct the problem
          and the VirusTotal registry has been updated, request a new
          certificate.
          
          If you see this error and your domain is not included in the
          VirusTotal list, visit the
          {{: https://console.aws.amazon.com/support/home }AWS Support
          Center} and create a case.
          }
          
          {- {b [INVALID_PUBLIC_DOMAIN]} - One or more of the domain names in
             the certificate request is not valid. Typically, this is because
             a domain name in the request is not a valid top-level domain.
             Try to request a certificate again, correcting any spelling
             errors or typos that were in the failed request, and ensure that
             all domain names in the request are for valid top-level domains.
             For example, you cannot request a certificate for
             [example.invalidpublicdomain] because [invalidpublicdomain] is
             not a valid top-level domain.
             }
          
          {- {b [OTHER]} - Typically, this failure occurs when there is a
             typographical error in one or more of the domain names in the
             certificate request. Try to request a certificate again,
             correcting any spelling errors or typos that were in the failed
             request.
             }
          
    }
    |}*)

  domain_validation_records: load_balancer_tls_certificate_domain_validation_record list option;
   (**{|
    An array of LoadBalancerTlsCertificateDomainValidationRecord objects
    describing the records.|}*)

  domain_name: string option;
   (**{|
    The domain name for your SSL/TLS certificate.|}*)

  status: load_balancer_tls_certificate_status option;
   (**{|
    The validation status of the SSL/TLS certificate. Valid values are below.|}*)

  is_attached: bool option;
   (**{|
    When [true], the SSL/TLS certificate is attached to the Lightsail load
    balancer.|}*)

  load_balancer_name: string option;
   (**{|
    The load balancer name where your SSL/TLS certificate is attached.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The resource type ([LoadBalancerTlsCertificate]).
    
    {ol 
          {- {b [Instance]} - A Lightsail instance (a virtual private server)
             }
          
          {- {b [StaticIp]} - A static IP address
             }
          
          {- {b [KeyPair]} - The key pair used to connect to a Lightsail
             instance
             }
          
          {- {b [InstanceSnapshot]} - A Lightsail instance snapshot
             }
          
          {- {b [Domain]} - A DNS zone
             }
          
          {- {b [PeeredVpc]} - A peered VPC
             }
          
          {- {b [LoadBalancer]} - A Lightsail load balancer
             }
          
          {- {b [LoadBalancerTlsCertificate]} - An SSL/TLS certificate
             associated with a Lightsail load balancer
             }
          
          {- {b [Disk]} - A Lightsail block storage disk
             }
          
          {- {b [DiskSnapshot]} - A block storage disk snapshot
             }
          
    }
    |}*)

  location: resource_location option;
   (**{|
    The Amazon Web Services Region and Availability Zone where you created
    your certificate.|}*)

  created_at: float option;
   (**{|
    The time when you created your SSL/TLS certificate.|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about your Lightsail load balancer or SSL/TLS certificate.
    This code enables our support team to look up your Lightsail information
    more easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the SSL/TLS certificate.|}*)

  name: string option;
   (**{|
    The name of the SSL/TLS certificate ([my-certificate]).|}*)

}

type load_balancer_state = | Unknown
  | Failed
  | ActiveImpaired
  | Provisioning
  | Active

type load_balancer_protocol = | HTTP
  | HTTP_HTTPS

type load_balancer_metric_name = | RequestCount
  | RejectedConnectionCount
  | InstanceResponseTime
  | HTTPCode_Instance_5XX_Count
  | HTTPCode_Instance_4XX_Count
  | HTTPCode_Instance_3XX_Count
  | HTTPCode_Instance_2XX_Count
  | HTTPCode_LB_5XX_Count
  | HTTPCode_LB_4XX_Count
  | UnhealthyHostCount
  | HealthyHostCount
  | ClientTLSNegotiationErrorCount

type instance_health_state = | Unavailable
  | Draining
  | Unused
  | Unhealthy
  | Healthy
  | Initial

type instance_health_reason = | InstanceIpUnusable
  | InstanceInvalidState
  | InstanceDeregistrationInProgress
  | InstanceNotInUse
  | InstanceNotRegistered
  | InstanceFailedHealthChecks
  | InstanceTimeout
  | InstanceResponseCodeMismatch
  | LbInternalError
  | LbInitialHealthChecking
  | LbRegistrationInProgress

(**{|
    Describes information about the health of the instance.|}*)
type instance_health_summary = {
  instance_health_reason: instance_health_reason option;
   (**{|
    More information about the instance health. If the [instanceHealth] is
    [healthy], then an [instanceHealthReason] value is not provided.
    
    If {b [instanceHealth]} is [initial], the {b [instanceHealthReason]}
    value can be one of the following:
    
    {ol 
          {- {b [Lb.RegistrationInProgress]} - The target instance is in the
             process of being registered with the load balancer.
             }
          
          {- {b [Lb.InitialHealthChecking]} - The Lightsail load balancer is
             still sending the target instance the minimum number of health
             checks required to determine its health status.
             }
          
    }
    
    If {b [instanceHealth]} is [unhealthy], the {b [instanceHealthReason]}
    value can be one of the following:
    
    {ol 
          {- {b [Instance.ResponseCodeMismatch]} - The health checks did not
             return an expected HTTP code.
             }
          
          {- {b [Instance.Timeout]} - The health check requests timed out.
             }
          
          {- {b [Instance.FailedHealthChecks]} - The health checks failed
             because the connection to the target instance timed out, the
             target instance response was malformed, or the target instance
             failed the health check for an unknown reason.
             }
          
          {- {b [Lb.InternalError]} - The health checks failed due to an
             internal error.
             }
          
    }
    
    If {b [instanceHealth]} is [unused], the {b [instanceHealthReason]} value
    can be one of the following:
    
    {ol 
          {- {b [Instance.NotRegistered]} - The target instance is not
             registered with the target group.
             }
          
          {- {b [Instance.NotInUse]} - The target group is not used by any
             load balancer, or the target instance is in an Availability Zone
             that is not enabled for its load balancer.
             }
          
          {- {b [Instance.IpUnusable]} - The target IP address is reserved
             for use by a Lightsail load balancer.
             }
          
          {- {b [Instance.InvalidState]} - The target is in the stopped or
             terminated state.
             }
          
    }
    
    If {b [instanceHealth]} is [draining], the {b [instanceHealthReason]}
    value can be one of the following:
    
    {ol 
          {- {b [Instance.DeregistrationInProgress]} - The target instance is
             in the process of being deregistered and the deregistration
             delay period has not expired.
             }
          
    }
    |}*)

  instance_health: instance_health_state option;
   (**{|
    Describes the overall instance health. Valid values are below.|}*)

  instance_name: string option;
   (**{|
    The name of the Lightsail instance for which you are requesting health
    check data.|}*)

}

(**{|
    Describes a load balancer.|}*)
type load_balancer = {
  tls_policy_name: string option;
   (**{|
    The name of the TLS security policy for the load balancer.|}*)

  https_redirection_enabled: bool option;
   (**{|
    A Boolean value that indicates whether HTTPS redirection is enabled for
    the load balancer.|}*)

  ip_address_type: ip_address_type option;
   (**{|
    The IP address type of the load balancer.
    
    The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and
    [dualstack] for IPv4 and IPv6.|}*)

  configuration_options: (string * string) list option;
   (**{|
    A string to string map of the configuration options for your load
    balancer. Valid values are listed below.|}*)

  tls_certificate_summaries: load_balancer_tls_certificate_summary list option;
   (**{|
    An array of LoadBalancerTlsCertificateSummary objects that provide
    additional information about the SSL/TLS certificates. For example, if
    [true], the certificate is attached to the load balancer.|}*)

  instance_health_summary: instance_health_summary list option;
   (**{|
    An array of InstanceHealthSummary objects describing the health of the
    load balancer.|}*)

  instance_port: int option;
   (**{|
    The port where the load balancer will direct traffic to your Lightsail
    instances. For HTTP traffic, it's port 80. For HTTPS traffic, it's port
    443.|}*)

  health_check_path: string option;
   (**{|
    The path you specified to perform your health checks. If no path is
    specified, the load balancer tries to make a request to the default
    (root) page.|}*)

  public_ports: int list option;
   (**{|
    An array of public port settings for your load balancer. For HTTP, use
    port 80. For HTTPS, use port 443.|}*)

  protocol: load_balancer_protocol option;
   (**{|
    The protocol you have enabled for your load balancer. Valid values are
    below.
    
    You can't just have [HTTP_HTTPS], but you can have just [HTTP].|}*)

  state: load_balancer_state option;
   (**{|
    The status of your load balancer. Valid values are below.|}*)

  dns_name: string option;
   (**{|
    The DNS name of your Lightsail load balancer.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The resource type ([LoadBalancer].|}*)

  location: resource_location option;
   (**{|
    The AWS Region where your load balancer was created ([us-east-2a]).
    Lightsail automatically creates your load balancer across Availability
    Zones.|}*)

  created_at: float option;
   (**{|
    The date when your load balancer was created.|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about your Lightsail load balancer. This code enables our
    support team to look up your Lightsail information more easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the load balancer.|}*)

  name: string option;
   (**{|
    The name of the load balancer ([my-load-balancer]).|}*)

}

type is_vpc_peered_result = {
  is_peered: bool option;
   (**{|
    Returns [true] if the Lightsail VPC is peered; otherwise, [false].|}*)

}

type is_vpc_peered_request = unit

type import_key_pair_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type import_key_pair_request = {
  public_key_base64: string;
   (**{|
    A base64-encoded public key of the [ssh-rsa] type.|}*)

  key_pair_name: string;
   (**{|
    The name of the key pair for which you want to import the public key.|}*)

}

type get_static_ips_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetStaticIps] request
    and specify the next page token using the [pageToken] parameter.|}*)

  static_ips: static_ip list option;
   (**{|
    An array of key-value pairs containing information about your get static
    IPs request.|}*)

}

type get_static_ips_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetStaticIps] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

}

type get_static_ip_result = {
  static_ip: static_ip option;
   (**{|
    An array of key-value pairs containing information about the requested
    static IP.|}*)

}

type get_static_ip_request = {
  static_ip_name: string;
   (**{|
    The name of the static IP in Lightsail.|}*)

}

type get_setup_history_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetSetupHistory]
    request and specify the next page token using the pageToken parameter.|}*)

  setup_history: setup_history list option;
   (**{|
    The historical information that's returned.|}*)

}

type get_setup_history_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetSetupHistory] request. If
    your results are paginated, the response will return a next page token
    that you can specify as the page token in a subsequent request.|}*)

  resource_name: string;
   (**{|
    The name of the resource for which you are requesting information.|}*)

}

type get_relational_database_snapshots_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another
    [GetRelationalDatabaseSnapshots] request and specify the next page token
    using the [pageToken] parameter.|}*)

  relational_database_snapshots: relational_database_snapshot list option;
   (**{|
    An object describing the result of your get relational database snapshots
    request.|}*)

}

type get_relational_database_snapshots_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetRelationalDatabaseSnapshots]
    request. If your results are paginated, the response will return a next
    page token that you can specify as the page token in a subsequent
    request.|}*)

}

type get_relational_database_snapshot_result = {
  relational_database_snapshot: relational_database_snapshot option;
   (**{|
    An object describing the specified database snapshot.|}*)

}

type get_relational_database_snapshot_request = {
  relational_database_snapshot_name: string;
   (**{|
    The name of the database snapshot for which to get information.|}*)

}

type get_relational_databases_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetRelationalDatabases]
    request and specify the next page token using the [pageToken] parameter.|}*)

  relational_databases: relational_database list option;
   (**{|
    An object describing the result of your get relational databases request.|}*)

}

type get_relational_databases_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetRelationalDatabases] request.
    If your results are paginated, the response will return a next page token
    that you can specify as the page token in a subsequent request.|}*)

}

type get_relational_database_parameters_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another
    [GetRelationalDatabaseParameters] request and specify the next page token
    using the [pageToken] parameter.|}*)

  parameters: relational_database_parameter list option;
   (**{|
    An object describing the result of your get relational database
    parameters request.|}*)

}

type get_relational_database_parameters_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetRelationalDatabaseParameters]
    request. If your results are paginated, the response will return a next
    page token that you can specify as the page token in a subsequent
    request.|}*)

  relational_database_name: string;
   (**{|
    The name of your database for which to get parameters.|}*)

}

type get_relational_database_metric_data_result = {
  metric_data: metric_datapoint list option;
   (**{|
    An array of objects that describe the metric data returned.|}*)

  metric_name: relational_database_metric_name option;
   (**{|
    The name of the metric returned.|}*)

}

type get_relational_database_metric_data_request = {
  statistics: metric_statistic list;
   (**{|
    The statistic for the metric.
    
    The following statistics are available:
    
    {ol 
          {- [Minimum] - The lowest value observed during the specified
             period. Use this value to determine low volumes of activity for
             your application.
             }
          
          {- [Maximum] - The highest value observed during the specified
             period. Use this value to determine high volumes of activity for
             your application.
             }
          
          {- [Sum] - All values submitted for the matching metric added
             together. You can use this statistic to determine the total
             volume of a metric.
             }
          
          {- [Average] - The value of Sum / SampleCount during the specified
             period. By comparing this statistic with the Minimum and Maximum
             values, you can determine the full scope of a metric and how
             close the average use is to the Minimum and Maximum values. This
             comparison helps you to know when to increase or decrease your
             resources.
             }
          
          {- [SampleCount] - The count, or number, of data points used for
             the statistical calculation.
             }
          
    }
    |}*)

  unit_: metric_unit;
   (**{|
    The unit for the metric data request. Valid units depend on the metric
    data being requested. For the valid units with each available metric, see
    the [metricName] parameter.|}*)

  end_time: float;
   (**{|
    The end of the time interval from which to get metric data.
    
    Constraints:
    
    {ol 
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you wish to use an end time of October 1, 2018, at
          8 PM UTC, then you input [1538424000] as the end time.
          }
          
    }
    |}*)

  start_time: float;
   (**{|
    The start of the time interval from which to get metric data.
    
    Constraints:
    
    {ol 
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you wish to use a start time of October 1, 2018, at
          8 PM UTC, then you input [1538424000] as the start time.
          }
          
    }
    |}*)

  period: int;
   (**{|
    The granularity, in seconds, of the returned data points.
    
    All relational database metric data is available in 1-minute (60 seconds)
    granularity.|}*)

  metric_name: relational_database_metric_name;
   (**{|
    The metric for which you want to return information.
    
    Valid relational database metric names are listed below, along with the
    most useful [statistics] to include in your request, and the published
    [unit] value. All relational database metric data is available in
    1-minute (60 seconds) granularity.
    
    {ol 
          {- {b [CPUUtilization]} - The percentage of CPU utilization
             currently in use on the database.
             
          [Statistics]: The most useful statistics are [Maximum] and
          [Average].
          
          [Unit]: The published unit is [Percent].
          }
          
          {- {b [DatabaseConnections]} - The number of database connections
             in use.
             
          [Statistics]: The most useful statistics are [Maximum] and [Sum].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [DiskQueueDepth]} - The number of outstanding IOs (read/write
             requests) that are waiting to access the disk.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [FreeStorageSpace]} - The amount of available storage space.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [Bytes].
          }
          
          {- {b [NetworkReceiveThroughput]} - The incoming (Receive) network
             traffic on the database, including both customer database
             traffic and AWS traffic used for monitoring and replication.
             
          [Statistics]: The most useful statistic is [Average].
          
          [Unit]: The published unit is [Bytes/Second].
          }
          
          {- {b [NetworkTransmitThroughput]} - The outgoing (Transmit)
             network traffic on the database, including both customer
             database traffic and AWS traffic used for monitoring and
             replication.
             
          [Statistics]: The most useful statistic is [Average].
          
          [Unit]: The published unit is [Bytes/Second].
          }
          
    }
    |}*)

  relational_database_name: string;
   (**{|
    The name of your database from which to get metric data.|}*)

}

type get_relational_database_master_user_password_result = {
  created_at: float option;
   (**{|
    The timestamp when the specified version of the master user password was
    created.|}*)

  master_user_password: string option;
   (**{|
    The master user password for the [password version] specified.|}*)

}

type get_relational_database_master_user_password_request = {
  password_version: relational_database_password_version option;
   (**{|
    The password version to return.
    
    Specifying [CURRENT] or [PREVIOUS] returns the current or previous
    passwords respectively. Specifying [PENDING] returns the newest version
    of the password that will rotate to [CURRENT]. After the [PENDING]
    password rotates to [CURRENT], the [PENDING] password is no longer
    available.
    
    Default: [CURRENT]|}*)

  relational_database_name: string;
   (**{|
    The name of your database for which to get the master user password.|}*)

}

type get_relational_database_log_streams_result = {
  log_streams: string list option;
   (**{|
    An object describing the result of your get relational database log
    streams request.|}*)

}

type get_relational_database_log_streams_request = {
  relational_database_name: string;
   (**{|
    The name of your database for which to get log streams.|}*)

}

type get_relational_database_log_events_result = {
  next_forward_token: string option;
   (**{|
    A token used for advancing to the next page of results from your get
    relational database log events request.|}*)

  next_backward_token: string option;
   (**{|
    A token used for advancing to the previous page of results from your get
    relational database log events request.|}*)

  resource_log_events: log_event list option;
   (**{|
    An object describing the result of your get relational database log
    events request.|}*)

}

type get_relational_database_log_events_request = {
  page_token: string option;
   (**{|
    The token to advance to the next or previous page of results from your
    request.
    
    To get a page token, perform an initial [GetRelationalDatabaseLogEvents]
    request. If your results are paginated, the response will return a next
    forward token and/or next backward token that you can specify as the page
    token in a subsequent request.|}*)

  start_from_head: bool option;
   (**{|
    Parameter to specify if the log should start from head or tail. If [true]
    is specified, the log event starts from the head of the log. If [false]
    is specified, the log event starts from the tail of the log.
    
    For PostgreSQL, the default value of [false] is the only option
    available.
    |}*)

  end_time: float option;
   (**{|
    The end of the time interval from which to get log events.
    
    Constraints:
    
    {ol 
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you wish to use an end time of October 1, 2018, at
          8 PM UTC, then you input [1538424000] as the end time.
          }
          
    }
    |}*)

  start_time: float option;
   (**{|
    The start of the time interval from which to get log events.
    
    Constraints:
    
    {ol 
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you wish to use a start time of October 1, 2018, at
          8 PM UTC, then you input [1538424000] as the start time.
          }
          
    }
    |}*)

  log_stream_name: string;
   (**{|
    The name of the log stream.
    
    Use the [get relational database log streams] operation to get a list of
    available log streams.|}*)

  relational_database_name: string;
   (**{|
    The name of your database for which to get log events.|}*)

}

type get_relational_database_events_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another
    [GetRelationalDatabaseEvents] request and specify the next page token
    using the [pageToken] parameter.|}*)

  relational_database_events: relational_database_event list option;
   (**{|
    An object describing the result of your get relational database events
    request.|}*)

}

type get_relational_database_events_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetRelationalDatabaseEvents]
    request. If your results are paginated, the response will return a next
    page token that you can specify as the page token in a subsequent
    request.|}*)

  duration_in_minutes: int option;
   (**{|
    The number of minutes in the past from which to retrieve events. For
    example, to get all events from the past 2 hours, enter 120.
    
    Default: [60]
    
    The minimum is 1 and the maximum is 14 days (20160 minutes).|}*)

  relational_database_name: string;
   (**{|
    The name of the database from which to get events.|}*)

}

type get_relational_database_bundles_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another
    [GetRelationalDatabaseBundles] request and specify the next page token
    using the [pageToken] parameter.|}*)

  bundles: relational_database_bundle list option;
   (**{|
    An object describing the result of your get relational database bundles
    request.|}*)

}

type get_relational_database_bundles_request = {
  include_inactive: bool option;
   (**{|
    A Boolean value that indicates whether to include inactive (unavailable)
    bundles in the response of your request.|}*)

  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetRelationalDatabaseBundles]
    request. If your results are paginated, the response will return a next
    page token that you can specify as the page token in a subsequent
    request.|}*)

}

type get_relational_database_blueprints_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another
    [GetRelationalDatabaseBlueprints] request and specify the next page token
    using the [pageToken] parameter.|}*)

  blueprints: relational_database_blueprint list option;
   (**{|
    An object describing the result of your get relational database
    blueprints request.|}*)

}

type get_relational_database_blueprints_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetRelationalDatabaseBlueprints]
    request. If your results are paginated, the response will return a next
    page token that you can specify as the page token in a subsequent
    request.|}*)

}

type get_relational_database_result = {
  relational_database: relational_database option;
   (**{|
    An object describing the specified database.|}*)

}

type get_relational_database_request = {
  relational_database_name: string;
   (**{|
    The name of the database that you are looking up.|}*)

}

type get_regions_result = {
  regions: region list option;
   (**{|
    An array of key-value pairs containing information about your get regions
    request.|}*)

}

type get_regions_request = {
  include_relational_database_availability_zones: bool option;
   (**{|
    A Boolean value indicating whether to also include Availability Zones for
    databases in your get regions request. Availability Zones are indicated
    with a letter ([us-east-2a]).|}*)

  include_availability_zones: bool option;
   (**{|
    A Boolean value indicating whether to also include Availability Zones in
    your get regions request. Availability Zones are indicated with a letter:
    [us-east-2a].|}*)

}

type get_operations_for_resource_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another
    [GetOperationsForResource] request and specify the next page token using
    the [pageToken] parameter.|}*)

  next_page_count: string option;
   (**{|
    (Discontinued) Returns the number of pages of results that remain.
    
    In releases prior to June 12, 2017, this parameter returned [null] by the
    API. It is now discontinued, and the API returns the [next page token]
    parameter instead.
    |}*)

  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type get_operations_for_resource_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetOperationsForResource]
    request. If your results are paginated, the response will return a next
    page token that you can specify as the page token in a subsequent
    request.|}*)

  resource_name: string;
   (**{|
    The name of the resource for which you are requesting information.|}*)

}

type get_operations_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetOperations] request
    and specify the next page token using the [pageToken] parameter.|}*)

  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type get_operations_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetOperations] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

}

type get_operation_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type get_operation_request = {
  operation_id: string;
   (**{|
    A GUID used to identify the operation.|}*)

}

type get_load_balancer_tls_policies_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another
    [GetLoadBalancerTlsPolicies] request and specify the next page token
    using the [pageToken] parameter.|}*)

  tls_policies: load_balancer_tls_policy list option;
   (**{|
    An array of objects that describe the TLS security policies that are
    available.|}*)

}

type get_load_balancer_tls_policies_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetLoadBalancerTlsPolicies]
    request. If your results are paginated, the response will return a next
    page token that you can specify as the page token in a subsequent
    request.|}*)

}

type get_load_balancer_tls_certificates_result = {
  tls_certificates: load_balancer_tls_certificate list option;
   (**{|
    An array of LoadBalancerTlsCertificate objects describing your SSL/TLS
    certificates.|}*)

}

type get_load_balancer_tls_certificates_request = {
  load_balancer_name: string;
   (**{|
    The name of the load balancer you associated with your SSL/TLS
    certificate.|}*)

}

type get_load_balancers_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetLoadBalancers]
    request and specify the next page token using the [pageToken] parameter.|}*)

  load_balancers: load_balancer list option;
   (**{|
    An array of LoadBalancer objects describing your load balancers.|}*)

}

type get_load_balancers_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetLoadBalancers] request. If
    your results are paginated, the response will return a next page token
    that you can specify as the page token in a subsequent request.|}*)

}

type get_load_balancer_metric_data_result = {
  metric_data: metric_datapoint list option;
   (**{|
    An array of objects that describe the metric data returned.|}*)

  metric_name: load_balancer_metric_name option;
   (**{|
    The name of the metric returned.|}*)

}

type get_load_balancer_metric_data_request = {
  statistics: metric_statistic list;
   (**{|
    The statistic for the metric.
    
    The following statistics are available:
    
    {ol 
          {- [Minimum] - The lowest value observed during the specified
             period. Use this value to determine low volumes of activity for
             your application.
             }
          
          {- [Maximum] - The highest value observed during the specified
             period. Use this value to determine high volumes of activity for
             your application.
             }
          
          {- [Sum] - All values submitted for the matching metric added
             together. You can use this statistic to determine the total
             volume of a metric.
             }
          
          {- [Average] - The value of Sum / SampleCount during the specified
             period. By comparing this statistic with the Minimum and Maximum
             values, you can determine the full scope of a metric and how
             close the average use is to the Minimum and Maximum values. This
             comparison helps you to know when to increase or decrease your
             resources.
             }
          
          {- [SampleCount] - The count, or number, of data points used for
             the statistical calculation.
             }
          
    }
    |}*)

  unit_: metric_unit;
   (**{|
    The unit for the metric data request. Valid units depend on the metric
    data being requested. For the valid units with each available metric, see
    the [metricName] parameter.|}*)

  end_time: float;
   (**{|
    The end time of the period.|}*)

  start_time: float;
   (**{|
    The start time of the period.|}*)

  period: int;
   (**{|
    The granularity, in seconds, of the returned data points.|}*)

  metric_name: load_balancer_metric_name;
   (**{|
    The metric for which you want to return information.
    
    Valid load balancer metric names are listed below, along with the most
    useful [statistics] to include in your request, and the published [unit]
    value.
    
    {ol 
          {- {b [ClientTLSNegotiationErrorCount]} - The number of TLS
             connections initiated by the client that did not establish a
             session with the load balancer due to a TLS error generated by
             the load balancer. Possible causes include a mismatch of ciphers
             or protocols.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [HealthyHostCount]} - The number of target instances that are
             considered healthy.
             
          [Statistics]: The most useful statistic are [Average], [Minimum],
          and [Maximum].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [HTTPCode_Instance_2XX_Count]} - The number of HTTP 2XX
             response codes generated by the target instances. This does not
             include any response codes generated by the load balancer.
             
          [Statistics]: The most useful statistic is [Sum]. Note that
          [Minimum], [Maximum], and [Average] all return [1].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [HTTPCode_Instance_3XX_Count]} - The number of HTTP 3XX
             response codes generated by the target instances. This does not
             include any response codes generated by the load balancer.
             
          [Statistics]: The most useful statistic is [Sum]. Note that
          [Minimum], [Maximum], and [Average] all return [1].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [HTTPCode_Instance_4XX_Count]} - The number of HTTP 4XX
             response codes generated by the target instances. This does not
             include any response codes generated by the load balancer.
             
          [Statistics]: The most useful statistic is [Sum]. Note that
          [Minimum], [Maximum], and [Average] all return [1].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [HTTPCode_Instance_5XX_Count]} - The number of HTTP 5XX
             response codes generated by the target instances. This does not
             include any response codes generated by the load balancer.
             
          [Statistics]: The most useful statistic is [Sum]. Note that
          [Minimum], [Maximum], and [Average] all return [1].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [HTTPCode_LB_4XX_Count]} - The number of HTTP 4XX client
             error codes that originated from the load balancer. Client
             errors are generated when requests are malformed or incomplete.
             These requests were not received by the target instance. This
             count does not include response codes generated by the target
             instances.
             
          [Statistics]: The most useful statistic is [Sum]. Note that
          [Minimum], [Maximum], and [Average] all return [1].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [HTTPCode_LB_5XX_Count]} - The number of HTTP 5XX server
             error codes that originated from the load balancer. This does
             not include any response codes generated by the target instance.
             This metric is reported if there are no healthy instances
             attached to the load balancer, or if the request rate exceeds
             the capacity of the instances (spillover) or the load balancer.
             
          [Statistics]: The most useful statistic is [Sum]. Note that
          [Minimum], [Maximum], and [Average] all return [1].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [InstanceResponseTime]} - The time elapsed, in seconds, after
             the request leaves the load balancer until a response from the
             target instance is received.
             
          [Statistics]: The most useful statistic is [Average].
          
          [Unit]: The published unit is [Seconds].
          }
          
          {- {b [RejectedConnectionCount]} - The number of connections that
             were rejected because the load balancer had reached its maximum
             number of connections.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [RequestCount]} - The number of requests processed over IPv4.
             This count includes only the requests with a response generated
             by a target instance of the load balancer.
             
          [Statistics]: The most useful statistic is [Sum]. Note that
          [Minimum], [Maximum], and [Average] all return [1].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [UnhealthyHostCount]} - The number of target instances that
             are considered unhealthy.
             
          [Statistics]: The most useful statistic are [Average], [Minimum],
          and [Maximum].
          
          [Unit]: The published unit is [Count].
          }
          
    }
    |}*)

  load_balancer_name: string;
   (**{|
    The name of the load balancer.|}*)

}

type get_load_balancer_result = {
  load_balancer: load_balancer option;
   (**{|
    An object containing information about your load balancer.|}*)

}

type get_load_balancer_request = {
  load_balancer_name: string;
   (**{|
    The name of the load balancer.|}*)

}

(**{|
    Describes an SSH key pair.|}*)
type key_pair = {
  fingerprint: string option;
   (**{|
    The RSA fingerprint of the key pair.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The resource type (usually [KeyPair]).|}*)

  location: resource_location option;
   (**{|
    The region name and Availability Zone where the key pair was created.|}*)

  created_at: float option;
   (**{|
    The timestamp when the key pair was created ([1479816991.349]).|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about an instance or another resource in Lightsail. This
    code enables our support team to look up your Lightsail information more
    easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the key pair
    ([arn:aws:lightsail:us-east-2:123456789101:KeyPair/05859e3d-331d-48ba-9034-12345EXAMPLE]).
    |}*)

  name: string option;
   (**{|
    The friendly name of the SSH key pair.|}*)

}

type get_key_pairs_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetKeyPairs] request
    and specify the next page token using the [pageToken] parameter.|}*)

  key_pairs: key_pair list option;
   (**{|
    An array of key-value pairs containing information about the key pairs.|}*)

}

type get_key_pairs_request = {
  include_default_key_pair: bool option;
   (**{|
    A Boolean value that indicates whether to include the default key pair in
    the response of your request.|}*)

  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetKeyPairs] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

}

type get_key_pair_result = {
  key_pair: key_pair option;
   (**{|
    An array of key-value pairs containing information about the key pair.|}*)

}

type get_key_pair_request = {
  key_pair_name: string;
   (**{|
    The name of the key pair for which you are requesting information.|}*)

}

(**{|
    Describes the virtual private server (or {i instance}) status.|}*)
type instance_state = {
  name: string option;
   (**{|
    The state of the instance ([running] or [pending]).|}*)

  code: int option;
   (**{|
    The status code for the instance.|}*)

}

type get_instance_state_result = {
  state: instance_state option;
   (**{|
    The state of the instance.|}*)

}

type get_instance_state_request = {
  instance_name: string;
   (**{|
    The name of the instance to get state information about.|}*)

}

type instance_snapshot_state = | Available
  | Error
  | Pending

(**{|
    Describes an add-on that is enabled for an Amazon Lightsail resource.|}*)
type add_on = {
  duration: string option;
   (**{|
    The amount of idle time in minutes after which your virtual computer will
    automatically stop.
    
    This add-on only applies to Lightsail for Research resources.
    |}*)

  threshold: string option;
   (**{|
    The trigger threshold of the action.
    
    This add-on only applies to Lightsail for Research resources.
    |}*)

  next_snapshot_time_of_day: string option;
   (**{|
    The next daily time an automatic snapshot will be created.
    
    The time shown is in [HH:00] format, and in Coordinated Universal Time
    (UTC).
    
    The snapshot is automatically created between the time shown and up to 45
    minutes after.|}*)

  snapshot_time_of_day: string option;
   (**{|
    The daily time when an automatic snapshot is created.
    
    The time shown is in [HH:00] format, and in Coordinated Universal Time
    (UTC).
    
    The snapshot is automatically created between the time shown and up to 45
    minutes after.|}*)

  status: string option;
   (**{|
    The status of the add-on.|}*)

  name: string option;
   (**{|
    The name of the add-on.|}*)

}

type disk_state = | Unknown
  | InUse
  | Available
  | Error
  | Pending

type auto_mount_status = | NotMounted
  | Mounted
  | Pending
  | Failed

(**{|
    Describes a block storage disk.|}*)
type disk = {
  auto_mount_status: auto_mount_status option;
   (**{|
    The status of automatically mounting a storage disk to a virtual computer.
    
    This parameter only applies to Lightsail for Research resources.
    |}*)

  gb_in_use: int option;
   (**{|
    (Discontinued) The number of GB in use by the disk.
    
    In releases prior to November 14, 2017, this parameter was not included
    in the API response. It is now discontinued.
    |}*)

  attachment_state: string option;
   (**{|
    (Discontinued) The attachment state of the disk.
    
    In releases prior to November 14, 2017, this parameter returned
    [attached] for system disks in the API response. It is now discontinued,
    but still included in the response. Use [isAttached] instead.
    |}*)

  is_attached: bool option;
   (**{|
    A Boolean value indicating whether the disk is attached.|}*)

  attached_to: string option;
   (**{|
    The resources to which the disk is attached.|}*)

  state: disk_state option;
   (**{|
    Describes the status of the disk.|}*)

  path: string option;
   (**{|
    The disk path.|}*)

  iops: int option;
   (**{|
    The input/output operations per second (IOPS) of the disk.|}*)

  is_system_disk: bool option;
   (**{|
    A Boolean value indicating whether this disk is a system disk (has an
    operating system loaded on it).|}*)

  size_in_gb: int option;
   (**{|
    The size of the disk in GB.|}*)

  add_ons: add_on list option;
   (**{|
    An array of objects representing the add-ons enabled on the disk.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The Lightsail resource type ([Disk]).|}*)

  location: resource_location option;
   (**{|
    The AWS Region and Availability Zone where the disk is located.|}*)

  created_at: float option;
   (**{|
    The date when the disk was created.|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about an instance or another resource in Lightsail. This
    code enables our support team to look up your Lightsail information more
    easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the disk.|}*)

  name: string option;
   (**{|
    The unique name of the disk.|}*)

}

(**{|
    Describes an instance snapshot.|}*)
type instance_snapshot = {
  size_in_gb: int option;
   (**{|
    The size in GB of the SSD.|}*)

  is_from_auto_snapshot: bool option;
   (**{|
    A Boolean value indicating whether the snapshot was created from an
    automatic snapshot.|}*)

  from_bundle_id: string option;
   (**{|
    The bundle ID from which you created the snapshot ([micro_x_x]).|}*)

  from_blueprint_id: string option;
   (**{|
    The blueprint ID from which you created the snapshot
    ([amazon_linux_2023]). A blueprint is a virtual private server (or
    {i instance}) image used to create instances quickly.|}*)

  from_instance_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the instance from which the snapshot
    was created
    ([arn:aws:lightsail:us-east-2:123456789101:Instance/64b8404c-ccb1-430b-8daf-12345EXAMPLE]).
    |}*)

  from_instance_name: string option;
   (**{|
    The instance from which the snapshot was created.|}*)

  from_attached_disks: disk list option;
   (**{|
    An array of disk objects containing information about all block storage
    disks.|}*)

  progress: string option;
   (**{|
    The progress of the snapshot.
    
    This is populated only for disk snapshots, and is [null] for instance
    snapshots.
    |}*)

  state: instance_snapshot_state option;
   (**{|
    The state the snapshot is in.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The type of resource (usually [InstanceSnapshot]).|}*)

  location: resource_location option;
   (**{|
    The region name and Availability Zone where you created the snapshot.|}*)

  created_at: float option;
   (**{|
    The timestamp when the snapshot was created ([1479907467.024]).|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about an instance or another resource in Lightsail. This
    code enables our support team to look up your Lightsail information more
    easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the snapshot
    ([arn:aws:lightsail:us-east-2:123456789101:InstanceSnapshot/d23b5706-3322-4d83-81e5-12345EXAMPLE]).
    |}*)

  name: string option;
   (**{|
    The name of the snapshot.|}*)

}

type get_instance_snapshots_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetInstanceSnapshots]
    request and specify the next page token using the [pageToken] parameter.|}*)

  instance_snapshots: instance_snapshot list option;
   (**{|
    An array of key-value pairs containing information about the results of
    your get instance snapshots request.|}*)

}

type get_instance_snapshots_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetInstanceSnapshots] request.
    If your results are paginated, the response will return a next page token
    that you can specify as the page token in a subsequent request.|}*)

}

type get_instance_snapshot_result = {
  instance_snapshot: instance_snapshot option;
   (**{|
    An array of key-value pairs containing information about the results of
    your get instance snapshot request.|}*)

}

type get_instance_snapshot_request = {
  instance_snapshot_name: string;
   (**{|
    The name of the snapshot for which you are requesting information.|}*)

}

(**{|
    Describes the hardware for the instance.|}*)
type instance_hardware = {
  ram_size_in_gb: float option;
   (**{|
    The amount of RAM in GB on the instance ([1.0]).|}*)

  disks: disk list option;
   (**{|
    The disks attached to the instance.|}*)

  cpu_count: int option;
   (**{|
    The number of vCPUs the instance has.|}*)

}

type access_direction = | Outbound
  | Inbound

(**{|
    Describes information about ports for an Amazon Lightsail instance.|}*)
type instance_port_info = {
  cidr_list_aliases: string list option;
   (**{|
    An alias that defines access for a preconfigured range of IP addresses.
    
    The only alias currently supported is [lightsail-connect], which allows
    IP addresses of the browser-based RDP/SSH client in the Lightsail console
    to connect to your instance.|}*)

  ipv6_cidrs: string list option;
   (**{|
    The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are
    allowed to connect to an instance through the ports, and the protocol.
    Only devices with an IPv6 address can connect to an instance through
    IPv6; otherwise, IPv4 should be used.
    
    The [cidrs] parameter lists the IPv4 addresses that are allowed to
    connect to an instance.
    
    For more information about CIDR block notation, see
    {{: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation }Classless
    Inter-Domain Routing} on {i Wikipedia}.|}*)

  cidrs: string list option;
   (**{|
    The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are
    allowed to connect to an instance through the ports, and the protocol.
    
    The [ipv6Cidrs] parameter lists the IPv6 addresses that are allowed to
    connect to an instance.
    
    For more information about CIDR block notation, see
    {{: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation }Classless
    Inter-Domain Routing} on {i Wikipedia}.|}*)

  access_direction: access_direction option;
   (**{|
    The access direction ([inbound] or [outbound]).
    
    Lightsail currently supports only [inbound] access direction.
    |}*)

  common_name: string option;
   (**{|
    The common name of the port information.|}*)

  access_type: port_access_type option;
   (**{|
    The type of access ([Public] or [Private]).|}*)

  access_from: string option;
   (**{|
    The location from which access is allowed. For example, [Anywhere
    (0.0.0.0/0)], or [Custom] if a specific IP address or range of IP
    addresses is allowed.|}*)

  protocol: network_protocol option;
   (**{|
    The IP protocol name.
    
    The name can be one of the following:
    
    {ol 
          {- [tcp] - Transmission Control Protocol (TCP) provides reliable,
             ordered, and error-checked delivery of streamed data between
             applications running on hosts communicating by an IP network. If
             you have an application that doesn't require reliable data
             stream service, use UDP instead.
             }
          
          {- [all] - All transport layer protocol types. For more general
             information, see
             {{: https://en.wikipedia.org/wiki/Transport_layer }Transport
             layer} on {i Wikipedia}.
             }
          
          {- [udp] - With User Datagram Protocol (UDP), computer applications
             can send messages (or datagrams) to other hosts on an Internet
             Protocol (IP) network. Prior communications are not required to
             set up transmission channels or data paths. Applications that
             don't require reliable data stream service can use UDP, which
             provides a connectionless datagram service that emphasizes
             reduced latency over reliability. If you do require reliable
             data stream service, use TCP instead.
             }
          
          {- [icmp] - Internet Control Message Protocol (ICMP) is used to
             send error messages and operational information indicating
             success or failure when communicating with an instance. For
             example, an error is indicated when an instance could not be
             reached. When you specify [icmp] as the [protocol], you must
             specify the ICMP type using the [fromPort] parameter, and ICMP
             code using the [toPort] parameter.
             }
          
          {- [icmp6] - Internet Control Message Protocol (ICMP) for IPv6.
             When you specify [icmp6] as the [protocol], you must specify the
             ICMP type using the [fromPort] parameter, and ICMP code using
             the [toPort] parameter.
             }
          
    }
    |}*)

  to_port: int option;
   (**{|
    The last port in a range of open ports on an instance.
    
    Allowed ports:
    
    {ol 
          {- TCP and UDP - [0] to [65535]
             }
          
          {- ICMP - The ICMP code for IPv4 addresses. For example, specify
             [8] as the [fromPort] (ICMP type), and [-1] as the [toPort]
             (ICMP code), to enable ICMP Ping. For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages }Control
             Messages} on {i Wikipedia}.
             }
          
          {- ICMPv6 - The ICMP code for IPv6 addresses. For example, specify
             [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort]
             (ICMPv6 code). For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6 }Internet
             Control Message Protocol for IPv6}.
             }
          
    }
    |}*)

  from_port: int option;
   (**{|
    The first port in a range of open ports on an instance.
    
    Allowed ports:
    
    {ol 
          {- TCP and UDP - [0] to [65535]
             }
          
          {- ICMP - The ICMP type for IPv4 addresses. For example, specify
             [8] as the [fromPort] (ICMP type), and [-1] as the [toPort]
             (ICMP code), to enable ICMP Ping. For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages }Control
             Messages} on {i Wikipedia}.
             }
          
          {- ICMPv6 - The ICMP type for IPv6 addresses. For example, specify
             [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort]
             (ICMPv6 code). For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6 }Internet
             Control Message Protocol for IPv6}.
             }
          
    }
    |}*)

}

(**{|
    Describes monthly data transfer rates and port information for an
    instance.|}*)
type instance_networking = {
  ports: instance_port_info list option;
   (**{|
    An array of key-value pairs containing information about the ports on the
    instance.|}*)

  monthly_transfer: monthly_transfer option;
   (**{|
    The amount of data in GB allocated for monthly data transfers.|}*)

}

type instance_metadata_state = | Applied
  | Pending

(**{|
    The metadata options for the instance.|}*)
type instance_metadata_options = {
  http_protocol_ipv6: http_protocol_ipv6 option;
   (**{|
    Indicates whether the IPv6 endpoint for the instance metadata service is
    enabled or disabled.|}*)

  http_put_response_hop_limit: int option;
   (**{|
    The desired HTTP PUT response hop limit for instance metadata requests. A
    larger number means that the instance metadata requests can travel
    farther.|}*)

  http_endpoint: http_endpoint option;
   (**{|
    Indicates whether the HTTP metadata endpoint on your instances is enabled
    or disabled.
    
    If the value is [disabled], you cannot access your instance metadata.|}*)

  http_tokens: http_tokens option;
   (**{|
    The state of token usage for your instance metadata requests.
    
    If the state is [optional], you can choose whether to retrieve instance
    metadata with a signed token header on your request. If you retrieve the
    IAM role credentials without a token, the version 1.0 role credentials
    are returned. If you retrieve the IAM role credentials by using a valid
    signed token, the version 2.0 role credentials are returned.
    
    If the state is [required], you must send a signed token header with all
    instance metadata retrieval requests. In this state, retrieving the IAM
    role credential always returns the version 2.0 credentials. The version
    1.0 credentials are not available.
    
    Not all instance blueprints in Lightsail support version 2.0 credentials.
    Use the [MetadataNoToken] instance metric to track the number of calls to
    the instance metadata service that are using version 1.0 credentials. For
    more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-health-metrics }Viewing
    instance metrics in Amazon Lightsail} in the {i Amazon Lightsail
    Developer Guide}.
    |}*)

  state: instance_metadata_state option;
   (**{|
    The state of the metadata option changes.
    
    The following states are possible:
    
    {ol 
          {- [pending] - The metadata options are being updated. The instance
             is not yet ready to process metadata traffic with the new
             selection.
             }
          
          {- [applied] - The metadata options have been successfully applied
             to the instance.
             }
          
    }
    |}*)

}

(**{|
    Describes an instance (a virtual private server).|}*)
type instance = {
  metadata_options: instance_metadata_options option;
   (**{|
    The metadata options for the Amazon Lightsail instance.|}*)

  ssh_key_name: string option;
   (**{|
    The name of the SSH key being used to connect to the instance
    ([LightsailDefaultKeyPair]).|}*)

  username: string option;
   (**{|
    The user name for connecting to the instance ([ec2-user]).|}*)

  state: instance_state option;
   (**{|
    The status code and the state ([running]) for the instance.|}*)

  networking: instance_networking option;
   (**{|
    Information about the public ports and monthly data transfer rates for
    the instance.|}*)

  hardware: instance_hardware option;
   (**{|
    The size of the vCPU and the amount of RAM for the instance.|}*)

  ip_address_type: ip_address_type option;
   (**{|
    The IP address type of the instance.
    
    The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and
    [dualstack] for IPv4 and IPv6.|}*)

  ipv6_addresses: string list option;
   (**{|
    The IPv6 addresses of the instance.|}*)

  public_ip_address: string option;
   (**{|
    The public IP address of the instance.|}*)

  private_ip_address: string option;
   (**{|
    The private IP address of the instance.|}*)

  is_static_ip: bool option;
   (**{|
    A Boolean value indicating whether this instance has a static IP assigned
    to it.|}*)

  add_ons: add_on list option;
   (**{|
    An array of objects representing the add-ons enabled on the instance.|}*)

  bundle_id: string option;
   (**{|
    The bundle for the instance ([micro_x_x]).|}*)

  blueprint_name: string option;
   (**{|
    The friendly name of the blueprint ([Amazon Linux 2023]).|}*)

  blueprint_id: string option;
   (**{|
    The blueprint ID ([amazon_linux_2023]).|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The type of resource (usually [Instance]).|}*)

  location: resource_location option;
   (**{|
    The region name and Availability Zone where the instance is located.|}*)

  created_at: float option;
   (**{|
    The timestamp when the instance was created ([1479734909.17]) in Unix
    time format.|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about an instance or another resource in Lightsail. This
    code enables our support team to look up your Lightsail information more
    easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the instance
    ([arn:aws:lightsail:us-east-2:123456789101:Instance/244ad76f-8aad-4741-809f-12345EXAMPLE]).
    |}*)

  name: string option;
   (**{|
    The name the user gave the instance ([Amazon_Linux_2023-1]).|}*)

}

type get_instances_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetInstances] request
    and specify the next page token using the [pageToken] parameter.|}*)

  instances: instance list option;
   (**{|
    An array of key-value pairs containing information about your instances.|}*)

}

type get_instances_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetInstances] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

}

(**{|
    Describes open ports on an instance, the IP addresses allowed to connect
    to the instance through the ports, and the protocol.|}*)
type instance_port_state = {
  cidr_list_aliases: string list option;
   (**{|
    An alias that defines access for a preconfigured range of IP addresses.
    
    The only alias currently supported is [lightsail-connect], which allows
    IP addresses of the browser-based RDP/SSH client in the Lightsail console
    to connect to your instance.|}*)

  ipv6_cidrs: string list option;
   (**{|
    The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are
    allowed to connect to an instance through the ports, and the protocol.
    Only devices with an IPv6 address can connect to an instance through
    IPv6; otherwise, IPv4 should be used.
    
    The [cidrs] parameter lists the IPv4 addresses that are allowed to
    connect to an instance.
    
    For more information about CIDR block notation, see
    {{: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation }Classless
    Inter-Domain Routing} on {i Wikipedia}.|}*)

  cidrs: string list option;
   (**{|
    The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are
    allowed to connect to an instance through the ports, and the protocol.
    
    The [ipv6Cidrs] parameter lists the IPv6 addresses that are allowed to
    connect to an instance.
    
    For more information about CIDR block notation, see
    {{: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation }Classless
    Inter-Domain Routing} on {i Wikipedia}.|}*)

  state: port_state option;
   (**{|
    Specifies whether the instance port is [open] or [closed].
    
    The port state for Lightsail instances is always [open].
    |}*)

  protocol: network_protocol option;
   (**{|
    The IP protocol name.
    
    The name can be one of the following:
    
    {ol 
          {- [tcp] - Transmission Control Protocol (TCP) provides reliable,
             ordered, and error-checked delivery of streamed data between
             applications running on hosts communicating by an IP network. If
             you have an application that doesn't require reliable data
             stream service, use UDP instead.
             }
          
          {- [all] - All transport layer protocol types. For more general
             information, see
             {{: https://en.wikipedia.org/wiki/Transport_layer }Transport
             layer} on {i Wikipedia}.
             }
          
          {- [udp] - With User Datagram Protocol (UDP), computer applications
             can send messages (or datagrams) to other hosts on an Internet
             Protocol (IP) network. Prior communications are not required to
             set up transmission channels or data paths. Applications that
             don't require reliable data stream service can use UDP, which
             provides a connectionless datagram service that emphasizes
             reduced latency over reliability. If you do require reliable
             data stream service, use TCP instead.
             }
          
          {- [icmp] - Internet Control Message Protocol (ICMP) is used to
             send error messages and operational information indicating
             success or failure when communicating with an instance. For
             example, an error is indicated when an instance could not be
             reached. When you specify [icmp] as the [protocol], you must
             specify the ICMP type using the [fromPort] parameter, and ICMP
             code using the [toPort] parameter.
             }
          
          {- [icmp6] - Internet Control Message Protocol (ICMP) for IPv6.
             When you specify [icmp6] as the [protocol], you must specify the
             ICMP type using the [fromPort] parameter, and ICMP code using
             the [toPort] parameter.
             }
          
    }
    |}*)

  to_port: int option;
   (**{|
    The last port in a range of open ports on an instance.
    
    Allowed ports:
    
    {ol 
          {- TCP and UDP - [0] to [65535]
             }
          
          {- ICMP - The ICMP code for IPv4 addresses. For example, specify
             [8] as the [fromPort] (ICMP type), and [-1] as the [toPort]
             (ICMP code), to enable ICMP Ping. For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages }Control
             Messages} on {i Wikipedia}.
             }
          
          {- ICMPv6 - The ICMP code for IPv6 addresses. For example, specify
             [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort]
             (ICMPv6 code). For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6 }Internet
             Control Message Protocol for IPv6}.
             }
          
    }
    |}*)

  from_port: int option;
   (**{|
    The first port in a range of open ports on an instance.
    
    Allowed ports:
    
    {ol 
          {- TCP and UDP - [0] to [65535]
             }
          
          {- ICMP - The ICMP type for IPv4 addresses. For example, specify
             [8] as the [fromPort] (ICMP type), and [-1] as the [toPort]
             (ICMP code), to enable ICMP Ping. For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages }Control
             Messages} on {i Wikipedia}.
             }
          
          {- ICMPv6 - The ICMP type for IPv6 addresses. For example, specify
             [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort]
             (ICMPv6 code). For more information, see
             {{: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6 }Internet
             Control Message Protocol for IPv6}.
             }
          
    }
    |}*)

}

type get_instance_port_states_result = {
  port_states: instance_port_state list option;
   (**{|
    An array of objects that describe the firewall port states for the
    specified instance.|}*)

}

type get_instance_port_states_request = {
  instance_name: string;
   (**{|
    The name of the instance for which to return firewall port states.|}*)

}

type instance_metric_name = | MetadataNoToken
  | BurstCapacityPercentage
  | BurstCapacityTime
  | StatusCheckFailed_System
  | StatusCheckFailed_Instance
  | StatusCheckFailed
  | NetworkOut
  | NetworkIn
  | CPUUtilization

type get_instance_metric_data_result = {
  metric_data: metric_datapoint list option;
   (**{|
    An array of objects that describe the metric data returned.|}*)

  metric_name: instance_metric_name option;
   (**{|
    The name of the metric returned.|}*)

}

type get_instance_metric_data_request = {
  statistics: metric_statistic list;
   (**{|
    The statistic for the metric.
    
    The following statistics are available:
    
    {ol 
          {- [Minimum] - The lowest value observed during the specified
             period. Use this value to determine low volumes of activity for
             your application.
             }
          
          {- [Maximum] - The highest value observed during the specified
             period. Use this value to determine high volumes of activity for
             your application.
             }
          
          {- [Sum] - All values submitted for the matching metric added
             together. You can use this statistic to determine the total
             volume of a metric.
             }
          
          {- [Average] - The value of Sum / SampleCount during the specified
             period. By comparing this statistic with the Minimum and Maximum
             values, you can determine the full scope of a metric and how
             close the average use is to the Minimum and Maximum values. This
             comparison helps you to know when to increase or decrease your
             resources.
             }
          
          {- [SampleCount] - The count, or number, of data points used for
             the statistical calculation.
             }
          
    }
    |}*)

  unit_: metric_unit;
   (**{|
    The unit for the metric data request. Valid units depend on the metric
    data being requested. For the valid units to specify with each available
    metric, see the [metricName] parameter.|}*)

  end_time: float;
   (**{|
    The end time of the time period.|}*)

  start_time: float;
   (**{|
    The start time of the time period.|}*)

  period: int;
   (**{|
    The granularity, in seconds, of the returned data points.
    
    The [StatusCheckFailed], [StatusCheckFailed_Instance], and
    [StatusCheckFailed_System] instance metric data is available in 1-minute
    (60 seconds) granularity. All other instance metric data is available in
    5-minute (300 seconds) granularity.|}*)

  metric_name: instance_metric_name;
   (**{|
    The metric for which you want to return information.
    
    Valid instance metric names are listed below, along with the most useful
    [statistics] to include in your request, and the published [unit] value.
    
    {ol 
          {- {b [BurstCapacityPercentage]} - The percentage of CPU
             performance available for your instance to burst above its
             baseline. Your instance continuously accrues and consumes burst
             capacity. Burst capacity stops accruing when your instance's
             [BurstCapacityPercentage] reaches 100%. For more information,
             see
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity }Viewing
             instance burst capacity in Amazon Lightsail}.
             
          [Statistics]: The most useful statistics are [Maximum] and
          [Average].
          
          [Unit]: The published unit is [Percent].
          }
          
          {- {b [BurstCapacityTime]} - The available amount of time for your
             instance to burst at 100% CPU utilization. Your instance
             continuously accrues and consumes burst capacity. Burst capacity
             time stops accruing when your instance's
             [BurstCapacityPercentage] metric reaches 100%.
             
          Burst capacity time is consumed at the full rate only when your
          instance operates at 100% CPU utilization. For example, if your
          instance operates at 50% CPU utilization in the burstable zone for
          a 5-minute period, then it consumes CPU burst capacity minutes at a
          50% rate in that period. Your instance consumed 2 minutes and 30
          seconds of CPU burst capacity minutes in the 5-minute period. For
          more information, see
          {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-viewing-instance-burst-capacity }Viewing
          instance burst capacity in Amazon Lightsail}.
          
          [Statistics]: The most useful statistics are [Maximum] and
          [Average].
          
          [Unit]: The published unit is [Seconds].
          }
          
          {- {b [CPUUtilization]} - The percentage of allocated compute units
             that are currently in use on the instance. This metric
             identifies the processing power to run the applications on the
             instance. Tools in your operating system can show a lower
             percentage than Lightsail when the instance is not allocated a
             full processor core.
             
          [Statistics]: The most useful statistics are [Maximum] and
          [Average].
          
          [Unit]: The published unit is [Percent].
          }
          
          {- {b [NetworkIn]} - The number of bytes received on all network
             interfaces by the instance. This metric identifies the volume of
             incoming network traffic to the instance. The number reported is
             the number of bytes received during the period. Because this
             metric is reported in 5-minute intervals, divide the reported
             number by 300 to find Bytes/second.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [Bytes].
          }
          
          {- {b [NetworkOut]} - The number of bytes sent out on all network
             interfaces by the instance. This metric identifies the volume of
             outgoing network traffic from the instance. The number reported
             is the number of bytes sent during the period. Because this
             metric is reported in 5-minute intervals, divide the reported
             number by 300 to find Bytes/second.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [Bytes].
          }
          
          {- {b [StatusCheckFailed]} - Reports whether the instance passed or
             failed both the instance status check and the system status
             check. This metric can be either 0 (passed) or 1 (failed). This
             metric data is available in 1-minute (60 seconds) granularity.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [StatusCheckFailed_Instance]} - Reports whether the instance
             passed or failed the instance status check. This metric can be
             either 0 (passed) or 1 (failed). This metric data is available
             in 1-minute (60 seconds) granularity.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [StatusCheckFailed_System]} - Reports whether the instance
             passed or failed the system status check. This metric can be
             either 0 (passed) or 1 (failed). This metric data is available
             in 1-minute (60 seconds) granularity.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [Count].
          }
          
          {- {b [MetadataNoToken]} - Reports the number of times that the
             instance metadata service was successfully accessed without a
             token. This metric determines if there are any processes
             accessing instance metadata by using Instance Metadata Service
             Version 1, which doesn't use a token. If all requests use
             token-backed sessions, such as Instance Metadata Service Version
             2, then the value is 0.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [Count].
          }
          
    }
    |}*)

  instance_name: string;
   (**{|
    The name of the instance for which you want to get metrics data.|}*)

}

type instance_access_protocol = | Rdp
  | Ssh

(**{|
    Describes the public SSH host keys or the RDP certificate.|}*)
type host_key_attributes = {
  not_valid_after: float option;
   (**{|
    The returned RDP certificate is not valid after this point in time.
    
    This value is listed only for RDP certificates.|}*)

  not_valid_before: float option;
   (**{|
    The returned RDP certificate is valid after this point in time.
    
    This value is listed only for RDP certificates.|}*)

  fingerprint_sh_a256: string option;
   (**{|
    The SHA-256 fingerprint of the returned SSH host key or RDP certificate.
    
    {ol 
          {- Example of an SHA-256 SSH fingerprint:
             
          [SHA256:KTsMnRBh1IhD17HpdfsbzeGA4jOijm5tyXsMjKVbB8o]
          }
          
          {- Example of an SHA-256 RDP fingerprint:
             
          [03:9b:36:9f:4b:de:4e:61:70:fc:7c:c9:78:e7:d2:1a:1c:25:a8:0c:91:f6:7c:e4:d6:a0:85:c8:b4:53:99:68]
          
          }
          
    }
    |}*)

  fingerprint_sh_a1: string option;
   (**{|
    The SHA-1 fingerprint of the returned SSH host key or RDP certificate.
    
    {ol 
          {- Example of an SHA-1 SSH fingerprint:
             
          [SHA1:1CHH6FaAaXjtFOsR/t83vf91SR0]
          }
          
          {- Example of an SHA-1 RDP fingerprint:
             
          [af:34:51:fe:09:f0:e0:da:b8:4e:56:ca:60:c2:10:ff:38:06:db:45]
          }
          
    }
    |}*)

  witnessed_at: float option;
   (**{|
    The time that the SSH host key or RDP certificate was recorded by
    Lightsail.|}*)

  public_key: string option;
   (**{|
    The public SSH host key or the RDP certificate.|}*)

  algorithm: string option;
   (**{|
    The SSH host key algorithm or the RDP certificate format.
    
    For SSH host keys, the algorithm may be [ssh-rsa], [ecdsa-sha2-nistp256],
    [ssh-ed25519], etc. For RDP certificates, the algorithm is always
    [x509-cert].|}*)

}

(**{|
    The parameters for gaining temporary access to one of your Amazon
    Lightsail instances.|}*)
type instance_access_details = {
  host_keys: host_key_attributes list option;
   (**{|
    Describes the public SSH host keys or the RDP certificate.|}*)

  username: string option;
   (**{|
    The user name to use when logging in to the Amazon Lightsail instance.|}*)

  instance_name: string option;
   (**{|
    The name of this Amazon Lightsail instance.|}*)

  protocol: instance_access_protocol option;
   (**{|
    The protocol for these Amazon Lightsail instance access details.|}*)

  private_key: string option;
   (**{|
    For SSH access, the temporary private key. For OpenSSH clients (command
    line SSH), you should save this value to [tempkey]).|}*)

  password_data: password_data option;
   (**{|
    For a Windows Server-based instance, an object with the data you can use
    to retrieve your password. This is only needed if [password] is empty and
    the instance is not new (and therefore the password is not ready yet).
    When you create an instance, it can take up to 15 minutes for the
    instance to be ready.|}*)

  password: string option;
   (**{|
    For RDP access, the password for your Amazon Lightsail instance. Password
    will be an empty string if the password for your new instance is not
    ready yet. When you create an instance, it can take up to 15 minutes for
    the instance to be ready.
    
    If you create an instance using any key pair other than the default
    ([LightsailDefaultKeyPair]), [password] will always be an empty string.
    
    If you change the Administrator password on the instance, Lightsail will
    continue to return the original password value. When accessing the
    instance using RDP, you need to manually enter the Administrator password
    after changing it from the default.
    |}*)

  ipv6_addresses: string list option;
   (**{|
    The IPv6 address of the Amazon Lightsail instance.|}*)

  ip_address: string option;
   (**{|
    The public IP address of the Amazon Lightsail instance.|}*)

  expires_at: float option;
   (**{|
    For SSH access, the date on which the temporary keys expire.|}*)

  cert_key: string option;
   (**{|
    For SSH access, the public key to use when accessing your instance For
    OpenSSH clients (command line SSH), you should save this value to
    [tempkey-cert.pub].|}*)

}

type get_instance_access_details_result = {
  access_details: instance_access_details option;
   (**{|
    An array of key-value pairs containing information about a get instance
    access request.|}*)

}

type get_instance_access_details_request = {
  protocol: instance_access_protocol option;
   (**{|
    The protocol to use to connect to your instance. Defaults to [ssh].|}*)

  instance_name: string;
   (**{|
    The name of the instance to access.|}*)

}

type get_instance_result = {
  instance: instance option;
   (**{|
    An array of key-value pairs containing information about the specified
    instance.|}*)

}

type get_instance_request = {
  instance_name: string;
   (**{|
    The name of the instance.|}*)

}

type export_snapshot_record_source_type = | DiskSnapshot
  | InstanceSnapshot

(**{|
    Describes a disk.|}*)
type disk_info = {
  is_system_disk: bool option;
   (**{|
    A Boolean value indicating whether this disk is a system disk (has an
    operating system loaded on it).|}*)

  size_in_gb: int option;
   (**{|
    The size of the disk in GB ([32]).|}*)

  path: string option;
   (**{|
    The disk path.|}*)

  name: string option;
   (**{|
    The disk name.|}*)

}

(**{|
    Describes an instance snapshot.|}*)
type instance_snapshot_info = {
  from_disk_info: disk_info list option;
   (**{|
    A list of objects describing the disks that were attached to the source
    instance.|}*)

  from_blueprint_id: string option;
   (**{|
    The blueprint ID from which the source instance ([amazon_linux_2023]).|}*)

  from_bundle_id: string option;
   (**{|
    The bundle ID from which the source instance was created ([micro_x_x]).|}*)

}

(**{|
    Describes a disk snapshot.|}*)
type disk_snapshot_info = {
  size_in_gb: int option;
   (**{|
    The size of the disk in GB ([32]).|}*)

}

(**{|
    Describes the source of an export snapshot record.|}*)
type export_snapshot_record_source_info = {
  disk_snapshot_info: disk_snapshot_info option;
   (**{|
    A list of objects describing a disk snapshot.|}*)

  instance_snapshot_info: instance_snapshot_info option;
   (**{|
    A list of objects describing an instance snapshot.|}*)

  from_resource_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the snapshot's source instance or disk.|}*)

  from_resource_name: string option;
   (**{|
    The name of the snapshot's source instance or disk.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the source instance or disk snapshot.|}*)

  name: string option;
   (**{|
    The name of the source instance or disk snapshot.|}*)

  created_at: float option;
   (**{|
    The date when the source instance or disk snapshot was created.|}*)

  resource_type: export_snapshot_record_source_type option;
   (**{|
    The Lightsail resource type ([InstanceSnapshot] or [DiskSnapshot]).|}*)

}

(**{|
    Describes the destination of a record.|}*)
type destination_info = {
  service: string option;
   (**{|
    The destination service of the record.|}*)

  id: string option;
   (**{|
    The ID of the resource created at the destination.|}*)

}

(**{|
    Describes an export snapshot record.|}*)
type export_snapshot_record = {
  destination_info: destination_info option;
   (**{|
    A list of objects describing the destination of the export snapshot
    record.|}*)

  source_info: export_snapshot_record_source_info option;
   (**{|
    A list of objects describing the source of the export snapshot record.|}*)

  state: record_state option;
   (**{|
    The state of the export snapshot record.|}*)

  resource_type: resource_type option;
   (**{|
    The Lightsail resource type ([ExportSnapshotRecord]).|}*)

  location: resource_location option;
   (**{|
    The AWS Region and Availability Zone where the export snapshot record is
    located.|}*)

  created_at: float option;
   (**{|
    The date when the export snapshot record was created.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the export snapshot record.|}*)

  name: string option;
   (**{|
    The export snapshot record name.|}*)

}

type get_export_snapshot_records_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another
    [GetExportSnapshotRecords] request and specify the next page token using
    the [pageToken] parameter.|}*)

  export_snapshot_records: export_snapshot_record list option;
   (**{|
    A list of objects describing the export snapshot records.|}*)

}

type get_export_snapshot_records_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetExportSnapshotRecords]
    request. If your results are paginated, the response will return a next
    page token that you can specify as the page token in a subsequent
    request.|}*)

}

(**{|
    Describes a domain where you are storing recordsets.|}*)
type domain = {
  registered_domain_delegation_info: registered_domain_delegation_info option;
   (**{|
    An object that describes the state of the Route 53 domain delegation to
    a Lightsail DNS zone.|}*)

  domain_entries: domain_entry list option;
   (**{|
    An array of key-value pairs containing information about the domain
    entries.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The resource type.|}*)

  location: resource_location option;
   (**{|
    The AWS Region and Availability Zones where the domain recordset was
    created.|}*)

  created_at: float option;
   (**{|
    The date when the domain recordset was created.|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about an instance or another resource in Lightsail. This
    code enables our support team to look up your Lightsail information more
    easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the domain recordset
    ([arn:aws:lightsail:global:123456789101:Domain/824cede0-abc7-4f84-8dbc-12345EXAMPLE]).
    |}*)

  name: string option;
   (**{|
    The name of the domain.|}*)

}

type get_domains_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetDomains] request and
    specify the next page token using the [pageToken] parameter.|}*)

  domains: domain list option;
   (**{|
    An array of key-value pairs containing information about each of the
    domain entries in the user's account.|}*)

}

type get_domains_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetDomains] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

}

type get_domain_result = {
  domain: domain option;
   (**{|
    An array of key-value pairs containing information about your get domain
    request.|}*)

}

type get_domain_request = {
  domain_name: string;
   (**{|
    The domain name for which your want to return information about.|}*)

}

(**{|
    Describes an Amazon Lightsail content delivery network (CDN) distribution.|}*)
type lightsail_distribution = {
  viewer_minimum_tls_protocol_version: string option;
   (**{|
    The minimum TLS protocol version that the distribution can use to
    communicate with viewers.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  ip_address_type: ip_address_type option;
   (**{|
    The IP address type of the distribution.
    
    The possible values are [ipv4] for IPv4 only, and [dualstack] for IPv4
    and IPv6.|}*)

  able_to_update_bundle: bool option;
   (**{|
    Indicates whether the bundle that is currently applied to your
    distribution, specified using the [distributionName] parameter, can be
    changed to another bundle.
    
    Use the [UpdateDistributionBundle] action to change your distribution's
    bundle.|}*)

  cache_behaviors: cache_behavior_per_path list option;
   (**{|
    An array of objects that describe the per-path cache behavior of the
    distribution.|}*)

  cache_behavior_settings: cache_settings option;
   (**{|
    An object that describes the cache behavior settings of the distribution.|}*)

  default_cache_behavior: cache_behavior option;
   (**{|
    An object that describes the default cache behavior of the distribution.|}*)

  origin_public_dn_s: string option;
   (**{|
    The public DNS of the origin.|}*)

  origin: origin option;
   (**{|
    An object that describes the origin resource of the distribution, such as
    a Lightsail instance, bucket, or load balancer.
    
    The distribution pulls, caches, and serves content from the origin.|}*)

  certificate_name: string option;
   (**{|
    The name of the SSL/TLS certificate attached to the distribution, if any.|}*)

  bundle_id: string option;
   (**{|
    The ID of the bundle currently applied to the distribution.|}*)

  domain_name: string option;
   (**{|
    The domain name of the distribution.|}*)

  is_enabled: bool option;
   (**{|
    Indicates whether the distribution is enabled.|}*)

  status: string option;
   (**{|
    The status of the distribution.|}*)

  alternative_domain_names: string list option;
   (**{|
    The alternate domain names of the distribution.|}*)

  resource_type: resource_type option;
   (**{|
    The Lightsail resource type ([Distribution]).|}*)

  location: resource_location option;
   (**{|
    An object that describes the location of the distribution, such as the
    Amazon Web Services Region and Availability Zone.
    
    Lightsail distributions are global resources that can reference an origin
    in any Amazon Web Services Region, and distribute its content globally.
    However, all distributions are located in the [us-east-1] Region.
    |}*)

  created_at: float option;
   (**{|
    The timestamp when the distribution was created.|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about your Lightsail distribution. This code enables our
    support team to look up your Lightsail information more easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the distribution.|}*)

  name: string option;
   (**{|
    The name of the distribution.|}*)

}

type get_distributions_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetDistributions]
    request and specify the next page token using the [pageToken] parameter.|}*)

  distributions: lightsail_distribution list option;
   (**{|
    An array of objects that describe your distributions.|}*)

}

type get_distributions_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetDistributions] request. If
    your results are paginated, the response will return a next page token
    that you can specify as the page token in a subsequent request.|}*)

  distribution_name: string option;
   (**{|
    The name of the distribution for which to return information.
    
    When omitted, the response includes all of your distributions in the
    Amazon Web Services Region where the request is made.|}*)

}

type distribution_metric_name = | Http5xxErrorRate
  | Http4xxErrorRate
  | TotalErrorRate
  | BytesUploaded
  | BytesDownloaded
  | Requests

type get_distribution_metric_data_result = {
  metric_data: metric_datapoint list option;
   (**{|
    An array of objects that describe the metric data returned.|}*)

  metric_name: distribution_metric_name option;
   (**{|
    The name of the metric returned.|}*)

}

type get_distribution_metric_data_request = {
  statistics: metric_statistic list;
   (**{|
    The statistic for the metric.
    
    The following statistics are available:
    
    {ol 
          {- [Minimum] - The lowest value observed during the specified
             period. Use this value to determine low volumes of activity for
             your application.
             }
          
          {- [Maximum] - The highest value observed during the specified
             period. Use this value to determine high volumes of activity for
             your application.
             }
          
          {- [Sum] - All values submitted for the matching metric added
             together. You can use this statistic to determine the total
             volume of a metric.
             }
          
          {- [Average] - The value of Sum / SampleCount during the specified
             period. By comparing this statistic with the Minimum and Maximum
             values, you can determine the full scope of a metric and how
             close the average use is to the Minimum and Maximum values. This
             comparison helps you to know when to increase or decrease your
             resources.
             }
          
          {- [SampleCount] - The count, or number, of data points used for
             the statistical calculation.
             }
          
    }
    |}*)

  unit_: metric_unit;
   (**{|
    The unit for the metric data request.
    
    Valid units depend on the metric data being requested. For the valid
    units with each available metric, see the [metricName] parameter.|}*)

  period: int;
   (**{|
    The granularity, in seconds, for the metric data points that will be
    returned.|}*)

  end_time: float;
   (**{|
    The end of the time interval for which to get metric data.
    
    Constraints:
    
    {ol 
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you wish to use an end time of October 1, 2018, at
          9 PM UTC, specify [1538427600] as the end time.
          }
          
    }
    
    You can convert a human-friendly time to Unix time format using a
    converter like {{: https://www.epochconverter.com/ }Epoch converter}.|}*)

  start_time: float;
   (**{|
    The start of the time interval for which to get metric data.
    
    Constraints:
    
    {ol 
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you wish to use a start time of October 1, 2018, at
          8 PM UTC, specify [1538424000] as the start time.
          }
          
    }
    
    You can convert a human-friendly time to Unix time format using a
    converter like {{: https://www.epochconverter.com/ }Epoch converter}.|}*)

  metric_name: distribution_metric_name;
   (**{|
    The metric for which you want to return information.
    
    Valid distribution metric names are listed below, along with the most
    useful [statistics] to include in your request, and the published [unit]
    value.
    
    {ol 
          {- {b [Requests]} - The total number of viewer requests received by
             your Lightsail distribution, for all HTTP methods, and for both
             HTTP and HTTPS requests.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [None].
          }
          
          {- {b [BytesDownloaded]} - The number of bytes downloaded by
             viewers for GET, HEAD, and OPTIONS requests.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [None].
          }
          
          {- {b [BytesUploaded]} - The number of bytes uploaded to your
             origin by your Lightsail distribution, using POST and PUT
             requests.
             
          [Statistics]: The most useful statistic is [Sum].
          
          [Unit]: The published unit is [None].
          }
          
          {- {b [TotalErrorRate]} - The percentage of all viewer requests for
             which the response's HTTP status code was 4xx or 5xx.
             
          [Statistics]: The most useful statistic is [Average].
          
          [Unit]: The published unit is [Percent].
          }
          
          {- {b [4xxErrorRate]} - The percentage of all viewer requests for
             which the response's HTTP status cod was 4xx. In these cases,
             the client or client viewer may have made an error. For example,
             a status code of 404 (Not Found) means that the client requested
             an object that could not be found.
             
          [Statistics]: The most useful statistic is [Average].
          
          [Unit]: The published unit is [Percent].
          }
          
          {- {b [5xxErrorRate]} - The percentage of all viewer requests for
             which the response's HTTP status code was 5xx. In these cases,
             the origin server did not satisfy the requests. For example, a
             status code of 503 (Service Unavailable) means that the origin
             server is currently unavailable.
             
          [Statistics]: The most useful statistic is [Average].
          
          [Unit]: The published unit is [Percent].
          }
          
    }
    |}*)

  distribution_name: string;
   (**{|
    The name of the distribution for which to get metric data.
    
    Use the [GetDistributions] action to get a list of distribution names
    that you can specify.|}*)

}

type get_distribution_latest_cache_reset_result = {
  create_time: float option;
   (**{|
    The timestamp of the last cache reset ([1479734909.17]) in Unix time
    format.|}*)

  status: string option;
   (**{|
    The status of the last cache reset.|}*)

}

type get_distribution_latest_cache_reset_request = {
  distribution_name: string option;
   (**{|
    The name of the distribution for which to return the timestamp of the
    last cache reset.
    
    Use the [GetDistributions] action to get a list of distribution names
    that you can specify.
    
    When omitted, the response includes the latest cache reset timestamp of
    all your distributions.|}*)

}

(**{|
    Describes the specifications of a distribution bundle.|}*)
type distribution_bundle = {
  is_active: bool option;
   (**{|
    Indicates whether the bundle is active, and can be specified for a new or
    existing distribution.|}*)

  transfer_per_month_in_gb: int option;
   (**{|
    The monthly network transfer quota of the bundle.|}*)

  price: float option;
   (**{|
    The monthly price, in US dollars, of the bundle.|}*)

  name: string option;
   (**{|
    The name of the distribution bundle.|}*)

  bundle_id: string option;
   (**{|
    The ID of the bundle.|}*)

}

type get_distribution_bundles_result = {
  bundles: distribution_bundle list option;
   (**{|
    An object that describes a distribution bundle.|}*)

}

type get_distribution_bundles_request = unit

type disk_snapshot_state = | Unknown
  | Error
  | Completed
  | Pending

(**{|
    Describes a block storage disk snapshot.|}*)
type disk_snapshot = {
  is_from_auto_snapshot: bool option;
   (**{|
    A Boolean value indicating whether the snapshot was created from an
    automatic snapshot.|}*)

  from_instance_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the source instance from which the disk
    (system volume) snapshot was created.|}*)

  from_instance_name: string option;
   (**{|
    The unique name of the source instance from which the disk (system
    volume) snapshot was created.|}*)

  from_disk_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the source disk from which the disk
    snapshot was created.|}*)

  from_disk_name: string option;
   (**{|
    The unique name of the source disk from which the disk snapshot was
    created.|}*)

  progress: string option;
   (**{|
    The progress of the snapshot.|}*)

  state: disk_snapshot_state option;
   (**{|
    The status of the disk snapshot operation.|}*)

  size_in_gb: int option;
   (**{|
    The size of the disk in GB.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  resource_type: resource_type option;
   (**{|
    The Lightsail resource type ([DiskSnapshot]).|}*)

  location: resource_location option;
   (**{|
    The AWS Region and Availability Zone where the disk snapshot was created.|}*)

  created_at: float option;
   (**{|
    The date when the disk snapshot was created.|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about an instance or another resource in Lightsail. This
    code enables our support team to look up your Lightsail information more
    easily.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the disk snapshot.|}*)

  name: string option;
   (**{|
    The name of the disk snapshot ([my-disk-snapshot]).|}*)

}

type get_disk_snapshots_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetDiskSnapshots]
    request and specify the next page token using the [pageToken] parameter.|}*)

  disk_snapshots: disk_snapshot list option;
   (**{|
    An array of objects containing information about all block storage disk
    snapshots.|}*)

}

type get_disk_snapshots_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetDiskSnapshots] request. If
    your results are paginated, the response will return a next page token
    that you can specify as the page token in a subsequent request.|}*)

}

type get_disk_snapshot_result = {
  disk_snapshot: disk_snapshot option;
   (**{|
    An object containing information about the disk snapshot.|}*)

}

type get_disk_snapshot_request = {
  disk_snapshot_name: string;
   (**{|
    The name of the disk snapshot ([my-disk-snapshot]).|}*)

}

type get_disks_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetDisks] request and
    specify the next page token using the [pageToken] parameter.|}*)

  disks: disk list option;
   (**{|
    An array of objects containing information about all block storage disks.|}*)

}

type get_disks_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetDisks] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

}

type get_disk_result = {
  disk: disk option;
   (**{|
    An object containing information about the disk.|}*)

}

type get_disk_request = {
  disk_name: string;
   (**{|
    The name of the disk ([my-disk]).|}*)

}

type get_cost_estimate_result = {
  resources_budget_estimate: resource_budget_estimate list option;
   (**{|
    Returns the estimate's forecasted cost or usage.|}*)

}

type get_cost_estimate_request = {
  end_time: float;
   (**{|
    The cost estimate end time.
    
    Constraints:
    
    {ol 
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you want to use an end time of October 1, 2018, at
          9 PM UTC, specify [1538427600] as the end time.
          }
          
    }
    
    You can convert a human-friendly time to Unix time format using a
    converter like {{: https://www.epochconverter.com/ }Epoch converter}.|}*)

  start_time: float;
   (**{|
    The cost estimate start time.
    
    Constraints:
    
    {ol 
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you want to use a start time of October 1, 2018, at
          8 PM UTC, specify [1538424000] as the start time.
          }
          
    }
    
    You can convert a human-friendly time to Unix time format using a
    converter like {{: https://www.epochconverter.com/ }Epoch converter}.|}*)

  resource_name: string;
   (**{|
    The resource name.|}*)

}

type container_services_list_result = {
  container_services: container_service list option;
   (**{|
    An array of objects that describe one or more container services.|}*)

}

type get_container_services_request = {
  service_name: string option;
   (**{|
    The name of the container service for which to return information.
    
    When omitted, the response includes all of your container services in the
    Amazon Web Services Region where the request is made.|}*)

}

(**{|
    Describes the powers that can be specified for an Amazon Lightsail
    container service.
    
    The power specifies the amount of RAM, the number of vCPUs, and the base
    price of the container service.|}*)
type container_service_power = {
  is_active: bool option;
   (**{|
    A Boolean value indicating whether the power is active and can be
    specified for container services.|}*)

  name: string option;
   (**{|
    The friendly name of the power ([nano]).|}*)

  ram_size_in_gb: float option;
   (**{|
    The amount of RAM (in GB) of the power.|}*)

  cpu_count: float option;
   (**{|
    The number of vCPUs included in the power.|}*)

  price: float option;
   (**{|
    The monthly price of the power in USD.|}*)

  power_id: string option;
   (**{|
    The ID of the power ([nano-1]).|}*)

}

type get_container_service_powers_result = {
  powers: container_service_power list option;
   (**{|
    An array of objects that describe the powers that can be specified for a
    container service.|}*)

}

type get_container_service_powers_request = unit

type container_service_metric_name = | MemoryUtilization
  | CPUUtilization

type get_container_service_metric_data_result = {
  metric_data: metric_datapoint list option;
   (**{|
    An array of objects that describe the metric data returned.|}*)

  metric_name: container_service_metric_name option;
   (**{|
    The name of the metric returned.|}*)

}

type get_container_service_metric_data_request = {
  statistics: metric_statistic list;
   (**{|
    The statistic for the metric.
    
    The following statistics are available:
    
    {ol 
          {- [Minimum] - The lowest value observed during the specified
             period. Use this value to determine low volumes of activity for
             your application.
             }
          
          {- [Maximum] - The highest value observed during the specified
             period. Use this value to determine high volumes of activity for
             your application.
             }
          
          {- [Sum] - All values submitted for the matching metric added
             together. You can use this statistic to determine the total
             volume of a metric.
             }
          
          {- [Average] - The value of [Sum] / [SampleCount] during the
             specified period. By comparing this statistic with the [Minimum]
             and [Maximum] values, you can determine the full scope of a
             metric and how close the average use is to the [Minimum] and
             [Maximum] values. This comparison helps you to know when to
             increase or decrease your resources.
             }
          
          {- [SampleCount] - The count, or number, of data points used for
             the statistical calculation.
             }
          
    }
    |}*)

  period: int;
   (**{|
    The granularity, in seconds, of the returned data points.
    
    All container service metric data is available in 5-minute (300 seconds)
    granularity.|}*)

  end_time: float;
   (**{|
    The end time of the time period.|}*)

  start_time: float;
   (**{|
    The start time of the time period.|}*)

  metric_name: container_service_metric_name;
   (**{|
    The metric for which you want to return information.
    
    Valid container service metric names are listed below, along with the
    most useful statistics to include in your request, and the published unit
    value.
    
    {ol 
          {- [CPUUtilization] - The average percentage of compute units that
             are currently in use across all nodes of the container service.
             This metric identifies the processing power required to run
             containers on each node of the container service.
             
          Statistics: The most useful statistics are [Maximum] and [Average].
          
          Unit: The published unit is [Percent].
          }
          
          {- [MemoryUtilization] - The average percentage of available memory
             that is currently in use across all nodes of the container
             service. This metric identifies the memory required to run
             containers on each node of the container service.
             
          Statistics: The most useful statistics are [Maximum] and [Average].
          
          Unit: The published unit is [Percent].
          }
          
    }
    |}*)

  service_name: string;
   (**{|
    The name of the container service for which to get metric data.|}*)

}

type get_container_service_deployments_result = {
  deployments: container_service_deployment list option;
   (**{|
    An array of objects that describe deployments for a container service.|}*)

}

type get_container_service_deployments_request = {
  service_name: string;
   (**{|
    The name of the container service for which to return deployments.|}*)

}

(**{|
    Describes the log events of a container of an Amazon Lightsail container
    service.|}*)
type container_service_log_event = {
  message: string option;
   (**{|
    The message of the container service log event.|}*)

  created_at: float option;
   (**{|
    The timestamp when the container service log event was created.|}*)

}

type get_container_log_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetContainerLog]
    request and specify the next page token using the [pageToken] parameter.|}*)

  log_events: container_service_log_event list option;
   (**{|
    An array of objects that describe the log events of a container.|}*)

}

type get_container_log_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetContainerLog] request. If
    your results are paginated, the response will return a next page token
    that you can specify as the page token in a subsequent request.|}*)

  filter_pattern: string option;
   (**{|
    The pattern to use to filter the returned log events to a specific term.
    
    The following are a few examples of filter patterns that you can specify:
    
    {ol 
          {- To return all log events, specify a filter pattern of [""].
             }
          
          {- To exclude log events that contain the [ERROR] term, and return
             all other log events, specify a filter pattern of ["-ERROR"].
             }
          
          {- To return log events that contain the [ERROR] term, specify a
             filter pattern of ["ERROR"].
             }
          
          {- To return log events that contain both the [ERROR] and
             [Exception] terms, specify a filter pattern of ["ERROR
             Exception"].
             }
          
          {- To return log events that contain the [ERROR] {i or} the
             [Exception] term, specify a filter pattern of ["?ERROR
             ?Exception"].
             }
          
    }
    |}*)

  end_time: float option;
   (**{|
    The end of the time interval for which to get log data.
    
    Constraints:
    
    {ol 
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you wish to use an end time of October 1, 2018, at
          9 PM UTC, specify [1538427600] as the end time.
          }
          
    }
    
    You can convert a human-friendly time to Unix time format using a
    converter like {{: https://www.epochconverter.com/ }Epoch converter}.|}*)

  start_time: float option;
   (**{|
    The start of the time interval for which to get log data.
    
    Constraints:
    
    {ol 
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you wish to use a start time of October 1, 2018, at
          8 PM UTC, specify [1538424000] as the start time.
          }
          
    }
    
    You can convert a human-friendly time to Unix time format using a
    converter like {{: https://www.epochconverter.com/ }Epoch converter}.|}*)

  container_name: string;
   (**{|
    The name of the container that is either running or previously ran on the
    container service for which to return a log.|}*)

  service_name: string;
   (**{|
    The name of the container service for which to get a container log.|}*)

}

type get_container_images_result = {
  container_images: container_image list option;
   (**{|
    An array of objects that describe container images that are registered to
    the container service.|}*)

}

type get_container_images_request = {
  service_name: string;
   (**{|
    The name of the container service for which to return registered
    container images.|}*)

}

type get_container_api_metadata_result = {
  metadata: (string * string) list list option;
   (**{|
    Metadata about Lightsail containers, such as the current version of the
    Lightsail Control (lightsailctl) plugin.|}*)

}

type get_container_api_metadata_request = unit

type contact_method_status = | Invalid
  | Valid
  | PendingVerification

(**{|
    Describes a contact method.
    
    A contact method is a way to send you notifications. For more
    information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications }Notifications
    in Amazon Lightsail}.|}*)
type contact_method = {
  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about your Lightsail contact method. This code enables our
    support team to look up your Lightsail information more easily.|}*)

  resource_type: resource_type option;
   (**{|
    The Lightsail resource type of the contact method.|}*)

  location: resource_location option;
   (**{|
    An object that describes the location of the contact method, such as the
    Amazon Web Services Region and Availability Zone.|}*)

  created_at: float option;
   (**{|
    The timestamp when the contact method was created.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the contact method.|}*)

  name: string option;
   (**{|
    The name of the contact method.|}*)

  protocol: contact_protocol option;
   (**{|
    The protocol of the contact method, such as email or SMS (text messaging).|}*)

  status: contact_method_status option;
   (**{|
    The current status of the contact method.
    
    A contact method has the following possible status:
    
    {ol 
          {- [PendingVerification] - The contact method has not yet been
             verified, and the verification has not yet expired.
             }
          
          {- [Valid] - The contact method has been verified.
             }
          
          {- [InValid] - An attempt was made to verify the contact method,
             but the verification has expired.
             }
          
    }
    |}*)

  contact_endpoint: string option;
   (**{|
    The destination of the contact method, such as an email address or a
    mobile phone number.|}*)

}

type get_contact_methods_result = {
  contact_methods: contact_method list option;
   (**{|
    An array of objects that describe the contact methods.|}*)

}

type get_contact_methods_request = {
  protocols: contact_protocol list option;
   (**{|
    The protocols used to send notifications, such as [Email], or [SMS] (text
    messaging).
    
    Specify a protocol in your request to return information about a specific
    contact method protocol.|}*)

}

type cloud_formation_stack_record_source_type = | ExportSnapshotRecord

(**{|
    Describes the source of a CloudFormation stack record (i.e., the export
    snapshot record).|}*)
type cloud_formation_stack_record_source_info = {
  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the export snapshot record.|}*)

  name: string option;
   (**{|
    The name of the record.|}*)

  resource_type: cloud_formation_stack_record_source_type option;
   (**{|
    The Lightsail resource type ([ExportSnapshotRecord]).|}*)

}

(**{|
    Describes a CloudFormation stack record created as a result of the
    [create cloud formation stack] action.
    
    A CloudFormation stack record provides information about the AWS
    CloudFormation stack used to create a new Amazon Elastic Compute Cloud
    instance from an exported Lightsail instance snapshot.|}*)
type cloud_formation_stack_record = {
  destination_info: destination_info option;
   (**{|
    A list of objects describing the destination service, which is AWS
    CloudFormation, and the Amazon Resource Name (ARN) of the AWS
    CloudFormation stack.|}*)

  source_info: cloud_formation_stack_record_source_info list option;
   (**{|
    A list of objects describing the source of the CloudFormation stack
    record.|}*)

  state: record_state option;
   (**{|
    The current state of the CloudFormation stack record.|}*)

  resource_type: resource_type option;
   (**{|
    The Lightsail resource type ([CloudFormationStackRecord]).|}*)

  location: resource_location option;
   (**{|
    A list of objects describing the Availability Zone and Amazon Web
    Services Region of the CloudFormation stack record.|}*)

  created_at: float option;
   (**{|
    The date when the CloudFormation stack record was created.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the CloudFormation stack record.|}*)

  name: string option;
   (**{|
    The name of the CloudFormation stack record. It starts with
    [CloudFormationStackRecord] followed by a GUID.|}*)

}

type get_cloud_formation_stack_records_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another
    [GetCloudFormationStackRecords] request and specify the next page token
    using the [pageToken] parameter.|}*)

  cloud_formation_stack_records: cloud_formation_stack_record list option;
   (**{|
    A list of objects describing the CloudFormation stack records.|}*)

}

type get_cloud_formation_stack_records_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetClouFormationStackRecords]
    request. If your results are paginated, the response will return a next
    page token that you can specify as the page token in a subsequent
    request.|}*)

}

type certificate_status = | Failed
  | Revoked
  | ValidationTimedOut
  | Expired
  | Inactive
  | Issued
  | PendingValidation

(**{|
    Describes the full details of an Amazon Lightsail SSL/TLS certificate.
    
    To get a summary of a certificate, use the [GetCertificates] action and
    omit [includeCertificateDetails] from your request. The response will
    include only the certificate Amazon Resource Name (ARN), certificate
    name, domain name, and tags.
    |}*)
type certificate = {
  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about your Lightsail certificate. This code enables our
    support team to look up your Lightsail information more easily.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  revocation_reason: string option;
   (**{|
    The reason the certificate was revoked. This value is present only when
    the certificate status is [REVOKED].|}*)

  revoked_at: float option;
   (**{|
    The timestamp when the certificate was revoked. This value is present
    only when the certificate status is [REVOKED].|}*)

  renewal_summary: renewal_summary option;
   (**{|
    An object that describes the status of the certificate renewal managed by
    Lightsail.|}*)

  eligible_to_renew: string option;
   (**{|
    The renewal eligibility of the certificate.|}*)

  not_after: float option;
   (**{|
    The timestamp when the certificate expires.|}*)

  not_before: float option;
   (**{|
    The timestamp when the certificate is first valid.|}*)

  issuer_c_a: string option;
   (**{|
    The certificate authority that issued the certificate.|}*)

  issued_at: float option;
   (**{|
    The timestamp when the certificate was issued.|}*)

  created_at: float option;
   (**{|
    The timestamp when the certificate was created.|}*)

  key_algorithm: string option;
   (**{|
    The algorithm used to generate the key pair (the public and private key)
    of the certificate.|}*)

  in_use_resource_count: int option;
   (**{|
    The number of Lightsail resources that the certificate is attached to.|}*)

  request_failure_reason: string option;
   (**{|
    The validation failure reason, if any, of the certificate.
    
    The following failure reasons are possible:
    
    {ol 
          {- {b [NO_AVAILABLE_CONTACTS]} - This failure applies to email
             validation, which is not available for Lightsail certificates.
             }
          
          {- {b [ADDITIONAL_VERIFICATION_REQUIRED]} - Lightsail requires
             additional information to process this certificate request. This
             can happen as a fraud-protection measure, such as when the
             domain ranks within the Alexa top 1000 websites. To provide the
             required information, use the
             {{: https://console.aws.amazon.com/support/home }Amazon Web
             Services Support Center} to contact Amazon Web Services Support.
             
          You cannot request a certificate for Amazon-owned domain names such
          as those ending in amazonaws.com, cloudfront.net, or
          elasticbeanstalk.com.
          }
          
          {- {b [DOMAIN_NOT_ALLOWED]} - One or more of the domain names in
             the certificate request was reported as an unsafe domain by
             {{: https://www.virustotal.com/gui/home/url }VirusTotal}. To
             correct the problem, search for your domain name on the
             {{: https://www.virustotal.com/gui/home/url }VirusTotal}
             website. If your domain is reported as suspicious, see
             {{: https://developers.google.com/web/fundamentals/security/hacked }Google
             Help for Hacked Websites} to learn what you can do.
             
          If you believe that the result is a false positive, notify the
          organization that is reporting the domain. VirusTotal is an
          aggregate of several antivirus and URL scanners and cannot remove
          your domain from a block list itself. After you correct the problem
          and the VirusTotal registry has been updated, request a new
          certificate.
          
          If you see this error and your domain is not included in the
          VirusTotal list, visit the
          {{: https://console.aws.amazon.com/support/home }Amazon Web
          Services Support Center} and create a case.
          }
          
          {- {b [INVALID_PUBLIC_DOMAIN]} - One or more of the domain names in
             the certificate request is not valid. Typically, this is because
             a domain name in the request is not a valid top-level domain.
             Try to request a certificate again, correcting any spelling
             errors or typos that were in the failed request, and ensure that
             all domain names in the request are for valid top-level domains.
             For example, you cannot request a certificate for
             [example.invalidpublicdomain] because [invalidpublicdomain] is
             not a valid top-level domain.
             }
          
          {- {b [OTHER]} - Typically, this failure occurs when there is a
             typographical error in one or more of the domain names in the
             certificate request. Try to request a certificate again,
             correcting any spelling errors or typos that were in the failed
             request.
             }
          
    }
    |}*)

  domain_validation_records: domain_validation_record list option;
   (**{|
    An array of objects that describe the domain validation records of the
    certificate.|}*)

  subject_alternative_names: string list option;
   (**{|
    An array of strings that specify the alternate domains ([example2.com])
    and subdomains ([blog.example.com]) of the certificate.|}*)

  serial_number: string option;
   (**{|
    The serial number of the certificate.|}*)

  status: certificate_status option;
   (**{|
    The validation status of the certificate.|}*)

  domain_name: string option;
   (**{|
    The domain name of the certificate.|}*)

  name: string option;
   (**{|
    The name of the certificate ([my-certificate]).|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the certificate.|}*)

}

(**{|
    Describes an Amazon Lightsail SSL/TLS certificate.|}*)
type certificate_summary = {
  tags: tag list option;
   (**{|
    The tag keys and optional values for the resource. For more information
    about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  certificate_detail: certificate option;
   (**{|
    An object that describes a certificate in detail.|}*)

  domain_name: string option;
   (**{|
    The domain name of the certificate.|}*)

  certificate_name: string option;
   (**{|
    The name of the certificate.|}*)

  certificate_arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the certificate.|}*)

}

type get_certificates_result = {
  next_page_token: string option;
   (**{|
    If [NextPageToken] is returned there are more results available. The
    value of [NextPageToken] is a unique pagination token for each page. Make
    the call again using the returned token to retrieve the next page. Keep
    all other arguments unchanged.|}*)

  certificates: certificate_summary list option;
   (**{|
    An object that describes certificates.|}*)

}

type get_certificates_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetCertificates] request. If
    your results are paginated, the response will return a next page token
    that you can specify as the page token in a subsequent request.|}*)

  certificate_name: string option;
   (**{|
    The name for the certificate for which to return information.
    
    When omitted, the response includes all of your certificates in the
    Amazon Web Services Region where the request is made.|}*)

  include_certificate_details: bool option;
   (**{|
    Indicates whether to include detailed information about the certificates
    in the response.
    
    When omitted, the response includes only the certificate names, Amazon
    Resource Names (ARNs), domain names, and tags.|}*)

  certificate_statuses: certificate_status list option;
   (**{|
    The status of the certificates for which to return information.
    
    For example, specify [ISSUED] to return only certificates with an
    [ISSUED] status.
    
    When omitted, the response includes all of your certificates in the
    Amazon Web Services Region where the request is made, regardless of their
    current status.|}*)

}

type instance_platform = | Windows
  | LinuxUnix

type app_category = | LfR

(**{|
    Describes a bundle, which is a set of specs describing your virtual
    private server (or {i instance}).|}*)
type bundle = {
  public_ipv4_address_count: int option;
   (**{|
    An integer that indicates the public ipv4 address count included in the
    bundle, the value is either 0 or 1.|}*)

  supported_app_categories: app_category list option;
   (**{|
    Virtual computer blueprints that are supported by a Lightsail for
    Research bundle.
    
    This parameter only applies to Lightsail for Research resources.
    |}*)

  supported_platforms: instance_platform list option;
   (**{|
    The operating system platform (Linux/Unix-based or Windows Server-based)
    that the bundle supports. You can only launch a [WINDOWS] bundle on a
    blueprint that supports the [WINDOWS] platform. [LINUX_UNIX] blueprints
    require a [LINUX_UNIX] bundle.|}*)

  transfer_per_month_in_gb: int option;
   (**{|
    The data transfer rate per month in GB ([2000]).|}*)

  ram_size_in_gb: float option;
   (**{|
    The amount of RAM in GB ([2.0]).|}*)

  power: int option;
   (**{|
    A numeric value that represents the power of the bundle ([500]). You can
    use the bundle's power value in conjunction with a blueprint's minimum
    power value to determine whether the blueprint will run on the bundle.
    For example, you need a bundle with a power value of 500 or more to
    create an instance that uses a blueprint with a minimum power value of
    500.|}*)

  name: string option;
   (**{|
    A friendly name for the bundle ([Micro]).|}*)

  is_active: bool option;
   (**{|
    A Boolean value indicating whether the bundle is active.|}*)

  instance_type: string option;
   (**{|
    The instance type ([micro]).|}*)

  bundle_id: string option;
   (**{|
    The bundle ID ([micro_x_x]).|}*)

  disk_size_in_gb: int option;
   (**{|
    The size of the SSD ([30]).|}*)

  cpu_count: int option;
   (**{|
    The number of vCPUs included in the bundle ([2]).|}*)

  price: float option;
   (**{|
    The price in US dollars ([5.0]) of the bundle.|}*)

}

type get_bundles_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetBundles] request and
    specify the next page token using the [pageToken] parameter.|}*)

  bundles: bundle list option;
   (**{|
    An array of key-value pairs that contains information about the available
    bundles.|}*)

}

type get_bundles_request = {
  app_category: app_category option;
   (**{|
    Returns a list of bundles that are specific to Lightsail for Research.
    
    You must use this parameter to view Lightsail for Research bundles.
    |}*)

  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetBundles] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

  include_inactive: bool option;
   (**{|
    A Boolean value that indicates whether to include inactive (unavailable)
    bundles in the response of your request.|}*)

}

type account_level_bpa_sync_status = | Defaulted
  | NeverSynced
  | Failed
  | InSync

type bpa_status_message = | Unknown
  | DEFAULTED_FOR_SLR_MISSING_ON_HOLD
  | SYNC_ON_HOLD
  | DEFAULTED_FOR_SLR_MISSING

(**{|
    Describes the synchronization status of the Amazon Simple Storage Service
    (Amazon S3) account-level block public access (BPA) feature for your
    Lightsail buckets.
    
    The account-level BPA feature of Amazon S3 provides centralized controls
    to limit public access to all Amazon S3 buckets in an account. BPA can
    make all Amazon S3 buckets in an Amazon Web Services account private
    regardless of the individual bucket and object permissions that are
    configured. Lightsail buckets take into account the Amazon S3
    account-level BPA configuration when allowing or denying public access.
    To do this, Lightsail periodically fetches the account-level BPA
    configuration from Amazon S3. When the account-level BPA status is
    [InSync], the Amazon S3 account-level BPA configuration is synchronized
    and it applies to your Lightsail buckets. For more information about
    Amazon Simple Storage Service account-level BPA and how it affects
    Lightsail buckets, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-block-public-access-for-buckets }Block
    public access for buckets in Amazon Lightsail} in the {i Amazon Lightsail
    Developer Guide}.|}*)
type account_level_bpa_sync = {
  bpa_impacts_lightsail: bool option;
   (**{|
    A Boolean value that indicates whether account-level block public access
    is affecting your Lightsail buckets.|}*)

  message: bpa_status_message option;
   (**{|
    A message that provides a reason for a [Failed] or [Defaulted]
    synchronization status.
    
    The following messages are possible:
    
    {ol 
          {- [SYNC_ON_HOLD] - The synchronization has not yet happened. This
             status message occurs immediately after you create your first
             Lightsail bucket. This status message should change after the
             first synchronization happens, approximately 1 hour after the
             first bucket is created.
             }
          
          {- [DEFAULTED_FOR_SLR_MISSING] - The synchronization failed because
             the required service-linked role is missing from your Amazon Web
             Services account. The account-level BPA configuration for your
             Lightsail buckets is defaulted to {i active} until the
             synchronization can occur. This means that all your buckets are
             private and not publicly accessible. For more information about
             how to create the required service-linked role to allow
             synchronization, see
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-using-service-linked-roles }Using
             Service-Linked Roles for Amazon Lightsail} in the {i Amazon
             Lightsail Developer Guide}.
             }
          
          {- [DEFAULTED_FOR_SLR_MISSING_ON_HOLD] - The synchronization failed
             because the required service-linked role is missing from your
             Amazon Web Services account. Account-level BPA is not yet
             configured for your Lightsail buckets. Therefore, only the
             bucket access permissions and individual object access
             permissions apply to your Lightsail buckets. For more
             information about how to create the required service-linked role
             to allow synchronization, see
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-using-service-linked-roles }Using
             Service-Linked Roles for Amazon Lightsail} in the {i Amazon
             Lightsail Developer Guide}.
             }
          
          {- [Unknown] - The reason that synchronization failed is unknown.
             Contact Amazon Web Services Support for more information.
             }
          
    }
    |}*)

  last_synced_at: float option;
   (**{|
    The timestamp of when the account-level BPA configuration was last
    synchronized. This value is null when the account-level BPA configuration
    has not been synchronized.|}*)

  status: account_level_bpa_sync_status option;
   (**{|
    The status of the account-level BPA synchronization.
    
    The following statuses are possible:
    
    {ol 
          {- [InSync] - Account-level BPA is synchronized. The Amazon S3
             account-level BPA configuration applies to your Lightsail
             buckets.
             }
          
          {- [NeverSynced] - Synchronization has not yet happened. The Amazon
             S3 account-level BPA configuration does not apply to your
             Lightsail buckets.
             }
          
          {- [Failed] - Synchronization failed. The Amazon S3 account-level
             BPA configuration does not apply to your Lightsail buckets.
             }
          
          {- [Defaulted] - Synchronization failed and account-level BPA for
             your Lightsail buckets is defaulted to {i active}.
             }
          
    }
    
    You might need to complete further actions if the status is [Failed] or
    [Defaulted]. The [message] parameter provides more information for those
    statuses.
    |}*)

}

type get_buckets_result = {
  account_level_bpa_sync: account_level_bpa_sync option;
   (**{|
    An object that describes the synchronization status of the Amazon S3
    account-level block public access feature for your Lightsail buckets.
    
    For more information about this feature and how it affects Lightsail
    buckets, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-block-public-access-for-buckets }Block
    public access for buckets in Amazon Lightsail}.|}*)

  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetBuckets] request and
    specify the next page token using the [pageToken] parameter.|}*)

  buckets: bucket list option;
   (**{|
    An array of objects that describe buckets.|}*)

}

type get_buckets_request = {
  include_connected_resources: bool option;
   (**{|
    A Boolean value that indicates whether to include Lightsail instances
    that were given access to the bucket using the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_SetResourceAccessForBucket.html }SetResourceAccessForBucket}
    action.|}*)

  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetBuckets] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

  bucket_name: string option;
   (**{|
    The name of the bucket for which to return information.
    
    When omitted, the response includes all of your buckets in the Amazon Web
    Services Region where the request is made.|}*)

}

type bucket_metric_name = | NumberOfObjects
  | BucketSizeBytes

type get_bucket_metric_data_result = {
  metric_data: metric_datapoint list option;
   (**{|
    An array of objects that describe the metric data returned.|}*)

  metric_name: bucket_metric_name option;
   (**{|
    The name of the metric returned.|}*)

}

type get_bucket_metric_data_request = {
  unit_: metric_unit;
   (**{|
    The unit for the metric data request.
    
    Valid units depend on the metric data being requested. For the valid
    units with each available metric, see the [metricName] parameter.|}*)

  statistics: metric_statistic list;
   (**{|
    The statistic for the metric.
    
    The following statistics are available:
    
    {ol 
          {- [Minimum] - The lowest value observed during the specified
             period. Use this value to determine low volumes of activity for
             your application.
             }
          
          {- [Maximum] - The highest value observed during the specified
             period. Use this value to determine high volumes of activity for
             your application.
             }
          
          {- [Sum] - The sum of all values submitted for the matching metric.
             You can use this statistic to determine the total volume of a
             metric.
             }
          
          {- [Average] - The value of [Sum] / [SampleCount] during the
             specified period. By comparing this statistic with the [Minimum]
             and [Maximum] values, you can determine the full scope of a
             metric and how close the average use is to the [Minimum] and
             [Maximum] values. This comparison helps you to know when to
             increase or decrease your resources.
             }
          
          {- [SampleCount] - The count, or number, of data points used for
             the statistical calculation.
             }
          
    }
    |}*)

  period: int;
   (**{|
    The granularity, in seconds, of the returned data points.
    
    Bucket storage metrics are reported once per day. Therefore, you should
    specify a period of 86400 seconds, which is the number of seconds in a
    day.
    |}*)

  end_time: float;
   (**{|
    The timestamp indicating the latest data to be returned.|}*)

  start_time: float;
   (**{|
    The timestamp indicating the earliest data to be returned.|}*)

  metric_name: bucket_metric_name;
   (**{|
    The metric for which you want to return information.
    
    Valid bucket metric names are listed below, along with the most useful
    statistics to include in your request, and the published unit value.
    
    These bucket metrics are reported once per day.
    
    {ol 
          {- {b [BucketSizeBytes]} - The amount of data in bytes stored in a
             bucket. This value is calculated by summing the size of all
             objects in the bucket (including object versions), including the
             size of all parts for all incomplete multipart uploads to the
             bucket.
             
          Statistics: The most useful statistic is [Maximum].
          
          Unit: The published unit is [Bytes].
          }
          
          {- {b [NumberOfObjects]} - The total number of objects stored in a
             bucket. This value is calculated by counting all objects in the
             bucket (including object versions) and the total number of parts
             for all incomplete multipart uploads to the bucket.
             
          Statistics: The most useful statistic is [Average].
          
          Unit: The published unit is [Count].
          }
          
    }
    |}*)

  bucket_name: string;
   (**{|
    The name of the bucket for which to get metric data.|}*)

}

(**{|
    Describes the specifications of a bundle that can be applied to an Amazon
    Lightsail bucket.
    
    A bucket bundle specifies the monthly cost, storage space, and data
    transfer quota for a bucket.|}*)
type bucket_bundle = {
  is_active: bool option;
   (**{|
    Indicates whether the bundle is active. Use for a new or existing bucket.|}*)

  transfer_per_month_in_gb: int option;
   (**{|
    The monthly network transfer quota of the bundle.|}*)

  storage_per_month_in_gb: int option;
   (**{|
    The storage size of the bundle, in GB.|}*)

  price: float option;
   (**{|
    The monthly price of the bundle, in US dollars.|}*)

  name: string option;
   (**{|
    The name of the bundle.|}*)

  bundle_id: string option;
   (**{|
    The ID of the bundle.|}*)

}

type get_bucket_bundles_result = {
  bundles: bucket_bundle list option;
   (**{|
    An object that describes bucket bundles.|}*)

}

type get_bucket_bundles_request = {
  include_inactive: bool option;
   (**{|
    A Boolean value that indicates whether to include inactive (unavailable)
    bundles in the response of your request.|}*)

}

(**{|
    Describes the last time an access key was used.
    
    This object does not include data in the response of a
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html }CreateBucketAccessKey}
    action.
    |}*)
type access_key_last_used = {
  service_name: string option;
   (**{|
    The name of the Amazon Web Services service with which this access key
    was most recently used.
    
    This value is [N/A] if the access key has not been used.|}*)

  region: string option;
   (**{|
    The Amazon Web Services Region where this access key was most recently
    used.
    
    This value is [N/A] if the access key has not been used.|}*)

  last_used_date: float option;
   (**{|
    The date and time when the access key was most recently used.
    
    This value is null if the access key has not been used.|}*)

}

(**{|
    Describes an access key for an Amazon Lightsail bucket.
    
    Access keys grant full programmatic access to the specified bucket and
    its objects. You can have a maximum of two access keys per bucket. Use
    the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html }CreateBucketAccessKey}
    action to create an access key for a specific bucket. For more
    information about access keys, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys }Creating
    access keys for a bucket in Amazon Lightsail} in the {i Amazon Lightsail
    Developer Guide}.
    
    The [secretAccessKey] value is returned only in response to the
    [CreateBucketAccessKey] action. You can get a secret access key only when
    you first create an access key; you cannot get the secret access key
    later. If you lose the secret access key, you must create a new access
    key.
    |}*)
type access_key = {
  last_used: access_key_last_used option;
   (**{|
    An object that describes the last time the access key was used.
    
    This object does not include data in the response of a
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html }CreateBucketAccessKey}
    action. If the access key has not been used, the [region] and
    [serviceName] values are [N/A], and the [lastUsedDate] value is null.
    |}*)

  created_at: float option;
   (**{|
    The timestamp when the access key was created.|}*)

  status: status_type option;
   (**{|
    The status of the access key.
    
    A status of [Active] means that the key is valid, while [Inactive] means
    it is not.|}*)

  secret_access_key: string option;
   (**{|
    The secret access key used to sign requests.
    
    You should store the secret access key in a safe location. We recommend
    that you delete the access key if the secret access key is compromised.|}*)

  access_key_id: string option;
   (**{|
    The ID of the access key.|}*)

}

type get_bucket_access_keys_result = {
  access_keys: access_key list option;
   (**{|
    An object that describes the access keys for the specified bucket.|}*)

}

type get_bucket_access_keys_request = {
  bucket_name: string;
   (**{|
    The name of the bucket for which to return access keys.|}*)

}

type blueprint_type = | App
  | Os

(**{|
    Describes a blueprint (a virtual private server image).|}*)
type blueprint = {
  app_category: app_category option;
   (**{|
    Virtual computer blueprints that are supported by Lightsail for Research.
    
    This parameter only applies to Lightsail for Research resources.
    |}*)

  platform: instance_platform option;
   (**{|
    The operating system platform (either Linux/Unix-based or Windows
    Server-based) of the blueprint.|}*)

  license_url: string option;
   (**{|
    The end-user license agreement URL for the image or blueprint.|}*)

  product_url: string option;
   (**{|
    The product URL to learn more about the image or blueprint.|}*)

  version_code: string option;
   (**{|
    The version code.|}*)

  version: string option;
   (**{|
    The version number of the operating system, application, or stack (
    [2016.03.0]).|}*)

  min_power: int option;
   (**{|
    The minimum bundle power required to run this blueprint. For example, you
    need a bundle with a power value of 500 or more to create an instance
    that uses a blueprint with a minimum power value of 500. [0] indicates
    that the blueprint runs on all instance sizes.|}*)

  is_active: bool option;
   (**{|
    A Boolean value indicating whether the blueprint is active. Inactive
    blueprints are listed to support customers with existing instances but
    are not necessarily available for launch of new instances. Blueprints are
    marked inactive when they become outdated due to operating system updates
    or new application releases.|}*)

  description: string option;
   (**{|
    The description of the blueprint.|}*)

  type_: blueprint_type option;
   (**{|
    The type of the blueprint ([os] or [app]).|}*)

  group: string option;
   (**{|
    The group name of the blueprint ([amazon-linux]).|}*)

  name: string option;
   (**{|
    The friendly name of the blueprint ([Amazon Linux]).|}*)

  blueprint_id: string option;
   (**{|
    The ID for the virtual private server image ([app_wordpress_x_x] or
    [app_lamp_x_x]).|}*)

}

type get_blueprints_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetBlueprints] request
    and specify the next page token using the [pageToken] parameter.|}*)

  blueprints: blueprint list option;
   (**{|
    An array of key-value pairs that contains information about the available
    blueprints.|}*)

}

type get_blueprints_request = {
  app_category: app_category option;
   (**{|
    Returns a list of blueprints that are specific to Lightsail for Research.
    
    You must use this parameter to view Lightsail for Research blueprints.
    |}*)

  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetBlueprints] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

  include_inactive: bool option;
   (**{|
    A Boolean value that indicates whether to include inactive (unavailable)
    blueprints in the response of your request.|}*)

}

type auto_snapshot_status = | NOT_FOUND
  | IN_PROGRESS
  | FAILED
  | SUCCESS

(**{|
    Describes a block storage disk that is attached to an instance, and is
    included in an automatic snapshot.|}*)
type attached_disk = {
  size_in_gb: int option;
   (**{|
    The size of the disk in GB.|}*)

  path: string option;
   (**{|
    The path of the disk ([/dev/xvdf]).|}*)

}

(**{|
    Describes an automatic snapshot.|}*)
type auto_snapshot_details = {
  from_attached_disks: attached_disk list option;
   (**{|
    An array of objects that describe the block storage disks attached to the
    instance when the automatic snapshot was created.|}*)

  status: auto_snapshot_status option;
   (**{|
    The status of the automatic snapshot.|}*)

  created_at: float option;
   (**{|
    The timestamp when the automatic snapshot was created.|}*)

  date: string option;
   (**{|
    The date of the automatic snapshot in [YYYY-MM-DD] format.|}*)

}

type get_auto_snapshots_result = {
  auto_snapshots: auto_snapshot_details list option;
   (**{|
    An array of objects that describe the automatic snapshots that are
    available for the specified source instance or disk.|}*)

  resource_type: resource_type option;
   (**{|
    The resource type of the automatic snapshot. The possible values are
    [Instance], and [Disk].|}*)

  resource_name: string option;
   (**{|
    The name of the source instance or disk for the automatic snapshots.|}*)

}

type get_auto_snapshots_request = {
  resource_name: string;
   (**{|
    The name of the source instance or disk from which to get automatic
    snapshot information.|}*)

}

(**{|
    Describes an alarm.
    
    An alarm is a way to monitor your Lightsail resource metrics. For more
    information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms }Alarms
    in Amazon Lightsail}.|}*)
type alarm = {
  notification_enabled: bool option;
   (**{|
    Indicates whether the alarm is enabled.|}*)

  notification_triggers: alarm_state list option;
   (**{|
    The alarm states that trigger a notification.|}*)

  contact_protocols: contact_protocol list option;
   (**{|
    The contact protocols for the alarm, such as [Email], [SMS] (text
    messaging), or both.|}*)

  unit_: metric_unit option;
   (**{|
    The unit of the metric associated with the alarm.|}*)

  state: alarm_state option;
   (**{|
    The current state of the alarm.
    
    An alarm has the following possible states:
    
    {ol 
          {- [ALARM] - The metric is outside of the defined threshold.
             }
          
          {- [INSUFFICIENT_DATA] - The alarm has just started, the metric is
             not available, or not enough data is available for the metric to
             determine the alarm state.
             }
          
          {- [OK] - The metric is within the defined threshold.
             }
          
    }
    |}*)

  metric_name: metric_name option;
   (**{|
    The name of the metric associated with the alarm.|}*)

  statistic: metric_statistic option;
   (**{|
    The statistic for the metric associated with the alarm.
    
    The following statistics are available:
    
    {ol 
          {- [Minimum] - The lowest value observed during the specified
             period. Use this value to determine low volumes of activity for
             your application.
             }
          
          {- [Maximum] - The highest value observed during the specified
             period. Use this value to determine high volumes of activity for
             your application.
             }
          
          {- [Sum] - All values submitted for the matching metric added
             together. You can use this statistic to determine the total
             volume of a metric.
             }
          
          {- [Average] - The value of Sum / SampleCount during the specified
             period. By comparing this statistic with the Minimum and Maximum
             values, you can determine the full scope of a metric and how
             close the average use is to the Minimum and Maximum values. This
             comparison helps you to know when to increase or decrease your
             resources.
             }
          
          {- [SampleCount] - The count, or number, of data points used for
             the statistical calculation.
             }
          
    }
    |}*)

  treat_missing_data: treat_missing_data option;
   (**{|
    Specifies how the alarm handles missing data points.
    
    An alarm can treat missing data in the following ways:
    
    {ol 
          {- [breaching] - Assume the missing data is not within the
             threshold. Missing data counts towards the number of times the
             metric is not within the threshold.
             }
          
          {- [notBreaching] - Assume the missing data is within the
             threshold. Missing data does not count towards the number of
             times the metric is not within the threshold.
             }
          
          {- [ignore] - Ignore the missing data. Maintains the current alarm
             state.
             }
          
          {- [missing] - Missing data is treated as missing.
             }
          
    }
    |}*)

  datapoints_to_alarm: int option;
   (**{|
    The number of data points that must not within the specified threshold to
    trigger the alarm.|}*)

  threshold: float option;
   (**{|
    The value against which the specified statistic is compared.|}*)

  period: int option;
   (**{|
    The period, in seconds, over which the statistic is applied.|}*)

  evaluation_periods: int option;
   (**{|
    The number of periods over which data is compared to the specified
    threshold.|}*)

  comparison_operator: comparison_operator option;
   (**{|
    The arithmetic operation used when comparing the specified statistic and
    threshold.|}*)

  monitored_resource_info: monitored_resource_info option;
   (**{|
    An object that lists information about the resource monitored by the
    alarm.|}*)

  support_code: string option;
   (**{|
    The support code. Include this code in your email to support when you
    have questions about your Lightsail alarm. This code enables our support
    team to look up your Lightsail information more easily.|}*)

  resource_type: resource_type option;
   (**{|
    The Lightsail resource type of the alarm.|}*)

  location: resource_location option;
   (**{|
    An object that lists information about the location of the alarm.|}*)

  created_at: float option;
   (**{|
    The timestamp when the alarm was created.|}*)

  arn: string option;
   (**{|
    The Amazon Resource Name (ARN) of the alarm.|}*)

  name: string option;
   (**{|
    The name of the alarm.|}*)

}

type get_alarms_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetAlarms] request and
    specify the next page token using the [pageToken] parameter.|}*)

  alarms: alarm list option;
   (**{|
    An array of objects that describe the alarms.|}*)

}

type get_alarms_request = {
  monitored_resource_name: string option;
   (**{|
    The name of the Lightsail resource being monitored by the alarm.
    
    Specify a monitored resource name to return information about all alarms
    for a specific resource.|}*)

  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetAlarms] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

  alarm_name: string option;
   (**{|
    The name of the alarm.
    
    Specify an alarm name to return information about a specific alarm.|}*)

}

type get_active_names_result = {
  next_page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    A next page token is not returned if there are no more results to
    display.
    
    To get the next page of results, perform another [GetActiveNames] request
    and specify the next page token using the [pageToken] parameter.|}*)

  active_names: string list option;
   (**{|
    The list of active names returned by the get active names request.|}*)

}

type get_active_names_request = {
  page_token: string option;
   (**{|
    The token to advance to the next page of results from your request.
    
    To get a page token, perform an initial [GetActiveNames] request. If your
    results are paginated, the response will return a next page token that
    you can specify as the page token in a subsequent request.|}*)

}

type export_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type export_snapshot_request = {
  source_snapshot_name: string;
   (**{|
    The name of the instance or disk snapshot to be exported to Amazon EC2.|}*)

}

type enable_add_on_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type add_on_type = | StopInstanceOnIdle
  | AutoSnapshot

(**{|
    Describes a request to enable or modify the automatic snapshot add-on for
    an Amazon Lightsail instance or disk.
    
    When you modify the automatic snapshot time for a resource, it is
    typically effective immediately except under the following conditions:
    
    {ol 
          {- If an automatic snapshot has been created for the current day,
             and you change the snapshot time to a later time of day, then
             the new snapshot time will be effective the following day. This
             ensures that two snapshots are not created for the current day.
             }
          
          {- If an automatic snapshot has not yet been created for the
             current day, and you change the snapshot time to an earlier time
             of day, then the new snapshot time will be effective the
             following day and a snapshot is automatically created at the
             previously set time for the current day. This ensures that a
             snapshot is created for the current day.
             }
          
          {- If an automatic snapshot has not yet been created for the
             current day, and you change the snapshot time to a time that is
             within 30 minutes from your current time, then the new snapshot
             time will be effective the following day and a snapshot is
             automatically created at the previously set time for the current
             day. This ensures that a snapshot is created for the current
             day, because 30 minutes is required between your current time
             and the new snapshot time that you specify.
             }
          
          {- If an automatic snapshot is scheduled to be created within 30
             minutes from your current time and you change the snapshot time,
             then the new snapshot time will be effective the following day
             and a snapshot is automatically created at the previously set
             time for the current day. This ensures that a snapshot is
             created for the current day, because 30 minutes is required
             between your current time and the new snapshot time that you
             specify.
             }
          
    }
    |}*)
type auto_snapshot_add_on_request = {
  snapshot_time_of_day: string option;
   (**{|
    The daily time when an automatic snapshot will be created.
    
    Constraints:
    
    {ol 
          {- Must be in [HH:00] format, and in an hourly increment.
             }
          
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- The snapshot will be automatically created between the time
             specified and up to 45 minutes after.
             }
          
    }
    |}*)

}

(**{|
    Describes a request to enable, modify, or disable an add-on for an Amazon
    Lightsail resource.
    
    An additional cost may be associated with enabling add-ons. For more
    information, see the
    {{: https://aws.amazon.com/lightsail/pricing/ }Lightsail pricing page}.
    |}*)
type add_on_request = {
  stop_instance_on_idle_request: stop_instance_on_idle_request option;
   (**{|
    An object that represents additional parameters when enabling or
    modifying the [StopInstanceOnIdle] add-on.
    
    This object only applies to Lightsail for Research resources.
    |}*)

  auto_snapshot_add_on_request: auto_snapshot_add_on_request option;
   (**{|
    An object that represents additional parameters when enabling or
    modifying the automatic snapshot add-on.|}*)

  add_on_type: add_on_type;
   (**{|
    The add-on type.|}*)

}

type enable_add_on_request = {
  add_on_request: add_on_request;
   (**{|
    An array of strings representing the add-on to enable or modify.|}*)

  resource_name: string;
   (**{|
    The name of the source resource for which to enable or modify the add-on.|}*)

}

type download_default_key_pair_result = {
  created_at: float option;
   (**{|
    The timestamp when the default key pair was created.|}*)

  private_key_base64: string option;
   (**{|
    A base64-encoded RSA private key.|}*)

  public_key_base64: string option;
   (**{|
    A base64-encoded public key of the [ssh-rsa] type.|}*)

}

type download_default_key_pair_request = unit

type disable_add_on_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type disable_add_on_request = {
  resource_name: string;
   (**{|
    The name of the source resource for which to disable the add-on.|}*)

  add_on_type: add_on_type;
   (**{|
    The add-on type to disable.|}*)

}

type detach_static_ip_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type detach_static_ip_request = {
  static_ip_name: string;
   (**{|
    The name of the static IP to detach from the instance.|}*)

}

type detach_instances_from_load_balancer_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type detach_instances_from_load_balancer_request = {
  instance_names: string list;
   (**{|
    An array of strings containing the names of the instances you want to
    detach from the load balancer.|}*)

  load_balancer_name: string;
   (**{|
    The name of the Lightsail load balancer.|}*)

}

type detach_disk_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type detach_disk_request = {
  disk_name: string;
   (**{|
    The unique name of the disk you want to detach from your instance
    ([my-disk]).|}*)

}

type detach_certificate_from_distribution_result = {
  operation: operation option;
   (**{|
    An object that describes the result of the action, such as the status of
    the request, the timestamp of the request, and the resources affected by
    the request.|}*)

}

type detach_certificate_from_distribution_request = {
  distribution_name: string;
   (**{|
    The name of the distribution from which to detach the certificate.
    
    Use the [GetDistributions] action to get a list of distribution names
    that you can specify.|}*)

}

type delete_relational_database_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_relational_database_snapshot_request = {
  relational_database_snapshot_name: string;
   (**{|
    The name of the database snapshot that you are deleting.|}*)

}

type delete_relational_database_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_relational_database_request = {
  final_relational_database_snapshot_name: string option;
   (**{|
    The name of the database snapshot created if [skip final snapshot] is
    [false], which is the default value for that parameter.
    
    Specifying this parameter and also specifying the [skip final snapshot]
    parameter to [true] results in an error.
    
    Constraints:
    
    {ol 
          {- Must contain from 2 to 255 alphanumeric characters, or hyphens.
             }
          
          {- The first and last character must be a letter or number.
             }
          
    }
    |}*)

  skip_final_snapshot: bool option;
   (**{|
    Determines whether a final database snapshot is created before your
    database is deleted. If [true] is specified, no database snapshot is
    created. If [false] is specified, a database snapshot is created before
    your database is deleted.
    
    You must specify the [final relational database snapshot name] parameter
    if the [skip final snapshot] parameter is [false].
    
    Default: [false]|}*)

  relational_database_name: string;
   (**{|
    The name of the database that you are deleting.|}*)

}

type delete_load_balancer_tls_certificate_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_load_balancer_tls_certificate_request = {
  force: bool option;
   (**{|
    When [true], forces the deletion of an SSL/TLS certificate.
    
    There can be two certificates associated with a Lightsail load balancer:
    the primary and the backup. The [force] parameter is required when the
    primary SSL/TLS certificate is in use by an instance attached to the load
    balancer.|}*)

  certificate_name: string;
   (**{|
    The SSL/TLS certificate name.|}*)

  load_balancer_name: string;
   (**{|
    The load balancer name.|}*)

}

type delete_load_balancer_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_load_balancer_request = {
  load_balancer_name: string;
   (**{|
    The name of the load balancer you want to delete.|}*)

}

type delete_known_host_keys_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_known_host_keys_request = {
  instance_name: string;
   (**{|
    The name of the instance for which you want to reset the host key or
    certificate.|}*)

}

type delete_key_pair_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_key_pair_request = {
  expected_fingerprint: string option;
   (**{|
    The RSA fingerprint of the Lightsail default key pair to delete.
    
    The [expectedFingerprint] parameter is required only when specifying to
    delete a Lightsail default key pair.
    |}*)

  key_pair_name: string;
   (**{|
    The name of the key pair to delete.|}*)

}

type delete_instance_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_instance_snapshot_request = {
  instance_snapshot_name: string;
   (**{|
    The name of the snapshot to delete.|}*)

}

type delete_instance_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_instance_request = {
  force_delete_add_ons: bool option;
   (**{|
    A Boolean value to indicate whether to delete all add-ons for the
    instance.|}*)

  instance_name: string;
   (**{|
    The name of the instance to delete.|}*)

}

type delete_domain_entry_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_domain_entry_request = {
  domain_entry: domain_entry;
   (**{|
    An array of key-value pairs containing information about your domain
    entries.|}*)

  domain_name: string;
   (**{|
    The name of the domain entry to delete.|}*)

}

type delete_domain_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_domain_request = {
  domain_name: string;
   (**{|
    The specific domain name to delete.|}*)

}

type delete_distribution_result = {
  operation: operation option;
   (**{|
    An object that describes the result of the action, such as the status of
    the request, the timestamp of the request, and the resources affected by
    the request.|}*)

}

type delete_distribution_request = {
  distribution_name: string option;
   (**{|
    The name of the distribution to delete.
    
    Use the [GetDistributions] action to get a list of distribution names
    that you can specify.|}*)

}

type delete_disk_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_disk_snapshot_request = {
  disk_snapshot_name: string;
   (**{|
    The name of the disk snapshot you want to delete ([my-disk-snapshot]).|}*)

}

type delete_disk_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_disk_request = {
  force_delete_add_ons: bool option;
   (**{|
    A Boolean value to indicate whether to delete all add-ons for the disk.|}*)

  disk_name: string;
   (**{|
    The unique name of the disk you want to delete ([my-disk]).|}*)

}

type delete_container_service_result = unit

type delete_container_service_request = {
  service_name: string;
   (**{|
    The name of the container service to delete.|}*)

}

type delete_container_image_result = unit

type delete_container_image_request = {
  image: string;
   (**{|
    The name of the container image to delete from the container service.
    
    Use the [GetContainerImages] action to get the name of the container
    images that are registered to a container service.
    
    Container images sourced from your Lightsail container service, that are
    registered and stored on your service, start with a colon ([:]). For
    example, [:container-service-1.mystaticwebsite.1]. Container images
    sourced from a public registry like Docker Hub don't start with a colon.
    For example, [nginx:latest] or [nginx].
    |}*)

  service_name: string;
   (**{|
    The name of the container service for which to delete a registered
    container image.|}*)

}

type delete_contact_method_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_contact_method_request = {
  protocol: contact_protocol;
   (**{|
    The protocol that will be deleted, such as [Email] or [SMS] (text
    messaging).
    
    To delete an [Email] and an [SMS] contact method if you added both, you
    must run separate [DeleteContactMethod] actions to delete each protocol.
    |}*)

}

type delete_certificate_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_certificate_request = {
  certificate_name: string;
   (**{|
    The name of the certificate to delete.
    
    Use the [GetCertificates] action to get a list of certificate names that
    you can specify.|}*)

}

type delete_bucket_access_key_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_bucket_access_key_request = {
  access_key_id: string;
   (**{|
    The ID of the access key to delete.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketAccessKeys.html }GetBucketAccessKeys}
    action to get a list of access key IDs that you can specify.|}*)

  bucket_name: string;
   (**{|
    The name of the bucket that the access key belongs to.|}*)

}

type delete_bucket_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_bucket_request = {
  force_delete: bool option;
   (**{|
    A Boolean value that indicates whether to force delete the bucket.
    
    You must force delete the bucket if it has one of the following
    conditions:
    
    {ol 
          {- The bucket is the origin of a distribution.
             }
          
          {- The bucket has instances that were granted access to it using
             the
             {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_SetResourceAccessForBucket.html }SetResourceAccessForBucket}
             action.
             }
          
          {- The bucket has objects.
             }
          
          {- The bucket has access keys.
             }
          
    }
    
    Force deleting a bucket might impact other resources that rely on the
    bucket, such as instances, distributions, or software that use the issued
    access keys.
    |}*)

  bucket_name: string;
   (**{|
    The name of the bucket to delete.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBuckets.html }GetBuckets}
    action to get a list of bucket names that you can specify.|}*)

}

type delete_auto_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_auto_snapshot_request = {
  date: string;
   (**{|
    The date of the automatic snapshot to delete in [YYYY-MM-DD] format. Use
    the [get auto snapshots] operation to get the available automatic
    snapshots for a resource.|}*)

  resource_name: string;
   (**{|
    The name of the source instance or disk from which to delete the
    automatic snapshot.|}*)

}

type delete_alarm_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type delete_alarm_request = {
  alarm_name: string;
   (**{|
    The name of the alarm to delete.|}*)

}

type create_relational_database_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_relational_database_snapshot_request = {
  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  relational_database_snapshot_name: string;
   (**{|
    The name for your new database snapshot.
    
    Constraints:
    
    {ol 
          {- Must contain from 2 to 255 alphanumeric characters, or hyphens.
             }
          
          {- The first and last character must be a letter or number.
             }
          
    }
    |}*)

  relational_database_name: string;
   (**{|
    The name of the database on which to base your new snapshot.|}*)

}

type create_relational_database_from_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_relational_database_from_snapshot_request = {
  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  use_latest_restorable_time: bool option;
   (**{|
    Specifies whether your database is restored from the latest backup time.
    A value of [true] restores from the latest backup time.
    
    Default: [false]
    
    Constraints: Cannot be specified if the [restore time] parameter is
    provided.|}*)

  restore_time: float option;
   (**{|
    The date and time to restore your database from.
    
    Constraints:
    
    {ol 
          {- Must be before the latest restorable time for the database.
             }
          
          {- Cannot be specified if the [use latest restorable time]
             parameter is [true].
             }
          
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Specified in the Unix time format.
             
          For example, if you wish to use a restore time of October 1, 2018,
          at 8 PM UTC, then you input [1538424000] as the restore time.
          }
          
    }
    |}*)

  source_relational_database_name: string option;
   (**{|
    The name of the source database.|}*)

  relational_database_bundle_id: string option;
   (**{|
    The bundle ID for your new database. A bundle describes the performance
    specifications for your database.
    
    You can get a list of database bundle IDs by using the [get relational
    database bundles] operation.
    
    When creating a new database from a snapshot, you cannot choose a bundle
    that is smaller than the bundle of the source database.|}*)

  relational_database_snapshot_name: string option;
   (**{|
    The name of the database snapshot from which to create your new database.|}*)

  publicly_accessible: bool option;
   (**{|
    Specifies the accessibility options for your new database. A value of
    [true] specifies a database that is available to resources outside of
    your Lightsail account. A value of [false] specifies a database that is
    available only to your Lightsail resources in the same region as your
    database.|}*)

  availability_zone: string option;
   (**{|
    The Availability Zone in which to create your new database. Use the
    [us-east-2a] case-sensitive format.
    
    You can get a list of Availability Zones by using the [get regions]
    operation. Be sure to add the [include relational database Availability
    Zones] parameter to your request.|}*)

  relational_database_name: string;
   (**{|
    The name to use for your new Lightsail database resource.
    
    Constraints:
    
    {ol 
          {- Must contain from 2 to 255 alphanumeric characters, or hyphens.
             }
          
          {- The first and last character must be a letter or number.
             }
          
    }
    |}*)

}

type create_relational_database_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_relational_database_request = {
  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  publicly_accessible: bool option;
   (**{|
    Specifies the accessibility options for your new database. A value of
    [true] specifies a database that is available to resources outside of
    your Lightsail account. A value of [false] specifies a database that is
    available only to your Lightsail resources in the same region as your
    database.|}*)

  preferred_maintenance_window: string option;
   (**{|
    The weekly time range during which system maintenance can occur on your
    new database.
    
    The default is a 30-minute window selected at random from an 8-hour block
    of time for each AWS Region, occurring on a random day of the week.
    
    Constraints:
    
    {ol 
          {- Must be in the [ddd:hh24:mi-ddd:hh24:mi] format.
             }
          
          {- Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.
             }
          
          {- Must be at least 30 minutes.
             }
          
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Example: [Tue:17:00-Tue:17:30]
             }
          
    }
    |}*)

  preferred_backup_window: string option;
   (**{|
    The daily time range during which automated backups are created for your
    new database if automated backups are enabled.
    
    The default is a 30-minute window selected at random from an 8-hour block
    of time for each AWS Region. For more information about the preferred
    backup window time blocks for each region, see the
    {{: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow }Working
    With Backups} guide in the Amazon Relational Database Service
    documentation.
    
    Constraints:
    
    {ol 
          {- Must be in the [hh24:mi-hh24:mi] format.
             
          Example: [16:00-16:30]
          }
          
          {- Specified in Coordinated Universal Time (UTC).
             }
          
          {- Must not conflict with the preferred maintenance window.
             }
          
          {- Must be at least 30 minutes.
             }
          
    }
    |}*)

  master_user_password: string option;
   (**{|
    The password for the master user. The password can include any printable
    ASCII character except "/", """, or "@". It cannot contain spaces.
    
    {b MySQL}
    
    Constraints: Must contain from 8 to 41 characters.
    
    {b PostgreSQL}
    
    Constraints: Must contain from 8 to 128 characters.|}*)

  master_username: string;
   (**{|
    The name for the master user.
    
    {b MySQL}
    
    Constraints:
    
    {ol 
          {- Required for MySQL.
             }
          
          {- Must be 1 to 16 letters or numbers. Can contain underscores.
             }
          
          {- First character must be a letter.
             }
          
          {- Can't be a reserved word for the chosen database engine.
             
          For more information about reserved words in MySQL 5.6 or 5.7, see
          the Keywords and Reserved Words articles for
          {{: https://dev.mysql.com/doc/refman/5.6/en/keywords.html }MySQL
          5.6},
          {{: https://dev.mysql.com/doc/refman/5.7/en/keywords.html }MySQL
          5.7}, or
          {{: https://dev.mysql.com/doc/refman/8.0/en/keywords.html }MySQL
          8.0}.
          }
          
    }
    
    {b PostgreSQL}
    
    Constraints:
    
    {ol 
          {- Required for PostgreSQL.
             }
          
          {- Must be 1 to 63 letters or numbers. Can contain underscores.
             }
          
          {- First character must be a letter.
             }
          
          {- Can't be a reserved word for the chosen database engine.
             
          For more information about reserved words in MySQL 5.6 or 5.7, see
          the Keywords and Reserved Words articles for
          {{: https://www.postgresql.org/docs/9.6/sql-keywords-appendix.html }PostgreSQL
          9.6},
          {{: https://www.postgresql.org/docs/10/sql-keywords-appendix.html }PostgreSQL
          10},
          {{: https://www.postgresql.org/docs/11/sql-keywords-appendix.html }PostgreSQL
          11}, and
          {{: https://www.postgresql.org/docs/12/sql-keywords-appendix.html }PostgreSQL
          12}.
          }
          
    }
    |}*)

  master_database_name: string;
   (**{|
    The meaning of this parameter differs according to the database engine
    you use.
    
    {b MySQL}
    
    The name of the database to create when the Lightsail database resource
    is created. If this parameter isn't specified, no database is created in
    the database resource.
    
    Constraints:
    
    {ol 
          {- Must contain 1 to 64 letters or numbers.
             }
          
          {- Must begin with a letter. Subsequent characters can be letters,
             underscores, or digits (0- 9).
             }
          
          {- Can't be a word reserved by the specified database engine.
             
          For more information about reserved words in MySQL, see the
          Keywords and Reserved Words articles for
          {{: https://dev.mysql.com/doc/refman/5.6/en/keywords.html }MySQL
          5.6},
          {{: https://dev.mysql.com/doc/refman/5.7/en/keywords.html }MySQL
          5.7}, and
          {{: https://dev.mysql.com/doc/refman/8.0/en/keywords.html }MySQL
          8.0}.
          }
          
    }
    
    {b PostgreSQL}
    
    The name of the database to create when the Lightsail database resource
    is created. If this parameter isn't specified, a database named
    [postgres] is created in the database resource.
    
    Constraints:
    
    {ol 
          {- Must contain 1 to 63 letters or numbers.
             }
          
          {- Must begin with a letter. Subsequent characters can be letters,
             underscores, or digits (0- 9).
             }
          
          {- Can't be a word reserved by the specified database engine.
             
          For more information about reserved words in PostgreSQL, see the
          SQL Key Words articles for
          {{: https://www.postgresql.org/docs/9.6/sql-keywords-appendix.html }PostgreSQL
          9.6},
          {{: https://www.postgresql.org/docs/10/sql-keywords-appendix.html }PostgreSQL
          10},
          {{: https://www.postgresql.org/docs/11/sql-keywords-appendix.html }PostgreSQL
          11}, and
          {{: https://www.postgresql.org/docs/12/sql-keywords-appendix.html }PostgreSQL
          12}.
          }
          
    }
    |}*)

  relational_database_bundle_id: string;
   (**{|
    The bundle ID for your new database. A bundle describes the performance
    specifications for your database.
    
    You can get a list of database bundle IDs by using the [get relational
    database bundles] operation.|}*)

  relational_database_blueprint_id: string;
   (**{|
    The blueprint ID for your new database. A blueprint describes the major
    engine version of a database.
    
    You can get a list of database blueprints IDs by using the [get
    relational database blueprints] operation.|}*)

  availability_zone: string option;
   (**{|
    The Availability Zone in which to create your new database. Use the
    [us-east-2a] case-sensitive format.
    
    You can get a list of Availability Zones by using the [get regions]
    operation. Be sure to add the [include relational database Availability
    Zones] parameter to your request.|}*)

  relational_database_name: string;
   (**{|
    The name to use for your new Lightsail database resource.
    
    Constraints:
    
    {ol 
          {- Must contain from 2 to 255 alphanumeric characters, or hyphens.
             }
          
          {- The first and last character must be a letter or number.
             }
          
    }
    |}*)

}

type create_load_balancer_tls_certificate_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_load_balancer_tls_certificate_request = {
  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  certificate_alternative_names: string list option;
   (**{|
    An array of strings listing alternative domains and subdomains for your
    SSL/TLS certificate. Lightsail will de-dupe the names for you. You can
    have a maximum of 9 alternative names (in addition to the 1 primary
    domain). We do not support wildcards ([*.example.com]).|}*)

  certificate_domain_name: string;
   (**{|
    The domain name ([example.com]) for your SSL/TLS certificate.|}*)

  certificate_name: string;
   (**{|
    The SSL/TLS certificate name.
    
    You can have up to 10 certificates in your account at one time. Each
    Lightsail load balancer can have up to 2 certificates associated with it
    at one time. There is also an overall limit to the number of certificates
    that can be issue in a 365-day period. For more information, see
    {{: http://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html }Limits}.
    |}*)

  load_balancer_name: string;
   (**{|
    The load balancer name where you want to create the SSL/TLS certificate.|}*)

}

type create_load_balancer_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_load_balancer_request = {
  tls_policy_name: string option;
   (**{|
    The name of the TLS policy to apply to the load balancer.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetLoadBalancerTlsPolicies.html }GetLoadBalancerTlsPolicies}
    action to get a list of TLS policy names that you can specify.
    
    For more information about load balancer TLS policies, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configure-load-balancer-tls-security-policy }Configuring
    TLS security policies on your Amazon Lightsail load balancers} in the
    {i Amazon Lightsail Developer Guide}.|}*)

  ip_address_type: ip_address_type option;
   (**{|
    The IP address type for the load balancer.
    
    The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and
    [dualstack] for IPv4 and IPv6.
    
    The default value is [dualstack].|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  certificate_alternative_names: string list option;
   (**{|
    The optional alternative domains and subdomains to use with your SSL/TLS
    certificate ([www.example.com], [example.com], [m.example.com],
    [blog.example.com]).|}*)

  certificate_domain_name: string option;
   (**{|
    The domain name with which your certificate is associated ([example.com]).
    
    If you specify [certificateDomainName], then [certificateName] is
    required (and vice-versa).|}*)

  certificate_name: string option;
   (**{|
    The name of the SSL/TLS certificate.
    
    If you specify [certificateName], then [certificateDomainName] is
    required (and vice-versa).|}*)

  health_check_path: string option;
   (**{|
    The path you provided to perform the load balancer health check. If you
    didn't specify a health check path, Lightsail uses the root path of your
    website (["/"]).
    
    You may want to specify a custom health check path other than the root of
    your application if your home page loads slowly or has a lot of media or
    scripting on it.|}*)

  instance_port: int;
   (**{|
    The instance port where you're creating your load balancer.|}*)

  load_balancer_name: string;
   (**{|
    The name of your load balancer.|}*)

}

type create_key_pair_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

  private_key_base64: string option;
   (**{|
    A base64-encoded RSA private key.|}*)

  public_key_base64: string option;
   (**{|
    A base64-encoded public key of the [ssh-rsa] type.|}*)

  key_pair: key_pair option;
   (**{|
    An array of key-value pairs containing information about the new key pair
    you just created.|}*)

}

type create_key_pair_request = {
  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  key_pair_name: string;
   (**{|
    The name for your new key pair.|}*)

}

type create_instance_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_instance_snapshot_request = {
  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  instance_name: string;
   (**{|
    The Lightsail instance on which to base your snapshot.|}*)

  instance_snapshot_name: string;
   (**{|
    The name for your new snapshot.|}*)

}

type create_instances_from_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

(**{|
    Describes a block storage disk mapping.|}*)
type disk_map = {
  new_disk_name: string option;
   (**{|
    The new disk name ([my-new-disk]).|}*)

  original_disk_path: string option;
   (**{|
    The original disk path exposed to the instance (for example, [/dev/sdh]).|}*)

}

type create_instances_from_snapshot_request = {
  use_latest_restorable_auto_snapshot: bool option;
   (**{|
    A Boolean value to indicate whether to use the latest available automatic
    snapshot.
    
    Constraints:
    
    {ol 
          {- This parameter cannot be defined together with the [restore
             date] parameter. The [use latest restorable auto snapshot] and
             [restore date] parameters are mutually exclusive.
             }
          
          {- Define this parameter only when creating a new instance from an
             automatic snapshot. For more information, see the
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots }Amazon
             Lightsail Developer Guide}.
             }
          
    }
    |}*)

  restore_date: string option;
   (**{|
    The date of the automatic snapshot to use for the new instance. Use the
    [get auto snapshots] operation to identify the dates of the available
    automatic snapshots.
    
    Constraints:
    
    {ol 
          {- Must be specified in [YYYY-MM-DD] format.
             }
          
          {- This parameter cannot be defined together with the [use latest
             restorable auto snapshot] parameter. The [restore date] and [use
             latest restorable auto snapshot] parameters are mutually
             exclusive.
             }
          
          {- Define this parameter only when creating a new instance from an
             automatic snapshot. For more information, see the
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots }Amazon
             Lightsail Developer Guide}.
             }
          
    }
    |}*)

  source_instance_name: string option;
   (**{|
    The name of the source instance from which the source automatic snapshot
    was created.
    
    Constraints:
    
    {ol 
          {- This parameter cannot be defined together with the [instance
             snapshot name] parameter. The [source instance name] and
             [instance snapshot name] parameters are mutually exclusive.
             }
          
          {- Define this parameter only when creating a new instance from an
             automatic snapshot. For more information, see the
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots }Amazon
             Lightsail Developer Guide}.
             }
          
    }
    |}*)

  ip_address_type: ip_address_type option;
   (**{|
    The IP address type for the instance.
    
    The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and
    [dualstack] for IPv4 and IPv6.
    
    The default value is [dualstack].|}*)

  add_ons: add_on_request list option;
   (**{|
    An array of objects representing the add-ons to enable for the new
    instance.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  key_pair_name: string option;
   (**{|
    The name for your key pair.|}*)

  user_data: string option;
   (**{|
    You can create a launch script that configures a server with additional
    user data. For example, [apt-get -y update].
    
    Depending on the machine image you choose, the command to get software on
    your instance varies. Amazon Linux and CentOS use [yum], Debian and
    Ubuntu use [apt-get], and FreeBSD uses [pkg]. For a complete list, see
    the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/compare-options-choose-lightsail-instance-image }Amazon
    Lightsail Developer Guide}.
    |}*)

  bundle_id: string;
   (**{|
    The bundle of specification information for your virtual private server
    (or {i instance}), including the pricing plan ([micro_x_x]).|}*)

  instance_snapshot_name: string option;
   (**{|
    The name of the instance snapshot on which you are basing your new
    instances. Use the get instance snapshots operation to return information
    about your existing snapshots.
    
    Constraint:
    
    {ol 
          {- This parameter cannot be defined together with the [source
             instance name] parameter. The [instance snapshot name] and
             [source instance name] parameters are mutually exclusive.
             }
          
    }
    |}*)

  availability_zone: string;
   (**{|
    The Availability Zone where you want to create your instances. Use the
    following formatting: [us-east-2a] (case sensitive). You can get a list
    of Availability Zones by using the
    {{: http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html }get
    regions} operation. Be sure to add the [include Availability Zones]
    parameter to your request.|}*)

  attached_disk_mapping: (string * disk_map list) list option;
   (**{|
    An object containing information about one or more disk mappings.|}*)

  instance_names: string list;
   (**{|
    The names for your new instances.|}*)

}

type create_instances_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_instances_request = {
  ip_address_type: ip_address_type option;
   (**{|
    The IP address type for the instance.
    
    The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and
    [dualstack] for IPv4 and IPv6.
    
    The default value is [dualstack].|}*)

  add_ons: add_on_request list option;
   (**{|
    An array of objects representing the add-ons to enable for the new
    instance.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  key_pair_name: string option;
   (**{|
    The name of your key pair.|}*)

  user_data: string option;
   (**{|
    A launch script you can create that configures a server with additional
    user data. For example, you might want to run [apt-get -y update].
    
    Depending on the machine image you choose, the command to get software on
    your instance varies. Amazon Linux and CentOS use [yum], Debian and
    Ubuntu use [apt-get], and FreeBSD uses [pkg]. For a complete list, see
    the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/compare-options-choose-lightsail-instance-image }Amazon
    Lightsail Developer Guide}.
    |}*)

  bundle_id: string;
   (**{|
    The bundle of specification information for your virtual private server
    (or {i instance}), including the pricing plan ([medium_x_x]).|}*)

  blueprint_id: string;
   (**{|
    The ID for a virtual private server image ([app_wordpress_x_x] or
    [app_lamp_x_x]). Use the [get blueprints] operation to return a list of
    available images (or {i blueprints}).
    
    Use active blueprints when creating new instances. Inactive blueprints
    are listed to support customers with existing instances and are not
    necessarily available to create new instances. Blueprints are marked
    inactive when they become outdated due to operating system updates or new
    application releases.
    |}*)

  custom_image_name: string option;
   (**{|
    (Discontinued) The name for your custom image.
    
    In releases prior to June 12, 2017, this parameter was ignored by the
    API. It is now discontinued.
    |}*)

  availability_zone: string;
   (**{|
    The Availability Zone in which to create your instance. Use the following
    format: [us-east-2a] (case sensitive). You can get a list of Availability
    Zones by using the
    {{: http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html }get
    regions} operation. Be sure to add the [include Availability Zones]
    parameter to your request.|}*)

  instance_names: string list;
   (**{|
    The names to use for your new Lightsail instances. Separate multiple
    values using quotation marks and commas, for example:
    [["MyFirstInstance","MySecondInstance"]]|}*)

}

type create_gui_session_access_details_result = {
  sessions: session list option;
   (**{|
    Returns information about the specified NICE DCV GUI session.|}*)

  failure_reason: string option;
   (**{|
    The reason the operation failed.|}*)

  percentage_complete: int option;
   (**{|
    The percentage of completion for the operation.|}*)

  status: status option;
   (**{|
    The status of the operation.|}*)

  resource_name: string option;
   (**{|
    The resource name.|}*)

}

type create_gui_session_access_details_request = {
  resource_name: string;
   (**{|
    The resource name.|}*)

}

type create_domain_entry_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_domain_entry_request = {
  domain_entry: domain_entry;
   (**{|
    An array of key-value pairs containing information about the domain entry
    request.|}*)

  domain_name: string;
   (**{|
    The domain name ([example.com]) for which you want to create the domain
    entry.|}*)

}

type create_domain_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_domain_request = {
  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  domain_name: string;
   (**{|
    The domain name to manage ([example.com]).|}*)

}

type create_distribution_result = {
  operation: operation option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

  distribution: lightsail_distribution option;
   (**{|
    An object that describes the distribution created.|}*)

}

type create_distribution_request = {
  viewer_minimum_tls_protocol_version: viewer_minimum_tls_protocol_version_enum option;
   (**{|
    The minimum TLS protocol version for the SSL/TLS certificate.|}*)

  certificate_name: string option;
   (**{|
    The name of the SSL/TLS certificate that you want to attach to the
    distribution.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetCertificates.html }GetCertificates}
    action to get a list of certificate names that you can specify.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the distribution during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  ip_address_type: ip_address_type option;
   (**{|
    The IP address type for the distribution.
    
    The possible values are [ipv4] for IPv4 only, and [dualstack] for IPv4
    and IPv6.
    
    The default value is [dualstack].|}*)

  bundle_id: string;
   (**{|
    The bundle ID to use for the distribution.
    
    A distribution bundle describes the specifications of your distribution,
    such as the monthly cost and monthly network transfer quota.
    
    Use the [GetDistributionBundles] action to get a list of distribution
    bundle IDs that you can specify.|}*)

  cache_behaviors: cache_behavior_per_path list option;
   (**{|
    An array of objects that describe the per-path cache behavior for the
    distribution.|}*)

  cache_behavior_settings: cache_settings option;
   (**{|
    An object that describes the cache behavior settings for the distribution.|}*)

  default_cache_behavior: cache_behavior;
   (**{|
    An object that describes the default cache behavior for the distribution.|}*)

  origin: input_origin;
   (**{|
    An object that describes the origin resource for the distribution, such
    as a Lightsail instance, bucket, or load balancer.
    
    The distribution pulls, caches, and serves content from the origin.|}*)

  distribution_name: string;
   (**{|
    The name for the distribution.|}*)

}

type create_disk_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_disk_snapshot_request = {
  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  instance_name: string option;
   (**{|
    The unique name of the source instance ([Amazon_Linux-512MB-Virginia-1]).
    When this is defined, a snapshot of the instance's system volume is
    created.
    
    This parameter cannot be defined together with the [disk name] parameter.
    The [instance name] and [disk name] parameters are mutually exclusive.
    |}*)

  disk_snapshot_name: string;
   (**{|
    The name of the destination disk snapshot ([my-disk-snapshot]) based on
    the source disk.|}*)

  disk_name: string option;
   (**{|
    The unique name of the source disk ([Disk-Virginia-1]).
    
    This parameter cannot be defined together with the [instance name]
    parameter. The [disk name] and [instance name] parameters are mutually
    exclusive.
    |}*)

}

type create_disk_from_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_disk_from_snapshot_request = {
  use_latest_restorable_auto_snapshot: bool option;
   (**{|
    A Boolean value to indicate whether to use the latest available automatic
    snapshot.
    
    Constraints:
    
    {ol 
          {- This parameter cannot be defined together with the [restore
             date] parameter. The [use latest restorable auto snapshot] and
             [restore date] parameters are mutually exclusive.
             }
          
          {- Define this parameter only when creating a new disk from an
             automatic snapshot. For more information, see the
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots }Amazon
             Lightsail Developer Guide}.
             }
          
    }
    |}*)

  restore_date: string option;
   (**{|
    The date of the automatic snapshot to use for the new disk. Use the [get
    auto snapshots] operation to identify the dates of the available
    automatic snapshots.
    
    Constraints:
    
    {ol 
          {- Must be specified in [YYYY-MM-DD] format.
             }
          
          {- This parameter cannot be defined together with the [use latest
             restorable auto snapshot] parameter. The [restore date] and [use
             latest restorable auto snapshot] parameters are mutually
             exclusive.
             }
          
          {- Define this parameter only when creating a new disk from an
             automatic snapshot. For more information, see the
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots }Amazon
             Lightsail Developer Guide}.
             }
          
    }
    |}*)

  source_disk_name: string option;
   (**{|
    The name of the source disk from which the source automatic snapshot was
    created.
    
    Constraints:
    
    {ol 
          {- This parameter cannot be defined together with the [disk
             snapshot name] parameter. The [source disk name] and [disk
             snapshot name] parameters are mutually exclusive.
             }
          
          {- Define this parameter only when creating a new disk from an
             automatic snapshot. For more information, see the
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots }Amazon
             Lightsail Developer Guide}.
             }
          
    }
    |}*)

  add_ons: add_on_request list option;
   (**{|
    An array of objects that represent the add-ons to enable for the new disk.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  size_in_gb: int;
   (**{|
    The size of the disk in GB ([32]).|}*)

  availability_zone: string;
   (**{|
    The Availability Zone where you want to create the disk ([us-east-2a]).
    Choose the same Availability Zone as the Lightsail instance where you
    want to create the disk.
    
    Use the GetRegions operation to list the Availability Zones where
    Lightsail is currently available.|}*)

  disk_snapshot_name: string option;
   (**{|
    The name of the disk snapshot ([my-snapshot]) from which to create the
    new storage disk.
    
    Constraint:
    
    {ol 
          {- This parameter cannot be defined together with the [source disk
             name] parameter. The [disk snapshot name] and [source disk name]
             parameters are mutually exclusive.
             }
          
    }
    |}*)

  disk_name: string;
   (**{|
    The unique Lightsail disk name ([my-disk]).|}*)

}

type create_disk_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_disk_request = {
  add_ons: add_on_request list option;
   (**{|
    An array of objects that represent the add-ons to enable for the new disk.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the resource during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  size_in_gb: int;
   (**{|
    The size of the disk in GB ([32]).|}*)

  availability_zone: string;
   (**{|
    The Availability Zone where you want to create the disk ([us-east-2a]).
    Use the same Availability Zone as the Lightsail instance to which you
    want to attach the disk.
    
    Use the [get regions] operation to list the Availability Zones where
    Lightsail is currently available.|}*)

  disk_name: string;
   (**{|
    The unique Lightsail disk name ([my-disk]).|}*)

}

(**{|
    Describes the sign-in credentials for the container image registry of an
    Amazon Lightsail account.|}*)
type container_service_registry_login = {
  registry: string option;
   (**{|
    The address to use to push container images to the container image
    registry of a Lightsail account.|}*)

  expires_at: float option;
   (**{|
    The timestamp of when the container image registry sign-in credentials
    expire.
    
    The log in credentials expire 12 hours after they are created, at which
    point you will need to create a new set of log in credentials using the
    [CreateContainerServiceRegistryLogin] action.|}*)

  password: string option;
   (**{|
    The container service registry password to use to push container images
    to the container image registry of a Lightsail account|}*)

  username: string option;
   (**{|
    The container service registry username to use to push container images
    to the container image registry of a Lightsail account.|}*)

}

type create_container_service_registry_login_result = {
  registry_login: container_service_registry_login option;
   (**{|
    An object that describes the log in information for the container service
    registry of your Lightsail account.|}*)

}

type create_container_service_registry_login_request = unit

type create_container_service_deployment_result = {
  container_service: container_service option;
   (**{|
    An object that describes a container service.|}*)

}

(**{|
    Describes the settings of a public endpoint for an Amazon Lightsail
    container service.|}*)
type endpoint_request = {
  health_check: container_service_health_check_config option;
   (**{|
    An object that describes the health check configuration of the container.|}*)

  container_port: int;
   (**{|
    The port of the container to which traffic is forwarded to.|}*)

  container_name: string;
   (**{|
    The name of the container for the endpoint.|}*)

}

type create_container_service_deployment_request = {
  public_endpoint: endpoint_request option;
   (**{|
    An object that describes the settings of the public endpoint for the
    container service.|}*)

  containers: (string * container) list option;
   (**{|
    An object that describes the settings of the containers that will be
    launched on the container service.|}*)

  service_name: string;
   (**{|
    The name of the container service for which to create the deployment.|}*)

}

type create_container_service_result = {
  container_service: container_service option;
   (**{|
    An object that describes a container service.|}*)

}

(**{|
    Describes a container deployment configuration of an Amazon Lightsail
    container service.
    
    A deployment specifies the settings, such as the ports and launch
    command, of containers that are deployed to your container service.|}*)
type container_service_deployment_request = {
  public_endpoint: endpoint_request option;
   (**{|
    An object that describes the endpoint of the deployment.|}*)

  containers: (string * container) list option;
   (**{|
    An object that describes the configuration for the containers of the
    deployment.|}*)

}

type create_container_service_request = {
  private_registry_access: private_registry_access_request option;
   (**{|
    An object to describe the configuration for the container service to
    access private container image repositories, such as Amazon Elastic
    Container Registry (Amazon ECR) private repositories.
    
    For more information, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access }Configuring
    access to an Amazon ECR private repository for an Amazon Lightsail
    container service} in the {i Amazon Lightsail Developer Guide}.|}*)

  deployment: container_service_deployment_request option;
   (**{|
    An object that describes a deployment for the container service.
    
    A deployment specifies the containers that will be launched on the
    container service and their settings, such as the ports to open, the
    environment variables to apply, and the launch command to run. It also
    specifies the container that will serve as the public endpoint of the
    deployment and its settings, such as the HTTP or HTTPS port to use, and
    the health check configuration.|}*)

  public_domain_names: (string * string list) list option;
   (**{|
    The public domain names to use with the container service, such as
    [example.com] and [www.example.com].
    
    You can specify up to four public domain names for a container service.
    The domain names that you specify are used when you create a deployment
    with a container configured as the public endpoint of your container
    service.
    
    If you don't specify public domain names, then you can use the default
    domain of the container service.
    
    You must create and validate an SSL/TLS certificate before you can use
    public domain names with your container service. Use the
    [CreateCertificate] action to create a certificate for the public domain
    names you want to use with your container service.
    
    You can specify public domain names using a string to array map as shown
    in the example later on this page.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the container service during
    create.
    
    Use the [TagResource] action to tag a resource after it's created.
    
    For more information about tags in Lightsail, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags }Amazon
    Lightsail Developer Guide}.|}*)

  scale: int;
   (**{|
    The scale specification for the container service.
    
    The scale specifies the allocated compute nodes of the container service.
    The [power] and [scale] of a container service makes up its configured
    capacity. To determine the monthly price of your container service,
    multiply the base price of the [power] with the [scale] (the number of
    nodes) of the service.|}*)

  power: container_service_power_name;
   (**{|
    The power specification for the container service.
    
    The power specifies the amount of memory, vCPUs, and base monthly cost of
    each node of the container service. The [power] and [scale] of a
    container service makes up its configured capacity. To determine the
    monthly price of your container service, multiply the base price of the
    [power] with the [scale] (the number of nodes) of the service.
    
    Use the [GetContainerServicePowers] action to get a list of power options
    that you can specify using this parameter, and their base monthly cost.|}*)

  service_name: string;
   (**{|
    The name for the container service.
    
    The name that you specify for your container service will make up part of
    its default domain. The default domain of a container service is
    typically [https://...cs.amazonlightsail.com]. If the name of your
    container service is [container-service-1], and it's located in the US
    East (Ohio) Amazon Web Services Region ([us-east-2]), then the domain for
    your container service will be like the following example:
    [https://container-service-1.ur4EXAMPLE2uq.us-east-2.cs.amazonlightsail.com]
    
    
    The following are the requirements for container service names:
    
    {ol 
          {- Must be unique within each Amazon Web Services Region in your
             Lightsail account.
             }
          
          {- Must contain 1 to 63 characters.
             }
          
          {- Must contain only alphanumeric characters and hyphens.
             }
          
          {- A hyphen (-) can separate words but cannot be at the start or
             end of the name.
             }
          
    }
    |}*)

}

type create_contact_method_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type create_contact_method_request = {
  contact_endpoint: string;
   (**{|
    The destination of the contact method, such as an email address or a
    mobile phone number.
    
    Use the E.164 format when specifying a mobile phone number. E.164 is a
    standard for the phone number structure used for international
    telecommunication. Phone numbers that follow this format can have a
    maximum of 15 digits, and they are prefixed with the plus character (+)
    and the country code. For example, a U.S. phone number in E.164 format
    would be specified as +1XXX5550100. For more information, see
    {{: https://en.wikipedia.org/wiki/E.164 }E.164} on {i Wikipedia}.|}*)

  protocol: contact_protocol;
   (**{|
    The protocol of the contact method, such as [Email] or [SMS] (text
    messaging).
    
    The [SMS] protocol is supported only in the following Amazon Web Services
    Regions.
    
    {ol 
          {- US East (N. Virginia) ([us-east-1])
             }
          
          {- US West (Oregon) ([us-west-2])
             }
          
          {- Europe (Ireland) ([eu-west-1])
             }
          
          {- Asia Pacific (Tokyo) ([ap-northeast-1])
             }
          
          {- Asia Pacific (Singapore) ([ap-southeast-1])
             }
          
          {- Asia Pacific (Sydney) ([ap-southeast-2])
             }
          
    }
    
    For a list of countries/regions where SMS text messages can be sent, and
    the latest Amazon Web Services Regions where SMS text messaging is
    supported, see
    {{: https://docs.aws.amazon.com/sns/latest/dg/sns-supported-regions-countries.html }Supported
    Regions and Countries} in the {i Amazon SNS Developer Guide}.
    
    For more information about notifications in Amazon Lightsail, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications }Notifications
    in Amazon Lightsail}.|}*)

}

type create_cloud_formation_stack_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

(**{|
    Describes the Amazon Elastic Compute Cloud instance and related resources
    to be created using the [create cloud formation stack] operation.|}*)
type instance_entry = {
  availability_zone: string;
   (**{|
    The Availability Zone for the new Amazon EC2 instance.|}*)

  user_data: string option;
   (**{|
    A launch script you can create that configures a server with additional
    user data. For example, you might want to run [apt-get -y update].
    
    Depending on the machine image you choose, the command to get software on
    your instance varies. Amazon Linux and CentOS use [yum], Debian and
    Ubuntu use [apt-get], and FreeBSD uses [pkg].
    |}*)

  port_info_source: port_info_source_type;
   (**{|
    The port configuration to use for the new Amazon EC2 instance.
    
    The following configuration options are available:
    
    {ol 
          {- [DEFAULT] - Use the default firewall settings from the Lightsail
             instance blueprint. If this is specified, then IPv4 and IPv6
             will be configured for the new instance that is created in
             Amazon EC2.
             }
          
          {- [INSTANCE] - Use the configured firewall settings from the
             source Lightsail instance. If this is specified, the new
             instance that is created in Amazon EC2 will be configured to
             match the configuration of the source Lightsail instance. For
             example, if the source instance is configured for dual-stack
             (IPv4 and IPv6), then IPv4 and IPv6 will be configured for the
             new instance that is created in Amazon EC2. If the source
             instance is configured for IPv4 only, then only IPv4 will be
             configured for the new instance that is created in Amazon EC2.
             }
          
          {- [NONE] - Use the default Amazon EC2 security group. If this is
             specified, then only IPv4 will be configured for the new
             instance that is created in Amazon EC2.
             }
          
          {- [CLOSED] - All ports closed. If this is specified, then only
             IPv4 will be configured for the new instance that is created in
             Amazon EC2.
             }
          
    }
    
    If you configured [lightsail-connect] as a [cidrListAliases] on your
    instance, or if you chose to allow the Lightsail browser-based SSH or RDP
    clients to connect to your instance, that configuration is not carried
    over to your new Amazon EC2 instance.
    |}*)

  instance_type: string;
   (**{|
    The instance type ([t2.micro]) to use for the new Amazon EC2 instance.|}*)

  source_name: string;
   (**{|
    The name of the export snapshot record, which contains the exported
    Lightsail instance snapshot that will be used as the source of the new
    Amazon EC2 instance.
    
    Use the [get export snapshot records] operation to get a list of export
    snapshot records that you can use to create a CloudFormation stack.|}*)

}

type create_cloud_formation_stack_request = {
  instances: instance_entry list;
   (**{|
    An array of parameters that will be used to create the new Amazon EC2
    instance. You can only pass one instance entry at a time in this array.
    You will get an invalid parameter error if you pass more than one
    instance entry in this array.|}*)

}

type create_certificate_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

  certificate: certificate_summary option;
   (**{|
    An object that describes the certificate created.|}*)

}

type create_certificate_request = {
  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the certificate during create.
    
    Use the [TagResource] action to tag a resource after it's created.|}*)

  subject_alternative_names: string list option;
   (**{|
    An array of strings that specify the alternate domains ([example2.com])
    and subdomains ([blog.example.com]) for the certificate.
    
    You can specify a maximum of nine alternate domains (in addition to the
    primary domain name).
    
    Wildcard domain entries ([*.example.com]) are not supported.|}*)

  domain_name: string;
   (**{|
    The domain name ([example.com]) for the certificate.|}*)

  certificate_name: string;
   (**{|
    The name for the certificate.|}*)

}

type create_bucket_access_key_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

  access_key: access_key option;
   (**{|
    An object that describes the access key that is created.|}*)

}

type create_bucket_access_key_request = {
  bucket_name: string;
   (**{|
    The name of the bucket that the new access key will belong to, and grant
    access to.|}*)

}

type create_bucket_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

  bucket: bucket option;
   (**{|
    An object that describes the bucket that is created.|}*)

}

type create_bucket_request = {
  enable_object_versioning: bool option;
   (**{|
    A Boolean value that indicates whether to enable versioning of objects in
    the bucket.
    
    For more information about versioning, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-managing-bucket-object-versioning }Enabling
    and suspending object versioning in a bucket in Amazon Lightsail} in the
    {i Amazon Lightsail Developer Guide}.|}*)

  tags: tag list option;
   (**{|
    The tag keys and optional values to add to the bucket during creation.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_TagResource.html }TagResource}
    action to tag the bucket after it's created.|}*)

  bundle_id: string;
   (**{|
    The ID of the bundle to use for the bucket.
    
    A bucket bundle specifies the monthly cost, storage space, and data
    transfer quota for a bucket.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketBundles.html }GetBucketBundles}
    action to get a list of bundle IDs that you can specify.
    
    Use the
    {{: https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html }UpdateBucketBundle}
    action to change the bundle after the bucket is created.|}*)

  bucket_name: string;
   (**{|
    The name for the bucket.
    
    For more information about bucket names, see
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/bucket-naming-rules-in-amazon-lightsail }Bucket
    naming rules in Amazon Lightsail} in the {i Amazon Lightsail Developer
    Guide}.|}*)

}

type copy_snapshot_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type copy_snapshot_request = {
  source_region: region_name;
   (**{|
    The Amazon Web Services Region where the source manual or automatic
    snapshot is located.|}*)

  target_snapshot_name: string;
   (**{|
    The name of the new manual snapshot to be created as a copy.|}*)

  use_latest_restorable_auto_snapshot: bool option;
   (**{|
    A Boolean value to indicate whether to use the latest available automatic
    snapshot of the specified source instance or disk.
    
    Constraints:
    
    {ol 
          {- This parameter cannot be defined together with the [restore
             date] parameter. The [use latest restorable auto snapshot] and
             [restore date] parameters are mutually exclusive.
             }
          
          {- Define this parameter only when copying an automatic snapshot as
             a manual snapshot. For more information, see the
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots }Amazon
             Lightsail Developer Guide}.
             }
          
    }
    |}*)

  restore_date: string option;
   (**{|
    The date of the source automatic snapshot to copy. Use the [get auto
    snapshots] operation to identify the dates of the available automatic
    snapshots.
    
    Constraints:
    
    {ol 
          {- Must be specified in [YYYY-MM-DD] format.
             }
          
          {- This parameter cannot be defined together with the [use latest
             restorable auto snapshot] parameter. The [restore date] and [use
             latest restorable auto snapshot] parameters are mutually
             exclusive.
             }
          
          {- Define this parameter only when copying an automatic snapshot as
             a manual snapshot. For more information, see the
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots }Amazon
             Lightsail Developer Guide}.
             }
          
    }
    |}*)

  source_resource_name: string option;
   (**{|
    The name of the source instance or disk from which the source automatic
    snapshot was created.
    
    Constraint:
    
    {ol 
          {- Define this parameter only when copying an automatic snapshot as
             a manual snapshot. For more information, see the
             {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-keeping-automatic-snapshots }Amazon
             Lightsail Developer Guide}.
             }
          
    }
    |}*)

  source_snapshot_name: string option;
   (**{|
    The name of the source manual snapshot to copy.
    
    Constraint:
    
    {ol 
          {- Define this parameter only when copying a manual snapshot as
             another manual snapshot.
             }
          
    }
    |}*)

}

type close_instance_public_ports_result = {
  operation: operation option;
   (**{|
    An object that describes the result of the action, such as the status of
    the request, the timestamp of the request, and the resources affected by
    the request.|}*)

}

type close_instance_public_ports_request = {
  instance_name: string;
   (**{|
    The name of the instance for which to close ports.|}*)

  port_info: port_info;
   (**{|
    An object to describe the ports to close for the specified instance.|}*)

}

type attach_static_ip_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type attach_static_ip_request = {
  instance_name: string;
   (**{|
    The instance name to which you want to attach the static IP address.|}*)

  static_ip_name: string;
   (**{|
    The name of the static IP.|}*)

}

type attach_load_balancer_tls_certificate_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.
    
    These SSL/TLS certificates are only usable by Lightsail load balancers.
    You can't get the certificate and use it for another purpose.|}*)

}

type attach_load_balancer_tls_certificate_request = {
  certificate_name: string;
   (**{|
    The name of your SSL/TLS certificate.|}*)

  load_balancer_name: string;
   (**{|
    The name of the load balancer to which you want to associate the SSL/TLS
    certificate.|}*)

}

type attach_instances_to_load_balancer_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type attach_instances_to_load_balancer_request = {
  instance_names: string list;
   (**{|
    An array of strings representing the instance name(s) you want to attach
    to your load balancer.
    
    An instance must be [running] before you can attach it to your load
    balancer.
    
    There are no additional limits on the number of instances you can attach
    to your load balancer, aside from the limit of Lightsail instances you
    can create in your account (20).|}*)

  load_balancer_name: string;
   (**{|
    The name of the load balancer.|}*)

}

type attach_disk_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type attach_disk_request = {
  auto_mounting: bool option;
   (**{|
    A Boolean value used to determine the automatic mounting of a storage
    volume to a virtual computer. The default value is [False].
    
    This value only applies to Lightsail for Research resources.
    |}*)

  disk_path: string;
   (**{|
    The disk path to expose to the instance ([/dev/xvdf]).|}*)

  instance_name: string;
   (**{|
    The name of the Lightsail instance where you want to utilize the storage
    disk.|}*)

  disk_name: string;
   (**{|
    The unique Lightsail disk name ([my-disk]).|}*)

}

type attach_certificate_to_distribution_result = {
  operation: operation option;
   (**{|
    An object that describes the result of the action, such as the status of
    the request, the timestamp of the request, and the resources affected by
    the request.|}*)

}

type attach_certificate_to_distribution_request = {
  certificate_name: string;
   (**{|
    The name of the certificate to attach to a distribution.
    
    Only certificates with a status of [ISSUED] can be attached to a
    distribution.
    
    Use the [GetCertificates] action to get a list of certificate names that
    you can specify.
    
    This is the name of the certificate resource type and is used only to
    reference the certificate in other API actions. It can be different than
    the domain name of the certificate. For example, your certificate name
    might be [WordPress-Blog-Certificate] and the domain name of the
    certificate might be [example.com].
    |}*)

  distribution_name: string;
   (**{|
    The name of the distribution that the certificate will be attached to.
    
    Use the [GetDistributions] action to get a list of distribution names
    that you can specify.|}*)

}

type allocate_static_ip_result = {
  operations: operation list option;
   (**{|
    An array of objects that describe the result of the action, such as the
    status of the request, the timestamp of the request, and the resources
    affected by the request.|}*)

}

type allocate_static_ip_request = {
  static_ip_name: string;
   (**{|
    The name of the static IP address.|}*)

}

(**{|
    Amazon Lightsail is the easiest way to get started with Amazon Web
    Services (Amazon Web Services) for developers who need to build websites
    or web applications. It includes everything you need to launch your
    project quickly - instances (virtual private servers), container
    services, storage buckets, managed databases, SSD-based block storage,
    static IP addresses, load balancers, content delivery network (CDN)
    distributions, DNS management of registered domains, and resource
    snapshots (backups) - for a low, predictable monthly price.
    
    You can manage your Lightsail resources using the Lightsail console,
    Lightsail API, Command Line Interface (CLI), or SDKs. For more
    information about Lightsail concepts and tasks, see the
    {{: https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-how-to-set-up-access-keys-to-use-sdk-api-cli }Amazon
    Lightsail Developer Guide}.
    
    This API Reference provides detailed information about the actions, data
    types, parameters, and errors of the Lightsail service. For more
    information about the supported Amazon Web Services Regions, endpoints,
    and service quotas of the Lightsail service, see
    {{: https://docs.aws.amazon.com/general/latest/gr/lightsail.html }Amazon
    Lightsail Endpoints and Quotas} in the {i Amazon Web Services General
    Reference}.|}*)


type base_document = Json.t

