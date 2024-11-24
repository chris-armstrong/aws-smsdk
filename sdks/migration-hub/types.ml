open Smaws_Lib
let service =
  Service.{
    namespace = "mgh";
    endpointPrefix = "mgh";
    version = "2017-05-31";
    protocol = AwsJson_1_1
  };

(**{|
    Exception raised to indicate a request was not authorized when the
    [DryRun] flag is set to "true".|}*)
type unauthorized_operation = {
  message: string option;
  
}

(**{|
    The request was denied due to request throttling.|}*)
type throttling_exception = {
  retry_after_seconds: int option;
   (**{|
    The number of seconds the caller should wait before retrying.|}*)

  message: string;
   (**{|
    A message that provides information about the exception.|}*)

}

type status = | COMPLETED
  | FAILED
  | IN_PROGRESS
  | NOT_STARTED

(**{|
    Task object encapsulating task information.|}*)
type task = {
  progress_percent: int option;
   (**{|
    Indication of the percentage completion of the task.|}*)

  status_detail: string option;
   (**{|
    Details of task status as notified by a migration tool. A tool might use
    this field to provide clarifying information about the status that is
    unique to that tool or that explains an error state.|}*)

  status: status;
   (**{|
    Status of the task - Not Started, In-Progress, Complete.|}*)

}

(**{|
    Exception raised when there is an internal, configuration, or dependency
    error encountered.|}*)
type service_unavailable_exception = {
  message: string option;
  
}

