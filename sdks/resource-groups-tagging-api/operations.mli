open Types 
module DescribeReportCreation : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_report_creation_input ->
        (describe_report_creation_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConstraintViolationException of constraint_violation_exception
            | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Describes the status of the [StartReportCreation] operation.
    
     You can call this operation only from the organization's management account and from the us-east-1 Region.
      *)

  
end

module GetComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_summary_input ->
        (get_compliance_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConstraintViolationException of constraint_violation_exception
            | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Returns a table that shows counts of resources that are noncompliant with their tag policies.
    
     For more information on tag policies, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}Tag Policies} in the {i Organizations User Guide.}
     
      You can call this operation only from the organization's management account and from the us-east-1 Region.
      
       This operation supports pagination, where the response can be sent in multiple pages. You should check the [PaginationToken] response parameter to determine if there are additional results available to return. Repeat the query, passing the [PaginationToken] response parameter value as an input to the next request until you recieve a [null] value. A null value for [PaginationToken] indicates that there are no more results waiting to be returned.
        *)

  
end

module GetResources : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resources_input ->
        (get_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `PaginationTokenExpiredException of pagination_token_expired_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Returns all the tagged or previously tagged resources that are located in the specified Amazon Web Services Region for the account.
    
     Depending on what information you want returned, you can also specify the following:
     
      {ul
           {- {i Filters} that specify what tags and resource types you want returned. The response includes all tags that are associated with the requested resources.
              
              }
            {- Information about compliance with the account's effective tag policy. For more information on tag policies, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}Tag Policies} in the {i Organizations User Guide.}
               
               }
           
      }
       This operation supports pagination, where the response can be sent in multiple pages. You should check the [PaginationToken] response parameter to determine if there are additional results available to return. Repeat the query, passing the [PaginationToken] response parameter value as an input to the next request until you recieve a [null] value. A null value for [PaginationToken] indicates that there are no more results waiting to be returned.
        *)

  
end

module GetTagKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_tag_keys_input ->
        (get_tag_keys_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `PaginationTokenExpiredException of pagination_token_expired_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Returns all tag keys currently in use in the specified Amazon Web Services Region for the calling account.
    
     This operation supports pagination, where the response can be sent in multiple pages. You should check the [PaginationToken] response parameter to determine if there are additional results available to return. Repeat the query, passing the [PaginationToken] response parameter value as an input to the next request until you recieve a [null] value. A null value for [PaginationToken] indicates that there are no more results waiting to be returned.
      *)

  
end

module GetTagValues : sig
  val request :
    Smaws_Lib.Context.t ->
      get_tag_values_input ->
        (get_tag_values_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `PaginationTokenExpiredException of pagination_token_expired_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Returns all tag values for the specified key that are used in the specified Amazon Web Services Region for the calling account.
    
     This operation supports pagination, where the response can be sent in multiple pages. You should check the [PaginationToken] response parameter to determine if there are additional results available to return. Repeat the query, passing the [PaginationToken] response parameter value as an input to the next request until you recieve a [null] value. A null value for [PaginationToken] indicates that there are no more results waiting to be returned.
      *)

  
end

module StartReportCreation : sig
  val request :
    Smaws_Lib.Context.t ->
      start_report_creation_input ->
        (start_report_creation_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `ConstraintViolationException of constraint_violation_exception
            | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Generates a report that lists all tagged resources in the accounts across your organization and tells whether each resource is compliant with the effective tag policy. Compliance data is refreshed daily. The report is generated asynchronously.
    
     The generated report is saved to the following location:
     
      [s3://example-bucket/AwsTagPolicies/o-exampleorgid/YYYY-MM-ddTHH:mm:ssZ/report.csv]
      
       You can call this operation only from the organization's management account and from the us-east-1 Region.
        *)

  
end

module TagResources : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resources_input ->
        (tag_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Applies one or more tags to the specified resources. Note the following:
    
     {ul
          {- Not all resources can have tags. For a list of services with resources that support tagging using this operation, see {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/supported-services.html}Services that support the Resource Groups Tagging API}. If the resource doesn't yet support this operation, the resource's service might support tagging using its own API operations. For more information, refer to the documentation for that service.
             
             }
           {- Each resource can have up to 50 tags. For other limits, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html#tag-conventions}Tag Naming and Usage Conventions} in the {i Amazon Web Services General Reference.}
              
              }
           {- You can only tag resources that are located in the specified Amazon Web Services Region for the Amazon Web Services account.
              
              }
           {- To add tags to a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for adding tags. For more information, see the documentation for each service.
              
              }
          
      }
       Do not store personally identifiable information (PII) or other confidential or sensitive information in tags. We use tags to provide you with billing and administration services. Tags are not intended to be used for private or sensitive data.
       
        {b Minimum permissions}
        
         In addition to the [tag:TagResources] permission required by this operation, you must also have the tagging permission defined by the service that created the resource. For example, to tag an Amazon EC2 instance using the [TagResources] operation, you must have both of the following permissions:
         
          {ul
               {- [tag:TagResource]
                  
                  }
                {- [ec2:CreateTags]
                   
                   }
               
      }
       *)

  
end

module UntagResources : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resources_input ->
        (untag_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Removes the specified tags from the specified resources. When you specify a tag key, the action removes both that key and its associated value. The operation succeeds even if you attempt to remove tags from a resource that were already removed. Note the following:
    
     {ul
          {- To remove tags from a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for removing tags. For more information, see the documentation for the service whose resource you want to untag.
             
             }
           {- You can only tag resources that are located in the specified Amazon Web Services Region for the calling Amazon Web Services account.
              
              }
          
      }
       {b Minimum permissions}
       
        In addition to the [tag:UntagResources] permission required by this operation, you must also have the remove tags permission defined by the service that created the resource. For example, to remove the tags from an Amazon EC2 instance using the [UntagResources] operation, you must have both of the following permissions:
        
         {ul
              {- [tag:UntagResource]
                 
                 }
               {- [ec2:DeleteTags]
                  
                  }
              
      }
       *)

  
end

