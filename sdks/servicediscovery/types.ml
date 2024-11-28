open Smaws_Lib
let service =
  Service.{
    namespace = "servicediscovery";
    endpointPrefix = "servicediscovery";
    version = "2017-03-14";
    protocol = AwsJson_1_1
  };

type update_service_response = {
  operation_id: string option;
  (** 
    A value that you can use to determine whether the request completed successfully. To get the status of the operation, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.
     *)

}

type record_type = | CNAME
  | AAAA
  | A
  | SRV

(** 
    A complex type that contains information about the Route 53 DNS records that you want Cloud Map to create when you register an instance.
     *)
type dns_record = {
  tt_l: int;
  (** 
    The amount of time, in seconds, that you want DNS resolvers to cache the settings for this record.
    
     Alias records don't include a TTL because Route 53 uses the TTL for the Amazon Web Services resource that an alias record routes traffic to. If you include the [AWS_ALIAS_DNS_NAME] attribute when you submit a {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance} request, the [TTL] value is ignored. Always specify a TTL for the service; you can use a service to register instances that create either alias or non-alias records.
     
      *)

  type_: record_type;
  (** 
    The type of the resource, which indicates the type of value that Route 53 returns in response to DNS queries. You can specify values for [Type] in the following combinations:
    
     {ul
          {- {b [A]}
             
             }
           {- {b [AAAA]}
              
              }
           {- {b [A]} and {b [AAAA]}
              
              }
           {- {b [SRV]}
              
              }
           {- {b [CNAME]}
              
              }
          
      }
       If you want Cloud Map to create a Route 53 alias record when you register an instance, specify [A] or [AAAA] for [Type].
       
        You specify other settings, such as the IP address for [A] and [AAAA] records, when you register an instance. For more information, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance}.
        
         The following values are supported:
         
          A Route 53 returns the IP address of the resource in IPv4 format, such as 192.0.2.44.
            
             AAAA Route 53 returns the IP address of the resource in IPv6 format, such as 2001:0db8:85a3:0000:0000:abcd:0001:2345.
                  
                   CNAME Route 53 returns the domain name of the resource, such as www.example.com. Note the following:
                         
                          {ul
                               {- You specify the domain name that you want to route traffic to when you register an instance. For more information, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html#cloudmap-RegisterInstance-request-Attributes}Attributes} in the topic {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance}.
                                  
                                  }
                                {- You must specify [WEIGHTED] for the value of [RoutingPolicy].
                                   
                                   }
                                {- You can't specify both [CNAME] for [Type] and settings for [HealthCheckConfig]. If you do, the request will fail with an [InvalidInput] error.
                                   
                                   }
                               
      }
       SRV Route 53 returns the value for an [SRV] record. The value for an [SRV] record uses the following values:
           
            [priority weight port service-hostname]
            
             Note the following about the values:
             
              {ul
                   {- The values of [priority] and [weight] are both set to [1] and can't be changed.
                      
                      }
                    {- The value of [port] comes from the value that you specify for the [AWS_INSTANCE_PORT] attribute when you submit a {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance} request.
                       
                       }
                    {- The value of [service-hostname] is a concatenation of the following values:
                       
                        {ul
                             {- The value that you specify for [InstanceId] when you register an instance.
                                
                                }
                              {- The name of the service.
                                 
                                 }
                              {- The name of the namespace.
                                 
                                 }
                             
                     }
                      For example, if the value of [InstanceId] is [test], the name of the service is [backend], and the name of the namespace is [example.com], the value of [service-hostname] is the following:
                      
                       [test.backend.example.com]
                       
                       }
                   
      }
       If you specify settings for an [SRV] record, note the following:
       
        {ul
             {- If you specify values for [AWS_INSTANCE_IPV4], [AWS_INSTANCE_IPV6], or both in the [RegisterInstance] request, Cloud Map automatically creates [A] and/or [AAAA] records that have the same name as the value of [service-hostname] in the [SRV] record. You can ignore these records.
                
                }
              {- If you're using a system that requires a specific [SRV] format, such as HAProxy, see the {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html#cloudmap-CreateService-request-Name}Name} element in the documentation about [CreateService] for information about how to specify the correct name format.
                 
                 }
             
      }
       *)

}

(** 
    A complex type that contains information about changes to the Route 53 DNS records that Cloud Map creates when you register an instance.
     *)
type dns_config_change = {
  dns_records: dns_record list;
  (** 
    An array that contains one [DnsRecord] object for each Route 53 record that you want Cloud Map to create when you register an instance.
     *)

}

type health_check_type = | TCP
  | HTTPS
  | HTTP