(**{|
    Exception raised when the request references a resource (Application
    Discovery Service configuration, update stream, migration task, etc.)
    that does not exist in Application Discovery Service (Application
    Discovery Service) or in Migration Hub's repository.|}*)
type resource_not_found_exception = {
  message: string option;
  
}

type resource_attribute_type = | MOTHERBOARD_SERIAL_NUMBER
  | BIOS_ID
  | VM_PATH
  | VM_NAME
  | VM_MANAGED_OBJECT_REFERENCE
  | VM_MANAGER_ID
  | FQDN
  | MAC_ADDRESS
  | IPV6_ADDRESS
  | IPV4_ADDRESS

(**{|
    Attribute associated with a resource.
    
    Note the corresponding format required per type listed below:
    
    IPV4
    [x.x.x.x]
    
    {i where x is an integer in the range [0,255]}
    
    IPV6
    [y : y : y : y : y : y : y : y]
    
    {i where y is a hexadecimal between 0 and FFFF. [0, FFFF]}
    
    MAC_ADDRESS
    [^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$]
    
    FQDN
    [^[^<>{}\\\\/?,=\\p{Cntrl}]{1,256}$]
    |}*)
type resource_attribute = {
  value: string;
   (**{|
    Value of the resource type.|}*)

  type_: resource_attribute_type;
   (**{|
    Type of resource.|}*)

}

type put_resource_attributes_result = unit

type put_resource_attributes_request = {
  dry_run: bool option;
   (**{|
    Optional boolean flag to indicate whether any effect should take place.
    Used to test if the caller has permission to make the call.|}*)

  resource_attribute_list: resource_attribute list;
   (**{|
    Information about the resource that is being migrated. This data will be
    used to map the task to a resource in the Application Discovery Service
    repository.
    
    Takes the object array of [ResourceAttribute] where the [Type] field is
    reserved for the following values: [IPV4_ADDRESS | IPV6_ADDRESS |
    MAC_ADDRESS | FQDN | VM_MANAGER_ID | VM_MANAGED_OBJECT_REFERENCE |
    VM_NAME | VM_PATH | BIOS_ID | MOTHERBOARD_SERIAL_NUMBER] where the
    identifying value can be a string up to 256 characters.
    
    {ol 
          {- If any "VM" related value is set for a [ResourceAttribute]
             object, it is required that [VM_MANAGER_ID], as a minimum, is
             always set. If [VM_MANAGER_ID] is not set, then all "VM" fields
             will be discarded and "VM" fields will not be used for matching
             the migration task to a server in Application Discovery Service
             repository. See the
             {{: https://docs.aws.amazon.com/migrationhub/latest/ug/API_PutResourceAttributes.html#API_PutResourceAttributes_Examples }Example}
             section below for a use case of specifying "VM" related values.
             }
          
          {- If a server you are trying to match has multiple IP or MAC
             addresses, you should provide as many as you know in separate
             type/value pairs passed to the [ResourceAttributeList] parameter
             to maximize the chances of matching.
             }
          
    }
    |}*)

  migration_task_name: string;
   (**{|
    Unique identifier that references the migration task. {i Do not store
    personal data in this field.}|}*)

  progress_update_stream: string;
   (**{|
    The name of the ProgressUpdateStream.|}*)

}

(**{|
    Exception raised when the provided input violates a policy constraint or
    is entered in the wrong format or data type.|}*)
type invalid_input_exception = {
  message: string option;
  
}

(**{|
    Exception raised when an internal, configuration, or dependency error is
    encountered.|}*)
type internal_server_error = {
  message: string option;
  
}

(**{|
    The home region is not set. Set the home region to continue.|}*)
type home_region_not_set_exception = {
  message: string option;
  
}

(**{|
    Exception raised to indicate a successfully authorized action when the
    [DryRun] flag is set to "true".|}*)
type dry_run_operation = {
  message: string option;
  
}

(**{|
    You do not have sufficient access to perform this action.|}*)
type access_denied_exception = {
  message: string option;
  
}

(**{|
    Summary of the AWS resource used for access control that is implicitly
    linked to your AWS account.|}*)
type progress_update_stream_summary = {
  progress_update_stream_name: string option;
   (**{|
    The name of the ProgressUpdateStream. {i Do not store personal data in
    this field.}|}*)

}

(**{|
    Exception raised when there are problems accessing Application Discovery
    Service (Application Discovery Service); most likely due to a
    misconfigured policy or the [migrationhub-discovery] role is missing or
    not configured correctly.|}*)
type policy_error_exception = {
  message: string option;
  
}

type notify_migration_task_state_result = unit

type notify_migration_task_state_request = {
  dry_run: bool option;
   (**{|
    Optional boolean flag to indicate whether any effect should take place.
    Used to test if the caller has permission to make the call.|}*)

  next_update_seconds: int;
   (**{|
    Number of seconds after the UpdateDateTime within which the Migration Hub
    can expect an update. If Migration Hub does not receive an update within
    the specified interval, then the migration task will be considered stale.|}*)

  update_date_time: float;
   (**{|
    The timestamp when the task was gathered.|}*)

  task: task;
   (**{|
    Information about the task's progress and status.|}*)

  migration_task_name: string;
   (**{|
    Unique identifier that references the migration task. {i Do not store
    personal data in this field.}|}*)

  progress_update_stream: string;
   (**{|
    The name of the ProgressUpdateStream.|}*)

}

type notify_application_state_result = unit

type application_status = | COMPLETED
  | IN_PROGRESS
  | NOT_STARTED

type notify_application_state_request = {
  dry_run: bool option;
   (**{|
    Optional boolean flag to indicate whether any effect should take place.
    Used to test if the caller has permission to make the call.|}*)

  update_date_time: float option;
   (**{|
    The timestamp when the application state changed.|}*)

  status: application_status;
   (**{|
    Status of the application - Not Started, In-Progress, Complete.|}*)

  application_id: string;
   (**{|
    The configurationId in Application Discovery Service that uniquely
    identifies the grouped application.|}*)

}

(**{|
    MigrationTaskSummary includes [MigrationTaskName], [ProgressPercent],
    [ProgressUpdateStream], [Status], and [UpdateDateTime] for each task.|}*)
type migration_task_summary = {
  update_date_time: float option;
   (**{|
    The timestamp when the task was gathered.|}*)

  status_detail: string option;
   (**{|
    Detail information of what is being done within the overall status state.|}*)

  progress_percent: int option;
   (**{|
    Indication of the percentage completion of the task.|}*)

  status: status option;
   (**{|
    Status of the task.|}*)

  migration_task_name: string option;
   (**{|
    Unique identifier that references the migration task. {i Do not store
    personal data in this field.}|}*)

  progress_update_stream: string option;
   (**{|
    An AWS resource used for access control. It should uniquely identify the
    migration tool as it is used for all updates made by the tool.|}*)

}

(**{|
    Represents a migration task in a migration tool.|}*)
type migration_task = {
  resource_attribute_list: resource_attribute list option;
   (**{|
    Information about the resource that is being migrated. This data will be
    used to map the task to a resource in the Application Discovery Service
    repository.|}*)

  update_date_time: float option;
   (**{|
    The timestamp when the task was gathered.|}*)

  task: task option;
   (**{|
    Task object encapsulating task information.|}*)

  migration_task_name: string option;
   (**{|
    Unique identifier that references the migration task. {i Do not store
    personal data in this field.}|}*)

  progress_update_stream: string option;
   (**{|
    A name that identifies the vendor of the migration tool being used.|}*)

}

type list_progress_update_streams_result = {
  next_token: string option;
   (**{|
    If there are more streams created than the max result, return the next
    token to be passed to the next call as a bookmark of where to start from.|}*)

  progress_update_stream_summary_list: progress_update_stream_summary list option;
   (**{|
    List of progress update streams up to the max number of results passed in
    the input.|}*)

}

type list_progress_update_streams_request = {
  max_results: int option;
   (**{|
    Filter to limit the maximum number of results to list per page.|}*)

  next_token: string option;
   (**{|
    If a [NextToken] was returned by a previous call, there are more results
    available. To retrieve the next page of results, make the call again
    using the returned token in [NextToken].|}*)

}

type list_migration_tasks_result = {
  migration_task_summary_list: migration_task_summary list option;
   (**{|
    Lists the migration task's summary which includes: [MigrationTaskName],
    [ProgressPercent], [ProgressUpdateStream], [Status], and the
    [UpdateDateTime] for each task.|}*)

  next_token: string option;
   (**{|
    If there are more migration tasks than the max result, return the next
    token to be passed to the next call as a bookmark of where to start from.|}*)

}

type list_migration_tasks_request = {
  resource_name: string option;
   (**{|
    Filter migration tasks by discovered resource name.|}*)

  max_results: int option;
   (**{|
    Value to specify how many results are returned per page.|}*)

  next_token: string option;
   (**{|
    If a [NextToken] was returned by a previous call, there are more results
    available. To retrieve the next page of results, make the call again
    using the returned token in [NextToken].|}*)

}

(**{|
    Object representing the on-premises resource being migrated.|}*)
type discovered_resource = {
  description: string option;
   (**{|
    A description that can be free-form text to record additional detail
    about the discovered resource for clarity or later reference.|}*)

  configuration_id: string;
   (**{|
    The configurationId in Application Discovery Service that uniquely
    identifies the on-premise resource.|}*)

}

type list_discovered_resources_result = {
  discovered_resource_list: discovered_resource list option;
   (**{|
    Returned list of discovered resources associated with the given
    MigrationTask.|}*)

  next_token: string option;
   (**{|
    If there are more discovered resources than the max result, return the
    next token to be passed to the next call as a bookmark of where to start
    from.|}*)

}

type list_discovered_resources_request = {
  max_results: int option;
   (**{|
    The maximum number of results returned per page.|}*)

  next_token: string option;
   (**{|
    If a [NextToken] was returned by a previous call, there are more results
    available. To retrieve the next page of results, make the call again
    using the returned token in [NextToken].|}*)

  migration_task_name: string;
   (**{|
    The name of the MigrationTask. {i Do not store personal data in this
    field.}|}*)

  progress_update_stream: string;
   (**{|
    The name of the ProgressUpdateStream.|}*)

}

(**{|
    An ARN of the AWS cloud resource target receiving the migration (e.g.,
    AMI, EC2 instance, RDS instance, etc.).|}*)
type created_artifact = {
  description: string option;
   (**{|
    A description that can be free-form text to record additional detail
    about the artifact for clarity or for later reference.|}*)

  name: string;
   (**{|
    An ARN that uniquely identifies the result of a migration task.|}*)

}

type list_created_artifacts_result = {
  created_artifact_list: created_artifact list option;
   (**{|
    List of created artifacts up to the maximum number of results specified
    in the request.|}*)

  next_token: string option;
   (**{|
    If there are more created artifacts than the max result, return the next
    token to be passed to the next call as a bookmark of where to start from.|}*)

}

type list_created_artifacts_request = {
  max_results: int option;
   (**{|
    Maximum number of results to be returned per page.|}*)

  next_token: string option;
   (**{|
    If a [NextToken] was returned by a previous call, there are more results
    available. To retrieve the next page of results, make the call again
    using the returned token in [NextToken].|}*)

  migration_task_name: string;
   (**{|
    Unique identifier that references the migration task. {i Do not store
    personal data in this field.}|}*)

  progress_update_stream: string;
   (**{|
    The name of the ProgressUpdateStream.|}*)

}

(**{|
    The state of an application discovered through Migration Hub import, the
    AWS Agentless Discovery Connector, or the AWS Application Discovery
    Agent.|}*)
type application_state = {
  last_updated_time: float option;
   (**{|
    The timestamp when the application status was last updated.|}*)

  application_status: application_status option;
   (**{|
    The current status of an application.|}*)

  application_id: string option;
   (**{|
    The configurationId from the Application Discovery Service that uniquely
    identifies an application.|}*)

}

type list_application_states_result = {
  next_token: string option;
   (**{|
    If a [NextToken] was returned by a previous call, there are more results
    available. To retrieve the next page of results, make the call again
    using the returned token in [NextToken].|}*)

  application_state_list: application_state list option;
   (**{|
    A list of Applications that exist in Application Discovery Service.|}*)

}

type list_application_states_request = {
  max_results: int option;
   (**{|
    Maximum number of results to be returned per page.|}*)

  next_token: string option;
   (**{|
    If a [NextToken] was returned by a previous call, there are more results
    available. To retrieve the next page of results, make the call again
    using the returned token in [NextToken].|}*)

  application_ids: string list option;
   (**{|
    The configurationIds from the Application Discovery Service that uniquely
    identifies your applications.|}*)

}

type import_migration_task_result = unit

type import_migration_task_request = {
  dry_run: bool option;
   (**{|
    Optional boolean flag to indicate whether any effect should take place.
    Used to test if the caller has permission to make the call.|}*)

  migration_task_name: string;
   (**{|
    Unique identifier that references the migration task. {i Do not store
    personal data in this field.}|}*)

  progress_update_stream: string;
   (**{|
    The name of the ProgressUpdateStream. >|}*)

}

type disassociate_discovered_resource_result = unit

type disassociate_discovered_resource_request = {
  dry_run: bool option;
   (**{|
    Optional boolean flag to indicate whether any effect should take place.
    Used to test if the caller has permission to make the call.|}*)

  configuration_id: string;
   (**{|
    ConfigurationId of the Application Discovery Service resource to be
    disassociated.|}*)

  migration_task_name: string;
   (**{|
    The identifier given to the MigrationTask. {i Do not store personal data
    in this field.}|}*)

  progress_update_stream: string;
   (**{|
    The name of the ProgressUpdateStream.|}*)

}

type disassociate_created_artifact_result = unit

type disassociate_created_artifact_request = {
  dry_run: bool option;
   (**{|
    Optional boolean flag to indicate whether any effect should take place.
    Used to test if the caller has permission to make the call.|}*)

  created_artifact_name: string;
   (**{|
    An ARN of the AWS resource related to the migration (e.g., AMI, EC2
    instance, RDS instance, etc.)|}*)

  migration_task_name: string;
   (**{|
    Unique identifier that references the migration task to be disassociated
    with the artifact. {i Do not store personal data in this field.}|}*)

  progress_update_stream: string;
   (**{|
    The name of the ProgressUpdateStream.|}*)

}

type describe_migration_task_result = {
  migration_task: migration_task option;
   (**{|
    Object encapsulating information about the migration task.|}*)

}

type describe_migration_task_request = {
  migration_task_name: string;
   (**{|
    The identifier given to the MigrationTask. {i Do not store personal data
    in this field.}|}*)

  progress_update_stream: string;
   (**{|
    The name of the ProgressUpdateStream.|}*)

}

type describe_application_state_result = {
  last_updated_time: float option;
   (**{|
    The timestamp when the application status was last updated.|}*)

  application_status: application_status option;
   (**{|
    Status of the application - Not Started, In-Progress, Complete.|}*)

}

type describe_application_state_request = {
  application_id: string;
   (**{|
    The configurationId in Application Discovery Service that uniquely
    identifies the grouped application.|}*)

}

type delete_progress_update_stream_result = unit

type delete_progress_update_stream_request = {
  dry_run: bool option;
   (**{|
    Optional boolean flag to indicate whether any effect should take place.
    Used to test if the caller has permission to make the call.|}*)

  progress_update_stream_name: string;
   (**{|
    The name of the ProgressUpdateStream. {i Do not store personal data in
    this field.}|}*)

}

type create_progress_update_stream_result = unit

type create_progress_update_stream_request = {
  dry_run: bool option;
   (**{|
    Optional boolean flag to indicate whether any effect should take place.
    Used to test if the caller has permission to make the call.|}*)

  progress_update_stream_name: string;
   (**{|
    The name of the ProgressUpdateStream. {i Do not store personal data in
    this field.}|}*)

}

type associate_discovered_resource_result = unit

type associate_discovered_resource_request = {
  dry_run: bool option;
   (**{|
    Optional boolean flag to indicate whether any effect should take place.
    Used to test if the caller has permission to make the call.|}*)

  discovered_resource: discovered_resource;
   (**{|
    Object representing a Resource.|}*)

  migration_task_name: string;
   (**{|
    The identifier given to the MigrationTask. {i Do not store personal data
    in this field.}|}*)

  progress_update_stream: string;
   (**{|
    The name of the ProgressUpdateStream.|}*)

}

type associate_created_artifact_result = unit

type associate_created_artifact_request = {
  dry_run: bool option;
   (**{|
    Optional boolean flag to indicate whether any effect should take place.
    Used to test if the caller has permission to make the call.|}*)

  created_artifact: created_artifact;
   (**{|
    An ARN of the AWS resource related to the migration (e.g., AMI, EC2
    instance, RDS instance, etc.)|}*)

  migration_task_name: string;
   (**{|
    Unique identifier that references the migration task. {i Do not store
    personal data in this field.}|}*)

  progress_update_stream: string;
   (**{|
    The name of the ProgressUpdateStream.|}*)

}

(**{|
    The AWS Migration Hub API methods help to obtain server and application
    migration status and integrate your resource-specific migration tool by
    providing a programmatic interface to Migration Hub.
    
    Remember that you must set your AWS Migration Hub home region before you
    call any of these APIs, or a [HomeRegionNotSetException] error will be
    returned. Also, you must make the API calls while in your home region.|}*)


type base_document = Json.t

