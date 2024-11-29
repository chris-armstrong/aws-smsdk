(** 
    Resource Groups Tagging API client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

type error_code = | INVALID_PARAMETER_EXCEPTION
  | INTERNAL_SERVICE_EXCEPTION

(** 
    Information about the errors that are returned for each failed resource. This information can include [InternalServiceException] and [InvalidParameterException] errors. It can also include any valid error code returned by the Amazon Web Services service that hosts the resource that the ARN key represents.
    
     The following are common error codes that you might receive from other Amazon Web Services services:
     
      {ul
           {- {b InternalServiceException} – This can mean that the Resource Groups Tagging API didn't receive a response from another Amazon Web Services service. It can also mean that the resource type in the request is not supported by the Resource Groups Tagging API. In these cases, it's safe to retry the request and then call {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_GetResources.html}GetResources} to verify the changes.
              
              }
            {- {b AccessDeniedException} – This can mean that you need permission to call the tagging operations in the Amazon Web Services service that contains the resource. For example, to use the Resource Groups Tagging API to tag a Amazon CloudWatch alarm resource, you need permission to call both {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_TagResources.html}[TagResources]} {i and} {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html}[TagResource]} in the CloudWatch API.
               
               }
           
      }
       For more information on errors that are generated from other Amazon Web Services services, see the documentation for that service.
        *)
type failure_info = {
  error_message: string option;
  (** 
    The message of the common error.
     *)

  error_code: error_code option;
  (** 
    The code of the common error. Valid values include [InternalServiceException], [InvalidParameterException], and any valid error code returned by the Amazon Web Services service that hosts the resource that you want to tag.
     *)

  status_code: int option;
  (** 
    The HTTP status code of the common error.
     *)

}

type untag_resources_output = {
  failed_resources_map: (string * failure_info) list option;
  (** 
    A map containing a key-value pair for each failed item that couldn't be untagged. The key is the ARN of the failed resource. The value is a [FailureInfo] object that contains an error code, a status code, and an error message. If there are no errors, the [FailedResourcesMap] is empty.
     *)

}

type untag_resources_input = {
  tag_keys: string list;
  (** 
    Specifies a list of tag keys that you want to remove from the specified resources.
     *)

  resource_arn_list: string list;
  (** 
    Specifies a list of ARNs of the resources that you want to remove tags from.
    
     An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.
      *)

}

(** 
    The request was denied to limit the frequency of submitted requests.
     *)
type throttled_exception = {
  message: string option;
  
}

(** 
    This error indicates one of the following:
    
     {ul
          {- A parameter is missing.
             
             }
           {- A malformed string was supplied for the request parameter.
              
              }
           {- An out-of-range value was supplied for the request parameter.
              
              }
           {- The target ID is invalid, unsupported, or doesn't exist.
              
              }
           {- You can't access the Amazon S3 bucket for report storage. For more information, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies-prereqs.html#bucket-policies-org-report}Additional Requirements for Organization-wide Tag Compliance Reports} in the {i Organizations User Guide.}
              
              }
          
      }
       *)
type invalid_parameter_exception = {
  message: string option;
  
}

(** 
    The request processing failed because of an unknown error, exception, or failure. You can retry the request.
     *)
type internal_service_exception = {
  message: string option;
  
}

type target_id_type = | ROOT
  | OU
  | ACCOUNT

type tag_resources_output = {
  failed_resources_map: (string * failure_info) list option;
  (** 
    A map containing a key-value pair for each failed item that couldn't be tagged. The key is the ARN of the failed resource. The value is a [FailureInfo] object that contains an error code, a status code, and an error message. If there are no errors, the [FailedResourcesMap] is empty.
     *)

}

type tag_resources_input = {
  tags: (string * string) list;
  (** 
    Specifies a list of tags that you want to add to the specified resources. A tag consists of a key and a value that you define.
     *)

  resource_arn_list: string list;
  (** 
    Specifies the list of ARNs of the resources that you want to apply tags to.
    
     An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.
      *)

}

(** 
    The metadata that you apply to Amazon Web Services resources to help you categorize and organize them. Each tag consists of a key and a value, both of which you define. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web Services Resources} in the {i Amazon Web Services General Reference}.
     *)
type tag = {
  value: string;
  (** 
    One part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key). The value can be empty or null.
     *)

  key: string;
  (** 
    One part of a key-value pair that makes up a tag. A key is a general label that acts like a category for more specific tag values.
     *)

}

(** 
    A list of tags (keys and values) that are used to specify the associated resources.
     *)