(** 
    {i Public DNS and HTTP namespaces only.} A complex type that contains settings for an optional health check. If you specify settings for a health check, Cloud Map associates the health check with the records that you specify in [DnsConfig].
    
     If you specify a health check configuration, you can specify either [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.
     
      Health checks are basic Route 53 health checks that monitor an Amazon Web Services endpoint. For information about pricing for health checks, see {{:http://aws.amazon.com/route53/pricing/}Amazon Route 53 Pricing}.
      
       Note the following about configuring health checks.
       
        A and AAAA records If [DnsConfig] includes configurations for both [A] and [AAAA] records, Cloud Map creates a health check that uses the IPv4 address to check the health of the resource. If the endpoint tthat's specified by the IPv4 address is unhealthy, Route 53 considers both the [A] and [AAAA] records to be unhealthy.
                           
                            CNAME records You can't specify settings for [HealthCheckConfig] when the [DNSConfig] includes [CNAME] for the value of [Type]. If you do, the [CreateService] request will fail with an [InvalidInput] error.
                                          
                                           Request interval A Route 53 health checker in each health-checking Amazon Web Services Region sends a health check request to an endpoint every 30 seconds. On average, your endpoint receives a health check request about every two seconds. However, health checkers don't coordinate with one another. Therefore, you might sometimes see several requests in one second that's followed by a few seconds with no health checks at all.
                                                            
                                                             Health checking regions 
    Health checkers perform checks from all Route 53 health-checking Regions. For a list of the current Regions, see {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-Regions}Regions}.
    
     Alias records When you register an instance, if you include the [AWS_ALIAS_DNS_NAME] attribute, Cloud Map creates a Route 53 alias record. Note the following:
                   
                    {ul
                         {- Route 53 automatically sets [EvaluateTargetHealth] to true for alias records. When [EvaluateTargetHealth] is true, the alias record inherits the health of the referenced Amazon Web Services resource. such as an ELB load balancer. For more information, see {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html#Route53-Type-AliasTarget-EvaluateTargetHealth}EvaluateTargetHealth}.
                            
                            }
                          {- If you include [HealthCheckConfig] and then use the service to register an instance that creates an alias record, Route 53 doesn't create the health check.
                             
                             }
                         
      }
       Charges for health checks Health checks are basic Route 53 health checks that monitor an Amazon Web Services endpoint. For information about pricing for health checks, see {{:http://aws.amazon.com/route53/pricing/}Amazon Route 53 Pricing}.
                                 
                                  *)
type health_check_config = {
  failure_threshold: int option;
  (** 
    The number of consecutive health checks that an endpoint must pass or fail for Route 53 to change the current status of the endpoint from unhealthy to healthy or the other way around. For more information, see {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html}How Route 53 Determines Whether an Endpoint Is Healthy} in the {i Route 53 Developer Guide}.
     *)

  resource_path: string option;
  (** 
    The path that you want Route 53 to request when performing health checks. The path can be any value that your endpoint returns an HTTP status code of a 2xx or 3xx format for when the endpoint is healthy. An example file is [/docs/route53-health-check.html]. Route 53 automatically adds the DNS name for the service. If you don't specify a value for [ResourcePath], the default value is [/].
    
     If you specify [TCP] for [Type], you must {i not} specify a value for [ResourcePath].
      *)

  type_: health_check_type;
  (** 
    The type of health check that you want to create, which indicates how Route 53 determines whether an endpoint is healthy.
    
     You can't change the value of [Type] after you create a health check.
     
      You can create the following types of health checks:
      
       {ul
            {- {b HTTP}: Route 53 tries to establish a TCP connection. If successful, Route 53 submits an HTTP request and waits for an HTTP status code of 200 or greater and less than 400.
               
               }
             {- {b HTTPS}: Route 53 tries to establish a TCP connection. If successful, Route 53 submits an HTTPS request and waits for an HTTP status code of 200 or greater and less than 400.
                
                 If you specify HTTPS for the value of [Type], the endpoint must support TLS v1.0 or later.
                 
                 }
             {- {b TCP}: Route 53 tries to establish a TCP connection.
                
                 If you specify [TCP] for [Type], don't specify a value for [ResourcePath].
                 
                 }
            
      }
       For more information, see {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html}How Route 53 Determines Whether an Endpoint Is Healthy} in the {i Route 53 Developer Guide}.
        *)

}

(** 
    A complex type that contains changes to an existing service.
     *)
type service_change = {
  health_check_config: health_check_config option;
  (** 
    {i Public DNS and HTTP namespaces only.} Settings for an optional health check. If you specify settings for a health check, Cloud Map associates the health check with the records that you specify in [DnsConfig].
     *)

  dns_config: dns_config_change option;
  (** 
    Information about the Route 53 DNS records that you want Cloud Map to create when you register an instance.
     *)

  description: string option;
  (** 
    A description for the service.
     *)

}

type update_service_request = {
  service: service_change;
  (** 
    A complex type that contains the new settings for the service.
     *)

  id: string;
  (** 
    The ID of the service that you want to update.
     *)

}

(** 
    No service exists with the specified ID.
     *)
type service_not_found = {
  message: string option;
  
}

(** 
    One or more specified values aren't valid. For example, a required value might be missing, a numeric value might be outside the allowed range, or a string value might exceed length constraints.
     *)
type invalid_input = {
  message: string option;
  
}

(** 
    The operation is already in progress.
     *)
type duplicate_request = {
  duplicate_operation_id: string option;
  (** 
    The ID of the operation that's already in progress.
     *)

  message: string option;
  
}

type update_public_dns_namespace_response = {
  operation_id: string option;
  (** 
    A value that you can use to determine whether the request completed successfully. To get the status of the operation, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.
     *)

}

(** 
    Updated Start of Authority (SOA) properties for a public or private DNS namespace.
     *)
type soa_change = {
  tt_l: int;
  (** 
    The updated time to live (TTL) for purposes of negative caching.
     *)

}

(** 
    Updated DNS properties for the public DNS namespace.
     *)
type public_dns_properties_mutable_change = {
  so_a: soa_change;
  (** 
    Updated fields for the Start of Authority (SOA) record for the hosted zone for the public DNS namespace.
     *)

}

(** 
    Updated properties for the public DNS namespace.
     *)
type public_dns_namespace_properties_change = {
  dns_properties: public_dns_properties_mutable_change;
  (** 
    Updated DNS properties for the hosted zone for the public DNS namespace.
     *)

}

(** 
    Updated properties for the public DNS namespace.
     *)
type public_dns_namespace_change = {
  properties: public_dns_namespace_properties_change option;
  (** 
    Properties to be updated in the public DNS namespace.
     *)

  description: string option;
  (** 
    An updated description for the public DNS namespace.
     *)

}

type update_public_dns_namespace_request = {
  namespace: public_dns_namespace_change;
  (** 
    Updated properties for the public DNS namespace.
     *)

  updater_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed [UpdatePublicDnsNamespace] requests to be retried without the risk of running the operation twice. [UpdaterRequestId] can be any unique string (for example, a date/timestamp).
     *)

  id: string;
  (** 
    The ID of the namespace being updated.
     *)

}

(** 
    The specified resource can't be deleted because it contains other resources. For example, you can't delete a service that contains any instances.
     *)
type resource_in_use = {
  message: string option;
  
}

(** 
    No namespace exists with the specified ID.
     *)
type namespace_not_found = {
  message: string option;
  
}

type update_private_dns_namespace_response = {
  operation_id: string option;
  (** 
    A value that you can use to determine whether the request completed successfully. To get the status of the operation, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.
     *)

}

(** 
    Updated DNS properties for the private DNS namespace.
     *)
type private_dns_properties_mutable_change = {
  so_a: soa_change;
  (** 
    Updated fields for the Start of Authority (SOA) record for the hosted zone for the private DNS namespace.
     *)

}

(** 
    Updated properties for the private DNS namespace.
     *)
type private_dns_namespace_properties_change = {
  dns_properties: private_dns_properties_mutable_change;
  (** 
    Updated DNS properties for the private DNS namespace.
     *)

}

(** 
    Updated properties for the private DNS namespace.
     *)
type private_dns_namespace_change = {
  properties: private_dns_namespace_properties_change option;
  (** 
    Properties to be updated in the private DNS namespace.
     *)

  description: string option;
  (** 
    An updated description for the private DNS namespace.
     *)

}

type update_private_dns_namespace_request = {
  namespace: private_dns_namespace_change;
  (** 
    Updated properties for the private DNS namespace.
     *)

  updater_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed [UpdatePrivateDnsNamespace] requests to be retried without the risk of running the operation twice. [UpdaterRequestId] can be any unique string (for example, a date/timestamp).
     *)

  id: string;
  (** 
    The ID of the namespace that you want to update.
     *)

}

type custom_health_status = | UNHEALTHY
  | HEALTHY

type update_instance_custom_health_status_request = {
  status: custom_health_status;
  (** 
    The new status of the instance, [HEALTHY] or [UNHEALTHY].
     *)

  instance_id: string;
  (** 
    The ID of the instance that you want to change the health status for.
     *)

  service_id: string;
  (** 
    The ID of the service that includes the configuration for the custom health check that you want to change the status for.
     *)

}

(** 
    No instance exists with the specified ID, or the instance was recently registered, and information about the instance hasn't propagated yet.
     *)
type instance_not_found = {
  message: string option;
  
}

(** 
    The health check for the instance that's specified by [ServiceId] and [InstanceId] isn't a custom health check.
     *)
type custom_health_not_found = {
  message: string option;
  
}

type update_http_namespace_response = {
  operation_id: string option;
  (** 
    A value that you can use to determine whether the request completed successfully. To get the status of the operation, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.
     *)

}

(** 
    Updated properties for the HTTP namespace.
     *)
type http_namespace_change = {
  description: string;
  (** 
    An updated description for the HTTP namespace.
     *)

}

type update_http_namespace_request = {
  namespace: http_namespace_change;
  (** 
    Updated properties for the the HTTP namespace.
     *)

  updater_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed [UpdateHttpNamespace] requests to be retried without the risk of running the operation twice. [UpdaterRequestId] can be any unique string (for example, a date/timestamp).
     *)

  id: string;
  (** 
    The ID of the namespace that you want to update.
     *)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  (** 
    The tag keys to remove from the specified resource.
     *)

  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the resource that you want to retrieve tags for.
     *)

}

(** 
    The operation can't be completed because the resource was not found.
     *)
type resource_not_found_exception = {
  message: string option;
  
}

(** 
    The list of tags on the resource is over the quota. The maximum number of tags that can be applied to a resource is 50.
     *)
type too_many_tags_exception = {
  resource_name: string option;
  (** 
    The name of the resource.
     *)

  message: string option;
  
}

type tag_resource_response = unit

(** 
    A custom key-value pair that's associated with a resource.
     *)
type tag = {
  value: string;
  (** 
    The string value that's associated with the key of the tag. You can set the value of a tag to an empty string, but you can't set the value of a tag to null.
     *)

  key: string;
  (** 
    The key identifier, or name, of the tag.
     *)

}

type tag_resource_request = {
  tags: tag list;
  (** 
    The tags to add to the specified resource. Specifying the tag key is required. You can set the value of a tag to an empty string, but you can't set the value of a tag to null.
     *)

  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the resource that you want to retrieve tags for.
     *)

}

type service_type_option = | HTTP

type service_type = | DNS
  | DNS_HTTP
  | HTTP

type routing_policy = | WEIGHTED
  | MULTIVALUE

(** 
    A complex type that contains information about the Amazon Route 53 DNS records that you want Cloud Map to create when you register an instance.
    
     The record types of a service can only be changed by deleting the service and recreating it with a new [Dnsconfig].
     
      *)
type dns_config = {
  dns_records: dns_record list;
  (** 
    An array that contains one [DnsRecord] object for each Route 53 DNS record that you want Cloud Map to create when you register an instance.
     *)

  routing_policy: routing_policy option;
  (** 
    The routing policy that you want to apply to all Route 53 DNS records that Cloud Map creates when you register an instance and specify this service.
    
     If you want to use this service to register instances that create alias records, specify [WEIGHTED] for the routing policy.
     
      You can specify the following values:
      
       MULTIVALUE If you define a health check for the service and the health check is healthy, Route 53 returns the applicable value for up to eight instances.
                  
                   For example, suppose that the service includes configurations for one [A] record and a health check. You use the service to register 10 instances. Route 53 responds to DNS queries with IP addresses for up to eight healthy instances. If fewer than eight instances are healthy, Route 53 responds to every DNS query with the IP addresses for all of the healthy instances.
                   
                    If you don't define a health check for the service, Route 53 assumes that all instances are healthy and returns the values for up to eight instances.
                    
                     For more information about the multivalue routing policy, see {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-multivalue}Multivalue Answer Routing} in the {i Route 53 Developer Guide}.
                     
                      WEIGHTED Route 53 returns the applicable value from one randomly selected instance from among the instances that you registered using the same service. Currently, all records have the same weight, so you can't route more or less traffic to any instances.
                               
                                For example, suppose that the service includes configurations for one [A] record and a health check. You use the service to register 10 instances. Route 53 responds to DNS queries with the IP address for one randomly selected instance from among the healthy instances. If no instances are healthy, Route 53 responds to DNS queries as if all of the instances were healthy.
                                
                                 If you don't define a health check for the service, Route 53 assumes that all instances are healthy and returns the applicable value for one randomly selected instance.
                                 
                                  For more information about the weighted routing policy, see {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-weighted}Weighted Routing} in the {i Route 53 Developer Guide}.
                                  
                                   *)

  namespace_id: string option;
  (** 
    {i Use NamespaceId in {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_Service.html}Service} instead.}
    
     The ID of the namespace to use for DNS configuration.
      *)

}

