(** 
    OpenSearchServerless client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

type vpc_endpoint_status = | PENDING
  | DELETING
  | ACTIVE
  | FAILED

(** 
    The VPC endpoint object.
     *)
type vpc_endpoint_summary = {
  status: vpc_endpoint_status option;
  (** 
    The current status of the endpoint.
     *)

  name: string option;
  (** 
    The name of the endpoint.
     *)

  id: string option;
  (** 
    The unique identifier of the endpoint.
     *)

}

(** 
    Filter the results of a [ListVpcEndpoints] request.
     *)
type vpc_endpoint_filters = {
  status: vpc_endpoint_status option;
  (** 
    The current status of the endpoint.
     *)

}

(** 
    Error information for a failed [BatchGetVpcEndpoint] request.
     *)
type vpc_endpoint_error_detail = {
  error_code: string option;
  (** 
    The error code for the failed request.
     *)

  error_message: string option;
  (** 
    An error message describing the reason for the failure.
     *)

  id: string option;
  (** 
    The unique identifier of the VPC endpoint.
     *)

}

(** 
    Details about an OpenSearch Serverless-managed interface endpoint.
     *)
type vpc_endpoint_detail = {
  created_date: int option;
  (** 
    The date the endpoint was created.
     *)

  status: vpc_endpoint_status option;
  (** 
    The current status of the endpoint.
     *)

  security_group_ids: string list option;
  (** 
    The unique identifiers of the security groups that define the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint.
     *)

  subnet_ids: string list option;
  (** 
    The ID of the subnets from which you access OpenSearch Serverless.
     *)

  vpc_id: string option;
  (** 
    The ID of the VPC from which you access OpenSearch Serverless.
     *)

  name: string option;
  (** 
    The name of the endpoint.
     *)

  id: string option;
  (** 
    The unique identifier of the endpoint.
     *)

}

(** 
    Thrown when the HTTP request contains invalid input or is missing required input.
     *)
type validation_exception = {
  message: string option;
  
}

(** 
    Update details for an OpenSearch Serverless-managed interface endpoint.
     *)
type update_vpc_endpoint_detail = {
  last_modified_date: int option;
  (** 
    The timestamp of when the endpoint was last modified.
     *)

  security_group_ids: string list option;
  (** 
    The unique identifiers of the security groups that define the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint.
     *)

  subnet_ids: string list option;
  (** 
    The ID of the subnets from which you access OpenSearch Serverless.
     *)

  status: vpc_endpoint_status option;
  (** 
    The current status of the endpoint update process.
     *)

  name: string option;
  (** 
    The name of the endpoint.
     *)

  id: string option;
  (** 
    The unique identifier of the endpoint.
     *)

}

type update_vpc_endpoint_response = {
  update_vpc_endpoint_detail: update_vpc_endpoint_detail option;
  (** 
    Details about the updated VPC endpoint.
     *)

}

type update_vpc_endpoint_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  remove_security_group_ids: string list option;
  (** 
    The unique identifiers of the security groups to remove from the endpoint.
     *)

  add_security_group_ids: string list option;
  (** 
    The unique identifiers of the security groups to add to the endpoint. Security groups define the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint.
     *)

  remove_subnet_ids: string list option;
  (** 
    The unique identifiers of the subnets to remove from the endpoint.
     *)

  add_subnet_ids: string list option;
  (** 
    The ID of one or more subnets to add to the endpoint.
     *)

  id: string;
  (** 
    The unique identifier of the interface endpoint to update.
     *)

}

(** 
    Thrown when an error internal to the service occurs while processing a request.
     *)
type internal_server_exception = {
  message: string option;
  
}

(** 
    When creating a resource, thrown when a resource with the same name already exists or is being created. When deleting a resource, thrown when the resource is not in the ACTIVE or FAILED state.
     *)
type conflict_exception = {
  message: string option;
  
}

type security_policy_type = | Encryption
  | Network

type base_document = Json.t

(** 
    Details about an OpenSearch Serverless security policy.
     *)
type security_policy_detail = {
  last_modified_date: int option;
  (** 
    The timestamp of when the policy was last modified.
     *)

  created_date: int option;
  (** 
    The date the policy was created.
     *)

  policy: base_document option;
  (** 
    The JSON policy document without any whitespaces.
     *)

  description: string option;
  (** 
    The description of the security policy.
     *)

  policy_version: string option;
  (** 
    The version of the policy.
     *)

  name: string option;
  (** 
    The name of the policy.
     *)

  type_: security_policy_type option;
  (** 
    The type of security policy.
     *)

}

type update_security_policy_response = {
  security_policy_detail: security_policy_detail option;
  (** 
    Details about the updated security policy.
     *)

}

type update_security_policy_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  policy: string option;
  (** 
    The JSON policy document to use as the content for the new policy.
     *)

  description: string option;
  (** 
    A description of the policy. Typically used to store information about the permissions defined in the policy.
     *)

  policy_version: string;
  (** 
    The version of the policy being updated.
     *)

  name: string;
  (** 
    The name of the policy.
     *)

  type_: security_policy_type;
  (** 
    The type of access policy.
     *)

}

(** 
    Thrown when you attempt to create more resources than the service allows based on service quotas.
     *)
type service_quota_exceeded_exception = {
  quota_code: string option;
  (** 
    Service Quotas requirement to identify originating quota. *)

  service_code: string;
  (** 
    Service Quotas requirement to identify originating service. *)

  resource_type: string option;
  (** 
    Type of the resource affected. *)

  resource_id: string option;
  (** 
    Identifier of the resource affected. *)

  message: string;
  (** 
    Description of the error. *)

}

(** 
    Thrown when accessing or deleting a resource that does not exist.
     *)
type resource_not_found_exception = {
  message: string option;
  
}

type security_config_type = | Saml

(** 
    Describes SAML options for an OpenSearch Serverless security configuration in the form of a key-value map.
     *)
type saml_config_options = {
  session_timeout: int option;
  (** 
    The session timeout, in minutes. Default is 60 minutes (12 hours).
     *)

  group_attribute: string option;
  (** 
    The group attribute for this SAML integration.
     *)

  user_attribute: string option;
  (** 
    A user attribute for this SAML integration.
     *)

  metadata: string;
  (** 
    The XML IdP metadata file generated from your identity provider.
     *)

}

(** 
    Details about a security configuration for OpenSearch Serverless.
     *)
type security_config_detail = {
  last_modified_date: int option;
  (** 
    The timestamp of when the configuration was last modified.
     *)

  created_date: int option;
  (** 
    The date the configuration was created.
     *)

  saml_options: saml_config_options option;
  (** 
    SAML options for the security configuration in the form of a key-value map.
     *)

  description: string option;
  (** 
    The description of the security configuration.
     *)

  config_version: string option;
  (** 
    The version of the security configuration.
     *)

  type_: security_config_type option;
  (** 
    The type of security configuration.
     *)

  id: string option;
  (** 
    The unique identifier of the security configuration.
     *)

}

type update_security_config_response = {
  security_config_detail: security_config_detail option;
  (** 
    Details about the updated security configuration.
     *)

}

