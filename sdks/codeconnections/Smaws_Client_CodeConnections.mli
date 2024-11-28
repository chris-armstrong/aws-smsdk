(** 
    CodeConnections client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(** 
    The VPC configuration provisioned for the host.
     *)
type vpc_configuration = {
  tls_certificate: string option;
  (** 
    The value of the Transport Layer Security (TLS) certificate associated with the infrastructure where your provider type is installed.
     *)

  security_group_ids: string list;
  (** 
    The ID of the security group or security groups associated with the Amazon VPC connected to the infrastructure where your provider type is installed.
     *)

  subnet_ids: string list;
  (** 
    The ID of the subnet or subnets associated with the Amazon VPC connected to the infrastructure where your provider type is installed.
     *)

  vpc_id: string;
  (** 
    The ID of the Amazon VPC connected to the infrastructure where your provider type is installed.
     *)

}

type provider_type = | GITLAB_SELF_MANAGED
  | GITLAB
  | GITHUB_ENTERPRISE_SERVER
  | GITHUB
  | BITBUCKET

type sync_configuration_type = | CFN_STACK_SYNC

type publish_deployment_status = | DISABLED
  | ENABLED

type trigger_resource_update_on = | FILE_CHANGE
  | ANY_CHANGE

(** 
    Information, such as repository, branch, provider, and resource names for a specific sync configuration.
     *)
type sync_configuration = {
  trigger_resource_update_on: trigger_resource_update_on option;
  (** 
    When to trigger Git sync to begin the stack update.
     *)

  publish_deployment_status: publish_deployment_status option;
  (** 
    Whether to enable or disable publishing of deployment status to source providers.
     *)

  sync_type: sync_configuration_type;
  (** 
    The type of sync for a specific sync configuration.
     *)

  role_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the IAM role associated with a specific sync configuration.
     *)

  resource_name: string;
  (** 
    The name of the connection resource associated with a specific sync configuration.
     *)

  repository_name: string;
  (** 
    The name of the repository associated with a specific sync configuration.
     *)

  repository_link_id: string;
  (** 
    The ID of the repository link associated with a specific sync configuration.
     *)

  provider_type: provider_type;
  (** 
    The connection provider type associated with a specific sync configuration, such as GitHub.
     *)

  owner_id: string;
  (** 
    The owner ID for the repository associated with a specific sync configuration, such as the owner ID in GitHub.
     *)

  config_file: string option;
  (** 
    The file path to the configuration file associated with a specific sync configuration. The path should point to an actual file in the sync configurations linked repository.
     *)

  branch: string;
  (** 
    The branch associated with a specific sync configuration.
     *)

}

type update_sync_configuration_output = {
  sync_configuration: sync_configuration;
  (** 
    The information returned for the sync configuration to be updated.
     *)

}

type update_sync_configuration_input = {
  trigger_resource_update_on: trigger_resource_update_on option;
  (** 
    When to trigger Git sync to begin the stack update.
     *)

  publish_deployment_status: publish_deployment_status option;
  (** 
    Whether to enable or disable publishing of deployment status to source providers.
     *)

  sync_type: sync_configuration_type;
  (** 
    The sync type for the sync configuration to be updated.
     *)

  role_arn: string option;
  (** 
    The ARN of the IAM role for the sync configuration to be updated.
     *)

  resource_name: string;
  (** 
    The name of the Amazon Web Services resource for the sync configuration to be updated.
     *)

  repository_link_id: string option;
  (** 
    The ID of the repository link for the sync configuration to be updated.
     *)

  config_file: string option;
  (** 
    The configuration file for the sync configuration to be updated.
     *)

  branch: string option;
  (** 
    The branch for the sync configuration to be updated.
     *)

}

(** 
    The update is out of sync. Try syncing again.
     *)
type update_out_of_sync_exception = {
  message: string option;
  
}

(** 
    The request was denied due to request throttling.
     *)
type throttling_exception = {
  message: string option;
  
}

(** 
    Resource not found. Verify the connection resource ARN and try again.
     *)
type resource_not_found_exception = {
  message: string option;
  
}

(** 
    The input is not valid. Verify that the action is typed correctly.
     *)
type invalid_input_exception = {
  message: string option;
  
}

(** 
    Received an internal server exception. Try again later.
     *)
type internal_server_exception = {
  message: string option;
  
}

(** 
    Exception thrown as a result of concurrent modification to an application. For example, two individuals attempting to edit the same application at the same time.
     *)
type concurrent_modification_exception = {
  message: string option;
  
}

(** 
    You do not have sufficient access to perform this action.
     *)
type access_denied_exception = {
  message: string option;
  
}

type blocker_type = | AUTOMATED

type blocker_status = | RESOLVED
  | ACTIVE

(** 
    The context for a specific sync blocker.
     *)
type sync_blocker_context = {
  value: string;
  (** 
    The value provided for a context key-value pair for a specific sync blocker.
     *)

  key: string;
  (** 
    The key provided for a context key-value pair for a specific sync blocker.
     *)

}

(** 
    Information about a blocker for a sync event.
     *)
