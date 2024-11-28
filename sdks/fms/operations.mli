open Types 
module AssociateAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Sets a Firewall Manager default administrator account. The Firewall Manager default administrator account can manage third-party firewalls and has full administrative scope that allows administration of all policy types, accounts, organizational units, and Regions. This account must be a member account of the organization in Organizations whose resources you want to protect.
    
     For information about working with Firewall Manager administrator accounts, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/fms-administrators.html}Managing Firewall Manager administrators} in the {i Firewall Manager Developer Guide}.
      *)

  
end

module AssociateThirdPartyFirewall : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_third_party_firewall_request ->
        (associate_third_party_firewall_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Sets the Firewall Manager policy administrator as a tenant administrator of a third-party firewall service. A tenant is an instance of the third-party firewall service that's associated with your Amazon Web Services customer account.
     *)

  
end

module BatchAssociateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_associate_resource_request ->
        (batch_associate_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Associate resources to a Firewall Manager resource set.
     *)

  
end

module BatchDisassociateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_disassociate_resource_request ->
        (batch_disassociate_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Disassociates resources from a Firewall Manager resource set.
     *)

  
end

module DeleteAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_apps_list_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Permanently deletes an Firewall Manager applications list.
     *)

  
end

module DeleteNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_notification_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes an Firewall Manager association with the IAM role and the Amazon Simple Notification Service (SNS) topic that is used to record Firewall Manager SNS logs.
     *)

  
end

module DeletePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_policy_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Permanently deletes an Firewall Manager policy.
     *)

  
end

module DeleteProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protocols_list_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Permanently deletes an Firewall Manager protocols list.
     *)

  
end

module DeleteResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_set_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes the specified [ResourceSet].
     *)

  
end

module DisassociateAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Disassociates an Firewall Manager administrator account. To set a different account as an Firewall Manager administrator, submit a [PutAdminAccount] request. To set an account as a default administrator account, you must submit an [AssociateAdminAccount] request.
    
     Disassociation of the default administrator account follows the first in, last out principle. If you are the default administrator, all Firewall Manager administrators within the organization must first disassociate their accounts before you can disassociate your account.
      *)

  
end

module DisassociateThirdPartyFirewall : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_third_party_firewall_request ->
        (disassociate_third_party_firewall_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Disassociates a Firewall Manager policy administrator from a third-party firewall tenant. When you call [DisassociateThirdPartyFirewall], the third-party firewall vendor deletes all of the firewalls that are associated with the account.
     *)

  
end

module GetAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      get_admin_account_request ->
        (get_admin_account_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns the Organizations account that is associated with Firewall Manager as the Firewall Manager default administrator.
     *)

  
end

module GetAdminScope : sig
  val request :
    Smaws_Lib.Context.t ->
      get_admin_scope_request ->
        (get_admin_scope_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns information about the specified account's administrative scope. The administrative scope defines the resources that an Firewall Manager administrator can manage.
     *)

  
end

module GetAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      get_apps_list_request ->
        (get_apps_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns information about the specified Firewall Manager applications list.
     *)

  
end

module GetComplianceDetail : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_detail_request ->
        (get_compliance_detail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns detailed compliance information about the specified member account. Details include resources that are in and out of compliance with the specified policy.
    
     The reasons for resources being considered compliant depend on the Firewall Manager policy type.
      *)

  
end

module GetNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      get_notification_channel_request ->
        (get_notification_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Information about the Amazon Simple Notification Service (SNS) topic that is used to record Firewall Manager SNS logs.
     *)

  
end

module GetPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_policy_request ->
        (get_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidTypeException of invalid_type_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns information about the specified Firewall Manager policy.
     *)

  
end

module GetProtectionStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_protection_status_request ->
        (get_protection_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    If you created a Shield Advanced policy, returns policy-level attack summary information in the event of a potential DDoS attack. Other policy types are currently unsupported.
     *)

  
end

module GetProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      get_protocols_list_request ->
        (get_protocols_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns information about the specified Firewall Manager protocols list.
     *)

  
end

module GetResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_set_request ->
        (get_resource_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Gets information about a specific resource set.
     *)

  
end

module GetThirdPartyFirewallAssociationStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_third_party_firewall_association_status_request ->
        (get_third_party_firewall_association_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    The onboarding status of a Firewall Manager admin account to third-party firewall vendor tenant.
     *)

  
end

module GetViolationDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_violation_details_request ->
        (get_violation_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves violations for a resource based on the specified Firewall Manager policy and Amazon Web Services account.
     *)

  
end

module ListAdminAccountsForOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      list_admin_accounts_for_organization_request ->
        (list_admin_accounts_for_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns a [AdminAccounts] object that lists the Firewall Manager administrators within the organization that are onboarded to Firewall Manager by [AssociateAdminAccount].
    
     This operation can be called only from the organization's management account.
      *)

  
end

module ListAdminsManagingAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      list_admins_managing_account_request ->
        (list_admins_managing_account_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Lists the accounts that are managing the specified Organizations member account. This is useful for any member account so that they can view the accounts who are managing their account. This operation only returns the managing administrators that have the requested account within their [AdminScope].
     *)

  
end

module ListAppsLists : sig
  val request :
    Smaws_Lib.Context.t ->
      list_apps_lists_request ->
        (list_apps_lists_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns an array of [AppsListDataSummary] objects.
     *)

  
end

module ListComplianceStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_status_request ->
        (list_compliance_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns an array of [PolicyComplianceStatus] objects. Use [PolicyComplianceStatus] to get a summary of which member accounts are protected by the specified policy.
     *)

  
end

module ListDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_discovered_resources_request ->
        (list_discovered_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            
        ]
      ) result
  (** 
    Returns an array of resources in the organization's accounts that are available to be associated with a resource set.
     *)

  