type tag_filter = {
  values: string list option;
  (** 
    One part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key). The value can be empty or null.
     *)

  key: string option;
  (** 
    One part of a key-value pair that makes up a tag. A key is a general label that acts like a category for more specific tag values.
     *)

}

(** 
    A count of noncompliant resources.
     *)
type summary = {
  non_compliant_resources: int option;
  (** 
    The count of noncompliant resources.
     *)

  resource_type: string option;
  (** 
    The Amazon Web Services resource type.
     *)

  region: string option;
  (** 
    The Amazon Web Services Region that the summary applies to.
     *)

  target_id_type: target_id_type option;
  (** 
    Whether the target is an account, an OU, or the organization root.
     *)

  target_id: string option;
  (** 
    The account identifier or the root identifier of the organization. If you don't know the root ID, you can call the Organizations {{:https://docs.aws.amazon.com/organizations/latest/APIReference/API_ListRoots.html}ListRoots} API.
     *)

  last_updated: string option;
  (** 
    The timestamp that shows when this summary was generated in this Region.
     *)

}

type start_report_creation_output = unit

type start_report_creation_input = {
  s3_bucket: string;
  (** 
    The name of the Amazon S3 bucket where the report will be stored; for example:
    
     [awsexamplebucket]
     
      For more information on S3 bucket requirements, including an example bucket policy, see the example S3 bucket policy on this page.
       *)

}

(** 
    The request was denied because performing this operation violates a constraint.
    
     Some of the reasons in the following list might not apply to this specific operation.
     
      {ul
           {- You must meet the prerequisites for using tag policies. For information, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies-prereqs.html}Prerequisites and Permissions for Using Tag Policies} in the {i Organizations User Guide.}
              
              }
            {- You must enable the tag policies service principal ([tagpolicies.tag.amazonaws.com]) to integrate with Organizations For information, see {{:https://docs.aws.amazon.com/organizations/latest/APIReference/API_EnableAWSServiceAccess.html}EnableAWSServiceAccess}.
               
               }
            {- You must have a tag policy attached to the organization root, an OU, or an account.
               
               }
           
      }
       *)
type constraint_violation_exception = {
  message: string option;
  
}

(** 
    The target of the operation is currently being modified by a different request. Try again later.
     *)
type concurrent_modification_exception = {
  message: string option;
  
}

(** 
    Information that shows whether a resource is compliant with the effective tag policy, including details on any noncompliant tag keys.
     *)
type compliance_details = {
  compliance_status: bool option;
  (** 
    Whether a resource is compliant with the effective tag policy.
     *)

  keys_with_noncompliant_values: string list option;
  (** 
    These are keys defined in the effective policy that are on the resource with either incorrect case treatment or noncompliant values.
     *)

  noncompliant_keys: string list option;
  (** 
    These tag keys on the resource are noncompliant with the effective tag policy.
     *)

}

(** 
    A list of resource ARNs and the tags (keys and values) that are associated with each.
     *)
type resource_tag_mapping = {
  compliance_details: compliance_details option;
  (** 
    Information that shows whether a resource is compliant with the effective tag policy, including details on any noncompliant tag keys.
     *)

  tags: tag list option;
  (** 
    The tags that have been applied to one or more Amazon Web Services resources.
     *)

  resource_ar_n: string option;
  (** 
    The ARN of the resource.
     *)

}

(** 
    A [PaginationToken] is valid for a maximum of 15 minutes. Your request was denied because the specified [PaginationToken] has expired.
     *)
type pagination_token_expired_exception = {
  message: string option;
  
}

type get_tag_values_output = {
  tag_values: string list option;
  (** 
    A list of all tag values for the specified key currently used in the specified Amazon Web Services Region for the calling account.
     *)

  pagination_token: string option;
  (** 
    A string that indicates that there is more data available than this response contains. To receive the next part of the response, specify this response value as the [PaginationToken] value in the request for the next page.
     *)

}

type get_tag_values_input = {
  key: string;
  (** 
    Specifies the tag key for which you want to list all existing values that are currently used in the specified Amazon Web Services Region for the calling account.
     *)

  pagination_token: string option;
  (** 
    Specifies a [PaginationToken] response value from a previous request to indicate that you want the next page of results. Leave this parameter empty in your initial request.
     *)

}

type get_tag_keys_output = {
  tag_keys: string list option;
  (** 
    A list of all tag keys in the Amazon Web Services account.
     *)

  pagination_token: string option;
  (** 
    A string that indicates that there is more data available than this response contains. To receive the next part of the response, specify this response value as the [PaginationToken] value in the request for the next page.
     *)

}