(** 
    A complex type that contains information about an optional custom health check. A custom health check, which requires that you use a third-party health checker to evaluate the health of your resources, is useful in the following circumstances:
    
     {ul
          {- You can't use a health check that's defined by [HealthCheckConfig] because the resource isn't available over the internet. For example, you can use a custom health check when the instance is in an Amazon VPC. (To check the health of resources in a VPC, the health checker must also be in the VPC.)
             
             }
           {- You want to use a third-party health checker regardless of where your resources are located.
              
              }
          
      }
       If you specify a health check configuration, you can specify either [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.
       
        To change the status of a custom health check, submit an [UpdateInstanceCustomHealthStatus] request. Cloud Map doesn't monitor the status of the resource, it just keeps a record of the status specified in the most recent [UpdateInstanceCustomHealthStatus] request.
        
         Here's how custom health checks work:
         
          {ol
               {- You create a service.
                  
                  }
                {- You register an instance.
                   
                   }
                {- You configure a third-party health checker to monitor the resource that's associated with the new instance.
                   
                    Cloud Map doesn't check the health of the resource directly.
                    
                    }
                {- The third-party health-checker determines that the resource is unhealthy and notifies your application.
                   
                   }
                {- Your application submits an [UpdateInstanceCustomHealthStatus] request.
                   
                   }
                {- Cloud Map waits for 30 seconds.
                   
                   }
                {- If another [UpdateInstanceCustomHealthStatus] request doesn't arrive during that time to change the status back to healthy, Cloud Map stops routing traffic to the resource.
                   
                   }
               
      }
       *)
type health_check_custom_config = {
  failure_threshold: int option;
  (** 
    This parameter is no longer supported and is always set to 1. Cloud Map waits for approximately 30 seconds after receiving an [UpdateInstanceCustomHealthStatus] request before changing the status of the service instance.
    
     The number of 30-second intervals that you want Cloud Map to wait after receiving an [UpdateInstanceCustomHealthStatus] request before it changes the health status of a service instance.
     
      Sending a second or subsequent [UpdateInstanceCustomHealthStatus] request with the same value before 30 seconds has passed doesn't accelerate the change. Cloud Map still waits [30] seconds after the first request to make the change.
       *)

}

(** 
    A complex type that contains information about a specified service.
     *)
type service_summary = {
  create_date: float option;
  (** 
    The date and time that the service was created.
     *)

  health_check_custom_config: health_check_custom_config option;
  (** 
    Information about an optional custom health check. A custom health check, which requires that you use a third-party health checker to evaluate the health of your resources, is useful in the following circumstances:
    
     {ul
          {- You can't use a health check that's defined by [HealthCheckConfig] because the resource isn't available over the internet. For example, you can use a custom health check when the instance is in an Amazon VPC. (To check the health of resources in a VPC, the health checker must also be in the VPC.)
             
             }
           {- You want to use a third-party health checker regardless of where your resources are located.
              
              }
          
      }
       If you specify a health check configuration, you can specify either [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.
       
        *)

  health_check_config: health_check_config option;
  (** 
    {i Public DNS and HTTP namespaces only.} Settings for an optional health check. If you specify settings for a health check, Cloud Map associates the health check with the records that you specify in [DnsConfig].
     *)

  dns_config: dns_config option;
  (** 
    Information about the Route 53 DNS records that you want Cloud Map to create when you register an instance.
     *)

  instance_count: int option;
  (** 
    The number of instances that are currently associated with the service. Instances that were previously associated with the service but that are deleted aren't included in the count. The count might not reflect pending registrations and deregistrations.
     *)

  description: string option;
  (** 
    The description that you specify when you create the service.
     *)

  type_: service_type option;
  (** 
    Describes the systems that can be used to discover the service instances.
    
     DNS_HTTP The service instances can be discovered using either DNS queries or the [DiscoverInstances] API operation.
              
               HTTP The service instances can only be discovered using the [DiscoverInstances] API operation.
                    
                     DNS Reserved.
                         
                          *)

  name: string option;
  (** 
    The name of the service.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) that Cloud Map assigns to the service when you create it.
     *)

  id: string option;
  (** 
    The ID that Cloud Map assigned to the service when you created it.
     *)

}

type service_filter_name = | NAMESPACE_ID

type filter_condition = | BEGINS_WITH
  | BETWEEN
  | IN
  | EQ

(** 
    A complex type that lets you specify the namespaces that you want to list services for.
     *)
type service_filter = {
  condition: filter_condition option;
  (** 
    The operator that you want to use to determine whether a service is returned by [ListServices]. Valid values for [Condition] include the following:
    
     {ul
          {- [EQ]: When you specify [EQ], specify one namespace ID for [Values]. [EQ] is the default condition and can be omitted.
             
             }
          
      }
       *)

  values: string list;
  (** 
    The values that are applicable to the value that you specify for [Condition] to filter the list of services.
     *)

  name: service_filter_name;
  (** 
    Specify [NAMESPACE_ID].
     *)

}

(** 
    The service can't be created because a service with the same name already exists.
     *)
type service_already_exists = {
  service_id: string option;
  (** 
    The ID of the existing service.
     *)

  creator_request_id: string option;
  (** 
    The [CreatorRequestId] that was used to create the service.
     *)

  message: string option;
  
}

(** 
    A complex type that contains information about the specified service.
     *)
type service = {
  creator_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed requests to be retried without the risk of running the operation twice. [CreatorRequestId] can be any unique string (for example, a date/timestamp).
     *)

  create_date: float option;
  (** 
    The date and time that the service was created, in Unix format and Coordinated Universal Time (UTC). The value of [CreateDate] is accurate to milliseconds. For example, the value [1516925490.087] represents Friday, January 26, 2018 12:11:30.087 AM.
     *)

  health_check_custom_config: health_check_custom_config option;
  (** 
    A complex type that contains information about an optional custom health check.
    
     If you specify a health check configuration, you can specify either [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.
     
      *)

  health_check_config: health_check_config option;
  (** 
    {i Public DNS and HTTP namespaces only.} A complex type that contains settings for an optional health check. If you specify settings for a health check, Cloud Map associates the health check with the records that you specify in [DnsConfig].
    
     For information about the charges for health checks, see {{:http://aws.amazon.com/route53/pricing/}Amazon Route 53 Pricing}.
      *)

  type_: service_type option;
  (** 
    Describes the systems that can be used to discover the service instances.
    
     DNS_HTTP The service instances can be discovered using either DNS queries or the [DiscoverInstances] API operation.
              
               HTTP The service instances can only be discovered using the [DiscoverInstances] API operation.
                    
                     DNS Reserved.
                         
                          *)

  dns_config: dns_config option;
  (** 
    A complex type that contains information about the Route 53 DNS records that you want Cloud Map to create when you register an instance.
    
     The record types of a service can only be changed by deleting the service and recreating it with a new [Dnsconfig].
     
      *)

  instance_count: int option;
  (** 
    The number of instances that are currently associated with the service. Instances that were previously associated with the service but that are deleted aren't included in the count. The count might not reflect pending registrations and deregistrations.
     *)

  description: string option;
  (** 
    The description of the service.
     *)

  namespace_id: string option;
  (** 
    The ID of the namespace that was used to create the service.
     *)

  name: string option;
  (** 
    The name of the service.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) that Cloud Map assigns to the service when you create it.
     *)

  id: string option;
  (** 
    The ID that Cloud Map assigned to the service when you created it.
     *)

}

(** 
    Start of Authority (SOA) properties for a public or private DNS namespace.
     *)
type so_a = {
  tt_l: int;
  (** 
    The time to live (TTL) for purposes of negative caching.
     *)

}

(** 
    The resource can't be created because you've reached the quota on the number of resources.
     *)
type resource_limit_exceeded = {
  message: string option;
  
}

type register_instance_response = {
  operation_id: string option;
  (** 
    A value that you can use to determine whether the request completed successfully. To get the status of the operation, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.
     *)

}

type register_instance_request = {
  attributes: (string * string) list;
  [@ocaml.doc {| 
    A string map that contains the following information for the service that you specify in [ServiceId]:
    
     {ul
          {- The attributes that apply to the records that are defined in the service.
             
             }
           {- For each attribute, the applicable value.
              
              }
          
      }
       Do not include sensitive information in the attributes if the namespace is discoverable by public DNS queries.
       
        The following are the supported attribute keys.
        
         AWS_ALIAS_DNS_NAME If you want Cloud Map to create an Amazon Route 53 alias record that routes traffic to an Elastic Load Balancing load balancer, specify the DNS name that's associated with the load balancer. For information about how to get the DNS name, see "DNSName" in the topic {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html}AliasTarget} in the {i Route 53 API Reference}.
                            
                             Note the following:
                             
                              {ul
                                   {- The configuration for the service that's specified by [ServiceId] must include settings for an [A] record, an [AAAA] record, or both.
                                      
                                      }
                                    {- In the service that's specified by [ServiceId], the value of [RoutingPolicy] must be [WEIGHTED].
                                       
                                       }
                                    {- If the service that's specified by [ServiceId] includes [HealthCheckConfig] settings, Cloud Map will create the Route 53 health check, but it doesn't associate the health check with the alias record.
                                       
                                       }
                                    {- Cloud Map currently doesn't support creating alias records that route traffic to Amazon Web Services resources other than Elastic Load Balancing load balancers.
                                       
                                       }
                                    {- If you specify a value for [AWS_ALIAS_DNS_NAME], don't specify values for any of the [AWS_INSTANCE] attributes.
                                       
                                       }
                                    {- The [AWS_ALIAS_DNS_NAME] is not supported in the GovCloud (US) Regions.
                                       
                                       }
                                   
      }
       AWS_EC2_INSTANCE_ID {i HTTP namespaces only.} The Amazon EC2 instance ID for the instance. If the [AWS_EC2_INSTANCE_ID] attribute is specified, then the only other attribute that can be specified is [AWS_INIT_HEALTH_STATUS]. When the [AWS_EC2_INSTANCE_ID] attribute is specified, then the [AWS_INSTANCE_IPV4] attribute will be filled out with the primary private IPv4 address.
                           
                            AWS_INIT_HEALTH_STATUS If the service configuration includes [HealthCheckCustomConfig], you can optionally use [AWS_INIT_HEALTH_STATUS] to specify the initial status of the custom health check, [HEALTHY] or [UNHEALTHY]. If you don't specify a value for [AWS_INIT_HEALTH_STATUS], the initial status is [HEALTHY].
                                                   
                                                    AWS_INSTANCE_CNAME If the service configuration includes a [CNAME] record, the domain name that you want Route 53 to return in response to DNS queries (for example, [example.com]).
                                                                       
                                                                        This value is required if the service specified by [ServiceId] includes settings for an [CNAME] record.
                                                                        
                                                                         AWS_INSTANCE_IPV4 
    If the service configuration includes an [A] record, the IPv4 address that you want Route 53 to return in response to DNS queries (for example, [192.0.2.44]).
    
     This value is required if the service specified by [ServiceId] includes settings for an [A] record. If the service includes settings for an [SRV] record, you must specify a value for [AWS_INSTANCE_IPV4], [AWS_INSTANCE_IPV6], or both.
     
      AWS_INSTANCE_IPV6 If the service configuration includes an [AAAA] record, the IPv6 address that you want Route 53 to return in response to DNS queries (for example, [2001:0db8:85a3:0000:0000:abcd:0001:2345]).
                        
                         This value is required if the service specified by [ServiceId] includes settings for an [AAAA] record. If the service includes settings for an [SRV] record, you must specify a value for [AWS_INSTANCE_IPV4], [AWS_INSTANCE_IPV6], or both.
                         
                          AWS_INSTANCE_PORT If the service includes an [SRV] record, the value that you want Route 53 to return for the port.
                                            
                                             If the service includes [HealthCheckConfig], the port on the endpoint that you want Route 53 to send requests to.
                                             
                                              This value is required if you specified settings for an [SRV] record or a Route 53 health check when you created the service.
                                              
                                               Custom attributes You can add up to 30 custom attributes. For each key-value pair, the maximum length of the attribute name is 255 characters, and the maximum length of the attribute value is 1,024 characters. The total size of all provided attributes (sum of all keys and values) must not exceed 5,000 characters.
                                                                 
                                                                  |}]

  creator_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed [RegisterInstance] requests to be retried without the risk of executing the operation twice. You must use a unique [CreatorRequestId] string every time you submit a [RegisterInstance] request if you're registering additional instances for the same namespace and service. [CreatorRequestId] can be any unique string (for example, a date/time stamp).
     *)

  instance_id: string;
  (** 
    An identifier that you want to associate with the instance. Note the following:
    
     {ul
          {- If the service that's specified by [ServiceId] includes settings for an [SRV] record, the value of [InstanceId] is automatically included as part of the value for the [SRV] record. For more information, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_DnsRecord.html#cloudmap-Type-DnsRecord-Type}DnsRecord > Type}.
             
             }
           {- You can use this value to update an existing instance.
              
              }
           {- To register a new instance, you must specify a value that's unique among instances that you register by using the same service.
              
              }
           {- If you specify an existing [InstanceId] and [ServiceId], Cloud Map updates the existing DNS records, if any. If there's also an existing health check, Cloud Map deletes the old health check and creates a new one.
              
               The health check isn't deleted immediately, so it will still appear for a while if you submit a [ListHealthChecks] request, for example.
               
               }
          
      }
       Do not include sensitive information in [InstanceId] if the namespace is discoverable by public DNS queries and any [Type] member of [DnsRecord] for the service contains [SRV] because the [InstanceId] is discoverable by public DNS queries.
       
        *)

  service_id: string;
  (** 
    The ID of the service that you want to use for settings for the instance.
     *)

}

type list_tags_for_resource_response = {
  tags: tag list option;
  (** 
    The tags that are assigned to the resource.
     *)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the resource that you want to retrieve tags for.
     *)

}

