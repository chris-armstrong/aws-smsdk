(** 
    Shield client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

type validation_exception_reason = | OTHER
  | FIELD_VALIDATION_FAILED

(** 
    Provides information about a particular parameter passed inside a request that resulted in an exception.
     *)
type validation_exception_field = {
  message: string;
  (** 
    The message describing why the parameter failed validation.
     *)

  name: string;
  (** 
    The name of the parameter that failed validation.
     *)

}

type update_subscription_response = unit

type auto_renew = | DISABLED
  | ENABLED

type update_subscription_request = {
  auto_renew: auto_renew option;
  (** 
    When you initally create a subscription, [AutoRenew] is set to [ENABLED]. If [ENABLED], the subscription will be automatically renewed at the end of the existing subscription period. You can change this by submitting an [UpdateSubscription] request. If the [UpdateSubscription] request does not included a value for [AutoRenew], the existing value for [AutoRenew] remains unchanged.
     *)

}

(** 
    Exception indicating the specified resource does not exist. If available, this exception includes details in additional properties.
     *)
type resource_not_found_exception = {
  resource_type: string option;
  (** 
    Type of resource.
     *)

  message: string option;
  
}

(** 
    Exception that indicates that the resource state has been modified by another client. Retrieve the resource and then retry your request.
     *)
type optimistic_lock_exception = {
  message: string option;
  
}

(** 
    You are trying to update a subscription that has not yet completed the 1-year commitment. You can change the [AutoRenew] parameter during the last 30 days of your subscription. This exception indicates that you are attempting to change [AutoRenew] prior to that period.
     *)
type locked_subscription_exception = {
  message: string option;
  
}

(** 
    Exception that indicates that the parameters passed to the API are invalid. If available, this exception includes details in additional properties.
     *)
type invalid_parameter_exception = {
  fields: validation_exception_field list option;
  (** 
    Fields that caused the exception.
     *)

  reason: validation_exception_reason option;
  (** 
    Additional information about the exception.
     *)

  message: string option;
  
}

(** 
    Exception that indicates that a problem occurred with the service infrastructure. You can retry the request.
     *)
type internal_error_exception = {
  message: string option;
  
}

type update_protection_group_response = unit

type protection_group_aggregation = | MAX
  | MEAN
  | SUM

type protection_group_pattern = | BY_RESOURCE_TYPE
  | ARBITRARY
  | ALL

type protected_resource_type = | GLOBAL_ACCELERATOR
  | APPLICATION_LOAD_BALANCER
  | CLASSIC_LOAD_BALANCER
  | ELASTIC_IP_ALLOCATION
  | ROUTE_53_HOSTED_ZONE
  | CLOUDFRONT_DISTRIBUTION

type update_protection_group_request = {
  members: string list option;
  (** 
    The Amazon Resource Names (ARNs) of the resources to include in the protection group. You must set this when you set [Pattern] to [ARBITRARY] and you must not set it for any other [Pattern] setting.
     *)

  resource_type: protected_resource_type option;
  (** 
    The resource type to include in the protection group. All protected resources of this type are included in the protection group. You must set this when you set [Pattern] to [BY_RESOURCE_TYPE] and you must not set it for any other [Pattern] setting.
     *)

  pattern: protection_group_pattern;
  (** 
    The criteria to use to choose the protected resources for inclusion in the group. You can include all resources that have protections, provide a list of resource Amazon Resource Names (ARNs), or include all resources of a specified resource type.
     *)

  aggregation: protection_group_aggregation;
  (** 
    Defines how Shield combines resource data for the group in order to detect, mitigate, and report events.
    
     {ul
          {- Sum - Use the total traffic across the group. This is a good choice for most cases. Examples include Elastic IP addresses for EC2 instances that scale manually or automatically.
             
             }
           {- Mean - Use the average of the traffic across the group. This is a good choice for resources that share traffic uniformly. Examples include accelerators and load balancers.
              
              }
           {- Max - Use the highest traffic from each resource. This is useful for resources that don't share traffic and for resources that share that traffic in a non-uniform way. Examples include Amazon CloudFront distributions and origin resources for CloudFront distributions.
              
              }
          
      }
       *)

  protection_group_id: string;
  (** 
    The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it.
     *)

}

type update_emergency_contact_settings_response = unit

(** 
    Contact information that the SRT can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.
     *)
type emergency_contact = {
  contact_notes: string option;
  (** 
    Additional notes regarding the contact.
     *)

  phone_number: string option;
  (** 
    The phone number for the contact.
     *)

  email_address: string;
  (** 
    The email address for the contact.
     *)

}

type update_emergency_contact_settings_request = {
  emergency_contact_list: emergency_contact list option;
  (** 
    A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.
    
     If you have proactive engagement enabled, the contact list must include at least one phone number.
      *)

}

type update_application_layer_automatic_response_response = unit

[@@ocaml.doc {| 
    Specifies that Shield Advanced should configure its WAF rules with the WAF [Block] action.
    
     This is only used in the context of the [ResponseAction] setting.
     
      JSON specification: ["Block": {}]
       |}]
type block_action = unit

[@@ocaml.doc {| 
    Specifies that Shield Advanced should configure its WAF rules with the WAF [Count] action.
    
     This is only used in the context of the [ResponseAction] setting.
     
      JSON specification: ["Count": {}]
       |}]
type count_action = unit

(** 
    Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on behalf of the protected resource in response to DDoS attacks. You specify this as part of the configuration for the automatic application layer DDoS mitigation feature, when you enable or update automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group, inside the web ACL that you have associated with the resource.
     *)
type response_action = {
  count: count_action option;
  (** 
    Specifies that Shield Advanced should configure its WAF rules with the WAF [Count] action.
    
     You must specify exactly one action, either [Block] or [Count].
      *)

  block: block_action option;
  (** 
    Specifies that Shield Advanced should configure its WAF rules with the WAF [Block] action.
    
     You must specify exactly one action, either [Block] or [Count].
      *)

}

type update_application_layer_automatic_response_request = {
  action: response_action;
  (** 
    Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on behalf of the protected resource in response to DDoS attacks. You specify this as part of the configuration for the automatic application layer DDoS mitigation feature, when you enable or update automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group, inside the web ACL that you have associated with the resource.
     *)

  resource_arn: string;
  (** 
    The ARN (Amazon Resource Name) of the resource.
     *)

}

(** 
    Exception that indicates that the operation would not cause any change to occur.
     *)
type invalid_operation_exception = {
  message: string option;
  
}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  (** 
    The tag key for each tag that you want to remove from the resource.
     *)

  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the resource that you want to remove tags from.
     *)

}

(** 
    Exception that indicates that the resource is invalid. You might not have access to the resource, or the resource might not exist.
     *)
type invalid_resource_exception = {
  message: string option;
  
}