type get_tag_keys_input = {
  pagination_token: string option;
  (** 
    Specifies a [PaginationToken] response value from a previous request to indicate that you want the next page of results. Leave this parameter empty in your initial request.
     *)

}

type get_resources_output = {
  resource_tag_mapping_list: resource_tag_mapping list option;
  (** 
    A list of resource ARNs and the tags (keys and values) associated with each.
     *)

  pagination_token: string option;
  (** 
    A string that indicates that there is more data available than this response contains. To receive the next part of the response, specify this response value as the [PaginationToken] value in the request for the next page.
     *)

}

type get_resources_input = {
  resource_arn_list: string list option;
  (** 
    Specifies a list of ARNs of resources for which you want to retrieve tag data. You can't specify both this parameter and any of the pagination parameters ([ResourcesPerPage], [TagsPerPage], [PaginationToken]) in the same request. If you specify both, you get an [Invalid Parameter] exception.
    
     If a resource specified by this parameter doesn't exist, it doesn't generate an error; it simply isn't included in the response.
     
      An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.
       *)

  exclude_compliant_resources: bool option;
  (** 
    Specifies whether to exclude resources that are compliant with the tag policy. Set this to [true] if you are interested in retrieving information on noncompliant resources only.
    
     You can use this parameter only if the [IncludeComplianceDetails] parameter is also set to [true].
      *)

  include_compliance_details: bool option;
  (** 
    Specifies whether to include details regarding the compliance with the effective tag policy. Set this to [true] to determine whether resources are compliant with the tag policy and to get details.
     *)

  resource_type_filters: string list option;
  (** 
    Specifies the resource types that you want included in the response. The format of each resource type is [service\[:resourceType\]]. For example, specifying a resource type of [ec2] returns all Amazon EC2 resources (which includes EC2 instances). Specifying a resource type of [ec2:instance] returns only EC2 instances.
    
     The string for each service name and resource type is the same as that embedded in a resource's Amazon Resource Name (ARN). For the list of services whose resources you can use in this parameter, see {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/supported-services.html}Services that support the Resource Groups Tagging API}.
     
      You can specify multiple resource types by using an array. The array can include up to 100 items. Note that the length constraint requirement applies to each resource type filter. For example, the following string would limit the response to only Amazon EC2 instances, Amazon S3 buckets, or any Audit Manager resource:
      
       [ec2:instance,s3:bucket,auditmanager]
        *)

  tags_per_page: int option;
  (** 
    Amazon Web Services recommends using [ResourcesPerPage] instead of this parameter.
    
     A limit that restricts the number of tags (key and value pairs) returned by [GetResources] in paginated output. A resource with no tags is counted as having one tag (one key and value pair).
     
      [GetResources] does not split a resource and its associated tags across pages. If the specified [TagsPerPage] would cause such a break, a [PaginationToken] is returned in place of the affected resource and its tags. Use that token in another request to get the remaining data. For example, if you specify a [TagsPerPage] of [100] and the account has 22 resources with 10 tags each (meaning that each resource has 10 key and value pairs), the output will consist of three pages. The first page displays the first 10 resources, each with its 10 tags. The second page displays the next 10 resources, each with its 10 tags. The third page displays the remaining 2 resources, each with its 10 tags.
      
       You can set [TagsPerPage] to a minimum of 100 items up to a maximum of 500 items.
        *)

  resources_per_page: int option;
  (** 
    Specifies the maximum number of results to be returned in each page. A query can return fewer than this maximum, even if there are more results still to return. You should always check the [PaginationToken] response value to see if there are more results. You can specify a minimum of 1 and a maximum value of 100.
     *)

  tag_filters: tag_filter list option;
  [@ocaml.doc {| 
    Specifies a list of TagFilters (keys and values) to restrict the output to only those resources that have tags with the specified keys and, if included, the specified values. Each [TagFilter] must contain a key with values optional. A request can include up to 50 keys, and each key can include up to 20 values.
    
     Note the following when deciding how to use TagFilters:
     
      {ul
           {- If you {i don't} specify a [TagFilter], the response includes all resources that are currently tagged or ever had a tag. Resources that currently don't have tags are shown with an empty tag set, like this: ["Tags": \[\]].
              
              }
            {- If you specify more than one filter in a single request, the response returns only those resources that satisfy all filters.
               
               }
            {- If you specify a filter that contains more than one value for a key, the response returns resources that match {i any} of the specified values for that key.
               
               }
            {- If you don't specify a value for a key, the response returns all resources that are tagged with that key, with any or no value.
               
                For example, for the following filters: [filter1= {keyA,{value1}}], [filter2={keyB,{value2,value3,value4}}], [filter3=
                        {keyC}]:
                
                 {ul
                      {- [GetResources({filter1})] returns resources tagged with [key1=value1]
                         
                         }
                       {- [GetResources({filter2})] returns resources tagged with [key2=value2] or [key2=value3] or [key2=value4]
                          
                          }
                       {- [GetResources({filter3})] returns resources tagged with any tag with the key [key3], and with any or no value
                          
                          }
                       {- [GetResources({filter1,filter2,filter3})] returns resources tagged with [(key1=value1) and (key2=value2 or key2=value3 or
                                key2=value4) and (key3, any or no value)]
                          
                          }
                      
             }
             }
           
      }
       |}]

  pagination_token: string option;
  (** 
    Specifies a [PaginationToken] response value from a previous request to indicate that you want the next page of results. Leave this parameter empty in your initial request.
     *)

}

type get_compliance_summary_output = {
  pagination_token: string option;
  (** 
    A string that indicates that there is more data available than this response contains. To receive the next part of the response, specify this response value as the [PaginationToken] value in the request for the next page.
     *)

  summary_list: summary list option;
  (** 
    A table that shows counts of noncompliant resources.
     *)

}

type group_by_attribute = | RESOURCE_TYPE
  | REGION
  | TARGET_ID

type get_compliance_summary_input = {
  pagination_token: string option;
  (** 
    Specifies a [PaginationToken] response value from a previous request to indicate that you want the next page of results. Leave this parameter empty in your initial request.
     *)

  max_results: int option;
  (** 
    Specifies the maximum number of results to be returned in each page. A query can return fewer than this maximum, even if there are more results still to return. You should always check the [PaginationToken] response value to see if there are more results. You can specify a minimum of 1 and a maximum value of 100.
     *)

  group_by: group_by_attribute list option;
  (** 
    Specifies a list of attributes to group the counts of noncompliant resources by. If supplied, the counts are sorted by those attributes.
     *)

  tag_key_filters: string list option;
  (** 
    Specifies that you want the response to include information for only resources that have tags with the specified tag keys. If you use this parameter, the count of returned noncompliant resources includes only resources that have the specified tag keys.
     *)

  resource_type_filters: string list option;
  (** 
    Specifies that you want the response to include information for only resources of the specified types. The format of each resource type is [service\[:resourceType\]]. For example, specifying a resource type of [ec2] returns all Amazon EC2 resources (which includes EC2 instances). Specifying a resource type of [ec2:instance] returns only EC2 instances.
    
     The string for each service name and resource type is the same as that embedded in a resource's Amazon Resource Name (ARN). Consult the {i {{:https://docs.aws.amazon.com/general/latest/gr/}Amazon Web Services General Reference}} for the following:
     
      {ul
           {- For a list of service name strings, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces}Amazon Web Services Service Namespaces}.
              
              }
            {- For resource type strings, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arns-syntax}Example ARNs}.
               
               }
            {- For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces}.
               
               }
           
      }
       You can specify multiple resource types by using a comma separated array. The array can include up to 100 items. Note that the length constraint requirement applies to each resource type filter.
        *)

  region_filters: string list option;
  (** 
    Specifies a list of Amazon Web Services Regions to limit the output to. If you use this parameter, the count of returned noncompliant resources includes only resources in the specified Regions.
     *)

  target_id_filters: string list option;
  (** 
    Specifies target identifiers (usually, specific account IDs) to limit the output by. If you use this parameter, the count of returned noncompliant resources includes only resources with the specified target IDs.
     *)

}