type update_security_config_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  saml_options: saml_config_options option;
  (** 
    SAML options in in the form of a key-value map.
     *)

  description: string option;
  (** 
    A description of the security configuration.
     *)

  config_version: string;
  (** 
    The version of the security configuration to be updated. You can find the most recent version of a security configuration using the [GetSecurityPolicy] command.
     *)

  id: string;
  (** 
    The security configuration identifier. For SAML the ID will be [saml/<accountId>/<idpProviderName>]. For example, [saml/123456789123/OKTADev].
     *)

}

type lifecycle_policy_type = | Retention

(** 
    Details about an OpenSearch Serverless lifecycle policy.
     *)
type lifecycle_policy_detail = {
  last_modified_date: int option;
  (** 
    The timestamp of when the lifecycle policy was last modified.
     *)

  created_date: int option;
  (** 
    The date the lifecycle policy was created.
     *)

  policy: base_document option;
  (** 
    The JSON policy document without any whitespaces.
     *)

  description: string option;
  (** 
    The description of the lifecycle policy.
     *)

  policy_version: string option;
  (** 
    The version of the lifecycle policy.
     *)

  name: string option;
  (** 
    The name of the lifecycle policy.
     *)

  type_: lifecycle_policy_type option;
  (** 
    The type of lifecycle policy.
     *)

}

type update_lifecycle_policy_response = {
  lifecycle_policy_detail: lifecycle_policy_detail option;
  (** 
    Details about the updated lifecycle policy.
     *)

}

type update_lifecycle_policy_request = {
  client_token: string option;
  (** 
    A unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  policy: string option;
  (** 
    The JSON policy document to use as the content for the lifecycle policy.
     *)

  description: string option;
  (** 
    A description of the lifecycle policy.
     *)

  policy_version: string;
  (** 
    The version of the policy being updated.
     *)

  name: string;
  (** 
    The name of the policy.
     *)

  type_: lifecycle_policy_type;
  (** 
    The type of lifecycle policy.
     *)

}

type collection_status = | CREATING
  | DELETING
  | ACTIVE
  | FAILED

type collection_type = | SEARCH
  | TIMESERIES
  | VECTORSEARCH

(** 
    Details about an updated OpenSearch Serverless collection.
     *)
type update_collection_detail = {
  last_modified_date: int option;
  (** 
    The date and time when the collection was last modified.
     *)

  created_date: int option;
  (** 
    The date and time when the collection was created.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the collection.
     *)

  description: string option;
  (** 
    The description of the collection.
     *)

  type_: collection_type option;
  (** 
    The collection type.
     *)

  status: collection_status option;
  (** 
    The current status of the collection.
     *)

  name: string option;
  (** 
    The name of the collection.
     *)

  id: string option;
  (** 
    The unique identifier of the collection.
     *)

}

type update_collection_response = {
  update_collection_detail: update_collection_detail option;
  (** 
    Details about the updated collection.
     *)

}

type update_collection_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  description: string option;
  (** 
    A description of the collection.
     *)

  id: string;
  (** 
    The unique identifier of the collection.
     *)

}

(** 
    The maximum capacity limits for all OpenSearch Serverless collections, in OpenSearch Compute Units (OCUs). These limits are used to scale your collections based on the current workload. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html}Managing capacity limits for Amazon OpenSearch Serverless}.
     *)
type capacity_limits = {
  max_search_capacity_in_oc_u: int option;
  (** 
    The maximum search capacity for collections.
     *)

  max_indexing_capacity_in_oc_u: int option;
  (** 
    The maximum indexing capacity for collections.
     *)

}

(** 
    OpenSearch Serverless-related information for the current account.
     *)
type account_settings_detail = {
  capacity_limits: capacity_limits option;
  
}

type update_account_settings_response = {
  account_settings_detail: account_settings_detail option;
  (** 
    OpenSearch Serverless-related settings for the current Amazon Web Services account.
     *)

}

type update_account_settings_request = {
  capacity_limits: capacity_limits option;
  
}

type access_policy_type = | Data

(** 
    Details about an OpenSearch Serverless access policy.
     *)
type access_policy_detail = {
  last_modified_date: int option;
  (** 
    The timestamp of when the policy was last modified.
     *)

  created_date: int option;
  (** 
    The date the policy was created.
     *)

  policy: base_document option;
  (** 
    The JSON policy document without any whitespaces.
     *)

  description: string option;
  (** 
    The description of the policy.
     *)

  policy_version: string option;
  (** 
    The version of the policy.
     *)

  name: string option;
  (** 
    The name of the policy.
     *)

  type_: access_policy_type option;
  (** 
    The type of access policy.
     *)

}

type update_access_policy_response = {
  access_policy_detail: access_policy_detail option;
  (** 
    Details about the updated access policy.
     *)

}

type update_access_policy_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  policy: string option;
  (** 
    The JSON policy document to use as the content for the policy.
     *)

  description: string option;
  (** 
    A description of the policy. Typically used to store information about the permissions defined in the policy.
     *)

  policy_version: string;
  (** 
    The version of the policy being updated.
     *)

  name: string;
  (** 
    The name of the policy.
     *)

  type_: access_policy_type;
  (** 
    The type of policy.
     *)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  (** 
    The tag or set of tags to remove from the resource. All tag keys in the request must be unique.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the resource to remove tags from. The resource must be active (not in the [DELETING] state), and must be owned by the account ID included in the request.
     *)

}

(** 
    A map of key-value pairs associated to an OpenSearch Serverless resource.
     *)
type tag = {
  value: string;
  (** 
    The value of the tag.
     *)

  key: string;
  (** 
    The key to use in the tag.
     *)

}

type tag_resource_response = unit

type tag_resource_request = {
  tags: tag list;
  (** 
    A list of tags (key-value pairs) to add to the resource. All tag keys in the request must be unique.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the resource. The resource must be active (not in the [DELETING] state), and must be owned by the account ID included in the request.
     *)

}

type standby_replicas = | ENABLED
  | DISABLED

(** 
    A summary of a security policy for OpenSearch Serverless.
     *)
type security_policy_summary = {
  last_modified_date: int option;
  (** 
    The timestamp of when the policy was last modified.
     *)

  created_date: int option;
  (** 
    The date the policy was created.
     *)

  description: string option;
  (** 
    The description of the security policy.
     *)

  policy_version: string option;
  (** 
    The version of the policy.
     *)

  name: string option;
  (** 
    The name of the policy.
     *)

  type_: security_policy_type option;
  (** 
    The type of security policy.
     *)

}

(** 
    Statistics for an OpenSearch Serverless security policy.
     *)
type security_policy_stats = {
  network_policy_count: int option;
  (** 
    The number of network policies in the current account.
     *)

  encryption_policy_count: int option;
  (** 
    The number of encryption policies in the current account.
     *)

}

(** 
    A summary of a security configuration for OpenSearch Serverless.
     *)