type list_services_response = {
  next_token: string option;
  (** 
    If the response contains [NextToken], submit another [ListServices] request to get the next group of results. Specify the value of [NextToken] from the previous response in the next request.
    
     Cloud Map gets [MaxResults] services and then filters them based on the specified criteria. It's possible that no services in the first [MaxResults] services matched the specified criteria but that subsequent groups of [MaxResults] services do contain services that match the criteria.
     
      *)

  services: service_summary list option;
  (** 
    An array that contains one [ServiceSummary] object for each service that matches the specified filter criteria.
     *)

}

type list_services_request = {
  filters: service_filter list option;
  (** 
    A complex type that contains specifications for the namespaces that you want to list services for.
    
     If you specify more than one filter, an operation must match all filters to be returned by [ListServices].
      *)

  max_results: int option;
  (** 
    The maximum number of services that you want Cloud Map to return in the response to a [ListServices] request. If you don't specify a value for [MaxResults], Cloud Map returns up to 100 services.
     *)

  next_token: string option;
  (** 
    For the first [ListServices] request, omit this value.
    
     If the response contains [NextToken], submit another [ListServices] request to get the next group of results. Specify the value of [NextToken] from the previous response in the next request.
     
      Cloud Map gets [MaxResults] services and then filters them based on the specified criteria. It's possible that no services in the first [MaxResults] services matched the specified criteria but that subsequent groups of [MaxResults] services do contain services that match the criteria.
      
       *)

}

type operation_status = | FAIL
  | SUCCESS
  | PENDING
  | SUBMITTED

(** 
    A complex type that contains information about an operation that matches the criteria that you specified in a {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html}ListOperations} request.
     *)
type operation_summary = {
  status: operation_status option;
  (** 
    The status of the operation. Values include the following:
    
     {ul
          {- {b SUBMITTED}: This is the initial state immediately after you submit a request.
             
             }
           {- {b PENDING}: Cloud Map is performing the operation.
              
              }
           {- {b SUCCESS}: The operation succeeded.
              
              }
           {- {b FAIL}: The operation failed. For the failure reason, see [ErrorMessage].
              
              }
          
      }
       *)

  id: string option;
  (** 
    The ID for an operation.
     *)

}

type list_operations_response = {
  next_token: string option;
  (** 
    If the response contains [NextToken], submit another [ListOperations] request to get the next group of results. Specify the value of [NextToken] from the previous response in the next request.
    
     Cloud Map gets [MaxResults] operations and then filters them based on the specified criteria. It's possible that no operations in the first [MaxResults] operations matched the specified criteria but that subsequent groups of [MaxResults] operations do contain operations that match the criteria.
     
      *)

  operations: operation_summary list option;
  (** 
    Summary information about the operations that match the specified criteria.
     *)

}