type sync_blocker = {
  resolved_at: float option;
  (** 
    The time that a specific sync blocker was resolved.
     *)

  resolved_reason: string option;
  (** 
    The resolved reason for a specific sync blocker.
     *)

  contexts: sync_blocker_context list option;
  (** 
    The contexts for a specific sync blocker.
     *)

  created_at: float;
  (** 
    The creation time for a specific sync blocker.
     *)

  created_reason: string;
  (** 
    The provided reason for a specific sync blocker.
     *)

  status: blocker_status;
  (** 
    The status for a specific sync blocker.
     *)

  type_: blocker_type;
  (** 
    The sync blocker type.
     *)

  id: string;
  (** 
    The ID for a specific sync blocker.
     *)

}

type update_sync_blocker_output = {
  sync_blocker: sync_blocker;
  (** 
    Information about the sync blocker to be updated.
     *)

  parent_resource_name: string option;
  (** 
    The parent resource name for the sync blocker.
     *)

  resource_name: string;
  (** 
    The resource name for the sync blocker.
     *)

}

type update_sync_blocker_input = {
  resolved_reason: string;
  (** 
    The reason for resolving the sync blocker.
     *)

  resource_name: string;
  (** 
    The name of the resource for the sync blocker to be updated.
     *)

  sync_type: sync_configuration_type;
  (** 
    The sync type of the sync blocker to be updated.
     *)

  id: string;
  (** 
    The ID of the sync blocker to be updated.
     *)

}

(** 
    Unable to continue. The sync blocker does not exist.
     *)
type sync_blocker_does_not_exist_exception = {
  message: string option;
  
}

(** 
    Retrying the latest commit failed. Try again later.
     *)
type retry_latest_commit_failed_exception = {
  message: string option;
  
}

(** 
    Information about the repository link resource, such as the repository link ARN, the associated connection ARN, encryption key ARN, and owner ID.
     *)
type repository_link_info = {
  repository_name: string;
  (** 
    The name of the repository associated with the repository link.
     *)

  repository_link_id: string;
  (** 
    The ID of the repository link.
     *)

  repository_link_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the repository link.
     *)

  provider_type: provider_type;
  (** 
    The provider type for the connection, such as GitHub, associated with the repository link.
     *)

  owner_id: string;
  (** 
    The owner ID for the repository associated with the repository link, such as the owner ID in GitHub.
     *)

  encryption_key_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the encryption key for the repository associated with the repository link.
     *)

  connection_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the connection associated with the repository link.
     *)

}

type update_repository_link_output = {
  repository_link_info: repository_link_info;
  (** 
    Information about the repository link to be updated.
     *)

}

type update_repository_link_input = {
  repository_link_id: string;
  (** 
    The ID of the repository link to be updated.
     *)

  encryption_key_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the encryption key for the repository link to be updated.
     *)

  connection_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the connection for the repository link to be updated. The updated connection ARN must have the same providerType (such as GitHub) as the original connection ARN for the repo link.
     *)

}

(** 
    The conditional check failed. Try again later.
     *)
type conditional_check_failed_exception = {
  message: string option;
  
}

type update_host_output = unit

type update_host_input = {
  vpc_configuration: vpc_configuration option;
  (** 
    The VPC configuration of the host to be updated. A VPC must be configured and the infrastructure to be represented by the host must already be connected to the VPC.
     *)

  provider_endpoint: string option;
  (** 
    The URL or endpoint of the host to be updated.
     *)

  host_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the host to be updated.
     *)

}

(** 
    The operation is not supported. Check the connection status and try again.
     *)
type unsupported_operation_exception = {
  message: string option;
  
}

(** 
    Resource not found. Verify the ARN for the host resource and try again.
     *)
type resource_unavailable_exception = {
  message: string option;
  
}

(** 
    Two conflicting operations have been made on the same resource.
     *)
type conflict_exception = {
  message: string option;
  
}

type untag_resource_output = unit

type untag_resource_input = {
  tag_keys: string list;
  (** 
    The list of keys for the tags to be removed from the resource.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the resource to remove tags from.
     *)

}

(** 
    The specified provider type is not supported for connections.
     *)
type unsupported_provider_type_exception = {
  message: string option;
  
}

type tag_resource_output = unit

(** 
    A tag is a key-value pair that is used to manage the resource.
    
     This tag is available for use by Amazon Web Services services that support tags.
      *)
type tag = {
  value: string;
  (** 
    The tag's value.
     *)

  key: string;
  (** 
    The tag's key.
     *)

}

type tag_resource_input = {
  tags: tag list;
  (** 
    The tags you want to modify or add to the resource.
     *)

  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the resource to which you want to add or update tags.
     *)

}

(** 
    Exceeded the maximum limit for connections.
     *)
type limit_exceeded_exception = {
  message: string option;
  
}

(** 
    Unable to continue. The sync blocker still exists.
     *)
type sync_configuration_still_exists_exception = {
  message: string option;
  
}

(** 
    A summary for sync blockers.
     *)
type sync_blocker_summary = {
  latest_blockers: sync_blocker list option;
  (** 
    The latest events for a sync blocker summary.
     *)

  parent_resource_name: string option;
  (** 
    The parent resource name for a sync blocker summary.
     *)

  resource_name: string;
  (** 
    The resource name for sync blocker summary.
     *)

}

(** 
    Information about the revision for a specific sync event, such as the branch, owner ID, and name of the repository.
     *)