type security_config_summary = {
  last_modified_date: int option;
  (** 
    The timestamp of when the configuration was last modified.
     *)

  created_date: int option;
  (** 
    The Epoch time when the security configuration was created.
     *)

  description: string option;
  (** 
    The description of the security configuration.
     *)

  config_version: string option;
  (** 
    The version of the security configuration.
     *)

  type_: security_config_type option;
  (** 
    The type of security configuration.
     *)

  id: string option;
  (** 
    The unique identifier of the security configuration.
     *)

}

(** 
    Statistics for an OpenSearch Serverless security configuration.
     *)
type security_config_stats = {
  saml_config_count: int option;
  (** 
    The number of security configurations in the current account.
     *)

}

type resource_type = | Index

type list_tags_for_resource_response = {
  tags: tag list option;
  (** 
    The tags associated with the resource.
     *)

}

type list_tags_for_resource_request = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the resource. The resource must be active (not in the [DELETING] state), and must be owned by the account ID included in the request.
     *)

}

(** 
    Statistics for an OpenSearch Serverless access policy.
     *)
type access_policy_stats = {
  data_policy_count: int option;
  (** 
    The number of data access policies in the current account.
     *)

}

(** 
    Statistics for an OpenSearch Serverless lifecycle policy.
     *)
type lifecycle_policy_stats = {
  retention_policy_count: int option;
  (** 
    The number of retention lifecycle policies in the current account.
     *)

}

type get_policies_stats_response = {
  total_policy_count: int option;
  (** 
    The total number of OpenSearch Serverless security policies and configurations in your account.
     *)

  lifecycle_policy_stats: lifecycle_policy_stats option;
  (** 
    Information about the lifecycle policies in your account.
     *)

  security_config_stats: security_config_stats option;
  (** 
    Information about the security configurations in your account.
     *)

  security_policy_stats: security_policy_stats option;
  (** 
    Information about the security policies in your account.
     *)

  access_policy_stats: access_policy_stats option;
  (** 
    Information about the data access policies in your account.
     *)

}

type get_policies_stats_request = unit

type get_account_settings_response = {
  account_settings_detail: account_settings_detail option;
  (** 
    OpenSearch Serverless-related details for the current account.
     *)

}

type get_account_settings_request = unit

type create_security_policy_response = {
  security_policy_detail: security_policy_detail option;
  (** 
    Details about the created security policy.
     *)

}

type create_security_policy_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  policy: string;
  (** 
    The JSON policy document to use as the content for the new policy.
     *)

  description: string option;
  (** 
    A description of the policy. Typically used to store information about the permissions defined in the policy.
     *)

  name: string;
  (** 
    The name of the policy.
     *)

  type_: security_policy_type;
  (** 
    The type of security policy.
     *)

}

type create_lifecycle_policy_response = {
  lifecycle_policy_detail: lifecycle_policy_detail option;
  (** 
    Details about the created lifecycle policy.
     *)

}

type create_lifecycle_policy_request = {
  client_token: string option;
  (** 
    A unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  policy: string;
  (** 
    The JSON policy document to use as the content for the lifecycle policy.
     *)

  description: string option;
  (** 
    A description of the lifecycle policy.
     *)

  name: string;
  (** 
    The name of the lifecycle policy.
     *)

  type_: lifecycle_policy_type;
  (** 
    The type of lifecycle policy.
     *)

}

type batch_get_vpc_endpoint_response = {
  vpc_endpoint_error_details: vpc_endpoint_error_detail list option;
  (** 
    Error information for a failed request.
     *)

  vpc_endpoint_details: vpc_endpoint_detail list option;
  (** 
    Details about the specified VPC endpoint.
     *)

}

type batch_get_vpc_endpoint_request = {
  ids: string list;
  (** 
    A list of VPC endpoint identifiers.
     *)

}

(** 
    Error information for an OpenSearch Serverless request.
     *)
type lifecycle_policy_error_detail = {
  error_code: string option;
  (** 
    The error code for the request. For example, [NOT_FOUND].
     *)

  error_message: string option;
  (** 
    A description of the error. For example, [The specified Lifecycle Policy is not found].
     *)

  name: string option;
  (** 
    The name of the lifecycle policy.
     *)

  type_: lifecycle_policy_type option;
  (** 
    The type of lifecycle policy.
     *)

}

type batch_get_lifecycle_policy_response = {
  lifecycle_policy_error_details: lifecycle_policy_error_detail list option;
  (** 
    A list of lifecycle policy names and policy types for which retrieval failed.
     *)

  lifecycle_policy_details: lifecycle_policy_detail list option;
  (** 
    A list of lifecycle policies matched to the input policy name and policy type.
     *)

}

(** 
    The unique identifiers of policy types and policy names.
     *)
type lifecycle_policy_identifier = {
  name: string;
  (** 
    The name of the lifecycle policy.
     *)

  type_: lifecycle_policy_type;
  (** 
    The type of lifecycle policy.
     *)

}

type batch_get_lifecycle_policy_request = {
  identifiers: lifecycle_policy_identifier list;
  (** 
    The unique identifiers of policy types and policy names.
     *)

}

(** 
    Error information for an OpenSearch Serverless request.
     *)
type effective_lifecycle_policy_detail = {
  no_min_retention_period: bool option;
  (** 
    The minimum number of index retention days set. That is an optional param that will return as [true] if the minimum number of days or hours is not set to a index resource.
     *)

  retention_period: string option;
  (** 
    The minimum number of index retention in days or hours. This is an optional parameter that will return only if it’s set.
     *)

  resource_type: resource_type option;
  (** 
    The type of OpenSearch Serverless resource. Currently, the only supported resource is [index].
     *)

  policy_name: string option;
  (** 
    The name of the lifecycle policy.
     *)

  resource: string option;
  (** 
    The name of the OpenSearch Serverless index resource.
     *)

  type_: lifecycle_policy_type option;
  (** 
    The type of lifecycle policy.
     *)

}

(** 
    Error information for an OpenSearch Serverless request.
     *)
type effective_lifecycle_policy_error_detail = {
  error_code: string option;
  (** 
    The error code for the request.
     *)

  error_message: string option;
  (** 
    A description of the error. For example, [The specified Index resource is not found].
     *)

  resource: string option;
  (** 
    The name of OpenSearch Serverless index resource.
     *)

  type_: lifecycle_policy_type option;
  (** 
    The type of lifecycle policy.
     *)

}

type batch_get_effective_lifecycle_policy_response = {
  effective_lifecycle_policy_error_details: effective_lifecycle_policy_error_detail list option;
  (** 
    A list of resources for which retrieval failed.
     *)

  effective_lifecycle_policy_details: effective_lifecycle_policy_detail list option;
  (** 
    A list of lifecycle policies applied to the OpenSearch Serverless indexes.
     *)

}

(** 
    The unique identifiers of policy types and resource names.
     *)
type lifecycle_policy_resource_identifier = {
  resource: string;
  (** 
    The name of the OpenSearch Serverless ilndex resource.
     *)

  type_: lifecycle_policy_type;
  (** 
    The type of lifecycle policy.
     *)

}

type batch_get_effective_lifecycle_policy_request = {
  resource_identifiers: lifecycle_policy_resource_identifier list;
  (** 
    The unique identifiers of policy types and resource names.
     *)

}

(** 
    Details about each OpenSearch Serverless collection, including the collection endpoint and the OpenSearch Dashboards endpoint.
     *)
type collection_detail = {
  dashboard_endpoint: string option;
  (** 
    Collection-specific endpoint used to access OpenSearch Dashboards.
     *)

  collection_endpoint: string option;
  (** 
    Collection-specific endpoint used to submit index, search, and data upload requests to an OpenSearch Serverless collection.
     *)

  last_modified_date: int option;
  (** 
    The date and time when the collection was last modified.
     *)

  created_date: int option;
  (** 
    The Epoch time when the collection was created.
     *)

  standby_replicas: standby_replicas option;
  (** 
    Details about an OpenSearch Serverless collection.
     *)

  kms_key_arn: string option;
  (** 
    The ARN of the Amazon Web Services KMS key used to encrypt the collection.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the collection.
     *)

  description: string option;
  (** 
    A description of the collection.
     *)

  type_: collection_type option;
  (** 
    The type of collection.
     *)

  status: collection_status option;
  (** 
    The current status of the collection.
     *)

  name: string option;
  (** 
    The name of the collection.
     *)

  id: string option;
  (** 
    A unique identifier for the collection.
     *)

}

(** 
    Error information for an OpenSearch Serverless request.
     *)
type collection_error_detail = {
  error_code: string option;
  (** 
    The error code for the request. For example, [NOT_FOUND].
     *)

  error_message: string option;
  (** 
    A description of the error. For example, [The specified Collection is not found.]
     *)

  name: string option;
  (** 
    If the request contains collection names, the response includes the names provided in the request.
     *)

  id: string option;
  (** 
    If the request contains collection IDs, the response includes the IDs provided in the request.
     *)

}

type batch_get_collection_response = {
  collection_error_details: collection_error_detail list option;
  (** 
    Error information for the request.
     *)

  collection_details: collection_detail list option;
  (** 
    Details about each collection.
     *)

}

type batch_get_collection_request = {
  names: string list option;
  (** 
    A list of collection names. You can't provide names and IDs in the same request.
     *)

  ids: string list option;
  (** 
    A list of collection IDs. You can't provide names and IDs in the same request. The ID is part of the collection endpoint. You can also retrieve it using the {{:https://docs.aws.amazon.com/opensearch-service/latest/ServerlessAPIReference/API_ListCollections.html}ListCollections} API.
     *)

}

(** 
    Use the Amazon OpenSearch Serverless API to create, configure, and manage OpenSearch Serverless collections and security policies.
    
     OpenSearch Serverless is an on-demand, pre-provisioned serverless configuration for Amazon OpenSearch Service. OpenSearch Serverless removes the operational complexities of provisioning, configuring, and tuning your OpenSearch clusters. It enables you to easily search and analyze petabytes of data without having to worry about the underlying infrastructure and data management.
     
      To learn more about OpenSearch Serverless, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-overview.html}What is Amazon OpenSearch Serverless?}
       *)