type operation_filter_name = | UPDATE_DATE
  | TYPE
  | STATUS
  | SERVICE_ID
  | NAMESPACE_ID

(** 
    A complex type that lets you select the operations that you want to list.
     *)
type operation_filter = {
  condition: filter_condition option;
  (** 
    The operator that you want to use to determine whether an operation matches the specified value. Valid values for condition include:
    
     {ul
          {- [EQ]: When you specify [EQ] for the condition, you can specify only one value. [EQ] is supported for [NAMESPACE_ID], [SERVICE_ID], [STATUS], and [TYPE]. [EQ] is the default condition and can be omitted.
             
             }
           {- [IN]: When you specify [IN] for the condition, you can specify a list of one or more values. [IN] is supported for [STATUS] and [TYPE]. An operation must match one of the specified values to be returned in the response.
              
              }
           {- [BETWEEN]: Specify a start date and an end date in Unix date/time format and Coordinated Universal Time (UTC). The start date must be the first value. [BETWEEN] is supported for [UPDATE_DATE].
              
              }
          
      }
       *)

  values: string list;
  (** 
    Specify values that are applicable to the value that you specify for [Name]:
    
     {ul
          {- {b NAMESPACE_ID}: Specify one namespace ID.
             
             }
           {- {b SERVICE_ID}: Specify one service ID.
              
              }
           {- {b STATUS}: Specify one or more statuses: [SUBMITTED], [PENDING], [SUCCEED], or [FAIL].
              
              }
           {- {b TYPE}: Specify one or more of the following types: [CREATE_NAMESPACE], [DELETE_NAMESPACE], [UPDATE_SERVICE], [REGISTER_INSTANCE], or [DEREGISTER_INSTANCE].
              
              }
           {- {b UPDATE_DATE}: Specify a start date and an end date in Unix date/time format and Coordinated Universal Time (UTC). The start date must be the first value.
              
              }
          
      }
       *)

  name: operation_filter_name;
  (** 
    Specify the operations that you want to get:
    
     {ul
          {- {b NAMESPACE_ID}: Gets operations related to specified namespaces.
             
             }
           {- {b SERVICE_ID}: Gets operations related to specified services.
              
              }
           {- {b STATUS}: Gets operations based on the status of the operations: [SUBMITTED], [PENDING], [SUCCEED], or [FAIL].
              
              }
           {- {b TYPE}: Gets specified types of operation.
              
              }
           {- {b UPDATE_DATE}: Gets operations that changed status during a specified date/time range.
              
              }
          
      }
       *)

}

type list_operations_request = {
  filters: operation_filter list option;
  (** 
    A complex type that contains specifications for the operations that you want to list, for example, operations that you started between a specified start date and end date.
    
     If you specify more than one filter, an operation must match all filters to be returned by [ListOperations].
      *)

  max_results: int option;
  (** 
    The maximum number of items that you want Cloud Map to return in the response to a [ListOperations] request. If you don't specify a value for [MaxResults], Cloud Map returns up to 100 operations.
     *)

  next_token: string option;
  (** 
    For the first [ListOperations] request, omit this value.
    
     If the response contains [NextToken], submit another [ListOperations] request to get the next group of results. Specify the value of [NextToken] from the previous response in the next request.
     
      Cloud Map gets [MaxResults] operations and then filters them based on the specified criteria. It's possible that no operations in the first [MaxResults] operations matched the specified criteria but that subsequent groups of [MaxResults] operations do contain operations that match the criteria.
      
       *)

}

type namespace_type = | HTTP
  | DNS_PRIVATE
  | DNS_PUBLIC

(** 
    A complex type that contains the ID for the Route 53 hosted zone that Cloud Map creates when you create a namespace.
     *)
type dns_properties = {
  so_a: so_a option;
  (** 
    Start of Authority (SOA) record for the hosted zone.
     *)

  hosted_zone_id: string option;
  (** 
    The ID for the Route 53 hosted zone that Cloud Map creates when you create a namespace.
     *)

}

(** 
    A complex type that contains the name of an HTTP namespace.
     *)
type http_properties = {
  http_name: string option;
  (** 
    The name of an HTTP namespace.
     *)

}

(** 
    A complex type that contains information that's specific to the namespace type.
     *)
type namespace_properties = {
  http_properties: http_properties option;
  (** 
    A complex type that contains the name of an HTTP namespace.
     *)

  dns_properties: dns_properties option;
  (** 
    A complex type that contains the ID for the Route 53 hosted zone that Cloud Map creates when you create a namespace.
     *)

}

(** 
    A complex type that contains information about a namespace.
     *)
type namespace_summary = {
  create_date: float option;
  (** 
    The date and time that the namespace was created.
     *)

  properties: namespace_properties option;
  (** 
    The properties of the namespace.
     *)

  service_count: int option;
  (** 
    The number of services that were created using the namespace.
     *)

  description: string option;
  (** 
    A description for the namespace.
     *)

  type_: namespace_type option;
  (** 
    The type of the namespace, either public or private.
     *)

  name: string option;
  (** 
    The name of the namespace. When you create a namespace, Cloud Map automatically creates a Route 53 hosted zone that has the same name as the namespace.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) that Cloud Map assigns to the namespace when you create it.
     *)

  id: string option;
  (** 
    The ID of the namespace.
     *)

}

type list_namespaces_response = {
  next_token: string option;
  (** 
    If the response contains [NextToken], submit another [ListNamespaces] request to get the next group of results. Specify the value of [NextToken] from the previous response in the next request.
    
     Cloud Map gets [MaxResults] namespaces and then filters them based on the specified criteria. It's possible that no namespaces in the first [MaxResults] namespaces matched the specified criteria but that subsequent groups of [MaxResults] namespaces do contain namespaces that match the criteria.
     
      *)

  namespaces: namespace_summary list option;
  (** 
    An array that contains one [NamespaceSummary] object for each namespace that matches the specified filter criteria.
     *)

}

type namespace_filter_name = | HTTP_NAME
  | NAME
  | TYPE

(** 
    A complex type that identifies the namespaces that you want to list. You can choose to list public or private namespaces.
     *)
type namespace_filter = {
  condition: filter_condition option;
  (** 
    Specify the operator that you want to use to determine whether a namespace matches the specified value. Valid values for [Condition] are one of the following.
    
     {ul
          {- [EQ]: When you specify [EQ] for [Condition], you can specify only one value. [EQ] is supported for [TYPE], [NAME], and [HTTP_NAME]. [EQ] is the default condition and can be omitted.
             
             }
           {- [BEGINS_WITH]: When you specify [BEGINS_WITH] for [Condition], you can specify only one value. [BEGINS_WITH] is supported for [TYPE], [NAME], and [HTTP_NAME].
              
              }
          
      }
       *)

  values: string list;
  (** 
    Specify the values that are applicable to the value that you specify for [Name].
    
     {ul
          {- [TYPE]: Specify [HTTP], [DNS_PUBLIC], or [DNS_PRIVATE].
             
             }
           {- [NAME]: Specify the name of the namespace, which is found in [Namespace.Name].
              
              }
           {- [HTTP_NAME]: Specify the HTTP name of the namespace, which is found in [Namespace.Properties.HttpProperties.HttpName].
              
              }
          
      }
       *)

  name: namespace_filter_name;
  (** 
    Specify the namespaces that you want to get using one of the following.
    
     {ul
          {- [TYPE]: Gets the namespaces of the specified type.
             
             }
           {- [NAME]: Gets the namespaces with the specified name.
              
              }
           {- [HTTP_NAME]: Gets the namespaces with the specified HTTP name.
              
              }
          
      }
       *)

}

type list_namespaces_request = {
  filters: namespace_filter list option;
  (** 
    A complex type that contains specifications for the namespaces that you want to list.
    
     If you specify more than one filter, a namespace must match all filters to be returned by [ListNamespaces].
      *)

  max_results: int option;
  (** 
    The maximum number of namespaces that you want Cloud Map to return in the response to a [ListNamespaces] request. If you don't specify a value for [MaxResults], Cloud Map returns up to 100 namespaces.
     *)

  next_token: string option;
  (** 
    For the first [ListNamespaces] request, omit this value.
    
     If the response contains [NextToken], submit another [ListNamespaces] request to get the next group of results. Specify the value of [NextToken] from the previous response in the next request.
     
      Cloud Map gets [MaxResults] namespaces and then filters them based on the specified criteria. It's possible that no namespaces in the first [MaxResults] namespaces matched the specified criteria but that subsequent groups of [MaxResults] namespaces do contain namespaces that match the criteria.
      
       *)

}

(** 
    A complex type that contains information about the instances that you registered by using a specified service.
     *)