end

module ListMemberAccounts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_member_accounts_request ->
        (list_member_accounts_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns a [MemberAccounts] object that lists the member accounts in the administrator's Amazon Web Services organization.
    
     Either an Firewall Manager administrator or the organization's management account can make this request.
      *)

  
end

module ListPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_policies_request ->
        (list_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns an array of [PolicySummary] objects.
     *)

  
end

module ListProtocolsLists : sig
  val request :
    Smaws_Lib.Context.t ->
      list_protocols_lists_request ->
        (list_protocols_lists_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns an array of [ProtocolsListDataSummary] objects.
     *)

  
end

module ListResourceSetResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_set_resources_request ->
        (list_resource_set_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns an array of resources that are currently associated to a resource set.
     *)

  
end

module ListResourceSets : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_sets_request ->
        (list_resource_sets_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            
        ]
      ) result
  (** 
    Returns an array of [ResourceSetSummary] objects.
     *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves the list of tags for the specified Amazon Web Services resource.
     *)

  
end

module ListThirdPartyFirewallFirewallPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_third_party_firewall_firewall_policies_request ->
        (list_third_party_firewall_firewall_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves a list of all of the third-party firewall policies that are associated with the third-party firewall administrator's account.
     *)

  
end

module PutAdminAccount : sig
  val request :
    Smaws_Lib.Context.t ->
      put_admin_account_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates or updates an Firewall Manager administrator account. The account must be a member of the organization that was onboarded to Firewall Manager by [AssociateAdminAccount]. Only the organization's management account can create an Firewall Manager administrator account. When you create an Firewall Manager administrator account, the service checks to see if the account is already a delegated administrator within Organizations. If the account isn't a delegated administrator, Firewall Manager calls Organizations to delegate the account within Organizations. For more information about administrator accounts within Organizations, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html}Managing the Amazon Web Services Accounts in Your Organization}.
     *)

  
end

module PutAppsList : sig
  val request :
    Smaws_Lib.Context.t ->
      put_apps_list_request ->
        (put_apps_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Creates an Firewall Manager applications list.
     *)

  
end

module PutNotificationChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      put_notification_channel_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Designates the IAM role and Amazon Simple Notification Service (SNS) topic that Firewall Manager uses to record SNS logs.
    
     To perform this action outside of the console, you must first configure the SNS topic's access policy to allow the [SnsRoleName] to publish SNS logs. If the [SnsRoleName] provided is a role other than the [AWSServiceRoleForFMS] service-linked role, this role must have a trust relationship configured to allow the Firewall Manager service principal [fms.amazonaws.com] to assume this role. For information about configuring an SNS access policy, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/fms-security_iam_service-with-iam.html#fms-security_iam_service-with-iam-roles-service}Service roles for Firewall Manager} in the {i Firewall Manager Developer Guide}.
      *)

  
end

module PutPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_policy_request ->
        (put_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidTypeException of invalid_type_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Creates an Firewall Manager policy.
    
     A Firewall Manager policy is specific to the individual policy type. If you want to enforce multiple policy types across accounts, you can create multiple policies. You can create more than one policy for each type.
     
      If you add a new account to an organization that you created with Organizations, Firewall Manager automatically applies the policy to the resources in that account that are within scope of the policy.
      
       Firewall Manager provides the following types of policies:
       
        {ul
             {- {b WAF policy} - This policy applies WAF web ACL protections to specified accounts and resources.
                
                }
              {- {b Shield Advanced policy} - This policy applies Shield Advanced protection to specified accounts and resources.
                 
                 }
              {- {b Security Groups policy} - This type of policy gives you control over security groups that are in use throughout your organization in Organizations and lets you enforce a baseline set of rules across your organization.
                 
                 }
              {- {b Network ACL policy} - This type of policy gives you control over the network ACLs that are in use throughout your organization in Organizations and lets you enforce a baseline set of first and last network ACL rules across your organization.
                 
                 }
              {- {b Network Firewall policy} - This policy applies Network Firewall protection to your organization's VPCs.
                 
                 }
              {- {b DNS Firewall policy} - This policy applies Amazon Route 53 Resolver DNS Firewall protections to your organization's VPCs.
                 
                 }
              {- {b Third-party firewall policy} - This policy applies third-party firewall protections. Third-party firewalls are available by subscription through the Amazon Web Services Marketplace console at {{:http://aws.amazon.com/marketplace}Amazon Web Services Marketplace}.
                 
                  {ul
                       {- {b Palo Alto Networks Cloud NGFW policy} - This policy applies Palo Alto Networks Cloud Next Generation Firewall (NGFW) protections and Palo Alto Networks Cloud NGFW rulestacks to your organization's VPCs.
                          
                          }
                        {- {b Fortigate CNF policy} - This policy applies Fortigate Cloud Native Firewall (CNF) protections. Fortigate CNF is a cloud-centered solution that blocks Zero-Day threats and secures cloud infrastructures with industry-leading advanced threat prevention, smart web application firewalls (WAF), and API protection.
                           
                           }
                       
               }
               }
             
      }
       *)

  
end

module PutProtocolsList : sig
  val request :
    Smaws_Lib.Context.t ->
      put_protocols_list_request ->
        (put_protocols_list_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Creates an Firewall Manager protocols list.
     *)

  
end

module PutResourceSet : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_set_request ->
        (put_resource_set_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates the resource set.
    
     An Firewall Manager resource set defines the resources to import into an Firewall Manager policy from another Amazon Web Services service.
      *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds one or more tags to an Amazon Web Services resource.
     *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidInputException of invalid_input_exception
            | `InvalidOperationException of invalid_operation_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Removes one or more tags from an Amazon Web Services resource.
     *)

  
end