(** 
    Thrown when the collection you're attempting to create results in a number of search or indexing OCUs that exceeds the account limit.
     *)
type ocu_limit_exceeded_exception = {
  message: string;
  (** 
    Description of the error. *)

}

type list_vpc_endpoints_response = {
  next_token: string option;
  (** 
    When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.
     *)

  vpc_endpoint_summaries: vpc_endpoint_summary list option;
  (** 
    Details about each VPC endpoint, including the name and current status.
     *)

}

type list_vpc_endpoints_request = {
  max_results: int option;
  (** 
    An optional parameter that specifies the maximum number of results to return. You can use [nextToken] to get the next page of results. The default is 20.
     *)

  next_token: string option;
  (** 
    If your initial [ListVpcEndpoints] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListVpcEndpoints] operations, which returns results in the next page.
     *)

  vpc_endpoint_filters: vpc_endpoint_filters option;
  (** 
    Filter the results according to the current status of the VPC endpoint. Possible statuses are [CREATING], [DELETING], [UPDATING], [ACTIVE], and [FAILED].
     *)

}

type list_security_policies_response = {
  next_token: string option;
  (** 
    When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.
     *)

  security_policy_summaries: security_policy_summary list option;
  (** 
    Details about the security policies in your account.
     *)

}

type list_security_policies_request = {
  max_results: int option;
  (** 
    An optional parameter that specifies the maximum number of results to return. You can use [nextToken] to get the next page of results. The default is 20.
     *)

  next_token: string option;
  (** 
    If your initial [ListSecurityPolicies] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListSecurityPolicies] operations, which returns results in the next page.
     *)

  resource: string list option;
  (** 
    Resource filters (can be collection or indexes) that policies can apply to.
     *)

  type_: security_policy_type;
  (** 
    The type of policy.
     *)

}

type list_security_configs_response = {
  next_token: string option;
  (** 
    When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.
     *)

  security_config_summaries: security_config_summary list option;
  (** 
    Details about the security configurations in your account.
     *)

}

type list_security_configs_request = {
  max_results: int option;
  (** 
    An optional parameter that specifies the maximum number of results to return. You can use [nextToken] to get the next page of results. The default is 20.
     *)

  next_token: string option;
  (** 
    If your initial [ListSecurityConfigs] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListSecurityConfigs] operations, which returns results in the next page.
     *)

  type_: security_config_type;
  (** 
    The type of security configuration.
     *)

}

(** 
    A summary of the lifecycle policy.
     *)
type lifecycle_policy_summary = {
  last_modified_date: int option;
  (** 
    The date and time when the lifecycle policy was last modified.
     *)

  created_date: int option;
  (** 
    The Epoch time when the lifecycle policy was created.
     *)

  description: string option;
  (** 
    The description of the lifecycle policy.
     *)

  policy_version: string option;
  (** 
    The version of the lifecycle policy.
     *)

  name: string option;
  (** 
    The name of the lifecycle policy.
     *)

  type_: lifecycle_policy_type option;
  (** 
    The type of lifecycle policy.
     *)

}

type list_lifecycle_policies_response = {
  next_token: string option;
  (** 
    When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.
     *)

  lifecycle_policy_summaries: lifecycle_policy_summary list option;
  (** 
    Details about the requested lifecycle policies.
     *)

}

type list_lifecycle_policies_request = {
  max_results: int option;
  (** 
    An optional parameter that specifies the maximum number of results to return. You can use use [nextToken] to get the next page of results. The default is 10.
     *)

  next_token: string option;
  (** 
    If your initial [ListLifecyclePolicies] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListLifecyclePolicies] operations, which returns results in the next page.
     *)

  resources: string list option;
  (** 
    Resource filters that policies can apply to. Currently, the only supported resource type is [index].
     *)

  type_: lifecycle_policy_type;
  (** 
    The type of lifecycle policy.
     *)

}

(** 
    Details about each OpenSearch Serverless collection.
     *)