type revision = {
  sha: string;
  (** 
    The SHA, such as the commit ID, for a specific revision.
     *)

  provider_type: provider_type;
  (** 
    The provider type for a revision, such as GitHub.
     *)

  repository_name: string;
  (** 
    The repository name for a specific revision.
     *)

  owner_id: string;
  (** 
    The owner ID for a specific revision, such as the GitHub owner ID for a GitHub repository.
     *)

  directory: string;
  (** 
    The directory, if any, for a specific revision.
     *)

  branch: string;
  (** 
    The branch name for a specific revision.
     *)

}

type resource_sync_status = | SUCCEEDED
  | IN_PROGRESS
  | INITIATED
  | FAILED

(** 
    Information about a resource sync event for the resource associated with a sync configuration.
     *)
type resource_sync_event = {
  type_: string;
  (** 
    The type of resource sync event.
     *)

  time: float;
  (** 
    The time that a resource sync event occurred.
     *)

  external_id: string option;
  (** 
    The ID for a resource sync event.
     *)

  event: string;
  (** 
    The event for a resource sync event.
     *)

}

(** 
    Information about a resource sync attempt.
     *)
type resource_sync_attempt = {
  target: string;
  (** 
    The name of the Amazon Web Services resource that is attempted to be synchronized.
     *)

  target_revision: revision;
  (** 
    The desired state of the resource as defined in the resource's [config-file] in the linked repository. Git sync attempts to update the resource to this state.
     *)

  status: resource_sync_status;
  (** 
    The status for a resource sync attempt. The follow are valid statuses:
    
     {ul
          {- SYNC-INITIATED - A resource sync attempt has been created and will begin soon.
             
             }
           {- SYNCING - Syncing has started and work is being done to reconcile state.
              
              }
           {- SYNCED - Syncing has completed successfully.
              
              }
           {- SYNC_FAILED - A resource sync attempt has failed.
              
              }
          
      }
       *)

  started_at: float;
  (** 
    The start time for a resource sync attempt.
     *)

  initial_revision: revision;
  (** 
    The current state of the resource as defined in the resource's [config-file] in the linked repository.
     *)

  events: resource_sync_event list;
  (** 
    The events related to a resource sync attempt.
     *)

}

(** 
    Unable to create resource. Resource already exists.
     *)
type resource_already_exists_exception = {
  message: string option;
  
}

type repository_sync_status = | QUEUED
  | SUCCEEDED
  | IN_PROGRESS
  | INITIATED
  | FAILED

(** 
    Information about a repository sync event.
     *)
type repository_sync_event = {
  type_: string;
  (** 
    The event type for a repository sync event.
     *)

  time: float;
  (** 
    The time that a repository sync event occurred.
     *)

  external_id: string option;
  (** 
    The ID for a repository sync event.
     *)

  event: string;
  (** 
    A description of a repository sync event.
     *)

}

(** 
    The definition for a repository with a sync configuration.
     *)
type repository_sync_definition = {
  target: string;
  (** 
    The target resource specified for a repository sync definition. In some cases, such as CFN_STACK_SYNC, the parent and target resource are the same.
     *)

  parent: string;
  (** 
    The parent resource specified for a repository sync definition.
     *)

  directory: string;
  (** 
    The configuration file for a repository sync definition. This value comes from creating or updating the [config-file] field of a [sync-configuration].
     *)

  branch: string;
  (** 
    The branch specified for a repository sync definition.
     *)

}

(** 
    Information about a repository sync attempt for a repository with a sync configuration.
     *)
type repository_sync_attempt = {
  events: repository_sync_event list;
  (** 
    The events associated with a specific sync attempt.
     *)

  status: repository_sync_status;
  (** 
    The status of a specific sync attempt. The following are valid statuses:
    
     {ul
          {- INITIATED - A repository sync attempt has been created and will begin soon.
             
             }
           {- IN_PROGRESS - A repository sync attempt has started and work is being done to reconcile the branch.
              
              }
           {- SUCCEEDED - The repository sync attempt has completed successfully.
              
              }
           {- FAILED - The repository sync attempt has failed.
              
              }
           {- QUEUED - The repository sync attempt didn't execute and was queued.
              
              }
          
      }
       *)

  started_at: float;
  (** 
    The start time of a specific sync attempt.
     *)

}

type list_tags_for_resource_output = {
  tags: tag list option;
  (** 
    A list of tag key and value pairs associated with the specified resource.
     *)

}

type list_tags_for_resource_input = {
  resource_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the resource for which you want to get information about tags, if any.
     *)

}

type list_sync_configurations_output = {
  next_token: string option;
  (** 
    An enumeration token that allows the operation to batch the next results of the operation.
     *)

  sync_configurations: sync_configuration list;
  (** 
    The list of repository sync definitions returned by the request.
     *)

}

type list_sync_configurations_input = {
  sync_type: sync_configuration_type;
  (** 
    The sync type for the requested list of sync configurations.
     *)

  repository_link_id: string;
  (** 
    The ID of the repository link for the requested list of sync configurations.
     *)

  next_token: string option;
  (** 
    An enumeration token that allows the operation to batch the results of the operation.
     *)

  max_results: int option;
  (** 
    A non-zero, non-negative integer used to limit the number of returned results.
     *)

}

type list_repository_sync_definitions_output = {
  next_token: string option;
  (** 
    An enumeration token that, when provided in a request, returns the next batch of the results.
     *)

  repository_sync_definitions: repository_sync_definition list;
  (** 
    The list of repository sync definitions returned by the request. A [RepositorySyncDefinition] is a mapping from a repository branch to all the Amazon Web Services resources that are being synced from that branch.
     *)

}