type unit_ = | REQUESTS
  | PACKETS
  | BYTES
  | BITS

(** 
    A contributor to the attack and their contribution.
     *)
type contributor = {
  value: int option;
  (** 
    The contribution of this contributor expressed in [Protection] units. For example [10,000].
     *)

  name: string option;
  (** 
    The name of the contributor. The type of name that you'll find here depends on the [AttackPropertyIdentifier] setting in the [AttackProperty] where this contributor is defined. For example, if the [AttackPropertyIdentifier] is [SOURCE_COUNTRY], the [Name] could be [United States].
     *)

}

(** 
    The time range.
     *)
type time_range = {
  to_exclusive: float option;
  (** 
    The end time, in Unix time in seconds.
     *)

  from_inclusive: float option;
  (** 
    The start time, in Unix time in seconds.
     *)

}

type tag_resource_response = unit

[@@ocaml.doc {| 
    A tag associated with an Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing or other management. Typically, the tag key represents a category, such as "environment", and the tag value represents a specific value within that category, such as "test," "development," or "production". Or you might set the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.
     |}]
type tag = {
  value: string option;
  [@ocaml.doc {| 
    Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value within a category, such as "companyA" or "companyB." Tag values are case-sensitive.
     |}]

  key: string option;
  [@ocaml.doc {| 
    Part of the key:value pair that defines a tag. You can use a tag key to describe a category of information, such as "customer." Tag keys are case-sensitive.
     |}]

}

type tag_resource_request = {
  tags: tag list;
  (** 
    The tags that you want to modify or add to the resource.
     *)

  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the resource that you want to add or update tags for.
     *)

}

(** 
    The counter that describes a DDoS attack.
     *)
type summarized_counter = {
  unit_: string option;
  (** 
    The unit of the counters.
     *)

  n: int option;
  (** 
    The number of counters for a specified time period.
     *)

  sum: float option;
  (** 
    The total of counter values for a specified time period.
     *)

  average: float option;
  (** 
    The average value of the counter for a specified time period.
     *)

  max: float option;
  (** 
    The maximum value of the counter for a specified time period.
     *)

  name: string option;
  (** 
    The counter name.
     *)

}

(** 
    A summary of information about the attack.
     *)
type summarized_attack_vector = {
  vector_counters: summarized_counter list option;
  (** 
    The list of counters that describe the details of the attack.
     *)

  vector_type: string;
  (** 
    The attack type, for example, SNMP reflection or SYN flood.
     *)

}

type subscription_state = | INACTIVE
  | ACTIVE

(** 
    Specifies how many protections of a given type you can create.
     *)
type limit = {
  max: int option;
  (** 
    The maximum number of protections that can be created for the specified [Type].
     *)

  type_: string option;
  (** 
    The type of protection.
     *)

}

(** 
    Limits settings on protections for your subscription.
     *)
type protection_limits = {
  protected_resource_type_limits: limit list;
  (** 
    The maximum number of resource types that you can specify in a protection.
     *)

}

(** 
    Limits settings on protection groups with arbitrary pattern type.
     *)
type protection_group_arbitrary_pattern_limits = {
  max_members: int;
  (** 
    The maximum number of resources you can specify for a single arbitrary pattern in a protection group.
     *)

}

(** 
    Limits settings by pattern type in the protection groups for your subscription.
     *)
type protection_group_pattern_type_limits = {
  arbitrary_pattern_limits: protection_group_arbitrary_pattern_limits;
  (** 
    Limits settings on protection groups with arbitrary pattern type.
     *)

}

(** 
    Limits settings on protection groups for your subscription.
     *)
type protection_group_limits = {
  pattern_type_limits: protection_group_pattern_type_limits;
  (** 
    Limits settings by pattern type in the protection groups for your subscription.
     *)

  max_protection_groups: int;
  (** 
    The maximum number of protection groups that you can have at one time.
     *)

}

(** 
    Limits settings for your subscription.
     *)
type subscription_limits = {
  protection_group_limits: protection_group_limits;
  (** 
    Limits settings on protection groups for your subscription.
     *)

  protection_limits: protection_limits;
  (** 
    Limits settings on protections for your subscription.
     *)

}

type proactive_engagement_status = | PENDING
  | DISABLED
  | ENABLED

(** 
    Information about the Shield Advanced subscription for an account.
     *)
type subscription = {
  subscription_arn: string option;
  (** 
    The ARN (Amazon Resource Name) of the subscription.
     *)

  subscription_limits: subscription_limits;
  (** 
    Limits settings for your subscription.
     *)

  proactive_engagement_status: proactive_engagement_status option;
  (** 
    If [ENABLED], the Shield Response Team (SRT) will use email and phone to notify contacts about escalations to the SRT and to initiate proactive customer support.
    
     If [PENDING], you have requested proactive engagement and the request is pending. The status changes to [ENABLED] when your request is fully processed.
     
      If [DISABLED], the SRT will not proactively notify contacts about escalations or to initiate proactive customer support.
       *)

  limits: limit list option;
  (** 
    Specifies how many protections of a given type you can create.
     *)

  auto_renew: auto_renew option;
  (** 
    If [ENABLED], the subscription will be automatically renewed at the end of the existing subscription period.
    
     When you initally create a subscription, [AutoRenew] is set to [ENABLED]. You can change this by submitting an [UpdateSubscription] request. If the [UpdateSubscription] request does not included a value for [AutoRenew], the existing value for [AutoRenew] remains unchanged.
      *)

  time_commitment_in_seconds: int option;
  (** 
    The length, in seconds, of the Shield Advanced subscription for the account.
     *)

  end_time: float option;
  (** 
    The date and time your subscription will end.
     *)

  start_time: float option;
  (** 
    The start time of the subscription, in Unix time in seconds.
     *)

}

type sub_resource_type = | URL
  | IP

(** 
    The attack information for the specified SubResource.
     *)
type sub_resource_summary = {
  counters: summarized_counter list option;
  (** 
    The counters that describe the details of the attack.
     *)

  attack_vectors: summarized_attack_vector list option;
  (** 
    The list of attack types and associated counters.
     *)

  id: string option;
  (** 
    The unique identifier (ID) of the [SubResource].
     *)

  type_: sub_resource_type option;
  (** 
    The [SubResource] type.
     *)

}

(** 
    Exception indicating the specified resource already exists. If available, this exception includes details in additional properties.
     *)
type resource_already_exists_exception = {
  resource_type: string option;
  (** 
    The type of resource that already exists.
     *)

  message: string option;
  
}

type application_layer_automatic_response_status = | DISABLED
  | ENABLED

(** 
    The automatic application layer DDoS mitigation settings for a [Protection]. This configuration determines whether Shield Advanced automatically manages rules in the web ACL in order to respond to application layer events that Shield Advanced determines to be DDoS attacks.
     *)