type collection_summary = {
  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the collection.
     *)

  status: collection_status option;
  (** 
    The current status of the collection.
     *)

  name: string option;
  (** 
    The name of the collection.
     *)

  id: string option;
  (** 
    The unique identifier of the collection.
     *)

}

type list_collections_response = {
  next_token: string option;
  (** 
    When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.
     *)

  collection_summaries: collection_summary list option;
  (** 
    Details about each collection.
     *)

}

(** 
    A list of filter keys that you can use for LIST, UPDATE, and DELETE requests to OpenSearch Serverless collections.
     *)
type collection_filters = {
  status: collection_status option;
  (** 
    The current status of the collection.
     *)

  name: string option;
  (** 
    The name of the collection.
     *)

}

type list_collections_request = {
  max_results: int option;
  (** 
    The maximum number of results to return. Default is 20. You can use [nextToken] to get the next page of results.
     *)

  next_token: string option;
  (** 
    If your initial [ListCollections] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListCollections] operations, which returns results in the next page.
     *)

  collection_filters: collection_filters option;
  (** 
    A list of filter names and values that you can use for requests.
     *)

}

(** 
    A summary of the data access policy.
     *)
type access_policy_summary = {
  last_modified_date: int option;
  (** 
    The date and time when the collection was last modified.
     *)

  created_date: int option;
  (** 
    The Epoch time when the access policy was created.
     *)

  description: string option;
  (** 
    The description of the access policy.
     *)

  policy_version: string option;
  (** 
    The version of the policy.
     *)

  name: string option;
  (** 
    The name of the access policy.
     *)

  type_: access_policy_type option;
  (** 
    The type of access policy. Currently, the only available type is [data].
     *)

}

type list_access_policies_response = {
  next_token: string option;
  (** 
    When [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page.
     *)

  access_policy_summaries: access_policy_summary list option;
  (** 
    Details about the requested access policies.
     *)

}

type list_access_policies_request = {
  max_results: int option;
  (** 
    An optional parameter that specifies the maximum number of results to return. You can use [nextToken] to get the next page of results. The default is 20.
     *)

  next_token: string option;
  (** 
    If your initial [ListAccessPolicies] operation returns a [nextToken], you can include the returned [nextToken] in subsequent [ListAccessPolicies] operations, which returns results in the next page.
     *)

  resource: string list option;
  (** 
    Resource filters (can be collections or indexes) that policies can apply to.
     *)

  type_: access_policy_type;
  (** 
    The type of access policy.
     *)

}

type get_security_policy_response = {
  security_policy_detail: security_policy_detail option;
  (** 
    Details about the requested security policy.
     *)

}

type get_security_policy_request = {
  name: string;
  (** 
    The name of the security policy.
     *)

  type_: security_policy_type;
  (** 
    The type of security policy.
     *)

}

type get_security_config_response = {
  security_config_detail: security_config_detail option;
  (** 
    Details of the requested security configuration.
     *)

}

type get_security_config_request = {
  id: string;
  (** 
    The unique identifier of the security configuration.
     *)

}

type get_access_policy_response = {
  access_policy_detail: access_policy_detail option;
  (** 
    Details about the requested access policy.
     *)

}

type get_access_policy_request = {
  name: string;
  (** 
    The name of the access policy.
     *)

  type_: access_policy_type;
  (** 
    Tye type of policy. Currently, the only supported value is [data].
     *)

}

(** 
    Deletion details for an OpenSearch Serverless-managed interface endpoint.
     *)
type delete_vpc_endpoint_detail = {
  status: vpc_endpoint_status option;
  (** 
    The current status of the endpoint deletion process.
     *)

  name: string option;
  (** 
    The name of the endpoint.
     *)

  id: string option;
  (** 
    The unique identifier of the endpoint.
     *)

}

type delete_vpc_endpoint_response = {
  delete_vpc_endpoint_detail: delete_vpc_endpoint_detail option;
  (** 
    Details about the deleted endpoint.
     *)

}

type delete_vpc_endpoint_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  id: string;
  (** 
    The VPC endpoint identifier.
     *)

}

type delete_security_policy_response = unit

type delete_security_policy_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  name: string;
  (** 
    The name of the policy to delete.
     *)

  type_: security_policy_type;
  (** 
    The type of policy.
     *)

}

type delete_security_config_response = unit

type delete_security_config_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  id: string;
  (** 
    The security configuration identifier. For SAML the ID will be [saml/<accountId>/<idpProviderName>]. For example, [saml/123456789123/OKTADev].
     *)

}

type delete_lifecycle_policy_response = unit

type delete_lifecycle_policy_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  name: string;
  (** 
    The name of the policy to delete.
     *)

  type_: lifecycle_policy_type;
  (** 
    The type of lifecycle policy.
     *)

}

(** 
    Details about a deleted OpenSearch Serverless collection.
     *)
type delete_collection_detail = {
  status: collection_status option;
  (** 
    The current status of the collection.
     *)

  name: string option;
  (** 
    The name of the collection.
     *)

  id: string option;
  (** 
    The unique identifier of the collection.
     *)

}

type delete_collection_response = {
  delete_collection_detail: delete_collection_detail option;
  (** 
    Details of the deleted collection.
     *)

}

type delete_collection_request = {
  client_token: string option;
  (** 
    A unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  id: string;
  (** 
    The unique identifier of the collection. For example, [1iu5usc406kd]. The ID is part of the collection endpoint. You can also retrieve it using the {{:https://docs.aws.amazon.com/opensearch-service/latest/ServerlessAPIReference/API_ListCollections.html}ListCollections} API.
     *)

}

type delete_access_policy_response = unit

type delete_access_policy_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  name: string;
  (** 
    The name of the policy to delete.
     *)

  type_: access_policy_type;
  (** 
    The type of policy.
     *)

}

(** 
    Creation details for an OpenSearch Serverless-managed interface endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.
     *)
type create_vpc_endpoint_detail = {
  status: vpc_endpoint_status option;
  (** 
    The current status in the endpoint creation process.
     *)

  name: string option;
  (** 
    The name of the endpoint.
     *)

  id: string option;
  (** 
    The unique identifier of the endpoint.
     *)

}

type create_vpc_endpoint_response = {
  create_vpc_endpoint_detail: create_vpc_endpoint_detail option;
  (** 
    Details about the created interface VPC endpoint.
     *)

}

type create_vpc_endpoint_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  security_group_ids: string list option;
  (** 
    The unique identifiers of the security groups that define the ports, protocols, and sources for inbound traffic that you are authorizing into your endpoint.
     *)

  subnet_ids: string list;
  (** 
    The ID of one or more subnets from which you'll access OpenSearch Serverless.
     *)

  vpc_id: string;
  (** 
    The ID of the VPC from which you'll access OpenSearch Serverless.
     *)

  name: string;
  (** 
    The name of the interface endpoint.
     *)

}

type create_security_config_response = {
  security_config_detail: security_config_detail option;
  (** 
    Details about the created security configuration.
     *)

}

type create_security_config_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  saml_options: saml_config_options option;
  (** 
    Describes SAML options in in the form of a key-value map. This field is required if you specify [saml] for the [type] parameter.
     *)

  description: string option;
  (** 
    A description of the security configuration.
     *)

  name: string;
  (** 
    The name of the security configuration.
     *)

  type_: security_config_type;
  (** 
    The type of security configuration.
     *)

}