type instance_summary = {
  attributes: (string * string) list option;
  (** 
    A string map that contains the following information:
    
     {ul
          {- The attributes that are associated with the instance.
             
             }
           {- For each attribute, the applicable value.
              
              }
          
      }
       Supported attribute keys include the following:
       
        AWS_ALIAS_DNS_NAME For an alias record that routes traffic to an Elastic Load Balancing load balancer, the DNS name that's associated with the load balancer.
                           
                            AWS_EC2_INSTANCE_ID (HTTP namespaces only) The Amazon EC2 instance ID for the instance. When the [AWS_EC2_INSTANCE_ID] attribute is specified, then the [AWS_INSTANCE_IPV4] attribute contains the primary private IPv4 address.
                                                                       
                                                                        AWS_INIT_HEALTH_STATUS 
    If the service configuration includes [HealthCheckCustomConfig], you can optionally use [AWS_INIT_HEALTH_STATUS] to specify the initial status of the custom health check, [HEALTHY] or [UNHEALTHY]. If you don't specify a value for [AWS_INIT_HEALTH_STATUS], the initial status is [HEALTHY].
    
     AWS_INSTANCE_CNAME For a [CNAME] record, the domain name that Route 53 returns in response to DNS queries (for example, [example.com]).
                        
                         AWS_INSTANCE_IPV4 For an [A] record, the IPv4 address that Route 53 returns in response to DNS queries (for example, [192.0.2.44]).
                                           
                                            AWS_INSTANCE_IPV6 For an [AAAA] record, the IPv6 address that Route 53 returns in response to DNS queries (for example, [2001:0db8:85a3:0000:0000:abcd:0001:2345]).
                                                              
                                                               AWS_INSTANCE_PORT 
    For an [SRV] record, the value that Route 53 returns for the port. In addition, if the service includes [HealthCheckConfig], the port on the endpoint that Route 53 sends requests to.
    
     *)

  id: string option;
  (** 
    The ID for an instance that you created by using a specified service.
     *)

}

type list_instances_response = {
  next_token: string option;
  (** 
    If more than [MaxResults] instances match the specified criteria, you can submit another [ListInstances] request to get the next group of results. Specify the value of [NextToken] from the previous response in the next request.
     *)

  instances: instance_summary list option;
  (** 
    Summary information about the instances that are associated with the specified service.
     *)

}

type list_instances_request = {
  max_results: int option;
  (** 
    The maximum number of instances that you want Cloud Map to return in the response to a [ListInstances] request. If you don't specify a value for [MaxResults], Cloud Map returns up to 100 instances.
     *)

  next_token: string option;
  (** 
    For the first [ListInstances] request, omit this value.
    
     If more than [MaxResults] instances match the specified criteria, you can submit another [ListInstances] request to get the next group of results. Specify the value of [NextToken] from the previous response in the next request.
      *)

  service_id: string;
  (** 
    The ID of the service that you want to list instances for.
     *)

}

type get_service_response = {
  service: service option;
  (** 
    A complex type that contains information about the service.
     *)

}

type get_service_request = {
  id: string;
  (** 
    The ID of the service that you want to get settings for.
     *)

}

(** 
    No operation exists with the specified ID.
     *)
type operation_not_found = {
  message: string option;
  
}

type operation_type = | DEREGISTER_INSTANCE
  | REGISTER_INSTANCE
  | UPDATE_SERVICE
  | UPDATE_NAMESPACE
  | DELETE_NAMESPACE
  | CREATE_NAMESPACE

type operation_target_type = | INSTANCE
  | SERVICE
  | NAMESPACE

(** 
    A complex type that contains information about a specified operation.
     *)
type operation = {
  targets: (string * string) list option;
  (** 
    The name of the target entity that's associated with the operation:
    
     NAMESPACE The namespace ID is returned in the [ResourceId] property.
               
                SERVICE The service ID is returned in the [ResourceId] property.
                        
                         INSTANCE The instance ID is returned in the [ResourceId] property.
                                  
                                   *)

  update_date: float option;
  (** 
    The date and time that the value of [Status] changed to the current value, in Unix date/time format and Coordinated Universal Time (UTC). The value of [UpdateDate] is accurate to milliseconds. For example, the value [1516925490.087] represents Friday, January 26, 2018 12:11:30.087 AM.
     *)

  create_date: float option;
  (** 
    The date and time that the request was submitted, in Unix date/time format and Coordinated Universal Time (UTC). The value of [CreateDate] is accurate to milliseconds. For example, the value [1516925490.087] represents Friday, January 26, 2018 12:11:30.087 AM.
     *)

  error_code: string option;
  (** 
    The code associated with [ErrorMessage]. Values for [ErrorCode] include the following:
    
     {ul
          {- [ACCESS_DENIED]
             
             }
           {- [CANNOT_CREATE_HOSTED_ZONE]
              
              }
           {- [EXPIRED_TOKEN]
              
              }
           {- [HOSTED_ZONE_NOT_FOUND]
              
              }
           {- [INTERNAL_FAILURE]
              
              }
           {- [INVALID_CHANGE_BATCH]
              
              }
           {- [THROTTLED_REQUEST]
              
              }
          
      }
       *)

  error_message: string option;
  (** 
    If the value of [Status] is [FAIL], the reason that the operation failed.
     *)

  status: operation_status option;
  (** 
    The status of the operation. Values include the following:
    
     SUBMITTED This is the initial state that occurs immediately after you submit a request.
               
                PENDING Cloud Map is performing the operation.
                        
                         SUCCESS The operation succeeded.
                                 
                                  FAIL The operation failed. For the failure reason, see [ErrorMessage].
                                       
                                        *)

  type_: operation_type option;
  (** 
    The name of the operation that's associated with the specified ID.
     *)

  id: string option;
  (** 
    The ID of the operation that you want to get information about.
     *)

}

type get_operation_response = {
  operation: operation option;
  (** 
    A complex type that contains information about the operation.
     *)

}

type get_operation_request = {
  operation_id: string;
  (** 
    The ID of the operation that you want to get more information about.
     *)

}

(** 
    A complex type that contains information about a specified namespace.
     *)
type namespace = {
  creator_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed requests to be retried without the risk of running an operation twice.
     *)

  create_date: float option;
  (** 
    The date that the namespace was created, in Unix date/time format and Coordinated Universal Time (UTC). The value of [CreateDate] is accurate to milliseconds. For example, the value [1516925490.087] represents Friday, January 26, 2018 12:11:30.087 AM.
     *)

  properties: namespace_properties option;
  (** 
    A complex type that contains information that's specific to the type of the namespace.
     *)

  service_count: int option;
  (** 
    The number of services that are associated with the namespace.
     *)

  description: string option;
  (** 
    The description that you specify for the namespace when you create it.
     *)

  type_: namespace_type option;
  (** 
    The type of the namespace. The methods for discovering instances depends on the value that you specify:
    
     HTTP Instances can be discovered only programmatically, using the Cloud Map [DiscoverInstances] API.
          
           DNS_PUBLIC Instances can be discovered using public DNS queries and using the [DiscoverInstances] API.
                      
                       DNS_PRIVATE Instances can be discovered using DNS queries in VPCs and using the [DiscoverInstances] API.
                                   
                                    *)

  name: string option;
  (** 
    The name of the namespace, such as [example.com].
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) that Cloud Map assigns to the namespace when you create it.
     *)

  id: string option;
  (** 
    The ID of a namespace.
     *)

}

type get_namespace_response = {
  namespace: namespace option;
  (** 
    A complex type that contains information about the specified namespace.
     *)

}

type get_namespace_request = {
  id: string;
  (** 
    The ID of the namespace that you want to get information about.
     *)

}

type health_status = | UNKNOWN
  | UNHEALTHY
  | HEALTHY

type get_instances_health_status_response = {
  next_token: string option;
  (** 
    If more than [MaxResults] instances match the specified criteria, you can submit another [GetInstancesHealthStatus] request to get the next group of results. Specify the value of [NextToken] from the previous response in the next request.
     *)

  status: (string * health_status) list option;
  (** 
    A complex type that contains the IDs and the health status of the instances that you specified in the [GetInstancesHealthStatus] request.
     *)

}

type get_instances_health_status_request = {
  next_token: string option;
  (** 
    For the first [GetInstancesHealthStatus] request, omit this value.
    
     If more than [MaxResults] instances match the specified criteria, you can submit another [GetInstancesHealthStatus] request to get the next group of results. Specify the value of [NextToken] from the previous response in the next request.
      *)

  max_results: int option;
  (** 
    The maximum number of instances that you want Cloud Map to return in the response to a [GetInstancesHealthStatus] request. If you don't specify a value for [MaxResults], Cloud Map returns up to 100 instances.
     *)

  instances: string list option;
  (** 
    An array that contains the IDs of all the instances that you want to get the health status for.
    
     If you omit [Instances], Cloud Map returns the health status for all the instances that are associated with the specified service.
     
      To get the IDs for the instances that you've registered by using a specified service, submit a {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_ListInstances.html}ListInstances} request.
      
       *)

  service_id: string;
  (** 
    The ID of the service that the instance is associated with.
     *)

}