type list_repository_sync_definitions_input = {
  sync_type: sync_configuration_type;
  (** 
    The sync type of the repository link for the the sync definition for which you want to retrieve information.
     *)

  repository_link_id: string;
  (** 
    The ID of the repository link for the sync definition for which you want to retrieve information.
     *)

}

type list_repository_links_output = {
  next_token: string option;
  (** 
    An enumeration token that allows the operation to batch the results of the operation.
     *)

  repository_links: repository_link_info list;
  (** 
    Lists the repository links called by the list repository links operation.
     *)

}

type list_repository_links_input = {
  next_token: string option;
  (** 
    An enumeration token that, when provided in a request, returns the next batch of the results.
     *)

  max_results: int option;
  (** 
    A non-zero, non-negative integer used to limit the number of returned results.
     *)

}

(** 
    A resource that represents the infrastructure where a third-party provider is installed. The host is used when you create connections to an installed third-party provider type, such as GitHub Enterprise Server. You create one host for all connections to that provider.
    
     A host created through the CLI or the SDK is in `PENDING` status by default. You can make its status `AVAILABLE` by setting up the host in the console.
     
      *)
type host = {
  status_message: string option;
  (** 
    The status description for the host.
     *)

  status: string option;
  (** 
    The status of the host, such as PENDING, AVAILABLE, VPC_CONFIG_DELETING, VPC_CONFIG_INITIALIZING, and VPC_CONFIG_FAILED_INITIALIZATION.
     *)

  vpc_configuration: vpc_configuration option;
  (** 
    The VPC configuration provisioned for the host.
     *)

  provider_endpoint: string option;
  (** 
    The endpoint of the infrastructure where your provider type is installed.
     *)

  provider_type: provider_type option;
  (** 
    The name of the installed provider to be associated with your connection. The host resource represents the infrastructure where your provider type is installed. The valid provider type is GitHub Enterprise Server.
     *)

  host_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the host.
     *)

  name: string option;
  (** 
    The name of the host.
     *)

}

type list_hosts_output = {
  next_token: string option;
  (** 
    A token that can be used in the next [ListHosts] call. To view all items in the list, continue to call this operation with each subsequent token until no more [nextToken] values are returned.
     *)

  hosts: host list option;
  (** 
    A list of hosts and the details for each host, such as status, endpoint, and provider type.
     *)

}

type list_hosts_input = {
  next_token: string option;
  (** 
    The token that was returned from the previous [ListHosts] call, which can be used to return the next set of hosts in the list.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned [nextToken] value.
     *)

}

type connection_status = | ERROR
  | AVAILABLE
  | PENDING

(** 
    A resource that is used to connect third-party source providers with services like CodePipeline.
    
     Note: A connection created through CloudFormation, the CLI, or the SDK is in `PENDING` status by default. You can make its status `AVAILABLE` by updating the connection in the console.
      *)
type connection = {
  host_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the host associated with the connection.
     *)

  connection_status: connection_status option;
  (** 
    The current status of the connection.
     *)

  owner_account_id: string option;
  (** 
    The identifier of the external provider where your third-party code repository is configured. For Bitbucket, this is the account ID of the owner of the Bitbucket repository.
     *)

  provider_type: provider_type option;
  (** 
    The name of the external provider where your third-party code repository is configured.
     *)

  connection_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the connection. The ARN is used as the connection reference when the connection is shared between Amazon Web Services.
    
     The ARN is never reused if the connection is deleted.
     
      *)

  connection_name: string option;
  (** 
    The name of the connection. Connection names must be unique in an Amazon Web Services account.
     *)

}

type list_connections_output = {
  next_token: string option;
  (** 
    A token that can be used in the next [ListConnections] call. To view all items in the list, continue to call this operation with each subsequent token until no more [nextToken] values are returned.
     *)

  connections: connection list option;
  (** 
    A list of connections and the details for each connection, such as status, owner, and provider type.
     *)

}

type list_connections_input = {
  next_token: string option;
  (** 
    The token that was returned from the previous [ListConnections] call, which can be used to return the next set of connections in the list.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call. To retrieve the remaining results, make another call with the returned [nextToken] value.
     *)

  host_arn_filter: string option;
  (** 
    Filters the list of connections to those associated with a specified host.
     *)

  provider_type_filter: provider_type option;
  (** 
    Filters the list of connections to those associated with a specified provider, such as Bitbucket.
     *)

}

type get_sync_configuration_output = {
  sync_configuration: sync_configuration;
  (** 
    The details about the sync configuration for which you want to retrieve information.
     *)

}

type get_sync_configuration_input = {
  resource_name: string;
  (** 
    The name of the Amazon Web Services resource for the sync configuration for which you want to retrieve information.
     *)

  sync_type: sync_configuration_type;
  (** 
    The sync type for the sync configuration for which you want to retrieve information.
     *)

}

type get_sync_blocker_summary_output = {
  sync_blocker_summary: sync_blocker_summary;
  (** 
    The list of sync blockers for a specified resource.
     *)

}

type get_sync_blocker_summary_input = {
  resource_name: string;
  (** 
    The name of the Amazon Web Services resource currently blocked from automatically being synced from a Git repository.
     *)

  sync_type: sync_configuration_type;
  (** 
    The sync type for the sync blocker summary.
     *)

}