(** 
    Details about the created OpenSearch Serverless collection.
     *)
type create_collection_detail = {
  last_modified_date: int option;
  (** 
    The date and time when the collection was last modified.
     *)

  created_date: int option;
  (** 
    The Epoch time when the collection was created.
     *)

  standby_replicas: standby_replicas option;
  (** 
    Creates details about an OpenSearch Serverless collection.
     *)

  kms_key_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the KMS key with which to encrypt the collection.
     *)

  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the collection.
     *)

  description: string option;
  (** 
    A description of the collection.
     *)

  type_: collection_type option;
  (** 
    The type of collection.
     *)

  status: collection_status option;
  (** 
    The current status of the collection.
     *)

  name: string option;
  (** 
    The name of the collection.
     *)

  id: string option;
  (** 
    The unique identifier of the collection.
     *)

}

type create_collection_response = {
  create_collection_detail: create_collection_detail option;
  (** 
    Details about the collection.
     *)

}

type create_collection_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  standby_replicas: standby_replicas option;
  (** 
    Indicates whether standby replicas should be used for a collection.
     *)

  tags: tag list option;
  (** 
    An arbitrary set of tags (key–value pairs) to associate with the OpenSearch Serverless collection.
     *)

  description: string option;
  (** 
    Description of the collection.
     *)

  type_: collection_type option;
  (** 
    The type of collection.
     *)

  name: string;
  (** 
    Name of the collection.
     *)

}

type create_access_policy_response = {
  access_policy_detail: access_policy_detail option;
  (** 
    Details about the created access policy.
     *)

}

type create_access_policy_request = {
  client_token: string option;
  (** 
    Unique, case-sensitive identifier to ensure idempotency of the request.
     *)

  policy: string;
  (** 
    The JSON policy document to use as the content for the policy.
     *)

  description: string option;
  (** 
    A description of the policy. Typically used to store information about the permissions defined in the policy.
     *)

  name: string;
  (** 
    The name of the policy.
     *)

  type_: access_policy_type;
  (** 
    The type of policy.
     *)

}

(** {1:builders Builders} *)

val make_vpc_endpoint_summary :
  ?status:vpc_endpoint_status -> ?name:string -> ?id:string -> unit
-> vpc_endpoint_summary

val make_vpc_endpoint_filters : ?status:vpc_endpoint_status -> unit
-> vpc_endpoint_filters

val make_vpc_endpoint_error_detail :
  ?error_code:string -> ?error_message:string -> ?id:string -> unit
-> vpc_endpoint_error_detail

val make_vpc_endpoint_detail :
  ?created_date:int ->
  ?status:vpc_endpoint_status ->
  ?security_group_ids:string list ->
  ?subnet_ids:string list ->
  ?vpc_id:string ->
  ?name:string ->
  ?id:string ->
  unit -> vpc_endpoint_detail

val make_update_vpc_endpoint_detail :
  ?last_modified_date:int ->
  ?security_group_ids:string list ->
  ?subnet_ids:string list ->
  ?status:vpc_endpoint_status ->
  ?name:string ->
  ?id:string ->
  unit -> update_vpc_endpoint_detail

val make_update_vpc_endpoint_response :
  ?update_vpc_endpoint_detail:update_vpc_endpoint_detail -> unit
-> update_vpc_endpoint_response

val make_update_vpc_endpoint_request :
  ?client_token:string ->
  ?remove_security_group_ids:string list ->
  ?add_security_group_ids:string list ->
  ?remove_subnet_ids:string list ->
  ?add_subnet_ids:string list ->
  id:string ->
  unit -> update_vpc_endpoint_request

val make_security_policy_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?policy:base_document ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:security_policy_type ->
  unit -> security_policy_detail

val make_update_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit
-> update_security_policy_response

val make_update_security_policy_request :
  ?client_token:string ->
  ?policy:string ->
  ?description:string ->
  policy_version:string ->
  name:string ->
  type_:security_policy_type ->
  unit -> update_security_policy_request

val make_saml_config_options :
  ?session_timeout:int ->
  ?group_attribute:string ->
  ?user_attribute:string ->
  metadata:string ->
  unit -> saml_config_options

val make_security_config_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?saml_options:saml_config_options ->
  ?description:string ->
  ?config_version:string ->
  ?type_:security_config_type ->
  ?id:string ->
  unit -> security_config_detail

val make_update_security_config_response :
  ?security_config_detail:security_config_detail -> unit
-> update_security_config_response

val make_update_security_config_request :
  ?client_token:string ->
  ?saml_options:saml_config_options ->
  ?description:string ->
  config_version:string ->
  id:string ->
  unit -> update_security_config_request

val make_lifecycle_policy_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?policy:base_document ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:lifecycle_policy_type ->
  unit -> lifecycle_policy_detail

val make_update_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail -> unit
-> update_lifecycle_policy_response

val make_update_lifecycle_policy_request :
  ?client_token:string ->
  ?policy:string ->
  ?description:string ->
  policy_version:string ->
  name:string ->
  type_:lifecycle_policy_type ->
  unit -> update_lifecycle_policy_request

val make_update_collection_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?arn:string ->
  ?description:string ->
  ?type_:collection_type ->
  ?status:collection_status ->
  ?name:string ->
  ?id:string ->
  unit -> update_collection_detail

val make_update_collection_response :
  ?update_collection_detail:update_collection_detail -> unit
-> update_collection_response

val make_update_collection_request :
  ?client_token:string -> ?description:string -> id:string -> unit
-> update_collection_request

val make_capacity_limits :
  ?max_search_capacity_in_oc_u:int ->
  ?max_indexing_capacity_in_oc_u:int ->
  unit -> capacity_limits

val make_account_settings_detail : ?capacity_limits:capacity_limits -> unit
-> account_settings_detail

val make_update_account_settings_response :
  ?account_settings_detail:account_settings_detail -> unit
-> update_account_settings_response

val make_update_account_settings_request :
  ?capacity_limits:capacity_limits -> unit
-> update_account_settings_request

val make_access_policy_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?policy:base_document ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:access_policy_type ->
  unit -> access_policy_detail

val make_update_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit
-> update_access_policy_response

val make_update_access_policy_request :
  ?client_token:string ->
  ?policy:string ->
  ?description:string ->
  policy_version:string ->
  name:string ->
  type_:access_policy_type ->
  unit -> update_access_policy_request

val make_untag_resource_response : unit
-> untag_resource_response

val make_untag_resource_request :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_request

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_response : unit
-> tag_resource_response

val make_tag_resource_request : tags:tag list -> resource_arn:string -> unit
-> tag_resource_request

val make_security_policy_summary :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:security_policy_type ->
  unit -> security_policy_summary

