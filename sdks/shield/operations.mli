open Types 
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
  (** 
    Authorizes the Shield Response Team (SRT) to access the specified Amazon S3 bucket containing log data such as Application Load Balancer access logs, CloudFront logs, or logs from third party sources. You can associate up to 10 Amazon S3 buckets with your subscription.
    
     To use the services of the SRT and make an [AssociateDRTLogBucket] request, you must be subscribed to the {{:http://aws.amazon.com/premiumsupport/business-support/}Business Support plan} or the {{:http://aws.amazon.com/premiumsupport/enterprise-support/}Enterprise Support plan}.
      *)

  
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
  (** 
    Authorizes the Shield Response Team (SRT) using the specified role, to access your Amazon Web Services account to assist with DDoS attack mitigation during potential attacks. This enables the SRT to inspect your WAF configuration and create or update WAF rules and web ACLs.
    
     You can associate only one [RoleArn] with your subscription. If you submit an [AssociateDRTRole] request for an account that already has an associated role, the new [RoleArn] will replace the existing [RoleArn].
     
      Prior to making the [AssociateDRTRole] request, you must attach the [AWSShieldDRTAccessPolicy] managed policy to the role that you'll specify in the request. You can access this policy in the IAM console at {{:https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy}AWSShieldDRTAccessPolicy}. For more information see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html}Adding and removing IAM identity permissions}. The role must also trust the service principal [drt.shield.amazonaws.com]. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html}IAM JSON policy elements: Principal}.
      
       The SRT will have access only to your WAF and Shield resources. By submitting this request, you authorize the SRT to inspect your WAF and Shield configuration and create and update WAF rules and web ACLs on your behalf. The SRT takes these actions only if explicitly authorized by you.
       
        You must have the [iam:PassRole] permission to make an [AssociateDRTRole] request. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html}Granting a user permissions to pass a role to an Amazon Web Services service}.
        
         To use the services of the SRT and make an [AssociateDRTRole] request, you must be subscribed to the {{:http://aws.amazon.com/premiumsupport/business-support/}Business Support plan} or the {{:http://aws.amazon.com/premiumsupport/enterprise-support/}Enterprise Support plan}.
          *)

  
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
  (** 
    Adds health-based detection to the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your Amazon Web Services resource to improve responsiveness and accuracy in attack detection and response.
    
     You define the health check in Route 53 and then associate it with your Shield Advanced protection. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option}Shield Advanced Health-Based Detection} in the {i WAF Developer Guide}.
      *)

  
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
  (** 
    Initializes proactive engagement and sets the list of contacts for the Shield Response Team (SRT) to use. You must provide at least one phone number in the emergency contact list.
    
     After you have initialized proactive engagement using this call, to disable or enable proactive engagement, use the calls [DisableProactiveEngagement] and [EnableProactiveEngagement].
     
      This call defines the list of email addresses and phone numbers that the SRT can use to contact you for escalations to the SRT and to initiate proactive customer support.
      
       The contacts that you provide in the request replace any contacts that were already defined. If you already have contacts defined and want to use them, retrieve the list using [DescribeEmergencyContactSettings] and then provide it to this call.
       
        *)

  
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
  (** 
    Enables Shield Advanced for a specific Amazon Web Services resource. The resource can be an Amazon CloudFront distribution, Amazon Route 53 hosted zone, Global Accelerator standard accelerator, Elastic IP Address, Application Load Balancer, or a Classic Load Balancer. You can protect Amazon EC2 instances and Network Load Balancers by association with protected Amazon EC2 Elastic IP addresses.
    
     You can add protection to only a single resource with each [CreateProtection] request. You can add protection to multiple resources at once through the Shield Advanced console at {{:https://console.aws.amazon.com/wafv2/shieldv2#/}https://console.aws.amazon.com/wafv2/shieldv2#/}. For more information see {{:https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html}Getting Started with Shield Advanced} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/configure-new-protection.html}Adding Shield Advanced protection to Amazon Web Services resources}.
      *)

  
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
  (** 
    Creates a grouping of protected resources so they can be handled as a collective. This resource grouping improves the accuracy of detection and reduces false positives.
     *)

  
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
  (** 
    Activates Shield Advanced for an account.
    
     For accounts that are members of an Organizations organization, Shield Advanced subscriptions are billed against the organization's payer account, regardless of whether the payer account itself is subscribed.
     
      When you initially create a subscription, your subscription is set to be automatically renewed at the end of the existing subscription period. You can change this by submitting an [UpdateSubscription] request.
       *)

  
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
  (** 
    Deletes an Shield Advanced [Protection].
     *)

  
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
  (** 
    Removes the specified protection group.
     *)

  
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
  (** 
    Removes Shield Advanced from an account. Shield Advanced requires a 1-year subscription commitment. You cannot delete a subscription prior to the completion of that commitment.
     *)

  
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
  (** 
    Describes the details of a DDoS attack.
     *)

  
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
  (** 
    Provides information about the number and type of attacks Shield has detected in the last year for all resources that belong to your account, regardless of whether you've defined Shield protections for them. This operation is available to Shield customers as well as to Shield Advanced customers.
    
     The operation returns data for the time range of midnight UTC, one year ago, to midnight UTC, today. For example, if the current time is [2020-10-26 15:39:32 PDT], equal to [2020-10-26 22:39:32 UTC], then the time range for the attack data returned is from [2019-10-26 00:00:00 UTC] to [2020-10-26 00:00:00 UTC].
     
      The time range indicates the period covered by the attack statistics data items.
       *)

  
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
  (** 
    Returns the current role and list of Amazon S3 log buckets used by the Shield Response Team (SRT) to access your Amazon Web Services account while assisting with attack mitigation.
     *)

  
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
  (** 
    A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.
     *)

  
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
  (** 
    Lists the details of a [Protection] object.
     *)

  
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
  (** 
    Returns the specification for the specified protection group.
     *)

  
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
  (** 
    Provides details about the Shield Advanced subscription for an account.
     *)

  
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
  (** 
    Disable the Shield Advanced automatic application layer DDoS mitigation feature for the protected resource. This stops Shield Advanced from creating, verifying, and applying WAF rules for attacks that it detects for the resource.
     *)

  
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
  (** 
    Removes authorization from the Shield Response Team (SRT) to notify contacts about escalations to the SRT and to initiate proactive customer support.
     *)

  
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
  (** 
    Removes the Shield Response Team's (SRT) access to the specified Amazon S3 bucket containing the logs that you shared previously.
     *)

  
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
  (** 
    Removes the Shield Response Team's (SRT) access to your Amazon Web Services account.
     *)

  
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
  (** 
    Removes health-based detection from the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your Amazon Web Services resource to improve responsiveness and accuracy in attack detection and response.
    
     You define the health check in Route 53 and then associate or disassociate it with your Shield Advanced protection. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option}Shield Advanced Health-Based Detection} in the {i WAF Developer Guide}.
      *)

  
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
  (** 
    Enable the Shield Advanced automatic application layer DDoS mitigation for the protected resource.
    
     This feature is available for Amazon CloudFront distributions and Application Load Balancers only.
     
      This causes Shield Advanced to create, verify, and apply WAF rules for DDoS attacks that it detects for the resource. Shield Advanced applies the rules in a Shield rule group inside the web ACL that you've associated with the resource. For information about how automatic mitigation works and the requirements for using it, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/ddos-advanced-automatic-app-layer-response.html}Shield Advanced automatic application layer DDoS mitigation}.
      
       Don't use this action to make changes to automatic mitigation settings when it's already enabled for a resource. Instead, use [UpdateApplicationLayerAutomaticResponse].
       
        To use this feature, you must associate a web ACL with the protected resource. The web ACL must be created using the latest version of WAF (v2). You can associate the web ACL through the Shield Advanced console at {{:https://console.aws.amazon.com/wafv2/shieldv2#/}https://console.aws.amazon.com/wafv2/shieldv2#/}. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html}Getting Started with Shield Advanced}. You can also associate the web ACL to the resource through the WAF console or the WAF API, but you must manage Shield Advanced automatic mitigation through Shield Advanced. For information about WAF, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/}WAF Developer Guide}.
         *)

  
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
  (** 
    Authorizes the Shield Response Team (SRT) to use email and phone to notify contacts about escalations to the SRT and to initiate proactive customer support.
     *)

  
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
  (** 
    Returns the [SubscriptionState], either [Active] or [Inactive].
     *)

  
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
  (** 
    Returns all ongoing DDoS attacks or all DDoS attacks during a specified time period.
     *)

  
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
  (** 
    Retrieves [ProtectionGroup] objects for the account. You can retrieve all protection groups or you can provide filtering criteria and retrieve just the subset of protection groups that match the criteria.
     *)

  
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
  (** 
    Retrieves [Protection] objects for the account. You can retrieve all protections or you can provide filtering criteria and retrieve just the subset of protections that match the criteria.
     *)

  
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
  (** 
    Retrieves the resources that are included in the protection group.
     *)

  
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
  (** 
    Gets information about Amazon Web Services tags for a specified Amazon Resource Name (ARN) in Shield.
     *)

  
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
  (** 
    Adds or updates tags for a resource in Shield.
     *)

  
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
  (** 
    Removes tags from a resource in Shield.
     *)

  
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
  (** 
    Updates an existing Shield Advanced automatic application layer DDoS mitigation configuration for the specified resource.
     *)

  
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
  (** 
    Updates the details of the list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.
     *)

  
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
  (** 
    Updates an existing protection group. A protection group is a grouping of protected resources so they can be handled as a collective. This resource grouping improves the accuracy of detection and reduces false positives.
     *)

  
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
  (** 
    Updates the details of an existing subscription. Only enter values for parameters you want to change. Empty parameters are not updated.
    
     For accounts that are members of an Organizations organization, Shield Advanced subscriptions are billed against the organization's payer account, regardless of whether the payer account itself is subscribed.
     
      *)

  
end