type get_resource_sync_status_output = {
  latest_sync: resource_sync_attempt;
  (** 
    The latest sync for the sync status with the Git repository, whether successful or not.
     *)

  latest_successful_sync: resource_sync_attempt option;
  (** 
    The latest successful sync for the sync status with the Git repository.
     *)

  desired_state: revision option;
  (** 
    The desired state of the Amazon Web Services resource for the sync status with the Git repository.
     *)

}

type get_resource_sync_status_input = {
  sync_type: sync_configuration_type;
  (** 
    The sync type for the sync status with the Git repository.
     *)

  resource_name: string;
  (** 
    The name of the Amazon Web Services resource for the sync status with the Git repository.
     *)

}

type get_repository_sync_status_output = {
  latest_sync: repository_sync_attempt;
  (** 
    The status of the latest sync returned for a specified repository and branch.
     *)

}

type get_repository_sync_status_input = {
  sync_type: sync_configuration_type;
  (** 
    The sync type of the requested sync status.
     *)

  repository_link_id: string;
  (** 
    The repository link ID for the requested repository sync status.
     *)

  branch: string;
  (** 
    The branch of the repository link for the requested repository sync status.
     *)

}

type get_repository_link_output = {
  repository_link_info: repository_link_info;
  (** 
    The information returned for a specified repository link.
     *)

}

type get_repository_link_input = {
  repository_link_id: string;
  (** 
    The ID of the repository link to get.
     *)

}

type get_host_output = {
  vpc_configuration: vpc_configuration option;
  (** 
    The VPC configuration of the requested host.
     *)

  provider_endpoint: string option;
  (** 
    The endpoint of the infrastructure represented by the requested host.
     *)

  provider_type: provider_type option;
  (** 
    The provider type of the requested host, such as GitHub Enterprise Server.
     *)

  status: string option;
  (** 
    The status of the requested host.
     *)

  name: string option;
  (** 
    The name of the requested host.
     *)

}

type get_host_input = {
  host_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the requested host.
     *)

}

type get_connection_output = {
  connection: connection option;
  (** 
    The connection details, such as status, owner, and provider type.
     *)

}

type get_connection_input = {
  connection_arn: string;
  (** 
    The Amazon Resource Name (ARN) of a connection.
     *)

}

type delete_sync_configuration_output = unit

type delete_sync_configuration_input = {
  resource_name: string;
  (** 
    The name of the Amazon Web Services resource associated with the sync configuration to be deleted.
     *)

  sync_type: sync_configuration_type;
  (** 
    The type of sync configuration to be deleted.
     *)

}

type delete_repository_link_output = unit

type delete_repository_link_input = {
  repository_link_id: string;
  (** 
    The ID of the repository link to be deleted.
     *)

}

type delete_host_output = unit

type delete_host_input = {
  host_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the host to be deleted.
     *)

}

type delete_connection_output = unit

type delete_connection_input = {
  connection_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the connection to be deleted.
    
     The ARN is never reused if the connection is deleted.
     
      *)

}

type create_sync_configuration_output = {
  sync_configuration: sync_configuration;
  (** 
    The created sync configuration for the connection. A sync configuration allows Amazon Web Services to sync content from a Git repository to update a specified Amazon Web Services resource.
     *)

}

type create_sync_configuration_input = {
  trigger_resource_update_on: trigger_resource_update_on option;
  (** 
    When to trigger Git sync to begin the stack update.
     *)

  publish_deployment_status: publish_deployment_status option;
  (** 
    Whether to enable or disable publishing of deployment status to source providers.
     *)

  sync_type: sync_configuration_type;
  (** 
    The type of sync configuration.
     *)

  role_arn: string;
  (** 
    The ARN of the IAM role that grants permission for Amazon Web Services to use Git sync to update a given Amazon Web Services resource on your behalf.
     *)

  resource_name: string;
  (** 
    The name of the Amazon Web Services resource (for example, a CloudFormation stack in the case of CFN_STACK_SYNC) that will be synchronized from the linked repository.
     *)

  repository_link_id: string;
  (** 
    The ID of the repository link created for the connection. A repository link allows Git sync to monitor and sync changes to files in a specified Git repository.
     *)

  config_file: string;
  (** 
    The file name of the configuration file that manages syncing between the connection and the repository. This configuration file is stored in the repository.
     *)

  branch: string;
  (** 
    The branch in the repository from which changes will be synced.
     *)

}

type create_repository_link_output = {
  repository_link_info: repository_link_info;
  (** 
    The returned information about the created repository link.
     *)

}

type create_repository_link_input = {
  tags: tag list option;
  (** 
    The tags for the repository to be associated with the repository link.
     *)

  encryption_key_arn: string option;
  (** 
    The Amazon Resource Name (ARN) encryption key for the repository to be associated with the repository link.
     *)

  repository_name: string;
  (** 
    The name of the repository to be associated with the repository link.
     *)

  owner_id: string;
  (** 
    The owner ID for the repository associated with a specific sync configuration, such as the owner ID in GitHub.
     *)

  connection_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the connection to be associated with the repository link.
     *)

}

type create_host_output = {
  tags: tag list option;
  (** 
    Tags for the created host.
     *)

  host_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the host to be created.
     *)

}