val make_security_policy_stats :
  ?network_policy_count:int -> ?encryption_policy_count:int -> unit
-> security_policy_stats

val make_security_config_summary :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?description:string ->
  ?config_version:string ->
  ?type_:security_config_type ->
  ?id:string ->
  unit -> security_config_summary

val make_security_config_stats : ?saml_config_count:int -> unit
-> security_config_stats

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response

val make_list_tags_for_resource_request : resource_arn:string -> unit
-> list_tags_for_resource_request

val make_access_policy_stats : ?data_policy_count:int -> unit
-> access_policy_stats

val make_lifecycle_policy_stats : ?retention_policy_count:int -> unit
-> lifecycle_policy_stats

val make_get_policies_stats_response :
  ?total_policy_count:int ->
  ?lifecycle_policy_stats:lifecycle_policy_stats ->
  ?security_config_stats:security_config_stats ->
  ?security_policy_stats:security_policy_stats ->
  ?access_policy_stats:access_policy_stats ->
  unit -> get_policies_stats_response

val make_get_policies_stats_request : unit
-> get_policies_stats_request

val make_get_account_settings_response :
  ?account_settings_detail:account_settings_detail -> unit
-> get_account_settings_response

val make_get_account_settings_request : unit
-> get_account_settings_request

val make_create_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit
-> create_security_policy_response

val make_create_security_policy_request :
  ?client_token:string ->
  ?description:string ->
  policy:string ->
  name:string ->
  type_:security_policy_type ->
  unit
-> create_security_policy_request

val make_create_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail -> unit
-> create_lifecycle_policy_response

val make_create_lifecycle_policy_request :
  ?client_token:string ->
  ?description:string ->
  policy:string ->
  name:string ->
  type_:lifecycle_policy_type ->
  unit
-> create_lifecycle_policy_request

val make_batch_get_vpc_endpoint_response :
  ?vpc_endpoint_error_details:vpc_endpoint_error_detail list ->
  ?vpc_endpoint_details:vpc_endpoint_detail list ->
  unit
-> batch_get_vpc_endpoint_response

val make_batch_get_vpc_endpoint_request : ids:string list -> unit
-> batch_get_vpc_endpoint_request

val make_lifecycle_policy_error_detail :
  ?error_code:string ->
  ?error_message:string ->
  ?name:string ->
  ?type_:lifecycle_policy_type ->
  unit
-> lifecycle_policy_error_detail

val make_batch_get_lifecycle_policy_response :
  ?lifecycle_policy_error_details:lifecycle_policy_error_detail list ->
  ?lifecycle_policy_details:lifecycle_policy_detail list ->
  unit
-> batch_get_lifecycle_policy_response

val make_lifecycle_policy_identifier :
  name:string -> type_:lifecycle_policy_type -> unit
-> lifecycle_policy_identifier

val make_batch_get_lifecycle_policy_request :
  identifiers:lifecycle_policy_identifier list -> unit
-> batch_get_lifecycle_policy_request

val make_effective_lifecycle_policy_detail :
  ?no_min_retention_period:bool ->
  ?retention_period:string ->
  ?resource_type:resource_type ->
  ?policy_name:string ->
  ?resource:string ->
  ?type_:lifecycle_policy_type ->
  unit
-> effective_lifecycle_policy_detail

val make_effective_lifecycle_policy_error_detail :
  ?error_code:string ->
  ?error_message:string ->
  ?resource:string ->
  ?type_:lifecycle_policy_type ->
  unit
-> effective_lifecycle_policy_error_detail

val make_batch_get_effective_lifecycle_policy_response :
  ?effective_lifecycle_policy_error_details:effective_lifecycle_policy_error_detail list ->
  ?effective_lifecycle_policy_details:effective_lifecycle_policy_detail list ->
  unit
-> batch_get_effective_lifecycle_policy_response

val make_lifecycle_policy_resource_identifier :
  resource:string -> type_:lifecycle_policy_type -> unit
-> lifecycle_policy_resource_identifier

val make_batch_get_effective_lifecycle_policy_request :
  resource_identifiers:lifecycle_policy_resource_identifier list -> unit
-> batch_get_effective_lifecycle_policy_request

val make_collection_detail :
  ?dashboard_endpoint:string ->
  ?collection_endpoint:string ->
  ?last_modified_date:int ->
  ?created_date:int ->
  ?standby_replicas:standby_replicas ->
  ?kms_key_arn:string ->
  ?arn:string ->
  ?description:string ->
  ?type_:collection_type ->
  ?status:collection_status ->
  ?name:string ->
  ?id:string ->
  unit -> collection_detail

val make_collection_error_detail :
  ?error_code:string ->
  ?error_message:string ->
  ?name:string ->
  ?id:string ->
  unit -> collection_error_detail

val make_batch_get_collection_response :
  ?collection_error_details:collection_error_detail list ->
  ?collection_details:collection_detail list ->
  unit
-> batch_get_collection_response

val make_batch_get_collection_request :
  ?names:string list -> ?ids:string list -> unit
-> batch_get_collection_request

val make_list_vpc_endpoints_response :
  ?next_token:string ->
  ?vpc_endpoint_summaries:vpc_endpoint_summary list ->
  unit -> list_vpc_endpoints_response

val make_list_vpc_endpoints_request :
  ?max_results:int ->
  ?next_token:string ->
  ?vpc_endpoint_filters:vpc_endpoint_filters ->
  unit
-> list_vpc_endpoints_request

val make_list_security_policies_response :
  ?next_token:string ->
  ?security_policy_summaries:security_policy_summary list ->
  unit
-> list_security_policies_response

val make_list_security_policies_request :
  ?max_results:int ->
  ?next_token:string ->
  ?resource:string list ->
  type_:security_policy_type ->
  unit
-> list_security_policies_request

val make_list_security_configs_response :
  ?next_token:string ->
  ?security_config_summaries:security_config_summary list ->
  unit
-> list_security_configs_response

val make_list_security_configs_request :
  ?max_results:int ->
  ?next_token:string ->
  type_:security_config_type ->
  unit -> list_security_configs_request

val make_lifecycle_policy_summary :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:lifecycle_policy_type ->
  unit -> lifecycle_policy_summary

val make_list_lifecycle_policies_response :
  ?next_token:string ->
  ?lifecycle_policy_summaries:lifecycle_policy_summary list ->
  unit
-> list_lifecycle_policies_response

val make_list_lifecycle_policies_request :
  ?max_results:int ->
  ?next_token:string ->
  ?resources:string list ->
  type_:lifecycle_policy_type ->
  unit -> list_lifecycle_policies_request

val make_collection_summary :
  ?arn:string ->
  ?status:collection_status ->
  ?name:string ->
  ?id:string ->
  unit -> collection_summary

val make_list_collections_response :
  ?next_token:string -> ?collection_summaries:collection_summary list -> unit
-> list_collections_response

val make_collection_filters :
  ?status:collection_status -> ?name:string -> unit
-> collection_filters

val make_list_collections_request :
  ?max_results:int ->
  ?next_token:string ->
  ?collection_filters:collection_filters ->
  unit -> list_collections_request