type application_layer_automatic_response_configuration = {
  action: response_action;
  (** 
    Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on behalf of the protected resource in response to DDoS attacks. You specify this as part of the configuration for the automatic application layer DDoS mitigation feature, when you enable or update automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group, inside the web ACL that you have associated with the resource.
     *)

  status: application_layer_automatic_response_status;
  (** 
    Indicates whether automatic application layer DDoS mitigation is enabled for the protection.
     *)

}

(** 
    An object that represents a resource that is under DDoS protection.
     *)
type protection = {
  application_layer_automatic_response_configuration: application_layer_automatic_response_configuration option;
  (** 
    The automatic application layer DDoS mitigation settings for the protection. This configuration determines whether Shield Advanced automatically manages rules in the web ACL in order to respond to application layer events that Shield Advanced determines to be DDoS attacks.
     *)

  protection_arn: string option;
  (** 
    The ARN (Amazon Resource Name) of the protection.
     *)

  health_check_ids: string list option;
  (** 
    The unique identifier (ID) for the Route 53 health check that's associated with the protection.
     *)

  resource_arn: string option;
  (** 
    The ARN (Amazon Resource Name) of the Amazon Web Services resource that is protected.
     *)

  name: string option;
  (** 
    The name of the protection. For example, [My CloudFront distributions].
     *)

  id: string option;
  (** 
    The unique identifier (ID) of the protection.
     *)

}

(** 
    A grouping of protected resources that you and Shield Advanced can monitor as a collective. This resource grouping improves the accuracy of detection and reduces false positives.
     *)
type protection_group = {
  protection_group_arn: string option;
  (** 
    The ARN (Amazon Resource Name) of the protection group.
     *)

  members: string list;
  (** 
    The ARNs (Amazon Resource Names) of the resources to include in the protection group. You must set this when you set [Pattern] to [ARBITRARY] and you must not set it for any other [Pattern] setting.
     *)

  resource_type: protected_resource_type option;
  (** 
    The resource type to include in the protection group. All protected resources of this type are included in the protection group. You must set this when you set [Pattern] to [BY_RESOURCE_TYPE] and you must not set it for any other [Pattern] setting.
     *)

  pattern: protection_group_pattern;
  (** 
    The criteria to use to choose the protected resources for inclusion in the group. You can include all resources that have protections, provide a list of resource ARNs (Amazon Resource Names), or include all resources of a specified resource type.
     *)

  aggregation: protection_group_aggregation;
  (** 
    Defines how Shield combines resource data for the group in order to detect, mitigate, and report events.
    
     {ul
          {- Sum - Use the total traffic across the group. This is a good choice for most cases. Examples include Elastic IP addresses for EC2 instances that scale manually or automatically.
             
             }
           {- Mean - Use the average of the traffic across the group. This is a good choice for resources that share traffic uniformly. Examples include accelerators and load balancers.
              
              }
           {- Max - Use the highest traffic from each resource. This is useful for resources that don't share traffic and for resources that share that traffic in a non-uniform way. Examples include Amazon CloudFront distributions and origin resources for CloudFront distributions.
              
              }
          
      }
       *)

  protection_group_id: string;
  (** 
    The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it.
     *)

}

(** 
    The ARN of the role that you specified does not exist.
     *)
type no_associated_role_exception = {
  message: string option;
  
}

(** 
    The mitigation applied to a DDoS attack.
     *)
type mitigation = {
  mitigation_name: string option;
  (** 
    The name of the mitigation taken for this attack.
     *)

}

type list_tags_for_resource_response = {
  tags: tag list option;
  (** 
    A list of tag key and value pairs associated with the specified resource.
     *)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  (** 
    The Amazon Resource Name (ARN) of the resource to get tags for.
     *)

}

type list_resources_in_protection_group_response = {
  next_token: string option;
  (** 
    When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request.
    
     You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.
     
      Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.
       *)

  resource_arns: string list;
  (** 
    The Amazon Resource Names (ARNs) of the resources that are included in the protection group.
     *)

}

type list_resources_in_protection_group_request = {
  max_results: int option;
  (** 
    The greatest number of objects that you want Shield Advanced to return to the list request. Shield Advanced might return fewer objects than you indicate in this setting, even if more objects are available. If there are more objects remaining, Shield Advanced will always also return a [NextToken] value in the response.
    
     The default setting is 20.
      *)

  next_token: string option;
  (** 
    When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request.
    
     You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.
     
      Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.
      
       On your first call to a list operation, leave this setting empty.
        *)

  protection_group_id: string;
  (** 
    The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it.
     *)

}

(** 
    Exception that indicates that the [NextToken] specified in the request is invalid. Submit the request using the [NextToken] value that was returned in the prior response.
     *)
type invalid_pagination_token_exception = {
  message: string option;
  
}

type list_protections_response = {
  next_token: string option;
  (** 
    When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request.
    
     You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.
     
      Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.
       *)

  protections: protection list option;
  (** 
    The array of enabled [Protection] objects.
     *)

}

(** 
    Narrows the set of protections that the call retrieves. You can retrieve a single protection by providing its name or the ARN (Amazon Resource Name) of its protected resource. You can also retrieve all protections for a specific resource type. You can provide up to one criteria per filter type. Shield Advanced returns protections that exactly match all of the filter criteria that you provide.
     *)
type inclusion_protection_filters = {
  resource_types: protected_resource_type list option;
  (** 
    The type of protected resource whose protections you want to retrieve.
     *)

  protection_names: string list option;
  (** 
    The name of the protection that you want to retrieve.
     *)

  resource_arns: string list option;
  (** 
    The ARN (Amazon Resource Name) of the resource whose protection you want to retrieve.
     *)

}

type list_protections_request = {
  inclusion_filters: inclusion_protection_filters option;
  (** 
    Narrows the set of protections that the call retrieves. You can retrieve a single protection by providing its name or the ARN (Amazon Resource Name) of its protected resource. You can also retrieve all protections for a specific resource type. You can provide up to one criteria per filter type. Shield Advanced returns protections that exactly match all of the filter criteria that you provide.
     *)

  max_results: int option;
  (** 
    The greatest number of objects that you want Shield Advanced to return to the list request. Shield Advanced might return fewer objects than you indicate in this setting, even if more objects are available. If there are more objects remaining, Shield Advanced will always also return a [NextToken] value in the response.
    
     The default setting is 20.
      *)

  next_token: string option;
  (** 
    When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request.
    
     You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.
     
      Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.
      
       On your first call to a list operation, leave this setting empty.
        *)

}

type list_protection_groups_response = {
  next_token: string option;
  (** 
    When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request.
    
     You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.
     
      Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.
       *)

  protection_groups: protection_group list;
  (** 
    
     *)

}