type create_host_input = {
  tags: tag list option;
  (** 
    Tags for the host to be created.
     *)

  vpc_configuration: vpc_configuration option;
  (** 
    The VPC configuration to be provisioned for the host. A VPC must be configured and the infrastructure to be represented by the host must already be connected to the VPC.
     *)

  provider_endpoint: string;
  (** 
    The endpoint of the infrastructure to be represented by the host after it is created.
     *)

  provider_type: provider_type;
  (** 
    The name of the installed provider to be associated with your connection. The host resource represents the infrastructure where your provider type is installed. The valid provider type is GitHub Enterprise Server.
     *)

  name: string;
  (** 
    The name of the host to be created.
     *)

}

type create_connection_output = {
  tags: tag list option;
  (** 
    Specifies the tags applied to the resource.
     *)

  connection_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the connection to be created. The ARN is used as the connection reference when the connection is shared between Amazon Web Services services.
    
     The ARN is never reused if the connection is deleted.
     
      *)

}

type create_connection_input = {
  host_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the host associated with the connection to be created.
     *)

  tags: tag list option;
  (** 
    The key-value pair to use when tagging the resource.
     *)

  connection_name: string;
  (** 
    The name of the connection to be created.
     *)

  provider_type: provider_type option;
  (** 
    The name of the external provider where your third-party code repository is configured.
     *)

}