val make_access_policy_summary :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?description:string ->
  ?policy_version:string ->
  ?name:string ->
  ?type_:access_policy_type ->
  unit -> access_policy_summary

val make_list_access_policies_response :
  ?next_token:string ->
  ?access_policy_summaries:access_policy_summary list ->
  unit
-> list_access_policies_response

val make_list_access_policies_request :
  ?max_results:int ->
  ?next_token:string ->
  ?resource:string list ->
  type_:access_policy_type ->
  unit -> list_access_policies_request

val make_get_security_policy_response :
  ?security_policy_detail:security_policy_detail -> unit
-> get_security_policy_response

val make_get_security_policy_request :
  name:string -> type_:security_policy_type -> unit
-> get_security_policy_request

val make_get_security_config_response :
  ?security_config_detail:security_config_detail -> unit
-> get_security_config_response

val make_get_security_config_request : id:string -> unit
-> get_security_config_request

val make_get_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit
-> get_access_policy_response

val make_get_access_policy_request :
  name:string -> type_:access_policy_type -> unit
-> get_access_policy_request

val make_delete_vpc_endpoint_detail :
  ?status:vpc_endpoint_status -> ?name:string -> ?id:string -> unit
-> delete_vpc_endpoint_detail

val make_delete_vpc_endpoint_response :
  ?delete_vpc_endpoint_detail:delete_vpc_endpoint_detail -> unit
-> delete_vpc_endpoint_response

val make_delete_vpc_endpoint_request :
  ?client_token:string -> id:string -> unit
-> delete_vpc_endpoint_request

val make_delete_security_policy_response : unit
-> delete_security_policy_response

val make_delete_security_policy_request :
  ?client_token:string -> name:string -> type_:security_policy_type -> unit
-> delete_security_policy_request

val make_delete_security_config_response : unit
-> delete_security_config_response

val make_delete_security_config_request :
  ?client_token:string -> id:string -> unit
-> delete_security_config_request

val make_delete_lifecycle_policy_response : unit
-> delete_lifecycle_policy_response

val make_delete_lifecycle_policy_request :
  ?client_token:string -> name:string -> type_:lifecycle_policy_type -> unit
-> delete_lifecycle_policy_request

val make_delete_collection_detail :
  ?status:collection_status -> ?name:string -> ?id:string -> unit
-> delete_collection_detail

val make_delete_collection_response :
  ?delete_collection_detail:delete_collection_detail -> unit
-> delete_collection_response

val make_delete_collection_request :
  ?client_token:string -> id:string -> unit
-> delete_collection_request

val make_delete_access_policy_response : unit
-> delete_access_policy_response

val make_delete_access_policy_request :
  ?client_token:string -> name:string -> type_:access_policy_type -> unit
-> delete_access_policy_request

val make_create_vpc_endpoint_detail :
  ?status:vpc_endpoint_status -> ?name:string -> ?id:string -> unit
-> create_vpc_endpoint_detail

val make_create_vpc_endpoint_response :
  ?create_vpc_endpoint_detail:create_vpc_endpoint_detail -> unit
-> create_vpc_endpoint_response

val make_create_vpc_endpoint_request :
  ?client_token:string ->
  ?security_group_ids:string list ->
  subnet_ids:string list ->
  vpc_id:string ->
  name:string ->
  unit
-> create_vpc_endpoint_request

val make_create_security_config_response :
  ?security_config_detail:security_config_detail -> unit
-> create_security_config_response

val make_create_security_config_request :
  ?client_token:string ->
  ?saml_options:saml_config_options ->
  ?description:string ->
  name:string ->
  type_:security_config_type ->
  unit -> create_security_config_request

val make_create_collection_detail :
  ?last_modified_date:int ->
  ?created_date:int ->
  ?standby_replicas:standby_replicas ->
  ?kms_key_arn:string ->
  ?arn:string ->
  ?description:string ->
  ?type_:collection_type ->
  ?status:collection_status ->
  ?name:string ->
  ?id:string ->
  unit -> create_collection_detail

val make_create_collection_response :
  ?create_collection_detail:create_collection_detail -> unit
-> create_collection_response

val make_create_collection_request :
  ?client_token:string ->
  ?standby_replicas:standby_replicas ->
  ?tags:tag list ->
  ?description:string ->
  ?type_:collection_type ->
  name:string ->
  unit -> create_collection_request

val make_create_access_policy_response :
  ?access_policy_detail:access_policy_detail -> unit
-> create_access_policy_response

val make_create_access_policy_request :
  ?client_token:string ->
  ?description:string ->
  policy:string ->
  name:string ->
  type_:access_policy_type ->
  unit
-> create_access_policy_request

(** {1:operations Operations} *)

module CreateAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      create_access_policy_request ->
        (create_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_collection_request ->
        (create_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `OcuLimitExceededException of ocu_limit_exceeded_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      create_security_config_request ->
        (create_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_endpoint_request ->
        (create_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_policy_request ->
        (delete_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_collection_request ->
        (delete_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_lifecycle_policy_request ->
        (delete_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_security_config_request ->
        (delete_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_security_policy_request ->
        (delete_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module DeleteVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_endpoint_request ->
        (delete_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_access_policy_request ->
        (get_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      get_security_config_request ->
        (get_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_security_policy_request ->
        (get_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListAccessPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_policies_request ->
        (list_access_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListCollections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_collections_request ->
        (list_collections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListLifecyclePolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_lifecycle_policies_request ->
        (list_lifecycle_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListSecurityConfigs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_security_configs_request ->
        (list_security_configs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListSecurityPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      list_security_policies_request ->
        (list_security_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListVpcEndpoints : sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_endpoints_request ->
        (list_vpc_endpoints_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchGetCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_collection_request ->
        (batch_get_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchGetEffectiveLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_effective_lifecycle_policy_request ->
        (batch_get_effective_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchGetLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_lifecycle_policy_request ->
        (batch_get_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module BatchGetVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_vpc_endpoint_request ->
        (batch_get_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      create_lifecycle_policy_request ->
        (create_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module CreateSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      create_security_policy_request ->
        (create_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      get_account_settings_request ->
        (get_account_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetPoliciesStats : sig
  val request :
    Smaws_Lib.Context.t ->
      get_policies_stats_request ->
        (get_policies_stats_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateAccessPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      update_access_policy_request ->
        (update_access_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateAccountSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_account_settings_request ->
        (update_account_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateCollection : sig
  val request :
    Smaws_Lib.Context.t ->
      update_collection_request ->
        (update_collection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateLifecyclePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      update_lifecycle_policy_request ->
        (update_lifecycle_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateSecurityConfig : sig
  val request :
    Smaws_Lib.Context.t ->
      update_security_config_request ->
        (update_security_config_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateSecurityPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      update_security_policy_request ->
        (update_security_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateVpcEndpoint : sig
  val request :
    Smaws_Lib.Context.t ->
      update_vpc_endpoint_request ->
        (update_vpc_endpoint_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InternalServerException of internal_server_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