(** 
    Narrows the set of protection groups that the call retrieves. You can retrieve a single protection group by its name and you can retrieve all protection groups that are configured with a specific pattern, aggregation, or resource type. You can provide up to one criteria per filter type. Shield Advanced returns the protection groups that exactly match all of the search criteria that you provide.
     *)
type inclusion_protection_group_filters = {
  aggregations: protection_group_aggregation list option;
  (** 
    The aggregation setting of the protection groups that you want to retrieve.
     *)

  resource_types: protected_resource_type list option;
  (** 
    The resource type configuration of the protection groups that you want to retrieve. In the protection group configuration, you specify the resource type when you set the group's [Pattern] to [BY_RESOURCE_TYPE].
     *)

  patterns: protection_group_pattern list option;
  (** 
    The pattern specification of the protection groups that you want to retrieve.
     *)

  protection_group_ids: string list option;
  (** 
    The ID of the protection group that you want to retrieve.
     *)

}

type list_protection_groups_request = {
  inclusion_filters: inclusion_protection_group_filters option;
  (** 
    Narrows the set of protection groups that the call retrieves. You can retrieve a single protection group by its name and you can retrieve all protection groups that are configured with specific pattern or aggregation settings. You can provide up to one criteria per filter type. Shield Advanced returns the protection groups that exactly match all of the search criteria that you provide.
     *)

  max_results: int option;
  (** 
    The greatest number of objects that you want Shield Advanced to return to the list request. Shield Advanced might return fewer objects than you indicate in this setting, even if more objects are available. If there are more objects remaining, Shield Advanced will always also return a [NextToken] value in the response.
    
     The default setting is 20.
      *)

  next_token: string option;
  (** 
    When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request.
    
     You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.
     
      Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.
      
       On your first call to a list operation, leave this setting empty.
        *)

}

(** 
    Describes the attack.
     *)
type attack_vector_description = {
  vector_type: string;
  (** 
    The attack type. Valid values:
    
     {ul
          {- UDP_TRAFFIC
             
             }
           {- UDP_FRAGMENT
              
              }
           {- GENERIC_UDP_REFLECTION
              
              }
           {- DNS_REFLECTION
              
              }
           {- NTP_REFLECTION
              
              }
           {- CHARGEN_REFLECTION
              
              }
           {- SSDP_REFLECTION
              
              }
           {- PORT_MAPPER
              
              }
           {- RIP_REFLECTION
              
              }
           {- SNMP_REFLECTION
              
              }
           {- MSSQL_REFLECTION
              
              }
           {- NET_BIOS_REFLECTION
              
              }
           {- SYN_FLOOD
              
              }
           {- ACK_FLOOD
              
              }
           {- REQUEST_FLOOD
              
              }
           {- HTTP_REFLECTION
              
              }
           {- UDS_REFLECTION
              
              }
           {- MEMCACHED_REFLECTION
              
              }
          
      }
       *)

}

(** 
    Summarizes all DDoS attacks for a specified time period.
     *)
type attack_summary = {
  attack_vectors: attack_vector_description list option;
  (** 
    The list of attacks for a specified time period.
     *)

  end_time: float option;
  (** 
    The end time of the attack, in Unix time in seconds.
     *)

  start_time: float option;
  (** 
    The start time of the attack, in Unix time in seconds.
     *)

  resource_arn: string option;
  (** 
    The ARN (Amazon Resource Name) of the resource that was attacked.
     *)

  attack_id: string option;
  (** 
    The unique identifier (ID) of the attack.
     *)

}

type list_attacks_response = {
  next_token: string option;
  (** 
    When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request.
    
     You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.
     
      Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.
       *)

  attack_summaries: attack_summary list option;
  (** 
    The attack information for the specified time range.
     *)

}

type list_attacks_request = {
  max_results: int option;
  (** 
    The greatest number of objects that you want Shield Advanced to return to the list request. Shield Advanced might return fewer objects than you indicate in this setting, even if more objects are available. If there are more objects remaining, Shield Advanced will always also return a [NextToken] value in the response.
    
     The default setting is 20.
      *)

  next_token: string option;
  (** 
    When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request.
    
     You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.
     
      Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.
      
       On your first call to a list operation, leave this setting empty.
        *)

  end_time: time_range option;
  (** 
    The end of the time period for the attacks. This is a [timestamp] type. The request syntax listing for this call indicates a [number] type, but you can provide the time in any valid {{:https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-types.html#parameter-type-timestamp}timestamp format} setting.
     *)

  start_time: time_range option;
  (** 
    The start of the time period for the attacks. This is a [timestamp] type. The request syntax listing for this call indicates a [number] type, but you can provide the time in any valid {{:https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-types.html#parameter-type-timestamp}timestamp format} setting.
     *)

  resource_arns: string list option;
  (** 
    The ARNs (Amazon Resource Names) of the resources that were attacked. If you leave this blank, all applicable resources for this account will be included.
     *)

}

(** 
    Exception that indicates that the operation would exceed a limit.
     *)
type limits_exceeded_exception = {
  limit: int option;
  (** 
    The threshold that would be exceeded.
     *)

  type_: string option;
  (** 
    The type of limit that would be exceeded.
     *)

  message: string option;
  
}

type get_subscription_state_response = {
  subscription_state: subscription_state;
  (** 
    The status of the subscription.
     *)

}

type get_subscription_state_request = unit

type enable_proactive_engagement_response = unit

type enable_proactive_engagement_request = unit

type enable_application_layer_automatic_response_response = unit

type enable_application_layer_automatic_response_request = {
  action: response_action;
  (** 
    Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on behalf of the protected resource in response to DDoS attacks. You specify this as part of the configuration for the automatic application layer DDoS mitigation feature, when you enable or update automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group, inside the web ACL that you have associated with the resource.
     *)

  resource_arn: string;
  (** 
    The ARN (Amazon Resource Name) of the protected resource.
     *)

}

type disassociate_health_check_response = unit

type disassociate_health_check_request = {
  health_check_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the health check that is associated with the protection.
     *)

  protection_id: string;
  (** 
    The unique identifier (ID) for the [Protection] object to remove the health check association from.
     *)

}

type disassociate_drt_role_response = unit

type disassociate_drt_role_request = unit

type disassociate_drt_log_bucket_response = unit

type disassociate_drt_log_bucket_request = {
  log_bucket: string;
  (** 
    The Amazon S3 bucket that contains the logs that you want to share.
     *)

}

(** 
    In order to grant the necessary access to the Shield Response Team (SRT) the user submitting the request must have the [iam:PassRole] permission. This error indicates the user did not have the appropriate permissions. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html}Granting a User Permissions to Pass a Role to an Amazon Web Services Service}.
     *)
type access_denied_for_dependency_exception = {
  message: string option;
  
}

type disable_proactive_engagement_response = unit

type disable_proactive_engagement_request = unit

type disable_application_layer_automatic_response_response = unit

type disable_application_layer_automatic_response_request = {
  resource_arn: string;
  (** 
    The ARN (Amazon Resource Name) of the protected resource.
     *)

}

type describe_subscription_response = {
  subscription: subscription option;
  (** 
    The Shield Advanced subscription details for an account.
     *)

}

type describe_subscription_request = unit

type describe_protection_response = {
  protection: protection option;
  (** 
    The [Protection] that you requested.
     *)

}

type describe_protection_request = {
  resource_arn: string option;
  (** 
    The ARN (Amazon Resource Name) of the protected Amazon Web Services resource. You must provide either the [ResourceArn] of the protected resource or the [ProtectionID] of the protection, but not both.
     *)

  protection_id: string option;
  (** 
    The unique identifier (ID) for the [Protection] object to describe. You must provide either the [ResourceArn] of the protected resource or the [ProtectionID] of the protection, but not both.
     *)

}

type describe_protection_group_response = {
  protection_group: protection_group;
  (** 
    A grouping of protected resources that you and Shield Advanced can monitor as a collective. This resource grouping improves the accuracy of detection and reduces false positives.
     *)

}

type describe_protection_group_request = {
  protection_group_id: string;
  (** 
    The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it.
     *)

}

type describe_emergency_contact_settings_response = {
  emergency_contact_list: emergency_contact list option;
  (** 
    A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.
     *)

}

type describe_emergency_contact_settings_request = unit

type describe_drt_access_response = {
  log_bucket_list: string list option;
  (** 
    The list of Amazon S3 buckets accessed by the SRT.
     *)

  role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the role the SRT used to access your Amazon Web Services account.
     *)

}