type describe_report_creation_output = {
  error_message: string option;
  (** 
    Details of the common errors that all operations return.
     *)

  start_date: string option;
  (** 
    The date and time that the report was started.
     *)

  s3_location: string option;
  (** 
    The path to the Amazon S3 bucket where the report was stored on creation.
     *)

  status: string option;
  (** 
    Reports the status of the operation.
    
     The operation status can be one of the following:
     
      {ul
           {- [RUNNING] - Report creation is in progress.
              
              }
            {- [SUCCEEDED] - Report creation is complete. You can open the report from the Amazon S3 bucket that you specified when you ran [StartReportCreation].
               
               }
            {- [FAILED] - Report creation timed out or the Amazon S3 bucket is not accessible.
               
               }
            {- [NO REPORT] - No report was generated in the last 90 days.
               
               }
           
      }
       *)

}

type describe_report_creation_input = unit

(** 
    Resource Groups Tagging API *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_failure_info :
  ?error_message:string -> ?error_code:error_code -> ?status_code:int -> unit
-> failure_info
(** Create a {!type-failure_info} type *)

val make_untag_resources_output :
  ?failed_resources_map:(string * failure_info) list -> unit
-> untag_resources_output
(** Create a {!type-untag_resources_output} type *)

val make_untag_resources_input :
  tag_keys:string list -> resource_arn_list:string list -> unit
-> untag_resources_input
(** Create a {!type-untag_resources_input} type *)

val make_tag_resources_output :
  ?failed_resources_map:(string * failure_info) list -> unit
-> tag_resources_output
(** Create a {!type-tag_resources_output} type *)

val make_tag_resources_input :
  tags:(string * string) list -> resource_arn_list:string list -> unit
-> tag_resources_input
(** Create a {!type-tag_resources_input} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_filter : ?values:string list -> ?key:string -> unit
-> tag_filter
(** Create a {!type-tag_filter} type *)

val make_summary :
  ?non_compliant_resources:int ->
  ?resource_type:string ->
  ?region:string ->
  ?target_id_type:target_id_type ->
  ?target_id:string ->
  ?last_updated:string ->
  unit
-> summary
(** Create a {!type-summary} type *)

val make_start_report_creation_output : unit
-> start_report_creation_output
(** Create a {!type-start_report_creation_output} type *)

val make_start_report_creation_input : s3_bucket:string -> unit
-> start_report_creation_input
(** Create a {!type-start_report_creation_input} type *)

val make_compliance_details :
  ?compliance_status:bool ->
  ?keys_with_noncompliant_values:string list ->
  ?noncompliant_keys:string list ->
  unit
-> compliance_details
(** Create a {!type-compliance_details} type *)

val make_resource_tag_mapping :
  ?compliance_details:compliance_details ->
  ?tags:tag list ->
  ?resource_ar_n:string ->
  unit
-> resource_tag_mapping
(** Create a {!type-resource_tag_mapping} type *)

val make_get_tag_values_output :
  ?tag_values:string list -> ?pagination_token:string -> unit
-> get_tag_values_output
(** Create a {!type-get_tag_values_output} type *)

val make_get_tag_values_input :
  ?pagination_token:string -> key:string -> unit
-> get_tag_values_input
(** Create a {!type-get_tag_values_input} type *)

val make_get_tag_keys_output :
  ?tag_keys:string list -> ?pagination_token:string -> unit
-> get_tag_keys_output
(** Create a {!type-get_tag_keys_output} type *)

val make_get_tag_keys_input : ?pagination_token:string -> unit
-> get_tag_keys_input
(** Create a {!type-get_tag_keys_input} type *)

val make_get_resources_output :
  ?resource_tag_mapping_list:resource_tag_mapping list ->
  ?pagination_token:string ->
  unit
-> get_resources_output
(** Create a {!type-get_resources_output} type *)

val make_get_resources_input :
  ?resource_arn_list:string list ->
  ?exclude_compliant_resources:bool ->
  ?include_compliance_details:bool ->
  ?resource_type_filters:string list ->
  ?tags_per_page:int ->
  ?resources_per_page:int ->
  ?tag_filters:tag_filter list ->
  ?pagination_token:string ->
  unit
-> get_resources_input
(** Create a {!type-get_resources_input} type *)

val make_get_compliance_summary_output :
  ?pagination_token:string -> ?summary_list:summary list -> unit
-> get_compliance_summary_output
(** Create a {!type-get_compliance_summary_output} type *)

val make_get_compliance_summary_input :
  ?pagination_token:string ->
  ?max_results:int ->
  ?group_by:group_by_attribute list ->
  ?tag_key_filters:string list ->
  ?resource_type_filters:string list ->
  ?region_filters:string list ->
  ?target_id_filters:string list ->
  unit
-> get_compliance_summary_input
(** Create a {!type-get_compliance_summary_input} type *)

val make_describe_report_creation_output :
  ?error_message:string ->
  ?start_date:string ->
  ?s3_location:string ->
  ?status:string ->
  unit
-> describe_report_creation_output
(** Create a {!type-describe_report_creation_output} type *)

val make_describe_report_creation_input : unit
-> describe_report_creation_input
(** Create a {!type-describe_report_creation_input} type *)

(** {1:operations Operations} *)

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