(** 
    A complex type that contains information about an instance that Cloud Map creates when you submit a [RegisterInstance] request.
     *)
type instance = {
  attributes: (string * string) list option;
  (** 
    A string map that contains the following information for the service that you specify in [ServiceId]:
    
     {ul
          {- The attributes that apply to the records that are defined in the service.
             
             }
           {- For each attribute, the applicable value.
              
              }
          
      }
       Do not include sensitive information in the attributes if the namespace is discoverable by public DNS queries.
       
        Supported attribute keys include the following:
        
         AWS_ALIAS_DNS_NAME If you want Cloud Map to create a Route 53 alias record that routes traffic to an Elastic Load Balancing load balancer, specify the DNS name that's associated with the load balancer. For information about how to get the DNS name, see {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html#Route53-Type-AliasTarget-DNSName}AliasTarget->DNSName} in the {i Route 53 API Reference}.
                            
                             Note the following:
                             
                              {ul
                                   {- The configuration for the service that's specified by [ServiceId] must include settings for an [A] record, an [AAAA] record, or both.
                                      
                                      }
                                    {- In the service that's specified by [ServiceId], the value of [RoutingPolicy] must be [WEIGHTED].
                                       
                                       }
                                    {- If the service that's specified by [ServiceId] includes [HealthCheckConfig] settings, Cloud Map creates the health check, but it won't associate the health check with the alias record.
                                       
                                       }
                                    {- Auto naming currently doesn't support creating alias records that route traffic to Amazon Web Services resources other than ELB load balancers.
                                       
                                       }
                                    {- If you specify a value for [AWS_ALIAS_DNS_NAME], don't specify values for any of the [AWS_INSTANCE] attributes.
                                       
                                       }
                                   
      }
       AWS_EC2_INSTANCE_ID {i HTTP namespaces only.} The Amazon EC2 instance ID for the instance. The [AWS_INSTANCE_IPV4] attribute contains the primary private IPv4 address.
                           
                            AWS_INIT_HEALTH_STATUS If the service configuration includes [HealthCheckCustomConfig], you can optionally use [AWS_INIT_HEALTH_STATUS] to specify the initial status of the custom health check, [HEALTHY] or [UNHEALTHY]. If you don't specify a value for [AWS_INIT_HEALTH_STATUS], the initial status is [HEALTHY].
                                                   
                                                    AWS_INSTANCE_CNAME If the service configuration includes a [CNAME] record, the domain name that you want Route 53 to return in response to DNS queries (for example, [example.com]).
                                                                       
                                                                        This value is required if the service specified by [ServiceId] includes settings for an [CNAME] record.
                                                                        
                                                                         AWS_INSTANCE_IPV4 
    If the service configuration includes an [A] record, the IPv4 address that you want Route 53 to return in response to DNS queries (for example, [192.0.2.44]).
    
     This value is required if the service specified by [ServiceId] includes settings for an [A] record. If the service includes settings for an [SRV] record, you must specify a value for [AWS_INSTANCE_IPV4], [AWS_INSTANCE_IPV6], or both.
     
      AWS_INSTANCE_IPV6 If the service configuration includes an [AAAA] record, the IPv6 address that you want Route 53 to return in response to DNS queries (for example, [2001:0db8:85a3:0000:0000:abcd:0001:2345]).
                        
                         This value is required if the service specified by [ServiceId] includes settings for an [AAAA] record. If the service includes settings for an [SRV] record, you must specify a value for [AWS_INSTANCE_IPV4], [AWS_INSTANCE_IPV6], or both.
                         
                          AWS_INSTANCE_PORT If the service includes an [SRV] record, the value that you want Route 53 to return for the port.
                                            
                                             If the service includes [HealthCheckConfig], the port on the endpoint that you want Route 53 to send requests to.
                                             
                                              This value is required if you specified settings for an [SRV] record or a Route 53 health check when you created the service.
                                              
                                               *)

  creator_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed [RegisterInstance] requests to be retried without the risk of executing the operation twice. You must use a unique [CreatorRequestId] string every time you submit a [RegisterInstance] request if you're registering additional instances for the same namespace and service. [CreatorRequestId] can be any unique string (for example, a date/time stamp).
     *)

  id: string;
  (** 
    An identifier that you want to associate with the instance. Note the following:
    
     {ul
          {- If the service that's specified by [ServiceId] includes settings for an [SRV] record, the value of [InstanceId] is automatically included as part of the value for the [SRV] record. For more information, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_DnsRecord.html#cloudmap-Type-DnsRecord-Type}DnsRecord > Type}.
             
             }
           {- You can use this value to update an existing instance.
              
              }
           {- To register a new instance, you must specify a value that's unique among instances that you register by using the same service.
              
              }
           {- If you specify an existing [InstanceId] and [ServiceId], Cloud Map updates the existing DNS records. If there's also an existing health check, Cloud Map deletes the old health check and creates a new one.
              
               The health check isn't deleted immediately, so it will still appear for a while if you submit a [ListHealthChecks] request, for example.
               
               }
          
      }
       *)

}

type get_instance_response = {
  instance: instance option;
  (** 
    A complex type that contains information about a specified instance.
     *)

}

type get_instance_request = {
  instance_id: string;
  (** 
    The ID of the instance that you want to get information about.
     *)

  service_id: string;
  (** 
    The ID of the service that the instance is associated with.
     *)

}

(** 
    The operation can't be completed because you've reached the quota for the number of requests. For more information, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/throttling.html}Cloud Map API request throttling quota} in the {i Cloud Map Developer Guide}.
     *)
type request_limit_exceeded = {
  message: string option;
  
}

type discover_instances_revision_response = {
  instances_revision: int option;
  (** 
    The increasing revision associated to the response Instances list. If a new instance is registered or deregistered, the [InstancesRevision] updates. The health status updates don't update [InstancesRevision].
     *)

}

type discover_instances_revision_request = {
  service_name: string;
  (** 
    The name of the service that you specified when you registered the instance.
     *)

  namespace_name: string;
  (** 
    The [HttpName] name of the namespace. It's found in the [HttpProperties] member of the [Properties] member of the namespace.
     *)

}

(** 
    In a response to a {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html}DiscoverInstances} request, [HttpInstanceSummary] contains information about one instance that matches the values that you specified in the request.
     *)
type http_instance_summary = {
  attributes: (string * string) list option;
  (** 
    If you included any attributes when you registered the instance, the values of those attributes.
     *)

  health_status: health_status option;
  (** 
    If you configured health checking in the service, the current health status of the service instance.
     *)

  service_name: string option;
  (** 
    The name of the service that you specified when you registered the instance.
     *)

  namespace_name: string option;
  (** 
    [] [] []
    
     The [HttpName] name of the namespace. It's found in the [HttpProperties] member of the [Properties] member of the namespace.
      *)

  instance_id: string option;
  (** 
    The ID of an instance that matches the values that you specified in the request.
     *)

}

type discover_instances_response = {
  instances_revision: int option;
  (** 
    The increasing revision associated to the response Instances list. If a new instance is registered or deregistered, the [InstancesRevision] updates. The health status updates don't update [InstancesRevision].
     *)

  instances: http_instance_summary list option;
  (** 
    A complex type that contains one [HttpInstanceSummary] for each registered instance.
     *)

}

type health_status_filter = | HEALTHY_OR_ELSE_ALL
  | ALL
  | UNHEALTHY
  | HEALTHY

type discover_instances_request = {
  health_status: health_status_filter option;
  (** 
    The health status of the instances that you want to discover. This parameter is ignored for services that don't have a health check configured, and all instances are returned.
    
     HEALTHY Returns healthy instances.
             
              UNHEALTHY Returns unhealthy instances.
                        
                         ALL Returns all instances.
                             
                              HEALTHY_OR_ELSE_ALL Returns healthy instances, unless none are reporting a healthy state. In that case, return all instances. This is also called failing open.
                                                  
                                                   *)

  optional_parameters: (string * string) list option;
  (** 
    Opportunistic filters to scope the results based on custom attributes. If there are instances that match both the filters specified in both the [QueryParameters] parameter and this parameter, all of these instances are returned. Otherwise, the filters are ignored, and only instances that match the filters that are specified in the [QueryParameters] parameter are returned.
     *)

  query_parameters: (string * string) list option;
  (** 
    Filters to scope the results based on custom attributes for the instance (for example, [{version=v1, az=1a}]). Only instances that match all the specified key-value pairs are returned.
     *)

  max_results: int option;
  (** 
    The maximum number of instances that you want Cloud Map to return in the response to a [DiscoverInstances] request. If you don't specify a value for [MaxResults], Cloud Map returns up to 100 instances.
     *)

  service_name: string;
  (** 
    The name of the service that you specified when you registered the instance.
     *)

  namespace_name: string;
  (** 
    The [HttpName] name of the namespace. It's found in the [HttpProperties] member of the [Properties] member of the namespace. In most cases, [Name] and [HttpName] match. However, if you reuse [Name] for namespace creation, a generated hash is added to [HttpName] to distinguish the two.
     *)

}