type describe_drt_access_request = unit

(** 
    Statistics objects for the various data types in [AttackVolume].
     *)
type attack_volume_statistics = {
  max: float;
  (** 
    The maximum attack volume observed for the given unit.
     *)

}

(** 
    Information about the volume of attacks during the time period, included in an [AttackStatisticsDataItem]. If the accompanying [AttackCount] in the statistics object is zero, this setting might be empty.
     *)
type attack_volume = {
  requests_per_second: attack_volume_statistics option;
  (** 
    A statistics object that uses requests per second as the unit. This is included for application level attacks, and is only available for accounts that are subscribed to Shield Advanced.
     *)

  packets_per_second: attack_volume_statistics option;
  (** 
    A statistics object that uses packets per second as the unit. This is included for network level attacks.
     *)

  bits_per_second: attack_volume_statistics option;
  (** 
    A statistics object that uses bits per second as the unit. This is included for network level attacks.
     *)

}

(** 
    A single attack statistics data record. This is returned by [DescribeAttackStatistics] along with a time range indicating the time period that the attack statistics apply to.
     *)
type attack_statistics_data_item = {
  attack_count: int;
  (** 
    The number of attacks detected during the time period. This is always present, but might be zero.
     *)

  attack_volume: attack_volume option;
  (** 
    Information about the volume of attacks during the time period. If the accompanying [AttackCount] is zero, this setting might be empty.
     *)

}

type describe_attack_statistics_response = {
  data_items: attack_statistics_data_item list;
  (** 
    The data that describes the attacks detected during the time period.
     *)

  time_range: time_range;
  (** 
    The time range of the attack.
     *)

}

type describe_attack_statistics_request = unit

type attack_layer = | APPLICATION
  | NETWORK

type attack_property_identifier = | WORDPRESS_PINGBACK_SOURCE
  | WORDPRESS_PINGBACK_REFLECTOR
  | SOURCE_USER_AGENT
  | SOURCE_IP_ADDRESS
  | SOURCE_COUNTRY
  | SOURCE_ASN
  | REFERRER
  | DESTINATION_URL

(** 
    Details of a Shield event. This is provided as part of an [AttackDetail].
     *)
type attack_property = {
  total: int option;
  (** 
    The total contributions made to this Shield event by all contributors.
     *)

  unit_: unit_ option;
  (** 
    The unit used for the [Contributor] [Value] property.
     *)

  top_contributors: contributor list option;
  (** 
    Contributor objects for the top five contributors to a Shield event. A contributor is a source of traffic that Shield Advanced identifies as responsible for some or all of an event.
     *)

  attack_property_identifier: attack_property_identifier option;
  (** 
    Defines the Shield event property information that is provided. The [WORDPRESS_PINGBACK_REFLECTOR] and [WORDPRESS_PINGBACK_SOURCE] values are valid only for WordPress reflective pingback events.
     *)

  attack_layer: attack_layer option;
  (** 
    The type of Shield event that was observed. [NETWORK] indicates layer 3 and layer 4 events and [APPLICATION] indicates layer 7 events.
    
     For infrastructure layer events (L3 and L4 events), you can view metrics for top contributors in Amazon CloudWatch metrics. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#set-ddos-alarms}Shield metrics and alarms} in the {i WAF Developer Guide}.
      *)

}

(** 
    The details of a DDoS attack.
     *)
type attack_detail = {
  mitigations: mitigation list option;
  (** 
    List of mitigation actions taken for the attack.
     *)

  attack_properties: attack_property list option;
  (** 
    The array of objects that provide details of the Shield event.
    
     For infrastructure layer events (L3 and L4 events), you can view metrics for top contributors in Amazon CloudWatch metrics. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#set-ddos-alarms}Shield metrics and alarms} in the {i WAF Developer Guide}.
      *)

  attack_counters: summarized_counter list option;
  (** 
    List of counters that describe the attack for the specified time period.
     *)

  end_time: float option;
  (** 
    The time the attack ended, in Unix time in seconds.
     *)

  start_time: float option;
  (** 
    The time the attack started, in Unix time in seconds.
     *)

  sub_resources: sub_resource_summary list option;
  (** 
    If applicable, additional detail about the resource being attacked, for example, IP address or URL.
     *)

  resource_arn: string option;
  (** 
    The ARN (Amazon Resource Name) of the resource that was attacked.
     *)

  attack_id: string option;
  (** 
    The unique identifier (ID) of the attack.
     *)

}

type describe_attack_response = {
  attack: attack_detail option;
  (** 
    The attack that you requested.
     *)

}

type describe_attack_request = {
  attack_id: string;
  (** 
    The unique identifier (ID) for the attack.
     *)

}

(** 
    Exception that indicates the specified [AttackId] does not exist, or the requester does not have the appropriate permissions to access the [AttackId].
     *)
type access_denied_exception = {
  message: string option;
  
}

type delete_subscription_response = unit

type delete_subscription_request = unit

type delete_protection_response = unit

type delete_protection_request = {
  protection_id: string;
  (** 
    The unique identifier (ID) for the [Protection] object to be deleted.
     *)

}