(** 
    AWS CodeConnections This Amazon Web Services CodeConnections API Reference provides descriptions and usage examples of the operations and data types for the Amazon Web Services CodeConnections API. You can use the connections API to work with connections and installations.
                        
                         {i Connections} are configurations that you use to connect Amazon Web Services resources to external code repositories. Each connection is a resource that can be given to services such as CodePipeline to connect to a third-party repository such as Bitbucket. For example, you can add the connection in CodePipeline so that it triggers your pipeline when a code change is made to your third-party code repository. Each connection is named and associated with a unique ARN that is used to reference the connection.
                         
                          When you create a connection, the console initiates a third-party connection handshake. {i Installations} are the apps that are used to conduct this handshake. For example, the installation for the Bitbucket provider type is the Bitbucket app. When you create a connection, you can choose an existing installation or create one.
                          
                           When you want to create a connection to an installed provider type such as GitHub Enterprise Server, you create a {i host} for your connections.
                           
                            You can work with connections by calling:
                            
                             {ul
                                  {- [CreateConnection], which creates a uniquely named connection that can be referenced by services such as CodePipeline.
                                     
                                     }
                                   {- [DeleteConnection], which deletes the specified connection.
                                      
                                      }
                                   {- [GetConnection], which returns information about the connection, including the connection status.
                                      
                                      }
                                   {- [ListConnections], which lists the connections associated with your account.
                                      
                                      }
                                  
      }
       You can work with hosts by calling:
       
        {ul
             {- [CreateHost], which creates a host that represents the infrastructure where your provider is installed.
                
                }
              {- [DeleteHost], which deletes the specified host.
                 
                 }
              {- [GetHost], which returns information about the host, including the setup status.
                 
                 }
              {- [ListHosts], which lists the hosts associated with your account.
                 
                 }
             
      }
       You can work with tags in Amazon Web Services CodeConnections by calling the following:
       
        {ul
             {- [ListTagsForResource], which gets information about Amazon Web Services tags for a specified Amazon Resource Name (ARN) in Amazon Web Services CodeConnections.
                
                }
              {- [TagResource], which adds or updates tags for a resource in Amazon Web Services CodeConnections.
                 
                 }
              {- [UntagResource], which removes tags for a resource in Amazon Web Services CodeConnections.
                 
                 }
             
      }
       For information about how to use Amazon Web Services CodeConnections, see the {{:https://docs.aws.amazon.com/dtconsole/latest/userguide/welcome-connections.html}Developer Tools User Guide}.
        *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_vpc_configuration :
  ?tls_certificate:string ->
  security_group_ids:string list ->
  subnet_ids:string list ->
  vpc_id:string ->
  unit -> vpc_configuration

val make_sync_configuration :
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?publish_deployment_status:publish_deployment_status ->
  ?config_file:string ->
  sync_type:sync_configuration_type ->
  role_arn:string ->
  resource_name:string ->
  repository_name:string ->
  repository_link_id:string ->
  provider_type:provider_type ->
  owner_id:string ->
  branch:string ->
  unit -> sync_configuration

val make_update_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> update_sync_configuration_output

val make_update_sync_configuration_input :
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?publish_deployment_status:publish_deployment_status ->
  ?role_arn:string ->
  ?repository_link_id:string ->
  ?config_file:string ->
  ?branch:string ->
  sync_type:sync_configuration_type ->
  resource_name:string ->
  unit -> update_sync_configuration_input

val make_sync_blocker_context : value:string -> key:string -> unit
-> sync_blocker_context

val make_sync_blocker :
  ?resolved_at:float ->
  ?resolved_reason:string ->
  ?contexts:sync_blocker_context list ->
  created_at:float ->
  created_reason:string ->
  status:blocker_status ->
  type_:blocker_type ->
  id:string ->
  unit -> sync_blocker

val make_update_sync_blocker_output :
  ?parent_resource_name:string ->
  sync_blocker:sync_blocker ->
  resource_name:string ->
  unit -> update_sync_blocker_output

val make_update_sync_blocker_input :
  resolved_reason:string ->
  resource_name:string ->
  sync_type:sync_configuration_type ->
  id:string ->
  unit -> update_sync_blocker_input

val make_repository_link_info :
  ?encryption_key_arn:string ->
  repository_name:string ->
  repository_link_id:string ->
  repository_link_arn:string ->
  provider_type:provider_type ->
  owner_id:string ->
  connection_arn:string ->
  unit -> repository_link_info

val make_update_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> update_repository_link_output

val make_update_repository_link_input :
  ?encryption_key_arn:string ->
  ?connection_arn:string ->
  repository_link_id:string ->
  unit -> update_repository_link_input

val make_update_host_output : unit
-> update_host_output

val make_update_host_input :
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  host_arn:string ->
  unit -> update_host_input

val make_untag_resource_output : unit
-> untag_resource_output

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input

val make_tag_resource_output : unit -> tag_resource_output

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_input : tags:tag list -> resource_arn:string -> unit
-> tag_resource_input

val make_sync_blocker_summary :
  ?latest_blockers:sync_blocker list ->
  ?parent_resource_name:string ->
  resource_name:string ->
  unit -> sync_blocker_summary

val make_revision :
  sha:string ->
  provider_type:provider_type ->
  repository_name:string ->
  owner_id:string ->
  directory:string ->
  branch:string ->
  unit -> revision

val make_resource_sync_event :
  ?external_id:string -> type_:string -> time:float -> event:string -> unit
-> resource_sync_event

val make_resource_sync_attempt :
  target:string ->
  target_revision:revision ->
  status:resource_sync_status ->
  started_at:float ->
  initial_revision:revision ->
  events:resource_sync_event list ->
  unit -> resource_sync_attempt

val make_repository_sync_event :
  ?external_id:string -> type_:string -> time:float -> event:string -> unit
-> repository_sync_event

val make_repository_sync_definition :
  target:string -> parent:string -> directory:string -> branch:string -> unit
-> repository_sync_definition

val make_repository_sync_attempt :
  events:repository_sync_event list ->
  status:repository_sync_status ->
  started_at:float ->
  unit -> repository_sync_attempt

val make_list_tags_for_resource_output : ?tags:tag list -> unit
-> list_tags_for_resource_output

val make_list_tags_for_resource_input : resource_arn:string -> unit
-> list_tags_for_resource_input

val make_list_sync_configurations_output :
  ?next_token:string -> sync_configurations:sync_configuration list -> unit
-> list_sync_configurations_output

val make_list_sync_configurations_input :
  ?next_token:string ->
  ?max_results:int ->
  sync_type:sync_configuration_type ->
  repository_link_id:string ->
  unit
-> list_sync_configurations_input

val make_list_repository_sync_definitions_output :
  ?next_token:string ->
  repository_sync_definitions:repository_sync_definition list ->
  unit
-> list_repository_sync_definitions_output

val make_list_repository_sync_definitions_input :
  sync_type:sync_configuration_type -> repository_link_id:string -> unit
-> list_repository_sync_definitions_input

val make_list_repository_links_output :
  ?next_token:string -> repository_links:repository_link_info list -> unit
-> list_repository_links_output

val make_list_repository_links_input :
  ?next_token:string -> ?max_results:int -> unit
-> list_repository_links_input

val make_host :
  ?status_message:string ->
  ?status:string ->
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  ?provider_type:provider_type ->
  ?host_arn:string ->
  ?name:string ->
  unit -> host

val make_list_hosts_output : ?next_token:string -> ?hosts:host list -> unit
-> list_hosts_output

val make_list_hosts_input : ?next_token:string -> ?max_results:int -> unit
-> list_hosts_input

val make_connection :
  ?host_arn:string ->
  ?connection_status:connection_status ->
  ?owner_account_id:string ->
  ?provider_type:provider_type ->
  ?connection_arn:string ->
  ?connection_name:string ->
  unit -> connection

val make_list_connections_output :
  ?next_token:string -> ?connections:connection list -> unit
-> list_connections_output

val make_list_connections_input :
  ?next_token:string ->
  ?max_results:int ->
  ?host_arn_filter:string ->
  ?provider_type_filter:provider_type ->
  unit -> list_connections_input

val make_get_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> get_sync_configuration_output

val make_get_sync_configuration_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> get_sync_configuration_input

val make_get_sync_blocker_summary_output :
  sync_blocker_summary:sync_blocker_summary -> unit
-> get_sync_blocker_summary_output

val make_get_sync_blocker_summary_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> get_sync_blocker_summary_input

val make_get_resource_sync_status_output :
  ?latest_successful_sync:resource_sync_attempt ->
  ?desired_state:revision ->
  latest_sync:resource_sync_attempt ->
  unit
-> get_resource_sync_status_output

val make_get_resource_sync_status_input :
  sync_type:sync_configuration_type -> resource_name:string -> unit
-> get_resource_sync_status_input

val make_get_repository_sync_status_output :
  latest_sync:repository_sync_attempt -> unit
-> get_repository_sync_status_output

val make_get_repository_sync_status_input :
  sync_type:sync_configuration_type ->
  repository_link_id:string ->
  branch:string ->
  unit
-> get_repository_sync_status_input

val make_get_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> get_repository_link_output

val make_get_repository_link_input : repository_link_id:string -> unit
-> get_repository_link_input

val make_get_host_output :
  ?vpc_configuration:vpc_configuration ->
  ?provider_endpoint:string ->
  ?provider_type:provider_type ->
  ?status:string ->
  ?name:string ->
  unit -> get_host_output

val make_get_host_input : host_arn:string -> unit
-> get_host_input

val make_get_connection_output : ?connection:connection -> unit
-> get_connection_output

val make_get_connection_input : connection_arn:string -> unit
-> get_connection_input

val make_delete_sync_configuration_output : unit
-> delete_sync_configuration_output

val make_delete_sync_configuration_input :
  resource_name:string -> sync_type:sync_configuration_type -> unit
-> delete_sync_configuration_input

val make_delete_repository_link_output : unit
-> delete_repository_link_output

val make_delete_repository_link_input : repository_link_id:string -> unit
-> delete_repository_link_input

val make_delete_host_output : unit
-> delete_host_output

val make_delete_host_input : host_arn:string -> unit
-> delete_host_input

val make_delete_connection_output : unit
-> delete_connection_output

val make_delete_connection_input : connection_arn:string -> unit
-> delete_connection_input

val make_create_sync_configuration_output :
  sync_configuration:sync_configuration -> unit
-> create_sync_configuration_output

val make_create_sync_configuration_input :
  ?trigger_resource_update_on:trigger_resource_update_on ->
  ?publish_deployment_status:publish_deployment_status ->
  sync_type:sync_configuration_type ->
  role_arn:string ->
  resource_name:string ->
  repository_link_id:string ->
  config_file:string ->
  branch:string ->
  unit
-> create_sync_configuration_input

val make_create_repository_link_output :
  repository_link_info:repository_link_info -> unit
-> create_repository_link_output

val make_create_repository_link_input :
  ?tags:tag list ->
  ?encryption_key_arn:string ->
  repository_name:string ->
  owner_id:string ->
  connection_arn:string ->
  unit -> create_repository_link_input

val make_create_host_output : ?tags:tag list -> ?host_arn:string -> unit
-> create_host_output

val make_create_host_input :
  ?tags:tag list ->
  ?vpc_configuration:vpc_configuration ->
  provider_endpoint:string ->
  provider_type:provider_type ->
  name:string ->
  unit -> create_host_input

val make_create_connection_output :
  ?tags:tag list -> connection_arn:string -> unit
-> create_connection_output

val make_create_connection_input :
  ?host_arn:string ->
  ?tags:tag list ->
  ?provider_type:provider_type ->
  connection_name:string ->
  unit
-> create_connection_input

(** {1:operations Operations} *)

module CreateConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_input ->
        (create_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module CreateHost : sig
  val request :
    Smaws_Lib.Context.t ->
      create_host_input ->
        (create_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            
        ]
      ) result
end

module CreateRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      create_repository_link_input ->
        (create_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module CreateSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_sync_configuration_input ->
        (create_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module DeleteConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_input ->
        (delete_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module DeleteHost : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_host_input ->
        (delete_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module DeleteRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_repository_link_input ->
        (delete_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `SyncConfigurationStillExistsException of sync_configuration_still_exists_exception
            | `ThrottlingException of throttling_exception
            | `UnsupportedProviderTypeException of unsupported_provider_type_exception
            
        ]
      ) result
end

module DeleteSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_sync_configuration_input ->
        (delete_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetConnection : sig
  val request :
    Smaws_Lib.Context.t ->
      get_connection_input ->
        (get_connection_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module GetHost : sig
  val request :
    Smaws_Lib.Context.t ->
      get_host_input ->
        (get_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            
        ]
      ) result
end

module GetRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_link_input ->
        (get_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetRepositorySyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_repository_sync_status_input ->
        (get_repository_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetResourceSyncStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_sync_status_input ->
        (get_resource_sync_status_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetSyncBlockerSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sync_blocker_summary_input ->
        (get_sync_blocker_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module GetSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      get_sync_configuration_input ->
        (get_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListConnections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_input ->
        (list_connections_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module ListHosts : sig
  val request :
    Smaws_Lib.Context.t ->
      list_hosts_input ->
        (list_hosts_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error 
        ]
      ) result
end

module ListRepositoryLinks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repository_links_input ->
        (list_repository_links_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListRepositorySyncDefinitions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_repository_sync_definitions_input ->
        (list_repository_sync_definitions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListSyncConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_sync_configurations_input ->
        (list_sync_configurations_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `LimitExceededException of limit_exceeded_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
end

module UpdateHost : sig
  val request :
    Smaws_Lib.Context.t ->
      update_host_input ->
        (update_host_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceUnavailableException of resource_unavailable_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateRepositoryLink : sig
  val request :
    Smaws_Lib.Context.t ->
      update_repository_link_input ->
        (update_repository_link_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConditionalCheckFailedException of conditional_check_failed_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `UpdateOutOfSyncException of update_out_of_sync_exception
            
        ]
      ) result
end

module UpdateSyncBlocker : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sync_blocker_input ->
        (update_sync_blocker_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `RetryLatestCommitFailedException of retry_latest_commit_failed_exception
            | `SyncBlockerDoesNotExistException of sync_blocker_does_not_exist_exception
            | `ThrottlingException of throttling_exception
            
        ]
      ) result
end

module UpdateSyncConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_sync_configuration_input ->
        (update_sync_configuration_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InternalServerException of internal_server_exception
            | `InvalidInputException of invalid_input_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `UpdateOutOfSyncException of update_out_of_sync_exception
            
        ]
      ) result
end