type deregister_instance_response = {
  operation_id: string option;
  (** 
    A value that you can use to determine whether the request completed successfully. To get the status of the operation, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.
     *)

}

type deregister_instance_request = {
  instance_id: string;
  (** 
    The value that you specified for [Id] in the {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance} request.
     *)

  service_id: string;
  (** 
    The ID of the service that the instance is associated with.
     *)

}

type delete_service_response = unit

type delete_service_request = {
  id: string;
  (** 
    The ID of the service that you want to delete.
     *)

}

type delete_namespace_response = {
  operation_id: string option;
  (** 
    A value that you can use to determine whether the request completed successfully. To get the status of the operation, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.
     *)

}

type delete_namespace_request = {
  id: string;
  (** 
    The ID of the namespace that you want to delete.
     *)

}

type create_service_response = {
  service: service option;
  (** 
    A complex type that contains information about the new service.
     *)

}

type create_service_request = {
  type_: service_type_option option;
  (** 
    If present, specifies that the service instances are only discoverable using the [DiscoverInstances] API operation. No DNS records is registered for the service instances. The only valid value is [HTTP].
     *)

  tags: tag list option;
  (** 
    The tags to add to the service. Each tag consists of a key and an optional value that you define. Tags keys can be up to 128 characters in length, and tag values can be up to 256 characters in length.
     *)

  health_check_custom_config: health_check_custom_config option;
  (** 
    A complex type that contains information about an optional custom health check.
    
     If you specify a health check configuration, you can specify either [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.
     
      You can't add, update, or delete a [HealthCheckCustomConfig] configuration from an existing service.
       *)

  health_check_config: health_check_config option;
  (** 
    {i Public DNS and HTTP namespaces only.} A complex type that contains settings for an optional Route 53 health check. If you specify settings for a health check, Cloud Map associates the health check with all the Route 53 DNS records that you specify in [DnsConfig].
    
     If you specify a health check configuration, you can specify either [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.
     
      For information about the charges for health checks, see {{:http://aws.amazon.com/cloud-map/pricing/}Cloud Map Pricing}.
       *)

  dns_config: dns_config option;
  (** 
    A complex type that contains information about the Amazon Route 53 records that you want Cloud Map to create when you register an instance.
     *)

  description: string option;
  (** 
    A description for the service.
     *)

  creator_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed [CreateService] requests to be retried without the risk of running the operation twice. [CreatorRequestId] can be any unique string (for example, a date/timestamp).
     *)

  namespace_id: string option;
  (** 
    The ID of the namespace that you want to use to create the service. The namespace ID must be specified, but it can be specified either here or in the [DnsConfig] object.
     *)

  name: string;
  (** 
    The name that you want to assign to the service.
    
     Do not include sensitive information in the name if the namespace is discoverable by public DNS queries.
     
      If you want Cloud Map to create an [SRV] record when you register an instance and you're using a system that requires a specific [SRV] format, such as {{:http://www.haproxy.org/}HAProxy}, specify the following for [Name]:
      
       {ul
            {- Start the name with an underscore (_), such as [_exampleservice].
               
               }
             {- End the name with {i ._protocol}, such as [._tcp].
                
                }
            
      }
       When you register an instance, Cloud Map creates an [SRV] record and assigns a name to the record by concatenating the service name and the namespace name (for example,
       
        [_exampleservice._tcp.example.com]).
        
         For services that are accessible by DNS queries, you can't create multiple services with names that differ only by case (such as EXAMPLE and example). Otherwise, these services have the same DNS name and can't be distinguished. However, if you use a namespace that's only accessible by API calls, then you can create services that with names that differ only by case.
         
          *)

}

(** 
    The namespace that you're trying to create already exists.
     *)
type namespace_already_exists = {
  namespace_id: string option;
  (** 
    The ID of the existing namespace.
     *)

  creator_request_id: string option;
  (** 
    The [CreatorRequestId] that was used to create the namespace.
     *)

  message: string option;
  
}

type create_public_dns_namespace_response = {
  operation_id: string option;
  (** 
    A value that you can use to determine whether the request completed successfully. To get the status of the operation, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.
     *)

}

(** 
    DNS properties for the public DNS namespace.
     *)
type public_dns_properties_mutable = {
  so_a: so_a;
  (** 
    Start of Authority (SOA) record for the hosted zone for the public DNS namespace.
     *)

}

(** 
    DNS properties for the public DNS namespace.
     *)
type public_dns_namespace_properties = {
  dns_properties: public_dns_properties_mutable;
  (** 
    DNS properties for the public DNS namespace.
     *)

}

type create_public_dns_namespace_request = {
  properties: public_dns_namespace_properties option;
  (** 
    Properties for the public DNS namespace.
     *)

  tags: tag list option;
  (** 
    The tags to add to the namespace. Each tag consists of a key and an optional value that you define. Tags keys can be up to 128 characters in length, and tag values can be up to 256 characters in length.
     *)

  description: string option;
  (** 
    A description for the namespace.
     *)

  creator_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed [CreatePublicDnsNamespace] requests to be retried without the risk of running the operation twice. [CreatorRequestId] can be any unique string (for example, a date/timestamp).
     *)

  name: string;
  (** 
    The name that you want to assign to this namespace.
    
     Do not include sensitive information in the name. The name is publicly available using DNS queries.
     
      *)

}

type create_private_dns_namespace_response = {
  operation_id: string option;
  (** 
    A value that you can use to determine whether the request completed successfully. To get the status of the operation, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.
     *)

}

(** 
    DNS properties for the private DNS namespace.
     *)
type private_dns_properties_mutable = {
  so_a: so_a;
  (** 
    Fields for the Start of Authority (SOA) record for the hosted zone for the private DNS namespace.
     *)

}

(** 
    DNS properties for the private DNS namespace.
     *)
type private_dns_namespace_properties = {
  dns_properties: private_dns_properties_mutable;
  (** 
    DNS properties for the private DNS namespace.
     *)

}

type create_private_dns_namespace_request = {
  properties: private_dns_namespace_properties option;
  (** 
    Properties for the private DNS namespace.
     *)

  tags: tag list option;
  (** 
    The tags to add to the namespace. Each tag consists of a key and an optional value that you define. Tags keys can be up to 128 characters in length, and tag values can be up to 256 characters in length.
     *)

  vpc: string;
  (** 
    The ID of the Amazon VPC that you want to associate the namespace with.
     *)

  description: string option;
  (** 
    A description for the namespace.
     *)

  creator_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed [CreatePrivateDnsNamespace] requests to be retried without the risk of running the operation twice. [CreatorRequestId] can be any unique string (for example, a date/timestamp).
     *)

  name: string;
  (** 
    The name that you want to assign to this namespace. When you create a private DNS namespace, Cloud Map automatically creates an Amazon Route 53 private hosted zone that has the same name as the namespace.
     *)

}

type create_http_namespace_response = {
  operation_id: string option;
  (** 
    A value that you can use to determine whether the request completed successfully. To get the status of the operation, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.
     *)

}

type create_http_namespace_request = {
  tags: tag list option;
  (** 
    The tags to add to the namespace. Each tag consists of a key and an optional value that you define. Tags keys can be up to 128 characters in length, and tag values can be up to 256 characters in length.
     *)

  description: string option;
  (** 
    A description for the namespace.
     *)

  creator_request_id: string option;
  (** 
    A unique string that identifies the request and that allows failed [CreateHttpNamespace] requests to be retried without the risk of running the operation twice. [CreatorRequestId] can be any unique string (for example, a date/time stamp).
     *)

  name: string;
  (** 
    The name that you want to assign to this namespace.
     *)

}

(** 
    Cloud Map With Cloud Map, you can configure public DNS, private DNS, or HTTP namespaces that your microservice applications run in. When an instance becomes available, you can call the Cloud Map API to register the instance with Cloud Map. For public or private DNS namespaces, Cloud Map automatically creates DNS records and an optional health check. Clients that submit public or private DNS queries, or HTTP requests, for the service receive an answer that contains up to eight healthy records.
               *)


type base_document = Json.t