type delete_protection_group_response = unit

type delete_protection_group_request = {
  protection_group_id: string;
  (** 
    The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it.
     *)

}

type create_subscription_response = unit

type create_subscription_request = unit

type create_protection_response = {
  protection_id: string option;
  (** 
    The unique identifier (ID) for the [Protection] object that is created.
     *)

}

type create_protection_request = {
  tags: tag list option;
  (** 
    One or more tag key-value pairs for the [Protection] object that is created.
     *)

  resource_arn: string;
  (** 
    The ARN (Amazon Resource Name) of the resource to be protected.
    
     The ARN should be in one of the following formats:
     
      {ul
           {- For an Application Load Balancer: [arn:aws:elasticloadbalancing:{i region}:{i account-id}:loadbalancer/app/{i load-balancer-name}/{i load-balancer-id}]
              
              }
            {- For an Elastic Load Balancer (Classic Load Balancer): [arn:aws:elasticloadbalancing:{i region}:{i account-id}:loadbalancer/{i load-balancer-name}]
               
               }
            {- For an Amazon CloudFront distribution: [arn:aws:cloudfront::{i account-id}:distribution/{i distribution-id}]
               
               }
            {- For an Global Accelerator standard accelerator: [arn:aws:globalaccelerator::{i account-id}:accelerator/{i accelerator-id}]
               
               }
            {- For Amazon Route 53: [arn:aws:route53:::hostedzone/{i hosted-zone-id}]
               
               }
            {- For an Elastic IP address: [arn:aws:ec2:{i region}:{i account-id}:eip-allocation/{i allocation-id}]
               
               }
           
      }
       *)

  name: string;
  (** 
    Friendly name for the [Protection] you are creating.
     *)

}

type create_protection_group_response = unit

type create_protection_group_request = {
  tags: tag list option;
  (** 
    One or more tag key-value pairs for the protection group.
     *)

  members: string list option;
  (** 
    The Amazon Resource Names (ARNs) of the resources to include in the protection group. You must set this when you set [Pattern] to [ARBITRARY] and you must not set it for any other [Pattern] setting.
     *)

  resource_type: protected_resource_type option;
  (** 
    The resource type to include in the protection group. All protected resources of this type are included in the protection group. Newly protected resources of this type are automatically added to the group. You must set this when you set [Pattern] to [BY_RESOURCE_TYPE] and you must not set it for any other [Pattern] setting.
     *)

  pattern: protection_group_pattern;
  (** 
    The criteria to use to choose the protected resources for inclusion in the group. You can include all resources that have protections, provide a list of resource Amazon Resource Names (ARNs), or include all resources of a specified resource type.
     *)

  aggregation: protection_group_aggregation;
  (** 
    Defines how Shield combines resource data for the group in order to detect, mitigate, and report events.
    
     {ul
          {- Sum - Use the total traffic across the group. This is a good choice for most cases. Examples include Elastic IP addresses for EC2 instances that scale manually or automatically.
             
             }
           {- Mean - Use the average of the traffic across the group. This is a good choice for resources that share traffic uniformly. Examples include accelerators and load balancers.
              
              }
           {- Max - Use the highest traffic from each resource. This is useful for resources that don't share traffic and for resources that share that traffic in a non-uniform way. Examples include Amazon CloudFront and origin resources for CloudFront distributions.
              
              }
          
      }
       *)

  protection_group_id: string;
  (** 
    The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it.
     *)

}

type associate_proactive_engagement_details_response = unit

type associate_proactive_engagement_details_request = {
  emergency_contact_list: emergency_contact list;
  (** 
    A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you for escalations to the SRT and to initiate proactive customer support.
    
     To enable proactive engagement, the contact list must include at least one phone number.
     
      The contacts that you provide here replace any contacts that were already defined. If you already have contacts defined and want to use them, retrieve the list using [DescribeEmergencyContactSettings] and then provide it here.
      
       *)

}

type associate_health_check_response = unit

type associate_health_check_request = {
  health_check_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the health check to associate with the protection.
     *)

  protection_id: string;
  (** 
    The unique identifier (ID) for the [Protection] object to add the health check association to.
     *)

}

type associate_drt_role_response = unit

type associate_drt_role_request = {
  role_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the role the SRT will use to access your Amazon Web Services account.
    
     Prior to making the [AssociateDRTRole] request, you must attach the {{:https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy}AWSShieldDRTAccessPolicy} managed policy to this role. For more information see {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html}Attaching and Detaching IAM Policies}.
      *)

}

type associate_drt_log_bucket_response = unit

type associate_drt_log_bucket_request = {
  log_bucket: string;
  (** 
    The Amazon S3 bucket that contains the logs that you want to share.
     *)

}

(** 
    Shield Advanced This is the {i Shield Advanced API Reference}. This guide is for developers who need detailed information about the Shield Advanced API actions, data types, and errors. For detailed information about WAF and Shield Advanced features and an overview of how to use the WAF and Shield Advanced APIs, see the {{:https://docs.aws.amazon.com/waf/latest/developerguide/}WAF and Shield Developer Guide}.
                     *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_validation_exception_field : message:string -> name:string -> unit
-> validation_exception_field

val make_update_subscription_response : unit
-> update_subscription_response

val make_update_subscription_request : ?auto_renew:auto_renew -> unit
-> update_subscription_request

val make_update_protection_group_response : unit
-> update_protection_group_response

val make_update_protection_group_request :
  ?members:string list ->
  ?resource_type:protected_resource_type ->
  pattern:protection_group_pattern ->
  aggregation:protection_group_aggregation ->
  protection_group_id:string ->
  unit
-> update_protection_group_request

val make_update_emergency_contact_settings_response : unit
-> update_emergency_contact_settings_response

val make_emergency_contact :
  ?contact_notes:string ->
  ?phone_number:string ->
  email_address:string ->
  unit
-> emergency_contact

val make_update_emergency_contact_settings_request :
  ?emergency_contact_list:emergency_contact list -> unit
-> update_emergency_contact_settings_request

val make_update_application_layer_automatic_response_response : unit
-> update_application_layer_automatic_response_response

val make_block_action : unit -> block_action

val make_count_action : unit -> count_action

val make_response_action : ?count:count_action -> ?block:block_action -> unit
-> response_action

val make_update_application_layer_automatic_response_request :
  action:response_action -> resource_arn:string -> unit
-> update_application_layer_automatic_response_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request

val make_contributor : ?value:int -> ?name:string -> unit
-> contributor

val make_time_range : ?to_exclusive:float -> ?from_inclusive:float -> unit
-> time_range

val make_tag_resource_response : unit -> tag_resource_response

val make_tag : ?value:string -> ?key:string -> unit
-> tag

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request

val make_summarized_counter :
  ?unit_:string ->
  ?n:int ->
  ?sum:float ->
  ?average:float ->
  ?max:float ->
  ?name:string ->
  unit -> summarized_counter

val make_summarized_attack_vector :
  ?vector_counters:summarized_counter list -> vector_type:string -> unit
-> summarized_attack_vector

val make_limit : ?max:int -> ?type_:string -> unit
-> limit

val make_protection_limits :
  protected_resource_type_limits:limit list -> unit
-> protection_limits

val make_protection_group_arbitrary_pattern_limits : max_members:int -> unit
-> protection_group_arbitrary_pattern_limits

val make_protection_group_pattern_type_limits :
  arbitrary_pattern_limits:protection_group_arbitrary_pattern_limits -> unit
-> protection_group_pattern_type_limits

val make_protection_group_limits :
  pattern_type_limits:protection_group_pattern_type_limits ->
  max_protection_groups:int ->
  unit -> protection_group_limits

val make_subscription_limits :
  protection_group_limits:protection_group_limits ->
  protection_limits:protection_limits ->
  unit -> subscription_limits

val make_subscription :
  ?subscription_arn:string ->
  ?proactive_engagement_status:proactive_engagement_status ->
  ?limits:limit list ->
  ?auto_renew:auto_renew ->
  ?time_commitment_in_seconds:int ->
  ?end_time:float ->
  ?start_time:float ->
  subscription_limits:subscription_limits ->
  unit -> subscription

val make_sub_resource_summary :
  ?counters:summarized_counter list ->
  ?attack_vectors:summarized_attack_vector list ->
  ?id:string ->
  ?type_:sub_resource_type ->
  unit
-> sub_resource_summary

val make_application_layer_automatic_response_configuration :
  action:response_action ->
  status:application_layer_automatic_response_status ->
  unit
-> application_layer_automatic_response_configuration

val make_protection :
  ?application_layer_automatic_response_configuration:application_layer_automatic_response_configuration ->
  ?protection_arn:string ->
  ?health_check_ids:string list ->
  ?resource_arn:string ->
  ?name:string ->
  ?id:string ->
  unit -> protection

val make_protection_group :
  ?protection_group_arn:string ->
  ?resource_type:protected_resource_type ->
  members:string list ->
  pattern:protection_group_pattern ->
  aggregation:protection_group_aggregation ->
  protection_group_id:string ->
  unit -> protection_group

val make_mitigation : ?mitigation_name:string -> unit
-> mitigation

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request

val make_list_resources_in_protection_group_response :
  ?next_token:string -> resource_arns:string list -> unit
-> list_resources_in_protection_group_response

val make_list_resources_in_protection_group_request :
  ?max_results:int ->
  ?next_token:string ->
  protection_group_id:string ->
  unit
-> list_resources_in_protection_group_request

val make_list_protections_response :
  ?next_token:string -> ?protections:protection list -> unit
-> list_protections_response

val make_inclusion_protection_filters :
  ?resource_types:protected_resource_type list ->
  ?protection_names:string list ->
  ?resource_arns:string list ->
  unit -> inclusion_protection_filters

val make_list_protections_request :
  ?inclusion_filters:inclusion_protection_filters ->
  ?max_results:int ->
  ?next_token:string ->
  unit -> list_protections_request

val make_list_protection_groups_response :
  ?next_token:string -> protection_groups:protection_group list -> unit
-> list_protection_groups_response

val make_inclusion_protection_group_filters :
  ?aggregations:protection_group_aggregation list ->
  ?resource_types:protected_resource_type list ->
  ?patterns:protection_group_pattern list ->
  ?protection_group_ids:string list ->
  unit
-> inclusion_protection_group_filters

val make_list_protection_groups_request :
  ?inclusion_filters:inclusion_protection_group_filters ->
  ?max_results:int ->
  ?next_token:string ->
  unit -> list_protection_groups_request

val make_attack_vector_description : vector_type:string -> unit
-> attack_vector_description

val make_attack_summary :
  ?attack_vectors:attack_vector_description list ->
  ?end_time:float ->
  ?start_time:float ->
  ?resource_arn:string ->
  ?attack_id:string ->
  unit -> attack_summary

val make_list_attacks_response :
  ?next_token:string -> ?attack_summaries:attack_summary list -> unit
-> list_attacks_response

val make_list_attacks_request :
  ?max_results:int ->
  ?next_token:string ->
  ?end_time:time_range ->
  ?start_time:time_range ->
  ?resource_arns:string list ->
  unit -> list_attacks_request

val make_get_subscription_state_response :
  subscription_state:subscription_state -> unit
-> get_subscription_state_response

val make_get_subscription_state_request : unit
-> get_subscription_state_request

val make_enable_proactive_engagement_response : unit
-> enable_proactive_engagement_response

val make_enable_proactive_engagement_request : unit
-> enable_proactive_engagement_request

val make_enable_application_layer_automatic_response_response : unit
-> enable_application_layer_automatic_response_response

val make_enable_application_layer_automatic_response_request :
  action:response_action -> resource_arn:string -> unit
-> enable_application_layer_automatic_response_request

val make_disassociate_health_check_response : unit
-> disassociate_health_check_response

val make_disassociate_health_check_request :
  health_check_arn:string -> protection_id:string -> unit
-> disassociate_health_check_request

val make_disassociate_drt_role_response : unit
-> disassociate_drt_role_response

val make_disassociate_drt_role_request : unit
-> disassociate_drt_role_request

val make_disassociate_drt_log_bucket_response : unit
-> disassociate_drt_log_bucket_response

val make_disassociate_drt_log_bucket_request : log_bucket:string -> unit
-> disassociate_drt_log_bucket_request

val make_disable_proactive_engagement_response : unit
-> disable_proactive_engagement_response

val make_disable_proactive_engagement_request : unit
-> disable_proactive_engagement_request

val make_disable_application_layer_automatic_response_response : unit
-> disable_application_layer_automatic_response_response

val make_disable_application_layer_automatic_response_request :
  resource_arn:string -> unit
-> disable_application_layer_automatic_response_request

val make_describe_subscription_response : ?subscription:subscription -> unit
-> describe_subscription_response

val make_describe_subscription_request : unit
-> describe_subscription_request

val make_describe_protection_response : ?protection:protection -> unit
-> describe_protection_response

val make_describe_protection_request :
  ?resource_arn:string -> ?protection_id:string -> unit
-> describe_protection_request

val make_describe_protection_group_response :
  protection_group:protection_group -> unit
-> describe_protection_group_response

val make_describe_protection_group_request :
  protection_group_id:string -> unit
-> describe_protection_group_request

val make_describe_emergency_contact_settings_response :
  ?emergency_contact_list:emergency_contact list -> unit
-> describe_emergency_contact_settings_response

val make_describe_emergency_contact_settings_request : unit
-> describe_emergency_contact_settings_request

val make_describe_drt_access_response :
  ?log_bucket_list:string list -> ?role_arn:string -> unit
-> describe_drt_access_response

val make_describe_drt_access_request : unit
-> describe_drt_access_request

val make_attack_volume_statistics : max:float -> unit
-> attack_volume_statistics

val make_attack_volume :
  ?requests_per_second:attack_volume_statistics ->
  ?packets_per_second:attack_volume_statistics ->
  ?bits_per_second:attack_volume_statistics ->
  unit -> attack_volume

val make_attack_statistics_data_item :
  ?attack_volume:attack_volume -> attack_count:int -> unit
-> attack_statistics_data_item

val make_describe_attack_statistics_response :
  data_items:attack_statistics_data_item list ->
  time_range:time_range ->
  unit
-> describe_attack_statistics_response

val make_describe_attack_statistics_request : unit
-> describe_attack_statistics_request

val make_attack_property :
  ?total:int ->
  ?unit_:unit_ ->
  ?top_contributors:contributor list ->
  ?attack_property_identifier:attack_property_identifier ->
  ?attack_layer:attack_layer ->
  unit -> attack_property

val make_attack_detail :
  ?mitigations:mitigation list ->
  ?attack_properties:attack_property list ->
  ?attack_counters:summarized_counter list ->
  ?end_time:float ->
  ?start_time:float ->
  ?sub_resources:sub_resource_summary list ->
  ?resource_arn:string ->
  ?attack_id:string ->
  unit -> attack_detail

val make_describe_attack_response : ?attack:attack_detail -> unit
-> describe_attack_response

val make_describe_attack_request : attack_id:string -> unit
-> describe_attack_request

val make_delete_subscription_response : unit
-> delete_subscription_response

val make_delete_subscription_request : unit
-> delete_subscription_request

val make_delete_protection_response : unit
-> delete_protection_response

val make_delete_protection_request : protection_id:string -> unit
-> delete_protection_request

val make_delete_protection_group_response : unit
-> delete_protection_group_response

val make_delete_protection_group_request : protection_group_id:string -> unit
-> delete_protection_group_request

val make_create_subscription_response : unit
-> create_subscription_response

val make_create_subscription_request : unit
-> create_subscription_request

val make_create_protection_response : ?protection_id:string -> unit
-> create_protection_response

val make_create_protection_request :
  ?tags:tag list -> resource_arn:string -> name:string -> unit
-> create_protection_request

val make_create_protection_group_response : unit
-> create_protection_group_response

val make_create_protection_group_request :
  ?tags:tag list ->
  ?members:string list ->
  ?resource_type:protected_resource_type ->
  pattern:protection_group_pattern ->
  aggregation:protection_group_aggregation ->
  protection_group_id:string ->
  unit
-> create_protection_group_request

val make_associate_proactive_engagement_details_response : unit
-> associate_proactive_engagement_details_response

val make_associate_proactive_engagement_details_request :
  emergency_contact_list:emergency_contact list -> unit
-> associate_proactive_engagement_details_request

val make_associate_health_check_response : unit
-> associate_health_check_response

val make_associate_health_check_request :
  health_check_arn:string -> protection_id:string -> unit
-> associate_health_check_request

val make_associate_drt_role_response : unit
-> associate_drt_role_response

val make_associate_drt_role_request : role_arn:string -> unit
-> associate_drt_role_request

val make_associate_drt_log_bucket_response : unit
-> associate_drt_log_bucket_response

val make_associate_drt_log_bucket_request : log_bucket:string -> unit
-> associate_drt_log_bucket_request

(** {1:operations Operations} *)

module AssociateDRTLogBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_drt_log_bucket_request ->
        (associate_drt_log_bucket_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `NoAssociatedRoleException of no_associated_role_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateDRTRole : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_drt_role_request ->
        (associate_drt_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateHealthCheck : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_health_check_request ->
        (associate_health_check_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module AssociateProactiveEngagementDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_proactive_engagement_details_request ->
        (associate_proactive_engagement_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateProtection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_protection_request ->
        (create_protection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_protection_group_request ->
        (create_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module CreateSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      create_subscription_request ->
        (create_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
end

module DeleteProtection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protection_request ->
        (delete_protection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protection_group_request ->
        (delete_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_subscription_request ->
        (delete_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `LockedSubscriptionException of locked_subscription_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeAttack : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_attack_request ->
        (describe_attack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalErrorException of internal_error_exception
            
        ]
      ) result
end

module DescribeAttackStatistics : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_attack_statistics_request ->
        (describe_attack_statistics_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            
        ]
      ) result
end

module DescribeDRTAccess : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_drt_access_request ->
        (describe_drt_access_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeEmergencyContactSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_emergency_contact_settings_request ->
        (describe_emergency_contact_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeProtection : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_protection_request ->
        (describe_protection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_protection_group_request ->
        (describe_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DescribeSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_subscription_request ->
        (describe_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisableApplicationLayerAutomaticResponse : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_application_layer_automatic_response_request ->
        (disable_application_layer_automatic_response_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisableProactiveEngagement : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_proactive_engagement_request ->
        (disable_proactive_engagement_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateDRTLogBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_drt_log_bucket_request ->
        (disassociate_drt_log_bucket_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `NoAssociatedRoleException of no_associated_role_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateDRTRole : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_drt_role_request ->
        (disassociate_drt_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DisassociateHealthCheck : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_health_check_request ->
        (disassociate_health_check_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module EnableApplicationLayerAutomaticResponse : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_application_layer_automatic_response_request ->
        (enable_application_layer_automatic_response_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module EnableProactiveEngagement : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_proactive_engagement_request ->
        (enable_proactive_engagement_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module GetSubscriptionState : sig
  val request :
    Smaws_Lib.Context.t ->
      get_subscription_state_request ->
        (get_subscription_state_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            
        ]
      ) result
end

module ListAttacks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_attacks_request ->
        (list_attacks_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            
        ]
      ) result
end

module ListProtectionGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_protection_groups_request ->
        (list_protection_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidPaginationTokenException of invalid_pagination_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListProtections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_protections_request ->
        (list_protections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidPaginationTokenException of invalid_pagination_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListResourcesInProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_in_protection_group_request ->
        (list_resources_in_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidPaginationTokenException of invalid_pagination_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateApplicationLayerAutomaticResponse : sig
  val request :
    Smaws_Lib.Context.t ->
      update_application_layer_automatic_response_request ->
        (update_application_layer_automatic_response_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateEmergencyContactSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_emergency_contact_settings_request ->
        (update_emergency_contact_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_protection_group_request ->
        (update_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      update_subscription_request ->
        (update_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LockedSubscriptionException of locked_subscription_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

