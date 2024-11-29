(** 
    SSM client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(** 
    The result body of the UpdateServiceSetting API operation.
     *)
type update_service_setting_result = unit

(** 
    The request body of the UpdateServiceSetting API operation.
     *)
type update_service_setting_request = {
  setting_value: string;
  (** 
    The new value to specify for the service setting. The following list specifies the available values for each setting.
    
     {ul
          {- For [/ssm/managed-instance/default-ec2-instance-management-role], enter the name of an IAM role.
             
             }
           {- For [/ssm/automation/customer-script-log-destination], enter [CloudWatch].
              
              }
           {- For [/ssm/automation/customer-script-log-group-name], enter the name of an Amazon CloudWatch Logs log group.
              
              }
           {- For [/ssm/documents/console/public-sharing-permission], enter [Enable] or [Disable].
              
              }
           {- For [/ssm/managed-instance/activation-tier], enter [standard] or [advanced].
              
              }
           {- For [/ssm/opsinsights/opscenter], enter [Enabled] or [Disabled].
              
              }
           {- For [/ssm/parameter-store/default-parameter-tier], enter [Standard], [Advanced], or [Intelligent-Tiering]
              
              }
           {- For [/ssm/parameter-store/high-throughput-enabled], enter [true] or [false].
              
              }
          
      }
       *)

  setting_id: string;
  (** 
    The Amazon Resource Name (ARN) of the service setting to update. For example, [arn:aws:ssm:us-east-1:111122223333:servicesetting/ssm/parameter-store/high-throughput-enabled]. The setting ID can be one of the following.
    
     {ul
          {- [/ssm/managed-instance/default-ec2-instance-management-role]
             
             }
           {- [/ssm/automation/customer-script-log-destination]
              
              }
           {- [/ssm/automation/customer-script-log-group-name]
              
              }
           {- [/ssm/documents/console/public-sharing-permission]
              
              }
           {- [/ssm/managed-instance/activation-tier]
              
              }
           {- [/ssm/opsinsights/opscenter]
              
              }
           {- [/ssm/parameter-store/default-parameter-tier]
              
              }
           {- [/ssm/parameter-store/high-throughput-enabled]
              
              }
          
      }
       Permissions to update the [/ssm/managed-instance/default-ec2-instance-management-role] setting should only be provided to administrators. Implement least privilege access when allowing individuals to configure or modify the Default Host Management Configuration.
       
        *)

}

(** 
    There are concurrent updates for a resource that supports one update at a time.
     *)
type too_many_updates = {
  message: string option;
  
}

(** 
    The specified service setting wasn't found. Either the service name or the setting hasn't been provisioned by the Amazon Web Services service team.
     *)
type service_setting_not_found = {
  message: string option;
  
}

(** 
    An error occurred on the server side.
     *)
type internal_server_error = {
  message: string option;
  
}

type update_resource_data_sync_result = unit

(** 
    The Organizations organizational unit data source for the sync.
     *)
type resource_data_sync_organizational_unit = {
  organizational_unit_id: string option;
  (** 
    The Organizations unit ID data source for the sync.
     *)

}

(** 
    Information about the [AwsOrganizationsSource] resource data sync source. A sync source of this type can synchronize data from Organizations or, if an Amazon Web Services organization isn't present, from multiple Amazon Web Services Regions.
     *)
type resource_data_sync_aws_organizations_source = {
  organizational_units: resource_data_sync_organizational_unit list option;
  (** 
    The Organizations organization units included in the sync.
     *)

  organization_source_type: string;
  (** 
    If an Amazon Web Services organization is present, this is either [OrganizationalUnits] or [EntireOrganization]. For [OrganizationalUnits], the data is aggregated from a set of organization units. For [EntireOrganization], the data is aggregated from the entire Amazon Web Services organization.
     *)

}

(** 
    Information about the source of the data included in the resource data sync.
     *)
type resource_data_sync_source = {
  enable_all_ops_data_sources: bool option;
  (** 
    When you create a resource data sync, if you choose one of the Organizations options, then Systems Manager automatically enables all OpsData sources in the selected Amazon Web Services Regions for all Amazon Web Services accounts in your organization (or in the selected organization units). For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html}Setting up Systems Manager Explorer to display data from multiple accounts and Regions} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  include_future_regions: bool option;
  (** 
    Whether to automatically synchronize and aggregate data from new Amazon Web Services Regions when those Regions come online.
     *)

  source_regions: string list;
  (** 
    The [SyncSource] Amazon Web Services Regions included in the resource data sync.
     *)

  aws_organizations_source: resource_data_sync_aws_organizations_source option;
  (** 
    Information about the [AwsOrganizationsSource] resource data sync source. A sync source of this type can synchronize data from Organizations.
     *)

  source_type: string;
  (** 
    The type of data source for the resource data sync. [SourceType] is either [AwsOrganizations] (if an organization is present in Organizations) or [SingleAccountMultiRegions].
     *)

}

type update_resource_data_sync_request = {
  sync_source: resource_data_sync_source;
  (** 
    Specify information about the data sources to synchronize.
     *)

  sync_type: string;
  (** 
    The type of resource data sync. The supported [SyncType] is SyncFromSource.
     *)

  sync_name: string;
  (** 
    The name of the resource data sync you want to update.
     *)

}

(** 
    The specified sync name wasn't found.
     *)
type resource_data_sync_not_found_exception = {
  message: string option;
  
  sync_type: string option;
  
  sync_name: string option;
  
}

(** 
    The specified sync configuration is invalid.
     *)
type resource_data_sync_invalid_configuration_exception = {
  message: string option;
  
}

(** 
    Another [UpdateResourceDataSync] request is being processed. Wait a few minutes and try again.
     *)
type resource_data_sync_conflict_exception = {
  message: string option;
  
}

type operating_system = | AmazonLinux2023
  | AlmaLinux
  | Rocky_Linux
  | Raspbian
  | MacOS
  | Debian
  | OracleLinux
  | CentOS
  | Suse
  | RedhatEnterpriseLinux
  | Ubuntu
  | AmazonLinux2022
  | AmazonLinux2
  | AmazonLinux
  | Windows

type patch_filter_key = | Version
  | Security
  | Severity
  | Release
  | Repository
  | Priority
  | Section
  | PatchId
  | Name
  | MsrcSeverity
  | Epoch
  | CVEId
  | Classification
  | ProductFamily
  | Product
  | PatchSet
  | BugzillaId
  | AdvisoryId
  | Arch

[@@ocaml.doc {| 
    Defines which patches should be included in a patch baseline.
    
     A patch filter consists of a key and a set of values. The filter key is a patch property. For example, the available filter keys for [WINDOWS] are [PATCH_SET], [PRODUCT], [PRODUCT_FAMILY], [CLASSIFICATION], and [MSRC_SEVERITY].
     
      The filter values define a matching criterion for the patch property indicated by the key. For example, if the filter key is [PRODUCT] and the filter values are [\["Office
    2013", "Office 2016"\]], then the filter accepts all patches where product name is either "Office 2013" or "Office 2016". The filter values can be exact values for the patch property given as a key, or a wildcard (*), which matches all values.
      
       You can view lists of valid values for the patch properties by running the [DescribePatchProperties] command. For information about which patch properties can be used with each major operating system, see [DescribePatchProperties].
        |}]
type patch_filter = {
  values: string list;
  (** 
    The value for the filter key.
    
     Run the [DescribePatchProperties] command to view lists of valid values for each key based on operating system type.
      *)

  key: patch_filter_key;
  (** 
    The key for the filter.
    
     Run the [DescribePatchProperties] command to view lists of valid keys for each operating system type.
      *)

}

(** 
    A set of patch filters, typically used for approval rules.
     *)
type patch_filter_group = {
  patch_filters: patch_filter list;
  (** 
    The set of patch filters that make up the group.
     *)

}

type patch_compliance_level = | Unspecified
  | Informational
  | Low
  | Medium
  | High
  | Critical

(** 
    Defines an approval rule for a patch baseline.
     *)
type patch_rule = {
  enable_non_security: bool option;
  (** 
    For managed nodes identified by the approval rule filters, enables a patch baseline to apply non-security updates available in the specified repository. The default value is [false]. Applies to Linux managed nodes only.
     *)

  approve_until_date: string option;
  (** 
    The cutoff date for auto approval of released patches. Any patches released on or before this date are installed automatically. Not supported on Debian Server or Ubuntu Server.
    
     Enter dates in the format [YYYY-MM-DD]. For example, [2021-12-31].
      *)

  approve_after_days: int option;
  (** 
    The number of days after the release date of each patch matched by the rule that the patch is marked as approved in the patch baseline. For example, a value of [7] means that patches are approved seven days after they are released. Not supported on Debian Server or Ubuntu Server.
     *)

  compliance_level: patch_compliance_level option;
  (** 
    A compliance severity level for all approved patches in a patch baseline.
     *)

  patch_filter_group: patch_filter_group;
  (** 
    The patch filter group that defines the criteria for the rule.
     *)

}

(** 
    A set of rules defining the approval rules for a patch baseline.
     *)
type patch_rule_group = {
  patch_rules: patch_rule list;
  (** 
    The rules that make up the rule group.
     *)

}

type patch_action = | Block
  | AllowAsDependency

(** 
    Information about the patches to use to update the managed nodes, including target operating systems and source repository. Applies to Linux managed nodes only.
     *)
type patch_source = {
  configuration: string;
  (** 
    The value of the yum repo configuration. For example:
    
     [\[main\]]
     
      [name=MyCustomRepository]
      
       [baseurl=https://my-custom-repository]
       
        [enabled=1]
        
         For information about other options available for your yum repository configuration, see {{:https://man7.org/linux/man-pages/man5/dnf.conf.5.html}dnf.conf(5)}.
         
          *)

  products: string list;
  [@ocaml.doc {| 
    The specific operating system versions a patch repository applies to, such as "Ubuntu16.04", "AmazonLinux2016.09", "RedhatEnterpriseLinux7.2" or "Suse12.7". For lists of supported product values, see [PatchFilter].
     |}]

  name: string;
  (** 
    The name specified to identify the patch source.
     *)

}

type update_patch_baseline_result = {
  sources: patch_source list option;
  (** 
    Information about the patches to use to update the managed nodes, including target operating systems and source repositories. Applies to Linux managed nodes only.
     *)

  description: string option;
  (** 
    A description of the patch baseline.
     *)

  modified_date: float option;
  (** 
    The date when the patch baseline was last modified.
     *)

  created_date: float option;
  (** 
    The date when the patch baseline was created.
     *)

  rejected_patches_action: patch_action option;
  (** 
    The action specified to take on patches included in the [RejectedPatches] list. A patch can be allowed only if it is a dependency of another package, or blocked entirely along with packages that include it as a dependency.
     *)

  rejected_patches: string list option;
  (** 
    A list of explicitly rejected patches for the baseline.
     *)

  approved_patches_enable_non_security: bool option;
  (** 
    Indicates whether the list of approved patches includes non-security updates that should be applied to the managed nodes. The default value is [false]. Applies to Linux managed nodes only.
     *)

  approved_patches_compliance_level: patch_compliance_level option;
  (** 
    The compliance severity level assigned to the patch baseline after the update completed.
     *)

  approved_patches: string list option;
  (** 
    A list of explicitly approved patches for the baseline.
     *)

  approval_rules: patch_rule_group option;
  (** 
    A set of rules used to include patches in the baseline.
     *)

  global_filters: patch_filter_group option;
  (** 
    A set of global filters used to exclude patches from the baseline.
     *)

  operating_system: operating_system option;
  (** 
    The operating system rule used by the updated patch baseline.
     *)

  name: string option;
  (** 
    The name of the patch baseline.
     *)

  baseline_id: string option;
  (** 
    The ID of the deleted patch baseline.
     *)

}

type update_patch_baseline_request = {
  replace: bool option;
  (** 
    If True, then all fields that are required by the [CreatePatchBaseline] operation are also required for this API request. Optional fields that aren't specified are set to null.
     *)

  sources: patch_source list option;
  (** 
    Information about the patches to use to update the managed nodes, including target operating systems and source repositories. Applies to Linux managed nodes only.
     *)

  description: string option;
  (** 
    A description of the patch baseline.
     *)

  rejected_patches_action: patch_action option;
  (** 
    The action for Patch Manager to take on patches included in the [RejectedPackages] list.
    
     {ul
          {- {b [ALLOW_AS_DEPENDENCY]}: A package in the [Rejected] patches list is installed only if it is a dependency of another package. It is considered compliant with the patch baseline, and its status is reported as [InstalledOther]. This is the default action if no option is specified.
             
             }
           {- {b BLOCK}: Packages in the {b Rejected patches} list, and packages that include them as dependencies, aren't installed by Patch Manager under any circumstances. If a package was installed before it was added to the {b Rejected patches} list, or is installed outside of Patch Manager afterward, it's considered noncompliant with the patch baseline and its status is reported as {i InstalledRejected}.
              
              }
          
      }
       *)

  rejected_patches: string list option;
  (** 
    A list of explicitly rejected patches for the baseline.
    
     For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}About package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  approved_patches_enable_non_security: bool option;
  (** 
    Indicates whether the list of approved patches includes non-security updates that should be applied to the managed nodes. The default value is [false]. Applies to Linux managed nodes only.
     *)

  approved_patches_compliance_level: patch_compliance_level option;
  (** 
    Assigns a new compliance severity level to an existing patch baseline.
     *)

  approved_patches: string list option;
  (** 
    A list of explicitly approved patches for the baseline.
    
     For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}About package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  approval_rules: patch_rule_group option;
  (** 
    A set of rules used to include patches in the baseline.
     *)

  global_filters: patch_filter_group option;
  (** 
    A set of global filters used to include patches in the baseline.
     *)

  name: string option;
  (** 
    The name of the patch baseline.
     *)

  baseline_id: string;
  (** 
    The ID of the patch baseline to update.
     *)

}

(** 
    Error returned when the ID specified for a resource, such as a maintenance window or patch baseline, doesn't exist.
    
     For information about resource quotas in Amazon Web Services Systems Manager, see {{:https://docs.aws.amazon.com/general/latest/gr/ssm.html#limits_ssm}Systems Manager service quotas} in the {i Amazon Web Services General Reference}.
      *)
type does_not_exist_exception = {
  message: string option;
  
}

type update_ops_metadata_result = {
  ops_metadata_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the OpsMetadata Object that was updated.
     *)

}

(** 
    Metadata to assign to an Application Manager application.
     *)
type metadata_value = {
  value: string option;
  (** 
    Metadata value to assign to an Application Manager application.
     *)

}

type update_ops_metadata_request = {
  keys_to_delete: string list option;
  (** 
    The metadata keys to delete from the OpsMetadata object.
     *)

  metadata_to_update: (string * metadata_value) list option;
  (** 
    Metadata to add to an OpsMetadata object.
     *)

  ops_metadata_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the OpsMetadata Object to update.
     *)

}

(** 
    The system is processing too many concurrent updates. Wait a few moments and try again.
     *)
type ops_metadata_too_many_updates_exception = {
  message: string option;
  
}

(** 
    The OpsMetadata object doesn't exist.
     *)
type ops_metadata_not_found_exception = {
  message: string option;
  
}

(** 
    The OpsMetadata object exceeds the maximum number of OpsMetadata keys that you can assign to an application in Application Manager.
     *)
type ops_metadata_key_limit_exceeded_exception = {
  message: string option;
  
}

(** 
    One of the arguments passed is invalid.
     *)
type ops_metadata_invalid_argument_exception = {
  message: string option;
  
}

type update_ops_item_response = unit

type ops_item_data_type = | STRING
  | SEARCHABLE_STRING

(** 
    An object that defines the value of the key and its type in the OperationalData map.
     *)
type ops_item_data_value = {
  type_: ops_item_data_type option;
  (** 
    The type of key-value pair. Valid types include [SearchableString] and [String].
     *)

  value: string option;
  (** 
    The value of the OperationalData key.
     *)

}

(** 
    A notification about the OpsItem.
     *)
type ops_item_notification = {
  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of an Amazon Simple Notification Service (Amazon SNS) topic where notifications are sent when this OpsItem is edited or changed.
     *)

}

(** 
    An OpsItems that shares something in common with the current OpsItem. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.
     *)
type related_ops_item = {
  ops_item_id: string;
  (** 
    The ID of an OpsItem related to the current OpsItem.
     *)

}

type ops_item_status = | CLOSED
  | REJECTED
  | APPROVED
  | PENDING_APPROVAL
  | CHANGE_CALENDAR_OVERRIDE_REJECTED
  | CHANGE_CALENDAR_OVERRIDE_APPROVED
  | PENDING_CHANGE_CALENDAR_OVERRIDE
  | RUNBOOK_IN_PROGRESS
  | SCHEDULED
  | COMPLETED_WITH_FAILURE
  | COMPLETED_WITH_SUCCESS
  | FAILED
  | CANCELLED
  | CANCELLING
  | TIMED_OUT
  | PENDING
  | RESOLVED
  | IN_PROGRESS
  | OPEN

type update_ops_item_request = {
  ops_item_arn: string option;
  (** 
    The OpsItem Amazon Resource Name (ARN).
     *)

  planned_end_time: float option;
  (** 
    The time specified in a change request for a runbook workflow to end. Currently supported only for the OpsItem type [/aws/changerequest].
     *)

  planned_start_time: float option;
  (** 
    The time specified in a change request for a runbook workflow to start. Currently supported only for the OpsItem type [/aws/changerequest].
     *)

  actual_end_time: float option;
  (** 
    The time a runbook workflow ended. Currently reported only for the OpsItem type [/aws/changerequest].
     *)

  actual_start_time: float option;
  (** 
    The time a runbook workflow started. Currently reported only for the OpsItem type [/aws/changerequest].
     *)

  severity: string option;
  (** 
    Specify a new severity for an OpsItem.
     *)

  category: string option;
  (** 
    Specify a new category for an OpsItem.
     *)

  title: string option;
  (** 
    A short heading that describes the nature of the OpsItem and the impacted resource.
     *)

  ops_item_id: string;
  (** 
    The ID of the OpsItem.
     *)

  status: ops_item_status option;
  (** 
    The OpsItem status. Status can be [Open], [In Progress], or [Resolved]. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems-editing-details.html}Editing OpsItem details} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  related_ops_items: related_ops_item list option;
  (** 
    One or more OpsItems that share something in common with the current OpsItems. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.
     *)

  priority: int option;
  (** 
    The importance of this OpsItem in relation to other OpsItems in the system.
     *)

  notifications: ops_item_notification list option;
  (** 
    The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is edited or changed.
     *)

  operational_data_to_delete: string list option;
  (** 
    Keys that you want to remove from the OperationalData map.
     *)

  operational_data: (string * ops_item_data_value) list option;
  (** 
    Add new keys or edit existing key-value pairs of the OperationalData map in the OpsItem object.
    
     Operational data is custom data that provides useful reference details about the OpsItem. For example, you can specify log files, error strings, license keys, troubleshooting tips, or other relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128 characters. The value has a maximum size of 20 KB.
     
      Operational data keys {i can't} begin with the following: [amazon], [aws], [amzn], [ssm], [/amazon], [/aws], [/amzn], [/ssm].
      
       You can choose to make the data searchable by other users in the account or you can restrict search access. Searchable data means that all users with access to the OpsItem Overview page (as provided by the [DescribeOpsItems] API operation) can view and search on the specified data. Operational data that isn't searchable is only viewable by users who have access to the OpsItem (as provided by the [GetOpsItem] API operation).
       
        Use the [/aws/resources] key in OperationalData to specify a related resource in the request. Use the [/aws/automations] key in OperationalData to associate an Automation runbook with the OpsItem. To view Amazon Web Services CLI example commands that use these keys, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-manually-create-OpsItems.html}Creating OpsItems manually} in the {i Amazon Web Services Systems Manager User Guide}.
         *)

  description: string option;
  (** 
    User-defined text that contains information about the OpsItem, in Markdown format.
     *)

}

(** 
    The specified OpsItem ID doesn't exist. Verify the ID and try again.
     *)
type ops_item_not_found_exception = {
  message: string option;
  
}

(** 
    The request caused OpsItems to exceed one or more quotas.
     *)
type ops_item_limit_exceeded_exception = {
  message: string option;
  
  limit_type: string option;
  
  limit: int option;
  
  resource_types: string list option;
  
}

(** 
    A specified parameter argument isn't valid. Verify the available arguments and try again.
     *)
type ops_item_invalid_parameter_exception = {
  message: string option;
  
  parameter_names: string list option;
  
}

(** 
    The specified OpsItem is in the process of being deleted.
     *)
type ops_item_conflict_exception = {
  message: string option;
  
}

(** 
    The OpsItem already exists.
     *)
type ops_item_already_exists_exception = {
  ops_item_id: string option;
  
  message: string option;
  
}

(** 
    You don't have permission to view OpsItems in the specified account. Verify that your account is configured either as a Systems Manager delegated administrator or that you are logged into the Organizations management account.
     *)
type ops_item_access_denied_exception = {
  message: string option;
  
}

type update_managed_instance_role_result = unit

type update_managed_instance_role_request = {
  iam_role: string;
  (** 
    The name of the Identity and Access Management (IAM) role that you want to assign to the managed node. This IAM role must provide AssumeRole permissions for the Amazon Web Services Systems Manager service principal [ssm.amazonaws.com]. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-service-role.html}Create an IAM service role for a hybrid and multicloud environment} in the {i Amazon Web Services Systems Manager User Guide}.
    
     You can't specify an IAM service-linked role for this parameter. You must create a unique role.
     
      *)

  instance_id: string;
  (** 
    The ID of the managed node where you want to update the role.
     *)

}

(** 
    The following problems can cause this exception:
    
     {ul
          {- You don't have permission to access the managed node.
             
             }
           {- Amazon Web Services Systems Manager Agent (SSM Agent) isn't running. Verify that SSM Agent is running.
              
              }
           {- SSM Agent isn't registered with the SSM endpoint. Try reinstalling SSM Agent.
              
              }
           {- The managed node isn't in a valid state. Valid states are: [Running], [Pending], [Stopped], and [Stopping]. Invalid states are: [Shutting-down] and [Terminated].
              
              }
          
      }
       *)
type invalid_instance_id = {
  message: string option;
  
}

(** 
    An array of search criteria that targets managed nodes using a key-value pair that you specify.
    
     One or more targets must be specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional for other maintenance window task types (Automation, Lambda, and Step Functions). For more information about running tasks that don't specify targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User Guide}.
     
      Supported formats include the following.
      
       {b For all Systems Manager capabilities:}
       
        {ul
             {- [Key=tag-key,Values=tag-value-1,tag-value-2]
                
                }
             
      }
       {b For Automation and Change Manager:}
       
        {ul
             {- [Key=tag:tag-key,Values=tag-value]
                
                }
              {- [Key=ResourceGroup,Values=resource-group-name]
                 
                 }
              {- [Key=ParameterValues,Values=value-1,value-2,value-3]
                 
                 }
              {- To target all instances in the Amazon Web Services Region:
                 
                  {ul
                       {- [Key=AWS::EC2::Instance,Values=*]
                          
                          }
                        {- [Key=InstanceIds,Values=*]
                           
                           }
                       
               }
               }
             
      }
       {b For Run Command and Maintenance Windows:}
       
        {ul
             {- [Key=InstanceIds,Values=instance-id-1,instance-id-2,instance-id-3]
                
                }
              {- [Key=tag:tag-key,Values=tag-value-1,tag-value-2]
                 
                 }
              {- [Key=resource-groups:Name,Values=resource-group-name]
                 
                 }
              {- Additionally, Maintenance Windows support targeting resource types:
                 
                  {ul
                       {- [Key=resource-groups:ResourceTypeFilters,Values=resource-type-1,resource-type-2]
                          
                          }
                       
               }
               }
             
      }
       {b For State Manager:}
       
        {ul
             {- [Key=InstanceIds,Values=instance-id-1,instance-id-2,instance-id-3]
                
                }
              {- [Key=tag:tag-key,Values=tag-value-1,tag-value-2]
                 
                 }
              {- To target all instances in the Amazon Web Services Region:
                 
                  {ul
                       {- [Key=InstanceIds,Values=*]
                          
                          }
                       
               }
               }
             
      }
       For more information about how to send commands that target managed nodes using [Key,Value] parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-targeting}Targeting multiple managed nodes} in the {i Amazon Web Services Systems Manager User Guide}.
        *)
type target = {
  values: string list option;
  (** 
    User-defined criteria that maps to [Key]. For example, if you specified [tag:ServerRole], you could specify [value:WebServer] to run a command on instances that include EC2 tags of [ServerRole,WebServer].
    
     Depending on the type of target, the maximum number of values for a key might be lower than the global maximum of 50.
      *)

  key: string option;
  (** 
    User-defined criteria for sending commands that target managed nodes that meet the criteria.
     *)

}

(** 
    Defines the values for a task parameter.
     *)
type maintenance_window_task_parameter_value_expression = {
  values: string list option;
  (** 
    This field contains an array of 0 or more strings, each 1 to 255 characters in length.
     *)

}

(** 
    Configuration options for sending command output to Amazon CloudWatch Logs.
     *)
type cloud_watch_output_config = {
  cloud_watch_output_enabled: bool option;
  (** 
    Enables Systems Manager to send command output to CloudWatch Logs.
     *)

  cloud_watch_log_group_name: string option;
  (** 
    The name of the CloudWatch Logs log group where you want to send command output. If you don't specify a group name, Amazon Web Services Systems Manager automatically creates a log group for you. The log group uses the following naming format:
    
     
     {[
     aws/ssm/{i SystemsManagerDocumentName}
     ]}
     
      *)

}

type document_hash_type = | SHA1
  | SHA256

type notification_event = | FAILED
  | CANCELLED
  | TIMED_OUT
  | SUCCESS
  | IN_PROGRESS
  | ALL

type notification_type = | Invocation
  | Command

(** 
    Configurations for sending notifications.
     *)
type notification_config = {
  notification_type: notification_type option;
  (** 
    The type of notification.
    
     {ul
          {- [Command]: Receive notification when the status of a command changes.
             
             }
           {- [Invocation]: For commands sent to multiple managed nodes, receive notification on a per-node basis when the status of a command changes.
              
              }
          
      }
       *)

  notification_events: notification_event list option;
  (** 
    The different events for which you can receive notifications. To learn more about these events, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html}Monitoring Systems Manager status changes using Amazon SNS notifications} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  notification_arn: string option;
  (** 
    An Amazon Resource Name (ARN) for an Amazon Simple Notification Service (Amazon SNS) topic. Run Command pushes notifications about command status changes to this topic.
     *)

}

(** 
    The parameters for a [RUN_COMMAND] task type.
    
     For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].
     
      [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
      
       [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
       
        For [RUN_COMMAND] tasks, Systems Manager uses specified values for [TaskParameters] and [LoggingInfo] only if no values are specified for [TaskInvocationParameters].
        
         *)
type maintenance_window_run_command_parameters = {
  timeout_seconds: int option;
  (** 
    If this time is reached and the command hasn't already started running, it doesn't run.
     *)

  service_role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for maintenance window Run Command tasks.
     *)

  parameters: (string * string list) list option;
  (** 
    The parameters for the [RUN_COMMAND] task execution.
     *)

  output_s3_key_prefix: string option;
  (** 
    The S3 bucket subfolder.
     *)

  output_s3_bucket_name: string option;
  (** 
    The name of the Amazon Simple Storage Service (Amazon S3) bucket.
     *)

  notification_config: notification_config option;
  (** 
    Configurations for sending notifications about command status changes on a per-managed node basis.
     *)

  document_version: string option;
  [@ocaml.doc {| 
    The Amazon Web Services Systems Manager document (SSM document) version to use in the request. You can specify [$DEFAULT], [$LATEST], or a specific version number. If you run commands by using the Amazon Web Services CLI, then you must escape the first two options by using a backslash. If you specify a version number, then you don't need to use the backslash. For example:
    
     [--document-version "\$DEFAULT"]
     
      [--document-version "\$LATEST"]
      
       [--document-version "3"]
        |}]

  document_hash_type: document_hash_type option;
  (** 
    SHA-256 or SHA-1. SHA-1 hashes have been deprecated.
     *)

  document_hash: string option;
  (** 
    The SHA-256 or SHA-1 hash created by the system when the document was created. SHA-1 hashes have been deprecated.
     *)

  cloud_watch_output_config: cloud_watch_output_config option;
  
  comment: string option;
  (** 
    Information about the commands to run.
     *)

}

(** 
    The parameters for an [AUTOMATION] task type.
     *)
type maintenance_window_automation_parameters = {
  parameters: (string * string list) list option;
  (** 
    The parameters for the [AUTOMATION] task.
    
     For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].
     
      [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
      
       [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
       
        For [AUTOMATION] task types, Amazon Web Services Systems Manager ignores any values specified for these parameters.
        
         *)

  document_version: string option;
  (** 
    The version of an Automation runbook to use during task execution.
     *)

}

(** 
    The parameters for a [STEP_FUNCTIONS] task.
    
     For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].
     
      [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
      
       [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
       
        For Step Functions tasks, Systems Manager ignores any values specified for [TaskParameters] and [LoggingInfo].
        
         *)
type maintenance_window_step_functions_parameters = {
  name: string option;
  (** 
    The name of the [STEP_FUNCTIONS] task.
     *)

  input: string option;
  (** 
    The inputs for the [STEP_FUNCTIONS] task.
     *)

}

(** 
    The parameters for a [LAMBDA] task type.
    
     For information about specifying and updating task parameters, see [RegisterTaskWithMaintenanceWindow] and [UpdateMaintenanceWindowTask].
     
      [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
      
       [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
       
        For Lambda tasks, Systems Manager ignores any values specified for TaskParameters and LoggingInfo.
        
         *)
type maintenance_window_lambda_parameters = {
  payload: bytes option;
  (** 
    JSON to provide to your Lambda function as input.
     *)

  qualifier: string option;
  (** 
    (Optional) Specify an Lambda function version or alias name. If you specify a function version, the operation uses the qualified function Amazon Resource Name (ARN) to invoke a specific Lambda function. If you specify an alias name, the operation uses the alias ARN to invoke the Lambda function version to which the alias points.
     *)

  client_context: string option;
  (** 
    Pass client-specific information to the Lambda function that you are invoking. You can then process the client information in your Lambda function as you choose through the context variable.
     *)

}

(** 
    The parameters for task execution.
     *)
type maintenance_window_task_invocation_parameters = {
  lambda: maintenance_window_lambda_parameters option;
  (** 
    The parameters for a [LAMBDA] task type.
     *)

  step_functions: maintenance_window_step_functions_parameters option;
  (** 
    The parameters for a [STEP_FUNCTIONS] task type.
     *)

  automation: maintenance_window_automation_parameters option;
  (** 
    The parameters for an [AUTOMATION] task type.
     *)

  run_command: maintenance_window_run_command_parameters option;
  (** 
    The parameters for a [RUN_COMMAND] task type.
     *)

}

(** 
    Information about an Amazon Simple Storage Service (Amazon S3) bucket to write managed node-level logs to.
    
     [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      *)
type logging_info = {
  s3_region: string;
  (** 
    The Amazon Web Services Region where the S3 bucket is located.
     *)

  s3_key_prefix: string option;
  (** 
    (Optional) The S3 bucket subfolder.
     *)

  s3_bucket_name: string;
  (** 
    The name of an S3 bucket where execution logs are stored.
     *)

}

type maintenance_window_task_cutoff_behavior = | CancelTask
  | ContinueTask

(** 
    A CloudWatch alarm you apply to an automation or command.
     *)
type alarm = {
  name: string;
  (** 
    The name of your CloudWatch alarm.
     *)

}

(** 
    The details for the CloudWatch alarm you want to apply to an automation or command.
     *)
type alarm_configuration = {
  alarms: alarm list;
  (** 
    The name of the CloudWatch alarm specified in the configuration.
     *)

  ignore_poll_alarm_failure: bool option;
  (** 
    When this value is {i true}, your automation or command continues to run in cases where we can’t retrieve alarm status information from CloudWatch. In cases where we successfully retrieve an alarm status of OK or INSUFFICIENT_DATA, the automation or command continues to run, regardless of this value. Default is {i false}.
     *)

}

type update_maintenance_window_task_result = {
  alarm_configuration: alarm_configuration option;
  (** 
    The details for the CloudWatch alarm you applied to your maintenance window task.
     *)

  cutoff_behavior: maintenance_window_task_cutoff_behavior option;
  (** 
    The specification for whether tasks should continue to run after the cutoff time specified in the maintenance windows is reached.
     *)

  description: string option;
  (** 
    The updated task description.
     *)

  name: string option;
  (** 
    The updated task name.
     *)

  logging_info: logging_info option;
  (** 
    The updated logging information in Amazon S3.
    
     [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      *)

  max_errors: string option;
  (** 
    The updated [MaxErrors] value.
     *)

  max_concurrency: string option;
  (** 
    The updated [MaxConcurrency] value.
     *)

  priority: int option;
  (** 
    The updated priority value.
     *)

  task_invocation_parameters: maintenance_window_task_invocation_parameters option;
  (** 
    The updated parameter values.
     *)

  task_parameters: (string * maintenance_window_task_parameter_value_expression) list option;
  (** 
    The updated parameter values.
    
     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      *)

  service_role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for maintenance window Run Command tasks.
     *)

  task_arn: string option;
  (** 
    The updated task ARN value.
     *)

  targets: target list option;
  (** 
    The updated target values.
     *)

  window_task_id: string option;
  (** 
    The task ID of the maintenance window that was updated.
     *)

  window_id: string option;
  (** 
    The ID of the maintenance window that was updated.
     *)

}

type update_maintenance_window_task_request = {
  alarm_configuration: alarm_configuration option;
  (** 
    The CloudWatch alarm you want to apply to your maintenance window task.
     *)

  cutoff_behavior: maintenance_window_task_cutoff_behavior option;
  (** 
    Indicates whether tasks should continue to run after the cutoff time specified in the maintenance windows is reached.
    
     {ul
          {- [CONTINUE_TASK]: When the cutoff time is reached, any tasks that are running continue. The default value.
             
             }
           {- [CANCEL_TASK]:
              
               {ul
                    {- For Automation, Lambda, Step Functions tasks: When the cutoff time is reached, any task invocations that are already running continue, but no new task invocations are started.
                       
                       }
                     {- For Run Command tasks: When the cutoff time is reached, the system sends a [CancelCommand] operation that attempts to cancel the command associated with the task. However, there is no guarantee that the command will be terminated and the underlying process stopped.
                        
                        }
                    
            }
             The status for tasks that are not completed is [TIMED_OUT].
             
             }
          
      }
       *)

  replace: bool option;
  (** 
    If True, then all fields that are required by the [RegisterTaskWithMaintenanceWindow] operation are also required for this API request. Optional fields that aren't specified are set to null.
     *)

  description: string option;
  (** 
    The new task description to specify.
     *)

  name: string option;
  (** 
    The new task name to specify.
     *)

  logging_info: logging_info option;
  (** 
    The new logging location in Amazon S3 to specify.
    
     [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      *)

  max_errors: string option;
  [@ocaml.doc {| 
    The new [MaxErrors] value to specify. [MaxErrors] is the maximum number of errors that are allowed before the task stops being scheduled.
    
     Although this element is listed as "Required: No", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.
     
      For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.
      
       |}]

  max_concurrency: string option;
  [@ocaml.doc {| 
    The new [MaxConcurrency] value you want to specify. [MaxConcurrency] is the number of targets that are allowed to run this task, in parallel.
    
     Although this element is listed as "Required: No", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.
     
      For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.
      
       |}]

  priority: int option;
  (** 
    The new task priority to specify. The lower the number, the higher the priority. Tasks that have the same priority are scheduled in parallel.
     *)

  task_invocation_parameters: maintenance_window_task_invocation_parameters option;
  (** 
    The parameters that the task should use during execution. Populate only the fields that match the task type. All other fields should be empty.
    
     When you update a maintenance window task that has options specified in [TaskInvocationParameters], you must provide again all the [TaskInvocationParameters] values that you want to retain. The values you don't specify again are removed. For example, suppose that when you registered a Run Command task, you specified [TaskInvocationParameters] values for [Comment], [NotificationConfig], and [OutputS3BucketName]. If you update the maintenance window task and specify only a different [OutputS3BucketName] value, the values for [Comment] and [NotificationConfig] are removed.
     
      *)

  task_parameters: (string * maintenance_window_task_parameter_value_expression) list option;
  (** 
    The parameters to modify.
    
     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      The map has the following format:
      
       Key: string, between 1 and 255 characters
       
        Value: an array of strings, each string is between 1 and 255 characters
         *)

  service_role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to assume when running a maintenance window task. If you do not specify a service role ARN, Systems Manager uses a service-linked role in your account. If no appropriate service-linked role for Systems Manager exists in your account, it is created when you run [RegisterTaskWithMaintenanceWindow].
    
     However, for an improved security posture, we strongly recommend creating a custom policy and custom service role for running your maintenance window tasks. The policy can be crafted to provide only the permissions needed for your particular maintenance window tasks. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html}Setting up maintenance windows} in the in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  task_arn: string option;
  (** 
    The task ARN to modify.
     *)

  targets: target list option;
  (** 
    The targets (either managed nodes or tags) to modify. Managed nodes are specified using the format [Key=instanceids,Values=instanceID_1,instanceID_2]. Tags are specified using the format [ Key=tag_name,Values=tag_value].
    
     One or more targets must be specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional for other maintenance window task types (Automation, Lambda, and Step Functions). For more information about running tasks that don't specify targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User Guide}.
     
      *)

  window_task_id: string;
  (** 
    The task ID to modify.
     *)

  window_id: string;
  (** 
    The maintenance window ID that contains the task to modify.
     *)

}

type update_maintenance_window_target_result = {
  description: string option;
  (** 
    The updated description.
     *)

  name: string option;
  (** 
    The updated name.
     *)

  owner_information: string option;
  (** 
    The updated owner.
     *)

  targets: target list option;
  (** 
    The updated targets.
     *)

  window_target_id: string option;
  (** 
    The target ID specified in the update request.
     *)

  window_id: string option;
  (** 
    The maintenance window ID specified in the update request.
     *)

}

type update_maintenance_window_target_request = {
  replace: bool option;
  (** 
    If [True], then all fields that are required by the [RegisterTargetWithMaintenanceWindow] operation are also required for this API request. Optional fields that aren't specified are set to null.
     *)

  description: string option;
  (** 
    An optional description for the update.
     *)

  name: string option;
  (** 
    A name for the update.
     *)

  owner_information: string option;
  (** 
    User-provided value that will be included in any Amazon CloudWatch Events events raised while running tasks for these targets in this maintenance window.
     *)

  targets: target list option;
  (** 
    The targets to add or replace.
     *)

  window_target_id: string;
  (** 
    The target ID to modify.
     *)

  window_id: string;
  (** 
    The maintenance window ID with which to modify the target.
     *)

}

type update_maintenance_window_result = {
  enabled: bool option;
  (** 
    Whether the maintenance window is enabled.
     *)

  allow_unassociated_targets: bool option;
  (** 
    Whether targets must be registered with the maintenance window before tasks can be defined for those targets.
     *)

  cutoff: int option;
  (** 
    The number of hours before the end of the maintenance window that Amazon Web Services Systems Manager stops scheduling new tasks for execution.
     *)

  duration: int option;
  (** 
    The duration of the maintenance window in hours.
     *)

  schedule_offset: int option;
  (** 
    The number of days to wait to run a maintenance window after the scheduled cron expression date and time.
     *)

  schedule_timezone: string option;
  [@ocaml.doc {| 
    The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see the {{:https://www.iana.org/time-zones}Time Zone Database} on the IANA website.
     |}]

  schedule: string option;
  (** 
    The schedule of the maintenance window in the form of a cron or rate expression.
     *)

  end_date: string option;
  (** 
    The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become inactive. The maintenance window won't run after this specified time.
     *)

  start_date: string option;
  (** 
    The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become active. The maintenance window won't run before this specified time.
     *)

  description: string option;
  (** 
    An optional description of the update.
     *)

  name: string option;
  (** 
    The name of the maintenance window.
     *)

  window_id: string option;
  (** 
    The ID of the created maintenance window.
     *)

}

type update_maintenance_window_request = {
  replace: bool option;
  (** 
    If [True], then all fields that are required by the [CreateMaintenanceWindow] operation are also required for this API request. Optional fields that aren't specified are set to null.
     *)

  enabled: bool option;
  (** 
    Whether the maintenance window is enabled.
     *)

  allow_unassociated_targets: bool option;
  (** 
    Whether targets must be registered with the maintenance window before tasks can be defined for those targets.
     *)

  cutoff: int option;
  (** 
    The number of hours before the end of the maintenance window that Amazon Web Services Systems Manager stops scheduling new tasks for execution.
     *)

  duration: int option;
  (** 
    The duration of the maintenance window in hours.
     *)

  schedule_offset: int option;
  [@ocaml.doc {| 
    The number of days to wait after the date and time specified by a cron expression before running the maintenance window.
    
     For example, the following cron expression schedules a maintenance window to run the third Tuesday of every month at 11:30 PM.
     
      [cron(30 23 ? * TUE#3 *)]
      
       If the schedule offset is [2], the maintenance window won't run until two days later.
        |}]

  schedule_timezone: string option;
  [@ocaml.doc {| 
    The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see the {{:https://www.iana.org/time-zones}Time Zone Database} on the IANA website.
     |}]

  schedule: string option;
  (** 
    The schedule of the maintenance window in the form of a cron or rate expression.
     *)

  end_date: string option;
  (** 
    The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become inactive. [EndDate] allows you to set a date and time in the future when the maintenance window will no longer run.
     *)

  start_date: string option;
  (** 
    The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become active. [StartDate] allows you to delay activation of the maintenance window until the specified future date.
    
     When using a rate schedule, if you provide a start date that occurs in the past, the current date and time are used as the start date.
     
      *)

  description: string option;
  (** 
    An optional description for the update request.
     *)

  name: string option;
  (** 
    The name of the maintenance window.
     *)

  window_id: string;
  (** 
    The ID of the maintenance window to update.
     *)

}

(** 
    The status of a document.
     *)
type document_status = | Failed
  | Deleting
  | Updating
  | Active
  | Creating

type document_parameter_type = | StringList
  | String

(** 
    Parameters specified in a Systems Manager document that run on the server when the command is run.
     *)
type document_parameter = {
  default_value: string option;
  (** 
    If specified, the default values for the parameters. Parameters without a default value are required. Parameters with a default value are optional.
     *)

  description: string option;
  (** 
    A description of what the parameter does, how to use it, the default value, and whether or not the parameter is optional.
     *)

  type_: document_parameter_type option;
  (** 
    The type of parameter. The type can be either String or StringList.
     *)

  name: string option;
  (** 
    The name of the parameter.
     *)

}

type platform_type = | MACOS
  | LINUX
  | WINDOWS

type document_type = | QuickSetup
  | ConformancePackTemplate
  | CloudFormation
  | ProblemAnalysisTemplate
  | ProblemAnalysis
  | ChangeTemplate
  | ChangeCalendar
  | DeploymentStrategy
  | ApplicationConfigurationSchema
  | ApplicationConfiguration
  | Package
  | Session
  | Automation
  | Policy
  | Command

type document_format = | TEXT
  | JSON
  | YAML

(** 
    Metadata that you assign to your Amazon Web Services resources. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. In Amazon Web Services Systems Manager, you can apply tags to Systems Manager documents (SSM documents), managed nodes, maintenance windows, parameters, patch baselines, OpsItems, and OpsMetadata.
     *)
type tag = {
  value: string;
  (** 
    The value of the tag.
     *)

  key: string;
  (** 
    The name of the tag.
     *)

}

(** 
    An attribute of an attachment, such as the attachment name.
     *)
type attachment_information = {
  name: string option;
  (** 
    The name of the attachment.
     *)

}

(** 
    An SSM document required by the current document.
     *)
type document_requires = {
  version_name: string option;
  (** 
    An optional field specifying the version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.
     *)

  require_type: string option;
  (** 
    The document type of the required SSM document.
     *)

  version: string option;
  (** 
    The document version required by the current document.
     *)

  name: string;
  (** 
    The name of the required SSM document. The name can be an Amazon Resource Name (ARN).
     *)

}

type review_status = | REJECTED
  | PENDING
  | NOT_REVIEWED
  | APPROVED

(** 
    Information about the result of a document review request.
     *)
type review_information = {
  reviewer: string option;
  (** 
    The reviewer assigned to take action on the document review request.
     *)

  status: review_status option;
  (** 
    The current status of the document review request.
     *)

  reviewed_time: float option;
  (** 
    The time that the reviewer took action on the document review request.
     *)

}

(** 
    Describes an Amazon Web Services Systems Manager document (SSM document).
     *)
type document_description = {
  category_enum: string list option;
  (** 
    The value that identifies a document's category.
     *)

  category: string list option;
  (** 
    The classification of a document to help you identify and categorize its use.
     *)

  review_status: review_status option;
  (** 
    The current status of the review.
     *)

  pending_review_version: string option;
  (** 
    The version of the document that is currently under review.
     *)

  approved_version: string option;
  (** 
    The version of the document currently approved for use in the organization.
     *)

  review_information: review_information list option;
  (** 
    Details about the review of a document.
     *)

  author: string option;
  (** 
    The user in your organization who created the document.
     *)

  requires: document_requires list option;
  (** 
    A list of SSM documents required by a document. For example, an [ApplicationConfiguration] document requires an [ApplicationConfigurationSchema] document.
     *)

  attachments_information: attachment_information list option;
  (** 
    Details about the document attachments, including names, locations, sizes, and so on.
     *)

  tags: tag list option;
  (** 
    The tags, or metadata, that have been applied to the document.
     *)

  target_type: string option;
  (** 
    The target type which defines the kinds of resources the document can run on. For example, [/AWS::EC2::Instance]. For a list of valid resource types, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the {i CloudFormation User Guide}.
     *)

  document_format: document_format option;
  (** 
    The document format, either JSON or YAML.
     *)

  default_version: string option;
  (** 
    The default version.
     *)

  latest_version: string option;
  (** 
    The latest version of the document.
     *)

  schema_version: string option;
  (** 
    The schema version.
     *)

  document_type: document_type option;
  (** 
    The type of document.
     *)

  platform_types: platform_type list option;
  (** 
    The list of operating system (OS) platforms compatible with this SSM document.
     *)

  parameters: document_parameter list option;
  (** 
    A description of the parameters for a document.
     *)

  description: string option;
  (** 
    A description of the document.
     *)

  document_version: string option;
  (** 
    The document version.
     *)

  status_information: string option;
  [@ocaml.doc {| 
    A message returned by Amazon Web Services Systems Manager that explains the [Status] value. For example, a [Failed] status might be explained by the [StatusInformation] message, "The specified S3 bucket doesn't exist. Verify that the URL of the S3 bucket is correct."
     |}]

  status: document_status option;
  (** 
    The status of the SSM document.
     *)

  created_date: float option;
  (** 
    The date when the document was created.
     *)

  owner: string option;
  (** 
    The Amazon Web Services user that created the document.
     *)

  version_name: string option;
  (** 
    The version of the artifact associated with the document.
     *)

  display_name: string option;
  (** 
    The friendly name of the SSM document. This value can differ for each version of the document. If you want to update this value, see [UpdateDocument].
     *)

  name: string option;
  (** 
    The name of the SSM document.
     *)

  hash_type: document_hash_type option;
  (** 
    The hash type of the document. Valid values include [Sha256] or [Sha1].
    
     Sha1 hashes have been deprecated.
     
      *)

  hash: string option;
  (** 
    The Sha256 or Sha1 hash created by the system when the document was created.
    
     Sha1 hashes have been deprecated.
     
      *)

  sha1: string option;
  (** 
    The SHA1 hash of the document, which you can use for verification.
     *)

}

type update_document_result = {
  document_description: document_description option;
  (** 
    A description of the document that was updated.
     *)

}

type attachments_source_key = | AttachmentReference
  | S3FileUrl
  | SourceUrl

(** 
    Identifying information about a document attachment, including the file name and a key-value pair that identifies the location of an attachment to a document.
     *)
type attachments_source = {
  name: string option;
  (** 
    The name of the document attachment file.
     *)

  values: string list option;
  [@ocaml.doc {| 
    The value of a key-value pair that identifies the location of an attachment to a document. The format for {b Value} depends on the type of key you specify.
    
     {ul
          {- For the key {i SourceUrl}, the value is an S3 bucket location. For example:
             
              ["Values": \[ "s3://doc-example-bucket/my-folder" \]]
              
              }
           {- For the key {i S3FileUrl}, the value is a file in an S3 bucket. For example:
              
               ["Values": \[ "s3://doc-example-bucket/my-folder/my-file.py" \]]
               
               }
           {- For the key {i AttachmentReference}, the value is constructed from the name of another SSM document in your account, a version number of that document, and a file attached to that document version that you want to reuse. For example:
              
               ["Values": \[ "MyOtherDocument/3/my-other-file.py" \]]
               
                However, if the SSM document is shared with you from another account, the full SSM document ARN must be specified instead of the document name only. For example:
                
                 ["Values": \[
      "arn:aws:ssm:us-east-2:111122223333:document/OtherAccountDocument/3/their-file.py"
      \]]
                 
                 }
          
      }
       |}]

  key: attachments_source_key option;
  (** 
    The key of a key-value pair that identifies the location of an attachment to a document.
     *)

}

type update_document_request = {
  target_type: string option;
  (** 
    Specify a new target type for the document.
     *)

  document_format: document_format option;
  (** 
    Specify the document format for the new document version. Systems Manager supports JSON and YAML documents. JSON is the default format.
     *)

  document_version: string option;
  (** 
    The version of the document that you want to update. Currently, Systems Manager supports updating only the latest version of the document. You can specify the version number of the latest version or use the [$LATEST] variable.
    
     If you change a document version for a State Manager association, Systems Manager immediately runs the association unless you previously specifed the [apply-only-at-cron-interval] parameter.
     
      *)

  version_name: string option;
  (** 
    An optional field specifying the version of the artifact you are updating with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.
     *)

  display_name: string option;
  (** 
    The friendly name of the SSM document that you want to update. This value can differ for each version of the document. If you don't specify a value for this parameter in your request, the existing value is applied to the new document version.
     *)

  name: string;
  (** 
    The name of the SSM document that you want to update.
     *)

  attachments: attachments_source list option;
  (** 
    A list of key-value pairs that describe attachments to a version of a document.
     *)

  content: string;
  (** 
    A valid JSON or YAML string.
     *)

}

type update_document_metadata_response = unit

type document_review_action = | Reject
  | Approve
  | UpdateReview
  | SendForReview

type document_review_comment_type = | Comment

(** 
    Information about comments added to a document review request.
     *)
type document_review_comment_source = {
  content: string option;
  (** 
    The content of a comment entered by a user who requests a review of a new document version, or who reviews the new version.
     *)

  type_: document_review_comment_type option;
  (** 
    The type of information added to a review request. Currently, only the value [Comment] is supported.
     *)

}

(** 
    Information about a document approval review.
     *)
type document_reviews = {
  comment: document_review_comment_source list option;
  (** 
    A comment entered by a user in your organization about the document review request.
     *)

  action: document_review_action;
  (** 
    The action to take on a document approval review request.
     *)

}

type update_document_metadata_request = {
  document_reviews: document_reviews;
  (** 
    The change template review details to update.
     *)

  document_version: string option;
  (** 
    The version of a change template in which to update approval metadata.
     *)

  name: string;
  (** 
    The name of the change template for which a version's metadata is to be updated.
     *)

}

(** 
    The document version isn't valid or doesn't exist.
     *)
type invalid_document_version = {
  message: string option;
  
}

(** 
    You attempted to delete a document while it is still shared. You must stop sharing the document before you can delete it.
     *)
type invalid_document_operation = {
  message: string option;
  
}

(** 
    The specified SSM document doesn't exist.
     *)
type invalid_document = {
  message: string option;
  (** 
    The SSM document doesn't exist or the document isn't available to the user. This exception can be issued by various API operations.
     *)

}

(** 
    A default version of a document.
     *)
type document_default_version_description = {
  default_version_name: string option;
  (** 
    The default version of the artifact associated with the document.
     *)

  default_version: string option;
  (** 
    The default version of the document.
     *)

  name: string option;
  (** 
    The name of the document.
     *)

}

type update_document_default_version_result = {
  description: document_default_version_description option;
  (** 
    The description of a custom document that you want to set as the default version.
     *)

}

type update_document_default_version_request = {
  document_version: string;
  (** 
    The version of a custom document that you want to set as the default version.
     *)

  name: string;
  (** 
    The name of a custom document that you want to set as the default version.
     *)

}

(** 
    The version of the document schema isn't supported.
     *)
type invalid_document_schema_version = {
  message: string option;
  
}

(** 
    The size limit of a document is 64 KB.
     *)
type max_document_size_exceeded = {
  message: string option;
  
}

(** 
    The content for the document isn't valid.
     *)
type invalid_document_content = {
  message: string option;
  (** 
    A description of the validation error.
     *)

}

(** 
    The version name has already been used in this document. Specify a different version name, and then try again.
     *)
type duplicate_document_version_name = {
  message: string option;
  
}

(** 
    The content of the association document matches another document. Change the content of the document and try again.
     *)
type duplicate_document_content = {
  message: string option;
  
}

(** 
    The document has too many versions. Delete one or more document versions and try again.
     *)
type document_version_limit_exceeded = {
  message: string option;
  
}

type association_status_name = | Failed
  | Success
  | Pending

(** 
    Describes an association status.
     *)
type association_status = {
  additional_info: string option;
  (** 
    A user-defined string.
     *)

  message: string;
  (** 
    The reason for the status.
     *)

  name: association_status_name;
  (** 
    The status.
     *)

  date: float;
  (** 
    The date when the status changed.
     *)

}

(** 
    Information about the association.
     *)
type association_overview = {
  association_status_aggregated_count: (string * int) list option;
  (** 
    Returns the number of targets for the association status. For example, if you created an association with two managed nodes, and one of them was successful, this would return the count of managed nodes by status.
     *)

  detailed_status: string option;
  (** 
    A detailed status of the association.
     *)

  status: string option;
  (** 
    The status of the association. Status can be: Pending, Success, or Failed.
     *)

}

(** 
    An S3 bucket where you want to store the results of this request.
     *)
type s3_output_location = {
  output_s3_key_prefix: string option;
  (** 
    The S3 bucket subfolder.
     *)

  output_s3_bucket_name: string option;
  (** 
    The name of the S3 bucket.
     *)

  output_s3_region: string option;
  (** 
    The Amazon Web Services Region of the S3 bucket.
     *)

}

(** 
    An S3 bucket where you want to store the results of this request.
    
     For the minimal permissions required to enable Amazon S3 output for an association, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/state-manager-associations-creating.html#state-manager-associations-console}Create an association (console)} in the {i Systems Manager User Guide}.
      *)
type instance_association_output_location = {
  s3_location: s3_output_location option;
  (** 
    An S3 bucket where you want to store the results of this request.
     *)

}

type association_compliance_severity = | Unspecified
  | Low
  | Medium
  | High
  | Critical

type association_sync_compliance = | Manual
  | Auto

(** 
    The combination of Amazon Web Services Regions and Amazon Web Services accounts targeted by the current Automation execution.
     *)
type target_location = {
  target_location_alarm_configuration: alarm_configuration option;
  
  execution_role_name: string option;
  (** 
    The Automation execution role used by the currently running Automation. If not specified, the default value is [AWS-SystemsManager-AutomationExecutionRole].
     *)

  target_location_max_errors: string option;
  (** 
    The maximum number of errors allowed before the system stops queueing additional Automation executions for the currently running Automation.
     *)

  target_location_max_concurrency: string option;
  (** 
    The maximum number of Amazon Web Services Regions and Amazon Web Services accounts allowed to run the Automation concurrently.
     *)

  regions: string list option;
  (** 
    The Amazon Web Services Regions targeted by the current Automation execution.
     *)

  accounts: string list option;
  (** 
    The Amazon Web Services accounts targeted by the current Automation execution.
     *)

}

type external_alarm_state = | ALARM
  | UNKNOWN

(** 
    The details about the state of your CloudWatch alarm.
     *)
type alarm_state_information = {
  state: external_alarm_state;
  (** 
    The state of your CloudWatch alarm.
     *)

  name: string;
  (** 
    The name of your CloudWatch alarm.
     *)

}

(** 
    Describes the parameters for a document.
     *)
type association_description = {
  triggered_alarms: alarm_state_information list option;
  (** 
    The CloudWatch alarm that was invoked during the association.
     *)

  alarm_configuration: alarm_configuration option;
  
  target_maps: (string * string list) list list option;
  (** 
    A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.
     *)

  duration: int option;
  (** 
    The number of hours that an association can run on specified targets. After the resulting cutoff time passes, associations that are currently running are cancelled, and no pending executions are started on remaining targets.
     *)

  schedule_offset: int option;
  (** 
    Number of days to wait after the scheduled day to run an association.
     *)

  target_locations: target_location list option;
  (** 
    The combination of Amazon Web Services Regions and Amazon Web Services accounts where you want to run the association.
     *)

  calendar_names: string list option;
  (** 
    The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your associations are gated under. The associations only run when that change calendar is open. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar}Amazon Web Services Systems Manager Change Calendar}.
     *)

  apply_only_at_cron_interval: bool option;
  (** 
    By default, when you create a new associations, the system runs it immediately after it is created and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you create it. This parameter isn't supported for rate expressions.
     *)

  sync_compliance: association_sync_compliance option;
  (** 
    The mode for generating association compliance. You can specify [AUTO] or [MANUAL]. In [AUTO] mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is [COMPLIANT]. If the association execution doesn't run successfully, the association is [NON-COMPLIANT].
    
     In [MANUAL] mode, you must specify the [AssociationId] as a parameter for the [PutComplianceItems] API operation. In this case, compliance data isn't managed by State Manager, a capability of Amazon Web Services Systems Manager. It is managed by your direct call to the [PutComplianceItems] API operation.
     
      By default, all associations use [AUTO] mode.
       *)

  compliance_severity: association_compliance_severity option;
  (** 
    The severity level that is assigned to the association.
     *)

  max_concurrency: string option;
  (** 
    The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.
    
     If a new managed node starts and attempts to run an association while Systems Manager is running [MaxConcurrency] associations, the association is allowed to run. During the next association interval, the new managed node will process its association within the limit specified for [MaxConcurrency].
      *)

  max_errors: string option;
  (** 
    The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 managed nodes and set [MaxError] to 10%, then the system stops sending the request when the sixth error is received.
    
     Executions that are already running an association when [MaxErrors] is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set [MaxConcurrency] to 1 so that executions proceed one at a time.
      *)

  association_name: string option;
  (** 
    The association name.
     *)

  last_successful_execution_date: float option;
  (** 
    The last date on which the association was successfully run.
     *)

  last_execution_date: float option;
  (** 
    The date on which the association was last run.
     *)

  output_location: instance_association_output_location option;
  (** 
    An S3 bucket where you want to store the output details of the request.
     *)

  schedule_expression: string option;
  (** 
    A cron expression that specifies a schedule when the association runs.
     *)

  targets: target list option;
  (** 
    The managed nodes targeted by the request.
     *)

  association_id: string option;
  (** 
    The association ID.
     *)

  parameters: (string * string list) list option;
  (** 
    A description of the parameters for a document.
     *)

  automation_target_parameter_name: string option;
  (** 
    Choose the parameter that will define how your automation will branch out. This target is required for associations that use an Automation runbook and target resources by using rate controls. Automation is a capability of Amazon Web Services Systems Manager.
     *)

  document_version: string option;
  (** 
    The document version.
     *)

  overview: association_overview option;
  (** 
    Information about the association.
     *)

  status: association_status option;
  (** 
    The association status.
     *)

  last_update_association_date: float option;
  (** 
    The date when the association was last updated.
     *)

  date: float option;
  (** 
    The date when the association was made.
     *)

  association_version: string option;
  (** 
    The association version.
     *)

  instance_id: string option;
  (** 
    The managed node ID.
     *)

  name: string option;
  (** 
    The name of the SSM document.
     *)

}

type update_association_status_result = {
  association_description: association_description option;
  (** 
    Information about the association.
     *)

}

type update_association_status_request = {
  association_status: association_status;
  (** 
    The association status.
     *)

  instance_id: string;
  (** 
    The managed node ID.
     *)

  name: string;
  (** 
    The name of the SSM document.
     *)

}

(** 
    The updated status is the same as the current status.
     *)
type status_unchanged = unit

(** 
    The specified association doesn't exist.
     *)
type association_does_not_exist = {
  message: string option;
  
}

type update_association_result = {
  association_description: association_description option;
  (** 
    The description of the association that was updated.
     *)

}

type update_association_request = {
  alarm_configuration: alarm_configuration option;
  
  target_maps: (string * string list) list list option;
  (** 
    A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.
     *)

  duration: int option;
  (** 
    The number of hours the association can run before it is canceled. Duration applies to associations that are currently running, and any pending and in progress commands on all targets. If a target was taken offline for the association to run, it is made available again immediately, without a reboot.
    
     The [Duration] parameter applies only when both these conditions are true:
     
      {ul
           {- The association for which you specify a duration is cancelable according to the parameters of the SSM command document or Automation runbook associated with this execution.
              
              }
            {- The command specifies the 
               {[
               {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_UpdateAssociation.html#systemsmanager-UpdateAssociation-request-ApplyOnlyAtCronInterval}ApplyOnlyAtCronInterval}
               ]}
                parameter, which means that the association doesn't run immediately after it is updated, but only according to the specified schedule.
               
               }
           
      }
       *)

  schedule_offset: int option;
  [@ocaml.doc {| 
    Number of days to wait after the scheduled day to run an association. For example, if you specified a cron schedule of [cron(0 0 ? * THU#2 *)], you could specify an offset of 3 to run the association each Sunday after the second Thursday of the month. For more information about cron schedules for associations, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/reference-cron-and-rate-expressions.html}Reference: Cron and rate expressions for Systems Manager} in the {i Amazon Web Services Systems Manager User Guide}.
    
     To use offsets, you must specify the [ApplyOnlyAtCronInterval] parameter. This option tells the system not to run an association immediately after you create it.
     
      |}]

  target_locations: target_location list option;
  (** 
    A location is a combination of Amazon Web Services Regions and Amazon Web Services accounts where you want to run the association. Use this action to update an association in multiple Regions and multiple accounts.
     *)

  calendar_names: string list option;
  (** 
    The names or Amazon Resource Names (ARNs) of the Change Calendar type documents you want to gate your associations under. The associations only run when that change calendar is open. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar}Amazon Web Services Systems Manager Change Calendar}.
     *)

  apply_only_at_cron_interval: bool option;
  (** 
    By default, when you update an association, the system runs it immediately after it is updated and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you update it. This parameter isn't supported for rate expressions.
    
     If you chose this option when you created an association and later you edit that association or you make changes to the SSM document on which that association is based (by using the Documents page in the console), State Manager applies the association at the next specified cron interval. For example, if you chose the [Latest] version of an SSM document when you created an association and you edit the association by choosing a different document version on the Documents page, State Manager applies the association at the next specified cron interval if you previously selected this option. If this option wasn't selected, State Manager immediately runs the association.
     
      You can reset this option. To do so, specify the [no-apply-only-at-cron-interval] parameter when you update the association from the command line. This parameter forces the association to run immediately after updating it and according to the interval specified.
       *)

  sync_compliance: association_sync_compliance option;
  (** 
    The mode for generating association compliance. You can specify [AUTO] or [MANUAL]. In [AUTO] mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is [COMPLIANT]. If the association execution doesn't run successfully, the association is [NON-COMPLIANT].
    
     In [MANUAL] mode, you must specify the [AssociationId] as a parameter for the [PutComplianceItems] API operation. In this case, compliance data isn't managed by State Manager, a capability of Amazon Web Services Systems Manager. It is managed by your direct call to the [PutComplianceItems] API operation.
     
      By default, all associations use [AUTO] mode.
       *)

  compliance_severity: association_compliance_severity option;
  (** 
    The severity level to assign to the association.
     *)

  max_concurrency: string option;
  (** 
    The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.
    
     If a new managed node starts and attempts to run an association while Systems Manager is running [MaxConcurrency] associations, the association is allowed to run. During the next association interval, the new managed node will process its association within the limit specified for [MaxConcurrency].
      *)

  max_errors: string option;
  (** 
    The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 managed nodes and set [MaxError] to 10%, then the system stops sending the request when the sixth error is received.
    
     Executions that are already running an association when [MaxErrors] is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set [MaxConcurrency] to 1 so that executions proceed one at a time.
      *)

  automation_target_parameter_name: string option;
  (** 
    Choose the parameter that will define how your automation will branch out. This target is required for associations that use an Automation runbook and target resources by using rate controls. Automation is a capability of Amazon Web Services Systems Manager.
     *)

  association_version: string option;
  (** 
    This parameter is provided for concurrency control purposes. You must specify the latest association version in the service. If you want to ensure that this request succeeds, either specify [$LATEST], or omit this parameter.
     *)

  association_name: string option;
  (** 
    The name of the association that you want to update.
     *)

  targets: target list option;
  (** 
    The targets of the association.
     *)

  name: string option;
  (** 
    The name of the SSM Command document or Automation runbook that contains the configuration information for the managed node.
    
     You can specify Amazon Web Services-predefined documents, documents you created, or a document that is shared with you from another account.
     
      For Systems Manager document (SSM document) that are shared with you from other Amazon Web Services accounts, you must specify the complete SSM document ARN, in the following format:
      
       
       {[
       arn:aws:ssm:{i region}:{i account-id}:document/{i document-name}
       ]}
       
       
        For example:
        
         [arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document]
         
          For Amazon Web Services-predefined documents and SSM documents you created in your account, you only need to specify the document name. For example, [AWS-ApplyPatchBaseline] or [My-Document].
           *)

  output_location: instance_association_output_location option;
  (** 
    An S3 bucket where you want to store the results of this request.
     *)

  schedule_expression: string option;
  (** 
    The cron expression used to schedule the association that you want to update.
     *)

  document_version: string option;
  (** 
    The document version you want update for the association.
    
     State Manager doesn't support running associations that use a new version of a document if that document is shared from another account. State Manager always runs the [default] version of a document if shared from another account, even though the Systems Manager console shows that a new version was processed. If you want to run an association using a new version of a document shared form another account, you must set the document version to [default].
     
      *)

  parameters: (string * string list) list option;
  (** 
    The parameters you want to update for the association. If you create a parameter using Parameter Store, a capability of Amazon Web Services Systems Manager, you can reference the parameter using [{{ssm:parameter-name}}].
     *)

  association_id: string;
  (** 
    The ID of the association you want to update.
     *)

}

(** 
    The update isn't valid.
     *)
type invalid_update = {
  message: string option;
  
}

(** 
    TargetMap parameter isn't valid.
     *)
type invalid_target_maps = {
  message: string option;
  
}

(** 
    The target isn't valid or doesn't exist. It might not be configured for Systems Manager or you might not have permission to perform the operation.
     *)
type invalid_target = {
  message: string option;
  
}

(** 
    The schedule is invalid. Verify your cron or rate expression and try again.
     *)
type invalid_schedule = {
  message: string option;
  
}

(** 
    You must specify values for all required parameters in the Amazon Web Services Systems Manager document (SSM document). You can only supply values to parameters defined in the SSM document.
     *)
type invalid_parameters = {
  message: string option;
  
}

(** 
    The output location isn't valid or doesn't exist.
     *)
type invalid_output_location = unit

(** 
    The version you specified isn't valid. Use ListAssociationVersions to view all versions of an association according to the association ID. Or, use the [$LATEST] parameter to view the latest version of the association.
     *)
type invalid_association_version = {
  message: string option;
  
}

(** 
    You have reached the maximum number versions allowed for an association. Each association has a limit of 1,000 versions.
     *)
type association_version_limit_exceeded = {
  message: string option;
  
}

(** 
    The document doesn't support the platform type of the given managed node IDs. For example, you sent an document for a Windows managed node to a Linux node.
     *)
type unsupported_platform_type = {
  message: string option;
  
}

(** 
    The parameter type isn't supported.
     *)
type unsupported_parameter_type = {
  message: string option;
  
}

(** 
    The operating systems you specified isn't supported, or the operation isn't supported for the operating system.
     *)
type unsupported_operating_system = {
  message: string option;
  
}

(** 
    Inventory item type schema version has to match supported versions in the service. Check output of GetInventorySchema to see the available schema version for each type.
     *)
type unsupported_inventory_schema_version_exception = {
  message: string option;
  
}

(** 
    The [Context] attribute that you specified for the [InventoryItem] isn't allowed for this inventory type. You can only use the [Context] attribute with inventory types like [AWS:ComplianceItem].
     *)
type unsupported_inventory_item_context_exception = {
  message: string option;
  
  type_name: string option;
  
}

(** 
    Patching for applications released by Microsoft is only available on EC2 instances and advanced instances. To patch applications released by Microsoft on on-premises servers and VMs, you must enable advanced instances. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances-advanced.html}Turning on the advanced-instances tier} in the {i Amazon Web Services Systems Manager User Guide}.
     *)
type unsupported_feature_required_exception = {
  message: string option;
  
}

(** 
    The calendar entry contained in the specified SSM document isn't supported.
     *)
type unsupported_calendar_exception = {
  message: string option;
  
}

type unlabel_parameter_version_result = {
  invalid_labels: string list option;
  (** 
    The labels that aren't attached to the given parameter version.
     *)

  removed_labels: string list option;
  (** 
    A list of all labels deleted from the parameter.
     *)

}

type unlabel_parameter_version_request = {
  labels: string list;
  (** 
    One or more labels to delete from the specified parameter version.
     *)

  parameter_version: int;
  (** 
    The specific version of the parameter which you want to delete one or more labels from. If it isn't present, the call will fail.
     *)

  name: string;
  (** 
    The name of the parameter from which you want to delete one or more labels.
    
     You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.
     
      *)

}

(** 
    The specified parameter version wasn't found. Verify the parameter name and version, and try again.
     *)
type parameter_version_not_found = {
  message: string option;
  
}

(** 
    The parameter couldn't be found. Verify the name and try again.
     *)
type parameter_not_found = {
  message: string option;
  
}

(** 
    The size of inventory data has exceeded the total size limit for the resource.
     *)
type total_size_limit_exceeded_exception = {
  message: string option;
  
}

(** 
    The [Targets] parameter includes too many tags. Remove one or more tags and try the command again.
     *)
type too_many_tags_error = unit

type terminate_session_response = {
  session_id: string option;
  (** 
    The ID of the session that has been terminated.
     *)

}

type terminate_session_request = {
  session_id: string;
  (** 
    The ID of the session to terminate.
     *)

}

(** 
    The specified target managed node for the session isn't fully configured for use with Session Manager. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-getting-started.html}Getting started with Session Manager} in the {i Amazon Web Services Systems Manager User Guide}. This error is also returned if you attempt to start a session on a managed node that is located in a different account or Region
     *)
type target_not_connected = {
  message: string option;
  
}

(** 
    You specified the [Safe] option for the DeregisterTargetFromMaintenanceWindow operation, but the target is still referenced in a task.
     *)
type target_in_use_exception = {
  message: string option;
  
}

(** 
    The sub-type count exceeded the limit for the inventory type.
     *)
type sub_type_count_limit_exceeded_exception = {
  message: string option;
  
}

type stop_type = | CANCEL
  | COMPLETE

type stop_automation_execution_result = unit

type stop_automation_execution_request = {
  type_: stop_type option;
  (** 
    The stop request type. Valid types include the following: Cancel and Complete. The default type is Cancel.
     *)

  automation_execution_id: string;
  (** 
    The execution ID of the Automation to stop.
     *)

}

(** 
    The specified update status operation isn't valid.
     *)
type invalid_automation_status_update_exception = {
  message: string option;
  
}

(** 
    There is no automation execution information for the requested automation execution ID.
     *)
type automation_execution_not_found_exception = {
  message: string option;
  
}

type automation_execution_status = | EXITED
  | COMPLETED_WITH_FAILURE
  | COMPLETED_WITH_SUCCESS
  | CHANGE_CALENDAR_OVERRIDE_REJECTED
  | CHANGE_CALENDAR_OVERRIDE_APPROVED
  | PENDING_CHANGE_CALENDAR_OVERRIDE
  | RUNBOOK_INPROGRESS
  | SCHEDULED
  | REJECTED
  | APPROVED
  | PENDING_APPROVAL
  | FAILED
  | CANCELLED
  | CANCELLING
  | TIMEDOUT
  | SUCCESS
  | WAITING
  | INPROGRESS
  | PENDING

(** 
    Information about an Automation failure.
     *)
type failure_details = {
  details: (string * string list) list option;
  (** 
    Detailed information about the Automation step failure.
     *)

  failure_type: string option;
  (** 
    The type of Automation failure. Failure types include the following: Action, Permission, Throttling, Verification, Internal.
     *)

  failure_stage: string option;
  (** 
    The stage of the Automation execution when the failure occurred. The stages include the following: InputValidation, PreVerification, Invocation, PostVerification.
     *)

}

(** 
    A detailed status of the parent step.
     *)
type parent_step_details = {
  iterator_value: string option;
  (** 
    The current value of the specified iterator in the loop.
     *)

  iteration: int option;
  (** 
    The current repetition of the loop represented by an integer.
     *)

  action: string option;
  (** 
    The name of the automation action.
     *)

  step_name: string option;
  (** 
    The name of the step.
     *)

  step_execution_id: string option;
  (** 
    The unique ID of a step execution.
     *)

}

(** 
    Detailed information about an the execution state of an Automation step.
     *)
type step_execution = {
  parent_step_details: parent_step_details option;
  (** 
    Information about the parent step.
     *)

  triggered_alarms: alarm_state_information list option;
  (** 
    The CloudWatch alarms that were invoked by the automation.
     *)

  target_location: target_location option;
  (** 
    The combination of Amazon Web Services Regions and Amazon Web Services accounts targeted by the current Automation execution.
     *)

  targets: target list option;
  (** 
    The targets for the step execution.
     *)

  valid_next_steps: string list option;
  (** 
    Strategies used when step fails, we support Continue and Abort. Abort will fail the automation when the step fails. Continue will ignore the failure of current step and allow automation to run the next step. With conditional branching, we add step:stepName to support the automation to go to another specific step.
     *)

  is_critical: bool option;
  (** 
    The flag which can be used to help decide whether the failure of current step leads to the Automation failure.
     *)

  next_step: string option;
  (** 
    The next step after the step succeeds.
     *)

  is_end: bool option;
  (** 
    The flag which can be used to end automation no matter whether the step succeeds or fails.
     *)

  overridden_parameters: (string * string list) list option;
  (** 
    A user-specified list of parameters to override when running a step.
     *)

  step_execution_id: string option;
  (** 
    The unique ID of a step execution.
     *)

  failure_details: failure_details option;
  (** 
    Information about the Automation failure.
     *)

  failure_message: string option;
  (** 
    If a step failed, this message explains why the execution failed.
     *)

  response: string option;
  (** 
    A message associated with the response code for an execution.
     *)

  outputs: (string * string list) list option;
  (** 
    Returned values from the execution of the step.
     *)

  inputs: (string * string) list option;
  (** 
    Fully-resolved values passed into the step before execution.
     *)

  response_code: string option;
  (** 
    The response code returned by the execution of the step.
     *)

  step_status: automation_execution_status option;
  (** 
    The execution status for this step.
     *)

  execution_end_time: float option;
  (** 
    If a step has finished execution, this contains the time the execution ended. If the step hasn't yet concluded, this field isn't populated.
     *)

  execution_start_time: float option;
  (** 
    If a step has begun execution, this contains the time the step started. If the step is in Pending status, this field isn't populated.
     *)

  max_attempts: int option;
  (** 
    The maximum number of tries to run the action of the step. The default value is [1].
     *)

  on_failure: string option;
  (** 
    The action to take if the step fails. The default value is [Abort].
     *)

  timeout_seconds: int option;
  (** 
    The timeout seconds of the step.
     *)

  action: string option;
  (** 
    The action this step performs. The action determines the behavior of the step.
     *)

  step_name: string option;
  (** 
    The name of this execution step.
     *)

}

type step_execution_filter_key = | PARENT_STEP_ITERATOR_VALUE
  | PARENT_STEP_ITERATION
  | PARENT_STEP_EXECUTION_ID
  | ACTION
  | STEP_NAME
  | STEP_EXECUTION_ID
  | STEP_EXECUTION_STATUS
  | START_TIME_AFTER
  | START_TIME_BEFORE

(** 
    A filter to limit the amount of step execution information returned by the call.
     *)
type step_execution_filter = {
  values: string list;
  (** 
    The values of the filter key.
     *)

  key: step_execution_filter_key;
  (** 
    One or more keys to limit the results.
     *)

}

type start_session_response = {
  stream_url: string option;
  (** 
    A URL back to SSM Agent on the managed node that the Session Manager client uses to send commands and receive output from the node. Format: 
    {[
    wss://ssmmessages.{b region}.amazonaws.com/v1/data-channel/{b session-id}?stream=(input|output)
    ]}
    
    
     {b region} represents the Region identifier for an Amazon Web Services Region supported by Amazon Web Services Systems Manager, such as [us-east-2] for the US East (Ohio) Region. For a list of supported {b region} values, see the {b Region} column in {{:https://docs.aws.amazon.com/general/latest/gr/ssm.html#ssm_region}Systems Manager service endpoints} in the {i Amazon Web Services General Reference}.
     
      {b session-id} represents the ID of a Session Manager session, such as [1a2b3c4dEXAMPLE].
       *)

  token_value: string option;
  (** 
    An encrypted token value containing session and caller information. This token is used to authenticate the connection to the managed node, and is valid only long enough to ensure the connection is successful. Never share your session's token.
     *)

  session_id: string option;
  (** 
    The ID of the session.
     *)

}

type start_session_request = {
  parameters: (string * string list) list option;
  (** 
    The values you want to specify for the parameters defined in the Session document.
     *)

  reason: string option;
  (** 
    The reason for connecting to the instance. This value is included in the details for the Amazon CloudWatch Events event created when you start the session.
     *)

  document_name: string option;
  (** 
    The name of the SSM document you want to use to define the type of session, input parameters, or preferences for the session. For example, [SSM-SessionManagerRunShell]. You can call the [GetDocument] API to verify the document exists before attempting to start a session. If no document name is provided, a shell to the managed node is launched by default. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-sessions-start.html}Start a session} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  target: string;
  (** 
    The managed node to connect to for the session.
     *)

}

type start_change_request_execution_result = {
  automation_execution_id: string option;
  (** 
    The unique ID of a runbook workflow operation. (A runbook workflow is a type of Automation operation.)
     *)

}

(** 
    Information about an Automation runbook used in a runbook workflow in Change Manager.
    
     The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.
     
      *)
type runbook = {
  target_locations: target_location list option;
  (** 
    Information about the Amazon Web Services Regions and Amazon Web Services accounts targeted by the current Runbook operation.
     *)

  max_errors: string option;
  (** 
    The [MaxErrors] value specified by the user when the execution started, indicating the maximum number of errors that can occur during the operation before the updates are stopped or rolled back.
     *)

  max_concurrency: string option;
  (** 
    The [MaxConcurrency] value specified by the user when the operation started, indicating the maximum number of resources that the runbook operation can run on at the same time.
     *)

  target_maps: (string * string list) list list option;
  (** 
    A key-value mapping of runbook parameters to target resources. Both Targets and TargetMaps can't be specified together.
     *)

  targets: target list option;
  (** 
    A key-value mapping to target resources that the runbook operation performs tasks on. Required if you specify [TargetParameterName].
     *)

  target_parameter_name: string option;
  (** 
    The name of the parameter used as the target resource for the rate-controlled runbook workflow. Required if you specify [Targets].
     *)

  parameters: (string * string list) list option;
  (** 
    The key-value map of execution parameters, which were supplied when calling [StartChangeRequestExecution].
     *)

  document_version: string option;
  (** 
    The version of the Automation runbook used in a runbook workflow.
     *)

  document_name: string;
  (** 
    The name of the Automation runbook used in a runbook workflow.
     *)

}

type start_change_request_execution_request = {
  change_details: string option;
  (** 
    User-provided details about the change. If no details are provided, content specified in the {b Template information} section of the associated change template is added.
     *)

  scheduled_end_time: float option;
  (** 
    The time that the requester expects the runbook workflow related to the change request to complete. The time is an estimate only that the requester provides for reviewers.
     *)

  tags: tag list option;
  (** 
    Optional metadata that you assign to a resource. You can specify a maximum of five tags for a change request. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a change request to identify an environment or target Amazon Web Services Region. In this case, you could specify the following key-value pairs:
    
     {ul
          {- [Key=Environment,Value=Production]
             
             }
           {- [Key=Region,Value=us-east-2]
              
              }
          
      }
       *)

  runbooks: runbook list;
  (** 
    Information about the Automation runbooks that are run during the runbook workflow.
    
     The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.
     
      *)

  auto_approve: bool option;
  (** 
    Indicates whether the change request can be approved automatically without the need for manual approvals.
    
     If [AutoApprovable] is enabled in a change template, then setting [AutoApprove] to [true] in [StartChangeRequestExecution] creates a change request that bypasses approver review.
     
      Change Calendar restrictions are not bypassed in this scenario. If the state of an associated calendar is [CLOSED], change freeze approvers must still grant permission for this change request to run. If they don't, the change won't be processed until the calendar state is again [OPEN].
      
       *)

  client_token: string option;
  (** 
    The user-provided idempotency token. The token must be unique, is case insensitive, enforces the UUID format, and can't be reused.
     *)

  change_request_name: string option;
  (** 
    The name of the change request associated with the runbook workflow to be run.
     *)

  parameters: (string * string list) list option;
  (** 
    A key-value map of parameters that match the declared parameters in the change template document.
     *)

  document_version: string option;
  (** 
    The version of the change template document to run during the runbook workflow.
     *)

  document_name: string;
  (** 
    The name of the change template document to run during the runbook workflow.
     *)

  scheduled_time: float option;
  (** 
    The date and time specified in the change request to run the Automation runbooks.
    
     The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.
     
      *)

}

(** 
    The supplied parameters for invoking the specified Automation runbook are incorrect. For example, they may not match the set of parameters permitted for the specified Automation document.
     *)
type invalid_automation_execution_parameters_exception = {
  message: string option;
  
}

(** 
    Error returned when an idempotent operation is retried and the parameters don't match the original call to the API with the same idempotency token.
     *)
type idempotent_parameter_mismatch = {
  message: string option;
  
}

(** 
    The number of simultaneously running Automation executions exceeded the allowable limit.
     *)
type automation_execution_limit_exceeded_exception = {
  message: string option;
  
}

(** 
    An Automation runbook with the specified name and version couldn't be found.
     *)
type automation_definition_version_not_found_exception = {
  message: string option;
  
}

(** 
    An Automation runbook with the specified name couldn't be found.
     *)
type automation_definition_not_found_exception = {
  message: string option;
  
}

(** 
    Indicates that the Change Manager change template used in the change request was rejected or is still in a pending state.
     *)
type automation_definition_not_approved_exception = {
  message: string option;
  
}

type start_automation_execution_result = {
  automation_execution_id: string option;
  (** 
    The unique ID of a newly scheduled automation execution.
     *)

}

type execution_mode = | Interactive
  | Auto

type start_automation_execution_request = {
  alarm_configuration: alarm_configuration option;
  (** 
    The CloudWatch alarm you want to apply to your automation.
     *)

  tags: tag list option;
  (** 
    Optional metadata that you assign to a resource. You can specify a maximum of five tags for an automation. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an automation to identify an environment or operating system. In this case, you could specify the following key-value pairs:
    
     {ul
          {- [Key=environment,Value=test]
             
             }
           {- [Key=OS,Value=Windows]
              
              }
          
      }
       To add tags to an existing automation, use the [AddTagsToResource] operation.
       
        *)

  target_locations: target_location list option;
  (** 
    A location is a combination of Amazon Web Services Regions and/or Amazon Web Services accounts where you want to run the automation. Use this operation to start an automation in multiple Amazon Web Services Regions and multiple Amazon Web Services accounts. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html}Running Automation workflows in multiple Amazon Web Services Regions and Amazon Web Services accounts} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  max_errors: string option;
  (** 
    The number of errors that are allowed before the system stops running the automation on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops running the automation when the fourth error is received. If you specify 0, then the system stops running the automation on additional targets after the first error result is returned. If you run an automation on 50 resources and set max-errors to 10%, then the system stops running the automation on additional targets when the sixth error is received.
    
     Executions that are already running an automation when max-errors is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set max-concurrency to 1 so the executions proceed one at a time.
      *)

  max_concurrency: string option;
  (** 
    The maximum number of targets allowed to run this task in parallel. You can specify a number, such as 10, or a percentage, such as 10%. The default value is [10].
     *)

  target_maps: (string * string list) list list option;
  (** 
    A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.
     *)

  targets: target list option;
  (** 
    A key-value mapping to target resources. Required if you specify TargetParameterName.
     *)

  target_parameter_name: string option;
  (** 
    The name of the parameter used as the target resource for the rate-controlled execution. Required if you specify targets.
     *)

  mode: execution_mode option;
  (** 
    The execution mode of the automation. Valid modes include the following: Auto and Interactive. The default mode is Auto.
     *)

  client_token: string option;
  (** 
    User-provided idempotency token. The token must be unique, is case insensitive, enforces the UUID format, and can't be reused.
     *)

  parameters: (string * string list) list option;
  (** 
    A key-value map of execution parameters, which match the declared parameters in the Automation runbook.
     *)

  document_version: string option;
  (** 
    The version of the Automation runbook to use for this execution.
     *)

  document_name: string;
  (** 
    The name of the SSM document to run. This can be a public document or a custom document. To run a shared document belonging to another account, specify the document ARN. For more information about how to use shared documents, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-ssm-sharing.html}Sharing SSM documents} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

}

type start_associations_once_result = unit

type start_associations_once_request = {
  association_ids: string list;
  (** 
    The association IDs that you want to run immediately and only one time.
     *)

}

(** 
    The association isn't valid or doesn't exist.
     *)
type invalid_association = {
  message: string option;
  
}

type source_type = | AWS_SSM_MANAGEDINSTANCE
  | AWS_IOT_THING
  | AWS_EC2_INSTANCE

type signal_type = | RESUME
  | STOP_STEP
  | START_STEP
  | REJECT
  | APPROVE

(** 
    The number of managed nodes found for each patch severity level defined in the request filter.
     *)
type severity_summary = {
  unspecified_count: int option;
  (** 
    The total number of resources or compliance items that have a severity level of unspecified. Unspecified severity is determined by the organization that published the compliance items.
     *)

  informational_count: int option;
  (** 
    The total number of resources or compliance items that have a severity level of informational. Informational severity is determined by the organization that published the compliance items.
     *)

  low_count: int option;
  (** 
    The total number of resources or compliance items that have a severity level of low. Low severity is determined by the organization that published the compliance items.
     *)

  medium_count: int option;
  (** 
    The total number of resources or compliance items that have a severity level of medium. Medium severity is determined by the organization that published the compliance items.
     *)

  high_count: int option;
  (** 
    The total number of resources or compliance items that have a severity level of high. High severity is determined by the organization that published the compliance items.
     *)

  critical_count: int option;
  (** 
    The total number of resources or compliance items that have a severity level of [Critical]. Critical severity is determined by the organization that published the compliance items.
     *)

}

type session_status = | FAILED
  | TERMINATING
  | TERMINATED
  | DISCONNECTED
  | CONNECTING
  | CONNECTED

type session_state = | HISTORY
  | ACTIVE

(** 
    Reserved for future use.
     *)
type session_manager_output_url = {
  cloud_watch_output_url: string option;
  (** 
    Reserved for future use.
     *)

  s3_output_url: string option;
  (** 
    Reserved for future use.
     *)

}

(** 
    Information about a Session Manager connection to a managed node.
     *)
type session = {
  max_session_duration: string option;
  (** 
    The maximum duration of a session before it terminates.
     *)

  output_url: session_manager_output_url option;
  (** 
    Reserved for future use.
     *)

  details: string option;
  (** 
    Reserved for future use.
     *)

  reason: string option;
  (** 
    The reason for connecting to the instance.
     *)

  owner: string option;
  (** 
    The ID of the Amazon Web Services user that started the session.
     *)

  document_name: string option;
  (** 
    The name of the Session Manager SSM document used to define the parameters and plugin settings for the session. For example, [SSM-SessionManagerRunShell].
     *)

  end_date: float option;
  (** 
    The date and time, in ISO-8601 Extended format, when the session was terminated.
     *)

  start_date: float option;
  (** 
    The date and time, in ISO-8601 Extended format, when the session began.
     *)

  status: session_status option;
  [@ocaml.doc {| 
    The status of the session. For example, "Connected" or "Terminated".
     |}]

  target: string option;
  (** 
    The managed node that the Session Manager session connected to.
     *)

  session_id: string option;
  (** 
    The ID of the session.
     *)

}

type session_filter_key = | SESSION_ID
  | STATUS
  | OWNER
  | TARGET_ID
  | INVOKED_BEFORE
  | INVOKED_AFTER

(** 
    Describes a filter for Session Manager information.
     *)
type session_filter = {
  value: string;
  (** 
    The filter value. Valid values for each filter key are as follows:
    
     {ul
          {- InvokedAfter: Specify a timestamp to limit your results. For example, specify 2018-08-29T00:00:00Z to see sessions that started August 29, 2018, and later.
             
             }
           {- InvokedBefore: Specify a timestamp to limit your results. For example, specify 2018-08-29T00:00:00Z to see sessions that started before August 29, 2018.
              
              }
           {- Target: Specify a managed node to which session connections have been made.
              
              }
           {- Owner: Specify an Amazon Web Services user to see a list of sessions started by that user.
              
              }
           {- Status: Specify a valid session status to see a list of all sessions with that status. Status values you can specify include:
              
               {ul
                    {- Connected
                       
                       }
                     {- Connecting
                        
                        }
                     {- Disconnected
                        
                        }
                     {- Terminated
                        
                        }
                     {- Terminating
                        
                        }
                     {- Failed
                        
                        }
                    
            }
            }
           {- SessionId: Specify a session ID to return details about the session.
              
              }
          
      }
       *)

  key: session_filter_key;
  (** 
    The name of the filter.
     *)

}

[@@ocaml.doc {| 
    The service setting data structure.
    
     [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.
     
      Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [UpdateServiceSetting] API operation to change the default setting. Or, use the [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web Services service team.
       |}]
type service_setting = {
  status: string option;
  (** 
    The status of the service setting. The value can be Default, Customized or PendingUpdate.
    
     {ul
          {- Default: The current setting uses a default value provisioned by the Amazon Web Services service team.
             
             }
           {- Customized: The current setting use a custom value specified by the customer.
              
              }
           {- PendingUpdate: The current setting uses a default or custom value, but a setting change request is pending approval.
              
              }
          
      }
       *)

  ar_n: string option;
  (** 
    The ARN of the service setting.
     *)

  last_modified_user: string option;
  (** 
    The ARN of the last modified user. This field is populated only if the setting value was overwritten.
     *)

  last_modified_date: float option;
  (** 
    The last time the service setting was modified.
     *)

  setting_value: string option;
  (** 
    The value of the service setting.
     *)

  setting_id: string option;
  (** 
    The ID of the service setting.
     *)

}

type command_status = | CANCELLING
  | TIMED_OUT
  | FAILED
  | CANCELLED
  | SUCCESS
  | IN_PROGRESS
  | PENDING

(** 
    Describes a command request.
     *)
type command = {
  triggered_alarms: alarm_state_information list option;
  (** 
    The CloudWatch alarm that was invoked by the command.
     *)

  alarm_configuration: alarm_configuration option;
  (** 
    The details for the CloudWatch alarm applied to your command.
     *)

  timeout_seconds: int option;
  (** 
    The [TimeoutSeconds] value specified for a command.
     *)

  cloud_watch_output_config: cloud_watch_output_config option;
  (** 
    Amazon CloudWatch Logs information where you want Amazon Web Services Systems Manager to send the command output.
     *)

  notification_config: notification_config option;
  (** 
    Configurations for sending notifications about command status changes.
     *)

  service_role: string option;
  (** 
    The Identity and Access Management (IAM) service role that Run Command, a capability of Amazon Web Services Systems Manager, uses to act on your behalf when sending notifications about command status changes.
     *)

  delivery_timed_out_count: int option;
  (** 
    The number of targets for which the status is Delivery Timed Out.
     *)

  error_count: int option;
  (** 
    The number of targets for which the status is Failed or Execution Timed Out.
     *)

  completed_count: int option;
  (** 
    The number of targets for which the command invocation reached a terminal state. Terminal states include the following: Success, Failed, Execution Timed Out, Delivery Timed Out, Cancelled, Terminated, or Undeliverable.
     *)

  target_count: int option;
  (** 
    The number of targets for the command.
     *)

  max_errors: string option;
  (** 
    The maximum number of errors allowed before the system stops sending the command to additional targets. You can specify a number of errors, such as 10, or a percentage or errors, such as 10%. The default value is [0]. For more information about how to use [MaxErrors], see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html}Amazon Web Services Systems Manager Run Command} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  max_concurrency: string option;
  (** 
    The maximum number of managed nodes that are allowed to run the command at the same time. You can specify a number of managed nodes, such as 10, or a percentage of nodes, such as 10%. The default value is 50. For more information about how to use [MaxConcurrency], see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html}Amazon Web Services Systems Manager Run Command} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  output_s3_key_prefix: string option;
  (** 
    The S3 directory path inside the bucket where the responses to the command executions should be stored. This was requested when issuing the command.
     *)

  output_s3_bucket_name: string option;
  (** 
    The S3 bucket where the responses to the command executions should be stored. This was requested when issuing the command.
     *)

  output_s3_region: string option;
  (** 
    (Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems Manager automatically determines the Amazon Web Services Region of the S3 bucket.
     *)

  status_details: string option;
  (** 
    A detailed status of the command execution. [StatusDetails] includes more information than [Status] because it includes states resulting from error and concurrency control parameters. [StatusDetails] can show different results than Status. For more information about these statuses, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html}Understanding command statuses} in the {i Amazon Web Services Systems Manager User Guide}. StatusDetails can be one of the following values:
    
     {ul
          {- Pending: The command hasn't been sent to any managed nodes.
             
             }
           {- In Progress: The command has been sent to at least one managed node but hasn't reached a final state on all managed nodes.
              
              }
           {- Success: The command successfully ran on all invocations. This is a terminal state.
              
              }
           {- Delivery Timed Out: The value of MaxErrors or more command invocations shows a status of Delivery Timed Out. This is a terminal state.
              
              }
           {- Execution Timed Out: The value of MaxErrors or more command invocations shows a status of Execution Timed Out. This is a terminal state.
              
              }
           {- Failed: The value of MaxErrors or more command invocations shows a status of Failed. This is a terminal state.
              
              }
           {- Incomplete: The command was attempted on all managed nodes and one or more invocations doesn't have a value of Success but not enough invocations failed for the status to be Failed. This is a terminal state.
              
              }
           {- Cancelled: The command was terminated before it was completed. This is a terminal state.
              
              }
           {- Rate Exceeded: The number of managed nodes targeted by the command exceeded the account limit for pending invocations. The system has canceled the command before running it on any managed node. This is a terminal state.
              
              }
           {- Delayed: The system attempted to send the command to the managed node but wasn't successful. The system retries again.
              
              }
          
      }
       *)

  status: command_status option;
  (** 
    The status of the command.
     *)

  requested_date_time: float option;
  (** 
    The date and time the command was requested.
     *)

  targets: target list option;
  (** 
    An array of search criteria that targets managed nodes using a Key,Value combination that you specify. Targets is required if you don't provide one or more managed node IDs in the call.
     *)

  instance_ids: string list option;
  (** 
    The managed node IDs against which this command was requested.
     *)

  parameters: (string * string list) list option;
  (** 
    The parameter values to be inserted in the document when running the command.
     *)

  expires_after: float option;
  (** 
    If a command expires, it changes status to [DeliveryTimedOut] for all invocations that have the status [InProgress], [Pending], or [Delayed]. [ExpiresAfter] is calculated based on the total timeout for the overall command. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html?icmpid=docs_ec2_console#monitor-about-status-timeouts}Understanding command timeout values} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  comment: string option;
  (** 
    User-specified information about the command, such as a brief description of what the command should do.
     *)

  document_version: string option;
  (** 
    The Systems Manager document (SSM document) version.
     *)

  document_name: string option;
  (** 
    The name of the document requested for execution.
     *)

  command_id: string option;
  (** 
    A unique identifier for this command.
     *)

}

type send_command_result = {
  command: command option;
  (** 
    The request as it was received by Systems Manager. Also provides the command ID which can be used future references to this request.
     *)

}

type send_command_request = {
  alarm_configuration: alarm_configuration option;
  (** 
    The CloudWatch alarm you want to apply to your command.
     *)

  cloud_watch_output_config: cloud_watch_output_config option;
  (** 
    Enables Amazon Web Services Systems Manager to send Run Command output to Amazon CloudWatch Logs. Run Command is a capability of Amazon Web Services Systems Manager.
     *)

  notification_config: notification_config option;
  (** 
    Configurations for sending notifications.
     *)

  service_role_arn: string option;
  (** 
    The ARN of the Identity and Access Management (IAM) service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for Run Command commands.
    
     This role must provide the [sns:Publish] permission for your notification topic. For information about creating and using this service role, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html}Monitoring Systems Manager status changes using Amazon SNS notifications} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  max_errors: string option;
  (** 
    The maximum number of errors allowed without the command failing. When the command fails one more time beyond the value of [MaxErrors], the systems stops sending the command to additional targets. You can specify a number like 10 or a percentage like 10%. The default value is [0]. For more information about how to use [MaxErrors], see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-maxerrors}Using error controls} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  max_concurrency: string option;
  (** 
    (Optional) The maximum number of managed nodes that are allowed to run the command at the same time. You can specify a number such as 10 or a percentage such as 10%. The default value is [50]. For more information about how to use [MaxConcurrency], see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html#send-commands-velocity}Using concurrency controls} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  output_s3_key_prefix: string option;
  (** 
    The directory structure within the S3 bucket where the responses should be stored.
     *)

  output_s3_bucket_name: string option;
  (** 
    The name of the S3 bucket where command execution responses should be stored.
     *)

  output_s3_region: string option;
  (** 
    (Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Systems Manager automatically determines the Amazon Web Services Region of the S3 bucket.
     *)

  parameters: (string * string list) list option;
  (** 
    The required and optional parameters specified in the document being run.
     *)

  comment: string option;
  (** 
    User-specified information about the command, such as a brief description of what the command should do.
     *)

  timeout_seconds: int option;
  (** 
    If this time is reached and the command hasn't already started running, it won't run.
     *)

  document_hash_type: document_hash_type option;
  (** 
    Sha256 or Sha1.
    
     Sha1 hashes have been deprecated.
     
      *)

  document_hash: string option;
  (** 
    The Sha256 or Sha1 hash created by the system when the document was created.
    
     Sha1 hashes have been deprecated.
     
      *)

  document_version: string option;
  [@ocaml.doc {| 
    The SSM document version to use in the request. You can specify $DEFAULT, $LATEST, or a specific version number. If you run commands by using the Command Line Interface (Amazon Web Services CLI), then you must escape the first two options by using a backslash. If you specify a version number, then you don't need to use the backslash. For example:
    
     --document-version "\$DEFAULT"
     
      --document-version "\$LATEST"
      
       --document-version "3"
        |}]

  document_name: string;
  (** 
    The name of the Amazon Web Services Systems Manager document (SSM document) to run. This can be a public document or a custom document. To run a shared document belonging to another account, specify the document Amazon Resource Name (ARN). For more information about how to use shared documents, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-using-shared.html}Sharing SSM documents} in the {i Amazon Web Services Systems Manager User Guide}.
    
     If you specify a document name or ARN that hasn't been shared with your account, you receive an [InvalidDocument] error.
     
      *)

  targets: target list option;
  (** 
    An array of search criteria that targets managed nodes using a [Key,Value] combination that you specify. Specifying targets is most useful when you want to send a command to a large number of managed nodes at once. Using [Targets], which accepts tag key-value pairs to identify managed nodes, you can send a command to tens, hundreds, or thousands of nodes at once.
    
     To send a command to a smaller number of managed nodes, you can use the [InstanceIds] option instead.
     
      For more information about how to use targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html}Run commands at scale} in the {i Amazon Web Services Systems Manager User Guide}.
       *)

  instance_ids: string list option;
  (** 
    The IDs of the managed nodes where the command should run. Specifying managed node IDs is most useful when you are targeting a limited number of managed nodes, though you can specify up to 50 IDs.
    
     To target a larger number of managed nodes, or if you prefer not to list individual node IDs, we recommend using the [Targets] option instead. Using [Targets], which accepts tag key-value pairs to identify the managed nodes to send commands to, you can a send command to tens, hundreds, or thousands of nodes at once.
     
      For more information about how to use targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/send-commands-multiple.html}Run commands at scale} in the {i Amazon Web Services Systems Manager User Guide}.
       *)

}

(** 
    The role name can't contain invalid characters. Also verify that you specified an IAM role for notifications that includes the required trust policy. For information about configuring the IAM role for Run Command notifications, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitoring-sns-notifications.html}Monitoring Systems Manager status changes using Amazon SNS notifications} in the {i Amazon Web Services Systems Manager User Guide}.
     *)
type invalid_role = {
  message: string option;
  
}

(** 
    The S3 bucket doesn't exist.
     *)
type invalid_output_folder = unit

(** 
    One or more configuration items isn't valid. Verify that a valid Amazon Resource Name (ARN) was provided for an Amazon Simple Notification Service topic.
     *)
type invalid_notification_config = {
  message: string option;
  
}

(** 
    You can't specify a managed node ID in more than one association.
     *)
type duplicate_instance_id = unit

type send_automation_signal_result = unit

type send_automation_signal_request = {
  payload: (string * string list) list option;
  [@ocaml.doc {| 
    The data sent with the signal. The data schema depends on the type of signal used in the request.
    
     For [Approve] and [Reject] signal types, the payload is an optional comment that you can send with the signal type. For example:
     
      [Comment="Looks good"]
      
       For [StartStep] and [Resume] signal types, you must send the name of the Automation step to start or resume as the payload. For example:
       
        [StepName="step1"]
        
         For the [StopStep] signal type, you must send the step execution ID as the payload. For example:
         
          [StepExecutionId="97fff367-fc5a-4299-aed8-0123456789ab"]
           |}]

  signal_type: signal_type;
  (** 
    The type of signal to send to an Automation execution.
     *)

  automation_execution_id: string;
  (** 
    The unique identifier for an existing Automation execution that you want to send the signal to.
     *)

}

(** 
    The signal isn't valid for the current Automation execution.
     *)
type invalid_automation_signal_exception = {
  message: string option;
  
}

(** 
    The specified step name and execution ID don't exist. Verify the information and try again.
     *)
type automation_step_not_found_exception = {
  message: string option;
  
}

(** 
    Information about a scheduled execution for a maintenance window.
     *)
type scheduled_window_execution = {
  execution_time: string option;
  (** 
    The time, in ISO-8601 Extended format, that the maintenance window is scheduled to be run.
     *)

  name: string option;
  (** 
    The name of the maintenance window to be run.
     *)

  window_id: string option;
  (** 
    The ID of the maintenance window to be run.
     *)

}

(** 
    A URL for the Amazon Web Services Systems Manager (Systems Manager) bucket where you want to store the results of this request.
     *)
type s3_output_url = {
  output_url: string option;
  (** 
    A URL for an S3 bucket where you want to store the results of this request.
     *)

}

type resume_session_response = {
  stream_url: string option;
  (** 
    A URL back to SSM Agent on the managed node that the Session Manager client uses to send commands and receive output from the managed node. Format: 
    {[
    wss://ssmmessages.{b region}.amazonaws.com/v1/data-channel/{b session-id}?stream=(input|output)
    ]}
    .
    
     {b region} represents the Region identifier for an Amazon Web Services Region supported by Amazon Web Services Systems Manager, such as [us-east-2] for the US East (Ohio) Region. For a list of supported {b region} values, see the {b Region} column in {{:https://docs.aws.amazon.com/general/latest/gr/ssm.html#ssm_region}Systems Manager service endpoints} in the {i Amazon Web Services General Reference}.
     
      {b session-id} represents the ID of a Session Manager session, such as [1a2b3c4dEXAMPLE].
       *)

  token_value: string option;
  (** 
    An encrypted token value containing session and caller information. Used to authenticate the connection to the managed node.
     *)

  session_id: string option;
  (** 
    The ID of the session.
     *)

}

type resume_session_request = {
  session_id: string;
  (** 
    The ID of the disconnected session to resume.
     *)

}

(** 
    The inventory item result attribute.
     *)
type result_attribute = {
  type_name: string;
  (** 
    Name of the inventory item type. Valid value: [AWS:InstanceInformation]. Default Value: [AWS:InstanceInformation].
     *)

}

type resource_type_for_tagging = | ASSOCIATION
  | AUTOMATION
  | OPSMETADATA
  | OPS_ITEM
  | PATCH_BASELINE
  | PARAMETER
  | MAINTENANCE_WINDOW
  | MANAGED_INSTANCE
  | DOCUMENT

type resource_type = | EC2_INSTANCE
  | MANAGED_INSTANCE

(** 
    No policies with the specified policy ID and hash could be found.
     *)
type resource_policy_not_found_exception = {
  message: string option;
  
}

(** 
    The [PutResourcePolicy] API action enforces two limits. A policy can't be greater than 1024 bytes in size. And only one policy can be attached to [OpsItemGroup]. Verify these limits and try again.
     *)
type resource_policy_limit_exceeded_exception = {
  message: string option;
  
  limit_type: string option;
  
  limit: int option;
  
}

(** 
    One or more parameters specified for the call aren't valid. Verify the parameters and their values and try again.
     *)
type resource_policy_invalid_parameter_exception = {
  message: string option;
  
  parameter_names: string list option;
  
}

(** 
    The hash provided in the call doesn't match the stored hash. This exception is thrown when trying to update an obsolete policy version or when multiple requests to update a policy are sent.
     *)
type resource_policy_conflict_exception = {
  message: string option;
  
}

(** 
    The specified parameter to be shared could not be found.
     *)
type resource_not_found_exception = {
  message: string option;
  
}

(** 
    Error returned when the caller has exceeded the default resource quotas. For example, too many maintenance windows or patch baselines have been created.
    
     For information about resource quotas in Systems Manager, see {{:https://docs.aws.amazon.com/general/latest/gr/ssm.html#limits_ssm}Systems Manager service quotas} in the {i Amazon Web Services General Reference}.
      *)
type resource_limit_exceeded_exception = {
  message: string option;
  
}

(** 
    Error returned if an attempt is made to delete a patch baseline that is registered for a patch group.
     *)
type resource_in_use_exception = {
  message: string option;
  
}

(** 
    The data type name for including resource data sync state. There are four sync states:
    
     [OrganizationNotExists] (Your organization doesn't exist)
     
      [NoPermissions] (The system can't locate the service-linked role. This role is automatically created when a user creates a resource data sync in Amazon Web Services Systems Manager Explorer.)
      
       [InvalidOrganizationalUnit] (You specified or selected an invalid unit in the resource data sync configuration.)
       
        [TrustedAccessDisabled] (You disabled Systems Manager access in the organization in Organizations.)
         *)
type resource_data_sync_source_with_state = {
  enable_all_ops_data_sources: bool option;
  (** 
    When you create a resource data sync, if you choose one of the Organizations options, then Systems Manager automatically enables all OpsData sources in the selected Amazon Web Services Regions for all Amazon Web Services accounts in your organization (or in the selected organization units). For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html}Setting up Systems Manager Explorer to display data from multiple accounts and Regions} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  state: string option;
  (** 
    The data type name for including resource data sync state. There are four sync states:
    
     [OrganizationNotExists]: Your organization doesn't exist.
     
      [NoPermissions]: The system can't locate the service-linked role. This role is automatically created when a user creates a resource data sync in Explorer.
      
       [InvalidOrganizationalUnit]: You specified or selected an invalid unit in the resource data sync configuration.
       
        [TrustedAccessDisabled]: You disabled Systems Manager access in the organization in Organizations.
         *)

  include_future_regions: bool option;
  (** 
    Whether to automatically synchronize and aggregate data from new Amazon Web Services Regions when those Regions come online.
     *)

  source_regions: string list option;
  (** 
    The [SyncSource] Amazon Web Services Regions included in the resource data sync.
     *)

  aws_organizations_source: resource_data_sync_aws_organizations_source option;
  (** 
    The field name in [SyncSource] for the [ResourceDataSyncAwsOrganizationsSource] type.
     *)

  source_type: string option;
  (** 
    The type of data source for the resource data sync. [SourceType] is either [AwsOrganizations] (if an organization is present in Organizations) or [singleAccountMultiRegions].
     *)

}

type resource_data_sync_s3_format = | JSON_SERDE

(** 
    Synchronize Amazon Web Services Systems Manager Inventory data from multiple Amazon Web Services accounts defined in Organizations to a centralized Amazon S3 bucket. Data is synchronized to individual key prefixes in the central bucket. Each key prefix represents a different Amazon Web Services account ID.
     *)
type resource_data_sync_destination_data_sharing = {
  destination_data_sharing_type: string option;
  (** 
    The sharing data type. Only [Organization] is supported.
     *)

}

(** 
    Information about the target S3 bucket for the resource data sync.
     *)
type resource_data_sync_s3_destination = {
  destination_data_sharing: resource_data_sync_destination_data_sharing option;
  (** 
    Enables destination data sharing. By default, this field is [null].
     *)

  awskms_key_ar_n: string option;
  (** 
    The ARN of an encryption key for a destination in Amazon S3. Must belong to the same Region as the destination S3 bucket.
     *)

  region: string;
  (** 
    The Amazon Web Services Region with the S3 bucket targeted by the resource data sync.
     *)

  sync_format: resource_data_sync_s3_format;
  (** 
    A supported sync format. The following format is currently supported: JsonSerDe
     *)

  prefix: string option;
  (** 
    An Amazon S3 prefix for the bucket.
     *)

  bucket_name: string;
  (** 
    The name of the S3 bucket where the aggregated data is stored.
     *)

}

type last_resource_data_sync_status = | INPROGRESS
  | FAILED
  | SUCCESSFUL

(** 
    Information about a resource data sync configuration, including its current status and last successful sync.
     *)
type resource_data_sync_item = {
  last_sync_status_message: string option;
  (** 
    The status message details reported by the last sync.
     *)

  sync_created_time: float option;
  (** 
    The date and time the configuration was created (UTC).
     *)

  last_status: last_resource_data_sync_status option;
  (** 
    The status reported by the last sync.
     *)

  sync_last_modified_time: float option;
  (** 
    The date and time the resource data sync was changed.
     *)

  last_successful_sync_time: float option;
  (** 
    The last time the sync operations returned a status of [SUCCESSFUL] (UTC).
     *)

  last_sync_time: float option;
  (** 
    The last time the configuration attempted to sync (UTC).
     *)

  s3_destination: resource_data_sync_s3_destination option;
  (** 
    Configuration information for the target S3 bucket.
     *)

  sync_source: resource_data_sync_source_with_state option;
  (** 
    Information about the source where the data was synchronized.
     *)

  sync_type: string option;
  (** 
    The type of resource data sync. If [SyncType] is [SyncToDestination], then the resource data sync synchronizes data to an S3 bucket. If the [SyncType] is [SyncFromSource] then the resource data sync synchronizes data from Organizations or from multiple Amazon Web Services Regions.
     *)

  sync_name: string option;
  (** 
    The name of the resource data sync.
     *)

}

(** 
    You have exceeded the allowed maximum sync configurations.
     *)
type resource_data_sync_count_exceeded_exception = {
  message: string option;
  
}

(** 
    A sync configuration with the same name already exists.
     *)
type resource_data_sync_already_exists_exception = {
  sync_name: string option;
  
}

type compliance_status = | NonCompliant
  | Compliant

type compliance_severity = | Unspecified
  | Informational
  | Low
  | Medium
  | High
  | Critical

(** 
    A summary of the call execution that includes an execution ID, the type of execution (for example, [Command]), and the date/time of the execution using a datetime object that is saved in the following format: [yyyy-MM-dd'T'HH:mm:ss'Z']
     *)
type compliance_execution_summary = {
  execution_type: string option;
  (** 
    The type of execution. For example, [Command] is a valid execution type.
     *)

  execution_id: string option;
  (** 
    An ID created by the system when [PutComplianceItems] was called. For example, [CommandID] is a valid execution ID. You can use this ID in subsequent calls.
     *)

  execution_time: float;
  (** 
    The time the execution ran as a datetime object that is saved in the following format: [yyyy-MM-dd'T'HH:mm:ss'Z']
     *)

}

(** 
    A summary of resources that are compliant. The summary is organized according to the resource count for each compliance type.
     *)
type compliant_summary = {
  severity_summary: severity_summary option;
  (** 
    A summary of the compliance severity by compliance type.
     *)

  compliant_count: int option;
  (** 
    The total number of resources that are compliant.
     *)

}

(** 
    A summary of resources that aren't compliant. The summary is organized according to resource type.
     *)
type non_compliant_summary = {
  severity_summary: severity_summary option;
  (** 
    A summary of the non-compliance severity by compliance type
     *)

  non_compliant_count: int option;
  (** 
    The total number of compliance items that aren't compliant.
     *)

}

(** 
    Compliance summary information for a specific resource.
     *)
type resource_compliance_summary_item = {
  non_compliant_summary: non_compliant_summary option;
  (** 
    A list of items that aren't compliant for the resource.
     *)

  compliant_summary: compliant_summary option;
  (** 
    A list of items that are compliant for the resource.
     *)

  execution_summary: compliance_execution_summary option;
  (** 
    Information about the execution.
     *)

  overall_severity: compliance_severity option;
  (** 
    The highest severity item found for the resource. The resource is compliant for this item.
     *)

  status: compliance_status option;
  (** 
    The compliance status for the resource.
     *)

  resource_id: string option;
  (** 
    The resource ID.
     *)

  resource_type: string option;
  (** 
    The resource type.
     *)

  compliance_type: string option;
  (** 
    The compliance type.
     *)

}

(** 
    Information about targets that resolved during the Automation execution.
     *)
type resolved_targets = {
  truncated: bool option;
  (** 
    A boolean value indicating whether the resolved target list is truncated.
     *)

  parameter_values: string list option;
  (** 
    A list of parameter values sent to targets that resolved during the Automation execution.
     *)

}

(** 
    The result body of the ResetServiceSetting API operation.
     *)
type reset_service_setting_result = {
  service_setting: service_setting option;
  (** 
    The current, effective service setting after calling the ResetServiceSetting API operation.
     *)

}

(** 
    The request body of the ResetServiceSetting API operation.
     *)
type reset_service_setting_request = {
  setting_id: string;
  (** 
    The Amazon Resource Name (ARN) of the service setting to reset. The setting ID can be one of the following.
    
     {ul
          {- [/ssm/managed-instance/default-ec2-instance-management-role]
             
             }
           {- [/ssm/automation/customer-script-log-destination]
              
              }
           {- [/ssm/automation/customer-script-log-group-name]
              
              }
           {- [/ssm/documents/console/public-sharing-permission]
              
              }
           {- [/ssm/managed-instance/activation-tier]
              
              }
           {- [/ssm/opsinsights/opscenter]
              
              }
           {- [/ssm/parameter-store/default-parameter-tier]
              
              }
           {- [/ssm/parameter-store/high-throughput-enabled]
              
              }
          
      }
       *)

}

type remove_tags_from_resource_result = unit

type remove_tags_from_resource_request = {
  tag_keys: string list;
  (** 
    Tag keys that you want to remove from the specified resource.
     *)

  resource_id: string;
  (** 
    The ID of the resource from which you want to remove tags. For example:
    
     ManagedInstance: mi-012345abcde
     
      MaintenanceWindow: mw-012345abcde
      
       [Automation]: [example-c160-4567-8519-012345abcde]
       
        PatchBaseline: pb-012345abcde
        
         OpsMetadata object: [ResourceID] for tagging is created from the Amazon Resource Name (ARN) for the object. Specifically, [ResourceID] is created from the strings that come after the word [opsmetadata] in the ARN. For example, an OpsMetadata object with an ARN of [arn:aws:ssm:us-east-2:1234567890:opsmetadata/aws/ssm/MyGroup/appmanager] has a [ResourceID] of either [aws/ssm/MyGroup/appmanager] or [/aws/ssm/MyGroup/appmanager].
         
          For the Document and Parameter values, use the name of the resource.
          
           The [ManagedInstance] type for this API operation is only for on-premises managed nodes. Specify the name of the managed node in the following format: mi-ID_number. For example, mi-1a2b3c4d5e6f.
           
            *)

  resource_type: resource_type_for_tagging;
  (** 
    The type of resource from which you want to remove a tag.
    
     The [ManagedInstance] type for this API operation is only for on-premises managed nodes. Specify the name of the managed node in the following format: 
     {[
     mi-{i ID_number}
     ]}
     . For example, [mi-1a2b3c4d5e6f].
     
      *)

}

(** 
    The resource type isn't valid. For example, if you are attempting to tag an EC2 instance, the instance must be a registered managed node.
     *)
type invalid_resource_type = unit

(** 
    The resource ID isn't valid. Verify that you entered the correct ID and try again.
     *)
type invalid_resource_id = unit

(** 
    Reserved for internal use.
     *)
type registration_metadata_item = {
  value: string;
  (** 
    Reserved for internal use.
     *)

  key: string;
  (** 
    Reserved for internal use.
     *)

}

type register_task_with_maintenance_window_result = {
  window_task_id: string option;
  (** 
    The ID of the task in the maintenance window.
     *)

}

type maintenance_window_task_type = | Lambda
  | StepFunctions
  | Automation
  | RunCommand

type register_task_with_maintenance_window_request = {
  alarm_configuration: alarm_configuration option;
  (** 
    The CloudWatch alarm you want to apply to your maintenance window task.
     *)

  cutoff_behavior: maintenance_window_task_cutoff_behavior option;
  (** 
    Indicates whether tasks should continue to run after the cutoff time specified in the maintenance windows is reached.
    
     {ul
          {- [CONTINUE_TASK]: When the cutoff time is reached, any tasks that are running continue. The default value.
             
             }
           {- [CANCEL_TASK]:
              
               {ul
                    {- For Automation, Lambda, Step Functions tasks: When the cutoff time is reached, any task invocations that are already running continue, but no new task invocations are started.
                       
                       }
                     {- For Run Command tasks: When the cutoff time is reached, the system sends a [CancelCommand] operation that attempts to cancel the command associated with the task. However, there is no guarantee that the command will be terminated and the underlying process stopped.
                        
                        }
                    
            }
             The status for tasks that are not completed is [TIMED_OUT].
             
             }
          
      }
       *)

  client_token: string option;
  (** 
    User-provided idempotency token.
     *)

  description: string option;
  (** 
    An optional description for the task.
     *)

  name: string option;
  (** 
    An optional name for the task.
     *)

  logging_info: logging_info option;
  (** 
    A structure containing information about an Amazon Simple Storage Service (Amazon S3) bucket to write managed node-level logs to.
    
     [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      *)

  max_errors: string option;
  [@ocaml.doc {| 
    The maximum number of errors allowed before this task stops being scheduled.
    
     Although this element is listed as "Required: No", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.
     
      For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.
      
       |}]

  max_concurrency: string option;
  [@ocaml.doc {| 
    The maximum number of targets this task can be run for, in parallel.
    
     Although this element is listed as "Required: No", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.
     
      For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.
      
       |}]

  priority: int option;
  (** 
    The priority of the task in the maintenance window, the lower the number the higher the priority. Tasks in a maintenance window are scheduled in priority order with tasks that have the same priority scheduled in parallel.
     *)

  task_invocation_parameters: maintenance_window_task_invocation_parameters option;
  (** 
    The parameters that the task should use during execution. Populate only the fields that match the task type. All other fields should be empty.
     *)

  task_parameters: (string * maintenance_window_task_parameter_value_expression) list option;
  (** 
    The parameters that should be passed to the task when it is run.
    
     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      *)

  task_type: maintenance_window_task_type;
  (** 
    The type of task being registered.
     *)

  service_role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM service role for Amazon Web Services Systems Manager to assume when running a maintenance window task. If you do not specify a service role ARN, Systems Manager uses a service-linked role in your account. If no appropriate service-linked role for Systems Manager exists in your account, it is created when you run [RegisterTaskWithMaintenanceWindow].
    
     However, for an improved security posture, we strongly recommend creating a custom policy and custom service role for running your maintenance window tasks. The policy can be crafted to provide only the permissions needed for your particular maintenance window tasks. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-maintenance-permissions.html}Setting up maintenance windows} in the in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  task_arn: string;
  (** 
    The ARN of the task to run.
     *)

  targets: target list option;
  (** 
    The targets (either managed nodes or maintenance window targets).
    
     One or more targets must be specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional for other maintenance window task types (Automation, Lambda, and Step Functions). For more information about running tasks that don't specify targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User Guide}.
     
      Specify managed nodes using the following format:
      
       
       {[
       Key=InstanceIds,Values=,
       ]}
       
       
        Specify maintenance window targets using the following format:
        
         
         {[
         Key=WindowTargetIds,Values=,
         ]}
         
          *)

  window_id: string;
  (** 
    The ID of the maintenance window the task should be added to.
     *)

}

(** 
    You attempted to register a [LAMBDA] or [STEP_FUNCTIONS] task in a region where the corresponding service isn't available.
     *)
type feature_not_available_exception = {
  message: string option;
  
}

type register_target_with_maintenance_window_result = {
  window_target_id: string option;
  (** 
    The ID of the target definition in this maintenance window.
     *)

}

type maintenance_window_resource_type = | ResourceGroup
  | Instance

type register_target_with_maintenance_window_request = {
  client_token: string option;
  (** 
    User-provided idempotency token.
     *)

  description: string option;
  (** 
    An optional description for the target.
     *)

  name: string option;
  (** 
    An optional name for the target.
     *)

  owner_information: string option;
  (** 
    User-provided value that will be included in any Amazon CloudWatch Events events raised while running tasks for these targets in this maintenance window.
     *)

  targets: target list;
  (** 
    The targets to register with the maintenance window. In other words, the managed nodes to run commands on when the maintenance window runs.
    
     If a single maintenance window task is registered with multiple targets, its task invocations occur sequentially and not in parallel. If your task must run on multiple targets at the same time, register a task for each target individually and assign each task the same priority level.
     
      You can specify targets using managed node IDs, resource group names, or tags that have been applied to managed nodes.
      
       {b Example 1}: Specify managed node IDs
       
        
        {[
        Key=InstanceIds,Values=,,
        ]}
        
        
         {b Example 2}: Use tag key-pairs applied to managed nodes
         
          
          {[
          Key=tag:,Values=,
          ]}
          
          
           {b Example 3}: Use tag-keys applied to managed nodes
           
            
            {[
            Key=tag-key,Values=,
            ]}
            
            
             {b Example 4}: Use resource group names
             
              
              {[
              Key=resource-groups:Name,Values=
              ]}
              
              
               {b Example 5}: Use filters for resource group types
               
                
                {[
                Key=resource-groups:ResourceTypeFilters,Values=,
                ]}
                
                
                 For [Key=resource-groups:ResourceTypeFilters], specify resource types in the following format
                 
                  [Key=resource-groups:ResourceTypeFilters,Values=AWS::EC2::INSTANCE,AWS::EC2::VPC]
                  
                   For more information about these examples formats, including the best use case for each one, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/mw-cli-tutorial-targets-examples.html}Examples: Register targets with a maintenance window} in the {i Amazon Web Services Systems Manager User Guide}.
                    *)

  resource_type: maintenance_window_resource_type;
  (** 
    The type of target being registered with the maintenance window.
     *)

  window_id: string;
  (** 
    The ID of the maintenance window the target should be registered with.
     *)

}

type register_patch_baseline_for_patch_group_result = {
  patch_group: string option;
  (** 
    The name of the patch group registered with the patch baseline.
     *)

  baseline_id: string option;
  (** 
    The ID of the patch baseline the patch group was registered with.
     *)

}

type register_patch_baseline_for_patch_group_request = {
  patch_group: string;
  (** 
    The name of the patch group to be registered with the patch baseline.
     *)

  baseline_id: string;
  (** 
    The ID of the patch baseline to register with the patch group.
     *)

}

(** 
    Error returned if an attempt is made to register a patch group with a patch baseline that is already registered with a different patch baseline.
     *)
type already_exists_exception = {
  message: string option;
  
}

type register_default_patch_baseline_result = {
  baseline_id: string option;
  (** 
    The ID of the default patch baseline.
     *)

}

type register_default_patch_baseline_request = {
  baseline_id: string;
  (** 
    The ID of the patch baseline that should be the default patch baseline.
     *)

}

type reboot_option = | NO_REBOOT
  | REBOOT_IF_NEEDED

type put_resource_policy_response = {
  policy_hash: string option;
  (** 
    ID of the current policy version.
     *)

  policy_id: string option;
  (** 
    The policy ID. To update a policy, you must specify [PolicyId] and [PolicyHash].
     *)

}

type put_resource_policy_request = {
  policy_hash: string option;
  (** 
    ID of the current policy version. The hash helps to prevent a situation where multiple users attempt to overwrite a policy. You must provide this hash when updating or deleting a policy.
     *)

  policy_id: string option;
  (** 
    The policy ID.
     *)

  policy: string;
  (** 
    A policy you want to associate with a resource.
     *)

  resource_arn: string;
  (** 
    Amazon Resource Name (ARN) of the resource to which you want to attach a policy.
     *)

}

(** 
    The specified policy document is malformed or invalid, or excessive [PutResourcePolicy] or [DeleteResourcePolicy] calls have been made.
     *)
type malformed_resource_policy_document_exception = {
  message: string option;
  
}

type parameter_tier = | INTELLIGENT_TIERING
  | ADVANCED
  | STANDARD

type put_parameter_result = {
  tier: parameter_tier option;
  (** 
    The tier assigned to the parameter.
     *)

  version: int option;
  (** 
    The new version number of a parameter. If you edit a parameter value, Parameter Store automatically creates a new version and assigns this new version a unique ID. You can reference a parameter version ID in API operations or in Systems Manager documents (SSM documents). By default, if you don't specify a specific version, the system returns the latest parameter value when a parameter is called.
     *)

}

type parameter_type = | SECURE_STRING
  | STRING_LIST
  | STRING

type put_parameter_request = {
  data_type: string option;
  (** 
    The data type for a [String] parameter. Supported data types include plain text and Amazon Machine Image (AMI) IDs.
    
     {b The following data type values are supported.}
     
      {ul
           {- [text]
              
              }
            {- [aws:ec2:image]
               
               }
            {- [aws:ssm:integration]
               
               }
           
      }
       When you create a [String] parameter and specify [aws:ec2:image], Amazon Web Services Systems Manager validates the parameter value is in the required format, such as [ami-12345abcdeEXAMPLE], and that the specified AMI is available in your Amazon Web Services account.
       
        If the action is successful, the service sends back an HTTP 200 response which indicates a successful [PutParameter] call for all cases except for data type [aws:ec2:image]. If you call [PutParameter] with [aws:ec2:image] data type, a successful HTTP 200 response does not guarantee that your parameter was successfully created or updated. The [aws:ec2:image] value is validated asynchronously, and the [PutParameter] call returns before the validation is complete. If you submit an invalid AMI value, the PutParameter operation will return success, but the asynchronous validation will fail and the parameter will not be created or updated. To monitor whether your [aws:ec2:image] parameters are created successfully, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-cwe.html}Setting up notifications or trigger actions based on Parameter Store events}. For more information about AMI format validation , see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-ec2-aliases.html}Native parameter support for Amazon Machine Image IDs}.
        
         *)

  policies: string option;
  (** 
    One or more policies to apply to a parameter. This operation takes a JSON array. Parameter Store, a capability of Amazon Web Services Systems Manager supports the following policy types:
    
     Expiration: This policy deletes the parameter after it expires. When you create the policy, you specify the expiration date. You can update the expiration date and time by updating the policy. Updating the {i parameter} doesn't affect the expiration date and time. When the expiration time is reached, Parameter Store deletes the parameter.
     
      ExpirationNotification: This policy initiates an event in Amazon CloudWatch Events that notifies you about the expiration. By using this policy, you can receive notification before or after the expiration time is reached, in units of days or hours.
      
       NoChangeNotification: This policy initiates a CloudWatch Events event if a parameter hasn't been modified for a specified period of time. This policy type is useful when, for example, a secret needs to be changed within a period of time, but it hasn't been changed.
       
        All existing policies are preserved until you send new policies or an empty policy. For more information about parameter policies, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-policies.html}Assigning parameter policies}.
         *)

  tier: parameter_tier option;
  (** 
    The parameter tier to assign to a parameter.
    
     Parameter Store offers a standard tier and an advanced tier for parameters. Standard parameters have a content size limit of 4 KB and can't be configured to use parameter policies. You can create a maximum of 10,000 standard parameters for each Region in an Amazon Web Services account. Standard parameters are offered at no additional cost.
     
      Advanced parameters have a content size limit of 8 KB and can be configured to use parameter policies. You can create a maximum of 100,000 advanced parameters for each Region in an Amazon Web Services account. Advanced parameters incur a charge. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html}Managing parameter tiers} in the {i Amazon Web Services Systems Manager User Guide}.
      
       You can change a standard parameter to an advanced parameter any time. But you can't revert an advanced parameter to a standard parameter. Reverting an advanced parameter to a standard parameter would result in data loss because the system would truncate the size of the parameter from 8 KB to 4 KB. Reverting would also remove any policies attached to the parameter. Lastly, advanced parameters use a different form of encryption than standard parameters.
       
        If you no longer need an advanced parameter, or if you no longer want to incur charges for an advanced parameter, you must delete it and recreate it as a new standard parameter.
        
         {b Using the Default Tier Configuration}
         
          In [PutParameter] requests, you can specify the tier to create the parameter in. Whenever you specify a tier in the request, Parameter Store creates or updates the parameter according to that request. However, if you don't specify a tier in a request, Parameter Store assigns the tier based on the current Parameter Store default tier configuration.
          
           The default tier when you begin using Parameter Store is the standard-parameter tier. If you use the advanced-parameter tier, you can specify one of the following as the default:
           
            {ul
                 {- {b Advanced}: With this option, Parameter Store evaluates all requests as advanced parameters.
                    
                    }
                  {- {b Intelligent-Tiering}: With this option, Parameter Store evaluates each request to determine if the parameter is standard or advanced.
                     
                      If the request doesn't include any options that require an advanced parameter, the parameter is created in the standard-parameter tier. If one or more options requiring an advanced parameter are included in the request, Parameter Store create a parameter in the advanced-parameter tier.
                      
                       This approach helps control your parameter-related costs by always creating standard parameters unless an advanced parameter is necessary.
                       
                       }
                 
      }
       Options that require an advanced parameter include the following:
       
        {ul
             {- The content size of the parameter is more than 4 KB.
                
                }
              {- The parameter uses a parameter policy.
                 
                 }
              {- More than 10,000 parameters already exist in your Amazon Web Services account in the current Amazon Web Services Region.
                 
                 }
             
      }
       For more information about configuring the default tier option, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html#ps-default-tier}Specifying a default parameter tier} in the {i Amazon Web Services Systems Manager User Guide}.
        *)

  tags: tag list option;
  (** 
    Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a Systems Manager parameter to identify the type of resource to which it applies, the environment, or the type of configuration data referenced by the parameter. In this case, you could specify the following key-value pairs:
    
     {ul
          {- [Key=Resource,Value=S3bucket]
             
             }
           {- [Key=OS,Value=Windows]
              
              }
           {- [Key=ParameterType,Value=LicenseKey]
              
              }
          
      }
       To add tags to an existing Systems Manager parameter, use the [AddTagsToResource] operation.
       
        *)

  allowed_pattern: string option;
  (** 
    A regular expression used to validate the parameter value. For example, for String types with values restricted to numbers, you can specify the following: AllowedPattern=^\d+$
     *)

  overwrite: bool option;
  (** 
    Overwrite an existing parameter. The default value is [false].
     *)

  key_id: string option;
  (** 
    The Key Management Service (KMS) ID that you want to use to encrypt a parameter. Use a custom key for better security. Required for parameters that use the [SecureString] data type.
    
     If you don't specify a key ID, the system uses the default key associated with your Amazon Web Services account which is not as secure as using a custom key.
     
      {ul
           {- To use a custom KMS key, choose the [SecureString] data type with the [Key ID] parameter.
              
              }
           
      }
       *)

  type_: parameter_type option;
  (** 
    The type of parameter that you want to add to the system.
    
     [SecureString] isn't currently supported for CloudFormation templates.
     
      Items in a [StringList] must be separated by a comma (,). You can't use other punctuation or special character to escape items in the list. If you have a parameter value that requires a comma, then use the [String] data type.
      
       Specifying a parameter type isn't required when updating a parameter. You must specify a parameter type when creating a parameter.
       
        *)

  value: string;
  (** 
    The parameter value that you want to add to the system. Standard parameters have a value limit of 4 KB. Advanced parameters have a value limit of 8 KB.
    
     Parameters can't be referenced or nested in the values of other parameters. You can't include [{{}}] or 
     {[
     \{\{ssm:{i parameter-name}\}\}
     ]}
      in a parameter value.
     
      *)

  description: string option;
  (** 
    Information about the parameter that you want to add to the system. Optional but recommended.
    
     Don't enter personally identifiable information in this field.
     
      *)

  name: string;
  [@ocaml.doc {| 
    The fully qualified name of the parameter that you want to add to the system.
    
     You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.
     
      The fully qualified name includes the complete hierarchy of the parameter path and name. For parameters in a hierarchy, you must include a leading forward slash character (/) when you create or reference a parameter. For example: [/Dev/DBServer/MySQL/db-string13]
      
       Naming Constraints:
       
        {ul
             {- Parameter names are case sensitive.
                
                }
              {- A parameter name must be unique within an Amazon Web Services Region
                 
                 }
              {- A parameter name can't be prefixed with "[aws]" or "[ssm]" (case-insensitive).
                 
                 }
              {- Parameter names can include only the following symbols and letters: [a-zA-Z0-9_.-]
                 
                  In addition, the slash character ( / ) is used to delineate hierarchies in parameter names. For example: [/Dev/Production/East/Project-ABC/MyParameter]
                  
                  }
              {- A parameter name can't include spaces.
                 
                 }
              {- Parameter hierarchies are limited to a maximum depth of fifteen levels.
                 
                 }
             
      }
       For additional information about valid values for parameter names, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-su-create.html}Creating Systems Manager parameters} in the {i Amazon Web Services Systems Manager User Guide}.
       
        The maximum length constraint of 2048 characters listed below includes 1037 characters reserved for internal use by Systems Manager. The maximum length for a parameter name that you create is 1011 characters. This includes the characters in the ARN that precede the name you specify, such as [arn:aws:ssm:us-east-2:111122223333:parameter/].
        
         |}]

}

(** 
    You specified more than the maximum number of allowed policies for the parameter. The maximum is 10.
     *)
type policies_limit_exceeded_exception = {
  message: string option;
  
}

(** 
    The parameter name isn't valid.
     *)
type parameter_pattern_mismatch_exception = {
  message: string option;
  (** 
    The parameter name isn't valid.
     *)

}

(** 
    Parameter Store retains the 100 most recently created versions of a parameter. After this number of versions has been created, Parameter Store deletes the oldest version when a new one is created. However, if the oldest version has a {i label} attached to it, Parameter Store won't delete the version and instead presents this error message:
    
     
     {[
     An error occurred (ParameterMaxVersionLimitExceeded) when calling the PutParameter operation: You attempted to create a new version of {i parameter-name} by calling the PutParameter API with the overwrite flag. Version {i version-number}, the oldest version, can't be deleted because it has a label associated with it. Move the label to another version of the parameter, and try again.
     ]}
     
     
      This safeguard is to prevent parameter versions with mission critical labels assigned to them from being deleted. To continue creating new parameters, first move the label from the oldest version of the parameter to a newer one for use in your operations. For information about moving parameter labels, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html#sysman-paramstore-labels-console-move}Move a parameter label (console)} or {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html#sysman-paramstore-labels-cli-move}Move a parameter label (CLI)} in the {i Amazon Web Services Systems Manager User Guide}.
       *)
type parameter_max_version_limit_exceeded = {
  message: string option;
  
}

(** 
    You have exceeded the number of parameters for this Amazon Web Services account. Delete one or more parameters and try again.
     *)
type parameter_limit_exceeded = {
  message: string option;
  
}

(** 
    The parameter already exists. You can't create duplicate parameters.
     *)
type parameter_already_exists = {
  message: string option;
  
}

(** 
    The policy type isn't supported. Parameter Store supports the following policy types: Expiration, ExpirationNotification, and NoChangeNotification.
     *)
type invalid_policy_type_exception = {
  message: string option;
  
}

(** 
    A policy attribute or its value is invalid.
     *)
type invalid_policy_attribute_exception = {
  message: string option;
  
}

(** 
    The query key ID isn't valid.
     *)
type invalid_key_id = {
  message: string option;
  
}

(** 
    The request doesn't meet the regular expression requirement.
     *)
type invalid_allowed_pattern_exception = {
  message: string option;
  (** 
    The request doesn't meet the regular expression requirement.
     *)

}

(** 
    There is a conflict in the policies specified for this parameter. You can't, for example, specify two Expiration policies for a parameter. Review your policies, and try again.
     *)
type incompatible_policy_exception = {
  message: string option;
  
}

(** 
    Parameter Store doesn't support changing a parameter type in a hierarchy. For example, you can't change a parameter from a [String] type to a [SecureString] type. You must create a new, unique parameter.
     *)
type hierarchy_type_mismatch_exception = {
  message: string option;
  (** 
    Parameter Store doesn't support changing a parameter type in a hierarchy. For example, you can't change a parameter from a [String] type to a [SecureString] type. You must create a new, unique parameter.
     *)

}

(** 
    A hierarchy can have a maximum of 15 levels. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-parameter-name-constraints.html}Requirements and constraints for parameter names} in the {i Amazon Web Services Systems Manager User Guide}.
     *)
type hierarchy_level_limit_exceeded_exception = {
  message: string option;
  (** 
    A hierarchy can have a maximum of 15 levels. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-su-create.html#sysman-parameter-name-constraints}About requirements and constraints for parameter names} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

}

type put_inventory_result = {
  message: string option;
  (** 
    Information about the request.
     *)

}

(** 
    Information collected from managed nodes based on your inventory policy document
     *)
type inventory_item = {
  context: (string * string) list option;
  (** 
    A map of associated properties for a specified inventory type. For example, with this attribute, you can specify the [ExecutionId], [ExecutionType], [ComplianceType] properties of the [AWS:ComplianceItem] type.
     *)

  content: (string * string) list list option;
  (** 
    The inventory data of the inventory type.
     *)

  content_hash: string option;
  (** 
    MD5 hash of the inventory item type contents. The content hash is used to determine whether to update inventory information. The PutInventory API doesn't update the inventory item type contents if the MD5 hash hasn't changed since last update.
     *)

  capture_time: string;
  (** 
    The time the inventory information was collected.
     *)

  schema_version: string;
  (** 
    The schema version for the inventory item.
     *)

  type_name: string;
  (** 
    The name of the inventory type. Default inventory item type names start with [AWS]. Custom inventory type names will start with Custom. Default inventory item types include the following: [AWS:AWSComponent], [AWS:Application], [AWS:InstanceInformation], [AWS:Network], and [AWS:WindowsUpdate].
     *)

}

type put_inventory_request = {
  items: inventory_item list;
  (** 
    The inventory items that you want to add or update on managed nodes.
     *)

  instance_id: string;
  (** 
    An managed node ID where you want to add or update inventory items.
     *)

}

(** 
    The inventory item size has exceeded the size limit.
     *)
type item_size_limit_exceeded_exception = {
  message: string option;
  
  type_name: string option;
  
}

(** 
    The inventory item has invalid content.
     *)
type item_content_mismatch_exception = {
  message: string option;
  
  type_name: string option;
  
}

(** 
    The parameter type name isn't valid.
     *)
type invalid_type_name_exception = {
  message: string option;
  
}

(** 
    One or more content items isn't valid.
     *)
type invalid_item_content_exception = {
  message: string option;
  
  type_name: string option;
  
}

(** 
    You specified invalid keys or values in the [Context] attribute for [InventoryItem]. Verify the keys and values, and try again.
     *)
type invalid_inventory_item_context_exception = {
  message: string option;
  
}

(** 
    You have exceeded the limit for custom schemas. Delete one or more custom schemas and try again.
     *)
type custom_schema_count_limit_exceeded_exception = {
  message: string option;
  
}

type put_compliance_items_result = unit

(** 
    Information about a compliance item.
     *)
type compliance_item_entry = {
  details: (string * string) list option;
  [@ocaml.doc {| 
    A "Key": "Value" tag combination for the compliance item.
     |}]

  status: compliance_status;
  (** 
    The status of the compliance item. An item is either COMPLIANT or NON_COMPLIANT.
     *)

  severity: compliance_severity;
  (** 
    The severity of the compliance status. Severity can be one of the following: Critical, High, Medium, Low, Informational, Unspecified.
     *)

  title: string option;
  (** 
    The title of the compliance item. For example, if the compliance item is a Windows patch, the title could be the title of the KB article for the patch; for example: Security Update for Active Directory Federation Services.
     *)

  id: string option;
  (** 
    The compliance item ID. For example, if the compliance item is a Windows patch, the ID could be the number of the KB article.
     *)

}

type compliance_upload_type = | Partial
  | Complete

type put_compliance_items_request = {
  upload_type: compliance_upload_type option;
  (** 
    The mode for uploading compliance items. You can specify [COMPLETE] or [PARTIAL]. In [COMPLETE] mode, the system overwrites all existing compliance information for the resource. You must provide a full list of compliance items each time you send the request.
    
     In [PARTIAL] mode, the system overwrites compliance information for a specific association. The association must be configured with [SyncCompliance] set to [MANUAL]. By default, all requests use [COMPLETE] mode.
     
      This attribute is only valid for association compliance.
      
       *)

  item_content_hash: string option;
  (** 
    MD5 or SHA-256 content hash. The content hash is used to determine if existing information should be overwritten or ignored. If the content hashes match, the request to put compliance information is ignored.
     *)

  items: compliance_item_entry list;
  (** 
    Information about the compliance as defined by the resource type. For example, for a patch compliance type, [Items] includes information about the PatchSeverity, Classification, and so on.
     *)

  execution_summary: compliance_execution_summary;
  (** 
    A summary of the call execution that includes an execution ID, the type of execution (for example, [Command]), and the date/time of the execution using a datetime object that is saved in the following format: [yyyy-MM-dd'T'HH:mm:ss'Z']
     *)

  compliance_type: string;
  (** 
    Specify the compliance type. For example, specify Association (for a State Manager association), Patch, or Custom:[string].
     *)

  resource_type: string;
  (** 
    Specify the type of resource. [ManagedInstance] is currently the only supported resource type.
     *)

  resource_id: string;
  (** 
    Specify an ID for this resource. For a managed node, this is the node ID.
     *)

}

(** 
    You specified too many custom compliance types. You can specify a maximum of 10 different types.
     *)
type compliance_type_count_limit_exceeded_exception = {
  message: string option;
  
}

(** 
    An aggregate of step execution statuses displayed in the Amazon Web Services Systems Manager console for a multi-Region and multi-account Automation execution.
     *)
type progress_counters = {
  timed_out_steps: int option;
  (** 
    The total number of steps that timed out in all specified Amazon Web Services Regions and Amazon Web Services accounts for the current Automation execution.
     *)

  cancelled_steps: int option;
  (** 
    The total number of steps that the system cancelled in all specified Amazon Web Services Regions and Amazon Web Services accounts for the current Automation execution.
     *)

  failed_steps: int option;
  (** 
    The total number of steps that failed to run in all specified Amazon Web Services Regions and Amazon Web Services accounts for the current Automation execution.
     *)

  success_steps: int option;
  (** 
    The total number of steps that successfully completed in all specified Amazon Web Services Regions and Amazon Web Services accounts for the current Automation execution.
     *)

  total_steps: int option;
  (** 
    The total number of steps run in all specified Amazon Web Services Regions and Amazon Web Services accounts for the current Automation execution.
     *)

}

type ping_status = | INACTIVE
  | CONNECTION_LOST
  | ONLINE

type patch_deployment_status = | ExplicitRejected
  | ExplicitApproved
  | PendingApproval
  | Approved

(** 
    Information about the approval status of a patch.
     *)
type patch_status = {
  approval_date: float option;
  (** 
    The date the patch was approved (or will be approved if the status is [PENDING_APPROVAL]).
     *)

  compliance_level: patch_compliance_level option;
  (** 
    The compliance severity level for a patch.
     *)

  deployment_status: patch_deployment_status option;
  (** 
    The approval status of a patch.
     *)

}

type patch_set = | Application
  | Os

type patch_property = | PatchSeverity
  | PatchPriority
  | PatchMsrcSeverity
  | PatchClassification
  | PatchProductFamily
  | Product

(** 
    Defines a filter used in Patch Manager APIs. Supported filter keys depend on the API operation that includes the filter. Patch Manager API operations that use [PatchOrchestratorFilter] include the following:
    
     {ul
          {- [DescribeAvailablePatches]
             
             }
           {- [DescribeInstancePatches]
              
              }
           {- [DescribePatchBaselines]
              
              }
           {- [DescribePatchGroups]
              
              }
          
      }
       *)
type patch_orchestrator_filter = {
  values: string list option;
  (** 
    The value for the filter.
     *)

  key: string option;
  (** 
    The key for the filter.
     *)

}

type patch_operation_type = | INSTALL
  | SCAN

(** 
    Represents metadata about a patch.
     *)
type patch = {
  repository: string option;
  (** 
    The source patch repository for the operating system and version, such as [trusty-security] for Ubuntu Server 14.04 LTE and [focal-security] for Ubuntu Server 20.04 LTE. Applies to Linux-based managed nodes only.
     *)

  severity: string option;
  (** 
    The severity level of the patch. For example, [CRITICAL] or [MODERATE].
     *)

  arch: string option;
  (** 
    The architecture of the patch. For example, in [example-pkg-0.710.10-2.7.abcd.x86_64], the architecture is indicated by [x86_64]. Applies to Linux-based managed nodes only.
     *)

  release: string option;
  (** 
    The particular release of a patch. For example, in [pkg-example-EE-20180914-2.2.amzn1.noarch], the release is [2.amaz1]. Applies to Linux-based managed nodes only.
     *)

  version: string option;
  (** 
    The version number of the patch. For example, in [example-pkg-1.710.10-2.7.abcd.x86_64], the version number is indicated by [-1]. Applies to Linux-based managed nodes only.
     *)

  epoch: int option;
  (** 
    The epoch of the patch. For example in [pkg-example-EE-20180914-2.2.amzn1.noarch], the epoch value is [20180914-2]. Applies to Linux-based managed nodes only.
     *)

  name: string option;
  (** 
    The name of the patch. Applies to Linux-based managed nodes only.
     *)

  cve_ids: string list option;
  (** 
    The Common Vulnerabilities and Exposures (CVE) ID of the patch. For example, [CVE-2011-3192]. Applies to Linux-based managed nodes only.
     *)

  bugzilla_ids: string list option;
  (** 
    The Bugzilla ID of the patch. For example, [1600646]. Applies to Linux-based managed nodes only.
     *)

  advisory_ids: string list option;
  (** 
    The Advisory ID of the patch. For example, [RHSA-2020:3779]. Applies to Linux-based managed nodes only.
     *)

  language: string option;
  (** 
    The language of the patch if it's language-specific.
     *)

  msrc_number: string option;
  (** 
    The ID of the Microsoft Security Response Center (MSRC) bulletin the patch is related to. For example, [MS14-045]. Applies to Windows patches only.
     *)

  kb_number: string option;
  (** 
    The Microsoft Knowledge Base ID of the patch. Applies to Windows patches only.
     *)

  msrc_severity: string option;
  (** 
    The severity of the patch, such as [Critical], [Important], or [Moderate]. Applies to Windows patches only.
     *)

  classification: string option;
  (** 
    The classification of the patch. For example, [SecurityUpdates], [Updates], or [CriticalUpdates].
     *)

  product: string option;
  (** 
    The specific product the patch is applicable for. For example, [WindowsServer2016] or [AmazonLinux2018.03].
     *)

  product_family: string option;
  (** 
    The product family the patch is applicable for. For example, [Windows] or [Amazon Linux 2].
     *)

  vendor: string option;
  (** 
    The name of the vendor providing the patch.
     *)

  content_url: string option;
  (** 
    The URL where more information can be obtained about the patch.
     *)

  description: string option;
  (** 
    The description of the patch.
     *)

  title: string option;
  (** 
    The title of the patch.
     *)

  release_date: float option;
  (** 
    The date the patch was released.
     *)

  id: string option;
  (** 
    The ID of the patch. Applies to Windows patches only.
    
     This ID isn't the same as the Microsoft Knowledge Base ID.
     
      *)

}

(** 
    Defines the basic information about a patch baseline.
     *)
type patch_baseline_identity = {
  default_baseline: bool option;
  (** 
    Whether this is the default baseline. Amazon Web Services Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.
     *)

  baseline_description: string option;
  (** 
    The description of the patch baseline.
     *)

  operating_system: operating_system option;
  (** 
    Defines the operating system the patch baseline applies to. The default value is [WINDOWS].
     *)

  baseline_name: string option;
  (** 
    The name of the patch baseline.
     *)

  baseline_id: string option;
  (** 
    The ID of the patch baseline.
     *)

}

(** 
    The mapping between a patch group and the patch baseline the patch group is registered with.
     *)
type patch_group_patch_baseline_mapping = {
  baseline_identity: patch_baseline_identity option;
  (** 
    The patch baseline the patch group is registered with.
     *)

  patch_group: string option;
  (** 
    The name of the patch group registered with the patch baseline.
     *)

}

type patch_compliance_data_state = | Failed
  | NotApplicable
  | Missing
  | InstalledRejected
  | InstalledPendingReboot
  | InstalledOther
  | Installed

(** 
    Information about the state of a patch on a particular managed node as it relates to the patch baseline used to patch the node.
     *)
type patch_compliance_data = {
  cve_ids: string option;
  (** 
    The IDs of one or more Common Vulnerabilities and Exposure (CVE) issues that are resolved by the patch.
    
     Currently, CVE ID values are reported only for patches with a status of [Missing] or [Failed].
     
      *)

  installed_time: float;
  (** 
    The date/time the patch was installed on the managed node. Not all operating systems provide this level of information.
     *)

  state: patch_compliance_data_state;
  (** 
    The state of the patch on the managed node, such as INSTALLED or FAILED.
    
     For descriptions of each patch state, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-compliance-about.html#sysman-compliance-monitor-patch}About patch compliance} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  severity: string;
  (** 
    The severity of the patch such as [Critical], [Important], and [Moderate].
     *)

  classification: string;
  (** 
    The classification of the patch, such as [SecurityUpdates], [Updates], and [CriticalUpdates].
     *)

  kb_id: string;
  (** 
    The operating system-specific ID of the patch.
     *)

  title: string;
  (** 
    The title of the patch.
     *)

}

type parameters_filter_key = | KEY_ID
  | TYPE
  | NAME

(** 
    This data type is deprecated. Instead, use [ParameterStringFilter].
     *)
type parameters_filter = {
  values: string list;
  (** 
    The filter values.
     *)

  key: parameters_filter_key;
  (** 
    The name of the filter.
     *)

}

(** 
    A parameter version can have a maximum of ten labels.
     *)
type parameter_version_label_limit_exceeded = {
  message: string option;
  
}

(** 
    One or more filters. Use a filter to return a more specific list of results.
     *)
type parameter_string_filter = {
  values: string list option;
  (** 
    The value you want to search for.
     *)

  option_: string option;
  (** 
    For all filters used with [DescribeParameters], valid options include [Equals] and [BeginsWith]. The [Name] filter additionally supports the [Contains] option. (Exception: For filters using the key [Path], valid options include [Recursive] and [OneLevel].)
    
     For filters used with [GetParametersByPath], valid options include [Equals] and [BeginsWith]. (Exception: For filters using [Label] as the Key name, the only valid option is [Equals].)
      *)

  key: string;
  (** 
    The name of the filter.
    
     The [ParameterStringFilter] object is used by the [DescribeParameters] and [GetParametersByPath] API operations. However, not all of the pattern values listed for [Key] can be used with both operations.
     
      For [DescribeParameters], all of the listed patterns are valid except [Label].
      
       For [GetParametersByPath], the following patterns listed for [Key] aren't valid: [tag], [DataType], [Name], [Path], and [Tier].
       
        For examples of Amazon Web Services CLI commands demonstrating valid parameter filter constructions, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-search.html}Searching for Systems Manager parameters} in the {i Amazon Web Services Systems Manager User Guide}.
         *)

}

(** 
    One or more policies assigned to a parameter.
     *)
type parameter_inline_policy = {
  policy_status: string option;
  (** 
    The status of the policy. Policies report the following statuses: Pending (the policy hasn't been enforced or applied yet), Finished (the policy was applied), Failed (the policy wasn't applied), or InProgress (the policy is being applied now).
     *)

  policy_type: string option;
  (** 
    The type of policy. Parameter Store, a capability of Amazon Web Services Systems Manager, supports the following policy types: Expiration, ExpirationNotification, and NoChangeNotification.
     *)

  policy_text: string option;
  (** 
    The JSON text of the policy.
     *)

}

(** 
    Metadata includes information like the Amazon Resource Name (ARN) of the last user to update the parameter and the date and time the parameter was last used.
     *)
type parameter_metadata = {
  data_type: string option;
  (** 
    The data type of the parameter, such as [text] or [aws:ec2:image]. The default is [text].
     *)

  policies: parameter_inline_policy list option;
  (** 
    A list of policies associated with a parameter.
     *)

  tier: parameter_tier option;
  (** 
    The parameter tier.
     *)

  version: int option;
  (** 
    The parameter version.
     *)

  allowed_pattern: string option;
  (** 
    A parameter name can include only the following letters and symbols.
    
     a-zA-Z0-9_.-
      *)

  description: string option;
  (** 
    Description of the parameter actions.
     *)

  last_modified_user: string option;
  (** 
    Amazon Resource Name (ARN) of the Amazon Web Services user who last changed the parameter.
     *)

  last_modified_date: float option;
  (** 
    Date the parameter was last changed or updated.
     *)

  key_id: string option;
  (** 
    The alias of the Key Management Service (KMS) key used to encrypt the parameter. Applies to [SecureString] parameters only.
     *)

  type_: parameter_type option;
  (** 
    The type of parameter. Valid parameter types include the following: [String], [StringList], and [SecureString].
     *)

  ar_n: string option;
  (** 
    The (ARN) of the last user to update the parameter.
     *)

  name: string option;
  (** 
    The parameter name.
     *)

}

(** 
    An Amazon Web Services Systems Manager parameter in Parameter Store.
     *)
type parameter = {
  data_type: string option;
  (** 
    The data type of the parameter, such as [text] or [aws:ec2:image]. The default is [text].
     *)

  ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the parameter.
     *)

  last_modified_date: float option;
  (** 
    Date the parameter was last changed or updated and the parameter version was created.
     *)

  source_result: string option;
  (** 
    Applies to parameters that reference information in other Amazon Web Services services. [SourceResult] is the raw result or response from the source.
     *)

  selector: string option;
  (** 
    Either the version number or the label used to retrieve the parameter value. Specify selectors by using one of the following formats:
    
     parameter_name:version
     
      parameter_name:label
       *)

  version: int option;
  (** 
    The parameter version.
     *)

  value: string option;
  (** 
    The parameter value.
    
     If type is [StringList], the system returns a comma-separated string with no spaces between commas in the [Value] field.
     
      *)

  type_: parameter_type option;
  (** 
    The type of parameter. Valid values include the following: [String], [StringList], and [SecureString].
    
     If type is [StringList], the system returns a comma-separated string with no spaces between commas in the [Value] field.
     
      *)

  name: string option;
  (** 
    The name of the parameter.
     *)

}

(** 
    Information about parameter usage.
     *)
type parameter_history = {
  data_type: string option;
  (** 
    The data type of the parameter, such as [text] or [aws:ec2:image]. The default is [text].
     *)

  policies: parameter_inline_policy list option;
  (** 
    Information about the policies assigned to a parameter.
    
     {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-policies.html}Assigning parameter policies} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  tier: parameter_tier option;
  (** 
    The parameter tier.
     *)

  labels: string list option;
  (** 
    Labels assigned to the parameter version.
     *)

  version: int option;
  (** 
    The parameter version.
     *)

  allowed_pattern: string option;
  (** 
    Parameter names can include the following letters and symbols.
    
     a-zA-Z0-9_.-
      *)

  value: string option;
  (** 
    The parameter value.
     *)

  description: string option;
  (** 
    Information about the parameter.
     *)

  last_modified_user: string option;
  (** 
    Amazon Resource Name (ARN) of the Amazon Web Services user who last changed the parameter.
     *)

  last_modified_date: float option;
  (** 
    Date the parameter was last changed or updated.
     *)

  key_id: string option;
  (** 
    The alias of the Key Management Service (KMS) key used to encrypt the parameter. Applies to [SecureString] parameters only
     *)

  type_: parameter_type option;
  (** 
    The type of parameter used.
     *)

  name: string option;
  (** 
    The name of the parameter.
     *)

}

(** 
    Information about the source where the association execution details are stored.
     *)
type output_source = {
  output_source_type: string option;
  (** 
    The type of source where the association execution details are stored, for example, Amazon S3.
     *)

  output_source_id: string option;
  (** 
    The ID of the output source, for example the URL of an S3 bucket.
     *)

}

(** 
    The OpsItem data type to return.
     *)
type ops_result_attribute = {
  type_name: string;
  (** 
    Name of the data type. Valid value: [AWS:OpsItem], [AWS:EC2InstanceInformation], [AWS:OpsItemTrendline], or [AWS:ComplianceSummary].
     *)

}

(** 
    Operational metadata for an application in Application Manager.
     *)
type ops_metadata = {
  creation_date: float option;
  (** 
    The date the OpsMetadata objects was created.
     *)

  last_modified_user: string option;
  (** 
    The user name who last updated the OpsMetadata object.
     *)

  last_modified_date: float option;
  (** 
    The date the OpsMetadata object was last updated.
     *)

  ops_metadata_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the OpsMetadata Object or blob.
     *)

  resource_id: string option;
  (** 
    The ID of the Application Manager application.
     *)

}

(** 
    Your account reached the maximum number of OpsMetadata objects allowed by Application Manager. The maximum is 200 OpsMetadata objects. Delete one or more OpsMetadata object and try again.
     *)
type ops_metadata_limit_exceeded_exception = {
  message: string option;
  
}

(** 
    A filter to limit the number of OpsMetadata objects displayed.
     *)
type ops_metadata_filter = {
  values: string list;
  (** 
    A filter value.
     *)

  key: string;
  (** 
    A filter key.
     *)

}

(** 
    An OpsMetadata object already exists for the selected resource.
     *)
type ops_metadata_already_exists_exception = {
  message: string option;
  
}

(** 
    A count of OpsItems.
     *)
type ops_item_summary = {
  planned_end_time: float option;
  (** 
    The time specified in a change request for a runbook workflow to end. Currently supported only for the OpsItem type [/aws/changerequest].
     *)

  planned_start_time: float option;
  (** 
    The time specified in a change request for a runbook workflow to start. Currently supported only for the OpsItem type [/aws/changerequest].
     *)

  actual_end_time: float option;
  (** 
    The time a runbook workflow ended. Currently reported only for the OpsItem type [/aws/changerequest].
     *)

  actual_start_time: float option;
  (** 
    The time a runbook workflow started. Currently reported only for the OpsItem type [/aws/changerequest].
     *)

  ops_item_type: string option;
  (** 
    The type of OpsItem. Systems Manager supports the following types of OpsItems:
    
     {ul
          {- [/aws/issue]
             
              This type of OpsItem is used for default OpsItems created by OpsCenter.
              
              }
           {- [/aws/changerequest]
              
               This type of OpsItem is used by Change Manager for reviewing and approving or rejecting change requests.
               
               }
           {- [/aws/insight]
              
               This type of OpsItem is used by OpsCenter for aggregating and reporting on duplicate OpsItems.
               
               }
          
      }
       *)

  severity: string option;
  (** 
    A list of OpsItems by severity.
     *)

  category: string option;
  (** 
    A list of OpsItems by category.
     *)

  operational_data: (string * ops_item_data_value) list option;
  (** 
    Operational data is custom data that provides useful reference details about the OpsItem.
     *)

  title: string option;
  (** 
    A short heading that describes the nature of the OpsItem and the impacted resource.
     *)

  ops_item_id: string option;
  (** 
    The ID of the OpsItem.
     *)

  status: ops_item_status option;
  (** 
    The OpsItem status. Status can be [Open], [In Progress], or [Resolved].
     *)

  source: string option;
  (** 
    The impacted Amazon Web Services resource.
     *)

  priority: int option;
  (** 
    The importance of this OpsItem in relation to other OpsItems in the system.
     *)

  last_modified_time: float option;
  (** 
    The date and time the OpsItem was last updated.
     *)

  last_modified_by: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.
     *)

  created_time: float option;
  (** 
    The date and time the OpsItem was created.
     *)

  created_by: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem.
     *)

}

type ops_item_related_items_filter_key = | RESOURCE_URI
  | ASSOCIATION_ID
  | RESOURCE_TYPE

type ops_item_related_items_filter_operator = | EQUAL

(** 
    Describes a filter for a specific list of related-item resources.
     *)
type ops_item_related_items_filter = {
  operator: ops_item_related_items_filter_operator;
  (** 
    The operator used by the filter call. The only supported operator is [EQUAL].
     *)

  values: string list;
  (** 
    The values for the filter.
     *)

  key: ops_item_related_items_filter_key;
  (** 
    The name of the filter key. Supported values include [ResourceUri], [ResourceType], or [AssociationId].
     *)

}

(** 
    Information about the user or resource that created an OpsItem event.
     *)
type ops_item_identity = {
  arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM entity that created the OpsItem event.
     *)

}

(** 
    Summary information about related-item resources for an OpsItem.
     *)
type ops_item_related_item_summary = {
  last_modified_time: float option;
  (** 
    The time the related-item association was last updated.
     *)

  last_modified_by: ops_item_identity option;
  
  created_time: float option;
  (** 
    The time the related-item association was created.
     *)

  created_by: ops_item_identity option;
  
  resource_uri: string option;
  (** 
    The Amazon Resource Name (ARN) of the related-item resource.
     *)

  association_type: string option;
  (** 
    The association type.
     *)

  resource_type: string option;
  (** 
    The resource type.
     *)

  association_id: string option;
  (** 
    The association ID.
     *)

  ops_item_id: string option;
  (** 
    The OpsItem ID.
     *)

}

(** 
    The association wasn't found using the parameters you specified in the call. Verify the information and try again.
     *)
type ops_item_related_item_association_not_found_exception = {
  message: string option;
  
}

(** 
    The Amazon Resource Name (ARN) is already associated with the OpsItem.
     *)
type ops_item_related_item_already_exists_exception = {
  ops_item_id: string option;
  
  resource_uri: string option;
  
  message: string option;
  
}

type ops_item_filter_key = | ACCOUNT_ID
  | INSIGHT_TYPE
  | CHANGE_REQUEST_TARGETS_RESOURCE_GROUP
  | CHANGE_REQUEST_TEMPLATE
  | CHANGE_REQUEST_APPROVER_NAME
  | CHANGE_REQUEST_APPROVER_ARN
  | CHANGE_REQUEST_REQUESTER_NAME
  | CHANGE_REQUEST_REQUESTER_ARN
  | OPSITEM_TYPE
  | SEVERITY
  | CATEGORY
  | AUTOMATION_ID
  | RESOURCE_ID
  | OPERATIONAL_DATA_VALUE
  | OPERATIONAL_DATA_KEY
  | OPERATIONAL_DATA
  | PLANNED_END_TIME
  | PLANNED_START_TIME
  | ACTUAL_END_TIME
  | ACTUAL_START_TIME
  | LAST_MODIFIED_TIME
  | CREATED_TIME
  | OPSITEM_ID
  | TITLE
  | PRIORITY
  | SOURCE
  | CREATED_BY
  | STATUS

type ops_item_filter_operator = | LESS_THAN
  | GREATER_THAN
  | CONTAINS
  | EQUAL

(** 
    Describes an OpsItem filter.
     *)
type ops_item_filter = {
  operator: ops_item_filter_operator;
  (** 
    The operator used by the filter call.
     *)

  values: string list;
  (** 
    The filter value.
     *)

  key: ops_item_filter_key;
  (** 
    The name of the filter.
     *)

}

(** 
    Summary information about an OpsItem event or that associated an OpsItem with a related item.
     *)
type ops_item_event_summary = {
  created_time: float option;
  (** 
    The date and time the OpsItem event was created.
     *)

  created_by: ops_item_identity option;
  (** 
    Information about the user or resource that created the OpsItem event.
     *)

  detail: string option;
  (** 
    Specific information about the OpsItem event.
     *)

  detail_type: string option;
  (** 
    The type of information provided as a detail.
     *)

  source: string option;
  (** 
    The source of the OpsItem event.
     *)

  event_id: string option;
  (** 
    The ID of the OpsItem event.
     *)

  ops_item_id: string option;
  (** 
    The ID of the OpsItem.
     *)

}

type ops_item_event_filter_key = | OPSITEM_ID

type ops_item_event_filter_operator = | EQUAL

(** 
    Describes a filter for a specific list of OpsItem events. You can filter event information by using tags. You specify tags by using a key-value pair mapping.
     *)
type ops_item_event_filter = {
  operator: ops_item_event_filter_operator;
  (** 
    The operator used by the filter call. Currently, the only supported value is [Equal].
     *)

  values: string list;
  (** 
    The values for the filter, consisting of one or more OpsItem IDs.
     *)

  key: ops_item_event_filter_key;
  (** 
    The name of the filter key. Currently, the only supported value is [OpsItemId].
     *)

}

(** 
    Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational work items (OpsItems) impacting the performance and health of their Amazon Web Services resources. OpsCenter is integrated with Amazon EventBridge and Amazon CloudWatch. This means you can configure these services to automatically create an OpsItem in OpsCenter when a CloudWatch alarm enters the ALARM state or when EventBridge processes an event from any Amazon Web Services service that publishes events. Configuring Amazon CloudWatch alarms and EventBridge events to automatically create OpsItems allows you to quickly diagnose and remediate issues with Amazon Web Services resources from a single console.
    
     To help you diagnose issues, each OpsItem includes contextually relevant information such as the name and ID of the Amazon Web Services resource that generated the OpsItem, alarm or event details, alarm history, and an alarm timeline graph. For the Amazon Web Services resource, OpsCenter aggregates information from Config, CloudTrail logs, and EventBridge, so you don't have to navigate across multiple console pages during your investigation. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
      *)
type ops_item = {
  ops_item_arn: string option;
  (** 
    The OpsItem Amazon Resource Name (ARN).
     *)

  planned_end_time: float option;
  (** 
    The time specified in a change request for a runbook workflow to end. Currently supported only for the OpsItem type [/aws/changerequest].
     *)

  planned_start_time: float option;
  (** 
    The time specified in a change request for a runbook workflow to start. Currently supported only for the OpsItem type [/aws/changerequest].
     *)

  actual_end_time: float option;
  (** 
    The time a runbook workflow ended. Currently reported only for the OpsItem type [/aws/changerequest].
     *)

  actual_start_time: float option;
  (** 
    The time a runbook workflow started. Currently reported only for the OpsItem type [/aws/changerequest].
     *)

  severity: string option;
  (** 
    The severity of the OpsItem. Severity options range from 1 to 4.
     *)

  category: string option;
  (** 
    An OpsItem category. Category options include: Availability, Cost, Performance, Recovery, Security.
     *)

  operational_data: (string * ops_item_data_value) list option;
  (** 
    Operational data is custom data that provides useful reference details about the OpsItem. For example, you can specify log files, error strings, license keys, troubleshooting tips, or other relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128 characters. The value has a maximum size of 20 KB.
    
     Operational data keys {i can't} begin with the following: [amazon], [aws], [amzn], [ssm], [/amazon], [/aws], [/amzn], [/ssm].
     
      You can choose to make the data searchable by other users in the account or you can restrict search access. Searchable data means that all users with access to the OpsItem Overview page (as provided by the [DescribeOpsItems] API operation) can view and search on the specified data. Operational data that isn't searchable is only viewable by users who have access to the OpsItem (as provided by the [GetOpsItem] API operation).
      
       Use the [/aws/resources] key in OperationalData to specify a related resource in the request. Use the [/aws/automations] key in OperationalData to associate an Automation runbook with the OpsItem. To view Amazon Web Services CLI example commands that use these keys, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-manually-create-OpsItems.html}Creating OpsItems manually} in the {i Amazon Web Services Systems Manager User Guide}.
        *)

  source: string option;
  (** 
    The origin of the OpsItem, such as Amazon EC2 or Systems Manager. The impacted resource is a subset of source.
     *)

  title: string option;
  (** 
    A short heading that describes the nature of the OpsItem and the impacted resource.
     *)

  version: string option;
  (** 
    The version of this OpsItem. Each time the OpsItem is edited the version number increments by one.
     *)

  ops_item_id: string option;
  (** 
    The ID of the OpsItem.
     *)

  status: ops_item_status option;
  (** 
    The OpsItem status. Status can be [Open], [In Progress], or [Resolved]. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-working-with-OpsItems-editing-details.html}Editing OpsItem details} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  related_ops_items: related_ops_item list option;
  (** 
    One or more OpsItems that share something in common with the current OpsItem. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.
     *)

  priority: int option;
  (** 
    The importance of this OpsItem in relation to other OpsItems in the system.
     *)

  notifications: ops_item_notification list option;
  (** 
    The Amazon Resource Name (ARN) of an Amazon Simple Notification Service (Amazon SNS) topic where notifications are sent when this OpsItem is edited or changed.
     *)

  last_modified_time: float option;
  (** 
    The date and time the OpsItem was last updated.
     *)

  last_modified_by: string option;
  (** 
    The ARN of the Amazon Web Services account that last updated the OpsItem.
     *)

  description: string option;
  (** 
    The OpsItem description.
     *)

  created_time: float option;
  (** 
    The date and time the OpsItem was created.
     *)

  ops_item_type: string option;
  (** 
    The type of OpsItem. Systems Manager supports the following types of OpsItems:
    
     {ul
          {- [/aws/issue]
             
              This type of OpsItem is used for default OpsItems created by OpsCenter.
              
              }
           {- [/aws/changerequest]
              
               This type of OpsItem is used by Change Manager for reviewing and approving or rejecting change requests.
               
               }
           {- [/aws/insight]
              
               This type of OpsItem is used by OpsCenter for aggregating and reporting on duplicate OpsItems.
               
               }
          
      }
       *)

  created_by: string option;
  (** 
    The ARN of the Amazon Web Services account that created the OpsItem.
     *)

}

type ops_filter_operator_type = | EXISTS
  | GREATER_THAN
  | LESS_THAN
  | BEGIN_WITH
  | NOT_EQUAL
  | EQUAL

(** 
    A filter for viewing OpsData summaries.
     *)
type ops_filter = {
  type_: ops_filter_operator_type option;
  (** 
    The type of filter.
     *)

  values: string list;
  (** 
    The filter value.
     *)

  key: string;
  (** 
    The name of the filter.
     *)

}

(** 
    The OpsData summary.
     *)
type ops_entity_item = {
  content: (string * string) list list option;
  (** 
    The details of an OpsData summary.
     *)

  capture_time: string option;
  (** 
    The time the OpsData was captured.
     *)

}

(** 
    The result of the query.
     *)
type ops_entity = {
  data: (string * ops_entity_item) list option;
  (** 
    The data returned by the query.
     *)

  id: string option;
  (** 
    The query ID.
     *)

}

type ops_aggregator = {
  aggregators: ops_aggregator list option;
  (** 
    A nested aggregator for viewing counts of OpsData.
     *)

  filters: ops_filter list option;
  (** 
    The aggregator filters.
     *)

  values: (string * string) list option;
  (** 
    The aggregator value.
     *)

  attribute_name: string option;
  (** 
    The name of an OpsData attribute on which to limit the count of OpsData.
     *)

  type_name: string option;
  (** 
    The data type name to use for viewing counts of OpsData.
     *)

  aggregator_type: string option;
  (** 
    Either a [Range] or [Count] aggregator for limiting an OpsData summary.
     *)

}

type modify_document_permission_response = unit

type document_permission_type = | SHARE

type modify_document_permission_request = {
  shared_document_version: string option;
  (** 
    (Optional) The version of the document to share. If it isn't specified, the system choose the [Default] version to share.
     *)

  account_ids_to_remove: string list option;
  (** 
    The Amazon Web Services users that should no longer have access to the document. The Amazon Web Services user can either be a group of account IDs or {i All}. This action has a higher priority than [AccountIdsToAdd]. If you specify an ID to add and the same ID to remove, the system removes access to the document.
     *)

  account_ids_to_add: string list option;
  (** 
    The Amazon Web Services users that should have access to the document. The account IDs can either be a group of account IDs or {i All}.
     *)

  permission_type: document_permission_type;
  (** 
    The permission type for the document. The permission type can be {i Share}.
     *)

  name: string;
  (** 
    The name of the document that you want to share.
     *)

}

(** 
    The permission type isn't supported. {i Share} is the only supported permission type.
     *)
type invalid_permission_type = {
  message: string option;
  
}

(** 
    The document can't be shared with more Amazon Web Services accounts. You can specify a maximum of 20 accounts per API operation to share a private document.
    
     By default, you can share a private document with a maximum of 1,000 accounts and publicly share up to five documents.
     
      If you need to increase the quota for privately or publicly shared Systems Manager documents, contact Amazon Web Services Support.
       *)
type document_permission_limit = {
  message: string option;
  
}

(** 
    You can have at most 500 active SSM documents.
     *)
type document_limit_exceeded = {
  message: string option;
  
}

(** 
    The maintenance window to which the specified target belongs.
     *)
type maintenance_window_identity_for_target = {
  name: string option;
  (** 
    The name of the maintenance window.
     *)

  window_id: string option;
  (** 
    The ID of the maintenance window.
     *)

}

(** 
    Information about a task defined for a maintenance window.
     *)
type maintenance_window_task = {
  alarm_configuration: alarm_configuration option;
  (** 
    The details for the CloudWatch alarm applied to your maintenance window task.
     *)

  cutoff_behavior: maintenance_window_task_cutoff_behavior option;
  (** 
    The specification for whether tasks should continue to run after the cutoff time specified in the maintenance windows is reached.
     *)

  description: string option;
  (** 
    A description of the task.
     *)

  name: string option;
  (** 
    The task name.
     *)

  max_errors: string option;
  [@ocaml.doc {| 
    The maximum number of errors allowed before this task stops being scheduled.
    
     Although this element is listed as "Required: No", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.
     
      For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.
      
       |}]

  max_concurrency: string option;
  [@ocaml.doc {| 
    The maximum number of targets this task can be run for, in parallel.
    
     Although this element is listed as "Required: No", a value can be omitted only when you are registering or updating a {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}targetless task} You must provide a value in all other cases.
     
      For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1]. This value doesn't affect the running of your task.
      
       |}]

  service_role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for maintenance window Run Command tasks.
     *)

  logging_info: logging_info option;
  (** 
    Information about an S3 bucket to write task-level logs to.
    
     [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      *)

  priority: int option;
  (** 
    The priority of the task in the maintenance window. The lower the number, the higher the priority. Tasks that have the same priority are scheduled in parallel.
     *)

  task_parameters: (string * maintenance_window_task_parameter_value_expression) list option;
  (** 
    The parameters that should be passed to the task when it is run.
    
     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      *)

  targets: target list option;
  (** 
    The targets (either managed nodes or tags). Managed nodes are specified using 
    {[
    Key=instanceids,Values=,
    ]}
    . Tags are specified using 
    {[
    Key=,Values=
    ]}
    .
     *)

  type_: maintenance_window_task_type option;
  (** 
    The type of task.
     *)

  task_arn: string option;
  (** 
    The resource that the task uses during execution. For [RUN_COMMAND] and [AUTOMATION] task types, [TaskArn] is the Amazon Web Services Systems Manager (SSM document) name or ARN. For [LAMBDA] tasks, it's the function name or ARN. For [STEP_FUNCTIONS] tasks, it's the state machine ARN.
     *)

  window_task_id: string option;
  (** 
    The task ID.
     *)

  window_id: string option;
  (** 
    The ID of the maintenance window where the task is registered.
     *)

}

(** 
    The target registered with the maintenance window.
     *)
type maintenance_window_target = {
  description: string option;
  (** 
    A description for the target.
     *)

  name: string option;
  (** 
    The name for the maintenance window target.
     *)

  owner_information: string option;
  (** 
    A user-provided value that will be included in any Amazon CloudWatch Events events that are raised while running tasks for these targets in this maintenance window.
     *)

  targets: target list option;
  (** 
    The targets, either managed nodes or tags.
    
     Specify managed nodes using the following format:
     
      
      {[
      Key=instanceids,Values=,
      ]}
      
      
       Tags are specified using the following format:
       
        
        {[
        Key=,Values=
        ]}
        .
         *)

  resource_type: maintenance_window_resource_type option;
  (** 
    The type of target that is being registered with the maintenance window.
     *)

  window_target_id: string option;
  (** 
    The ID of the target.
     *)

  window_id: string option;
  (** 
    The ID of the maintenance window to register the target with.
     *)

}

(** 
    Information about the maintenance window.
     *)
type maintenance_window_identity = {
  next_execution_time: string option;
  (** 
    The next time the maintenance window will actually run, taking into account any specified times for the maintenance window to become active or inactive.
     *)

  start_date: string option;
  (** 
    The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become active.
     *)

  end_date: string option;
  (** 
    The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become inactive.
     *)

  schedule_offset: int option;
  (** 
    The number of days to wait to run a maintenance window after the scheduled cron expression date and time.
     *)

  schedule_timezone: string option;
  (** 
    The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format.
     *)

  schedule: string option;
  (** 
    The schedule of the maintenance window in the form of a cron or rate expression.
     *)

  cutoff: int option;
  (** 
    The number of hours before the end of the maintenance window that Amazon Web Services Systems Manager stops scheduling new tasks for execution.
     *)

  duration: int option;
  (** 
    The duration of the maintenance window in hours.
     *)

  enabled: bool option;
  (** 
    Indicates whether the maintenance window is enabled.
     *)

  description: string option;
  (** 
    A description of the maintenance window.
     *)

  name: string option;
  (** 
    The name of the maintenance window.
     *)

  window_id: string option;
  (** 
    The ID of the maintenance window.
     *)

}

(** 
    Filter used in the request. Supported filter keys depend on the API operation that includes the filter. API operations that use [MaintenanceWindowFilter>] include the following:
    
     {ul
          {- [DescribeMaintenanceWindowExecutions]
             
             }
           {- [DescribeMaintenanceWindowExecutionTaskInvocations]
              
              }
           {- [DescribeMaintenanceWindowExecutionTasks]
              
              }
           {- [DescribeMaintenanceWindows]
              
              }
           {- [DescribeMaintenanceWindowTargets]
              
              }
           {- [DescribeMaintenanceWindowTasks]
              
              }
          
      }
       *)
type maintenance_window_filter = {
  values: string list option;
  (** 
    The filter values.
     *)

  key: string option;
  (** 
    The name of the filter.
     *)

}

type maintenance_window_execution_status = | SkippedOverlapping
  | Cancelled
  | Cancelling
  | TimedOut
  | Failed
  | Success
  | InProgress
  | Pending

(** 
    Describes the information about a task invocation for a particular target as part of a task execution performed as part of a maintenance window execution.
     *)
type maintenance_window_execution_task_invocation_identity = {
  window_target_id: string option;
  (** 
    The ID of the target definition in this maintenance window the invocation was performed for.
     *)

  owner_information: string option;
  (** 
    User-provided value that was specified when the target was registered with the maintenance window. This was also included in any Amazon CloudWatch Events events raised during the task invocation.
     *)

  end_time: float option;
  (** 
    The time the invocation finished.
     *)

  start_time: float option;
  (** 
    The time the invocation started.
     *)

  status_details: string option;
  (** 
    The details explaining the status of the task invocation. Not available for all status values.
     *)

  status: maintenance_window_execution_status option;
  (** 
    The status of the task invocation.
     *)

  parameters: string option;
  (** 
    The parameters that were provided for the invocation when it was run.
     *)

  task_type: maintenance_window_task_type option;
  (** 
    The task type.
     *)

  execution_id: string option;
  (** 
    The ID of the action performed in the service that actually handled the task invocation. If the task type is [RUN_COMMAND], this value is the command ID.
     *)

  invocation_id: string option;
  (** 
    The ID of the task invocation.
     *)

  task_execution_id: string option;
  (** 
    The ID of the specific task execution in the maintenance window execution.
     *)

  window_execution_id: string option;
  (** 
    The ID of the maintenance window execution that ran the task.
     *)

}

(** 
    Information about a task execution performed as part of a maintenance window execution.
     *)
type maintenance_window_execution_task_identity = {
  triggered_alarms: alarm_state_information list option;
  (** 
    The CloudWatch alarm that was invoked by the maintenance window task.
     *)

  alarm_configuration: alarm_configuration option;
  (** 
    The details for the CloudWatch alarm applied to your maintenance window task.
     *)

  task_type: maintenance_window_task_type option;
  (** 
    The type of task that ran.
     *)

  task_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the task that ran.
     *)

  end_time: float option;
  (** 
    The time the task execution finished.
     *)

  start_time: float option;
  (** 
    The time the task execution started.
     *)

  status_details: string option;
  (** 
    The details explaining the status of the task execution. Not available for all status values.
     *)

  status: maintenance_window_execution_status option;
  (** 
    The status of the task execution.
     *)

  task_execution_id: string option;
  (** 
    The ID of the specific task execution in the maintenance window execution.
     *)

  window_execution_id: string option;
  (** 
    The ID of the maintenance window execution that ran the task.
     *)

}

(** 
    Describes the information about an execution of a maintenance window.
     *)
type maintenance_window_execution = {
  end_time: float option;
  (** 
    The time the execution finished.
     *)

  start_time: float option;
  (** 
    The time the execution started.
     *)

  status_details: string option;
  (** 
    The details explaining the status. Not available for all status values.
     *)

  status: maintenance_window_execution_status option;
  (** 
    The status of the execution.
     *)

  window_execution_id: string option;
  (** 
    The ID of the maintenance window execution.
     *)

  window_id: string option;
  (** 
    The ID of the maintenance window.
     *)

}

type list_tags_for_resource_result = {
  tag_list: tag list option;
  (** 
    A list of tags.
     *)

}

type list_tags_for_resource_request = {
  resource_id: string;
  (** 
    The resource ID for which you want to see a list of tags.
     *)

  resource_type: resource_type_for_tagging;
  (** 
    Returns a list of tags for a specific resource type.
     *)

}

type list_resource_data_sync_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  resource_data_sync_items: resource_data_sync_item list option;
  (** 
    A list of your current resource data sync configurations and their statuses.
     *)

}

type list_resource_data_sync_request = {
  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  sync_type: string option;
  (** 
    View a list of resource data syncs according to the sync type. Specify [SyncToDestination] to view resource data syncs that synchronize data to an Amazon S3 bucket. Specify [SyncFromSource] to view resource data syncs from Organizations or from multiple Amazon Web Services Regions.
     *)

}

(** 
    The specified token isn't valid.
     *)
type invalid_next_token = {
  message: string option;
  
}

type list_resource_compliance_summaries_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  resource_compliance_summary_items: resource_compliance_summary_item list option;
  (** 
    A summary count for specified or targeted managed nodes. Summary count includes information about compliant and non-compliant State Manager associations, patch status, or custom items according to the filter criteria that you specify.
     *)

}

type compliance_query_operator_type = | GreaterThan
  | LessThan
  | BeginWith
  | NotEqual
  | Equal

(** 
    One or more filters. Use a filter to return a more specific list of results.
     *)
type compliance_string_filter = {
  type_: compliance_query_operator_type option;
  (** 
    The type of comparison that should be performed for the value: Equal, NotEqual, BeginWith, LessThan, or GreaterThan.
     *)

  values: string list option;
  (** 
    The value for which to search.
     *)

  key: string option;
  (** 
    The name of the filter.
     *)

}

type list_resource_compliance_summaries_request = {
  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  filters: compliance_string_filter list option;
  (** 
    One or more filters. Use a filter to return a more specific list of results.
     *)

}

(** 
    The filter name isn't valid. Verify the you entered the correct name and try again.
     *)
type invalid_filter = {
  message: string option;
  
}

type list_ops_metadata_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  ops_metadata_list: ops_metadata list option;
  (** 
    Returns a list of OpsMetadata objects.
     *)

}

type list_ops_metadata_request = {
  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: ops_metadata_filter list option;
  (** 
    One or more filters to limit the number of OpsMetadata objects returned by the call.
     *)

}

type list_ops_item_related_items_response = {
  summaries: ops_item_related_item_summary list option;
  (** 
    A list of related-item resources for the specified OpsItem.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

}

type list_ops_item_related_items_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: ops_item_related_items_filter list option;
  (** 
    One or more OpsItem filters. Use a filter to return a more specific list of results.
     *)

  ops_item_id: string option;
  (** 
    The ID of the OpsItem for which you want to list all related-item resources.
     *)

}

type list_ops_item_events_response = {
  summaries: ops_item_event_summary list option;
  (** 
    A list of event information for the specified OpsItems.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

}

type list_ops_item_events_request = {
  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: ops_item_event_filter list option;
  (** 
    One or more OpsItem filters. Use a filter to return a more specific list of results.
     *)

}

type list_inventory_entries_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  entries: (string * string) list list option;
  (** 
    A list of inventory items on the managed nodes.
     *)

  capture_time: string option;
  (** 
    The time that inventory information was collected for the managed nodes.
     *)

  schema_version: string option;
  (** 
    The inventory schema version used by the managed nodes.
     *)

  instance_id: string option;
  (** 
    The managed node ID targeted by the request to query inventory information.
     *)

  type_name: string option;
  (** 
    The type of inventory item returned by the request.
     *)

}

type inventory_query_operator_type = | EXISTS
  | GREATER_THAN
  | LESS_THAN
  | BEGIN_WITH
  | NOT_EQUAL
  | EQUAL

(** 
    One or more filters. Use a filter to return a more specific list of results.
     *)
type inventory_filter = {
  type_: inventory_query_operator_type option;
  (** 
    The type of filter.
    
     The [Exists] filter must be used with aggregators. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-aggregate.html}Aggregating inventory data} in the {i Amazon Web Services Systems Manager User Guide}.
     
      *)

  values: string list;
  (** 
    Inventory filter values. Example: inventory filter where managed node IDs are specified as values [Key=AWS:InstanceInformation.InstanceId,Values= i-a12b3c4d5e6g,
    i-1a2b3c4d5e6,Type=Equal].
     *)

  key: string;
  (** 
    The name of the filter key.
     *)

}

type list_inventory_entries_request = {
  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  filters: inventory_filter list option;
  (** 
    One or more filters. Use a filter to return a more specific list of results.
     *)

  type_name: string;
  (** 
    The type of inventory item for which you want information.
     *)

  instance_id: string;
  (** 
    The managed node ID for which you want inventory information.
     *)

}

(** 
    Describes the name of a SSM document.
     *)
type document_identifier = {
  author: string option;
  (** 
    The user in your organization who created the document.
     *)

  review_status: review_status option;
  (** 
    The current status of a document review.
     *)

  requires: document_requires list option;
  (** 
    A list of SSM documents required by a document. For example, an [ApplicationConfiguration] document requires an [ApplicationConfigurationSchema] document.
     *)

  tags: tag list option;
  (** 
    The tags, or metadata, that have been applied to the document.
     *)

  target_type: string option;
  (** 
    The target type which defines the kinds of resources the document can run on. For example, [/AWS::EC2::Instance]. For a list of valid resource types, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the {i CloudFormation User Guide}.
     *)

  document_format: document_format option;
  (** 
    The document format, either JSON or YAML.
     *)

  schema_version: string option;
  (** 
    The schema version.
     *)

  document_type: document_type option;
  (** 
    The document type.
     *)

  document_version: string option;
  (** 
    The document version.
     *)

  platform_types: platform_type list option;
  (** 
    The operating system platform.
     *)

  version_name: string option;
  (** 
    An optional field specifying the version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.
     *)

  owner: string option;
  (** 
    The Amazon Web Services user that created the document.
     *)

  display_name: string option;
  (** 
    An optional field where you can specify a friendly name for the SSM document. This value can differ for each version of the document. If you want to update this value, see [UpdateDocument].
     *)

  created_date: float option;
  (** 
    The date the SSM document was created.
     *)

  name: string option;
  (** 
    The name of the SSM document.
     *)

}

type list_documents_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  document_identifiers: document_identifier list option;
  (** 
    The names of the SSM documents.
     *)

}

type document_filter_key = | DocumentType
  | PlatformTypes
  | Owner
  | Name

(** 
    This data type is deprecated. Instead, use [DocumentKeyValuesFilter].
     *)
type document_filter = {
  value: string;
  (** 
    The value of the filter.
     *)

  key: document_filter_key;
  (** 
    The name of the filter.
     *)

}

(** 
    One or more filters. Use a filter to return a more specific list of documents.
    
     For keys, you can specify one or more tags that have been applied to a document.
     
      You can also use Amazon Web Services-provided keys, some of which have specific allowed values. These keys and their associated values are as follows:
      
       DocumentType {ul
                         {- [ApplicationConfiguration]
                            
                            }
                          {- [ApplicationConfigurationSchema]
                             
                             }
                          {- [Automation]
                             
                             }
                          {- [ChangeCalendar]
                             
                             }
                          {- [Command]
                             
                             }
                          {- [Package]
                             
                             }
                          {- [Policy]
                             
                             }
                          {- [Session]
                             
                             }
                         
      }
       Owner Note that only one [Owner] can be specified in a request. For example: [Key=Owner,Values=Self].
             
              {ul
                   {- [Amazon]
                      
                      }
                    {- [Private]
                       
                       }
                    {- [Public]
                       
                       }
                    {- [Self]
                       
                       }
                    {- [ThirdParty]
                       
                       }
                   
      }
       PlatformTypes {ul
                          {- [Linux]
                             
                             }
                           {- [Windows]
                              
                              }
                          
      }
       [Name] is another Amazon Web Services-provided key. If you use [Name] as a key, you can use a name prefix to return a list of documents. For example, in the Amazon Web Services CLI, to return a list of all documents that begin with [Te], run the following command:
       
        [aws ssm list-documents --filters Key=Name,Values=Te]
        
         You can also use the [TargetType] Amazon Web Services-provided key. For a list of valid resource type values that can be used with this key, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the {i CloudFormation User Guide}.
         
          If you specify more than two keys, only documents that are identified by all the tags are returned in the results. If you specify more than two values for a key, documents that are identified by any of the values are returned in the results.
          
           To specify a custom key-value pair, use the format [Key=tag:tagName,Values=valueName].
           
            For example, if you created a key called region and are using the Amazon Web Services CLI to call the [list-documents] command:
            
             [aws ssm list-documents --filters Key=tag:region,Values=east,west
    Key=Owner,Values=Self]
              *)
type document_key_values_filter = {
  values: string list option;
  (** 
    The value for the filter key.
     *)

  key: string option;
  (** 
    The name of the filter key.
     *)

}

type list_documents_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: document_key_values_filter list option;
  (** 
    One or more [DocumentKeyValuesFilter] objects. Use a filter to return a more specific list of results. For keys, you can specify one or more key-value pair tags that have been applied to a document. Other valid keys include [Owner], [Name], [PlatformTypes], [DocumentType], and [TargetType]. For example, to return documents you own use [Key=Owner,Values=Self]. To specify a custom key-value pair, use the format [Key=tag:tagName,Values=valueName].
    
     This API operation only supports filtering documents by using a single tag key and one or more tag values. For example: [Key=tag:tagName,Values=valueName1,valueName2]
     
      *)

  document_filter_list: document_filter list option;
  (** 
    This data type is deprecated. Instead, use [Filters].
     *)

}

(** 
    The specified key isn't valid.
     *)
type invalid_filter_key = unit

(** 
    Version information about the document.
     *)
type document_version_info = {
  review_status: review_status option;
  (** 
    The current status of the approval review for the latest version of the document.
     *)

  status_information: string option;
  [@ocaml.doc {| 
    A message returned by Amazon Web Services Systems Manager that explains the [Status] value. For example, a [Failed] status might be explained by the [StatusInformation] message, "The specified S3 bucket doesn't exist. Verify that the URL of the S3 bucket is correct."
     |}]

  status: document_status option;
  (** 
    The status of the SSM document, such as [Creating], [Active], [Failed], and [Deleting].
     *)

  document_format: document_format option;
  (** 
    The document format, either JSON or YAML.
     *)

  is_default_version: bool option;
  (** 
    An identifier for the default version of the document.
     *)

  created_date: float option;
  (** 
    The date the document was created.
     *)

  version_name: string option;
  (** 
    The version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.
     *)

  document_version: string option;
  (** 
    The document version.
     *)

  display_name: string option;
  (** 
    The friendly name of the SSM document. This value can differ for each version of the document. If you want to update this value, see [UpdateDocument].
     *)

  name: string option;
  (** 
    The document name.
     *)

}

type list_document_versions_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  document_versions: document_version_info list option;
  (** 
    The document versions.
     *)

}

type list_document_versions_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  name: string;
  (** 
    The name of the document. You can specify an Amazon Resource Name (ARN).
     *)

}

(** 
    Information about a reviewer's response to a document review request.
     *)
type document_reviewer_response_source = {
  reviewer: string option;
  (** 
    The user in your organization assigned to review a document request.
     *)

  comment: document_review_comment_source list option;
  (** 
    The comment entered by a reviewer as part of their document review response.
     *)

  review_status: review_status option;
  (** 
    The current review status of a new custom SSM document created by a member of your organization, or of the latest version of an existing SSM document.
    
     Only one version of a document can be in the APPROVED state at a time. When a new version is approved, the status of the previous version changes to REJECTED.
     
      Only one version of a document can be in review, or PENDING, at a time.
       *)

  updated_time: float option;
  (** 
    The date and time that a reviewer last updated a response to a document review request.
     *)

  create_time: float option;
  (** 
    The date and time that a reviewer entered a response to a document review request.
     *)

}

(** 
    Details about the response to a document review request.
     *)
type document_metadata_response_info = {
  reviewer_response: document_reviewer_response_source list option;
  (** 
    Details about a reviewer's response to a document review request.
     *)

}

type list_document_metadata_history_response = {
  next_token: string option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  metadata: document_metadata_response_info option;
  (** 
    Information about the response to the change template approval request.
     *)

  author: string option;
  (** 
    The user ID of the person in the organization who requested the review of the change template.
     *)

  document_version: string option;
  (** 
    The version of the change template.
     *)

  name: string option;
  (** 
    The name of the change template.
     *)

}

type document_metadata_enum = | DocumentReviews

type list_document_metadata_history_request = {
  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  metadata: document_metadata_enum;
  (** 
    The type of data for which details are being requested. Currently, the only supported value is [DocumentReviews].
     *)

  document_version: string option;
  (** 
    The version of the change template.
     *)

  name: string;
  (** 
    The name of the change template.
     *)

}

(** 
    A summary of compliance information by compliance type.
     *)
type compliance_summary_item = {
  non_compliant_summary: non_compliant_summary option;
  (** 
    A list of NON_COMPLIANT items for the specified compliance type.
     *)

  compliant_summary: compliant_summary option;
  (** 
    A list of COMPLIANT items for the specified compliance type.
     *)

  compliance_type: string option;
  (** 
    The type of compliance item. For example, the compliance type can be Association, Patch, or Custom:string.
     *)

}

type list_compliance_summaries_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  compliance_summary_items: compliance_summary_item list option;
  (** 
    A list of compliant and non-compliant summary counts based on compliance types. For example, this call returns State Manager associations, patches, or custom compliance types according to the filter criteria that you specified.
     *)

}

type list_compliance_summaries_request = {
  max_results: int option;
  (** 
    The maximum number of items to return for this call. Currently, you can specify null or 50. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  filters: compliance_string_filter list option;
  (** 
    One or more compliance or inventory filters. Use a filter to return a more specific list of results.
     *)

}

(** 
    Information about the compliance as defined by the resource type. For example, for a patch resource type, [Items] includes information about the PatchSeverity, Classification, and so on.
     *)
type compliance_item = {
  details: (string * string) list option;
  [@ocaml.doc {| 
    A "Key": "Value" tag combination for the compliance item.
     |}]

  execution_summary: compliance_execution_summary option;
  (** 
    A summary for the compliance item. The summary includes an execution ID, the execution type (for example, command), and the execution time.
     *)

  severity: compliance_severity option;
  (** 
    The severity of the compliance status. Severity can be one of the following: Critical, High, Medium, Low, Informational, Unspecified.
     *)

  status: compliance_status option;
  (** 
    The status of the compliance item. An item is either COMPLIANT, NON_COMPLIANT, or an empty string (for Windows patches that aren't applicable).
     *)

  title: string option;
  (** 
    A title for the compliance item. For example, if the compliance item is a Windows patch, the title could be the title of the KB article for the patch; for example: Security Update for Active Directory Federation Services.
     *)

  id: string option;
  (** 
    An ID for the compliance item. For example, if the compliance item is a Windows patch, the ID could be the number of the KB article; for example: KB4010320.
     *)

  resource_id: string option;
  (** 
    An ID for the resource. For a managed node, this is the node ID.
     *)

  resource_type: string option;
  (** 
    The type of resource. [ManagedInstance] is currently the only supported resource type.
     *)

  compliance_type: string option;
  (** 
    The compliance type. For example, Association (for a State Manager association), Patch, or Custom:[string] are all valid compliance types.
     *)

}

type list_compliance_items_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  compliance_items: compliance_item list option;
  (** 
    A list of compliance information for the specified resource ID.
     *)

}

type list_compliance_items_request = {
  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  resource_types: string list option;
  (** 
    The type of resource from which to get compliance information. Currently, the only supported resource type is [ManagedInstance].
     *)

  resource_ids: string list option;
  (** 
    The ID for the resources from which to get compliance information. Currently, you can only specify one resource ID.
     *)

  filters: compliance_string_filter list option;
  (** 
    One or more compliance filters. Use a filter to return a more specific list of results.
     *)

}

type list_commands_result = {
  next_token: string option;
  (** 
    (Optional) The token for the next set of items to return. (You received this token from a previous call.)
     *)

  commands: command list option;
  (** 
    (Optional) The list of commands requested by the user.
     *)

}

type command_filter_key = | DOCUMENT_NAME
  | EXECUTION_STAGE
  | STATUS
  | INVOKED_BEFORE
  | INVOKED_AFTER

(** 
    Describes a command filter.
    
     A managed node ID can't be specified when a command status is [Pending] because the command hasn't run on the node yet.
     
      *)
type command_filter = {
  value: string;
  (** 
    The filter value. Valid values for each filter key are as follows:
    
     {ul
          {- {b InvokedAfter}: Specify a timestamp to limit your results. For example, specify [2021-07-07T00:00:00Z] to see a list of command executions occurring July 7, 2021, and later.
             
             }
           {- {b InvokedBefore}: Specify a timestamp to limit your results. For example, specify [2021-07-07T00:00:00Z] to see a list of command executions from before July 7, 2021.
              
              }
           {- {b Status}: Specify a valid command status to see a list of all command executions with that status. The status choices depend on the API you call.
              
               The status values you can specify for [ListCommands] are:
               
                {ul
                     {- [Pending]
                        
                        }
                      {- [InProgress]
                         
                         }
                      {- [Success]
                         
                         }
                      {- [Cancelled]
                         
                         }
                      {- [Failed]
                         
                         }
                      {- [TimedOut] (this includes both Delivery and Execution time outs)
                         
                         }
                      {- [AccessDenied]
                         
                         }
                      {- [DeliveryTimedOut]
                         
                         }
                      {- [ExecutionTimedOut]
                         
                         }
                      {- [Incomplete]
                         
                         }
                      {- [NoInstancesInTag]
                         
                         }
                      {- [LimitExceeded]
                         
                         }
                     
            }
             The status values you can specify for [ListCommandInvocations] are:
             
              {ul
                   {- [Pending]
                      
                      }
                    {- [InProgress]
                       
                       }
                    {- [Delayed]
                       
                       }
                    {- [Success]
                       
                       }
                    {- [Cancelled]
                       
                       }
                    {- [Failed]
                       
                       }
                    {- [TimedOut] (this includes both Delivery and Execution time outs)
                       
                       }
                    {- [AccessDenied]
                       
                       }
                    {- [DeliveryTimedOut]
                       
                       }
                    {- [ExecutionTimedOut]
                       
                       }
                    {- [Undeliverable]
                       
                       }
                    {- [InvalidPlatform]
                       
                       }
                    {- [Terminated]
                       
                       }
                   
            }
            }
           {- {b DocumentName}: Specify name of the Amazon Web Services Systems Manager document (SSM document) for which you want to see command execution results. For example, specify [AWS-RunPatchBaseline] to see command executions that used this SSM document to perform security patching operations on managed nodes.
              
              }
           {- {b ExecutionStage}: Specify one of the following values ([ListCommands] operations only):
              
               {ul
                    {- [Executing]: Returns a list of command executions that are currently still running.
                       
                       }
                     {- [Complete]: Returns a list of command executions that have already completed.
                        
                        }
                    
            }
            }
          
      }
       *)

  key: command_filter_key;
  (** 
    The name of the filter.
    
     The [ExecutionStage] filter can't be used with the [ListCommandInvocations] operation, only with [ListCommands].
     
      *)

}

type list_commands_request = {
  filters: command_filter list option;
  (** 
    (Optional) One or more filters. Use a filter to return a more specific list of results.
     *)

  next_token: string option;
  (** 
    (Optional) The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    (Optional) The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  instance_id: string option;
  (** 
    (Optional) Lists commands issued against this managed node ID.
    
     You can't specify a managed node ID in the same command that you specify [Status] = [Pending]. This is because the command hasn't reached the managed node yet.
     
      *)

  command_id: string option;
  (** 
    (Optional) If provided, lists only the specified command.
     *)

}

(** 
    The specified command ID isn't valid. Verify the ID and try again.
     *)
type invalid_command_id = unit

type command_invocation_status = | CANCELLING
  | FAILED
  | TIMED_OUT
  | CANCELLED
  | SUCCESS
  | DELAYED
  | IN_PROGRESS
  | PENDING

type command_plugin_status = | FAILED
  | CANCELLED
  | TIMED_OUT
  | SUCCESS
  | IN_PROGRESS
  | PENDING

(** 
    Describes plugin details.
     *)
type command_plugin = {
  output_s3_key_prefix: string option;
  (** 
    The S3 directory path inside the bucket where the responses to the command executions should be stored. This was requested when issuing the command. For example, in the following response:
    
     [doc-example-bucket/ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix/i-02573cafcfEXAMPLE/awsrunShellScript]
     
      [doc-example-bucket] is the name of the S3 bucket;
      
       [ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix] is the name of the S3 prefix;
       
        [i-02573cafcfEXAMPLE] is the managed node ID;
        
         [awsrunShellScript] is the name of the plugin.
          *)

  output_s3_bucket_name: string option;
  (** 
    The S3 bucket where the responses to the command executions should be stored. This was requested when issuing the command. For example, in the following response:
    
     [doc-example-bucket/ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix/i-02573cafcfEXAMPLE/awsrunShellScript]
     
      [doc-example-bucket] is the name of the S3 bucket;
      
       [ab19cb99-a030-46dd-9dfc-8eSAMPLEPre-Fix] is the name of the S3 prefix;
       
        [i-02573cafcfEXAMPLE] is the managed node ID;
        
         [awsrunShellScript] is the name of the plugin.
          *)

  output_s3_region: string option;
  (** 
    (Deprecated) You can no longer specify this parameter. The system ignores it. Instead, Amazon Web Services Systems Manager automatically determines the S3 bucket region.
     *)

  standard_error_url: string option;
  (** 
    The URL for the complete text written by the plugin to stderr. If execution isn't yet complete, then this string is empty.
     *)

  standard_output_url: string option;
  (** 
    The URL for the complete text written by the plugin to stdout in Amazon S3. If the S3 bucket for the command wasn't specified, then this string is empty.
     *)

  output: string option;
  (** 
    Output of the plugin execution.
     *)

  response_finish_date_time: float option;
  (** 
    The time the plugin stopped running. Could stop prematurely if, for example, a cancel command was sent.
     *)

  response_start_date_time: float option;
  (** 
    The time the plugin started running.
     *)

  response_code: int option;
  (** 
    A numeric response code generated after running the plugin.
     *)

  status_details: string option;
  (** 
    A detailed status of the plugin execution. [StatusDetails] includes more information than Status because it includes states resulting from error and concurrency control parameters. StatusDetails can show different results than Status. For more information about these statuses, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html}Understanding command statuses} in the {i Amazon Web Services Systems Manager User Guide}. StatusDetails can be one of the following values:
    
     {ul
          {- Pending: The command hasn't been sent to the managed node.
             
             }
           {- In Progress: The command has been sent to the managed node but hasn't reached a terminal state.
              
              }
           {- Success: The execution of the command or plugin was successfully completed. This is a terminal state.
              
              }
           {- Delivery Timed Out: The command wasn't delivered to the managed node before the delivery timeout expired. Delivery timeouts don't count against the parent command's [MaxErrors] limit, but they do contribute to whether the parent command status is Success or Incomplete. This is a terminal state.
              
              }
           {- Execution Timed Out: Command execution started on the managed node, but the execution wasn't complete before the execution timeout expired. Execution timeouts count against the [MaxErrors] limit of the parent command. This is a terminal state.
              
              }
           {- Failed: The command wasn't successful on the managed node. For a plugin, this indicates that the result code wasn't zero. For a command invocation, this indicates that the result code for one or more plugins wasn't zero. Invocation failures count against the MaxErrors limit of the parent command. This is a terminal state.
              
              }
           {- Cancelled: The command was terminated before it was completed. This is a terminal state.
              
              }
           {- Undeliverable: The command can't be delivered to the managed node. The managed node might not exist, or it might not be responding. Undeliverable invocations don't count against the parent command's MaxErrors limit, and they don't contribute to whether the parent command status is Success or Incomplete. This is a terminal state.
              
              }
           {- Terminated: The parent command exceeded its MaxErrors limit and subsequent command invocations were canceled by the system. This is a terminal state.
              
              }
          
      }
       *)

  status: command_plugin_status option;
  (** 
    The status of this plugin. You can run a document with multiple plugins.
     *)

  name: string option;
  (** 
    The name of the plugin. Must be one of the following: [aws:updateAgent], [aws:domainjoin], [aws:applications], [aws:runPowerShellScript], [aws:psmodule], [aws:cloudWatch], [aws:runShellScript], or [aws:updateSSMAgent].
     *)

}

(** 
    An invocation is a copy of a command sent to a specific managed node. A command can apply to one or more managed nodes. A command invocation applies to one managed node. For example, if a user runs [SendCommand] against three managed nodes, then a command invocation is created for each requested managed node ID. A command invocation returns status and detail information about a command you ran.
     *)
type command_invocation = {
  cloud_watch_output_config: cloud_watch_output_config option;
  (** 
    Amazon CloudWatch Logs information where you want Amazon Web Services Systems Manager to send the command output.
     *)

  notification_config: notification_config option;
  (** 
    Configurations for sending notifications about command status changes on a per managed node basis.
     *)

  service_role: string option;
  (** 
    The Identity and Access Management (IAM) service role that Run Command, a capability of Amazon Web Services Systems Manager, uses to act on your behalf when sending notifications about command status changes on a per managed node basis.
     *)

  command_plugins: command_plugin list option;
  (** 
    Plugins processed by the command.
     *)

  standard_error_url: string option;
  (** 
    The URL to the plugin's StdErr file in Amazon Simple Storage Service (Amazon S3), if the S3 bucket was defined for the parent command. For an invocation, [StandardErrorUrl] is populated if there is just one plugin defined for the command, and the S3 bucket was defined for the command.
     *)

  standard_output_url: string option;
  (** 
    The URL to the plugin's StdOut file in Amazon Simple Storage Service (Amazon S3), if the S3 bucket was defined for the parent command. For an invocation, [StandardOutputUrl] is populated if there is just one plugin defined for the command, and the S3 bucket was defined for the command.
     *)

  trace_output: string option;
  (** 
    Gets the trace output sent by the agent.
     *)

  status_details: string option;
  (** 
    A detailed status of the command execution for each invocation (each managed node targeted by the command). StatusDetails includes more information than Status because it includes states resulting from error and concurrency control parameters. StatusDetails can show different results than Status. For more information about these statuses, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html}Understanding command statuses} in the {i Amazon Web Services Systems Manager User Guide}. StatusDetails can be one of the following values:
    
     {ul
          {- Pending: The command hasn't been sent to the managed node.
             
             }
           {- In Progress: The command has been sent to the managed node but hasn't reached a terminal state.
              
              }
           {- Success: The execution of the command or plugin was successfully completed. This is a terminal state.
              
              }
           {- Delivery Timed Out: The command wasn't delivered to the managed node before the delivery timeout expired. Delivery timeouts don't count against the parent command's [MaxErrors] limit, but they do contribute to whether the parent command status is Success or Incomplete. This is a terminal state.
              
              }
           {- Execution Timed Out: Command execution started on the managed node, but the execution wasn't complete before the execution timeout expired. Execution timeouts count against the [MaxErrors] limit of the parent command. This is a terminal state.
              
              }
           {- Failed: The command wasn't successful on the managed node. For a plugin, this indicates that the result code wasn't zero. For a command invocation, this indicates that the result code for one or more plugins wasn't zero. Invocation failures count against the [MaxErrors] limit of the parent command. This is a terminal state.
              
              }
           {- Cancelled: The command was terminated before it was completed. This is a terminal state.
              
              }
           {- Undeliverable: The command can't be delivered to the managed node. The managed node might not exist or might not be responding. Undeliverable invocations don't count against the parent command's MaxErrors limit and don't contribute to whether the parent command status is Success or Incomplete. This is a terminal state.
              
              }
           {- Terminated: The parent command exceeded its MaxErrors limit and subsequent command invocations were canceled by the system. This is a terminal state.
              
              }
           {- Delayed: The system attempted to send the command to the managed node but wasn't successful. The system retries again.
              
              }
          
      }
       *)

  status: command_invocation_status option;
  (** 
    Whether or not the invocation succeeded, failed, or is pending.
     *)

  requested_date_time: float option;
  (** 
    The time and date the request was sent to this managed node.
     *)

  document_version: string option;
  (** 
    The Systems Manager document (SSM document) version.
     *)

  document_name: string option;
  (** 
    The document name that was requested for execution.
     *)

  comment: string option;
  (** 
    User-specified information about the command, such as a brief description of what the command should do.
     *)

  instance_name: string option;
  (** 
    The fully qualified host name of the managed node.
     *)

  instance_id: string option;
  (** 
    The managed node ID in which this invocation was requested.
     *)

  command_id: string option;
  (** 
    The command against which this invocation was requested.
     *)

}

type list_command_invocations_result = {
  next_token: string option;
  (** 
    (Optional) The token for the next set of items to return. (You received this token from a previous call.)
     *)

  command_invocations: command_invocation list option;
  (** 
    (Optional) A list of all invocations.
     *)

}

type list_command_invocations_request = {
  details: bool option;
  (** 
    (Optional) If set this returns the response of the command executions and any command output. The default value is [false].
     *)

  filters: command_filter list option;
  (** 
    (Optional) One or more filters. Use a filter to return a more specific list of results.
     *)

  next_token: string option;
  (** 
    (Optional) The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    (Optional) The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  instance_id: string option;
  (** 
    (Optional) The command execution details for a specific managed node ID.
     *)

  command_id: string option;
  (** 
    (Optional) The invocations for a specific command ID.
     *)

}

(** 
    Describes an association of a Amazon Web Services Systems Manager document (SSM document) and a managed node.
     *)
type association = {
  target_maps: (string * string list) list list option;
  (** 
    A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.
     *)

  duration: int option;
  (** 
    The number of hours that an association can run on specified targets. After the resulting cutoff time passes, associations that are currently running are cancelled, and no pending executions are started on remaining targets.
     *)

  schedule_offset: int option;
  (** 
    Number of days to wait after the scheduled day to run an association.
     *)

  association_name: string option;
  (** 
    The association name.
     *)

  schedule_expression: string option;
  (** 
    A cron expression that specifies a schedule when the association runs. The schedule runs in Coordinated Universal Time (UTC).
     *)

  overview: association_overview option;
  (** 
    Information about the association.
     *)

  last_execution_date: float option;
  (** 
    The date on which the association was last run.
     *)

  targets: target list option;
  (** 
    The managed nodes targeted by the request to create an association. You can target all managed nodes in an Amazon Web Services account by specifying the [InstanceIds] key with a value of [*].
     *)

  document_version: string option;
  (** 
    The version of the document used in the association. If you change a document version for a State Manager association, Systems Manager immediately runs the association unless you previously specifed the [apply-only-at-cron-interval] parameter.
    
     State Manager doesn't support running associations that use a new version of a document if that document is shared from another account. State Manager always runs the [default] version of a document if shared from another account, even though the Systems Manager console shows that a new version was processed. If you want to run an association using a new version of a document shared form another account, you must set the document version to [default].
     
      *)

  association_version: string option;
  (** 
    The association version.
     *)

  association_id: string option;
  (** 
    The ID created by the system when you create an association. An association is a binding between a document and a set of targets with a schedule.
     *)

  instance_id: string option;
  (** 
    The managed node ID.
     *)

  name: string option;
  (** 
    The name of the SSM document.
     *)

}

type list_associations_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  associations: association list option;
  (** 
    The associations.
     *)

}

type association_filter_key = | ResourceGroupName
  | AssociationName
  | LastExecutedAfter
  | LastExecutedBefore
  | Status
  | AssociationId
  | Name
  | InstanceId

(** 
    Describes a filter.
     *)
type association_filter = {
  value: string;
  (** 
    The filter value.
     *)

  key: association_filter_key;
  (** 
    The name of the filter.
    
     [InstanceId] has been deprecated.
     
      *)

}

type list_associations_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  association_filter_list: association_filter list option;
  (** 
    One or more filters. Use a filter to return a more specific list of results.
    
     Filtering associations using the [InstanceID] attribute only returns legacy associations created using the [InstanceID] attribute. Associations targeting the managed node that are part of the Target Attributes [ResourceGroup] or [Tags] aren't returned.
     
      *)

}

(** 
    Information about the association version.
     *)
type association_version_info = {
  target_maps: (string * string list) list list option;
  (** 
    A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.
     *)

  duration: int option;
  (** 
    The number of hours that an association can run on specified targets. After the resulting cutoff time passes, associations that are currently running are cancelled, and no pending executions are started on remaining targets.
     *)

  schedule_offset: int option;
  (** 
    Number of days to wait after the scheduled day to run an association.
     *)

  target_locations: target_location list option;
  (** 
    The combination of Amazon Web Services Regions and Amazon Web Services accounts where you wanted to run the association when this association version was created.
     *)

  calendar_names: string list option;
  (** 
    The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your associations are gated under. The associations for this version only run when that Change Calendar is open. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar}Amazon Web Services Systems Manager Change Calendar}.
     *)

  apply_only_at_cron_interval: bool option;
  (** 
    By default, when you create a new associations, the system runs it immediately after it is created and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you create it. This parameter isn't supported for rate expressions.
     *)

  sync_compliance: association_sync_compliance option;
  (** 
    The mode for generating association compliance. You can specify [AUTO] or [MANUAL]. In [AUTO] mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is [COMPLIANT]. If the association execution doesn't run successfully, the association is [NON-COMPLIANT].
    
     In [MANUAL] mode, you must specify the [AssociationId] as a parameter for the [PutComplianceItems] API operation. In this case, compliance data isn't managed by State Manager, a capability of Amazon Web Services Systems Manager. It is managed by your direct call to the [PutComplianceItems] API operation.
     
      By default, all associations use [AUTO] mode.
       *)

  compliance_severity: association_compliance_severity option;
  (** 
    The severity level that is assigned to the association.
     *)

  max_concurrency: string option;
  (** 
    The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.
    
     If a new managed node starts and attempts to run an association while Systems Manager is running [MaxConcurrency] associations, the association is allowed to run. During the next association interval, the new managed node will process its association within the limit specified for [MaxConcurrency].
      *)

  max_errors: string option;
  (** 
    The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 managed nodes and set [MaxError] to 10%, then the system stops sending the request when the sixth error is received.
    
     Executions that are already running an association when [MaxErrors] is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set [MaxConcurrency] to 1 so that executions proceed one at a time.
      *)

  association_name: string option;
  (** 
    The name specified for the association version when the association version was created.
     *)

  output_location: instance_association_output_location option;
  (** 
    The location in Amazon S3 specified for the association when the association version was created.
     *)

  schedule_expression: string option;
  (** 
    The cron or rate schedule specified for the association when the association version was created.
     *)

  targets: target list option;
  (** 
    The targets specified for the association when the association version was created.
     *)

  parameters: (string * string list) list option;
  (** 
    Parameters specified when the association version was created.
     *)

  document_version: string option;
  (** 
    The version of an Amazon Web Services Systems Manager document (SSM document) used when the association version was created.
     *)

  name: string option;
  (** 
    The name specified when the association was created.
     *)

  created_date: float option;
  (** 
    The date the association version was created.
     *)

  association_version: string option;
  (** 
    The association version.
     *)

  association_id: string option;
  (** 
    The ID created by the system when the association was created.
     *)

}

type list_association_versions_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  association_versions: association_version_info list option;
  (** 
    Information about all versions of the association for the specified association ID.
     *)

}

type list_association_versions_request = {
  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  association_id: string;
  (** 
    The association ID for which you want to view all versions.
     *)

}

type label_parameter_version_result = {
  parameter_version: int option;
  (** 
    The version of the parameter that has been labeled.
     *)

  invalid_labels: string list option;
  (** 
    The label doesn't meet the requirements. For information about parameter label requirements, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-paramstore-labels.html}Working with parameter labels} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

}

type label_parameter_version_request = {
  labels: string list;
  (** 
    One or more labels to attach to the specified parameter version.
     *)

  parameter_version: int option;
  (** 
    The specific version of the parameter on which you want to attach one or more labels. If no version is specified, the system attaches the label to the latest version.
     *)

  name: string;
  (** 
    The parameter name on which you want to attach one or more labels.
    
     You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.
     
      *)

}

(** 
    The command ID and managed node ID you specified didn't match any invocations. Verify the command ID and the managed node ID and try again.
     *)
type invocation_does_not_exist = unit

type inventory_schema_delete_option = | DELETE_SCHEMA
  | DISABLE_SCHEMA

(** 
    The inventory result item.
     *)
type inventory_result_item = {
  content: (string * string) list list;
  (** 
    Contains all the inventory data of the item type. Results include attribute names and values.
     *)

  content_hash: string option;
  (** 
    MD5 hash of the inventory item type contents. The content hash is used to determine whether to update inventory information. The PutInventory API doesn't update the inventory item type contents if the MD5 hash hasn't changed since last update.
     *)

  capture_time: string option;
  (** 
    The time inventory item data was captured.
     *)

  schema_version: string;
  (** 
    The schema version for the inventory result item/
     *)

  type_name: string;
  (** 
    The name of the inventory result item type.
     *)

}

(** 
    Inventory query results.
     *)
type inventory_result_entity = {
  data: (string * inventory_result_item) list option;
  (** 
    The data section in the inventory result entity JSON.
     *)

  id: string option;
  (** 
    ID of the inventory result entity. For example, for managed node inventory the result will be the managed node ID. For EC2 instance inventory, the result will be the instance ID.
     *)

}

type inventory_attribute_data_type = | NUMBER
  | STRING

(** 
    Attributes are the entries within the inventory item content. It contains name and value.
     *)
type inventory_item_attribute = {
  data_type: inventory_attribute_data_type;
  (** 
    The data type of the inventory item attribute.
     *)

  name: string;
  (** 
    Name of the inventory item attribute.
     *)

}

(** 
    The inventory item schema definition. Users can use this to compose inventory query filters.
     *)
type inventory_item_schema = {
  display_name: string option;
  (** 
    The alias name of the inventory type. The alias name is used for display purposes.
     *)

  attributes: inventory_item_attribute list;
  (** 
    The schema attributes for inventory. This contains data type and attribute name.
     *)

  version: string option;
  (** 
    The schema version for the inventory item.
     *)

  type_name: string;
  (** 
    The name of the inventory type. Default inventory item type names start with Amazon Web Services. Custom inventory type names will start with Custom. Default inventory item types include the following: [AWS:AWSComponent], [AWS:Application], [AWS:InstanceInformation], [AWS:Network], and [AWS:WindowsUpdate].
     *)

}

(** 
    A user-defined set of one or more filters on which to aggregate inventory data. Groups return a count of resources that match and don't match the specified criteria.
     *)
type inventory_group = {
  filters: inventory_filter list;
  (** 
    Filters define the criteria for the group. The [matchingCount] field displays the number of resources that match the criteria. The [notMatchingCount] field displays the number of resources that don't match the criteria.
     *)

  name: string;
  (** 
    The name of the group.
     *)

}

type inventory_deletion_status = | COMPLETE
  | IN_PROGRESS

(** 
    Either a count, remaining count, or a version number in a delete inventory summary.
     *)
type inventory_deletion_summary_item = {
  remaining_count: int option;
  (** 
    The remaining number of items to delete.
     *)

  count: int option;
  (** 
    A count of the number of deleted items.
     *)

  version: string option;
  (** 
    The inventory type version.
     *)

}

(** 
    Information about the delete operation.
     *)
type inventory_deletion_summary = {
  summary_items: inventory_deletion_summary_item list option;
  (** 
    A list of counts and versions for deleted items.
     *)

  remaining_count: int option;
  (** 
    Remaining number of items to delete.
     *)

  total_count: int option;
  (** 
    The total number of items to delete. This count doesn't change during the delete operation.
     *)

}

(** 
    Status information returned by the [DeleteInventory] operation.
     *)
type inventory_deletion_status_item = {
  last_status_update_time: float option;
  (** 
    The UTC timestamp of when the last status report.
     *)

  deletion_summary: inventory_deletion_summary option;
  (** 
    Information about the delete operation. For more information about this summary, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-custom.html#sysman-inventory-delete}Understanding the delete inventory summary} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  last_status_message: string option;
  (** 
    Information about the status.
     *)

  last_status: inventory_deletion_status option;
  (** 
    The status of the operation. Possible values are InProgress and Complete.
     *)

  deletion_start_time: float option;
  (** 
    The UTC timestamp when the delete operation started.
     *)

  type_name: string option;
  (** 
    The name of the inventory data type.
     *)

  deletion_id: string option;
  (** 
    The deletion ID returned by the [DeleteInventory] operation.
     *)

}

type inventory_aggregator = {
  groups: inventory_group list option;
  (** 
    A user-defined set of one or more filters on which to aggregate inventory data. Groups return a count of resources that match and don't match the specified criteria.
     *)

  aggregators: inventory_aggregator list option;
  (** 
    Nested aggregators to further refine aggregation for an inventory type.
     *)

  expression: string option;
  (** 
    The inventory type and attribute name for aggregation.
     *)

}

(** 
    The specified tag key or value isn't valid.
     *)
type invalid_tag = {
  message: string option;
  
}

(** 
    The specified inventory item result attribute isn't valid.
     *)
type invalid_result_attribute_exception = {
  message: string option;
  
}

(** 
    The plugin name isn't valid.
     *)
type invalid_plugin_name = unit

(** 
    The delete inventory option specified isn't valid. Verify the option and try again.
     *)
type invalid_option_exception = {
  message: string option;
  
}

(** 
    The request isn't valid.
     *)
type invalid_inventory_request_exception = {
  message: string option;
  
}

(** 
    The specified inventory group isn't valid.
     *)
type invalid_inventory_group_exception = {
  message: string option;
  
}

(** 
    The specified filter value isn't valid.
     *)
type invalid_instance_property_filter_value = {
  message: string option;
  
}

(** 
    The specified filter value isn't valid.
     *)
type invalid_instance_information_filter_value = {
  message: string option;
  
}

(** 
    The filter value isn't valid. Verify the value and try again.
     *)
type invalid_filter_value = {
  message: string option;
  
}

(** 
    The specified filter option isn't valid. Valid options are Equals and BeginsWith. For Path filter, valid options are Recursive and OneLevel.
     *)
type invalid_filter_option = {
  message: string option;
  (** 
    The specified filter option isn't valid. Valid options are Equals and BeginsWith. For Path filter, valid options are Recursive and OneLevel.
     *)

}

(** 
    The SSM document type isn't valid. Valid document types are described in the [DocumentType] property.
     *)
type invalid_document_type = {
  message: string option;
  
}

(** 
    The ID specified for the delete operation doesn't exist or isn't valid. Verify the ID and try again.
     *)
type invalid_deletion_id_exception = {
  message: string option;
  
}

(** 
    One or more of the parameters specified for the delete operation isn't valid. Verify all parameters and try again.
     *)
type invalid_delete_inventory_parameters_exception = {
  message: string option;
  
}

(** 
    The specified aggregator isn't valid for inventory groups. Verify that the aggregator uses a valid inventory type such as [AWS:Application] or [AWS:InstanceInformation].
     *)
type invalid_aggregator_exception = {
  message: string option;
  
}

(** 
    The activation ID isn't valid. Verify the you entered the correct ActivationId or ActivationCode and try again.
     *)
type invalid_activation_id = {
  message: string option;
  
}

(** 
    The activation isn't valid. The activation might have been deleted, or the ActivationId and the ActivationCode don't match.
     *)
type invalid_activation = {
  message: string option;
  
}

type instance_property_filter_operator = | GREATER_THAN
  | LESS_THAN
  | BEGIN_WITH
  | NOT_EQUAL
  | EQUAL

(** 
    The filters to describe or get information about your managed nodes.
     *)
type instance_property_string_filter = {
  operator: instance_property_filter_operator option;
  (** 
    The operator used by the filter call.
     *)

  values: string list;
  (** 
    The filter key name to describe your managed nodes.
     *)

  key: string;
  (** 
    The filter key name to describe your managed nodes.
     *)

}

type instance_property_filter_key = | ASSOCIATION_STATUS
  | RESOURCE_TYPE
  | IAM_ROLE
  | ACTIVATION_IDS
  | DOCUMENT_NAME
  | PLATFORM_TYPES
  | PING_STATUS
  | AGENT_VERSION
  | INSTANCE_IDS

(** 
    Describes a filter for a specific list of managed nodes. You can filter node information by using tags. You specify tags by using a key-value mapping.
     *)
type instance_property_filter = {
  value_set: string list;
  (** 
    The filter values.
     *)

  key: instance_property_filter_key;
  (** 
    The name of the filter.
     *)

}

(** 
    Status information about the aggregated associations.
     *)
type instance_aggregated_association_overview = {
  instance_association_status_aggregated_count: (string * int) list option;
  (** 
    The number of associations for the managed nodes.
     *)

  detailed_status: string option;
  (** 
    Detailed status information about the aggregated associations.
     *)

}

(** 
    An object containing various properties of a managed node.
     *)
type instance_property = {
  source_type: source_type option;
  (** 
    The type of the source resource.
     *)

  source_id: string option;
  (** 
    The ID of the source resource.
     *)

  association_overview: instance_aggregated_association_overview option;
  
  last_successful_association_execution_date: float option;
  (** 
    The last date the association was successfully run.
     *)

  last_association_execution_date: float option;
  (** 
    The date the association was last run.
     *)

  association_status: string option;
  (** 
    The status of the State Manager association applied to the managed node.
     *)

  computer_name: string option;
  (** 
    The fully qualified host name of the managed node.
     *)

  resource_type: string option;
  (** 
    The type of managed node.
     *)

  registration_date: float option;
  (** 
    The date the node was registered with Systems Manager.
     *)

  iam_role: string option;
  (** 
    The IAM role used in the hybrid activation to register the node with Systems Manager.
     *)

  activation_id: string option;
  (** 
    The activation ID created by Systems Manager when the server or virtual machine (VM) was registered
     *)

  platform_version: string option;
  (** 
    The version of the OS platform running on your managed node.
     *)

  platform_name: string option;
  (** 
    The name of the operating system platform running on your managed node.
     *)

  platform_type: platform_type option;
  (** 
    The operating system platform type of the managed node. For example, Windows.
     *)

  agent_version: string option;
  (** 
    The version of SSM Agent running on your managed node.
     *)

  last_ping_date_time: float option;
  (** 
    The date and time when the SSM Agent last pinged the Systems Manager service.
     *)

  ping_status: ping_status option;
  (** 
    Connection status of the SSM Agent on the managed node.
     *)

  launch_time: float option;
  (** 
    The timestamp for when the node was launched.
     *)

  ip_address: string option;
  (** 
    The public IPv4 address assigned to the node. If a public IPv4 address isn't assigned to the node, this value is blank.
     *)

  architecture: string option;
  (** 
    The CPU architecture of the node. For example, x86_64.
     *)

  instance_state: string option;
  (** 
    The current state of the node.
     *)

  key_name: string option;
  (** 
    The name of the key pair associated with the node. If a key pair isnt't associated with the node, this value is blank.
     *)

  instance_role: string option;
  (** 
    The instance profile attached to the node. If an instance profile isn't attached to the node, this value is blank.
     *)

  instance_type: string option;
  (** 
    The instance type of the managed node. For example, t3.large.
     *)

  instance_id: string option;
  (** 
    The ID of the managed node.
     *)

  name: string option;
  (** 
    The value of the EC2 [Name] tag associated with the node. If a [Name] tag hasn't been applied to the node, this value is blank.
     *)

}

(** 
    Defines the high-level patch compliance state for a managed node, providing information about the number of installed, missing, not applicable, and failed patches along with metadata about the operation when this information was gathered for the managed node.
     *)
type instance_patch_state = {
  other_non_compliant_count: int option;
  (** 
    The number of patches per node that are specified as other than [Critical] or [Security] but aren't compliant with the patch baseline. The status of these managed nodes is [NON_COMPLIANT].
     *)

  security_non_compliant_count: int option;
  (** 
    The number of patches per node that are specified as [Security] in a patch advisory aren't installed. These patches might be missing, have failed installation, were rejected, or were installed but awaiting a required managed node reboot. The status of these managed nodes is [NON_COMPLIANT].
     *)

  critical_non_compliant_count: int option;
  (** 
    The number of patches per node that are specified as [Critical] for compliance reporting in the patch baseline aren't installed. These patches might be missing, have failed installation, were rejected, or were installed but awaiting a required managed node reboot. The status of these managed nodes is [NON_COMPLIANT].
     *)

  reboot_option: reboot_option option;
  (** 
    Indicates the reboot option specified in the patch baseline.
    
     Reboot options apply to [Install] operations only. Reboots aren't attempted for Patch Manager [Scan] operations.
     
      {ul
           {- [RebootIfNeeded]: Patch Manager tries to reboot the managed node if it installed any patches, or if any patches are detected with a status of [InstalledPendingReboot].
              
              }
            {- [NoReboot]: Patch Manager attempts to install missing packages without trying to reboot the system. Patches installed with this option are assigned a status of [InstalledPendingReboot]. These patches might not be in effect until a reboot is performed.
               
               }
           
      }
       *)

  last_no_reboot_install_operation_time: float option;
  (** 
    The time of the last attempt to patch the managed node with [NoReboot] specified as the reboot option.
     *)

  operation: patch_operation_type;
  (** 
    The type of patching operation that was performed: or
    
     {ul
          {- [SCAN] assesses the patch compliance state.
             
             }
           {- [INSTALL] installs missing patches.
              
              }
          
      }
       *)

  operation_end_time: float;
  (** 
    The time the most recent patching operation completed on the managed node.
     *)

  operation_start_time: float;
  (** 
    The time the most recent patching operation was started on the managed node.
     *)

  not_applicable_count: int option;
  (** 
    The number of patches from the patch baseline that aren't applicable for the managed node and therefore aren't installed on the node. This number may be truncated if the list of patch names is very large. The number of patches beyond this limit are reported in [UnreportedNotApplicableCount].
     *)

  unreported_not_applicable_count: int option;
  (** 
    The number of patches beyond the supported limit of [NotApplicableCount] that aren't reported by name to Inventory. Inventory is a capability of Amazon Web Services Systems Manager.
     *)

  failed_count: int option;
  (** 
    The number of patches from the patch baseline that were attempted to be installed during the last patching operation, but failed to install.
     *)

  missing_count: int option;
  (** 
    The number of patches from the patch baseline that are applicable for the managed node but aren't currently installed.
     *)

  installed_rejected_count: int option;
  (** 
    The number of patches installed on a managed node that are specified in a [RejectedPatches] list. Patches with a status of [InstalledRejected] were typically installed before they were added to a [RejectedPatches] list.
    
     If [ALLOW_AS_DEPENDENCY] is the specified option for [RejectedPatchesAction], the value of [InstalledRejectedCount] will always be [0] (zero).
     
      *)

  installed_pending_reboot_count: int option;
  (** 
    The number of patches installed by Patch Manager since the last time the managed node was rebooted.
     *)

  installed_other_count: int option;
  (** 
    The number of patches not specified in the patch baseline that are installed on the managed node.
     *)

  installed_count: int option;
  (** 
    The number of patches from the patch baseline that are installed on the managed node.
     *)

  owner_information: string option;
  (** 
    Placeholder information. This field will always be empty in the current release of the service.
     *)

  install_override_list: string option;
  (** 
    An https URL or an Amazon Simple Storage Service (Amazon S3) path-style URL to a list of patches to be installed. This patch installation list, which you maintain in an S3 bucket in YAML format and specify in the SSM document [AWS-RunPatchBaseline], overrides the patches specified by the default patch baseline.
    
     For more information about the [InstallOverrideList] parameter, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-about-aws-runpatchbaseline.html}About the [AWS-RunPatchBaseline SSM document]} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  snapshot_id: string option;
  (** 
    The ID of the patch baseline snapshot used during the patching operation when this compliance data was collected.
     *)

  baseline_id: string;
  (** 
    The ID of the patch baseline used to patch the managed node.
     *)

  patch_group: string;
  (** 
    The name of the patch group the managed node belongs to.
     *)

  instance_id: string;
  (** 
    The ID of the managed node the high-level patch compliance information was collected for.
     *)

}

type instance_patch_state_operator_type = | GREATER_THAN
  | LESS_THAN
  | NOT_EQUAL
  | EQUAL

(** 
    Defines a filter used in [DescribeInstancePatchStatesForPatchGroup] to scope down the information returned by the API.
    
     {b Example}: To filter for all managed nodes in a patch group having more than three patches with a [FailedCount] status, use the following for the filter:
     
      {ul
           {- Value for [Key]: [FailedCount]
              
              }
            {- Value for [Type]: [GreaterThan]
               
               }
            {- Value for [Values]: [3]
               
               }
           
      }
       *)
type instance_patch_state_filter = {
  type_: instance_patch_state_operator_type;
  (** 
    The type of comparison that should be performed for the value.
     *)

  values: string list;
  (** 
    The value for the filter. Must be an integer greater than or equal to 0.
     *)

  key: string;
  (** 
    The key for the filter. Supported values include the following:
    
     {ul
          {- [InstalledCount]
             
             }
           {- [InstalledOtherCount]
              
              }
           {- [InstalledPendingRebootCount]
              
              }
           {- [InstalledRejectedCount]
              
              }
           {- [MissingCount]
              
              }
           {- [FailedCount]
              
              }
           {- [UnreportedNotApplicableCount]
              
              }
           {- [NotApplicableCount]
              
              }
          
      }
       *)

}

(** 
    The filters to describe or get information about your managed nodes.
     *)
type instance_information_string_filter = {
  values: string list;
  (** 
    The filter values.
     *)

  key: string;
  [@ocaml.doc {| 
    The filter key name to describe your managed nodes.
    
     Valid filter key values: ActivationIds | AgentVersion | AssociationStatus | IamRole | InstanceIds | PingStatus | PlatformTypes | ResourceType | SourceIds | SourceTypes | "tag-key" | "tag:[{keyname}]
     
      {ul
           {- Valid values for the [AssociationStatus] filter key: Success | Pending | Failed
              
              }
            {- Valid values for the [PingStatus] filter key: Online | ConnectionLost | Inactive (deprecated)
               
               }
            {- Valid values for the [PlatformType] filter key: Windows | Linux | MacOS
               
               }
            {- Valid values for the [ResourceType] filter key: EC2Instance | ManagedInstance
               
               }
            {- Valid values for the [SourceType] filter key: AWS::EC2::Instance | AWS::SSM::ManagedInstance | AWS::IoT::Thing
               
               }
            {- Valid tag examples: [Key=tag-key,Values=Purpose] | [Key=tag:Purpose,Values=Test].
               
               }
           
      }
       |}]

}

(** 
    Describes a filter for a specific list of managed nodes.
     *)
type instance_information = {
  source_type: source_type option;
  (** 
    The type of the source resource. For IoT Greengrass devices, [SourceType] is [AWS::IoT::Thing].
     *)

  source_id: string option;
  (** 
    The ID of the source resource. For IoT Greengrass devices, [SourceId] is the Thing name.
     *)

  association_overview: instance_aggregated_association_overview option;
  (** 
    Information about the association.
     *)

  last_successful_association_execution_date: float option;
  (** 
    The last date the association was successfully run.
     *)

  last_association_execution_date: float option;
  (** 
    The date the association was last run.
     *)

  association_status: string option;
  (** 
    The status of the association.
     *)

  computer_name: string option;
  (** 
    The fully qualified host name of the managed node.
     *)

  ip_address: string option;
  (** 
    The IP address of the managed node.
     *)

  name: string option;
  (** 
    The name assigned to an on-premises server, edge device, or virtual machine (VM) when it is activated as a Systems Manager managed node. The name is specified as the [DefaultInstanceName] property using the [CreateActivation] command. It is applied to the managed node by specifying the Activation Code and Activation ID when you install SSM Agent on the node, as explained in {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-linux.html}Install SSM Agent for a hybrid and multicloud environment (Linux)} and {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-win.html}Install SSM Agent for a hybrid and multicloud environment (Windows)}. To retrieve the [Name] tag of an EC2 instance, use the Amazon EC2 [DescribeInstances] operation. For information, see {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html}DescribeInstances} in the {i Amazon EC2 API Reference} or {{:https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html}describe-instances} in the {i Amazon Web Services CLI Command Reference}.
     *)

  resource_type: resource_type option;
  (** 
    The type of instance. Instances are either EC2 instances or managed instances.
     *)

  registration_date: float option;
  (** 
    The date the server or VM was registered with Amazon Web Services as a managed node.
     *)

  iam_role: string option;
  (** 
    The Identity and Access Management (IAM) role assigned to the on-premises Systems Manager managed node. This call doesn't return the IAM role for Amazon Elastic Compute Cloud (Amazon EC2) instances. To retrieve the IAM role for an EC2 instance, use the Amazon EC2 [DescribeInstances] operation. For information, see {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html}DescribeInstances} in the {i Amazon EC2 API Reference} or {{:https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html}describe-instances} in the {i Amazon Web Services CLI Command Reference}.
     *)

  activation_id: string option;
  (** 
    The activation ID created by Amazon Web Services Systems Manager when the server or virtual machine (VM) was registered.
     *)

  platform_version: string option;
  (** 
    The version of the OS platform running on your managed node.
     *)

  platform_name: string option;
  (** 
    The name of the operating system platform running on your managed node.
     *)

  platform_type: platform_type option;
  (** 
    The operating system platform type.
     *)

  is_latest_version: bool option;
  (** 
    Indicates whether the latest version of SSM Agent is running on your Linux managed node. This field doesn't indicate whether or not the latest version is installed on Windows managed nodes, because some older versions of Windows Server use the EC2Config service to process Systems Manager requests.
     *)

  agent_version: string option;
  (** 
    The version of SSM Agent running on your Linux managed node.
     *)

  last_ping_date_time: float option;
  (** 
    The date and time when the agent last pinged the Systems Manager service.
     *)

  ping_status: ping_status option;
  (** 
    Connection status of SSM Agent.
    
     The status [Inactive] has been deprecated and is no longer in use.
     
      *)

  instance_id: string option;
  (** 
    The managed node ID.
     *)

}

type instance_information_filter_key = | ASSOCIATION_STATUS
  | RESOURCE_TYPE
  | IAM_ROLE
  | ACTIVATION_IDS
  | PLATFORM_TYPES
  | PING_STATUS
  | AGENT_VERSION
  | INSTANCE_IDS

(** 
    Describes a filter for a specific list of managed nodes. You can filter node information by using tags. You specify tags by using a key-value mapping.
    
     Use this operation instead of the [DescribeInstanceInformationRequest$InstanceInformationFilterList] method. The [InstanceInformationFilterList] method is a legacy method and doesn't support tags.
      *)
type instance_information_filter = {
  value_set: string list;
  (** 
    The filter values.
     *)

  key: instance_information_filter_key;
  (** 
    The name of the filter.
     *)

}

(** 
    The URL of S3 bucket where you want to store the results of this request.
     *)
type instance_association_output_url = {
  s3_output_url: s3_output_url option;
  (** 
    The URL of S3 bucket where you want to store the results of this request.
     *)

}

(** 
    Status information about the association.
     *)
type instance_association_status_info = {
  association_name: string option;
  (** 
    The name of the association applied to the managed node.
     *)

  output_url: instance_association_output_url option;
  (** 
    A URL for an S3 bucket where you want to store the results of this request.
     *)

  error_code: string option;
  (** 
    An error code returned by the request to create the association.
     *)

  execution_summary: string option;
  (** 
    Summary information about association execution.
     *)

  detailed_status: string option;
  (** 
    Detailed status information about the association.
     *)

  status: string option;
  (** 
    Status information about the association.
     *)

  execution_date: float option;
  (** 
    The date the association ran.
     *)

  instance_id: string option;
  (** 
    The managed node ID where the association was created.
     *)

  association_version: string option;
  (** 
    The version of the association applied to the managed node.
     *)

  document_version: string option;
  (** 
    The association document versions.
     *)

  name: string option;
  (** 
    The name of the association.
     *)

  association_id: string option;
  (** 
    The association ID.
     *)

}

(** 
    One or more association documents on the managed node.
     *)
type instance_association = {
  association_version: string option;
  (** 
    Version information for the association on the managed node.
     *)

  content: string option;
  (** 
    The content of the association document for the managed nodes.
     *)

  instance_id: string option;
  (** 
    The managed node ID.
     *)

  association_id: string option;
  (** 
    The association ID.
     *)

}

(** 
    The query result body of the GetServiceSetting API operation.
     *)
type get_service_setting_result = {
  service_setting: service_setting option;
  (** 
    The query result of the current service setting.
     *)

}

(** 
    The request body of the GetServiceSetting API operation.
     *)
type get_service_setting_request = {
  setting_id: string;
  (** 
    The ID of the service setting to get. The setting ID can be one of the following.
    
     {ul
          {- [/ssm/managed-instance/default-ec2-instance-management-role]
             
             }
           {- [/ssm/automation/customer-script-log-destination]
              
              }
           {- [/ssm/automation/customer-script-log-group-name]
              
              }
           {- [/ssm/documents/console/public-sharing-permission]
              
              }
           {- [/ssm/managed-instance/activation-tier]
              
              }
           {- [/ssm/opsinsights/opscenter]
              
              }
           {- [/ssm/parameter-store/default-parameter-tier]
              
              }
           {- [/ssm/parameter-store/high-throughput-enabled]
              
              }
          
      }
       *)

}

(** 
    A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. Currently, [OpsItemGroup] is the only resource that supports Systems Manager resource policies. The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).
     *)
type get_resource_policies_response_entry = {
  policy: string option;
  (** 
    A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. Currently, [OpsItemGroup] is the only resource that supports Systems Manager resource policies. The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).
     *)

  policy_hash: string option;
  (** 
    ID of the current policy version. The hash helps to prevent a situation where multiple users attempt to overwrite a policy. You must provide this hash when updating or deleting a policy.
     *)

  policy_id: string option;
  (** 
    A policy ID.
     *)

}

type get_resource_policies_response = {
  policies: get_resource_policies_response_entry list option;
  (** 
    An array of the [Policy] object.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

}

type get_resource_policies_request = {
  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  resource_arn: string;
  (** 
    Amazon Resource Name (ARN) of the resource to which the policies are attached.
     *)

}

type get_patch_baseline_result = {
  sources: patch_source list option;
  (** 
    Information about the patches to use to update the managed nodes, including target operating systems and source repositories. Applies to Linux managed nodes only.
     *)

  description: string option;
  (** 
    A description of the patch baseline.
     *)

  modified_date: float option;
  (** 
    The date the patch baseline was last modified.
     *)

  created_date: float option;
  (** 
    The date the patch baseline was created.
     *)

  patch_groups: string list option;
  (** 
    Patch groups included in the patch baseline.
     *)

  rejected_patches_action: patch_action option;
  (** 
    The action specified to take on patches included in the [RejectedPatches] list. A patch can be allowed only if it is a dependency of another package, or blocked entirely along with packages that include it as a dependency.
     *)

  rejected_patches: string list option;
  (** 
    A list of explicitly rejected patches for the baseline.
     *)

  approved_patches_enable_non_security: bool option;
  (** 
    Indicates whether the list of approved patches includes non-security updates that should be applied to the managed nodes. The default value is [false]. Applies to Linux managed nodes only.
     *)

  approved_patches_compliance_level: patch_compliance_level option;
  (** 
    Returns the specified compliance severity level for approved patches in the patch baseline.
     *)

  approved_patches: string list option;
  (** 
    A list of explicitly approved patches for the baseline.
     *)

  approval_rules: patch_rule_group option;
  (** 
    A set of rules used to include patches in the baseline.
     *)

  global_filters: patch_filter_group option;
  (** 
    A set of global filters used to exclude patches from the baseline.
     *)

  operating_system: operating_system option;
  (** 
    Returns the operating system specified for the patch baseline.
     *)

  name: string option;
  (** 
    The name of the patch baseline.
     *)

  baseline_id: string option;
  (** 
    The ID of the retrieved patch baseline.
     *)

}

type get_patch_baseline_request = {
  baseline_id: string;
  (** 
    The ID of the patch baseline to retrieve.
    
     To retrieve information about an Amazon Web Services managed patch baseline, specify the full Amazon Resource Name (ARN) of the baseline. For example, for the baseline [AWS-AmazonLinuxDefaultPatchBaseline], specify [arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0e392de35e7c563b7] instead of [pb-0e392de35e7c563b7].
     
      *)

}

type get_patch_baseline_for_patch_group_result = {
  operating_system: operating_system option;
  (** 
    The operating system rule specified for patch groups using the patch baseline.
     *)

  patch_group: string option;
  (** 
    The name of the patch group.
     *)

  baseline_id: string option;
  (** 
    The ID of the patch baseline that should be used for the patch group.
     *)

}

type get_patch_baseline_for_patch_group_request = {
  operating_system: operating_system option;
  (** 
    Returns the operating system rule specified for patch groups using the patch baseline.
     *)

  patch_group: string;
  (** 
    The name of the patch group whose patch baseline should be retrieved.
     *)

}

type get_parameters_result = {
  invalid_parameters: string list option;
  (** 
    A list of parameters that aren't formatted correctly or don't run during an execution.
     *)

  parameters: parameter list option;
  (** 
    A list of details for a parameter.
     *)

}

type get_parameters_request = {
  with_decryption: bool option;
  (** 
    Return decrypted secure string value. Return decrypted values for secure string parameters. This flag is ignored for [String] and [StringList] parameter types.
     *)

  names: string list;
  [@ocaml.doc {| 
    The names or Amazon Resource Names (ARNs) of the parameters that you want to query. For parameters shared with you from another account, you must use the full ARNs.
    
     To query by parameter label, use ["Name": "name:label"]. To query by parameter version, use ["Name": "name:version"].
     
      The results for [GetParameters] requests are listed in alphabetical order in query responses.
      
       For information about shared parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html}Working with shared parameters} in the {i Amazon Web Services Systems Manager User Guide}.
        |}]

}

type get_parameters_by_path_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  parameters: parameter list option;
  (** 
    A list of parameters found in the specified hierarchy.
     *)

}

type get_parameters_by_path_request = {
  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  with_decryption: bool option;
  (** 
    Retrieve all parameters in a hierarchy with their value decrypted.
     *)

  parameter_filters: parameter_string_filter list option;
  (** 
    Filters to limit the request results.
    
     The following [Key] values are supported for [GetParametersByPath]: [Type], [KeyId], and [Label].
     
      The following [Key] values aren't supported for [GetParametersByPath]: [tag], [DataType], [Name], [Path], and [Tier].
      
       *)

  recursive: bool option;
  (** 
    Retrieve all parameters within a hierarchy.
    
     If a user has access to a path, then the user can access all levels of that path. For example, if a user has permission to access path [/a], then the user can also access [/a/b]. Even if a user has explicitly been denied access in IAM for parameter [/a/b], they can still call the GetParametersByPath API operation recursively for [/a] and view [/a/b].
     
      *)

  path: string;
  (** 
    The hierarchy for the parameter. Hierarchies start with a forward slash (/). The hierarchy is the parameter name except the last part of the parameter. For the API call to succeed, the last part of the parameter name can't be in the path. A parameter name hierarchy can have a maximum of 15 levels. Here is an example of a hierarchy: [/Finance/Prod/IAD/WinServ2016/license33 ]
     *)

}

type get_parameter_result = {
  parameter: parameter option;
  (** 
    Information about a parameter.
     *)

}

type get_parameter_request = {
  with_decryption: bool option;
  (** 
    Return decrypted values for secure string parameters. This flag is ignored for [String] and [StringList] parameter types.
     *)

  name: string;
  [@ocaml.doc {| 
    The name or Amazon Resource Name (ARN) of the parameter that you want to query. For parameters shared with you from another account, you must use the full ARN.
    
     To query by parameter label, use ["Name": "name:label"]. To query by parameter version, use ["Name": "name:version"].
     
      For more information about shared parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sharing.html}Working with shared parameters} in the {i Amazon Web Services Systems Manager User Guide}.
       |}]

}

type get_parameter_history_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  parameters: parameter_history list option;
  (** 
    A list of parameters returned by the request.
     *)

}

type get_parameter_history_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  with_decryption: bool option;
  (** 
    Return decrypted values for secure string parameters. This flag is ignored for [String] and [StringList] parameter types.
     *)

  name: string;
  (** 
    The name or Amazon Resource Name (ARN) of the parameter for which you want to review history. For parameters shared with you from another account, you must use the full ARN.
     *)

}

type get_ops_summary_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  entities: ops_entity list option;
  (** 
    The list of aggregated details and filtered OpsData.
     *)

}

type get_ops_summary_request = {
  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  result_attributes: ops_result_attribute list option;
  (** 
    The OpsData data type to return.
     *)

  aggregators: ops_aggregator list option;
  (** 
    Optional aggregators that return counts of OpsData based on one or more expressions.
     *)

  filters: ops_filter list option;
  (** 
    Optional filters used to scope down the returned OpsData.
     *)

  sync_name: string option;
  (** 
    Specify the name of a resource data sync to get.
     *)

}

type get_ops_metadata_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  metadata: (string * metadata_value) list option;
  (** 
    OpsMetadata for an Application Manager application.
     *)

  resource_id: string option;
  (** 
    The resource ID of the Application Manager application.
     *)

}

type get_ops_metadata_request = {
  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  ops_metadata_arn: string;
  (** 
    The Amazon Resource Name (ARN) of an OpsMetadata Object to view.
     *)

}

type get_ops_item_response = {
  ops_item: ops_item option;
  (** 
    The OpsItem.
     *)

}

type get_ops_item_request = {
  ops_item_arn: string option;
  (** 
    The OpsItem Amazon Resource Name (ARN).
     *)

  ops_item_id: string;
  (** 
    The ID of the OpsItem that you want to get.
     *)

}

type get_maintenance_window_task_result = {
  alarm_configuration: alarm_configuration option;
  (** 
    The details for the CloudWatch alarm you applied to your maintenance window task.
     *)

  cutoff_behavior: maintenance_window_task_cutoff_behavior option;
  (** 
    The action to take on tasks when the maintenance window cutoff time is reached. [CONTINUE_TASK] means that tasks continue to run. For Automation, Lambda, Step Functions tasks, [CANCEL_TASK] means that currently running task invocations continue, but no new task invocations are started. For Run Command tasks, [CANCEL_TASK] means the system attempts to stop the task by sending a [CancelCommand] operation.
     *)

  description: string option;
  (** 
    The retrieved task description.
     *)

  name: string option;
  (** 
    The retrieved task name.
     *)

  logging_info: logging_info option;
  (** 
    The location in Amazon Simple Storage Service (Amazon S3) where the task results are logged.
    
     [LoggingInfo] has been deprecated. To specify an Amazon Simple Storage Service (Amazon S3) bucket to contain logs, instead use the [OutputS3BucketName] and [OutputS3KeyPrefix] options in the [TaskInvocationParameters] structure. For information about how Amazon Web Services Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      *)

  max_errors: string option;
  (** 
    The maximum number of errors allowed before the task stops being scheduled.
    
     For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1], which may be reported in the response to this command. This value doesn't affect the running of your task and can be ignored.
     
      *)

  max_concurrency: string option;
  (** 
    The maximum number of targets allowed to run this task in parallel.
    
     For maintenance window tasks without a target specified, you can't supply a value for this option. Instead, the system inserts a placeholder value of [1], which may be reported in the response to this command. This value doesn't affect the running of your task and can be ignored.
     
      *)

  priority: int option;
  (** 
    The priority of the task when it runs. The lower the number, the higher the priority. Tasks that have the same priority are scheduled in parallel.
     *)

  task_invocation_parameters: maintenance_window_task_invocation_parameters option;
  (** 
    The parameters to pass to the task when it runs.
     *)

  task_parameters: (string * maintenance_window_task_parameter_value_expression) list option;
  (** 
    The parameters to pass to the task when it runs.
    
     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      *)

  task_type: maintenance_window_task_type option;
  (** 
    The type of task to run.
     *)

  service_role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) service role to use to publish Amazon Simple Notification Service (Amazon SNS) notifications for maintenance window Run Command tasks.
     *)

  task_arn: string option;
  (** 
    The resource that the task used during execution. For [RUN_COMMAND] and [AUTOMATION] task types, the value of [TaskArn] is the SSM document name/ARN. For [LAMBDA] tasks, the value is the function name/ARN. For [STEP_FUNCTIONS] tasks, the value is the state machine ARN.
     *)

  targets: target list option;
  (** 
    The targets where the task should run.
     *)

  window_task_id: string option;
  (** 
    The retrieved maintenance window task ID.
     *)

  window_id: string option;
  (** 
    The retrieved maintenance window ID.
     *)

}

type get_maintenance_window_task_request = {
  window_task_id: string;
  (** 
    The maintenance window task ID to retrieve.
     *)

  window_id: string;
  (** 
    The maintenance window ID that includes the task to retrieve.
     *)

}

type get_maintenance_window_result = {
  modified_date: float option;
  (** 
    The date the maintenance window was last modified.
     *)

  created_date: float option;
  (** 
    The date the maintenance window was created.
     *)

  enabled: bool option;
  (** 
    Indicates whether the maintenance window is enabled.
     *)

  allow_unassociated_targets: bool option;
  (** 
    Whether targets must be registered with the maintenance window before tasks can be defined for those targets.
     *)

  cutoff: int option;
  (** 
    The number of hours before the end of the maintenance window that Amazon Web Services Systems Manager stops scheduling new tasks for execution.
     *)

  duration: int option;
  (** 
    The duration of the maintenance window in hours.
     *)

  next_execution_time: string option;
  (** 
    The next time the maintenance window will actually run, taking into account any specified times for the maintenance window to become active or inactive.
     *)

  schedule_offset: int option;
  (** 
    The number of days to wait to run a maintenance window after the scheduled cron expression date and time.
     *)

  schedule_timezone: string option;
  [@ocaml.doc {| 
    The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see the {{:https://www.iana.org/time-zones}Time Zone Database} on the IANA website.
     |}]

  schedule: string option;
  (** 
    The schedule of the maintenance window in the form of a cron or rate expression.
     *)

  end_date: string option;
  (** 
    The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become inactive. The maintenance window won't run after this specified time.
     *)

  start_date: string option;
  (** 
    The date and time, in ISO-8601 Extended format, for when the maintenance window is scheduled to become active. The maintenance window won't run before this specified time.
     *)

  description: string option;
  (** 
    The description of the maintenance window.
     *)

  name: string option;
  (** 
    The name of the maintenance window.
     *)

  window_id: string option;
  (** 
    The ID of the created maintenance window.
     *)

}

type get_maintenance_window_request = {
  window_id: string;
  (** 
    The ID of the maintenance window for which you want to retrieve information.
     *)

}

type get_maintenance_window_execution_task_result = {
  triggered_alarms: alarm_state_information list option;
  (** 
    The CloudWatch alarms that were invoked by the maintenance window task.
     *)

  alarm_configuration: alarm_configuration option;
  (** 
    The details for the CloudWatch alarm you applied to your maintenance window task.
     *)

  end_time: float option;
  (** 
    The time the task execution completed.
     *)

  start_time: float option;
  (** 
    The time the task execution started.
     *)

  status_details: string option;
  (** 
    The details explaining the status. Not available for all status values.
     *)

  status: maintenance_window_execution_status option;
  (** 
    The status of the task.
     *)

  max_errors: string option;
  (** 
    The defined maximum number of task execution errors allowed before scheduling of the task execution would have been stopped.
     *)

  max_concurrency: string option;
  (** 
    The defined maximum number of task executions that could be run in parallel.
     *)

  priority: int option;
  (** 
    The priority of the task.
     *)

  task_parameters: (string * maintenance_window_task_parameter_value_expression) list list option;
  (** 
    The parameters passed to the task when it was run.
    
     [TaskParameters] has been deprecated. To specify parameters to pass to a task when it runs, instead use the [Parameters] option in the [TaskInvocationParameters] structure. For information about how Systems Manager handles these options for the supported maintenance window task types, see [MaintenanceWindowTaskInvocationParameters].
     
      The map has the following format:
      
       {ul
            {- [Key]: string, between 1 and 255 characters
               
               }
             {- [Value]: an array of strings, each between 1 and 255 characters
                
                }
            
      }
       *)

  type_: maintenance_window_task_type option;
  (** 
    The type of task that was run.
     *)

  service_role: string option;
  (** 
    The role that was assumed when running the task.
     *)

  task_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the task that ran.
     *)

  task_execution_id: string option;
  (** 
    The ID of the specific task execution in the maintenance window task that was retrieved.
     *)

  window_execution_id: string option;
  (** 
    The ID of the maintenance window execution that includes the task.
     *)

}

type get_maintenance_window_execution_task_request = {
  task_id: string;
  (** 
    The ID of the specific task execution in the maintenance window task that should be retrieved.
     *)

  window_execution_id: string;
  (** 
    The ID of the maintenance window execution that includes the task.
     *)

}

type get_maintenance_window_execution_task_invocation_result = {
  window_target_id: string option;
  (** 
    The maintenance window target ID.
     *)

  owner_information: string option;
  (** 
    User-provided value to be included in any Amazon CloudWatch Events or Amazon EventBridge events raised while running tasks for these targets in this maintenance window.
     *)

  end_time: float option;
  (** 
    The time that the task finished running on the target.
     *)

  start_time: float option;
  (** 
    The time that the task started running on the target.
     *)

  status_details: string option;
  (** 
    The details explaining the status. Details are only available for certain status values.
     *)

  status: maintenance_window_execution_status option;
  (** 
    The task status for an invocation.
     *)

  parameters: string option;
  (** 
    The parameters used at the time that the task ran.
     *)

  task_type: maintenance_window_task_type option;
  (** 
    Retrieves the task type for a maintenance window.
     *)

  execution_id: string option;
  (** 
    The execution ID.
     *)

  invocation_id: string option;
  (** 
    The invocation ID.
     *)

  task_execution_id: string option;
  (** 
    The task execution ID.
     *)

  window_execution_id: string option;
  (** 
    The maintenance window execution ID.
     *)

}

type get_maintenance_window_execution_task_invocation_request = {
  invocation_id: string;
  (** 
    The invocation ID to retrieve.
     *)

  task_id: string;
  (** 
    The ID of the specific task in the maintenance window task that should be retrieved.
     *)

  window_execution_id: string;
  (** 
    The ID of the maintenance window execution for which the task is a part.
     *)

}

type get_maintenance_window_execution_result = {
  end_time: float option;
  (** 
    The time the maintenance window finished running.
     *)

  start_time: float option;
  (** 
    The time the maintenance window started running.
     *)

  status_details: string option;
  (** 
    The details explaining the status. Not available for all status values.
     *)

  status: maintenance_window_execution_status option;
  (** 
    The status of the maintenance window execution.
     *)

  task_ids: string list option;
  (** 
    The ID of the task executions from the maintenance window execution.
     *)

  window_execution_id: string option;
  (** 
    The ID of the maintenance window execution.
     *)

}

type get_maintenance_window_execution_request = {
  window_execution_id: string;
  (** 
    The ID of the maintenance window execution that includes the task.
     *)

}

type get_inventory_schema_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  schemas: inventory_item_schema list option;
  (** 
    Inventory schemas returned by the request.
     *)

}

type get_inventory_schema_request = {
  sub_type: bool option;
  (** 
    Returns the sub-type schema for a specified inventory type.
     *)

  aggregator: bool option;
  (** 
    Returns inventory schemas that support aggregation. For example, this call returns the [AWS:InstanceInformation] type, because it supports aggregation based on the [PlatformName], [PlatformType], and [PlatformVersion] attributes.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  type_name: string option;
  (** 
    The type of inventory item to return.
     *)

}

type get_inventory_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  entities: inventory_result_entity list option;
  (** 
    Collection of inventory entities such as a collection of managed node inventory.
     *)

}

type get_inventory_request = {
  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  result_attributes: result_attribute list option;
  (** 
    The list of inventory item types to return.
     *)

  aggregators: inventory_aggregator list option;
  (** 
    Returns counts of inventory types based on one or more expressions. For example, if you aggregate by using an expression that uses the [AWS:InstanceInformation.PlatformType] type, you can see a count of how many Windows and Linux managed nodes exist in your inventoried fleet.
     *)

  filters: inventory_filter list option;
  (** 
    One or more filters. Use a filter to return a more specific list of results.
     *)

}

type attachment_hash_type = | SHA256

(** 
    A structure that includes attributes that describe a document attachment.
     *)
type attachment_content = {
  url: string option;
  (** 
    The URL location of the attachment content.
     *)

  hash_type: attachment_hash_type option;
  (** 
    The hash algorithm used to calculate the hash value.
     *)

  hash: string option;
  (** 
    The cryptographic hash value of the document content.
     *)

  size: int option;
  (** 
    The size of an attachment in bytes.
     *)

  name: string option;
  (** 
    The name of an attachment.
     *)

}

type get_document_result = {
  review_status: review_status option;
  (** 
    The current review status of a new custom Systems Manager document (SSM document) created by a member of your organization, or of the latest version of an existing SSM document.
    
     Only one version of an SSM document can be in the APPROVED state at a time. When a new version is approved, the status of the previous version changes to REJECTED.
     
      Only one version of an SSM document can be in review, or PENDING, at a time.
       *)

  attachments_content: attachment_content list option;
  (** 
    A description of the document attachments, including names, locations, sizes, and so on.
     *)

  requires: document_requires list option;
  (** 
    A list of SSM documents required by a document. For example, an [ApplicationConfiguration] document requires an [ApplicationConfigurationSchema] document.
     *)

  document_format: document_format option;
  (** 
    The document format, either JSON or YAML.
     *)

  document_type: document_type option;
  (** 
    The document type.
     *)

  content: string option;
  (** 
    The contents of the SSM document.
     *)

  status_information: string option;
  [@ocaml.doc {| 
    A message returned by Amazon Web Services Systems Manager that explains the [Status] value. For example, a [Failed] status might be explained by the [StatusInformation] message, "The specified S3 bucket doesn't exist. Verify that the URL of the S3 bucket is correct."
     |}]

  status: document_status option;
  (** 
    The status of the SSM document, such as [Creating], [Active], [Updating], [Failed], and [Deleting].
     *)

  document_version: string option;
  (** 
    The document version.
     *)

  version_name: string option;
  (** 
    The version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.
     *)

  display_name: string option;
  (** 
    The friendly name of the SSM document. This value can differ for each version of the document. If you want to update this value, see [UpdateDocument].
     *)

  created_date: float option;
  (** 
    The date the SSM document was created.
     *)

  name: string option;
  (** 
    The name of the SSM document.
     *)

}

type get_document_request = {
  document_format: document_format option;
  (** 
    Returns the document in the specified format. The document format can be either JSON or YAML. JSON is the default format.
     *)

  document_version: string option;
  (** 
    The document version for which you want information.
     *)

  version_name: string option;
  (** 
    An optional field specifying the version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document and can't be changed.
     *)

  name: string;
  (** 
    The name of the SSM document.
     *)

}

type get_deployable_patch_snapshot_for_instance_result = {
  product: string option;
  (** 
    Returns the specific operating system (for example Windows Server 2012 or Amazon Linux 2015.09) on the managed node for the specified patch snapshot.
     *)

  snapshot_download_url: string option;
  (** 
    A pre-signed Amazon Simple Storage Service (Amazon S3) URL that can be used to download the patch snapshot.
     *)

  snapshot_id: string option;
  (** 
    The user-defined snapshot ID.
     *)

  instance_id: string option;
  (** 
    The managed node ID.
     *)

}

(** 
    Defines the basic information about a patch baseline override.
     *)
type baseline_override = {
  sources: patch_source list option;
  (** 
    Information about the patches to use to update the managed nodes, including target operating systems and source repositories. Applies to Linux managed nodes only.
     *)

  approved_patches_enable_non_security: bool option;
  (** 
    Indicates whether the list of approved patches includes non-security updates that should be applied to the managed nodes. The default value is [false]. Applies to Linux managed nodes only.
     *)

  rejected_patches_action: patch_action option;
  (** 
    The action for Patch Manager to take on patches included in the [RejectedPackages] list. A patch can be allowed only if it is a dependency of another package, or blocked entirely along with packages that include it as a dependency.
     *)

  rejected_patches: string list option;
  (** 
    A list of explicitly rejected patches for the baseline.
    
     For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}About package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  approved_patches_compliance_level: patch_compliance_level option;
  (** 
    Defines the compliance level for approved patches. When an approved patch is reported as missing, this value describes the severity of the compliance violation.
     *)

  approved_patches: string list option;
  (** 
    A list of explicitly approved patches for the baseline.
    
     For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}About package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  approval_rules: patch_rule_group option;
  
  global_filters: patch_filter_group option;
  
  operating_system: operating_system option;
  (** 
    The operating system rule used by the patch baseline override.
     *)

}

type get_deployable_patch_snapshot_for_instance_request = {
  baseline_override: baseline_override option;
  (** 
    Defines the basic information about a patch baseline override.
     *)

  snapshot_id: string;
  (** 
    The snapshot ID provided by the user when running [AWS-RunPatchBaseline].
     *)

  instance_id: string;
  (** 
    The ID of the managed node for which the appropriate patch snapshot should be retrieved.
     *)

}

type get_default_patch_baseline_result = {
  operating_system: operating_system option;
  (** 
    The operating system for the returned patch baseline.
     *)

  baseline_id: string option;
  (** 
    The ID of the default patch baseline.
     *)

}

type get_default_patch_baseline_request = {
  operating_system: operating_system option;
  (** 
    Returns the default patch baseline for the specified operating system.
     *)

}

type connection_status = | NOT_CONNECTED
  | CONNECTED

type get_connection_status_response = {
  status: connection_status option;
  (** 
    The status of the connection to the managed node.
     *)

  target: string option;
  (** 
    The ID of the managed node to check connection status.
     *)

}

type get_connection_status_request = {
  target: string;
  (** 
    The managed node ID.
     *)

}

type get_command_invocation_result = {
  cloud_watch_output_config: cloud_watch_output_config option;
  (** 
    Amazon CloudWatch Logs information where Systems Manager sent the command output.
     *)

  standard_error_url: string option;
  (** 
    The URL for the complete text written by the plugin to [stderr]. If the command hasn't finished running, then this string is empty.
     *)

  standard_error_content: string option;
  (** 
    The first 8,000 characters written by the plugin to [stderr]. If the command hasn't finished running, then this string is empty.
     *)

  standard_output_url: string option;
  (** 
    The URL for the complete text written by the plugin to [stdout] in Amazon Simple Storage Service (Amazon S3). If an S3 bucket wasn't specified, then this string is empty.
     *)

  standard_output_content: string option;
  (** 
    The first 24,000 characters written by the plugin to [stdout]. If the command hasn't finished running, if [ExecutionStatus] is neither Succeeded nor Failed, then this string is empty.
     *)

  status_details: string option;
  (** 
    A detailed status of the command execution for an invocation. [StatusDetails] includes more information than [Status] because it includes states resulting from error and concurrency control parameters. [StatusDetails] can show different results than [Status]. For more information about these statuses, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/monitor-commands.html}Understanding command statuses} in the {i Amazon Web Services Systems Manager User Guide}. [StatusDetails] can be one of the following values:
    
     {ul
          {- Pending: The command hasn't been sent to the managed node.
             
             }
           {- In Progress: The command has been sent to the managed node but hasn't reached a terminal state.
              
              }
           {- Delayed: The system attempted to send the command to the target, but the target wasn't available. The managed node might not be available because of network issues, because the node was stopped, or for similar reasons. The system will try to send the command again.
              
              }
           {- Success: The command or plugin ran successfully. This is a terminal state.
              
              }
           {- Delivery Timed Out: The command wasn't delivered to the managed node before the delivery timeout expired. Delivery timeouts don't count against the parent command's [MaxErrors] limit, but they do contribute to whether the parent command status is Success or Incomplete. This is a terminal state.
              
              }
           {- Execution Timed Out: The command started to run on the managed node, but the execution wasn't complete before the timeout expired. Execution timeouts count against the [MaxErrors] limit of the parent command. This is a terminal state.
              
              }
           {- Failed: The command wasn't run successfully on the managed node. For a plugin, this indicates that the result code wasn't zero. For a command invocation, this indicates that the result code for one or more plugins wasn't zero. Invocation failures count against the [MaxErrors] limit of the parent command. This is a terminal state.
              
              }
           {- Cancelled: The command was terminated before it was completed. This is a terminal state.
              
              }
           {- Undeliverable: The command can't be delivered to the managed node. The node might not exist or might not be responding. Undeliverable invocations don't count against the parent command's [MaxErrors] limit and don't contribute to whether the parent command status is Success or Incomplete. This is a terminal state.
              
              }
           {- Terminated: The parent command exceeded its [MaxErrors] limit and subsequent command invocations were canceled by the system. This is a terminal state.
              
              }
          
      }
       *)

  status: command_invocation_status option;
  (** 
    The status of this invocation plugin. This status can be different than [StatusDetails].
     *)

  execution_end_date_time: string option;
  (** 
    The date and time the plugin finished running. Date and time are written in ISO 8601 format. For example, June 7, 2017 is represented as 2017-06-7. The following sample Amazon Web Services CLI command uses the [InvokedAfter] filter.
    
     [aws ssm list-commands --filters key=InvokedAfter,value=2017-06-07T00:00:00Z]
     
      If the plugin hasn't started to run, the string is empty.
       *)

  execution_elapsed_time: string option;
  (** 
    Duration since [ExecutionStartDateTime].
     *)

  execution_start_date_time: string option;
  (** 
    The date and time the plugin started running. Date and time are written in ISO 8601 format. For example, June 7, 2017 is represented as 2017-06-7. The following sample Amazon Web Services CLI command uses the [InvokedBefore] filter.
    
     [aws ssm list-commands --filters key=InvokedBefore,value=2017-06-07T00:00:00Z]
     
      If the plugin hasn't started to run, the string is empty.
       *)

  response_code: int option;
  (** 
    The error level response code for the plugin script. If the response code is [-1], then the command hasn't started running on the managed node, or it wasn't received by the node.
     *)

  plugin_name: string option;
  (** 
    The name of the plugin, or {i step name}, for which details are reported. For example, [aws:RunShellScript] is a plugin.
     *)

  document_version: string option;
  (** 
    The Systems Manager document (SSM document) version used in the request.
     *)

  document_name: string option;
  (** 
    The name of the document that was run. For example, [AWS-RunShellScript].
     *)

  comment: string option;
  (** 
    The comment text for the command.
     *)

  instance_id: string option;
  (** 
    The ID of the managed node targeted by the command. A {i managed node} can be an Amazon Elastic Compute Cloud (Amazon EC2) instance, edge device, or on-premises server or VM in your hybrid environment that is configured for Amazon Web Services Systems Manager.
     *)

  command_id: string option;
  (** 
    The parent command ID of the invocation plugin.
     *)

}

type get_command_invocation_request = {
  plugin_name: string option;
  (** 
    The name of the step for which you want detailed results. If the document contains only one step, you can omit the name and details for that step. If the document contains more than one step, you must specify the name of the step for which you want to view details. Be sure to specify the name of the step, not the name of a plugin like [aws:RunShellScript].
    
     To find the [PluginName], check the document content and find the name of the step you want details for. Alternatively, use [ListCommandInvocations] with the [CommandId] and [Details] parameters. The [PluginName] is the [Name] attribute of the [CommandPlugin] object in the [CommandPlugins] list.
      *)

  instance_id: string;
  (** 
    (Required) The ID of the managed node targeted by the command. A {i managed node} can be an Amazon Elastic Compute Cloud (Amazon EC2) instance, edge device, and on-premises server or VM in your hybrid environment that is configured for Amazon Web Services Systems Manager.
     *)

  command_id: string;
  (** 
    (Required) The parent command ID of the invocation plugin.
     *)

}

type calendar_state = | CLOSED
  | OPEN

type get_calendar_state_response = {
  next_transition_time: string option;
  (** 
    The time, as an {{:https://en.wikipedia.org/wiki/ISO_8601}ISO 8601} string, that the calendar state will change. If the current calendar state is [OPEN], [NextTransitionTime] indicates when the calendar state changes to [CLOSED], and vice-versa.
     *)

  at_time: string option;
  (** 
    The time, as an {{:https://en.wikipedia.org/wiki/ISO_8601}ISO 8601} string, that you specified in your command. If you don't specify a time, [GetCalendarState] uses the current time.
     *)

  state: calendar_state option;
  (** 
    The state of the calendar. An [OPEN] calendar indicates that actions are allowed to proceed, and a [CLOSED] calendar indicates that actions aren't allowed to proceed.
     *)

}

type get_calendar_state_request = {
  at_time: string option;
  (** 
    (Optional) The specific time for which you want to get calendar state information, in {{:https://en.wikipedia.org/wiki/ISO_8601}ISO 8601} format. If you don't specify a value or [AtTime], the current time is used.
     *)

  calendar_names: string list;
  (** 
    The names or Amazon Resource Names (ARNs) of the Systems Manager documents (SSM documents) that represent the calendar entries for which you want to get the state.
     *)

}

type automation_subtype = | ChangeRequest

(** 
    Detailed information about the current state of an individual Automation execution.
     *)
type automation_execution = {
  variables: (string * string list) list option;
  (** 
    Variables defined for the automation.
     *)

  change_request_name: string option;
  (** 
    The name of the Change Manager change request.
     *)

  association_id: string option;
  (** 
    The ID of a State Manager association used in the Automation operation.
     *)

  ops_item_id: string option;
  (** 
    The ID of an OpsItem that is created to represent a Change Manager change request.
     *)

  runbooks: runbook list option;
  (** 
    Information about the Automation runbooks that are run as part of a runbook workflow.
    
     The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.
     
      *)

  scheduled_time: float option;
  (** 
    The date and time the Automation operation is scheduled to start.
     *)

  automation_subtype: automation_subtype option;
  (** 
    The subtype of the Automation operation. Currently, the only supported value is [ChangeRequest].
     *)

  triggered_alarms: alarm_state_information list option;
  (** 
    The CloudWatch alarm that was invoked by the automation.
     *)

  alarm_configuration: alarm_configuration option;
  (** 
    The details for the CloudWatch alarm applied to your automation.
     *)

  progress_counters: progress_counters option;
  (** 
    An aggregate of step execution statuses displayed in the Amazon Web Services Systems Manager console for a multi-Region and multi-account Automation execution.
     *)

  target_locations: target_location list option;
  (** 
    The combination of Amazon Web Services Regions and/or Amazon Web Services accounts where you want to run the Automation.
     *)

  target: string option;
  (** 
    The target of the execution.
     *)

  max_errors: string option;
  (** 
    The MaxErrors value specified by the user when the execution started.
     *)

  max_concurrency: string option;
  (** 
    The [MaxConcurrency] value specified by the user when the execution started.
     *)

  resolved_targets: resolved_targets option;
  (** 
    A list of resolved targets in the rate control execution.
     *)

  target_maps: (string * string list) list list option;
  (** 
    The specified key-value mapping of document parameters to target resources.
     *)

  targets: target list option;
  (** 
    The specified targets.
     *)

  target_parameter_name: string option;
  (** 
    The parameter name.
     *)

  current_action: string option;
  (** 
    The action of the step that is currently running.
     *)

  current_step_name: string option;
  (** 
    The name of the step that is currently running.
     *)

  executed_by: string option;
  (** 
    The Amazon Resource Name (ARN) of the user who ran the automation.
     *)

  parent_automation_execution_id: string option;
  (** 
    The AutomationExecutionId of the parent automation.
     *)

  mode: execution_mode option;
  (** 
    The automation execution mode.
     *)

  failure_message: string option;
  (** 
    A message describing why an execution has failed, if the status is set to Failed.
     *)

  outputs: (string * string list) list option;
  (** 
    The list of execution outputs as defined in the Automation runbook.
     *)

  parameters: (string * string list) list option;
  (** 
    The key-value map of execution parameters, which were supplied when calling [StartAutomationExecution].
     *)

  step_executions_truncated: bool option;
  (** 
    A boolean value that indicates if the response contains the full list of the Automation step executions. If true, use the DescribeAutomationStepExecutions API operation to get the full list of step executions.
     *)

  step_executions: step_execution list option;
  (** 
    A list of details about the current state of all steps that comprise an execution. An Automation runbook contains a list of steps that are run in order.
     *)

  automation_execution_status: automation_execution_status option;
  (** 
    The execution status of the Automation.
     *)

  execution_end_time: float option;
  (** 
    The time the execution finished.
     *)

  execution_start_time: float option;
  (** 
    The time the execution started.
     *)

  document_version: string option;
  (** 
    The version of the document to use during execution.
     *)

  document_name: string option;
  (** 
    The name of the Automation runbook used during the execution.
     *)

  automation_execution_id: string option;
  (** 
    The execution ID.
     *)

}

type get_automation_execution_result = {
  automation_execution: automation_execution option;
  (** 
    Detailed information about the current state of an automation execution.
     *)

}

type get_automation_execution_request = {
  automation_execution_id: string;
  (** 
    The unique identifier for an existing automation execution to examine. The execution ID is returned by StartAutomationExecution when the execution of an Automation runbook is initiated.
     *)

}

type fault = | Unknown
  | Server
  | Client

(** 
    Describes the association of a Amazon Web Services Systems Manager document (SSM document) and a managed node.
     *)
type create_association_batch_request_entry = {
  alarm_configuration: alarm_configuration option;
  
  target_maps: (string * string list) list list option;
  (** 
    A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.
     *)

  duration: int option;
  (** 
    The number of hours the association can run before it is canceled. Duration applies to associations that are currently running, and any pending and in progress commands on all targets. If a target was taken offline for the association to run, it is made available again immediately, without a reboot.
    
     The [Duration] parameter applies only when both these conditions are true:
     
      {ul
           {- The association for which you specify a duration is cancelable according to the parameters of the SSM command document or Automation runbook associated with this execution.
              
              }
            {- The command specifies the 
               {[
               {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_CreateAssociationBatchRequestEntry.html#systemsmanager-Type-CreateAssociationBatchRequestEntry-ApplyOnlyAtCronInterval}ApplyOnlyAtCronInterval}
               ]}
                parameter, which means that the association doesn't run immediately after it is created, but only according to the specified schedule.
               
               }
           
      }
       *)

  schedule_offset: int option;
  (** 
    Number of days to wait after the scheduled day to run an association.
     *)

  target_locations: target_location list option;
  (** 
    Use this action to create an association in multiple Regions and multiple accounts.
     *)

  calendar_names: string list option;
  (** 
    The names or Amazon Resource Names (ARNs) of the Change Calendar type documents your associations are gated under. The associations only run when that Change Calendar is open. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar}Amazon Web Services Systems Manager Change Calendar}.
     *)

  apply_only_at_cron_interval: bool option;
  (** 
    By default, when you create a new associations, the system runs it immediately after it is created and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you create it. This parameter isn't supported for rate expressions.
     *)

  sync_compliance: association_sync_compliance option;
  (** 
    The mode for generating association compliance. You can specify [AUTO] or [MANUAL]. In [AUTO] mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is [COMPLIANT]. If the association execution doesn't run successfully, the association is [NON-COMPLIANT].
    
     In [MANUAL] mode, you must specify the [AssociationId] as a parameter for the [PutComplianceItems] API operation. In this case, compliance data isn't managed by State Manager, a capability of Amazon Web Services Systems Manager. It is managed by your direct call to the [PutComplianceItems] API operation.
     
      By default, all associations use [AUTO] mode.
       *)

  compliance_severity: association_compliance_severity option;
  (** 
    The severity level to assign to the association.
     *)

  max_concurrency: string option;
  (** 
    The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.
    
     If a new managed node starts and attempts to run an association while Systems Manager is running [MaxConcurrency] associations, the association is allowed to run. During the next association interval, the new managed node will process its association within the limit specified for [MaxConcurrency].
      *)

  max_errors: string option;
  (** 
    The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 managed nodes and set [MaxError] to 10%, then the system stops sending the request when the sixth error is received.
    
     Executions that are already running an association when [MaxErrors] is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set [MaxConcurrency] to 1 so that executions proceed one at a time.
      *)

  association_name: string option;
  (** 
    Specify a descriptive name for the association.
     *)

  output_location: instance_association_output_location option;
  (** 
    An S3 bucket where you want to store the results of this request.
     *)

  schedule_expression: string option;
  (** 
    A cron expression that specifies a schedule when the association runs.
     *)

  targets: target list option;
  (** 
    The managed nodes targeted by the request.
     *)

  document_version: string option;
  (** 
    The document version.
     *)

  automation_target_parameter_name: string option;
  (** 
    Specify the target for the association. This target is required for associations that use an Automation runbook and target resources by using rate controls. Automation is a capability of Amazon Web Services Systems Manager.
     *)

  parameters: (string * string list) list option;
  (** 
    A description of the parameters for a document.
     *)

  instance_id: string option;
  (** 
    The managed node ID.
    
     [InstanceId] has been deprecated. To specify a managed node ID for an association, use the [Targets] parameter. Requests that include the parameter [InstanceID] with Systems Manager documents (SSM documents) that use schema version 2.0 or later will fail. In addition, if you use the parameter [InstanceId], you can't use the parameters [AssociationName], [DocumentVersion], [MaxErrors], [MaxConcurrency], [OutputLocation], or [ScheduleExpression]. To use these parameters, you must use the [Targets] parameter.
     
      *)

  name: string;
  (** 
    The name of the SSM document that contains the configuration information for the managed node. You can specify Command or Automation runbooks.
    
     You can specify Amazon Web Services-predefined documents, documents you created, or a document that is shared with you from another account.
     
      For SSM documents that are shared with you from other Amazon Web Services accounts, you must specify the complete SSM document ARN, in the following format:
      
       
       {[
       arn:aws:ssm:{i region}:{i account-id}:document/{i document-name}
       ]}
       
       
        For example:
        
         [arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document]
         
          For Amazon Web Services-predefined documents and SSM documents you created in your account, you only need to specify the document name. For example, [AWS-ApplyPatchBaseline] or [My-Document].
           *)

}

(** 
    Describes a failed association.
     *)
type failed_create_association = {
  fault: fault option;
  (** 
    The source of the failure.
     *)

  message: string option;
  (** 
    A description of the failure.
     *)

  entry: create_association_batch_request_entry option;
  (** 
    The association.
     *)

}

(** 
    The [EffectivePatch] structure defines metadata about a patch along with the approval state of the patch in a particular patch baseline. The approval state includes information about whether the patch is currently approved, due to be approved by a rule, explicitly approved, or explicitly rejected and the date the patch was or will be approved.
     *)
type effective_patch = {
  patch_status: patch_status option;
  (** 
    The status of the patch in a patch baseline. This includes information about whether the patch is currently approved, due to be approved by a rule, explicitly approved, or explicitly rejected and the date the patch was or will be approved.
     *)

  patch: patch option;
  (** 
    Provides metadata for a patch, including information such as the KB ID, severity, classification and a URL for where more information can be obtained about the patch.
     *)

}

(** 
    The specified document already exists.
     *)
type document_already_exists = {
  message: string option;
  
}

type disassociate_ops_item_related_item_response = unit

type disassociate_ops_item_related_item_request = {
  association_id: string;
  (** 
    The ID of the association for which you want to delete an association between the OpsItem and a related item.
     *)

  ops_item_id: string;
  (** 
    The ID of the OpsItem for which you want to delete an association between the OpsItem and a related item.
     *)

}

type describe_sessions_response = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  sessions: session list option;
  (** 
    A list of sessions meeting the request parameters.
     *)

}

type describe_sessions_request = {
  filters: session_filter list option;
  (** 
    One or more filters to limit the type of sessions returned by the request.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  state: session_state;
  [@ocaml.doc {| 
    The session status to retrieve a list of sessions for. For example, "Active".
     |}]

}

type describe_patch_properties_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You use this token in the next call.)
     *)

  properties: (string * string) list list option;
  (** 
    A list of the properties for patches matching the filter request parameters.
     *)

}

type describe_patch_properties_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  patch_set: patch_set option;
  (** 
    Indicates whether to list patches for the Windows operating system or for applications released by Microsoft. Not applicable for the Linux or macOS operating systems.
     *)

  property: patch_property;
  (** 
    The patch property for which you want to view patch details.
     *)

  operating_system: operating_system;
  (** 
    The operating system type for which to list patches.
     *)

}

type describe_patch_groups_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  mappings: patch_group_patch_baseline_mapping list option;
  [@ocaml.doc {| 
    Each entry in the array contains:
    
     {ul
          {- [PatchGroup]: string (between 1 and 256 characters. Regex: [^(\[\p{L}\p{Z}\p{N}_.:/=+\-@\]*)$)]
             
             }
           {- [PatchBaselineIdentity]: A [PatchBaselineIdentity] element.
              
              }
          
      }
       |}]

}

type describe_patch_groups_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  filters: patch_orchestrator_filter list option;
  (** 
    Each element in the array is a structure containing a key-value pair.
    
     Supported keys for [DescribePatchGroups] include the following:
     
      {ul
           {- {b [NAME_PREFIX]}
              
               Sample values: [AWS-] | [My-].
               
               }
            {- {b [OPERATING_SYSTEM]}
               
                Sample values: [AMAZON_LINUX] | [SUSE] | [WINDOWS]
                
                }
           
      }
       *)

  max_results: int option;
  (** 
    The maximum number of patch groups to return (per page).
     *)

}

type describe_patch_group_state_result = {
  instances_with_other_non_compliant_patches: int option;
  (** 
    The number of managed nodes with patches installed that are specified as other than [Critical] or [Security] but aren't compliant with the patch baseline. The status of these managed nodes is [NON_COMPLIANT].
     *)

  instances_with_security_non_compliant_patches: int option;
  (** 
    The number of managed nodes where patches that are specified as [Security] in a patch advisory aren't installed. These patches might be missing, have failed installation, were rejected, or were installed but awaiting a required managed node reboot. The status of these managed nodes is [NON_COMPLIANT].
     *)

  instances_with_critical_non_compliant_patches: int option;
  (** 
    The number of managed nodes where patches that are specified as [Critical] for compliance reporting in the patch baseline aren't installed. These patches might be missing, have failed installation, were rejected, or were installed but awaiting a required managed node reboot. The status of these managed nodes is [NON_COMPLIANT].
     *)

  instances_with_unreported_not_applicable_patches: int option;
  (** 
    The number of managed nodes with [NotApplicable] patches beyond the supported limit, which aren't reported by name to Inventory. Inventory is a capability of Amazon Web Services Systems Manager.
     *)

  instances_with_not_applicable_patches: int option;
  (** 
    The number of managed nodes with patches that aren't applicable.
     *)

  instances_with_failed_patches: int option;
  (** 
    The number of managed nodes with patches from the patch baseline that failed to install.
     *)

  instances_with_missing_patches: int option;
  (** 
    The number of managed nodes with missing patches from the patch baseline.
     *)

  instances_with_installed_rejected_patches: int option;
  (** 
    The number of managed nodes with patches installed that are specified in a [RejectedPatches] list. Patches with a status of [INSTALLED_REJECTED] were typically installed before they were added to a [RejectedPatches] list.
    
     If [ALLOW_AS_DEPENDENCY] is the specified option for [RejectedPatchesAction], the value of [InstancesWithInstalledRejectedPatches] will always be [0] (zero).
     
      *)

  instances_with_installed_pending_reboot_patches: int option;
  (** 
    The number of managed nodes with patches installed by Patch Manager that haven't been rebooted after the patch installation. The status of these managed nodes is [NON_COMPLIANT].
     *)

  instances_with_installed_other_patches: int option;
  (** 
    The number of managed nodes with patches installed that aren't defined in the patch baseline.
     *)

  instances_with_installed_patches: int option;
  (** 
    The number of managed nodes with installed patches.
     *)

  instances: int option;
  (** 
    The number of managed nodes in the patch group.
     *)

}

type describe_patch_group_state_request = {
  patch_group: string;
  (** 
    The name of the patch group whose patch snapshot should be retrieved.
     *)

}

type describe_patch_baselines_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  baseline_identities: patch_baseline_identity list option;
  (** 
    An array of [PatchBaselineIdentity] elements.
     *)

}

type describe_patch_baselines_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of patch baselines to return (per page).
     *)

  filters: patch_orchestrator_filter list option;
  (** 
    Each element in the array is a structure containing a key-value pair.
    
     Supported keys for [DescribePatchBaselines] include the following:
     
      {ul
           {- {b [NAME_PREFIX]}
              
               Sample values: [AWS-] | [My-]
               
               }
            {- {b [OWNER]}
               
                Sample values: [AWS] | [Self]
                
                }
            {- {b [OPERATING_SYSTEM]}
               
                Sample values: [AMAZON_LINUX] | [SUSE] | [WINDOWS]
                
                }
           
      }
       *)

}

type describe_parameters_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items.
     *)

  parameters: parameter_metadata list option;
  (** 
    Parameters returned by the request.
     *)

}

type describe_parameters_request = {
  shared: bool option;
  (** 
    Lists parameters that are shared with you.
    
     By default when using this option, the command returns parameters that have been shared using a standard Resource Access Manager Resource Share. In order for a parameter that was shared using the [PutResourcePolicy] command to be returned, the associated [RAM Resource Share Created From Policy] must have been promoted to a standard Resource Share using the RAM {{:https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html}PromoteResourceShareCreatedFromPolicy} API operation.
     
      For more information about sharing parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html}Working with shared parameters} in the {i Amazon Web Services Systems Manager User Guide}.
      
       *)

  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  parameter_filters: parameter_string_filter list option;
  (** 
    Filters to limit the request results.
     *)

  filters: parameters_filter list option;
  (** 
    This data type is deprecated. Instead, use [ParameterFilters].
     *)

}

type describe_ops_items_response = {
  ops_item_summaries: ops_item_summary list option;
  (** 
    A list of OpsItems.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

}

type describe_ops_items_request = {
  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  ops_item_filters: ops_item_filter list option;
  [@ocaml.doc {| 
    One or more filters to limit the response.
    
     {ul
          {- Key: CreatedTime
             
              Operations: GreaterThan, LessThan
              
              }
           {- Key: LastModifiedBy
              
               Operations: Contains, Equals
               
               }
           {- Key: LastModifiedTime
              
               Operations: GreaterThan, LessThan
               
               }
           {- Key: Priority
              
               Operations: Equals
               
               }
           {- Key: Source
              
               Operations: Contains, Equals
               
               }
           {- Key: Status
              
               Operations: Equals
               
               }
           {- Key: Title*
              
               Operations: Equals,Contains
               
               }
           {- Key: OperationalData**
              
               Operations: Equals
               
               }
           {- Key: OperationalDataKey
              
               Operations: Equals
               
               }
           {- Key: OperationalDataValue
              
               Operations: Equals, Contains
               
               }
           {- Key: OpsItemId
              
               Operations: Equals
               
               }
           {- Key: ResourceId
              
               Operations: Contains
               
               }
           {- Key: AutomationId
              
               Operations: Equals
               
               }
           {- Key: AccountId
              
               Operations: Equals
               
               }
          
      }
       *The Equals operator for Title matches the first 100 characters. If you specify more than 100 characters, they system returns an error that the filter value exceeds the length limit.
       
        **If you filter the response by using the OperationalData operator, specify a key-value pair by using the following JSON format: \{"key":"key_name","value":"a_value"\}
         |}]

}

type describe_maintenance_windows_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  window_identities: maintenance_window_identity list option;
  (** 
    Information about the maintenance windows.
     *)

}

type describe_maintenance_windows_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: maintenance_window_filter list option;
  (** 
    Optional filters used to narrow down the scope of the returned maintenance windows. Supported filter keys are [Name] and [Enabled]. For example, [Name=MyMaintenanceWindow] and [Enabled=True].
     *)

}

type describe_maintenance_windows_for_target_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You use this token in the next call.)
     *)

  window_identities: maintenance_window_identity_for_target list option;
  (** 
    Information about the maintenance window targets and tasks a managed node is associated with.
     *)

}

type describe_maintenance_windows_for_target_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  resource_type: maintenance_window_resource_type;
  (** 
    The type of resource you want to retrieve information about. For example, [INSTANCE].
     *)

  targets: target list;
  (** 
    The managed node ID or key-value pair to retrieve information about.
     *)

}

type describe_maintenance_window_tasks_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  tasks: maintenance_window_task list option;
  (** 
    Information about the tasks in the maintenance window.
     *)

}

type describe_maintenance_window_tasks_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: maintenance_window_filter list option;
  (** 
    Optional filters used to narrow down the scope of the returned tasks. The supported filter keys are [WindowTaskId], [TaskArn], [Priority], and [TaskType].
     *)

  window_id: string;
  (** 
    The ID of the maintenance window whose tasks should be retrieved.
     *)

}

type describe_maintenance_window_targets_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  targets: maintenance_window_target list option;
  (** 
    Information about the targets in the maintenance window.
     *)

}

type describe_maintenance_window_targets_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: maintenance_window_filter list option;
  (** 
    Optional filters that can be used to narrow down the scope of the returned window targets. The supported filter keys are [Type], [WindowTargetId], and [OwnerInformation].
     *)

  window_id: string;
  (** 
    The ID of the maintenance window whose targets should be retrieved.
     *)

}

type describe_maintenance_window_schedule_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You use this token in the next call.)
     *)

  scheduled_window_executions: scheduled_window_execution list option;
  (** 
    Information about maintenance window executions scheduled for the specified time range.
     *)

}

type describe_maintenance_window_schedule_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: patch_orchestrator_filter list option;
  (** 
    Filters used to limit the range of results. For example, you can limit maintenance window executions to only those scheduled before or after a certain date and time.
     *)

  resource_type: maintenance_window_resource_type option;
  (** 
    The type of resource you want to retrieve information about. For example, [INSTANCE].
     *)

  targets: target list option;
  (** 
    The managed node ID or key-value pair to retrieve information about.
     *)

  window_id: string option;
  (** 
    The ID of the maintenance window to retrieve information about.
     *)

}

type describe_maintenance_window_executions_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  window_executions: maintenance_window_execution list option;
  (** 
    Information about the maintenance window executions.
     *)

}

type describe_maintenance_window_executions_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: maintenance_window_filter list option;
  (** 
    Each entry in the array is a structure containing:
    
     {ul
          {- Key. A string between 1 and 128 characters. Supported keys include [ExecutedBefore] and [ExecutedAfter].
             
             }
           {- Values. An array of strings, each between 1 and 256 characters. Supported values are date/time strings in a valid ISO 8601 date/time format, such as [2021-11-04T05:00:00Z].
              
              }
          
      }
       *)

  window_id: string;
  (** 
    The ID of the maintenance window whose executions should be retrieved.
     *)

}

type describe_maintenance_window_execution_tasks_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  window_execution_task_identities: maintenance_window_execution_task_identity list option;
  (** 
    Information about the task executions.
     *)

}

type describe_maintenance_window_execution_tasks_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: maintenance_window_filter list option;
  (** 
    Optional filters used to scope down the returned tasks. The supported filter key is [STATUS] with the corresponding values [PENDING], [IN_PROGRESS], [SUCCESS], [FAILED], [TIMED_OUT], [CANCELLING], and [CANCELLED].
     *)

  window_execution_id: string;
  (** 
    The ID of the maintenance window execution whose task executions should be retrieved.
     *)

}

type describe_maintenance_window_execution_task_invocations_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  window_execution_task_invocation_identities: maintenance_window_execution_task_invocation_identity list option;
  (** 
    Information about the task invocation results per invocation.
     *)

}

type describe_maintenance_window_execution_task_invocations_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: maintenance_window_filter list option;
  (** 
    Optional filters used to scope down the returned task invocations. The supported filter key is [STATUS] with the corresponding values [PENDING], [IN_PROGRESS], [SUCCESS], [FAILED], [TIMED_OUT], [CANCELLING], and [CANCELLED].
     *)

  task_id: string;
  (** 
    The ID of the specific task in the maintenance window task that should be retrieved.
     *)

  window_execution_id: string;
  (** 
    The ID of the maintenance window execution the task is part of.
     *)

}

type describe_inventory_deletions_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  inventory_deletions: inventory_deletion_status_item list option;
  (** 
    A list of status items for deleted inventory.
     *)

}

type describe_inventory_deletions_request = {
  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  deletion_id: string option;
  (** 
    Specify the delete inventory ID for which you want information. This ID was returned by the [DeleteInventory] operation.
     *)

}

type describe_instance_properties_result = {
  next_token: string option;
  (** 
    The token for the next set of properties to return. Use this token to get the next set of results.
     *)

  instance_properties: instance_property list option;
  (** 
    Properties for the managed instances.
     *)

}

type describe_instance_properties_request = {
  next_token: string option;
  (** 
    The token provided by a previous request to use to return the next set of properties.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for the call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters_with_operator: instance_property_string_filter list option;
  (** 
    The request filters to use with the operator.
     *)

  instance_property_filter_list: instance_property_filter list option;
  (** 
    An array of instance property filters.
     *)

}

type describe_instance_patches_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  patches: patch_compliance_data list option;
  [@ocaml.doc {| 
    Each entry in the array is a structure containing:
    
     {ul
          {- Title (string)
             
             }
           {- KBId (string)
              
              }
           {- Classification (string)
              
              }
           {- Severity (string)
              
              }
           {- State (string, such as "INSTALLED" or "FAILED")
              
              }
           {- InstalledTime (DateTime)
              
              }
           {- InstalledBy (string)
              
              }
          
      }
       |}]

}

type describe_instance_patches_request = {
  max_results: int option;
  (** 
    The maximum number of patches to return (per page).
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  filters: patch_orchestrator_filter list option;
  (** 
    Each element in the array is a structure containing a key-value pair.
    
     Supported keys for [DescribeInstancePatches]include the following:
     
      {ul
           {- {b [Classification]}
              
               Sample values: [Security] | [SecurityUpdates]
               
               }
            {- {b [KBId]}
               
                Sample values: [KB4480056] | [java-1.7.0-openjdk.x86_64]
                
                }
            {- {b [Severity]}
               
                Sample values: [Important] | [Medium] | [Low]
                
                }
            {- {b [State]}
               
                Sample values: [Installed] | [InstalledOther] | [InstalledPendingReboot]
                
                 For lists of all [State] values, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-compliance-states.html}Understanding patch compliance state values} in the {i Amazon Web Services Systems Manager User Guide}.
                 
                 }
           
      }
       *)

  instance_id: string;
  (** 
    The ID of the managed node whose patch state information should be retrieved.
     *)

}

type describe_instance_patch_states_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  instance_patch_states: instance_patch_state list option;
  (** 
    The high-level patch state for the requested managed nodes.
     *)

}

type describe_instance_patch_states_request = {
  max_results: int option;
  (** 
    The maximum number of managed nodes to return (per page).
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  instance_ids: string list;
  (** 
    The ID of the managed node for which patch state information should be retrieved.
     *)

}

type describe_instance_patch_states_for_patch_group_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  instance_patch_states: instance_patch_state list option;
  (** 
    The high-level patch state for the requested managed nodes.
     *)

}

type describe_instance_patch_states_for_patch_group_request = {
  max_results: int option;
  (** 
    The maximum number of patches to return (per page).
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  filters: instance_patch_state_filter list option;
  [@ocaml.doc {| 
    Each entry in the array is a structure containing:
    
     {ul
          {- Key (string between 1 and 200 characters)
             
             }
           {- Values (array containing a single string)
              
              }
           {- Type (string "Equal", "NotEqual", "LessThan", "GreaterThan")
              
              }
          
      }
       |}]

  patch_group: string;
  (** 
    The name of the patch group for which the patch state information should be retrieved.
     *)

}

type describe_instance_information_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  instance_information_list: instance_information list option;
  (** 
    The managed node information list.
     *)

}

type describe_instance_information_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results. The default value is 10 items.
     *)

  filters: instance_information_string_filter list option;
  (** 
    One or more filters. Use a filter to return a more specific list of managed nodes. You can filter based on tags applied to your managed nodes. Tag filters can't be combined with other filter types. Use this [Filters] data type instead of [InstanceInformationFilterList], which is deprecated.
     *)

  instance_information_filter_list: instance_information_filter list option;
  (** 
    This is a legacy method. We recommend that you don't use this method. Instead, use the [Filters] data type. [Filters] enables you to return node information by filtering based on tags applied to managed nodes.
    
     Attempting to use [InstanceInformationFilterList] and [Filters] leads to an exception error.
     
      *)

}

type describe_instance_associations_status_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  instance_association_status_infos: instance_association_status_info list option;
  (** 
    Status information about the association.
     *)

}

type describe_instance_associations_status_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  instance_id: string;
  (** 
    The managed node IDs for which you want association status information.
     *)

}

type describe_effective_patches_for_patch_baseline_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  effective_patches: effective_patch list option;
  (** 
    An array of patches and patch status.
     *)

}

type describe_effective_patches_for_patch_baseline_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of patches to return (per page).
     *)

  baseline_id: string;
  (** 
    The ID of the patch baseline to retrieve the effective patches for.
     *)

}

type describe_effective_instance_associations_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  associations: instance_association list option;
  (** 
    The associations for the requested managed node.
     *)

}

type describe_effective_instance_associations_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  instance_id: string;
  (** 
    The managed node ID for which you want to view all associations.
     *)

}

type describe_document_result = {
  document: document_description option;
  (** 
    Information about the SSM document.
     *)

}

type describe_document_request = {
  version_name: string option;
  (** 
    An optional field specifying the version of the artifact associated with the document. For example, 12.6. This value is unique across all versions of a document, and can't be changed.
     *)

  document_version: string option;
  (** 
    The document version for which you want information. Can be a specific version or the default version.
     *)

  name: string;
  (** 
    The name of the SSM document.
     *)

}

(** 
    Information includes the Amazon Web Services account ID where the current document is shared and the version shared with that account.
     *)
type account_sharing_info = {
  shared_document_version: string option;
  (** 
    The version of the current document shared with the account.
     *)

  account_id: string option;
  (** 
    The Amazon Web Services account ID where the current document is shared.
     *)

}

type describe_document_permission_response = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  account_sharing_info_list: account_sharing_info list option;
  (** 
    A list of Amazon Web Services accounts where the current document is shared and the version shared with each account.
     *)

  account_ids: string list option;
  (** 
    The account IDs that have permission to use this document. The ID can be either an Amazon Web Services account or {i All}.
     *)

}

type describe_document_permission_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  permission_type: document_permission_type;
  (** 
    The permission type for the document. The permission type can be {i Share}.
     *)

  name: string;
  (** 
    The name of the document for which you are the owner.
     *)

}

type describe_available_patches_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  patches: patch list option;
  (** 
    An array of patches. Each entry in the array is a patch structure.
     *)

}

type describe_available_patches_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of patches to return (per page).
     *)

  filters: patch_orchestrator_filter list option;
  (** 
    Each element in the array is a structure containing a key-value pair.
    
     {b Windows Server}
     
      Supported keys for Windows Server managed node patches include the following:
      
       {ul
            {- {b [PATCH_SET]}
               
                Sample values: [OS] | [APPLICATION]
                
                }
             {- {b [PRODUCT]}
                
                 Sample values: [WindowsServer2012] | [Office 2010] | [MicrosoftDefenderAntivirus]
                 
                 }
             {- {b [PRODUCT_FAMILY]}
                
                 Sample values: [Windows] | [Office]
                 
                 }
             {- {b [MSRC_SEVERITY]}
                
                 Sample values: [ServicePacks] | [Important] | [Moderate]
                 
                 }
             {- {b [CLASSIFICATION]}
                
                 Sample values: [ServicePacks] | [SecurityUpdates] | [DefinitionUpdates]
                 
                 }
             {- {b [PATCH_ID]}
                
                 Sample values: [KB123456] | [KB4516046]
                 
                 }
            
      }
       {b Linux}
       
        When specifying filters for Linux patches, you must specify a key-pair for [PRODUCT]. For example, using the Command Line Interface (CLI), the following command fails:
        
         [aws ssm describe-available-patches --filters Key=CVE_ID,Values=CVE-2018-3615]
         
          However, the following command succeeds:
          
           [aws ssm describe-available-patches --filters Key=PRODUCT,Values=AmazonLinux2018.03
     Key=CVE_ID,Values=CVE-2018-3615]
           
            Supported keys for Linux managed node patches include the following:
            
             {ul
                  {- {b [PRODUCT]}
                     
                      Sample values: [AmazonLinux2018.03] | [AmazonLinux2.0]
                      
                      }
                   {- {b [NAME]}
                      
                       Sample values: [kernel-headers] | [samba-python] | [php]
                       
                       }
                   {- {b [SEVERITY]}
                      
                       Sample values: [Critical] | [Important] | [Medium] | [Low]
                       
                       }
                   {- {b [EPOCH]}
                      
                       Sample values: [0] | [1]
                       
                       }
                   {- {b [VERSION]}
                      
                       Sample values: [78.6.1] | [4.10.16]
                       
                       }
                   {- {b [RELEASE]}
                      
                       Sample values: [9.56.amzn1] | [1.amzn2]
                       
                       }
                   {- {b [ARCH]}
                      
                       Sample values: [i686] | [x86_64]
                       
                       }
                   {- {b [REPOSITORY]}
                      
                       Sample values: [Core] | [Updates]
                       
                       }
                   {- {b [ADVISORY_ID]}
                      
                       Sample values: [ALAS-2018-1058] | [ALAS2-2021-1594]
                       
                       }
                   {- {b [CVE_ID]}
                      
                       Sample values: [CVE-2018-3615] | [CVE-2020-1472]
                       
                       }
                   {- {b [BUGZILLA_ID]}
                      
                       Sample values: [1463241]
                       
                       }
                  
      }
       *)

}

type describe_automation_step_executions_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  step_executions: step_execution list option;
  (** 
    A list of details about the current state of all steps that make up an execution.
     *)

}

type describe_automation_step_executions_request = {
  reverse_order: bool option;
  (** 
    Indicates whether to list step executions in reverse order by start time. The default value is 'false'.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  filters: step_execution_filter list option;
  (** 
    One or more filters to limit the number of step executions returned by the request.
     *)

  automation_execution_id: string;
  (** 
    The Automation execution ID for which you want step execution descriptions.
     *)

}

type automation_type = | Local
  | CrossAccount

(** 
    Details about a specific Automation execution.
     *)
type automation_execution_metadata = {
  change_request_name: string option;
  (** 
    The name of the Change Manager change request.
     *)

  association_id: string option;
  (** 
    The ID of a State Manager association used in the Automation operation.
     *)

  ops_item_id: string option;
  (** 
    The ID of an OpsItem that is created to represent a Change Manager change request.
     *)

  runbooks: runbook list option;
  (** 
    Information about the Automation runbooks that are run during a runbook workflow in Change Manager.
    
     The Automation runbooks specified for the runbook workflow can't run until all required approvals for the change request have been received.
     
      *)

  scheduled_time: float option;
  (** 
    The date and time the Automation operation is scheduled to start.
     *)

  automation_subtype: automation_subtype option;
  (** 
    The subtype of the Automation operation. Currently, the only supported value is [ChangeRequest].
     *)

  triggered_alarms: alarm_state_information list option;
  (** 
    The CloudWatch alarm that was invoked by the automation.
     *)

  alarm_configuration: alarm_configuration option;
  (** 
    The details for the CloudWatch alarm applied to your automation.
     *)

  automation_type: automation_type option;
  (** 
    Use this filter with [DescribeAutomationExecutions]. Specify either Local or CrossAccount. CrossAccount is an Automation that runs in multiple Amazon Web Services Regions and Amazon Web Services accounts. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-automation-multiple-accounts-and-regions.html}Running Automation workflows in multiple Amazon Web Services Regions and accounts} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  target: string option;
  (** 
    The list of execution outputs as defined in the Automation runbook.
     *)

  max_errors: string option;
  (** 
    The [MaxErrors] value specified by the user when starting the automation.
     *)

  max_concurrency: string option;
  (** 
    The [MaxConcurrency] value specified by the user when starting the automation.
     *)

  resolved_targets: resolved_targets option;
  (** 
    A list of targets that resolved during the execution.
     *)

  target_maps: (string * string list) list list option;
  (** 
    The specified key-value mapping of document parameters to target resources.
     *)

  targets: target list option;
  (** 
    The targets defined by the user when starting the automation.
     *)

  target_parameter_name: string option;
  (** 
    The list of execution outputs as defined in the Automation runbook.
     *)

  failure_message: string option;
  (** 
    The list of execution outputs as defined in the Automation runbook.
     *)

  current_action: string option;
  (** 
    The action of the step that is currently running.
     *)

  current_step_name: string option;
  (** 
    The name of the step that is currently running.
     *)

  parent_automation_execution_id: string option;
  (** 
    The execution ID of the parent automation.
     *)

  mode: execution_mode option;
  (** 
    The Automation execution mode.
     *)

  outputs: (string * string list) list option;
  (** 
    The list of execution outputs as defined in the Automation runbook.
     *)

  log_file: string option;
  (** 
    An S3 bucket where execution information is stored.
     *)

  executed_by: string option;
  (** 
    The IAM role ARN of the user who ran the automation.
     *)

  execution_end_time: float option;
  (** 
    The time the execution finished. This isn't populated if the execution is still in progress.
     *)

  execution_start_time: float option;
  (** 
    The time the execution started.
     *)

  automation_execution_status: automation_execution_status option;
  (** 
    The status of the execution.
     *)

  document_version: string option;
  (** 
    The document version used during the execution.
     *)

  document_name: string option;
  (** 
    The name of the Automation runbook used during execution.
     *)

  automation_execution_id: string option;
  (** 
    The execution ID.
     *)

}

type describe_automation_executions_result = {
  next_token: string option;
  (** 
    The token to use when requesting the next set of items. If there are no additional items to return, the string is empty.
     *)

  automation_execution_metadata_list: automation_execution_metadata list option;
  (** 
    The list of details about each automation execution which has occurred which matches the filter specification, if any.
     *)

}

type automation_execution_filter_key = | OPS_ITEM_ID
  | AUTOMATION_SUBTYPE
  | TARGET_RESOURCE_GROUP
  | TAG_KEY
  | AUTOMATION_TYPE
  | START_TIME_AFTER
  | START_TIME_BEFORE
  | CURRENT_ACTION
  | PARENT_EXECUTION_ID
  | EXECUTION_ID
  | EXECUTION_STATUS
  | DOCUMENT_NAME_PREFIX

(** 
    A filter used to match specific automation executions. This is used to limit the scope of Automation execution information returned.
     *)
type automation_execution_filter = {
  values: string list;
  (** 
    The values used to limit the execution information associated with the filter's key.
     *)

  key: automation_execution_filter_key;
  (** 
    One or more keys to limit the results.
     *)

}

type describe_automation_executions_request = {
  next_token: string option;
  (** 
    The token for the next set of items to return. (You received this token from a previous call.)
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: automation_execution_filter list option;
  (** 
    Filters used to limit the scope of executions that are requested.
     *)

}

type describe_association_result = {
  association_description: association_description option;
  (** 
    Information about the association.
     *)

}

type describe_association_request = {
  association_version: string option;
  (** 
    Specify the association version to retrieve. To view the latest version, either specify [$LATEST] for this parameter, or omit this parameter. To view a list of all associations for a managed node, use [ListAssociations]. To get a list of versions for a specific association, use [ListAssociationVersions].
     *)

  association_id: string option;
  (** 
    The association ID for which you want information.
     *)

  instance_id: string option;
  (** 
    The managed node ID.
     *)

  name: string option;
  (** 
    The name of the SSM document.
     *)

}

(** 
    Includes information about the specified association.
     *)
type association_execution = {
  triggered_alarms: alarm_state_information list option;
  (** 
    The CloudWatch alarms that were invoked by the association.
     *)

  alarm_configuration: alarm_configuration option;
  
  resource_count_by_status: string option;
  (** 
    An aggregate status of the resources in the execution based on the status type.
     *)

  last_execution_date: float option;
  (** 
    The date of the last execution.
     *)

  created_time: float option;
  (** 
    The time the execution started.
     *)

  detailed_status: string option;
  (** 
    Detailed status information about the execution.
     *)

  status: string option;
  (** 
    The status of the association execution.
     *)

  execution_id: string option;
  (** 
    The execution ID for the association.
     *)

  association_version: string option;
  (** 
    The association version.
     *)

  association_id: string option;
  (** 
    The association ID.
     *)

}

type describe_association_executions_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  association_executions: association_execution list option;
  (** 
    A list of the executions for the specified association ID.
     *)

}

type association_execution_filter_key = | CreatedTime
  | Status
  | ExecutionId

type association_filter_operator_type = | GreaterThan
  | LessThan
  | Equal

(** 
    Filters used in the request.
     *)
type association_execution_filter = {
  type_: association_filter_operator_type;
  (** 
    The filter type specified in the request.
     *)

  value: string;
  (** 
    The value specified for the key.
     *)

  key: association_execution_filter_key;
  (** 
    The key value used in the request.
     *)

}

type describe_association_executions_request = {
  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: association_execution_filter list option;
  (** 
    Filters for the request. You can specify the following filters and values.
    
     ExecutionId (EQUAL)
     
      Status (EQUAL)
      
       CreatedTime (EQUAL, GREATER_THAN, LESS_THAN)
        *)

  association_id: string;
  (** 
    The association ID for which you want to view execution history details.
     *)

}

(** 
    Includes information about the specified association execution.
     *)
type association_execution_target = {
  output_source: output_source option;
  (** 
    The location where the association details are saved.
     *)

  last_execution_date: float option;
  (** 
    The date of the last execution.
     *)

  detailed_status: string option;
  (** 
    Detailed information about the execution status.
     *)

  status: string option;
  (** 
    The association execution status.
     *)

  resource_type: string option;
  (** 
    The resource type, for example, EC2.
     *)

  resource_id: string option;
  (** 
    The resource ID, for example, the managed node ID where the association ran.
     *)

  execution_id: string option;
  (** 
    The execution ID.
     *)

  association_version: string option;
  (** 
    The association version.
     *)

  association_id: string option;
  (** 
    The association ID.
     *)

}

type describe_association_execution_targets_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  association_execution_targets: association_execution_target list option;
  (** 
    Information about the execution.
     *)

}

type association_execution_targets_filter_key = | ResourceType
  | ResourceId
  | Status

(** 
    Filters for the association execution.
     *)
type association_execution_targets_filter = {
  value: string;
  (** 
    The value specified for the key.
     *)

  key: association_execution_targets_filter_key;
  (** 
    The key value used in the request.
     *)

}

type describe_association_execution_targets_request = {
  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: association_execution_targets_filter list option;
  (** 
    Filters for the request. You can specify the following filters and values.
    
     Status (EQUAL)
     
      ResourceId (EQUAL)
      
       ResourceType (EQUAL)
        *)

  execution_id: string;
  (** 
    The execution ID for which you want to view details.
     *)

  association_id: string;
  (** 
    The association ID that includes the execution for which you want to view details.
     *)

}

(** 
    The specified execution ID doesn't exist. Verify the ID number and try again.
     *)
type association_execution_does_not_exist = {
  message: string option;
  
}

(** 
    An activation registers one or more on-premises servers or virtual machines (VMs) with Amazon Web Services so that you can configure those servers or VMs using Run Command. A server or VM that has been registered with Amazon Web Services Systems Manager is called a managed node.
     *)
type activation = {
  tags: tag list option;
  (** 
    Tags assigned to the activation.
     *)

  created_date: float option;
  (** 
    The date the activation was created.
     *)

  expired: bool option;
  (** 
    Whether or not the activation is expired.
     *)

  expiration_date: float option;
  (** 
    The date when this activation can no longer be used to register managed nodes.
     *)

  registrations_count: int option;
  (** 
    The number of managed nodes already registered with this activation.
     *)

  registration_limit: int option;
  (** 
    The maximum number of managed nodes that can be registered using this activation.
     *)

  iam_role: string option;
  (** 
    The Identity and Access Management (IAM) role to assign to the managed node.
     *)

  default_instance_name: string option;
  (** 
    A name for the managed node when it is created.
     *)

  description: string option;
  (** 
    A user defined description of the activation.
     *)

  activation_id: string option;
  (** 
    The ID created by Systems Manager when you submitted the activation.
     *)

}

type describe_activations_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return. Use this token to get the next set of results.
     *)

  activation_list: activation list option;
  (** 
    A list of activations for your Amazon Web Services account.
     *)

}

type describe_activations_filter_keys = | IAM_ROLE
  | DEFAULT_INSTANCE_NAME
  | ACTIVATION_IDS

(** 
    Filter for the DescribeActivation API.
     *)
type describe_activations_filter = {
  filter_values: string list option;
  (** 
    The filter values.
     *)

  filter_key: describe_activations_filter_keys option;
  (** 
    The name of the filter.
     *)

}

type describe_activations_request = {
  next_token: string option;
  (** 
    A token to start the list. Use this token to get the next set of results.
     *)

  max_results: int option;
  (** 
    The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.
     *)

  filters: describe_activations_filter list option;
  (** 
    A filter to view information about your activations.
     *)

}

type deregister_task_from_maintenance_window_result = {
  window_task_id: string option;
  (** 
    The ID of the task removed from the maintenance window.
     *)

  window_id: string option;
  (** 
    The ID of the maintenance window the task was removed from.
     *)

}

type deregister_task_from_maintenance_window_request = {
  window_task_id: string;
  (** 
    The ID of the task to remove from the maintenance window.
     *)

  window_id: string;
  (** 
    The ID of the maintenance window the task should be removed from.
     *)

}

type deregister_target_from_maintenance_window_result = {
  window_target_id: string option;
  (** 
    The ID of the removed target definition.
     *)

  window_id: string option;
  (** 
    The ID of the maintenance window the target was removed from.
     *)

}

type deregister_target_from_maintenance_window_request = {
  safe: bool option;
  (** 
    The system checks if the target is being referenced by a task. If the target is being referenced, the system returns an error and doesn't deregister the target from the maintenance window.
     *)

  window_target_id: string;
  (** 
    The ID of the target definition to remove.
     *)

  window_id: string;
  (** 
    The ID of the maintenance window the target should be removed from.
     *)

}

type deregister_patch_baseline_for_patch_group_result = {
  patch_group: string option;
  (** 
    The name of the patch group deregistered from the patch baseline.
     *)

  baseline_id: string option;
  (** 
    The ID of the patch baseline the patch group was deregistered from.
     *)

}

type deregister_patch_baseline_for_patch_group_request = {
  patch_group: string;
  (** 
    The name of the patch group that should be deregistered from the patch baseline.
     *)

  baseline_id: string;
  (** 
    The ID of the patch baseline to deregister the patch group from.
     *)

}

type deregister_managed_instance_result = unit

type deregister_managed_instance_request = {
  instance_id: string;
  (** 
    The ID assigned to the managed node when you registered it using the activation process.
     *)

}

type delete_resource_policy_response = unit

type delete_resource_policy_request = {
  policy_hash: string;
  (** 
    ID of the current policy version. The hash helps to prevent multiple calls from attempting to overwrite a policy.
     *)

  policy_id: string;
  (** 
    The policy ID.
     *)

  resource_arn: string;
  (** 
    Amazon Resource Name (ARN) of the resource to which the policies are attached.
     *)

}

type delete_resource_data_sync_result = unit

type delete_resource_data_sync_request = {
  sync_type: string option;
  (** 
    Specify the type of resource data sync to delete.
     *)

  sync_name: string;
  (** 
    The name of the configuration to delete.
     *)

}

type delete_patch_baseline_result = {
  baseline_id: string option;
  (** 
    The ID of the deleted patch baseline.
     *)

}

type delete_patch_baseline_request = {
  baseline_id: string;
  (** 
    The ID of the patch baseline to delete.
     *)

}

type delete_parameters_result = {
  invalid_parameters: string list option;
  (** 
    The names of parameters that weren't deleted because the parameters aren't valid.
     *)

  deleted_parameters: string list option;
  (** 
    The names of the deleted parameters.
     *)

}

type delete_parameters_request = {
  names: string list;
  (** 
    The names of the parameters to delete. After deleting a parameter, wait for at least 30 seconds to create a parameter with the same name.
    
     You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.
     
      *)

}

type delete_parameter_result = unit

type delete_parameter_request = {
  name: string;
  (** 
    The name of the parameter to delete.
    
     You can't enter the Amazon Resource Name (ARN) for a parameter, only the parameter name itself.
     
      *)

}

type delete_ops_metadata_result = unit

type delete_ops_metadata_request = {
  ops_metadata_arn: string;
  (** 
    The Amazon Resource Name (ARN) of an OpsMetadata Object to delete.
     *)

}

type delete_ops_item_response = unit

type delete_ops_item_request = {
  ops_item_id: string;
  (** 
    The ID of the OpsItem that you want to delete.
     *)

}

type delete_maintenance_window_result = {
  window_id: string option;
  (** 
    The ID of the deleted maintenance window.
     *)

}

type delete_maintenance_window_request = {
  window_id: string;
  (** 
    The ID of the maintenance window to delete.
     *)

}

type delete_inventory_result = {
  deletion_summary: inventory_deletion_summary option;
  (** 
    A summary of the delete operation. For more information about this summary, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-custom.html#sysman-inventory-delete-summary}Understanding the delete inventory summary} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  type_name: string option;
  (** 
    The name of the inventory data type specified in the request.
     *)

  deletion_id: string option;
  (** 
    Every [DeleteInventory] operation is assigned a unique ID. This option returns a unique ID. You can use this ID to query the status of a delete operation. This option is useful for ensuring that a delete operation has completed before you begin other operations.
     *)

}

type delete_inventory_request = {
  client_token: string option;
  (** 
    User-provided idempotency token.
     *)

  dry_run: bool option;
  (** 
    Use this option to view a summary of the deletion request without deleting any data or the data type. This option is useful when you only want to understand what will be deleted. Once you validate that the data to be deleted is what you intend to delete, you can run the same command without specifying the [DryRun] option.
     *)

  schema_delete_option: inventory_schema_delete_option option;
  (** 
    Use the [SchemaDeleteOption] to delete a custom inventory type (schema). If you don't choose this option, the system only deletes existing inventory data associated with the custom inventory type. Choose one of the following options:
    
     DisableSchema: If you choose this option, the system ignores all inventory data for the specified version, and any earlier versions. To enable this schema again, you must call the [PutInventory] operation for a version greater than the disabled version.
     
      DeleteSchema: This option deletes the specified custom type from the Inventory service. You can recreate the schema later, if you want.
       *)

  type_name: string;
  (** 
    The name of the custom inventory type for which you want to delete either all previously collected data or the inventory type itself.
     *)

}

type delete_document_result = unit

type delete_document_request = {
  force: bool option;
  (** 
    Some SSM document types require that you specify a [Force] flag before you can delete the document. For example, you must specify a [Force] flag to delete a document of type [ApplicationConfigurationSchema]. You can restrict access to the [Force] flag in an Identity and Access Management (IAM) policy.
     *)

  version_name: string option;
  (** 
    The version name of the document that you want to delete. If not provided, all versions of the document are deleted.
     *)

  document_version: string option;
  (** 
    The version of the document that you want to delete. If not provided, all versions of the document are deleted.
     *)

  name: string;
  (** 
    The name of the document.
     *)

}

(** 
    You must disassociate a document from all managed nodes before you can delete it.
     *)
type associated_instances = unit

type delete_association_result = unit

type delete_association_request = {
  association_id: string option;
  (** 
    The association ID that you want to delete.
     *)

  instance_id: string option;
  (** 
    The managed node ID.
    
     [InstanceId] has been deprecated. To specify a managed node ID for an association, use the [Targets] parameter. Requests that include the parameter [InstanceID] with Systems Manager documents (SSM documents) that use schema version 2.0 or later will fail. In addition, if you use the parameter [InstanceId], you can't use the parameters [AssociationName], [DocumentVersion], [MaxErrors], [MaxConcurrency], [OutputLocation], or [ScheduleExpression]. To use these parameters, you must use the [Targets] parameter.
     
      *)

  name: string option;
  (** 
    The name of the SSM document.
     *)

}

type delete_activation_result = unit

type delete_activation_request = {
  activation_id: string;
  (** 
    The ID of the activation that you want to delete.
     *)

}

type create_resource_data_sync_result = unit

type create_resource_data_sync_request = {
  sync_source: resource_data_sync_source option;
  (** 
    Specify information about the data sources to synchronize. This parameter is required if the [SyncType] value is SyncFromSource.
     *)

  sync_type: string option;
  (** 
    Specify [SyncToDestination] to create a resource data sync that synchronizes data to an S3 bucket for Inventory. If you specify [SyncToDestination], you must provide a value for [S3Destination]. Specify [SyncFromSource] to synchronize data from a single account and multiple Regions, or multiple Amazon Web Services accounts and Amazon Web Services Regions, as listed in Organizations for Explorer. If you specify [SyncFromSource], you must provide a value for [SyncSource]. The default value is [SyncToDestination].
     *)

  s3_destination: resource_data_sync_s3_destination option;
  (** 
    Amazon S3 configuration details for the sync. This parameter is required if the [SyncType] value is SyncToDestination.
     *)

  sync_name: string;
  (** 
    A name for the configuration.
     *)

}

type create_patch_baseline_result = {
  baseline_id: string option;
  (** 
    The ID of the created patch baseline.
     *)

}

type create_patch_baseline_request = {
  tags: tag list option;
  (** 
    Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a patch baseline to identify the severity level of patches it specifies and the operating system family it applies to. In this case, you could specify the following key-value pairs:
    
     {ul
          {- [Key=PatchSeverity,Value=Critical]
             
             }
           {- [Key=OS,Value=Windows]
              
              }
          
      }
       To add tags to an existing patch baseline, use the [AddTagsToResource] operation.
       
        *)

  client_token: string option;
  (** 
    User-provided idempotency token.
     *)

  sources: patch_source list option;
  (** 
    Information about the patches to use to update the managed nodes, including target operating systems and source repositories. Applies to Linux managed nodes only.
     *)

  description: string option;
  (** 
    A description of the patch baseline.
     *)

  rejected_patches_action: patch_action option;
  (** 
    The action for Patch Manager to take on patches included in the [RejectedPackages] list.
    
     {ul
          {- {b [ALLOW_AS_DEPENDENCY]}: A package in the [Rejected] patches list is installed only if it is a dependency of another package. It is considered compliant with the patch baseline, and its status is reported as [InstalledOther]. This is the default action if no option is specified.
             
             }
           {- {b BLOCK}: Packages in the {b Rejected patches} list, and packages that include them as dependencies, aren't installed by Patch Manager under any circumstances. If a package was installed before it was added to the {b Rejected patches} list, or is installed outside of Patch Manager afterward, it's considered noncompliant with the patch baseline and its status is reported as {i InstalledRejected}.
              
              }
          
      }
       *)

  rejected_patches: string list option;
  (** 
    A list of explicitly rejected patches for the baseline.
    
     For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}About package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  approved_patches_enable_non_security: bool option;
  (** 
    Indicates whether the list of approved patches includes non-security updates that should be applied to the managed nodes. The default value is [false]. Applies to Linux managed nodes only.
     *)

  approved_patches_compliance_level: patch_compliance_level option;
  (** 
    Defines the compliance level for approved patches. When an approved patch is reported as missing, this value describes the severity of the compliance violation. The default value is [UNSPECIFIED].
     *)

  approved_patches: string list option;
  (** 
    A list of explicitly approved patches for the baseline.
    
     For information about accepted formats for lists of approved patches and rejected patches, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/patch-manager-approved-rejected-package-name-formats.html}About package name formats for approved and rejected patch lists} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  approval_rules: patch_rule_group option;
  (** 
    A set of rules used to include patches in the baseline.
     *)

  global_filters: patch_filter_group option;
  (** 
    A set of global filters used to include patches in the baseline.
     *)

  name: string;
  (** 
    The name of the patch baseline.
     *)

  operating_system: operating_system option;
  (** 
    Defines the operating system the patch baseline applies to. The default value is [WINDOWS].
     *)

}

type create_ops_metadata_result = {
  ops_metadata_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the OpsMetadata Object or blob created by the call.
     *)

}

type create_ops_metadata_request = {
  tags: tag list option;
  (** 
    Optional metadata that you assign to a resource. You can specify a maximum of five tags for an OpsMetadata object. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an OpsMetadata object to identify an environment or target Amazon Web Services Region. In this case, you could specify the following key-value pairs:
    
     {ul
          {- [Key=Environment,Value=Production]
             
             }
           {- [Key=Region,Value=us-east-2]
              
              }
          
      }
       *)

  metadata: (string * metadata_value) list option;
  (** 
    Metadata for a new Application Manager application.
     *)

  resource_id: string;
  (** 
    A resource ID for a new Application Manager application.
     *)

}

type create_ops_item_response = {
  ops_item_arn: string option;
  (** 
    The OpsItem Amazon Resource Name (ARN).
     *)

  ops_item_id: string option;
  (** 
    The ID of the OpsItem.
     *)

}

type create_ops_item_request = {
  account_id: string option;
  (** 
    The target Amazon Web Services account where you want to create an OpsItem. To make this call, your account must be configured to work with OpsItems across accounts. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  planned_end_time: float option;
  (** 
    The time specified in a change request for a runbook workflow to end. Currently supported only for the OpsItem type [/aws/changerequest].
     *)

  planned_start_time: float option;
  (** 
    The time specified in a change request for a runbook workflow to start. Currently supported only for the OpsItem type [/aws/changerequest].
     *)

  actual_end_time: float option;
  (** 
    The time a runbook workflow ended. Currently reported only for the OpsItem type [/aws/changerequest].
     *)

  actual_start_time: float option;
  (** 
    The time a runbook workflow started. Currently reported only for the OpsItem type [/aws/changerequest].
     *)

  severity: string option;
  (** 
    Specify a severity to assign to an OpsItem.
     *)

  category: string option;
  (** 
    Specify a category to assign to an OpsItem.
     *)

  tags: tag list option;
  (** 
    Optional metadata that you assign to a resource.
    
     Tags use a key-value pair. For example:
     
      [Key=Department,Value=Finance]
      
       To add tags to a new OpsItem, a user must have IAM permissions for both the [ssm:CreateOpsItems] operation and the [ssm:AddTagsToResource] operation. To add tags to an existing OpsItem, use the [AddTagsToResource] operation.
       
        *)

  title: string;
  (** 
    A short heading that describes the nature of the OpsItem and the impacted resource.
     *)

  source: string;
  (** 
    The origin of the OpsItem, such as Amazon EC2 or Systems Manager.
    
     The source name can't contain the following strings: [aws], [amazon], and [amzn].
     
      *)

  related_ops_items: related_ops_item list option;
  (** 
    One or more OpsItems that share something in common with the current OpsItems. For example, related OpsItems can include OpsItems with similar error messages, impacted resources, or statuses for the impacted resource.
     *)

  priority: int option;
  (** 
    The importance of this OpsItem in relation to other OpsItems in the system.
     *)

  notifications: ops_item_notification list option;
  (** 
    The Amazon Resource Name (ARN) of an SNS topic where notifications are sent when this OpsItem is edited or changed.
     *)

  operational_data: (string * ops_item_data_value) list option;
  (** 
    Operational data is custom data that provides useful reference details about the OpsItem. For example, you can specify log files, error strings, license keys, troubleshooting tips, or other relevant data. You enter operational data as key-value pairs. The key has a maximum length of 128 characters. The value has a maximum size of 20 KB.
    
     Operational data keys {i can't} begin with the following: [amazon], [aws], [amzn], [ssm], [/amazon], [/aws], [/amzn], [/ssm].
     
      You can choose to make the data searchable by other users in the account or you can restrict search access. Searchable data means that all users with access to the OpsItem Overview page (as provided by the [DescribeOpsItems] API operation) can view and search on the specified data. Operational data that isn't searchable is only viewable by users who have access to the OpsItem (as provided by the [GetOpsItem] API operation).
      
       Use the [/aws/resources] key in OperationalData to specify a related resource in the request. Use the [/aws/automations] key in OperationalData to associate an Automation runbook with the OpsItem. To view Amazon Web Services CLI example commands that use these keys, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-manually-create-OpsItems.html}Create OpsItems manually} in the {i Amazon Web Services Systems Manager User Guide}.
        *)

  ops_item_type: string option;
  (** 
    The type of OpsItem to create. Systems Manager supports the following types of OpsItems:
    
     {ul
          {- [/aws/issue]
             
              This type of OpsItem is used for default OpsItems created by OpsCenter.
              
              }
           {- [/aws/changerequest]
              
               This type of OpsItem is used by Change Manager for reviewing and approving or rejecting change requests.
               
               }
           {- [/aws/insight]
              
               This type of OpsItem is used by OpsCenter for aggregating and reporting on duplicate OpsItems.
               
               }
          
      }
       *)

  description: string;
  (** 
    User-defined text that contains information about the OpsItem, in Markdown format.
    
     Provide enough information so that users viewing this OpsItem for the first time understand the issue.
     
      *)

}

type create_maintenance_window_result = {
  window_id: string option;
  (** 
    The ID of the created maintenance window.
     *)

}

type create_maintenance_window_request = {
  tags: tag list option;
  (** 
    Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag a maintenance window to identify the type of tasks it will run, the types of targets, and the environment it will run in. In this case, you could specify the following key-value pairs:
    
     {ul
          {- [Key=TaskType,Value=AgentUpdate]
             
             }
           {- [Key=OS,Value=Windows]
              
              }
           {- [Key=Environment,Value=Production]
              
              }
          
      }
       To add tags to an existing maintenance window, use the [AddTagsToResource] operation.
       
        *)

  client_token: string option;
  (** 
    User-provided idempotency token.
     *)

  allow_unassociated_targets: bool;
  (** 
    Enables a maintenance window task to run on managed nodes, even if you haven't registered those nodes as targets. If enabled, then you must specify the unregistered managed nodes (by node ID) when you register a task with the maintenance window.
    
     If you don't enable this option, then you must specify previously-registered targets when you register a task with the maintenance window.
      *)

  cutoff: int;
  (** 
    The number of hours before the end of the maintenance window that Amazon Web Services Systems Manager stops scheduling new tasks for execution.
     *)

  duration: int;
  (** 
    The duration of the maintenance window in hours.
     *)

  schedule_offset: int option;
  [@ocaml.doc {| 
    The number of days to wait after the date and time specified by a cron expression before running the maintenance window.
    
     For example, the following cron expression schedules a maintenance window to run on the third Tuesday of every month at 11:30 PM.
     
      [cron(30 23 ? * TUE#3 *)]
      
       If the schedule offset is [2], the maintenance window won't run until two days later.
        |}]

  schedule_timezone: string option;
  [@ocaml.doc {| 
    The time zone that the scheduled maintenance window executions are based on, in Internet Assigned Numbers Authority (IANA) format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see the {{:https://www.iana.org/time-zones}Time Zone Database} on the IANA website.
     |}]

  schedule: string;
  (** 
    The schedule of the maintenance window in the form of a cron or rate expression.
     *)

  end_date: string option;
  (** 
    The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become inactive. [EndDate] allows you to set a date and time in the future when the maintenance window will no longer run.
     *)

  start_date: string option;
  (** 
    The date and time, in ISO-8601 Extended format, for when you want the maintenance window to become active. [StartDate] allows you to delay activation of the maintenance window until the specified future date.
    
     When using a rate schedule, if you provide a start date that occurs in the past, the current date and time are used as the start date.
     
      *)

  description: string option;
  (** 
    An optional description for the maintenance window. We recommend specifying a description to help you organize your maintenance windows.
     *)

  name: string;
  (** 
    The name of the maintenance window.
     *)

}

type create_document_result = {
  document_description: document_description option;
  (** 
    Information about the SSM document.
     *)

}

type create_document_request = {
  tags: tag list option;
  (** 
    Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an SSM document to identify the types of targets or the environment where it will run. In this case, you could specify the following key-value pairs:
    
     {ul
          {- [Key=OS,Value=Windows]
             
             }
           {- [Key=Environment,Value=Production]
              
              }
          
      }
       To add tags to an existing SSM document, use the [AddTagsToResource] operation.
       
        *)

  target_type: string option;
  (** 
    Specify a target type to define the kinds of resources the document can run on. For example, to run a document on EC2 instances, specify the following value: [/AWS::EC2::Instance]. If you specify a value of '/' the document can run on all types of resources. If you don't specify a value, the document can't run on any resources. For a list of valid resource types, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon Web Services resource and property types reference} in the {i CloudFormation User Guide}.
     *)

  document_format: document_format option;
  (** 
    Specify the document format for the request. The document format can be JSON, YAML, or TEXT. JSON is the default format.
     *)

  document_type: document_type option;
  (** 
    The type of document to create.
    
     The [DeploymentStrategy] document type is an internal-use-only document type reserved for AppConfig.
     
      *)

  version_name: string option;
  (** 
    An optional field specifying the version of the artifact you are creating with the document. For example, [Release12.1]. This value is unique across all versions of a document, and can't be changed.
     *)

  display_name: string option;
  (** 
    An optional field where you can specify a friendly name for the SSM document. This value can differ for each version of the document. You can update this value at a later time using the [UpdateDocument] operation.
     *)

  name: string;
  (** 
    A name for the SSM document.
    
     You can't use the following strings as document name prefixes. These are reserved by Amazon Web Services for use as document name prefixes:
     
      {ul
           {- [aws]
              
              }
            {- [amazon]
               
               }
            {- [amzn]
               
               }
            {- [AWSEC2]
               
               }
            {- [AWSConfigRemediation]
               
               }
            {- [AWSSupport]
               
               }
           
      }
       *)

  attachments: attachments_source list option;
  (** 
    A list of key-value pairs that describe attachments to a version of a document.
     *)

  requires: document_requires list option;
  (** 
    A list of SSM documents required by a document. This parameter is used exclusively by AppConfig. When a user creates an AppConfig configuration in an SSM document, the user must also specify a required document for validation purposes. In this case, an [ApplicationConfiguration] document requires an [ApplicationConfigurationSchema] document for validation purposes. For more information, see {{:https://docs.aws.amazon.com/appconfig/latest/userguide/what-is-appconfig.html}What is AppConfig?} in the {i AppConfig User Guide}.
     *)

  content: string;
  (** 
    The content for the new SSM document in JSON or YAML format. The content of the document must not exceed 64KB. This quota also includes the content specified for input parameters at runtime. We recommend storing the contents for your new document in an external JSON or YAML file and referencing the file in a command.
    
     For examples, see the following topics in the {i Amazon Web Services Systems Manager User Guide}.
     
      {ul
           {- {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-using.html#create-ssm-console}Create an SSM document (console)}
              
              }
            {- {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-using.html#create-ssm-document-cli}Create an SSM document (command line)}
               
               }
            {- {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/documents-using.html#create-ssm-document-api}Create an SSM document (API)}
               
               }
           
      }
       *)

}

type create_association_result = {
  association_description: association_description option;
  (** 
    Information about the association.
     *)

}

type create_association_request = {
  alarm_configuration: alarm_configuration option;
  
  tags: tag list option;
  (** 
    Adds or overwrites one or more tags for a State Manager association. {i Tags} are metadata that you can assign to your Amazon Web Services resources. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define.
     *)

  target_maps: (string * string list) list list option;
  (** 
    A key-value mapping of document parameters to target resources. Both Targets and TargetMaps can't be specified together.
     *)

  duration: int option;
  (** 
    The number of hours the association can run before it is canceled. Duration applies to associations that are currently running, and any pending and in progress commands on all targets. If a target was taken offline for the association to run, it is made available again immediately, without a reboot.
    
     The [Duration] parameter applies only when both these conditions are true:
     
      {ul
           {- The association for which you specify a duration is cancelable according to the parameters of the SSM command document or Automation runbook associated with this execution.
              
              }
            {- The command specifies the 
               {[
               {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_CreateAssociation.html#systemsmanager-CreateAssociation-request-ApplyOnlyAtCronInterval}ApplyOnlyAtCronInterval}
               ]}
                parameter, which means that the association doesn't run immediately after it is created, but only according to the specified schedule.
               
               }
           
      }
       *)

  schedule_offset: int option;
  [@ocaml.doc {| 
    Number of days to wait after the scheduled day to run an association. For example, if you specified a cron schedule of [cron(0 0 ? * THU#2 *)], you could specify an offset of 3 to run the association each Sunday after the second Thursday of the month. For more information about cron schedules for associations, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/reference-cron-and-rate-expressions.html}Reference: Cron and rate expressions for Systems Manager} in the {i Amazon Web Services Systems Manager User Guide}.
    
     To use offsets, you must specify the [ApplyOnlyAtCronInterval] parameter. This option tells the system not to run an association immediately after you create it.
     
      |}]

  target_locations: target_location list option;
  (** 
    A location is a combination of Amazon Web Services Regions and Amazon Web Services accounts where you want to run the association. Use this action to create an association in multiple Regions and multiple accounts.
     *)

  calendar_names: string list option;
  (** 
    The names or Amazon Resource Names (ARNs) of the Change Calendar type documents you want to gate your associations under. The associations only run when that change calendar is open. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar}Amazon Web Services Systems Manager Change Calendar}.
     *)

  apply_only_at_cron_interval: bool option;
  (** 
    By default, when you create a new association, the system runs it immediately after it is created and then according to the schedule you specified. Specify this option if you don't want an association to run immediately after you create it. This parameter isn't supported for rate expressions.
     *)

  sync_compliance: association_sync_compliance option;
  (** 
    The mode for generating association compliance. You can specify [AUTO] or [MANUAL]. In [AUTO] mode, the system uses the status of the association execution to determine the compliance status. If the association execution runs successfully, then the association is [COMPLIANT]. If the association execution doesn't run successfully, the association is [NON-COMPLIANT].
    
     In [MANUAL] mode, you must specify the [AssociationId] as a parameter for the [PutComplianceItems] API operation. In this case, compliance data isn't managed by State Manager. It is managed by your direct call to the [PutComplianceItems] API operation.
     
      By default, all associations use [AUTO] mode.
       *)

  compliance_severity: association_compliance_severity option;
  (** 
    The severity level to assign to the association.
     *)

  max_concurrency: string option;
  (** 
    The maximum number of targets allowed to run the association at the same time. You can specify a number, for example 10, or a percentage of the target set, for example 10%. The default value is 100%, which means all targets run the association at the same time.
    
     If a new managed node starts and attempts to run an association while Systems Manager is running [MaxConcurrency] associations, the association is allowed to run. During the next association interval, the new managed node will process its association within the limit specified for [MaxConcurrency].
      *)

  max_errors: string option;
  (** 
    The number of errors that are allowed before the system stops sending requests to run the association on additional targets. You can specify either an absolute number of errors, for example 10, or a percentage of the target set, for example 10%. If you specify 3, for example, the system stops sending requests when the fourth error is received. If you specify 0, then the system stops sending requests after the first error is returned. If you run an association on 50 managed nodes and set [MaxError] to 10%, then the system stops sending the request when the sixth error is received.
    
     Executions that are already running an association when [MaxErrors] is reached are allowed to complete, but some of these executions may fail as well. If you need to ensure that there won't be more than max-errors failed executions, set [MaxConcurrency] to 1 so that executions proceed one at a time.
      *)

  automation_target_parameter_name: string option;
  (** 
    Choose the parameter that will define how your automation will branch out. This target is required for associations that use an Automation runbook and target resources by using rate controls. Automation is a capability of Amazon Web Services Systems Manager.
     *)

  association_name: string option;
  (** 
    Specify a descriptive name for the association.
     *)

  output_location: instance_association_output_location option;
  (** 
    An Amazon Simple Storage Service (Amazon S3) bucket where you want to store the output details of the request.
     *)

  schedule_expression: string option;
  (** 
    A cron expression when the association will be applied to the targets.
     *)

  targets: target list option;
  (** 
    The targets for the association. You can target managed nodes by using tags, Amazon Web Services resource groups, all managed nodes in an Amazon Web Services account, or individual managed node IDs. You can target all managed nodes in an Amazon Web Services account by specifying the [InstanceIds] key with a value of [*]. For more information about choosing targets for an association, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-state-manager-targets-and-rate-controls.html}About targets and rate controls in State Manager associations} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  parameters: (string * string list) list option;
  (** 
    The parameters for the runtime configuration of the document.
     *)

  instance_id: string option;
  (** 
    The managed node ID.
    
     [InstanceId] has been deprecated. To specify a managed node ID for an association, use the [Targets] parameter. Requests that include the parameter [InstanceID] with Systems Manager documents (SSM documents) that use schema version 2.0 or later will fail. In addition, if you use the parameter [InstanceId], you can't use the parameters [AssociationName], [DocumentVersion], [MaxErrors], [MaxConcurrency], [OutputLocation], or [ScheduleExpression]. To use these parameters, you must use the [Targets] parameter.
     
      *)

  document_version: string option;
  (** 
    The document version you want to associate with the targets. Can be a specific version or the default version.
    
     State Manager doesn't support running associations that use a new version of a document if that document is shared from another account. State Manager always runs the [default] version of a document if shared from another account, even though the Systems Manager console shows that a new version was processed. If you want to run an association using a new version of a document shared form another account, you must set the document version to [default].
     
      *)

  name: string;
  (** 
    The name of the SSM Command document or Automation runbook that contains the configuration information for the managed node.
    
     You can specify Amazon Web Services-predefined documents, documents you created, or a document that is shared with you from another Amazon Web Services account.
     
      For Systems Manager documents (SSM documents) that are shared with you from other Amazon Web Services accounts, you must specify the complete SSM document ARN, in the following format:
      
       
       {[
       arn:{i partition}:ssm:{i region}:{i account-id}:document/{i document-name}
       ]}
       
       
        For example:
        
         [arn:aws:ssm:us-east-2:12345678912:document/My-Shared-Document]
         
          For Amazon Web Services-predefined documents and SSM documents you created in your account, you only need to specify the document name. For example, [AWS-ApplyPatchBaseline] or [My-Document].
           *)

}

type create_association_batch_result = {
  failed: failed_create_association list option;
  (** 
    Information about the associations that failed.
     *)

  successful: association_description list option;
  (** 
    Information about the associations that succeeded.
     *)

}

type create_association_batch_request = {
  entries: create_association_batch_request_entry list;
  (** 
    One or more associations.
     *)

}

(** 
    You can have at most 2,000 active associations.
     *)
type association_limit_exceeded = unit

(** 
    The specified association already exists.
     *)
type association_already_exists = unit

type create_activation_result = {
  activation_code: string option;
  (** 
    The code the system generates when it processes the activation. The activation code functions like a password to validate the activation ID.
     *)

  activation_id: string option;
  (** 
    The ID number generated by the system when it processed the activation. The activation ID functions like a user name.
     *)

}

type create_activation_request = {
  registration_metadata: registration_metadata_item list option;
  (** 
    Reserved for internal use.
     *)

  tags: tag list option;
  [@ocaml.doc {| 
    Optional metadata that you assign to a resource. Tags enable you to categorize a resource in different ways, such as by purpose, owner, or environment. For example, you might want to tag an activation to identify which servers or virtual machines (VMs) in your on-premises environment you intend to activate. In this case, you could specify the following key-value pairs:
    
     {ul
          {- [Key=OS,Value=Windows]
             
             }
           {- [Key=Environment,Value=Production]
              
              }
          
      }
       When you install SSM Agent on your on-premises servers and VMs, you specify an activation ID and code. When you specify the activation ID and code, tags assigned to the activation are automatically applied to the on-premises servers or VMs.
       
        You can't add tags to or delete tags from an existing activation. You can tag your on-premises servers, edge devices, and VMs after they connect to Systems Manager for the first time and are assigned a managed node ID. This means they are listed in the Amazon Web Services Systems Manager console with an ID that is prefixed with "mi-". For information about how to add tags to your managed nodes, see [AddTagsToResource]. For information about how to remove tags from your managed nodes, see [RemoveTagsFromResource].
         |}]

  expiration_date: float option;
  [@ocaml.doc {| 
    The date by which this activation request should expire, in timestamp format, such as "2021-07-07T00:00:00". You can specify a date up to 30 days in advance. If you don't provide an expiration date, the activation code expires in 24 hours.
     |}]

  registration_limit: int option;
  (** 
    Specify the maximum number of managed nodes you want to register. The default value is [1].
     *)

  iam_role: string;
  (** 
    The name of the Identity and Access Management (IAM) role that you want to assign to the managed node. This IAM role must provide AssumeRole permissions for the Amazon Web Services Systems Manager service principal [ssm.amazonaws.com]. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-service-role.html}Create an IAM service role for a hybrid and multicloud environment} in the {i Amazon Web Services Systems Manager User Guide}.
    
     You can't specify an IAM service-linked role for this parameter. You must create a unique role.
     
      *)

  default_instance_name: string option;
  (** 
    The name of the registered, managed node as it will appear in the Amazon Web Services Systems Manager console or when you use the Amazon Web Services command line tools to list Systems Manager resources.
    
     Don't enter personally identifiable information in this field.
     
      *)

  description: string option;
  (** 
    A user-defined description of the resource that you want to register with Systems Manager.
    
     Don't enter personally identifiable information in this field.
     
      *)

}

type cancel_maintenance_window_execution_result = {
  window_execution_id: string option;
  (** 
    The ID of the maintenance window execution that has been stopped.
     *)

}

type cancel_maintenance_window_execution_request = {
  window_execution_id: string;
  (** 
    The ID of the maintenance window execution to stop.
     *)

}

(** 
    Whether or not the command was successfully canceled. There is no guarantee that a request can be canceled.
     *)
type cancel_command_result = unit

(** 
    
     *)
type cancel_command_request = {
  instance_ids: string list option;
  (** 
    (Optional) A list of managed node IDs on which you want to cancel the command. If not provided, the command is canceled on every node on which it was requested.
     *)

  command_id: string;
  (** 
    The ID of the command you want to cancel.
     *)

}

type associate_ops_item_related_item_response = {
  association_id: string option;
  (** 
    The association ID.
     *)

}

type associate_ops_item_related_item_request = {
  resource_uri: string;
  (** 
    The Amazon Resource Name (ARN) of the Amazon Web Services resource that you want to associate with the OpsItem.
     *)

  resource_type: string;
  (** 
    The type of resource that you want to associate with an OpsItem. OpsCenter supports the following types:
    
     [AWS::SSMIncidents::IncidentRecord]: an Incident Manager incident.
     
      [AWS::SSM::Document]: a Systems Manager (SSM) document.
       *)

  association_type: string;
  (** 
    The type of association that you want to create between an OpsItem and a resource. OpsCenter supports [IsParentOf] and [RelatesTo] association types.
     *)

  ops_item_id: string;
  (** 
    The ID of the OpsItem to which you want to associate a resource as a related item.
     *)

}

type add_tags_to_resource_result = unit

type add_tags_to_resource_request = {
  tags: tag list;
  (** 
    One or more tags. The value parameter is required.
    
     Don't enter personally identifiable information in this field.
     
      *)

  resource_id: string;
  (** 
    The resource ID you want to tag.
    
     Use the ID of the resource. Here are some examples:
     
      [MaintenanceWindow]: [mw-012345abcde]
      
       [PatchBaseline]: [pb-012345abcde]
       
        [Automation]: [example-c160-4567-8519-012345abcde]
        
         [OpsMetadata] object: [ResourceID] for tagging is created from the Amazon Resource Name (ARN) for the object. Specifically, [ResourceID] is created from the strings that come after the word [opsmetadata] in the ARN. For example, an OpsMetadata object with an ARN of [arn:aws:ssm:us-east-2:1234567890:opsmetadata/aws/ssm/MyGroup/appmanager] has a [ResourceID] of either [aws/ssm/MyGroup/appmanager] or [/aws/ssm/MyGroup/appmanager].
         
          For the [Document] and [Parameter] values, use the name of the resource. If you're tagging a shared document, you must use the full ARN of the document.
          
           [ManagedInstance]: [mi-012345abcde]
           
            The [ManagedInstance] type for this API operation is only for on-premises managed nodes. You must specify the name of the managed node in the following format: 
            {[
            mi-{i ID_number}
            ]}
            . For example, [mi-1a2b3c4d5e6f].
            
             *)

  resource_type: resource_type_for_tagging;
  (** 
    Specifies the type of resource you are tagging.
    
     The [ManagedInstance] type for this API operation is for on-premises managed nodes. You must specify the name of the managed node in the following format: 
     {[
     mi-{i ID_number}
     ]}
     . For example, [mi-1a2b3c4d5e6f].
     
      *)

}

(** 
    Amazon Web Services Systems Manager is the operations hub for your Amazon Web Services applications and resources and a secure end-to-end management solution for hybrid cloud environments that enables safe and secure operations at scale.
    
     This reference is intended to be used with the {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/}Amazon Web Services Systems Manager User Guide}. To get started, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-setting-up.html}Setting up Amazon Web Services Systems Manager}.
     
      {b Related resources}
      
       {ul
            {- For information about each of the capabilities that comprise Systems Manager, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html#systems-manager-capabilities}Systems Manager capabilities} in the {i Amazon Web Services Systems Manager User Guide}.
               
               }
             {- For details about predefined runbooks for Automation, a capability of Amazon Web Services Systems Manager, see the {i {{:https://docs.aws.amazon.com/systems-manager-automation-runbooks/latest/userguide/automation-runbook-reference.html}Systems Manager Automation runbook reference}}.
                
                }
             {- For information about AppConfig, a capability of Systems Manager, see the {i {{:https://docs.aws.amazon.com/appconfig/latest/userguide/}AppConfig User Guide}} and the {i {{:https://docs.aws.amazon.com/appconfig/2019-10-09/APIReference/}AppConfig API Reference}}.
                
                }
             {- For information about Incident Manager, a capability of Systems Manager, see the {i {{:https://docs.aws.amazon.com/incident-manager/latest/userguide/}Systems Manager Incident Manager User Guide}} and the {i {{:https://docs.aws.amazon.com/incident-manager/latest/APIReference/}Systems Manager Incident Manager API Reference}}.
                
                }
            
      }
       *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_update_service_setting_request :
  setting_value:string -> setting_id:string -> unit
-> update_service_setting_request
(** Create a {!type-update_service_setting_request} type *)

val make_resource_data_sync_organizational_unit :
  ?organizational_unit_id:string -> unit
-> resource_data_sync_organizational_unit
(** Create a {!type-resource_data_sync_organizational_unit} type *)

val make_resource_data_sync_aws_organizations_source :
  ?organizational_units:resource_data_sync_organizational_unit list ->
  organization_source_type:string ->
  unit
-> resource_data_sync_aws_organizations_source
(** Create a {!type-resource_data_sync_aws_organizations_source} type *)

val make_resource_data_sync_source :
  ?enable_all_ops_data_sources:bool ->
  ?include_future_regions:bool ->
  ?aws_organizations_source:resource_data_sync_aws_organizations_source ->
  source_regions:string list ->
  source_type:string ->
  unit
-> resource_data_sync_source
(** Create a {!type-resource_data_sync_source} type *)

val make_update_resource_data_sync_request :
  sync_source:resource_data_sync_source ->
  sync_type:string ->
  sync_name:string ->
  unit
-> update_resource_data_sync_request
(** Create a {!type-update_resource_data_sync_request} type *)

val make_patch_filter : values:string list -> key:patch_filter_key -> unit
-> patch_filter
(** Create a {!type-patch_filter} type *)

val make_patch_filter_group : patch_filters:patch_filter list -> unit
-> patch_filter_group
(** Create a {!type-patch_filter_group} type *)

val make_patch_rule :
  ?enable_non_security:bool ->
  ?approve_until_date:string ->
  ?approve_after_days:int ->
  ?compliance_level:patch_compliance_level ->
  patch_filter_group:patch_filter_group ->
  unit
-> patch_rule
(** Create a {!type-patch_rule} type *)

val make_patch_rule_group : patch_rules:patch_rule list -> unit
-> patch_rule_group
(** Create a {!type-patch_rule_group} type *)

val make_patch_source :
  configuration:string -> products:string list -> name:string -> unit
-> patch_source
(** Create a {!type-patch_source} type *)

val make_update_patch_baseline_request :
  ?replace:bool ->
  ?sources:patch_source list ->
  ?description:string ->
  ?rejected_patches_action:patch_action ->
  ?rejected_patches:string list ->
  ?approved_patches_enable_non_security:bool ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?approved_patches:string list ->
  ?approval_rules:patch_rule_group ->
  ?global_filters:patch_filter_group ->
  ?name:string ->
  baseline_id:string ->
  unit
-> update_patch_baseline_request
(** Create a {!type-update_patch_baseline_request} type *)

val make_metadata_value : ?value:string -> unit
-> metadata_value
(** Create a {!type-metadata_value} type *)

val make_update_ops_metadata_request :
  ?keys_to_delete:string list ->
  ?metadata_to_update:(string * metadata_value) list ->
  ops_metadata_arn:string ->
  unit
-> update_ops_metadata_request
(** Create a {!type-update_ops_metadata_request} type *)

val make_update_ops_item_response : unit
-> update_ops_item_response
(** Create a {!type-update_ops_item_response} type *)

val make_ops_item_data_value :
  ?type_:ops_item_data_type -> ?value:string -> unit
-> ops_item_data_value
(** Create a {!type-ops_item_data_value} type *)

val make_ops_item_notification : ?arn:string -> unit
-> ops_item_notification
(** Create a {!type-ops_item_notification} type *)

val make_related_ops_item : ops_item_id:string -> unit
-> related_ops_item
(** Create a {!type-related_ops_item} type *)

val make_update_ops_item_request :
  ?ops_item_arn:string ->
  ?planned_end_time:float ->
  ?planned_start_time:float ->
  ?actual_end_time:float ->
  ?actual_start_time:float ->
  ?severity:string ->
  ?category:string ->
  ?title:string ->
  ?status:ops_item_status ->
  ?related_ops_items:related_ops_item list ->
  ?priority:int ->
  ?notifications:ops_item_notification list ->
  ?operational_data_to_delete:string list ->
  ?operational_data:(string * ops_item_data_value) list ->
  ?description:string ->
  ops_item_id:string ->
  unit
-> update_ops_item_request
(** Create a {!type-update_ops_item_request} type *)

val make_update_managed_instance_role_request :
  iam_role:string -> instance_id:string -> unit
-> update_managed_instance_role_request
(** Create a {!type-update_managed_instance_role_request} type *)

val make_target : ?values:string list -> ?key:string -> unit
-> target
(** Create a {!type-target} type *)

val make_maintenance_window_task_parameter_value_expression :
  ?values:string list -> unit
-> maintenance_window_task_parameter_value_expression
(** Create a {!type-maintenance_window_task_parameter_value_expression} type *)

val make_cloud_watch_output_config :
  ?cloud_watch_output_enabled:bool ->
  ?cloud_watch_log_group_name:string ->
  unit
-> cloud_watch_output_config
(** Create a {!type-cloud_watch_output_config} type *)

val make_notification_config :
  ?notification_type:notification_type ->
  ?notification_events:notification_event list ->
  ?notification_arn:string ->
  unit
-> notification_config
(** Create a {!type-notification_config} type *)

val make_maintenance_window_run_command_parameters :
  ?timeout_seconds:int ->
  ?service_role_arn:string ->
  ?parameters:(string * string list) list ->
  ?output_s3_key_prefix:string ->
  ?output_s3_bucket_name:string ->
  ?notification_config:notification_config ->
  ?document_version:string ->
  ?document_hash_type:document_hash_type ->
  ?document_hash:string ->
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?comment:string ->
  unit
-> maintenance_window_run_command_parameters
(** Create a {!type-maintenance_window_run_command_parameters} type *)

val make_maintenance_window_automation_parameters :
  ?parameters:(string * string list) list -> ?document_version:string -> unit
-> maintenance_window_automation_parameters
(** Create a {!type-maintenance_window_automation_parameters} type *)

val make_maintenance_window_step_functions_parameters :
  ?name:string -> ?input:string -> unit
-> maintenance_window_step_functions_parameters
(** Create a {!type-maintenance_window_step_functions_parameters} type *)

val make_maintenance_window_lambda_parameters :
  ?payload:bytes -> ?qualifier:string -> ?client_context:string -> unit
-> maintenance_window_lambda_parameters
(** Create a {!type-maintenance_window_lambda_parameters} type *)

val make_maintenance_window_task_invocation_parameters :
  ?lambda:maintenance_window_lambda_parameters ->
  ?step_functions:maintenance_window_step_functions_parameters ->
  ?automation:maintenance_window_automation_parameters ->
  ?run_command:maintenance_window_run_command_parameters ->
  unit
-> maintenance_window_task_invocation_parameters
(** Create a {!type-maintenance_window_task_invocation_parameters} type *)

val make_logging_info :
  ?s3_key_prefix:string -> s3_region:string -> s3_bucket_name:string -> unit
-> logging_info
(** Create a {!type-logging_info} type *)

val make_alarm : name:string -> unit
-> alarm
(** Create a {!type-alarm} type *)

val make_alarm_configuration :
  ?ignore_poll_alarm_failure:bool -> alarms:alarm list -> unit
-> alarm_configuration
(** Create a {!type-alarm_configuration} type *)

val make_update_maintenance_window_task_request :
  ?alarm_configuration:alarm_configuration ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?replace:bool ->
  ?description:string ->
  ?name:string ->
  ?logging_info:logging_info ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?priority:int ->
  ?task_invocation_parameters:maintenance_window_task_invocation_parameters ->
  ?task_parameters:(string * maintenance_window_task_parameter_value_expression) list ->
  ?service_role_arn:string ->
  ?task_arn:string ->
  ?targets:target list ->
  window_task_id:string ->
  window_id:string ->
  unit
-> update_maintenance_window_task_request
(** Create a {!type-update_maintenance_window_task_request} type *)

val make_update_maintenance_window_target_request :
  ?replace:bool ->
  ?description:string ->
  ?name:string ->
  ?owner_information:string ->
  ?targets:target list ->
  window_target_id:string ->
  window_id:string ->
  unit
-> update_maintenance_window_target_request
(** Create a {!type-update_maintenance_window_target_request} type *)

val make_update_maintenance_window_request :
  ?replace:bool ->
  ?enabled:bool ->
  ?allow_unassociated_targets:bool ->
  ?cutoff:int ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?schedule_timezone:string ->
  ?schedule:string ->
  ?end_date:string ->
  ?start_date:string ->
  ?description:string ->
  ?name:string ->
  window_id:string ->
  unit
-> update_maintenance_window_request
(** Create a {!type-update_maintenance_window_request} type *)

val make_document_parameter :
  ?default_value:string ->
  ?description:string ->
  ?type_:document_parameter_type ->
  ?name:string ->
  unit
-> document_parameter
(** Create a {!type-document_parameter} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_attachment_information : ?name:string -> unit
-> attachment_information
(** Create a {!type-attachment_information} type *)

val make_document_requires :
  ?version_name:string ->
  ?require_type:string ->
  ?version:string ->
  name:string ->
  unit
-> document_requires
(** Create a {!type-document_requires} type *)

val make_review_information :
  ?reviewer:string -> ?status:review_status -> ?reviewed_time:float -> unit
-> review_information
(** Create a {!type-review_information} type *)

val make_document_description :
  ?category_enum:string list ->
  ?category:string list ->
  ?review_status:review_status ->
  ?pending_review_version:string ->
  ?approved_version:string ->
  ?review_information:review_information list ->
  ?author:string ->
  ?requires:document_requires list ->
  ?attachments_information:attachment_information list ->
  ?tags:tag list ->
  ?target_type:string ->
  ?document_format:document_format ->
  ?default_version:string ->
  ?latest_version:string ->
  ?schema_version:string ->
  ?document_type:document_type ->
  ?platform_types:platform_type list ->
  ?parameters:document_parameter list ->
  ?description:string ->
  ?document_version:string ->
  ?status_information:string ->
  ?status:document_status ->
  ?created_date:float ->
  ?owner:string ->
  ?version_name:string ->
  ?display_name:string ->
  ?name:string ->
  ?hash_type:document_hash_type ->
  ?hash:string ->
  ?sha1:string ->
  unit
-> document_description
(** Create a {!type-document_description} type *)

val make_attachments_source :
  ?name:string -> ?values:string list -> ?key:attachments_source_key -> unit
-> attachments_source
(** Create a {!type-attachments_source} type *)

val make_update_document_request :
  ?target_type:string ->
  ?document_format:document_format ->
  ?document_version:string ->
  ?version_name:string ->
  ?display_name:string ->
  ?attachments:attachments_source list ->
  name:string ->
  content:string ->
  unit
-> update_document_request
(** Create a {!type-update_document_request} type *)

val make_update_document_metadata_response : unit
-> update_document_metadata_response
(** Create a {!type-update_document_metadata_response} type *)

val make_document_review_comment_source :
  ?content:string -> ?type_:document_review_comment_type -> unit
-> document_review_comment_source
(** Create a {!type-document_review_comment_source} type *)

val make_document_reviews :
  ?comment:document_review_comment_source list ->
  action:document_review_action ->
  unit
-> document_reviews
(** Create a {!type-document_reviews} type *)

val make_update_document_metadata_request :
  ?document_version:string ->
  document_reviews:document_reviews ->
  name:string ->
  unit
-> update_document_metadata_request
(** Create a {!type-update_document_metadata_request} type *)

val make_document_default_version_description :
  ?default_version_name:string ->
  ?default_version:string ->
  ?name:string ->
  unit
-> document_default_version_description
(** Create a {!type-document_default_version_description} type *)

val make_update_document_default_version_request :
  document_version:string -> name:string -> unit
-> update_document_default_version_request
(** Create a {!type-update_document_default_version_request} type *)

val make_association_status :
  ?additional_info:string ->
  message:string ->
  name:association_status_name ->
  date:float ->
  unit
-> association_status
(** Create a {!type-association_status} type *)

val make_association_overview :
  ?association_status_aggregated_count:(string * int) list ->
  ?detailed_status:string ->
  ?status:string ->
  unit
-> association_overview
(** Create a {!type-association_overview} type *)

val make_s3_output_location :
  ?output_s3_key_prefix:string ->
  ?output_s3_bucket_name:string ->
  ?output_s3_region:string ->
  unit
-> s3_output_location
(** Create a {!type-s3_output_location} type *)

val make_instance_association_output_location :
  ?s3_location:s3_output_location -> unit
-> instance_association_output_location
(** Create a {!type-instance_association_output_location} type *)

val make_target_location :
  ?target_location_alarm_configuration:alarm_configuration ->
  ?execution_role_name:string ->
  ?target_location_max_errors:string ->
  ?target_location_max_concurrency:string ->
  ?regions:string list ->
  ?accounts:string list ->
  unit
-> target_location
(** Create a {!type-target_location} type *)

val make_alarm_state_information :
  state:external_alarm_state -> name:string -> unit
-> alarm_state_information
(** Create a {!type-alarm_state_information} type *)

val make_association_description :
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?target_locations:target_location list ->
  ?calendar_names:string list ->
  ?apply_only_at_cron_interval:bool ->
  ?sync_compliance:association_sync_compliance ->
  ?compliance_severity:association_compliance_severity ->
  ?max_concurrency:string ->
  ?max_errors:string ->
  ?association_name:string ->
  ?last_successful_execution_date:float ->
  ?last_execution_date:float ->
  ?output_location:instance_association_output_location ->
  ?schedule_expression:string ->
  ?targets:target list ->
  ?association_id:string ->
  ?parameters:(string * string list) list ->
  ?automation_target_parameter_name:string ->
  ?document_version:string ->
  ?overview:association_overview ->
  ?status:association_status ->
  ?last_update_association_date:float ->
  ?date:float ->
  ?association_version:string ->
  ?instance_id:string ->
  ?name:string ->
  unit
-> association_description
(** Create a {!type-association_description} type *)

val make_update_association_status_request :
  association_status:association_status ->
  instance_id:string ->
  name:string ->
  unit
-> update_association_status_request
(** Create a {!type-update_association_status_request} type *)

val make_update_association_request :
  ?alarm_configuration:alarm_configuration ->
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?target_locations:target_location list ->
  ?calendar_names:string list ->
  ?apply_only_at_cron_interval:bool ->
  ?sync_compliance:association_sync_compliance ->
  ?compliance_severity:association_compliance_severity ->
  ?max_concurrency:string ->
  ?max_errors:string ->
  ?automation_target_parameter_name:string ->
  ?association_version:string ->
  ?association_name:string ->
  ?targets:target list ->
  ?name:string ->
  ?output_location:instance_association_output_location ->
  ?schedule_expression:string ->
  ?document_version:string ->
  ?parameters:(string * string list) list ->
  association_id:string ->
  unit
-> update_association_request
(** Create a {!type-update_association_request} type *)

val make_unlabel_parameter_version_request :
  labels:string list -> parameter_version:int -> name:string -> unit
-> unlabel_parameter_version_request
(** Create a {!type-unlabel_parameter_version_request} type *)

val make_terminate_session_response : ?session_id:string -> unit
-> terminate_session_response
(** Create a {!type-terminate_session_response} type *)

val make_terminate_session_request : session_id:string -> unit
-> terminate_session_request
(** Create a {!type-terminate_session_request} type *)

val make_stop_automation_execution_request :
  ?type_:stop_type -> automation_execution_id:string -> unit
-> stop_automation_execution_request
(** Create a {!type-stop_automation_execution_request} type *)

val make_failure_details :
  ?details:(string * string list) list ->
  ?failure_type:string ->
  ?failure_stage:string ->
  unit
-> failure_details
(** Create a {!type-failure_details} type *)

val make_parent_step_details :
  ?iterator_value:string ->
  ?iteration:int ->
  ?action:string ->
  ?step_name:string ->
  ?step_execution_id:string ->
  unit
-> parent_step_details
(** Create a {!type-parent_step_details} type *)

val make_step_execution :
  ?parent_step_details:parent_step_details ->
  ?triggered_alarms:alarm_state_information list ->
  ?target_location:target_location ->
  ?targets:target list ->
  ?valid_next_steps:string list ->
  ?is_critical:bool ->
  ?next_step:string ->
  ?is_end:bool ->
  ?overridden_parameters:(string * string list) list ->
  ?step_execution_id:string ->
  ?failure_details:failure_details ->
  ?failure_message:string ->
  ?response:string ->
  ?outputs:(string * string list) list ->
  ?inputs:(string * string) list ->
  ?response_code:string ->
  ?step_status:automation_execution_status ->
  ?execution_end_time:float ->
  ?execution_start_time:float ->
  ?max_attempts:int ->
  ?on_failure:string ->
  ?timeout_seconds:int ->
  ?action:string ->
  ?step_name:string ->
  unit
-> step_execution
(** Create a {!type-step_execution} type *)

val make_step_execution_filter :
  values:string list -> key:step_execution_filter_key -> unit
-> step_execution_filter
(** Create a {!type-step_execution_filter} type *)

val make_start_session_response :
  ?stream_url:string -> ?token_value:string -> ?session_id:string -> unit
-> start_session_response
(** Create a {!type-start_session_response} type *)

val make_start_session_request :
  ?parameters:(string * string list) list ->
  ?reason:string ->
  ?document_name:string ->
  target:string ->
  unit
-> start_session_request
(** Create a {!type-start_session_request} type *)

val make_runbook :
  ?target_locations:target_location list ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?target_maps:(string * string list) list list ->
  ?targets:target list ->
  ?target_parameter_name:string ->
  ?parameters:(string * string list) list ->
  ?document_version:string ->
  document_name:string ->
  unit
-> runbook
(** Create a {!type-runbook} type *)

val make_start_change_request_execution_request :
  ?change_details:string ->
  ?scheduled_end_time:float ->
  ?tags:tag list ->
  ?auto_approve:bool ->
  ?client_token:string ->
  ?change_request_name:string ->
  ?parameters:(string * string list) list ->
  ?document_version:string ->
  ?scheduled_time:float ->
  runbooks:runbook list ->
  document_name:string ->
  unit
-> start_change_request_execution_request
(** Create a {!type-start_change_request_execution_request} type *)

val make_start_automation_execution_request :
  ?alarm_configuration:alarm_configuration ->
  ?tags:tag list ->
  ?target_locations:target_location list ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?target_maps:(string * string list) list list ->
  ?targets:target list ->
  ?target_parameter_name:string ->
  ?mode:execution_mode ->
  ?client_token:string ->
  ?parameters:(string * string list) list ->
  ?document_version:string ->
  document_name:string ->
  unit
-> start_automation_execution_request
(** Create a {!type-start_automation_execution_request} type *)

val make_start_associations_once_request :
  association_ids:string list -> unit
-> start_associations_once_request
(** Create a {!type-start_associations_once_request} type *)

val make_severity_summary :
  ?unspecified_count:int ->
  ?informational_count:int ->
  ?low_count:int ->
  ?medium_count:int ->
  ?high_count:int ->
  ?critical_count:int ->
  unit
-> severity_summary
(** Create a {!type-severity_summary} type *)

val make_session_manager_output_url :
  ?cloud_watch_output_url:string -> ?s3_output_url:string -> unit
-> session_manager_output_url
(** Create a {!type-session_manager_output_url} type *)

val make_session :
  ?max_session_duration:string ->
  ?output_url:session_manager_output_url ->
  ?details:string ->
  ?reason:string ->
  ?owner:string ->
  ?document_name:string ->
  ?end_date:float ->
  ?start_date:float ->
  ?status:session_status ->
  ?target:string ->
  ?session_id:string ->
  unit
-> session
(** Create a {!type-session} type *)

val make_session_filter : value:string -> key:session_filter_key -> unit
-> session_filter
(** Create a {!type-session_filter} type *)

val make_service_setting :
  ?status:string ->
  ?ar_n:string ->
  ?last_modified_user:string ->
  ?last_modified_date:float ->
  ?setting_value:string ->
  ?setting_id:string ->
  unit
-> service_setting
(** Create a {!type-service_setting} type *)

val make_command :
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?timeout_seconds:int ->
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?notification_config:notification_config ->
  ?service_role:string ->
  ?delivery_timed_out_count:int ->
  ?error_count:int ->
  ?completed_count:int ->
  ?target_count:int ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?output_s3_key_prefix:string ->
  ?output_s3_bucket_name:string ->
  ?output_s3_region:string ->
  ?status_details:string ->
  ?status:command_status ->
  ?requested_date_time:float ->
  ?targets:target list ->
  ?instance_ids:string list ->
  ?parameters:(string * string list) list ->
  ?expires_after:float ->
  ?comment:string ->
  ?document_version:string ->
  ?document_name:string ->
  ?command_id:string ->
  unit
-> command
(** Create a {!type-command} type *)

val make_send_command_request :
  ?alarm_configuration:alarm_configuration ->
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?notification_config:notification_config ->
  ?service_role_arn:string ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?output_s3_key_prefix:string ->
  ?output_s3_bucket_name:string ->
  ?output_s3_region:string ->
  ?parameters:(string * string list) list ->
  ?comment:string ->
  ?timeout_seconds:int ->
  ?document_hash_type:document_hash_type ->
  ?document_hash:string ->
  ?document_version:string ->
  ?targets:target list ->
  ?instance_ids:string list ->
  document_name:string ->
  unit
-> send_command_request
(** Create a {!type-send_command_request} type *)

val make_send_automation_signal_request :
  ?payload:(string * string list) list ->
  signal_type:signal_type ->
  automation_execution_id:string ->
  unit
-> send_automation_signal_request
(** Create a {!type-send_automation_signal_request} type *)

val make_scheduled_window_execution :
  ?execution_time:string -> ?name:string -> ?window_id:string -> unit
-> scheduled_window_execution
(** Create a {!type-scheduled_window_execution} type *)

val make_s3_output_url : ?output_url:string -> unit
-> s3_output_url
(** Create a {!type-s3_output_url} type *)

val make_resume_session_response :
  ?stream_url:string -> ?token_value:string -> ?session_id:string -> unit
-> resume_session_response
(** Create a {!type-resume_session_response} type *)

val make_resume_session_request : session_id:string -> unit
-> resume_session_request
(** Create a {!type-resume_session_request} type *)

val make_result_attribute : type_name:string -> unit
-> result_attribute
(** Create a {!type-result_attribute} type *)

val make_resource_data_sync_source_with_state :
  ?enable_all_ops_data_sources:bool ->
  ?state:string ->
  ?include_future_regions:bool ->
  ?source_regions:string list ->
  ?aws_organizations_source:resource_data_sync_aws_organizations_source ->
  ?source_type:string ->
  unit
-> resource_data_sync_source_with_state
(** Create a {!type-resource_data_sync_source_with_state} type *)

val make_resource_data_sync_destination_data_sharing :
  ?destination_data_sharing_type:string -> unit
-> resource_data_sync_destination_data_sharing
(** Create a {!type-resource_data_sync_destination_data_sharing} type *)

val make_resource_data_sync_s3_destination :
  ?destination_data_sharing:resource_data_sync_destination_data_sharing ->
  ?awskms_key_ar_n:string ->
  ?prefix:string ->
  region:string ->
  sync_format:resource_data_sync_s3_format ->
  bucket_name:string ->
  unit
-> resource_data_sync_s3_destination
(** Create a {!type-resource_data_sync_s3_destination} type *)

val make_resource_data_sync_item :
  ?last_sync_status_message:string ->
  ?sync_created_time:float ->
  ?last_status:last_resource_data_sync_status ->
  ?sync_last_modified_time:float ->
  ?last_successful_sync_time:float ->
  ?last_sync_time:float ->
  ?s3_destination:resource_data_sync_s3_destination ->
  ?sync_source:resource_data_sync_source_with_state ->
  ?sync_type:string ->
  ?sync_name:string ->
  unit
-> resource_data_sync_item
(** Create a {!type-resource_data_sync_item} type *)

val make_compliance_execution_summary :
  ?execution_type:string ->
  ?execution_id:string ->
  execution_time:float ->
  unit
-> compliance_execution_summary
(** Create a {!type-compliance_execution_summary} type *)

val make_compliant_summary :
  ?severity_summary:severity_summary -> ?compliant_count:int -> unit
-> compliant_summary
(** Create a {!type-compliant_summary} type *)

val make_non_compliant_summary :
  ?severity_summary:severity_summary -> ?non_compliant_count:int -> unit
-> non_compliant_summary
(** Create a {!type-non_compliant_summary} type *)

val make_resource_compliance_summary_item :
  ?non_compliant_summary:non_compliant_summary ->
  ?compliant_summary:compliant_summary ->
  ?execution_summary:compliance_execution_summary ->
  ?overall_severity:compliance_severity ->
  ?status:compliance_status ->
  ?resource_id:string ->
  ?resource_type:string ->
  ?compliance_type:string ->
  unit
-> resource_compliance_summary_item
(** Create a {!type-resource_compliance_summary_item} type *)

val make_resolved_targets :
  ?truncated:bool -> ?parameter_values:string list -> unit
-> resolved_targets
(** Create a {!type-resolved_targets} type *)

val make_reset_service_setting_request : setting_id:string -> unit
-> reset_service_setting_request
(** Create a {!type-reset_service_setting_request} type *)

val make_remove_tags_from_resource_request :
  tag_keys:string list ->
  resource_id:string ->
  resource_type:resource_type_for_tagging ->
  unit
-> remove_tags_from_resource_request
(** Create a {!type-remove_tags_from_resource_request} type *)

val make_registration_metadata_item : value:string -> key:string -> unit
-> registration_metadata_item
(** Create a {!type-registration_metadata_item} type *)

val make_register_task_with_maintenance_window_request :
  ?alarm_configuration:alarm_configuration ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?client_token:string ->
  ?description:string ->
  ?name:string ->
  ?logging_info:logging_info ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?priority:int ->
  ?task_invocation_parameters:maintenance_window_task_invocation_parameters ->
  ?task_parameters:(string * maintenance_window_task_parameter_value_expression) list ->
  ?service_role_arn:string ->
  ?targets:target list ->
  task_type:maintenance_window_task_type ->
  task_arn:string ->
  window_id:string ->
  unit
-> register_task_with_maintenance_window_request
(** Create a {!type-register_task_with_maintenance_window_request} type *)

val make_register_target_with_maintenance_window_request :
  ?client_token:string ->
  ?description:string ->
  ?name:string ->
  ?owner_information:string ->
  targets:target list ->
  resource_type:maintenance_window_resource_type ->
  window_id:string ->
  unit
-> register_target_with_maintenance_window_request
(** Create a {!type-register_target_with_maintenance_window_request} type *)

val make_register_patch_baseline_for_patch_group_request :
  patch_group:string -> baseline_id:string -> unit
-> register_patch_baseline_for_patch_group_request
(** Create a {!type-register_patch_baseline_for_patch_group_request} type *)

val make_register_default_patch_baseline_request : baseline_id:string -> unit
-> register_default_patch_baseline_request
(** Create a {!type-register_default_patch_baseline_request} type *)

val make_put_resource_policy_response :
  ?policy_hash:string -> ?policy_id:string -> unit
-> put_resource_policy_response
(** Create a {!type-put_resource_policy_response} type *)

val make_put_resource_policy_request :
  ?policy_hash:string ->
  ?policy_id:string ->
  policy:string ->
  resource_arn:string ->
  unit
-> put_resource_policy_request
(** Create a {!type-put_resource_policy_request} type *)

val make_put_parameter_request :
  ?data_type:string ->
  ?policies:string ->
  ?tier:parameter_tier ->
  ?tags:tag list ->
  ?allowed_pattern:string ->
  ?overwrite:bool ->
  ?key_id:string ->
  ?type_:parameter_type ->
  ?description:string ->
  value:string ->
  name:string ->
  unit
-> put_parameter_request
(** Create a {!type-put_parameter_request} type *)

val make_inventory_item :
  ?context:(string * string) list ->
  ?content:(string * string) list list ->
  ?content_hash:string ->
  capture_time:string ->
  schema_version:string ->
  type_name:string ->
  unit
-> inventory_item
(** Create a {!type-inventory_item} type *)

val make_put_inventory_request :
  items:inventory_item list -> instance_id:string -> unit
-> put_inventory_request
(** Create a {!type-put_inventory_request} type *)

val make_compliance_item_entry :
  ?details:(string * string) list ->
  ?title:string ->
  ?id:string ->
  status:compliance_status ->
  severity:compliance_severity ->
  unit
-> compliance_item_entry
(** Create a {!type-compliance_item_entry} type *)

val make_put_compliance_items_request :
  ?upload_type:compliance_upload_type ->
  ?item_content_hash:string ->
  items:compliance_item_entry list ->
  execution_summary:compliance_execution_summary ->
  compliance_type:string ->
  resource_type:string ->
  resource_id:string ->
  unit
-> put_compliance_items_request
(** Create a {!type-put_compliance_items_request} type *)

val make_progress_counters :
  ?timed_out_steps:int ->
  ?cancelled_steps:int ->
  ?failed_steps:int ->
  ?success_steps:int ->
  ?total_steps:int ->
  unit
-> progress_counters
(** Create a {!type-progress_counters} type *)

val make_patch_status :
  ?approval_date:float ->
  ?compliance_level:patch_compliance_level ->
  ?deployment_status:patch_deployment_status ->
  unit
-> patch_status
(** Create a {!type-patch_status} type *)

val make_patch_orchestrator_filter :
  ?values:string list -> ?key:string -> unit
-> patch_orchestrator_filter
(** Create a {!type-patch_orchestrator_filter} type *)

val make_patch :
  ?repository:string ->
  ?severity:string ->
  ?arch:string ->
  ?release:string ->
  ?version:string ->
  ?epoch:int ->
  ?name:string ->
  ?cve_ids:string list ->
  ?bugzilla_ids:string list ->
  ?advisory_ids:string list ->
  ?language:string ->
  ?msrc_number:string ->
  ?kb_number:string ->
  ?msrc_severity:string ->
  ?classification:string ->
  ?product:string ->
  ?product_family:string ->
  ?vendor:string ->
  ?content_url:string ->
  ?description:string ->
  ?title:string ->
  ?release_date:float ->
  ?id:string ->
  unit
-> patch
(** Create a {!type-patch} type *)

val make_patch_baseline_identity :
  ?default_baseline:bool ->
  ?baseline_description:string ->
  ?operating_system:operating_system ->
  ?baseline_name:string ->
  ?baseline_id:string ->
  unit
-> patch_baseline_identity
(** Create a {!type-patch_baseline_identity} type *)

val make_patch_group_patch_baseline_mapping :
  ?baseline_identity:patch_baseline_identity -> ?patch_group:string -> unit
-> patch_group_patch_baseline_mapping
(** Create a {!type-patch_group_patch_baseline_mapping} type *)

val make_patch_compliance_data :
  ?cve_ids:string ->
  installed_time:float ->
  state:patch_compliance_data_state ->
  severity:string ->
  classification:string ->
  kb_id:string ->
  title:string ->
  unit
-> patch_compliance_data
(** Create a {!type-patch_compliance_data} type *)

val make_parameters_filter :
  values:string list -> key:parameters_filter_key -> unit
-> parameters_filter
(** Create a {!type-parameters_filter} type *)

val make_parameter_string_filter :
  ?values:string list -> ?option_:string -> key:string -> unit
-> parameter_string_filter
(** Create a {!type-parameter_string_filter} type *)

val make_parameter_inline_policy :
  ?policy_status:string -> ?policy_type:string -> ?policy_text:string -> unit
-> parameter_inline_policy
(** Create a {!type-parameter_inline_policy} type *)

val make_parameter_metadata :
  ?data_type:string ->
  ?policies:parameter_inline_policy list ->
  ?tier:parameter_tier ->
  ?version:int ->
  ?allowed_pattern:string ->
  ?description:string ->
  ?last_modified_user:string ->
  ?last_modified_date:float ->
  ?key_id:string ->
  ?type_:parameter_type ->
  ?ar_n:string ->
  ?name:string ->
  unit
-> parameter_metadata
(** Create a {!type-parameter_metadata} type *)

val make_parameter :
  ?data_type:string ->
  ?ar_n:string ->
  ?last_modified_date:float ->
  ?source_result:string ->
  ?selector:string ->
  ?version:int ->
  ?value:string ->
  ?type_:parameter_type ->
  ?name:string ->
  unit
-> parameter
(** Create a {!type-parameter} type *)

val make_parameter_history :
  ?data_type:string ->
  ?policies:parameter_inline_policy list ->
  ?tier:parameter_tier ->
  ?labels:string list ->
  ?version:int ->
  ?allowed_pattern:string ->
  ?value:string ->
  ?description:string ->
  ?last_modified_user:string ->
  ?last_modified_date:float ->
  ?key_id:string ->
  ?type_:parameter_type ->
  ?name:string ->
  unit
-> parameter_history
(** Create a {!type-parameter_history} type *)

val make_output_source :
  ?output_source_type:string -> ?output_source_id:string -> unit
-> output_source
(** Create a {!type-output_source} type *)

val make_ops_result_attribute : type_name:string -> unit
-> ops_result_attribute
(** Create a {!type-ops_result_attribute} type *)

val make_ops_metadata :
  ?creation_date:float ->
  ?last_modified_user:string ->
  ?last_modified_date:float ->
  ?ops_metadata_arn:string ->
  ?resource_id:string ->
  unit
-> ops_metadata
(** Create a {!type-ops_metadata} type *)

val make_ops_metadata_filter : values:string list -> key:string -> unit
-> ops_metadata_filter
(** Create a {!type-ops_metadata_filter} type *)

val make_ops_item_summary :
  ?planned_end_time:float ->
  ?planned_start_time:float ->
  ?actual_end_time:float ->
  ?actual_start_time:float ->
  ?ops_item_type:string ->
  ?severity:string ->
  ?category:string ->
  ?operational_data:(string * ops_item_data_value) list ->
  ?title:string ->
  ?ops_item_id:string ->
  ?status:ops_item_status ->
  ?source:string ->
  ?priority:int ->
  ?last_modified_time:float ->
  ?last_modified_by:string ->
  ?created_time:float ->
  ?created_by:string ->
  unit
-> ops_item_summary
(** Create a {!type-ops_item_summary} type *)

val make_ops_item_related_items_filter :
  operator:ops_item_related_items_filter_operator ->
  values:string list ->
  key:ops_item_related_items_filter_key ->
  unit
-> ops_item_related_items_filter
(** Create a {!type-ops_item_related_items_filter} type *)

val make_ops_item_identity : ?arn:string -> unit
-> ops_item_identity
(** Create a {!type-ops_item_identity} type *)

val make_ops_item_related_item_summary :
  ?last_modified_time:float ->
  ?last_modified_by:ops_item_identity ->
  ?created_time:float ->
  ?created_by:ops_item_identity ->
  ?resource_uri:string ->
  ?association_type:string ->
  ?resource_type:string ->
  ?association_id:string ->
  ?ops_item_id:string ->
  unit
-> ops_item_related_item_summary
(** Create a {!type-ops_item_related_item_summary} type *)

val make_ops_item_filter :
  operator:ops_item_filter_operator ->
  values:string list ->
  key:ops_item_filter_key ->
  unit
-> ops_item_filter
(** Create a {!type-ops_item_filter} type *)

val make_ops_item_event_summary :
  ?created_time:float ->
  ?created_by:ops_item_identity ->
  ?detail:string ->
  ?detail_type:string ->
  ?source:string ->
  ?event_id:string ->
  ?ops_item_id:string ->
  unit
-> ops_item_event_summary
(** Create a {!type-ops_item_event_summary} type *)

val make_ops_item_event_filter :
  operator:ops_item_event_filter_operator ->
  values:string list ->
  key:ops_item_event_filter_key ->
  unit
-> ops_item_event_filter
(** Create a {!type-ops_item_event_filter} type *)

val make_ops_item :
  ?ops_item_arn:string ->
  ?planned_end_time:float ->
  ?planned_start_time:float ->
  ?actual_end_time:float ->
  ?actual_start_time:float ->
  ?severity:string ->
  ?category:string ->
  ?operational_data:(string * ops_item_data_value) list ->
  ?source:string ->
  ?title:string ->
  ?version:string ->
  ?ops_item_id:string ->
  ?status:ops_item_status ->
  ?related_ops_items:related_ops_item list ->
  ?priority:int ->
  ?notifications:ops_item_notification list ->
  ?last_modified_time:float ->
  ?last_modified_by:string ->
  ?description:string ->
  ?created_time:float ->
  ?ops_item_type:string ->
  ?created_by:string ->
  unit -> ops_item
(** Create a {!type-ops_item} type *)

val make_ops_filter :
  ?type_:ops_filter_operator_type -> values:string list -> key:string -> unit
-> ops_filter
(** Create a {!type-ops_filter} type *)

val make_ops_entity_item :
  ?content:(string * string) list list -> ?capture_time:string -> unit
-> ops_entity_item
(** Create a {!type-ops_entity_item} type *)

val make_ops_entity :
  ?data:(string * ops_entity_item) list -> ?id:string -> unit
-> ops_entity
(** Create a {!type-ops_entity} type *)

val make_ops_aggregator :
  ?aggregators:ops_aggregator list ->
  ?filters:ops_filter list ->
  ?values:(string * string) list ->
  ?attribute_name:string ->
  ?type_name:string ->
  ?aggregator_type:string ->
  unit
-> ops_aggregator
(** Create a {!type-ops_aggregator} type *)

val make_modify_document_permission_response : unit
-> modify_document_permission_response
(** Create a {!type-modify_document_permission_response} type *)

val make_modify_document_permission_request :
  ?shared_document_version:string ->
  ?account_ids_to_remove:string list ->
  ?account_ids_to_add:string list ->
  permission_type:document_permission_type ->
  name:string ->
  unit
-> modify_document_permission_request
(** Create a {!type-modify_document_permission_request} type *)

val make_maintenance_window_identity_for_target :
  ?name:string -> ?window_id:string -> unit
-> maintenance_window_identity_for_target
(** Create a {!type-maintenance_window_identity_for_target} type *)

val make_maintenance_window_task :
  ?alarm_configuration:alarm_configuration ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?description:string ->
  ?name:string ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?service_role_arn:string ->
  ?logging_info:logging_info ->
  ?priority:int ->
  ?task_parameters:(string * maintenance_window_task_parameter_value_expression) list ->
  ?targets:target list ->
  ?type_:maintenance_window_task_type ->
  ?task_arn:string ->
  ?window_task_id:string ->
  ?window_id:string ->
  unit
-> maintenance_window_task
(** Create a {!type-maintenance_window_task} type *)

val make_maintenance_window_target :
  ?description:string ->
  ?name:string ->
  ?owner_information:string ->
  ?targets:target list ->
  ?resource_type:maintenance_window_resource_type ->
  ?window_target_id:string ->
  ?window_id:string ->
  unit
-> maintenance_window_target
(** Create a {!type-maintenance_window_target} type *)

val make_maintenance_window_identity :
  ?next_execution_time:string ->
  ?start_date:string ->
  ?end_date:string ->
  ?schedule_offset:int ->
  ?schedule_timezone:string ->
  ?schedule:string ->
  ?cutoff:int ->
  ?duration:int ->
  ?enabled:bool ->
  ?description:string ->
  ?name:string ->
  ?window_id:string ->
  unit
-> maintenance_window_identity
(** Create a {!type-maintenance_window_identity} type *)

val make_maintenance_window_filter :
  ?values:string list -> ?key:string -> unit
-> maintenance_window_filter
(** Create a {!type-maintenance_window_filter} type *)

val make_maintenance_window_execution_task_invocation_identity :
  ?window_target_id:string ->
  ?owner_information:string ->
  ?end_time:float ->
  ?start_time:float ->
  ?status_details:string ->
  ?status:maintenance_window_execution_status ->
  ?parameters:string ->
  ?task_type:maintenance_window_task_type ->
  ?execution_id:string ->
  ?invocation_id:string ->
  ?task_execution_id:string ->
  ?window_execution_id:string ->
  unit
-> maintenance_window_execution_task_invocation_identity
(** Create a {!type-maintenance_window_execution_task_invocation_identity} type *)

val make_maintenance_window_execution_task_identity :
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?task_type:maintenance_window_task_type ->
  ?task_arn:string ->
  ?end_time:float ->
  ?start_time:float ->
  ?status_details:string ->
  ?status:maintenance_window_execution_status ->
  ?task_execution_id:string ->
  ?window_execution_id:string ->
  unit
-> maintenance_window_execution_task_identity
(** Create a {!type-maintenance_window_execution_task_identity} type *)

val make_maintenance_window_execution :
  ?end_time:float ->
  ?start_time:float ->
  ?status_details:string ->
  ?status:maintenance_window_execution_status ->
  ?window_execution_id:string ->
  ?window_id:string ->
  unit
-> maintenance_window_execution
(** Create a {!type-maintenance_window_execution} type *)

val make_list_tags_for_resource_request :
  resource_id:string -> resource_type:resource_type_for_tagging -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_list_resource_data_sync_request :
  ?max_results:int -> ?next_token:string -> ?sync_type:string -> unit
-> list_resource_data_sync_request
(** Create a {!type-list_resource_data_sync_request} type *)

val make_compliance_string_filter :
  ?type_:compliance_query_operator_type ->
  ?values:string list ->
  ?key:string ->
  unit
-> compliance_string_filter
(** Create a {!type-compliance_string_filter} type *)

val make_list_resource_compliance_summaries_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:compliance_string_filter list ->
  unit
-> list_resource_compliance_summaries_request
(** Create a {!type-list_resource_compliance_summaries_request} type *)

val make_list_ops_metadata_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:ops_metadata_filter list ->
  unit
-> list_ops_metadata_request
(** Create a {!type-list_ops_metadata_request} type *)

val make_list_ops_item_related_items_response :
  ?summaries:ops_item_related_item_summary list -> ?next_token:string -> unit
-> list_ops_item_related_items_response
(** Create a {!type-list_ops_item_related_items_response} type *)

val make_list_ops_item_related_items_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:ops_item_related_items_filter list ->
  ?ops_item_id:string ->
  unit
-> list_ops_item_related_items_request
(** Create a {!type-list_ops_item_related_items_request} type *)

val make_list_ops_item_events_response :
  ?summaries:ops_item_event_summary list -> ?next_token:string -> unit
-> list_ops_item_events_response
(** Create a {!type-list_ops_item_events_response} type *)

val make_list_ops_item_events_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:ops_item_event_filter list ->
  unit
-> list_ops_item_events_request
(** Create a {!type-list_ops_item_events_request} type *)

val make_inventory_filter :
  ?type_:inventory_query_operator_type ->
  values:string list ->
  key:string ->
  unit
-> inventory_filter
(** Create a {!type-inventory_filter} type *)

val make_list_inventory_entries_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:inventory_filter list ->
  type_name:string ->
  instance_id:string ->
  unit
-> list_inventory_entries_request
(** Create a {!type-list_inventory_entries_request} type *)

val make_document_identifier :
  ?author:string ->
  ?review_status:review_status ->
  ?requires:document_requires list ->
  ?tags:tag list ->
  ?target_type:string ->
  ?document_format:document_format ->
  ?schema_version:string ->
  ?document_type:document_type ->
  ?document_version:string ->
  ?platform_types:platform_type list ->
  ?version_name:string ->
  ?owner:string ->
  ?display_name:string ->
  ?created_date:float ->
  ?name:string ->
  unit
-> document_identifier
(** Create a {!type-document_identifier} type *)

val make_document_filter : value:string -> key:document_filter_key -> unit
-> document_filter
(** Create a {!type-document_filter} type *)

val make_document_key_values_filter :
  ?values:string list -> ?key:string -> unit
-> document_key_values_filter
(** Create a {!type-document_key_values_filter} type *)

val make_list_documents_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:document_key_values_filter list ->
  ?document_filter_list:document_filter list ->
  unit
-> list_documents_request
(** Create a {!type-list_documents_request} type *)

val make_document_version_info :
  ?review_status:review_status ->
  ?status_information:string ->
  ?status:document_status ->
  ?document_format:document_format ->
  ?is_default_version:bool ->
  ?created_date:float ->
  ?version_name:string ->
  ?document_version:string ->
  ?display_name:string ->
  ?name:string ->
  unit
-> document_version_info
(** Create a {!type-document_version_info} type *)

val make_list_document_versions_request :
  ?next_token:string -> ?max_results:int -> name:string -> unit
-> list_document_versions_request
(** Create a {!type-list_document_versions_request} type *)

val make_document_reviewer_response_source :
  ?reviewer:string ->
  ?comment:document_review_comment_source list ->
  ?review_status:review_status ->
  ?updated_time:float ->
  ?create_time:float ->
  unit
-> document_reviewer_response_source
(** Create a {!type-document_reviewer_response_source} type *)

val make_document_metadata_response_info :
  ?reviewer_response:document_reviewer_response_source list -> unit
-> document_metadata_response_info
(** Create a {!type-document_metadata_response_info} type *)

val make_list_document_metadata_history_response :
  ?next_token:string ->
  ?metadata:document_metadata_response_info ->
  ?author:string ->
  ?document_version:string ->
  ?name:string ->
  unit
-> list_document_metadata_history_response
(** Create a {!type-list_document_metadata_history_response} type *)

val make_list_document_metadata_history_request :
  ?max_results:int ->
  ?next_token:string ->
  ?document_version:string ->
  metadata:document_metadata_enum ->
  name:string ->
  unit
-> list_document_metadata_history_request
(** Create a {!type-list_document_metadata_history_request} type *)

val make_compliance_summary_item :
  ?non_compliant_summary:non_compliant_summary ->
  ?compliant_summary:compliant_summary ->
  ?compliance_type:string ->
  unit
-> compliance_summary_item
(** Create a {!type-compliance_summary_item} type *)

val make_list_compliance_summaries_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:compliance_string_filter list ->
  unit
-> list_compliance_summaries_request
(** Create a {!type-list_compliance_summaries_request} type *)

val make_compliance_item :
  ?details:(string * string) list ->
  ?execution_summary:compliance_execution_summary ->
  ?severity:compliance_severity ->
  ?status:compliance_status ->
  ?title:string ->
  ?id:string ->
  ?resource_id:string ->
  ?resource_type:string ->
  ?compliance_type:string ->
  unit
-> compliance_item
(** Create a {!type-compliance_item} type *)

val make_list_compliance_items_request :
  ?max_results:int ->
  ?next_token:string ->
  ?resource_types:string list ->
  ?resource_ids:string list ->
  ?filters:compliance_string_filter list ->
  unit
-> list_compliance_items_request
(** Create a {!type-list_compliance_items_request} type *)

val make_command_filter : value:string -> key:command_filter_key -> unit
-> command_filter
(** Create a {!type-command_filter} type *)

val make_list_commands_request :
  ?filters:command_filter list ->
  ?next_token:string ->
  ?max_results:int ->
  ?instance_id:string ->
  ?command_id:string ->
  unit
-> list_commands_request
(** Create a {!type-list_commands_request} type *)

val make_command_plugin :
  ?output_s3_key_prefix:string ->
  ?output_s3_bucket_name:string ->
  ?output_s3_region:string ->
  ?standard_error_url:string ->
  ?standard_output_url:string ->
  ?output:string ->
  ?response_finish_date_time:float ->
  ?response_start_date_time:float ->
  ?response_code:int ->
  ?status_details:string ->
  ?status:command_plugin_status ->
  ?name:string ->
  unit
-> command_plugin
(** Create a {!type-command_plugin} type *)

val make_command_invocation :
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?notification_config:notification_config ->
  ?service_role:string ->
  ?command_plugins:command_plugin list ->
  ?standard_error_url:string ->
  ?standard_output_url:string ->
  ?trace_output:string ->
  ?status_details:string ->
  ?status:command_invocation_status ->
  ?requested_date_time:float ->
  ?document_version:string ->
  ?document_name:string ->
  ?comment:string ->
  ?instance_name:string ->
  ?instance_id:string ->
  ?command_id:string ->
  unit
-> command_invocation
(** Create a {!type-command_invocation} type *)

val make_list_command_invocations_request :
  ?details:bool ->
  ?filters:command_filter list ->
  ?next_token:string ->
  ?max_results:int ->
  ?instance_id:string ->
  ?command_id:string ->
  unit
-> list_command_invocations_request
(** Create a {!type-list_command_invocations_request} type *)

val make_association :
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?association_name:string ->
  ?schedule_expression:string ->
  ?overview:association_overview ->
  ?last_execution_date:float ->
  ?targets:target list ->
  ?document_version:string ->
  ?association_version:string ->
  ?association_id:string ->
  ?instance_id:string ->
  ?name:string ->
  unit
-> association
(** Create a {!type-association} type *)

val make_association_filter :
  value:string -> key:association_filter_key -> unit
-> association_filter
(** Create a {!type-association_filter} type *)

val make_list_associations_request :
  ?next_token:string ->
  ?max_results:int ->
  ?association_filter_list:association_filter list ->
  unit
-> list_associations_request
(** Create a {!type-list_associations_request} type *)

val make_association_version_info :
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?target_locations:target_location list ->
  ?calendar_names:string list ->
  ?apply_only_at_cron_interval:bool ->
  ?sync_compliance:association_sync_compliance ->
  ?compliance_severity:association_compliance_severity ->
  ?max_concurrency:string ->
  ?max_errors:string ->
  ?association_name:string ->
  ?output_location:instance_association_output_location ->
  ?schedule_expression:string ->
  ?targets:target list ->
  ?parameters:(string * string list) list ->
  ?document_version:string ->
  ?name:string ->
  ?created_date:float ->
  ?association_version:string ->
  ?association_id:string ->
  unit
-> association_version_info
(** Create a {!type-association_version_info} type *)

val make_list_association_versions_request :
  ?next_token:string -> ?max_results:int -> association_id:string -> unit
-> list_association_versions_request
(** Create a {!type-list_association_versions_request} type *)

val make_label_parameter_version_request :
  ?parameter_version:int -> labels:string list -> name:string -> unit
-> label_parameter_version_request
(** Create a {!type-label_parameter_version_request} type *)

val make_inventory_result_item :
  ?content_hash:string ->
  ?capture_time:string ->
  content:(string * string) list list ->
  schema_version:string ->
  type_name:string ->
  unit
-> inventory_result_item
(** Create a {!type-inventory_result_item} type *)

val make_inventory_result_entity :
  ?data:(string * inventory_result_item) list -> ?id:string -> unit
-> inventory_result_entity
(** Create a {!type-inventory_result_entity} type *)

val make_inventory_item_attribute :
  data_type:inventory_attribute_data_type -> name:string -> unit
-> inventory_item_attribute
(** Create a {!type-inventory_item_attribute} type *)

val make_inventory_item_schema :
  ?display_name:string ->
  ?version:string ->
  attributes:inventory_item_attribute list ->
  type_name:string ->
  unit
-> inventory_item_schema
(** Create a {!type-inventory_item_schema} type *)

val make_inventory_group :
  filters:inventory_filter list -> name:string -> unit
-> inventory_group
(** Create a {!type-inventory_group} type *)

val make_inventory_deletion_summary_item :
  ?remaining_count:int -> ?count:int -> ?version:string -> unit
-> inventory_deletion_summary_item
(** Create a {!type-inventory_deletion_summary_item} type *)

val make_inventory_deletion_summary :
  ?summary_items:inventory_deletion_summary_item list ->
  ?remaining_count:int ->
  ?total_count:int ->
  unit
-> inventory_deletion_summary
(** Create a {!type-inventory_deletion_summary} type *)

val make_inventory_deletion_status_item :
  ?last_status_update_time:float ->
  ?deletion_summary:inventory_deletion_summary ->
  ?last_status_message:string ->
  ?last_status:inventory_deletion_status ->
  ?deletion_start_time:float ->
  ?type_name:string ->
  ?deletion_id:string ->
  unit
-> inventory_deletion_status_item
(** Create a {!type-inventory_deletion_status_item} type *)

val make_inventory_aggregator :
  ?groups:inventory_group list ->
  ?aggregators:inventory_aggregator list ->
  ?expression:string ->
  unit
-> inventory_aggregator
(** Create a {!type-inventory_aggregator} type *)

val make_instance_property_string_filter :
  ?operator:instance_property_filter_operator ->
  values:string list ->
  key:string ->
  unit
-> instance_property_string_filter
(** Create a {!type-instance_property_string_filter} type *)

val make_instance_property_filter :
  value_set:string list -> key:instance_property_filter_key -> unit
-> instance_property_filter
(** Create a {!type-instance_property_filter} type *)

val make_instance_aggregated_association_overview :
  ?instance_association_status_aggregated_count:(string * int) list ->
  ?detailed_status:string ->
  unit
-> instance_aggregated_association_overview
(** Create a {!type-instance_aggregated_association_overview} type *)

val make_instance_property :
  ?source_type:source_type ->
  ?source_id:string ->
  ?association_overview:instance_aggregated_association_overview ->
  ?last_successful_association_execution_date:float ->
  ?last_association_execution_date:float ->
  ?association_status:string ->
  ?computer_name:string ->
  ?resource_type:string ->
  ?registration_date:float ->
  ?iam_role:string ->
  ?activation_id:string ->
  ?platform_version:string ->
  ?platform_name:string ->
  ?platform_type:platform_type ->
  ?agent_version:string ->
  ?last_ping_date_time:float ->
  ?ping_status:ping_status ->
  ?launch_time:float ->
  ?ip_address:string ->
  ?architecture:string ->
  ?instance_state:string ->
  ?key_name:string ->
  ?instance_role:string ->
  ?instance_type:string ->
  ?instance_id:string ->
  ?name:string ->
  unit
-> instance_property
(** Create a {!type-instance_property} type *)

val make_instance_patch_state :
  ?other_non_compliant_count:int ->
  ?security_non_compliant_count:int ->
  ?critical_non_compliant_count:int ->
  ?reboot_option:reboot_option ->
  ?last_no_reboot_install_operation_time:float ->
  ?not_applicable_count:int ->
  ?unreported_not_applicable_count:int ->
  ?failed_count:int ->
  ?missing_count:int ->
  ?installed_rejected_count:int ->
  ?installed_pending_reboot_count:int ->
  ?installed_other_count:int ->
  ?installed_count:int ->
  ?owner_information:string ->
  ?install_override_list:string ->
  ?snapshot_id:string ->
  operation:patch_operation_type ->
  operation_end_time:float ->
  operation_start_time:float ->
  baseline_id:string ->
  patch_group:string ->
  instance_id:string ->
  unit
-> instance_patch_state
(** Create a {!type-instance_patch_state} type *)

val make_instance_patch_state_filter :
  type_:instance_patch_state_operator_type ->
  values:string list ->
  key:string ->
  unit
-> instance_patch_state_filter
(** Create a {!type-instance_patch_state_filter} type *)

val make_instance_information_string_filter :
  values:string list -> key:string -> unit
-> instance_information_string_filter
(** Create a {!type-instance_information_string_filter} type *)

val make_instance_information :
  ?source_type:source_type ->
  ?source_id:string ->
  ?association_overview:instance_aggregated_association_overview ->
  ?last_successful_association_execution_date:float ->
  ?last_association_execution_date:float ->
  ?association_status:string ->
  ?computer_name:string ->
  ?ip_address:string ->
  ?name:string ->
  ?resource_type:resource_type ->
  ?registration_date:float ->
  ?iam_role:string ->
  ?activation_id:string ->
  ?platform_version:string ->
  ?platform_name:string ->
  ?platform_type:platform_type ->
  ?is_latest_version:bool ->
  ?agent_version:string ->
  ?last_ping_date_time:float ->
  ?ping_status:ping_status ->
  ?instance_id:string ->
  unit
-> instance_information
(** Create a {!type-instance_information} type *)

val make_instance_information_filter :
  value_set:string list -> key:instance_information_filter_key -> unit
-> instance_information_filter
(** Create a {!type-instance_information_filter} type *)

val make_instance_association_output_url :
  ?s3_output_url:s3_output_url -> unit
-> instance_association_output_url
(** Create a {!type-instance_association_output_url} type *)

val make_instance_association_status_info :
  ?association_name:string ->
  ?output_url:instance_association_output_url ->
  ?error_code:string ->
  ?execution_summary:string ->
  ?detailed_status:string ->
  ?status:string ->
  ?execution_date:float ->
  ?instance_id:string ->
  ?association_version:string ->
  ?document_version:string ->
  ?name:string ->
  ?association_id:string ->
  unit
-> instance_association_status_info
(** Create a {!type-instance_association_status_info} type *)

val make_instance_association :
  ?association_version:string ->
  ?content:string ->
  ?instance_id:string ->
  ?association_id:string ->
  unit
-> instance_association
(** Create a {!type-instance_association} type *)

val make_get_service_setting_request : setting_id:string -> unit
-> get_service_setting_request
(** Create a {!type-get_service_setting_request} type *)

val make_get_resource_policies_response_entry :
  ?policy:string -> ?policy_hash:string -> ?policy_id:string -> unit
-> get_resource_policies_response_entry
(** Create a {!type-get_resource_policies_response_entry} type *)

val make_get_resource_policies_response :
  ?policies:get_resource_policies_response_entry list ->
  ?next_token:string ->
  unit
-> get_resource_policies_response
(** Create a {!type-get_resource_policies_response} type *)

val make_get_resource_policies_request :
  ?max_results:int -> ?next_token:string -> resource_arn:string -> unit
-> get_resource_policies_request
(** Create a {!type-get_resource_policies_request} type *)

val make_get_patch_baseline_request : baseline_id:string -> unit
-> get_patch_baseline_request
(** Create a {!type-get_patch_baseline_request} type *)

val make_get_patch_baseline_for_patch_group_request :
  ?operating_system:operating_system -> patch_group:string -> unit
-> get_patch_baseline_for_patch_group_request
(** Create a {!type-get_patch_baseline_for_patch_group_request} type *)

val make_get_parameters_request :
  ?with_decryption:bool -> names:string list -> unit
-> get_parameters_request
(** Create a {!type-get_parameters_request} type *)

val make_get_parameters_by_path_request :
  ?next_token:string ->
  ?max_results:int ->
  ?with_decryption:bool ->
  ?parameter_filters:parameter_string_filter list ->
  ?recursive:bool ->
  path:string ->
  unit
-> get_parameters_by_path_request
(** Create a {!type-get_parameters_by_path_request} type *)

val make_get_parameter_request : ?with_decryption:bool -> name:string -> unit
-> get_parameter_request
(** Create a {!type-get_parameter_request} type *)

val make_get_parameter_history_request :
  ?next_token:string ->
  ?max_results:int ->
  ?with_decryption:bool ->
  name:string ->
  unit
-> get_parameter_history_request
(** Create a {!type-get_parameter_history_request} type *)

val make_get_ops_summary_request :
  ?max_results:int ->
  ?next_token:string ->
  ?result_attributes:ops_result_attribute list ->
  ?aggregators:ops_aggregator list ->
  ?filters:ops_filter list ->
  ?sync_name:string ->
  unit
-> get_ops_summary_request
(** Create a {!type-get_ops_summary_request} type *)

val make_get_ops_metadata_request :
  ?next_token:string -> ?max_results:int -> ops_metadata_arn:string -> unit
-> get_ops_metadata_request
(** Create a {!type-get_ops_metadata_request} type *)

val make_get_ops_item_response : ?ops_item:ops_item -> unit
-> get_ops_item_response
(** Create a {!type-get_ops_item_response} type *)

val make_get_ops_item_request :
  ?ops_item_arn:string -> ops_item_id:string -> unit
-> get_ops_item_request
(** Create a {!type-get_ops_item_request} type *)

val make_get_maintenance_window_task_request :
  window_task_id:string -> window_id:string -> unit
-> get_maintenance_window_task_request
(** Create a {!type-get_maintenance_window_task_request} type *)

val make_get_maintenance_window_request : window_id:string -> unit
-> get_maintenance_window_request
(** Create a {!type-get_maintenance_window_request} type *)

val make_get_maintenance_window_execution_task_request :
  task_id:string -> window_execution_id:string -> unit
-> get_maintenance_window_execution_task_request
(** Create a {!type-get_maintenance_window_execution_task_request} type *)

val make_get_maintenance_window_execution_task_invocation_request :
  invocation_id:string ->
  task_id:string ->
  window_execution_id:string ->
  unit
-> get_maintenance_window_execution_task_invocation_request
(** Create a {!type-get_maintenance_window_execution_task_invocation_request} type *)

val make_get_maintenance_window_execution_request :
  window_execution_id:string -> unit
-> get_maintenance_window_execution_request
(** Create a {!type-get_maintenance_window_execution_request} type *)

val make_get_inventory_schema_request :
  ?sub_type:bool ->
  ?aggregator:bool ->
  ?max_results:int ->
  ?next_token:string ->
  ?type_name:string ->
  unit
-> get_inventory_schema_request
(** Create a {!type-get_inventory_schema_request} type *)

val make_get_inventory_request :
  ?max_results:int ->
  ?next_token:string ->
  ?result_attributes:result_attribute list ->
  ?aggregators:inventory_aggregator list ->
  ?filters:inventory_filter list ->
  unit
-> get_inventory_request
(** Create a {!type-get_inventory_request} type *)

val make_attachment_content :
  ?url:string ->
  ?hash_type:attachment_hash_type ->
  ?hash:string ->
  ?size:int ->
  ?name:string ->
  unit
-> attachment_content
(** Create a {!type-attachment_content} type *)

val make_get_document_request :
  ?document_format:document_format ->
  ?document_version:string ->
  ?version_name:string ->
  name:string ->
  unit
-> get_document_request
(** Create a {!type-get_document_request} type *)

val make_baseline_override :
  ?sources:patch_source list ->
  ?approved_patches_enable_non_security:bool ->
  ?rejected_patches_action:patch_action ->
  ?rejected_patches:string list ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?approved_patches:string list ->
  ?approval_rules:patch_rule_group ->
  ?global_filters:patch_filter_group ->
  ?operating_system:operating_system ->
  unit
-> baseline_override
(** Create a {!type-baseline_override} type *)

val make_get_deployable_patch_snapshot_for_instance_request :
  ?baseline_override:baseline_override ->
  snapshot_id:string ->
  instance_id:string ->
  unit
-> get_deployable_patch_snapshot_for_instance_request
(** Create a {!type-get_deployable_patch_snapshot_for_instance_request} type *)

val make_get_default_patch_baseline_request :
  ?operating_system:operating_system -> unit
-> get_default_patch_baseline_request
(** Create a {!type-get_default_patch_baseline_request} type *)

val make_get_connection_status_response :
  ?status:connection_status -> ?target:string -> unit
-> get_connection_status_response
(** Create a {!type-get_connection_status_response} type *)

val make_get_connection_status_request : target:string -> unit
-> get_connection_status_request
(** Create a {!type-get_connection_status_request} type *)

val make_get_command_invocation_request :
  ?plugin_name:string -> instance_id:string -> command_id:string -> unit
-> get_command_invocation_request
(** Create a {!type-get_command_invocation_request} type *)

val make_get_calendar_state_response :
  ?next_transition_time:string ->
  ?at_time:string ->
  ?state:calendar_state ->
  unit
-> get_calendar_state_response
(** Create a {!type-get_calendar_state_response} type *)

val make_get_calendar_state_request :
  ?at_time:string -> calendar_names:string list -> unit
-> get_calendar_state_request
(** Create a {!type-get_calendar_state_request} type *)

val make_automation_execution :
  ?variables:(string * string list) list ->
  ?change_request_name:string ->
  ?association_id:string ->
  ?ops_item_id:string ->
  ?runbooks:runbook list ->
  ?scheduled_time:float ->
  ?automation_subtype:automation_subtype ->
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?progress_counters:progress_counters ->
  ?target_locations:target_location list ->
  ?target:string ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?resolved_targets:resolved_targets ->
  ?target_maps:(string * string list) list list ->
  ?targets:target list ->
  ?target_parameter_name:string ->
  ?current_action:string ->
  ?current_step_name:string ->
  ?executed_by:string ->
  ?parent_automation_execution_id:string ->
  ?mode:execution_mode ->
  ?failure_message:string ->
  ?outputs:(string * string list) list ->
  ?parameters:(string * string list) list ->
  ?step_executions_truncated:bool ->
  ?step_executions:step_execution list ->
  ?automation_execution_status:automation_execution_status ->
  ?execution_end_time:float ->
  ?execution_start_time:float ->
  ?document_version:string ->
  ?document_name:string ->
  ?automation_execution_id:string ->
  unit
-> automation_execution
(** Create a {!type-automation_execution} type *)

val make_get_automation_execution_request :
  automation_execution_id:string -> unit
-> get_automation_execution_request
(** Create a {!type-get_automation_execution_request} type *)

val make_create_association_batch_request_entry :
  ?alarm_configuration:alarm_configuration ->
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?target_locations:target_location list ->
  ?calendar_names:string list ->
  ?apply_only_at_cron_interval:bool ->
  ?sync_compliance:association_sync_compliance ->
  ?compliance_severity:association_compliance_severity ->
  ?max_concurrency:string ->
  ?max_errors:string ->
  ?association_name:string ->
  ?output_location:instance_association_output_location ->
  ?schedule_expression:string ->
  ?targets:target list ->
  ?document_version:string ->
  ?automation_target_parameter_name:string ->
  ?parameters:(string * string list) list ->
  ?instance_id:string ->
  name:string ->
  unit
-> create_association_batch_request_entry
(** Create a {!type-create_association_batch_request_entry} type *)

val make_failed_create_association :
  ?fault:fault ->
  ?message:string ->
  ?entry:create_association_batch_request_entry ->
  unit
-> failed_create_association
(** Create a {!type-failed_create_association} type *)

val make_effective_patch : ?patch_status:patch_status -> ?patch:patch -> unit
-> effective_patch
(** Create a {!type-effective_patch} type *)

val make_disassociate_ops_item_related_item_response : unit
-> disassociate_ops_item_related_item_response
(** Create a {!type-disassociate_ops_item_related_item_response} type *)

val make_disassociate_ops_item_related_item_request :
  association_id:string -> ops_item_id:string -> unit
-> disassociate_ops_item_related_item_request
(** Create a {!type-disassociate_ops_item_related_item_request} type *)

val make_describe_sessions_response :
  ?next_token:string -> ?sessions:session list -> unit
-> describe_sessions_response
(** Create a {!type-describe_sessions_response} type *)

val make_describe_sessions_request :
  ?filters:session_filter list ->
  ?next_token:string ->
  ?max_results:int ->
  state:session_state ->
  unit
-> describe_sessions_request
(** Create a {!type-describe_sessions_request} type *)

val make_describe_patch_properties_request :
  ?next_token:string ->
  ?max_results:int ->
  ?patch_set:patch_set ->
  property:patch_property ->
  operating_system:operating_system ->
  unit
-> describe_patch_properties_request
(** Create a {!type-describe_patch_properties_request} type *)

val make_describe_patch_groups_request :
  ?next_token:string ->
  ?filters:patch_orchestrator_filter list ->
  ?max_results:int ->
  unit
-> describe_patch_groups_request
(** Create a {!type-describe_patch_groups_request} type *)

val make_describe_patch_group_state_request : patch_group:string -> unit
-> describe_patch_group_state_request
(** Create a {!type-describe_patch_group_state_request} type *)

val make_describe_patch_baselines_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:patch_orchestrator_filter list ->
  unit
-> describe_patch_baselines_request
(** Create a {!type-describe_patch_baselines_request} type *)

val make_describe_parameters_request :
  ?shared:bool ->
  ?next_token:string ->
  ?max_results:int ->
  ?parameter_filters:parameter_string_filter list ->
  ?filters:parameters_filter list ->
  unit
-> describe_parameters_request
(** Create a {!type-describe_parameters_request} type *)

val make_describe_ops_items_response :
  ?ops_item_summaries:ops_item_summary list -> ?next_token:string -> unit
-> describe_ops_items_response
(** Create a {!type-describe_ops_items_response} type *)

val make_describe_ops_items_request :
  ?next_token:string ->
  ?max_results:int ->
  ?ops_item_filters:ops_item_filter list ->
  unit
-> describe_ops_items_request
(** Create a {!type-describe_ops_items_request} type *)

val make_describe_maintenance_windows_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  unit
-> describe_maintenance_windows_request
(** Create a {!type-describe_maintenance_windows_request} type *)

val make_describe_maintenance_windows_for_target_request :
  ?next_token:string ->
  ?max_results:int ->
  resource_type:maintenance_window_resource_type ->
  targets:target list ->
  unit
-> describe_maintenance_windows_for_target_request
(** Create a {!type-describe_maintenance_windows_for_target_request} type *)

val make_describe_maintenance_window_tasks_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  window_id:string ->
  unit
-> describe_maintenance_window_tasks_request
(** Create a {!type-describe_maintenance_window_tasks_request} type *)

val make_describe_maintenance_window_targets_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  window_id:string ->
  unit
-> describe_maintenance_window_targets_request
(** Create a {!type-describe_maintenance_window_targets_request} type *)

val make_describe_maintenance_window_schedule_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:patch_orchestrator_filter list ->
  ?resource_type:maintenance_window_resource_type ->
  ?targets:target list ->
  ?window_id:string ->
  unit
-> describe_maintenance_window_schedule_request
(** Create a {!type-describe_maintenance_window_schedule_request} type *)

val make_describe_maintenance_window_executions_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  window_id:string ->
  unit
-> describe_maintenance_window_executions_request
(** Create a {!type-describe_maintenance_window_executions_request} type *)

val make_describe_maintenance_window_execution_tasks_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  window_execution_id:string ->
  unit
-> describe_maintenance_window_execution_tasks_request
(** Create a {!type-describe_maintenance_window_execution_tasks_request} type *)

val make_describe_maintenance_window_execution_task_invocations_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:maintenance_window_filter list ->
  task_id:string ->
  window_execution_id:string ->
  unit
-> describe_maintenance_window_execution_task_invocations_request
(** Create a {!type-describe_maintenance_window_execution_task_invocations_request} type *)

val make_describe_inventory_deletions_request :
  ?max_results:int -> ?next_token:string -> ?deletion_id:string -> unit
-> describe_inventory_deletions_request
(** Create a {!type-describe_inventory_deletions_request} type *)

val make_describe_instance_properties_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters_with_operator:instance_property_string_filter list ->
  ?instance_property_filter_list:instance_property_filter list ->
  unit
-> describe_instance_properties_request
(** Create a {!type-describe_instance_properties_request} type *)

val make_describe_instance_patches_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:patch_orchestrator_filter list ->
  instance_id:string ->
  unit
-> describe_instance_patches_request
(** Create a {!type-describe_instance_patches_request} type *)

val make_describe_instance_patch_states_request :
  ?max_results:int -> ?next_token:string -> instance_ids:string list -> unit
-> describe_instance_patch_states_request
(** Create a {!type-describe_instance_patch_states_request} type *)

val make_describe_instance_patch_states_for_patch_group_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:instance_patch_state_filter list ->
  patch_group:string ->
  unit
-> describe_instance_patch_states_for_patch_group_request
(** Create a {!type-describe_instance_patch_states_for_patch_group_request} type *)

val make_describe_instance_information_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:instance_information_string_filter list ->
  ?instance_information_filter_list:instance_information_filter list ->
  unit
-> describe_instance_information_request
(** Create a {!type-describe_instance_information_request} type *)

val make_describe_instance_associations_status_request :
  ?next_token:string -> ?max_results:int -> instance_id:string -> unit
-> describe_instance_associations_status_request
(** Create a {!type-describe_instance_associations_status_request} type *)

val make_describe_effective_patches_for_patch_baseline_request :
  ?next_token:string -> ?max_results:int -> baseline_id:string -> unit
-> describe_effective_patches_for_patch_baseline_request
(** Create a {!type-describe_effective_patches_for_patch_baseline_request} type *)

val make_describe_effective_instance_associations_request :
  ?next_token:string -> ?max_results:int -> instance_id:string -> unit
-> describe_effective_instance_associations_request
(** Create a {!type-describe_effective_instance_associations_request} type *)

val make_describe_document_request :
  ?version_name:string -> ?document_version:string -> name:string -> unit
-> describe_document_request
(** Create a {!type-describe_document_request} type *)

val make_account_sharing_info :
  ?shared_document_version:string -> ?account_id:string -> unit
-> account_sharing_info
(** Create a {!type-account_sharing_info} type *)

val make_describe_document_permission_response :
  ?next_token:string ->
  ?account_sharing_info_list:account_sharing_info list ->
  ?account_ids:string list ->
  unit
-> describe_document_permission_response
(** Create a {!type-describe_document_permission_response} type *)

val make_describe_document_permission_request :
  ?next_token:string ->
  ?max_results:int ->
  permission_type:document_permission_type ->
  name:string ->
  unit
-> describe_document_permission_request
(** Create a {!type-describe_document_permission_request} type *)

val make_describe_available_patches_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:patch_orchestrator_filter list ->
  unit
-> describe_available_patches_request
(** Create a {!type-describe_available_patches_request} type *)

val make_describe_automation_step_executions_request :
  ?reverse_order:bool ->
  ?max_results:int ->
  ?next_token:string ->
  ?filters:step_execution_filter list ->
  automation_execution_id:string ->
  unit
-> describe_automation_step_executions_request
(** Create a {!type-describe_automation_step_executions_request} type *)

val make_automation_execution_metadata :
  ?change_request_name:string ->
  ?association_id:string ->
  ?ops_item_id:string ->
  ?runbooks:runbook list ->
  ?scheduled_time:float ->
  ?automation_subtype:automation_subtype ->
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?automation_type:automation_type ->
  ?target:string ->
  ?max_errors:string ->
  ?max_concurrency:string ->
  ?resolved_targets:resolved_targets ->
  ?target_maps:(string * string list) list list ->
  ?targets:target list ->
  ?target_parameter_name:string ->
  ?failure_message:string ->
  ?current_action:string ->
  ?current_step_name:string ->
  ?parent_automation_execution_id:string ->
  ?mode:execution_mode ->
  ?outputs:(string * string list) list ->
  ?log_file:string ->
  ?executed_by:string ->
  ?execution_end_time:float ->
  ?execution_start_time:float ->
  ?automation_execution_status:automation_execution_status ->
  ?document_version:string ->
  ?document_name:string ->
  ?automation_execution_id:string ->
  unit
-> automation_execution_metadata
(** Create a {!type-automation_execution_metadata} type *)

val make_automation_execution_filter :
  values:string list -> key:automation_execution_filter_key -> unit
-> automation_execution_filter
(** Create a {!type-automation_execution_filter} type *)

val make_describe_automation_executions_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:automation_execution_filter list ->
  unit
-> describe_automation_executions_request
(** Create a {!type-describe_automation_executions_request} type *)

val make_describe_association_request :
  ?association_version:string ->
  ?association_id:string ->
  ?instance_id:string ->
  ?name:string ->
  unit
-> describe_association_request
(** Create a {!type-describe_association_request} type *)

val make_association_execution :
  ?triggered_alarms:alarm_state_information list ->
  ?alarm_configuration:alarm_configuration ->
  ?resource_count_by_status:string ->
  ?last_execution_date:float ->
  ?created_time:float ->
  ?detailed_status:string ->
  ?status:string ->
  ?execution_id:string ->
  ?association_version:string ->
  ?association_id:string ->
  unit
-> association_execution
(** Create a {!type-association_execution} type *)

val make_association_execution_filter :
  type_:association_filter_operator_type ->
  value:string ->
  key:association_execution_filter_key ->
  unit
-> association_execution_filter
(** Create a {!type-association_execution_filter} type *)

val make_describe_association_executions_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:association_execution_filter list ->
  association_id:string ->
  unit
-> describe_association_executions_request
(** Create a {!type-describe_association_executions_request} type *)

val make_association_execution_target :
  ?output_source:output_source ->
  ?last_execution_date:float ->
  ?detailed_status:string ->
  ?status:string ->
  ?resource_type:string ->
  ?resource_id:string ->
  ?execution_id:string ->
  ?association_version:string ->
  ?association_id:string ->
  unit
-> association_execution_target
(** Create a {!type-association_execution_target} type *)

val make_association_execution_targets_filter :
  value:string -> key:association_execution_targets_filter_key -> unit
-> association_execution_targets_filter
(** Create a {!type-association_execution_targets_filter} type *)

val make_describe_association_execution_targets_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:association_execution_targets_filter list ->
  execution_id:string ->
  association_id:string ->
  unit
-> describe_association_execution_targets_request
(** Create a {!type-describe_association_execution_targets_request} type *)

val make_activation :
  ?tags:tag list ->
  ?created_date:float ->
  ?expired:bool ->
  ?expiration_date:float ->
  ?registrations_count:int ->
  ?registration_limit:int ->
  ?iam_role:string ->
  ?default_instance_name:string ->
  ?description:string ->
  ?activation_id:string ->
  unit
-> activation
(** Create a {!type-activation} type *)

val make_describe_activations_filter :
  ?filter_values:string list ->
  ?filter_key:describe_activations_filter_keys ->
  unit
-> describe_activations_filter
(** Create a {!type-describe_activations_filter} type *)

val make_describe_activations_request :
  ?next_token:string ->
  ?max_results:int ->
  ?filters:describe_activations_filter list ->
  unit
-> describe_activations_request
(** Create a {!type-describe_activations_request} type *)

val make_deregister_task_from_maintenance_window_request :
  window_task_id:string -> window_id:string -> unit
-> deregister_task_from_maintenance_window_request
(** Create a {!type-deregister_task_from_maintenance_window_request} type *)

val make_deregister_target_from_maintenance_window_request :
  ?safe:bool -> window_target_id:string -> window_id:string -> unit
-> deregister_target_from_maintenance_window_request
(** Create a {!type-deregister_target_from_maintenance_window_request} type *)

val make_deregister_patch_baseline_for_patch_group_request :
  patch_group:string -> baseline_id:string -> unit
-> deregister_patch_baseline_for_patch_group_request
(** Create a {!type-deregister_patch_baseline_for_patch_group_request} type *)

val make_deregister_managed_instance_request : instance_id:string -> unit
-> deregister_managed_instance_request
(** Create a {!type-deregister_managed_instance_request} type *)

val make_delete_resource_policy_response : unit
-> delete_resource_policy_response
(** Create a {!type-delete_resource_policy_response} type *)

val make_delete_resource_policy_request :
  policy_hash:string -> policy_id:string -> resource_arn:string -> unit
-> delete_resource_policy_request
(** Create a {!type-delete_resource_policy_request} type *)

val make_delete_resource_data_sync_request :
  ?sync_type:string -> sync_name:string -> unit
-> delete_resource_data_sync_request
(** Create a {!type-delete_resource_data_sync_request} type *)

val make_delete_patch_baseline_request : baseline_id:string -> unit
-> delete_patch_baseline_request
(** Create a {!type-delete_patch_baseline_request} type *)

val make_delete_parameters_request : names:string list -> unit
-> delete_parameters_request
(** Create a {!type-delete_parameters_request} type *)

val make_delete_parameter_request : name:string -> unit
-> delete_parameter_request
(** Create a {!type-delete_parameter_request} type *)

val make_delete_ops_metadata_request : ops_metadata_arn:string -> unit
-> delete_ops_metadata_request
(** Create a {!type-delete_ops_metadata_request} type *)

val make_delete_ops_item_response : unit
-> delete_ops_item_response
(** Create a {!type-delete_ops_item_response} type *)

val make_delete_ops_item_request : ops_item_id:string -> unit
-> delete_ops_item_request
(** Create a {!type-delete_ops_item_request} type *)

val make_delete_maintenance_window_request : window_id:string -> unit
-> delete_maintenance_window_request
(** Create a {!type-delete_maintenance_window_request} type *)

val make_delete_inventory_request :
  ?client_token:string ->
  ?dry_run:bool ->
  ?schema_delete_option:inventory_schema_delete_option ->
  type_name:string ->
  unit
-> delete_inventory_request
(** Create a {!type-delete_inventory_request} type *)

val make_delete_document_request :
  ?force:bool ->
  ?version_name:string ->
  ?document_version:string ->
  name:string ->
  unit
-> delete_document_request
(** Create a {!type-delete_document_request} type *)

val make_delete_association_request :
  ?association_id:string -> ?instance_id:string -> ?name:string -> unit
-> delete_association_request
(** Create a {!type-delete_association_request} type *)

val make_delete_activation_request : activation_id:string -> unit
-> delete_activation_request
(** Create a {!type-delete_activation_request} type *)

val make_create_resource_data_sync_request :
  ?sync_source:resource_data_sync_source ->
  ?sync_type:string ->
  ?s3_destination:resource_data_sync_s3_destination ->
  sync_name:string ->
  unit
-> create_resource_data_sync_request
(** Create a {!type-create_resource_data_sync_request} type *)

val make_create_patch_baseline_request :
  ?tags:tag list ->
  ?client_token:string ->
  ?sources:patch_source list ->
  ?description:string ->
  ?rejected_patches_action:patch_action ->
  ?rejected_patches:string list ->
  ?approved_patches_enable_non_security:bool ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?approved_patches:string list ->
  ?approval_rules:patch_rule_group ->
  ?global_filters:patch_filter_group ->
  ?operating_system:operating_system ->
  name:string ->
  unit
-> create_patch_baseline_request
(** Create a {!type-create_patch_baseline_request} type *)

val make_create_ops_metadata_request :
  ?tags:tag list ->
  ?metadata:(string * metadata_value) list ->
  resource_id:string ->
  unit
-> create_ops_metadata_request
(** Create a {!type-create_ops_metadata_request} type *)

val make_create_ops_item_response :
  ?ops_item_arn:string -> ?ops_item_id:string -> unit
-> create_ops_item_response
(** Create a {!type-create_ops_item_response} type *)

val make_create_ops_item_request :
  ?account_id:string ->
  ?planned_end_time:float ->
  ?planned_start_time:float ->
  ?actual_end_time:float ->
  ?actual_start_time:float ->
  ?severity:string ->
  ?category:string ->
  ?tags:tag list ->
  ?related_ops_items:related_ops_item list ->
  ?priority:int ->
  ?notifications:ops_item_notification list ->
  ?operational_data:(string * ops_item_data_value) list ->
  ?ops_item_type:string ->
  title:string ->
  source:string ->
  description:string ->
  unit
-> create_ops_item_request
(** Create a {!type-create_ops_item_request} type *)

val make_create_maintenance_window_request :
  ?tags:tag list ->
  ?client_token:string ->
  ?schedule_offset:int ->
  ?schedule_timezone:string ->
  ?end_date:string ->
  ?start_date:string ->
  ?description:string ->
  allow_unassociated_targets:bool ->
  cutoff:int ->
  duration:int ->
  schedule:string ->
  name:string ->
  unit
-> create_maintenance_window_request
(** Create a {!type-create_maintenance_window_request} type *)

val make_create_document_request :
  ?tags:tag list ->
  ?target_type:string ->
  ?document_format:document_format ->
  ?document_type:document_type ->
  ?version_name:string ->
  ?display_name:string ->
  ?attachments:attachments_source list ->
  ?requires:document_requires list ->
  name:string ->
  content:string ->
  unit
-> create_document_request
(** Create a {!type-create_document_request} type *)

val make_create_association_request :
  ?alarm_configuration:alarm_configuration ->
  ?tags:tag list ->
  ?target_maps:(string * string list) list list ->
  ?duration:int ->
  ?schedule_offset:int ->
  ?target_locations:target_location list ->
  ?calendar_names:string list ->
  ?apply_only_at_cron_interval:bool ->
  ?sync_compliance:association_sync_compliance ->
  ?compliance_severity:association_compliance_severity ->
  ?max_concurrency:string ->
  ?max_errors:string ->
  ?automation_target_parameter_name:string ->
  ?association_name:string ->
  ?output_location:instance_association_output_location ->
  ?schedule_expression:string ->
  ?targets:target list ->
  ?parameters:(string * string list) list ->
  ?instance_id:string ->
  ?document_version:string ->
  name:string ->
  unit
-> create_association_request
(** Create a {!type-create_association_request} type *)

val make_create_association_batch_request :
  entries:create_association_batch_request_entry list -> unit
-> create_association_batch_request
(** Create a {!type-create_association_batch_request} type *)

val make_create_activation_request :
  ?registration_metadata:registration_metadata_item list ->
  ?tags:tag list ->
  ?expiration_date:float ->
  ?registration_limit:int ->
  ?default_instance_name:string ->
  ?description:string ->
  iam_role:string ->
  unit
-> create_activation_request
(** Create a {!type-create_activation_request} type *)

val make_cancel_maintenance_window_execution_request :
  window_execution_id:string -> unit
-> cancel_maintenance_window_execution_request
(** Create a {!type-cancel_maintenance_window_execution_request} type *)

val make_cancel_command_request :
  ?instance_ids:string list -> command_id:string -> unit
-> cancel_command_request
(** Create a {!type-cancel_command_request} type *)

val make_associate_ops_item_related_item_response :
  ?association_id:string -> unit
-> associate_ops_item_related_item_response
(** Create a {!type-associate_ops_item_related_item_response} type *)

val make_associate_ops_item_related_item_request :
  resource_uri:string ->
  resource_type:string ->
  association_type:string ->
  ops_item_id:string ->
  unit
-> associate_ops_item_related_item_request
(** Create a {!type-associate_ops_item_related_item_request} type *)

val make_add_tags_to_resource_request :
  tags:tag list ->
  resource_id:string ->
  resource_type:resource_type_for_tagging ->
  unit
-> add_tags_to_resource_request
(** Create a {!type-add_tags_to_resource_request} type *)

(** {1:operations Operations} *)

module AddTagsToResource : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_resource_request ->
        (add_tags_to_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            | `InvalidResourceType of invalid_resource_type
            | `TooManyTagsError of too_many_tags_error
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Adds or overwrites one or more tags for the specified resource. {i Tags} are metadata that you can assign to your automations, documents, managed nodes, maintenance windows, Parameter Store parameters, and patch baselines. Tags enable you to categorize your resources in different ways, for example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both of which you define. For example, you could define a set of tags for your account's managed nodes that helps you track each node's owner and stack level. For example:
    
     {ul
          {- [Key=Owner,Value=DbAdmin]
             
             }
           {- [Key=Owner,Value=SysAdmin]
              
              }
           {- [Key=Owner,Value=Dev]
              
              }
           {- [Key=Stack,Value=Production]
              
              }
           {- [Key=Stack,Value=Pre-Production]
              
              }
           {- [Key=Stack,Value=Test]
              
              }
          
      }
       Most resources can have a maximum of 50 tags. Automations can have a maximum of 5 tags.
       
        We recommend that you devise a set of tag keys that meets your needs for each resource type. Using a consistent set of tag keys makes it easier for you to manage your resources. You can search and filter the resources based on the tags you add. Tags don't have any semantic meaning to and are interpreted strictly as a string of characters.
        
         For more information about using tags with Amazon Elastic Compute Cloud (Amazon EC2) instances, see {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html}Tag your Amazon EC2 resources} in the {i Amazon EC2 User Guide}.
          *)

  
end

module AssociateOpsItemRelatedItem : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_ops_item_related_item_request ->
        (associate_ops_item_related_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemConflictException of ops_item_conflict_exception
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
            | `OpsItemNotFoundException of ops_item_not_found_exception
            | `OpsItemRelatedItemAlreadyExistsException of ops_item_related_item_already_exists_exception
            
        ]
      ) result
  (** 
    Associates a related item to a Systems Manager OpsCenter OpsItem. For example, you can associate an Incident Manager incident or analysis with an OpsItem. Incident Manager and OpsCenter are capabilities of Amazon Web Services Systems Manager.
     *)

  
end

module CancelCommand : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_command_request ->
        (cancel_command_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateInstanceId of duplicate_instance_id
            | `InternalServerError of internal_server_error
            | `InvalidCommandId of invalid_command_id
            | `InvalidInstanceId of invalid_instance_id
            
        ]
      ) result
  (** 
    Attempts to cancel the command specified by the Command ID. There is no guarantee that the command will be terminated and the underlying process stopped.
     *)

  
end

module CancelMaintenanceWindowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_maintenance_window_execution_request ->
        (cancel_maintenance_window_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Stops a maintenance window execution that is already in progress and cancels any tasks in the window that haven't already starting running. Tasks already in progress will continue to completion.
     *)

  
end

module CreateActivation : sig
  val request :
    Smaws_Lib.Context.t ->
      create_activation_request ->
        (create_activation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidParameters of invalid_parameters
            
        ]
      ) result
  (** 
    Generates an activation code and activation ID you can use to register your on-premises servers, edge devices, or virtual machine (VM) with Amazon Web Services Systems Manager. Registering these machines with Systems Manager makes it possible to manage them using Systems Manager capabilities. You use the activation code and ID when installing SSM Agent on machines in your hybrid environment. For more information about requirements for managing on-premises machines using Systems Manager, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-managedinstances.html}Setting up Amazon Web Services Systems Manager for hybrid and multicloud environments} in the {i Amazon Web Services Systems Manager User Guide}.
    
     Amazon Elastic Compute Cloud (Amazon EC2) instances, edge devices, and on-premises servers and VMs that are configured for Systems Manager are all called {i managed nodes}.
     
      *)

  
end

module CreateAssociation : sig
  val request :
    Smaws_Lib.Context.t ->
      create_association_request ->
        (create_association_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationAlreadyExists of association_already_exists
            | `AssociationLimitExceeded of association_limit_exceeded
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidOutputLocation of invalid_output_location
            | `InvalidParameters of invalid_parameters
            | `InvalidSchedule of invalid_schedule
            | `InvalidTag of invalid_tag
            | `InvalidTarget of invalid_target
            | `InvalidTargetMaps of invalid_target_maps
            | `UnsupportedPlatformType of unsupported_platform_type
            
        ]
      ) result
  (** 
    A State Manager association defines the state that you want to maintain on your managed nodes. For example, an association can specify that anti-virus software must be installed and running on your managed nodes, or that certain ports must be closed. For static targets, the association specifies a schedule for when the configuration is reapplied. For dynamic targets, such as an Amazon Web Services resource group or an Amazon Web Services autoscaling group, State Manager, a capability of Amazon Web Services Systems Manager applies the configuration when new managed nodes are added to the group. The association also specifies actions to take when applying the configuration. For example, an association for anti-virus software might run once a day. If the software isn't installed, then State Manager installs it. If the software is installed, but the service isn't running, then the association might instruct State Manager to start the service.
     *)

  
end

module CreateAssociationBatch : sig
  val request :
    Smaws_Lib.Context.t ->
      create_association_batch_request ->
        (create_association_batch_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationLimitExceeded of association_limit_exceeded
            | `DuplicateInstanceId of duplicate_instance_id
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidOutputLocation of invalid_output_location
            | `InvalidParameters of invalid_parameters
            | `InvalidSchedule of invalid_schedule
            | `InvalidTarget of invalid_target
            | `InvalidTargetMaps of invalid_target_maps
            | `UnsupportedPlatformType of unsupported_platform_type
            
        ]
      ) result
  (** 
    Associates the specified Amazon Web Services Systems Manager document (SSM document) with the specified managed nodes or targets.
    
     When you associate a document with one or more managed nodes using IDs or tags, Amazon Web Services Systems Manager Agent (SSM Agent) running on the managed node processes the document and configures the node as specified.
     
      If you associate a document with a managed node that already has an associated document, the system returns the AssociationAlreadyExists exception.
       *)

  
end

module CreateDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      create_document_request ->
        (create_document_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DocumentAlreadyExists of document_already_exists
            | `DocumentLimitExceeded of document_limit_exceeded
            | `InternalServerError of internal_server_error
            | `InvalidDocumentContent of invalid_document_content
            | `InvalidDocumentSchemaVersion of invalid_document_schema_version
            | `MaxDocumentSizeExceeded of max_document_size_exceeded
            
        ]
      ) result
  (** 
    Creates a Amazon Web Services Systems Manager (SSM document). An SSM document defines the actions that Systems Manager performs on your managed nodes. For more information about SSM documents, including information about supported schemas, features, and syntax, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-ssm-docs.html}Amazon Web Services Systems Manager Documents} in the {i Amazon Web Services Systems Manager User Guide}.
     *)

  
end

module CreateMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      create_maintenance_window_request ->
        (create_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `ResourceLimitExceededException of resource_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a new maintenance window.
    
     The value you specify for [Duration] determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for [Cutoff]. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for [Cutoff] is one hour, no maintenance window tasks can start after 5 PM.
     
      *)

  
end

module CreateOpsItem : sig
  val request :
    Smaws_Lib.Context.t ->
      create_ops_item_request ->
        (create_ops_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemAccessDeniedException of ops_item_access_denied_exception
            | `OpsItemAlreadyExistsException of ops_item_already_exists_exception
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a new OpsItem. You must have permission in Identity and Access Management (IAM) to create a new OpsItem. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
    
     Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  
end

module CreateOpsMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      create_ops_metadata_request ->
        (create_ops_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsMetadataAlreadyExistsException of ops_metadata_already_exists_exception
            | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
            | `OpsMetadataLimitExceededException of ops_metadata_limit_exceeded_exception
            | `OpsMetadataTooManyUpdatesException of ops_metadata_too_many_updates_exception
            
        ]
      ) result
  (** 
    If you create a new application in Application Manager, Amazon Web Services Systems Manager calls this API operation to specify information about the new application, including the application type.
     *)

  
end

module CreatePatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      create_patch_baseline_request ->
        (create_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `ResourceLimitExceededException of resource_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Creates a patch baseline.
    
     For information about valid key-value pairs in [PatchFilters] for each supported operating system type, see [PatchFilter].
     
      *)

  
end

module CreateResourceDataSync : sig
  val request :
    Smaws_Lib.Context.t ->
      create_resource_data_sync_request ->
        (create_resource_data_sync_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceDataSyncAlreadyExistsException of resource_data_sync_already_exists_exception
            | `ResourceDataSyncCountExceededException of resource_data_sync_count_exceeded_exception
            | `ResourceDataSyncInvalidConfigurationException of resource_data_sync_invalid_configuration_exception
            
        ]
      ) result
  (** 
    A resource data sync helps you view data from multiple sources in a single location. Amazon Web Services Systems Manager offers two types of resource data sync: [SyncToDestination] and [SyncFromSource].
    
     You can configure Systems Manager Inventory to use the [SyncToDestination] type to synchronize Inventory data from multiple Amazon Web Services Regions to a single Amazon Simple Storage Service (Amazon S3) bucket. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-inventory-datasync.html}Configuring resource data sync for Inventory} in the {i Amazon Web Services Systems Manager User Guide}.
     
      You can configure Systems Manager Explorer to use the [SyncFromSource] type to synchronize operational work items (OpsItems) and operational data (OpsData) from multiple Amazon Web Services Regions to a single Amazon S3 bucket. This type can synchronize OpsItems and OpsData from multiple Amazon Web Services accounts and Amazon Web Services Regions or [EntireOrganization] by using Organizations. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html}Setting up Systems Manager Explorer to display data from multiple accounts and Regions} in the {i Amazon Web Services Systems Manager User Guide}.
      
       A resource data sync is an asynchronous operation that returns immediately. After a successful initial sync is completed, the system continuously syncs data. To check the status of a sync, use the [ListResourceDataSync].
       
        By default, data isn't encrypted in Amazon S3. We strongly recommend that you enable encryption in Amazon S3 to ensure secure data storage. We also recommend that you secure access to the Amazon S3 bucket by creating a restrictive bucket policy.
        
         *)

  
end

module DeleteActivation : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activation_request ->
        (delete_activation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidActivation of invalid_activation
            | `InvalidActivationId of invalid_activation_id
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Deletes an activation. You aren't required to delete an activation. If you delete an activation, you can no longer use it to register additional managed nodes. Deleting an activation doesn't de-register managed nodes. You must manually de-register managed nodes.
     *)

  
end

module DeleteAssociation : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_association_request ->
        (delete_association_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidInstanceId of invalid_instance_id
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Disassociates the specified Amazon Web Services Systems Manager document (SSM document) from the specified managed node. If you created the association by using the [Targets] parameter, then you must delete the association by using the association ID.
    
     When you disassociate a document from a managed node, it doesn't change the configuration of the node. To change the configuration state of a managed node after you disassociate a document, you must create a new document with the desired configuration and associate it with the node.
      *)

  
end

module DeleteDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_document_request ->
        (delete_document_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociatedInstances of associated_instances
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentOperation of invalid_document_operation
            
        ]
      ) result
  (** 
    Deletes the Amazon Web Services Systems Manager document (SSM document) and all managed node associations to the document.
    
     Before you delete the document, we recommend that you use [DeleteAssociation] to disassociate all managed nodes that are associated with the document.
      *)

  
end

module DeleteInventory : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_inventory_request ->
        (delete_inventory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDeleteInventoryParametersException of invalid_delete_inventory_parameters_exception
            | `InvalidInventoryRequestException of invalid_inventory_request_exception
            | `InvalidOptionException of invalid_option_exception
            | `InvalidTypeNameException of invalid_type_name_exception
            
        ]
      ) result
  (** 
    Delete a custom inventory type or the data associated with a custom Inventory type. Deleting a custom inventory type is also referred to as deleting a custom inventory schema.
     *)

  
end

module DeleteMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_maintenance_window_request ->
        (delete_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Deletes a maintenance window.
     *)

  
end

module DeleteOpsItem : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ops_item_request ->
        (delete_ops_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            
        ]
      ) result
  (** 
    Delete an OpsItem. You must have permission in Identity and Access Management (IAM) to delete an OpsItem.
    
     Note the following important information about this operation.
     
      {ul
           {- Deleting an OpsItem is irreversible. You can't restore a deleted OpsItem.
              
              }
            {- This operation uses an {i eventual consistency model}, which means the system can take a few minutes to complete this operation. If you delete an OpsItem and immediately call, for example, [GetOpsItem], the deleted OpsItem might still appear in the response.
               
               }
            {- This operation is idempotent. The system doesn't throw an exception if you repeatedly call this operation for the same OpsItem. If the first call is successful, all additional calls return the same successful response as the first call.
               
               }
            {- This operation doesn't support cross-account calls. A delegated administrator or management account can't delete OpsItems in other accounts, even if OpsCenter has been set up for cross-account administration. For more information about cross-account administration, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setting-up-cross-account.html}Setting up OpsCenter to centrally manage OpsItems across accounts} in the {i Systems Manager User Guide}.
               
               }
           
      }
       *)

  
end

module DeleteOpsMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ops_metadata_request ->
        (delete_ops_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
            | `OpsMetadataNotFoundException of ops_metadata_not_found_exception
            
        ]
      ) result
  (** 
    Delete OpsMetadata related to an application.
     *)

  
end

module DeleteParameter : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_parameter_request ->
        (delete_parameter_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ParameterNotFound of parameter_not_found
            
        ]
      ) result
  (** 
    Delete a parameter from the system. After deleting a parameter, wait for at least 30 seconds to create a parameter with the same name.
     *)

  
end

module DeleteParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_parameters_request ->
        (delete_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Delete a list of parameters. After deleting a parameter, wait for at least 30 seconds to create a parameter with the same name.
     *)

  
end

module DeletePatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_patch_baseline_request ->
        (delete_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceInUseException of resource_in_use_exception
            
        ]
      ) result
  (** 
    Deletes a patch baseline.
     *)

  
end

module DeleteResourceDataSync : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_data_sync_request ->
        (delete_resource_data_sync_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceDataSyncInvalidConfigurationException of resource_data_sync_invalid_configuration_exception
            | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
            
        ]
      ) result
  (** 
    Deletes a resource data sync configuration. After the configuration is deleted, changes to data on managed nodes are no longer synced to or from the target. Deleting a sync configuration doesn't delete data.
     *)

  
end

module DeleteResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_request ->
        (delete_resource_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `MalformedResourcePolicyDocumentException of malformed_resource_policy_document_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyConflictException of resource_policy_conflict_exception
            | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
            | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
            
        ]
      ) result
  (** 
    Deletes a Systems Manager resource policy. A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. The following resources support Systems Manager resource policies.
    
     {ul
          {- [OpsItemGroup] - The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).
             
             }
           {- [Parameter] - The resource policy is used to share a parameter with other accounts using Resource Access Manager (RAM). For more information about cross-account sharing of parameters, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html}Working with shared parameters} in the {i Amazon Web Services Systems Manager User Guide}.
              
              }
          
      }
       *)

  
end

module DeregisterManagedInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_managed_instance_request ->
        (deregister_managed_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidInstanceId of invalid_instance_id
            
        ]
      ) result
  (** 
    Removes the server or virtual machine from the list of registered servers. You can reregister the node again at any time. If you don't plan to use Run Command on the server, we suggest uninstalling SSM Agent first.
     *)

  
end

module DeregisterPatchBaselineForPatchGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_patch_baseline_for_patch_group_request ->
        (deregister_patch_baseline_for_patch_group_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            
        ]
      ) result
  (** 
    Removes a patch group from a patch baseline.
     *)

  
end

module DeregisterTargetFromMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_target_from_maintenance_window_request ->
        (deregister_target_from_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            | `TargetInUseException of target_in_use_exception
            
        ]
      ) result
  (** 
    Removes a target from a maintenance window.
     *)

  
end

module DeregisterTaskFromMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_task_from_maintenance_window_request ->
        (deregister_task_from_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Removes a task from a maintenance window.
     *)

  
end

module DescribeActivations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activations_request ->
        (describe_activations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Describes details about the activation, such as the date and time the activation was created, its expiration date, the Identity and Access Management (IAM) role assigned to the managed nodes in the activation, and the number of nodes registered by using this activation.
     *)

  
end

module DescribeAssociation : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_association_request ->
        (describe_association_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidAssociationVersion of invalid_association_version
            | `InvalidDocument of invalid_document
            | `InvalidInstanceId of invalid_instance_id
            
        ]
      ) result
  (** 
    Describes the association for the specified target or managed node. If you created the association by using the [Targets] parameter, then you must retrieve the association by using the association ID.
     *)

  
end

module DescribeAssociationExecutionTargets : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_association_execution_targets_request ->
        (describe_association_execution_targets_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `AssociationExecutionDoesNotExist of association_execution_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Views information about a specific execution of a specific association.
     *)

  
end

module DescribeAssociationExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_association_executions_request ->
        (describe_association_executions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Views all executions for a specific association ID.
     *)

  
end

module DescribeAutomationExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_automation_executions_request ->
        (describe_automation_executions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidFilterValue of invalid_filter_value
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Provides details about all active and terminated Automation executions.
     *)

  
end

module DescribeAutomationStepExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_automation_step_executions_request ->
        (describe_automation_step_executions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidFilterValue of invalid_filter_value
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Information about all active and terminated step executions in an Automation workflow.
     *)

  
end

module DescribeAvailablePatches : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_available_patches_request ->
        (describe_available_patches_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists all patches eligible to be included in a patch baseline.
    
     Currently, [DescribeAvailablePatches] supports only the Amazon Linux 1, Amazon Linux 2, and Windows Server operating systems.
     
      *)

  
end

module DescribeDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_document_request ->
        (describe_document_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            
        ]
      ) result
  (** 
    Describes the specified Amazon Web Services Systems Manager document (SSM document).
     *)

  
end

module DescribeDocumentPermission : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_document_permission_request ->
        (describe_document_permission_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentOperation of invalid_document_operation
            | `InvalidNextToken of invalid_next_token
            | `InvalidPermissionType of invalid_permission_type
            
        ]
      ) result
  (** 
    Describes the permissions for a Amazon Web Services Systems Manager document (SSM document). If you created the document, you are the owner. If a document is shared, it can either be shared privately (by specifying a user's Amazon Web Services account ID) or publicly ({i All}).
     *)

  
end

module DescribeEffectiveInstanceAssociations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_effective_instance_associations_request ->
        (describe_effective_instance_associations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    All associations for the managed nodes.
     *)

  
end

module DescribeEffectivePatchesForPatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_effective_patches_for_patch_baseline_request ->
        (describe_effective_patches_for_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            | `UnsupportedOperatingSystem of unsupported_operating_system
            
        ]
      ) result
  (** 
    Retrieves the current effective patches (the patch and the approval state) for the specified patch baseline. Applies to patch baselines for Windows only.
     *)

  
end

module DescribeInstanceAssociationsStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_associations_status_request ->
        (describe_instance_associations_status_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    The status of the associations for the managed nodes.
     *)

  
end

module DescribeInstanceInformation : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_information_request ->
        (describe_instance_information_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidInstanceInformationFilterValue of invalid_instance_information_filter_value
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Provides information about one or more of your managed nodes, including the operating system platform, SSM Agent version, association status, and IP address. This operation does not return information for nodes that are either Stopped or Terminated.
    
     If you specify one or more node IDs, the operation returns information for those managed nodes. If you don't specify node IDs, it returns information for all your managed nodes. If you specify a node ID that isn't valid or a node that you don't own, you receive an error.
     
      The [IamRole] field returned for this API operation is the Identity and Access Management (IAM) role assigned to on-premises managed nodes. This operation does not return the IAM role for EC2 instances.
      
       *)

  
end

module DescribeInstancePatchStates : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_patch_states_request ->
        (describe_instance_patch_states_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieves the high-level patch state of one or more managed nodes.
     *)

  
end

module DescribeInstancePatchStatesForPatchGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_patch_states_for_patch_group_request ->
        (describe_instance_patch_states_for_patch_group_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieves the high-level patch state for the managed nodes in the specified patch group.
     *)

  
end

module DescribeInstancePatches : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_patches_request ->
        (describe_instance_patches_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieves information about the patches on the specified managed node and their state relative to the patch baseline being used for the node.
     *)

  
end

module DescribeInstanceProperties : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_instance_properties_request ->
        (describe_instance_properties_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidActivationId of invalid_activation_id
            | `InvalidDocument of invalid_document
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidInstancePropertyFilterValue of invalid_instance_property_filter_value
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    An API operation used by the Systems Manager console to display information about Systems Manager managed nodes.
     *)

  
end

module DescribeInventoryDeletions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_inventory_deletions_request ->
        (describe_inventory_deletions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDeletionIdException of invalid_deletion_id_exception
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Describes a specific delete inventory operation.
     *)

  
end

module DescribeMaintenanceWindowExecutionTaskInvocations : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_execution_task_invocations_request ->
        (describe_maintenance_window_execution_task_invocations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the individual task executions (one per target) for a particular task run as part of a maintenance window execution.
     *)

  
end

module DescribeMaintenanceWindowExecutionTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_execution_tasks_request ->
        (describe_maintenance_window_execution_tasks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    For a given maintenance window execution, lists the tasks that were run.
     *)

  
end

module DescribeMaintenanceWindowExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_executions_request ->
        (describe_maintenance_window_executions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists the executions of a maintenance window. This includes information about when the maintenance window was scheduled to be active, and information about tasks registered and run with the maintenance window.
     *)

  
end

module DescribeMaintenanceWindowSchedule : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_schedule_request ->
        (describe_maintenance_window_schedule_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves information about upcoming executions of a maintenance window.
     *)

  
end

module DescribeMaintenanceWindowTargets : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_targets_request ->
        (describe_maintenance_window_targets_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists the targets registered with the maintenance window.
     *)

  
end

module DescribeMaintenanceWindowTasks : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_window_tasks_request ->
        (describe_maintenance_window_tasks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists the tasks in a maintenance window.
    
     For maintenance window tasks without a specified target, you can't supply values for [--max-errors] and [--max-concurrency]. Instead, the system inserts a placeholder value of [1], which may be reported in the response to this command. These values don't affect the running of your task and can be ignored.
     
      *)

  
end

module DescribeMaintenanceWindows : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_windows_request ->
        (describe_maintenance_windows_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the maintenance windows in an Amazon Web Services account.
     *)

  
end

module DescribeMaintenanceWindowsForTarget : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_maintenance_windows_for_target_request ->
        (describe_maintenance_windows_for_target_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves information about the maintenance window targets or tasks that a managed node is associated with.
     *)

  
end

module DescribeOpsItems : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_ops_items_request ->
        (describe_ops_items_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Query a set of OpsItems. You must have permission in Identity and Access Management (IAM) to query a list of OpsItems. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
    
     Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  
end

module DescribeParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_parameters_request ->
        (describe_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidFilterOption of invalid_filter_option
            | `InvalidFilterValue of invalid_filter_value
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Lists the parameters in your Amazon Web Services account or the parameters shared with you when you enable the {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_DescribeParameters.html#systemsmanager-DescribeParameters-request-Shared}Shared} option.
    
     Request results are returned on a best-effort basis. If you specify [MaxResults] in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of [MaxResults]. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a [NextToken]. You can specify the [NextToken] in a subsequent call to get the next set of results.
     
      If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must also update the key alias the parameter uses to reference KMS. Otherwise, [DescribeParameters] retrieves whatever the original key alias was referencing.
      
       *)

  
end

module DescribePatchBaselines : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_baselines_request ->
        (describe_patch_baselines_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists the patch baselines in your Amazon Web Services account.
     *)

  
end

module DescribePatchGroupState : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_group_state_request ->
        (describe_patch_group_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Returns high-level aggregated patch compliance state information for a patch group.
     *)

  
end

module DescribePatchGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_groups_request ->
        (describe_patch_groups_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists all patch groups that have been registered with patch baselines.
     *)

  
end

module DescribePatchProperties : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_patch_properties_request ->
        (describe_patch_properties_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Lists the properties of available patches organized by product, product family, classification, severity, and other properties of available patches. You can use the reported properties in the filters you specify in requests for operations such as [CreatePatchBaseline], [UpdatePatchBaseline], [DescribeAvailablePatches], and [DescribePatchBaselines].
    
     The following section lists the properties that can be used in filters for each major operating system type:
     
      AMAZON_LINUX Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
                   
                    AMAZON_LINUX_2 Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
                                   
                                    CENTOS Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
                                           
                                            DEBIAN Valid properties: [PRODUCT] | [PRIORITY]
                                                   
                                                    MACOS Valid properties: [PRODUCT] | [CLASSIFICATION]
                                                          
                                                           ORACLE_LINUX Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
                                                                        
                                                                         REDHAT_ENTERPRISE_LINUX 
    Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
    
     SUSE Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY]
          
           UBUNTU Valid properties: [PRODUCT] | [PRIORITY]
                  
                   WINDOWS Valid properties: [PRODUCT] | [PRODUCT_FAMILY] | [CLASSIFICATION] | [MSRC_SEVERITY]
                           
                            *)

  
end

module DescribeSessions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_sessions_request ->
        (describe_sessions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions from the past 30 days.
     *)

  
end

module DisassociateOpsItemRelatedItem : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_ops_item_related_item_request ->
        (disassociate_ops_item_related_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemConflictException of ops_item_conflict_exception
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            | `OpsItemNotFoundException of ops_item_not_found_exception
            | `OpsItemRelatedItemAssociationNotFoundException of ops_item_related_item_association_not_found_exception
            
        ]
      ) result
  (** 
    Deletes the association between an OpsItem and a related item. For example, this API operation can delete an Incident Manager incident from an OpsItem. Incident Manager is a capability of Amazon Web Services Systems Manager.
     *)

  
end

module GetAutomationExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      get_automation_execution_request ->
        (get_automation_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Get detailed information about a particular Automation execution.
     *)

  
end

module GetCalendarState : sig
  val request :
    Smaws_Lib.Context.t ->
      get_calendar_state_request ->
        (get_calendar_state_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentType of invalid_document_type
            | `UnsupportedCalendarException of unsupported_calendar_exception
            
        ]
      ) result
  (** 
    Gets the state of a Amazon Web Services Systems Manager change calendar at the current time or a specified time. If you specify a time, [GetCalendarState] returns the state of the calendar at that specific time, and returns the next time that the change calendar state will transition. If you don't specify a time, [GetCalendarState] uses the current time. Change Calendar entries have two possible states: [OPEN] or [CLOSED].
    
     If you specify more than one calendar in a request, the command returns the status of [OPEN] only if all calendars in the request are open. If one or more calendars in the request are closed, the status returned is [CLOSED].
     
      For more information about Change Calendar, a capability of Amazon Web Services Systems Manager, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html}Amazon Web Services Systems Manager Change Calendar} in the {i Amazon Web Services Systems Manager User Guide}.
       *)

  
end

module GetCommandInvocation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_command_invocation_request ->
        (get_command_invocation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidCommandId of invalid_command_id
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidPluginName of invalid_plugin_name
            | `InvocationDoesNotExist of invocation_does_not_exist
            
        ]
      ) result
  (** 
    Returns detailed information about command execution for an invocation or plugin.
    
     [GetCommandInvocation] only gives the execution status of a plugin in a document. To get the command execution status on a specific managed node, use [ListCommandInvocations]. To get the command execution status across managed nodes, use [ListCommands].
      *)

  
end

module GetConnectionStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_connection_status_request ->
        (get_connection_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the Session Manager connection status for a managed node to determine whether it is running and ready to receive Session Manager connections.
     *)

  
end

module GetDefaultPatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      get_default_patch_baseline_request ->
        (get_default_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the default patch baseline. Amazon Web Services Systems Manager supports creating multiple default patch baselines. For example, you can create a default patch baseline for each operating system.
    
     If you don't specify an operating system value, the default patch baseline for Windows is returned.
      *)

  
end

module GetDeployablePatchSnapshotForInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_deployable_patch_snapshot_for_instance_request ->
        (get_deployable_patch_snapshot_for_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `UnsupportedFeatureRequiredException of unsupported_feature_required_exception
            | `UnsupportedOperatingSystem of unsupported_operating_system
            
        ]
      ) result
  (** 
    Retrieves the current snapshot for the patch baseline the managed node uses. This API is primarily used by the [AWS-RunPatchBaseline] Systems Manager document (SSM document).
    
     If you run the command locally, such as with the Command Line Interface (CLI), the system attempts to use your local Amazon Web Services credentials and the operation fails. To avoid this, you can run the command in the Amazon Web Services Systems Manager console. Use Run Command, a capability of Amazon Web Services Systems Manager, with an SSM document that enables you to target a managed node with a script or command. For example, run the command using the [AWS-RunShellScript] document or the [AWS-RunPowerShellScript] document.
     
      *)

  
end

module GetDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      get_document_request ->
        (get_document_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            
        ]
      ) result
  (** 
    Gets the contents of the specified Amazon Web Services Systems Manager document (SSM document).
     *)

  
end

module GetInventory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_inventory_request ->
        (get_inventory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidAggregatorException of invalid_aggregator_exception
            | `InvalidFilter of invalid_filter
            | `InvalidInventoryGroupException of invalid_inventory_group_exception
            | `InvalidNextToken of invalid_next_token
            | `InvalidResultAttributeException of invalid_result_attribute_exception
            | `InvalidTypeNameException of invalid_type_name_exception
            
        ]
      ) result
  (** 
    Query inventory information. This includes managed node status, such as [Stopped] or [Terminated].
     *)

  
end

module GetInventorySchema : sig
  val request :
    Smaws_Lib.Context.t ->
      get_inventory_schema_request ->
        (get_inventory_schema_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            | `InvalidTypeNameException of invalid_type_name_exception
            
        ]
      ) result
  (** 
    Return a list of inventory type names for the account, or return a list of attribute names for a specific Inventory item type.
     *)

  
end

module GetMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_request ->
        (get_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves a maintenance window.
     *)

  
end

module GetMaintenanceWindowExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_execution_request ->
        (get_maintenance_window_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves details about a specific a maintenance window execution.
     *)

  
end

module GetMaintenanceWindowExecutionTask : sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_execution_task_request ->
        (get_maintenance_window_execution_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the details about a specific task run as part of a maintenance window execution.
     *)

  
end

module GetMaintenanceWindowExecutionTaskInvocation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_execution_task_invocation_request ->
        (get_maintenance_window_execution_task_invocation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves information about a specific task running on a specific target.
     *)

  
end

module GetMaintenanceWindowTask : sig
  val request :
    Smaws_Lib.Context.t ->
      get_maintenance_window_task_request ->
        (get_maintenance_window_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the details of a maintenance window task.
    
     For maintenance window tasks without a specified target, you can't supply values for [--max-errors] and [--max-concurrency]. Instead, the system inserts a placeholder value of [1], which may be reported in the response to this command. These values don't affect the running of your task and can be ignored.
     
      To retrieve a list of tasks in a maintenance window, instead use the [DescribeMaintenanceWindowTasks] command.
       *)

  
end

module GetOpsItem : sig
  val request :
    Smaws_Lib.Context.t ->
      get_ops_item_request ->
        (get_ops_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemAccessDeniedException of ops_item_access_denied_exception
            | `OpsItemNotFoundException of ops_item_not_found_exception
            
        ]
      ) result
  (** 
    Get information about an OpsItem by using the ID. You must have permission in Identity and Access Management (IAM) to view information about an OpsItem. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
    
     Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  
end

module GetOpsMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      get_ops_metadata_request ->
        (get_ops_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
            | `OpsMetadataNotFoundException of ops_metadata_not_found_exception
            
        ]
      ) result
  (** 
    View operational metadata related to an application in Application Manager.
     *)

  
end

module GetOpsSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_ops_summary_request ->
        (get_ops_summary_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidAggregatorException of invalid_aggregator_exception
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            | `InvalidTypeNameException of invalid_type_name_exception
            | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
            
        ]
      ) result
  (** 
    View a summary of operations metadata (OpsData) based on specified filters and aggregators. OpsData can include information about Amazon Web Services Systems Manager OpsCenter operational workitems (OpsItems) as well as information about any Amazon Web Services resource or service configured to report OpsData to Amazon Web Services Systems Manager Explorer.
     *)

  
end

module GetParameter : sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameter_request ->
        (get_parameter_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidKeyId of invalid_key_id
            | `ParameterNotFound of parameter_not_found
            | `ParameterVersionNotFound of parameter_version_not_found
            
        ]
      ) result
  (** 
    Get information about a single parameter by specifying the parameter name.
    
     To get information about more than one parameter at a time, use the [GetParameters] operation.
     
      *)

  
end

module GetParameterHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameter_history_request ->
        (get_parameter_history_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidKeyId of invalid_key_id
            | `InvalidNextToken of invalid_next_token
            | `ParameterNotFound of parameter_not_found
            
        ]
      ) result
  (** 
    Retrieves the history of all changes to a parameter.
    
     If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must also update the key alias the parameter uses to reference KMS. Otherwise, [GetParameterHistory] retrieves whatever the original key alias was referencing.
     
      *)

  
end

module GetParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameters_request ->
        (get_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidKeyId of invalid_key_id
            
        ]
      ) result
  (** 
    Get information about one or more parameters by specifying multiple parameter names.
    
     To get information about a single parameter, you can use the [GetParameter] operation instead.
     
      *)

  
end

module GetParametersByPath : sig
  val request :
    Smaws_Lib.Context.t ->
      get_parameters_by_path_request ->
        (get_parameters_by_path_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidFilterOption of invalid_filter_option
            | `InvalidFilterValue of invalid_filter_value
            | `InvalidKeyId of invalid_key_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieve information about one or more parameters in a specific hierarchy.
    
     Request results are returned on a best-effort basis. If you specify [MaxResults] in the request, the response includes information up to the limit specified. The number of items returned, however, can be between zero and the value of [MaxResults]. If the service reaches an internal limit while processing the results, it stops the operation and returns the matching values up to that point and a [NextToken]. You can specify the [NextToken] in a subsequent call to get the next set of results.
      *)

  
end

module GetPatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      get_patch_baseline_request ->
        (get_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            
        ]
      ) result
  (** 
    Retrieves information about a patch baseline.
     *)

  
end

module GetPatchBaselineForPatchGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      get_patch_baseline_for_patch_group_request ->
        (get_patch_baseline_for_patch_group_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Retrieves the patch baseline that should be used for the specified patch group.
     *)

  
end

module GetResourcePolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_policies_request ->
        (get_resource_policies_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
            
        ]
      ) result
  (** 
    Returns an array of the [Policy] object.
     *)

  
end

module GetServiceSetting : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_setting_request ->
        (get_service_setting_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ServiceSettingNotFound of service_setting_not_found
            
        ]
      ) result
  (** 
    [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of [false]. This means the user can't use this feature unless they change the setting to [true] and intentionally opt in for a paid feature.
    
     Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [UpdateServiceSetting] API operation to change the default setting. Or use the [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web Services service team.
     
      Query the current service setting for the Amazon Web Services account.
       *)

  
end

module LabelParameterVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      label_parameter_version_request ->
        (label_parameter_version_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ParameterNotFound of parameter_not_found
            | `ParameterVersionLabelLimitExceeded of parameter_version_label_limit_exceeded
            | `ParameterVersionNotFound of parameter_version_not_found
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  [@@ocaml.doc {| 
    A parameter label is a user-defined alias to help you manage different versions of a parameter. When you modify a parameter, Amazon Web Services Systems Manager automatically saves a new version and increments the version number by one. A label can help you remember the purpose of a parameter when there are multiple versions.
    
     Parameter labels have the following requirements and restrictions.
     
      {ul
           {- A version of a parameter can have a maximum of 10 labels.
              
              }
            {- You can't attach the same label to different versions of the same parameter. For example, if version 1 has the label Production, then you can't attach Production to version 2.
               
               }
            {- You can move a label from one version of a parameter to another.
               
               }
            {- You can't create a label when you create a new parameter. You must attach a label to a specific version of a parameter.
               
               }
            {- If you no longer want to use a parameter label, then you can either delete it or move it to a different version of a parameter.
               
               }
            {- A label can have a maximum of 100 characters.
               
               }
            {- Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores (_).
               
               }
            {- Labels can't begin with a number, "[aws]" or "[ssm]" (not case sensitive). If a label fails to meet these requirements, then the label isn't associated with a parameter and the system displays it in the list of InvalidLabels.
               
               }
           
      }
       |}]

  
end

module ListAssociationVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_association_versions_request ->
        (list_association_versions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Retrieves all versions of an association for a specific association ID.
     *)

  
end

module ListAssociations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_associations_request ->
        (list_associations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Returns all State Manager associations in the current Amazon Web Services account and Amazon Web Services Region. You can limit the results to a specific State Manager association document or managed node by specifying a filter. State Manager is a capability of Amazon Web Services Systems Manager.
     *)

  
end

module ListCommandInvocations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_command_invocations_request ->
        (list_command_invocations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidCommandId of invalid_command_id
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    An invocation is copy of a command sent to a specific managed node. A command can apply to one or more managed nodes. A command invocation applies to one managed node. For example, if a user runs [SendCommand] against three managed nodes, then a command invocation is created for each requested managed node ID. [ListCommandInvocations] provide status about command execution.
     *)

  
end

module ListCommands : sig
  val request :
    Smaws_Lib.Context.t ->
      list_commands_request ->
        (list_commands_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidCommandId of invalid_command_id
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Lists the commands requested by users of the Amazon Web Services account.
     *)

  
end

module ListComplianceItems : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_items_request ->
        (list_compliance_items_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            | `InvalidResourceId of invalid_resource_id
            | `InvalidResourceType of invalid_resource_type
            
        ]
      ) result
  (** 
    For a specified resource ID, this API operation returns a list of compliance statuses for different resource types. Currently, you can only specify one resource ID per call. List results depend on the criteria specified in the filter.
     *)

  
end

module ListComplianceSummaries : sig
  val request :
    Smaws_Lib.Context.t ->
      list_compliance_summaries_request ->
        (list_compliance_summaries_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Returns a summary count of compliant and non-compliant resources for a compliance type. For example, this call can return State Manager associations, patches, or custom compliance types according to the filter criteria that you specify.
     *)

  
end

module ListDocumentMetadataHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      list_document_metadata_history_request ->
        (list_document_metadata_history_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Information about approval reviews for a version of a change template in Change Manager.
     *)

  
end

module ListDocumentVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_document_versions_request ->
        (list_document_versions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    List all versions for a document.
     *)

  
end

module ListDocuments : sig
  val request :
    Smaws_Lib.Context.t ->
      list_documents_request ->
        (list_documents_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilterKey of invalid_filter_key
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Returns all Systems Manager (SSM) documents in the current Amazon Web Services account and Amazon Web Services Region. You can limit the results of this request by using a filter.
     *)

  
end

module ListInventoryEntries : sig
  val request :
    Smaws_Lib.Context.t ->
      list_inventory_entries_request ->
        (list_inventory_entries_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNextToken of invalid_next_token
            | `InvalidTypeNameException of invalid_type_name_exception
            
        ]
      ) result
  (** 
    A list of inventory items returned by the request.
     *)

  
end

module ListOpsItemEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ops_item_events_request ->
        (list_ops_item_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
            | `OpsItemNotFoundException of ops_item_not_found_exception
            
        ]
      ) result
  (** 
    Returns a list of all OpsItem events in the current Amazon Web Services Region and Amazon Web Services account. You can limit the results to events associated with specific OpsItems by specifying a filter.
     *)

  
end

module ListOpsItemRelatedItems : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ops_item_related_items_request ->
        (list_ops_item_related_items_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            
        ]
      ) result
  (** 
    Lists all related-item resources associated with a Systems Manager OpsCenter OpsItem. OpsCenter is a capability of Amazon Web Services Systems Manager.
     *)

  
end

module ListOpsMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ops_metadata_request ->
        (list_ops_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
            
        ]
      ) result
  (** 
    Amazon Web Services Systems Manager calls this API operation when displaying all Application Manager OpsMetadata objects or blobs.
     *)

  
end

module ListResourceComplianceSummaries : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_compliance_summaries_request ->
        (list_resource_compliance_summaries_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidFilter of invalid_filter
            | `InvalidNextToken of invalid_next_token
            
        ]
      ) result
  (** 
    Returns a resource-level summary count. The summary includes information about compliant and non-compliant statuses and detailed compliance-item severity counts, according to the filter criteria you specify.
     *)

  
end

module ListResourceDataSync : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_data_sync_request ->
        (list_resource_data_sync_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidNextToken of invalid_next_token
            | `ResourceDataSyncInvalidConfigurationException of resource_data_sync_invalid_configuration_exception
            
        ]
      ) result
  (** 
    Lists your resource data sync configurations. Includes information about the last time a sync attempted to start, the last sync status, and the last time a sync successfully completed.
    
     The number of sync configurations might be too large to return using a single call to [ListResourceDataSync]. You can limit the number of sync configurations returned by using the [MaxResults] parameter. To determine whether there are more sync configurations to list, check the value of [NextToken] in the output. If there are more sync configurations to list, you can request them by specifying the [NextToken] returned in the call to the parameter of a subsequent call.
      *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            | `InvalidResourceType of invalid_resource_type
            
        ]
      ) result
  (** 
    Returns a list of the tags assigned to the specified resource.
    
     For information about the ID format for each supported resource type, see [AddTagsToResource].
      *)

  
end

module ModifyDocumentPermission : sig
  val request :
    Smaws_Lib.Context.t ->
      modify_document_permission_request ->
        (modify_document_permission_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DocumentLimitExceeded of document_limit_exceeded
            | `DocumentPermissionLimit of document_permission_limit
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidPermissionType of invalid_permission_type
            
        ]
      ) result
  (** 
    Shares a Amazon Web Services Systems Manager document (SSM document)publicly or privately. If you share a document privately, you must specify the Amazon Web Services user IDs for those people who can use the document. If you share a document publicly, you must specify {i All} as the account ID.
     *)

  
end

module PutComplianceItems : sig
  val request :
    Smaws_Lib.Context.t ->
      put_compliance_items_request ->
        (put_compliance_items_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ComplianceTypeCountLimitExceededException of compliance_type_count_limit_exceeded_exception
            | `InternalServerError of internal_server_error
            | `InvalidItemContentException of invalid_item_content_exception
            | `InvalidResourceId of invalid_resource_id
            | `InvalidResourceType of invalid_resource_type
            | `ItemSizeLimitExceededException of item_size_limit_exceeded_exception
            | `TotalSizeLimitExceededException of total_size_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Registers a compliance type and other compliance details on a designated resource. This operation lets you register custom compliance details with a resource. This call overwrites existing compliance information on the resource, so you must provide a full list of compliance items each time that you send the request.
    
     ComplianceType can be one of the following:
     
      {ul
           {- ExecutionId: The execution ID when the patch, association, or custom compliance item was applied.
              
              }
            {- ExecutionType: Specify patch, association, or Custom:[string].
               
               }
            {- ExecutionTime. The time the patch, association, or custom compliance item was applied to the managed node.
               
               }
            {- Id: The patch, association, or custom compliance ID.
               
               }
            {- Title: A title.
               
               }
            {- Status: The status of the compliance item. For example, [approved] for patches, or [Failed] for associations.
               
               }
            {- Severity: A patch severity. For example, [Critical].
               
               }
            {- DocumentName: An SSM document name. For example, [AWS-RunPatchBaseline].
               
               }
            {- DocumentVersion: An SSM document version number. For example, 4.
               
               }
            {- Classification: A patch classification. For example, [security updates].
               
               }
            {- PatchBaselineId: A patch baseline ID.
               
               }
            {- PatchSeverity: A patch severity. For example, [Critical].
               
               }
            {- PatchState: A patch state. For example, [InstancesWithFailedPatches].
               
               }
            {- PatchGroup: The name of a patch group.
               
               }
            {- InstalledTime: The time the association, patch, or custom compliance item was applied to the resource. Specify the time by using the following format: [yyyy-MM-dd'T'HH:mm:ss'Z']
               
               }
           
      }
       *)

  
end

module PutInventory : sig
  val request :
    Smaws_Lib.Context.t ->
      put_inventory_request ->
        (put_inventory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CustomSchemaCountLimitExceededException of custom_schema_count_limit_exceeded_exception
            | `InternalServerError of internal_server_error
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidInventoryItemContextException of invalid_inventory_item_context_exception
            | `InvalidItemContentException of invalid_item_content_exception
            | `InvalidTypeNameException of invalid_type_name_exception
            | `ItemContentMismatchException of item_content_mismatch_exception
            | `ItemSizeLimitExceededException of item_size_limit_exceeded_exception
            | `SubTypeCountLimitExceededException of sub_type_count_limit_exceeded_exception
            | `TotalSizeLimitExceededException of total_size_limit_exceeded_exception
            | `UnsupportedInventoryItemContextException of unsupported_inventory_item_context_exception
            | `UnsupportedInventorySchemaVersionException of unsupported_inventory_schema_version_exception
            
        ]
      ) result
  (** 
    Bulk update custom inventory items on one or more managed nodes. The request adds an inventory item, if it doesn't already exist, or updates an inventory item, if it does exist.
     *)

  
end

module PutParameter : sig
  val request :
    Smaws_Lib.Context.t ->
      put_parameter_request ->
        (put_parameter_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `HierarchyLevelLimitExceededException of hierarchy_level_limit_exceeded_exception
            | `HierarchyTypeMismatchException of hierarchy_type_mismatch_exception
            | `IncompatiblePolicyException of incompatible_policy_exception
            | `InternalServerError of internal_server_error
            | `InvalidAllowedPatternException of invalid_allowed_pattern_exception
            | `InvalidKeyId of invalid_key_id
            | `InvalidPolicyAttributeException of invalid_policy_attribute_exception
            | `InvalidPolicyTypeException of invalid_policy_type_exception
            | `ParameterAlreadyExists of parameter_already_exists
            | `ParameterLimitExceeded of parameter_limit_exceeded
            | `ParameterMaxVersionLimitExceeded of parameter_max_version_limit_exceeded
            | `ParameterPatternMismatchException of parameter_pattern_mismatch_exception
            | `PoliciesLimitExceededException of policies_limit_exceeded_exception
            | `TooManyUpdates of too_many_updates
            | `UnsupportedParameterType of unsupported_parameter_type
            
        ]
      ) result
  (** 
    Add a parameter to the system.
     *)

  
end

module PutResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_request ->
        (put_resource_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `MalformedResourcePolicyDocumentException of malformed_resource_policy_document_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyConflictException of resource_policy_conflict_exception
            | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
            | `ResourcePolicyLimitExceededException of resource_policy_limit_exceeded_exception
            | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
            
        ]
      ) result
  (** 
    Creates or updates a Systems Manager resource policy. A resource policy helps you to define the IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources. The following resources support Systems Manager resource policies.
    
     {ul
          {- [OpsItemGroup] - The resource policy for [OpsItemGroup] enables Amazon Web Services accounts to view and interact with OpsCenter operational work items (OpsItems).
             
             }
           {- [Parameter] - The resource policy is used to share a parameter with other accounts using Resource Access Manager (RAM).
              
               To share a parameter, it must be in the advanced parameter tier. For information about parameter tiers, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html}Managing parameter tiers}. For information about changing an existing standard parameter to an advanced parameter, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html#parameter-store-advanced-parameters-enabling}Changing a standard parameter to an advanced parameter}.
               
                To share a [SecureString] parameter, it must be encrypted with a customer managed key, and you must share the key separately through Key Management Service. Amazon Web Services managed keys cannot be shared. Parameters encrypted with the default Amazon Web Services managed key can be updated to use a customer managed key instead. For KMS key definitions, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html}KMS concepts} in the {i Key Management Service Developer Guide}.
                
                 While you can share a parameter using the Systems Manager [PutResourcePolicy] operation, we recommend using Resource Access Manager (RAM) instead. This is because using [PutResourcePolicy] requires the extra step of promoting the parameter to a standard RAM Resource Share using the RAM {{:https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html}PromoteResourceShareCreatedFromPolicy} API operation. Otherwise, the parameter won't be returned by the Systems Manager {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_DescribeParameters.html}DescribeParameters} API operation using the [--shared] option.
                 
                  For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html#share}Sharing a parameter} in the {i Amazon Web Services Systems Manager User Guide}
                  
                  }
          
      }
       *)

  
end

module RegisterDefaultPatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      register_default_patch_baseline_request ->
        (register_default_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            
        ]
      ) result
  (** 
    Defines the default patch baseline for the relevant operating system.
    
     To reset the Amazon Web Services-predefined patch baseline as the default, specify the full patch baseline Amazon Resource Name (ARN) as the baseline ID value. For example, for CentOS, specify [arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed] instead of [pb-0574b43a65ea646ed].
      *)

  
end

module RegisterPatchBaselineForPatchGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      register_patch_baseline_for_patch_group_request ->
        (register_patch_baseline_for_patch_group_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AlreadyExistsException of already_exists_exception
            | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            | `ResourceLimitExceededException of resource_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Registers a patch baseline for a patch group.
     *)

  
end

module RegisterTargetWithMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      register_target_with_maintenance_window_request ->
        (register_target_with_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `ResourceLimitExceededException of resource_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Registers a target with a maintenance window.
     *)

  
end

module RegisterTaskWithMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      register_task_with_maintenance_window_request ->
        (register_task_with_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `FeatureNotAvailableException of feature_not_available_exception
            | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `ResourceLimitExceededException of resource_limit_exceeded_exception
            
        ]
      ) result
  (** 
    Adds a new task to a maintenance window.
     *)

  
end

module RemoveTagsFromResource : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_resource_request ->
        (remove_tags_from_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidResourceId of invalid_resource_id
            | `InvalidResourceType of invalid_resource_type
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Removes tag keys from the specified resource.
     *)

  
end

module ResetServiceSetting : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_service_setting_request ->
        (reset_service_setting_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ServiceSettingNotFound of service_setting_not_found
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  [@@ocaml.doc {| 
    [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.
    
     Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [GetServiceSetting] API operation to view the current value. Use the [UpdateServiceSetting] API operation to change the default setting.
     
      Reset the service setting for the account to the default value as provisioned by the Amazon Web Services service team.
       |}]

  
end

module ResumeSession : sig
  val request :
    Smaws_Lib.Context.t ->
      resume_session_request ->
        (resume_session_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Reconnects a session to a managed node after it has been disconnected. Connections can be resumed for disconnected sessions, but not terminated sessions.
    
     This command is primarily for use by client machines to automatically reconnect during intermittent network issues. It isn't intended for any other use.
     
      *)

  
end

module SendAutomationSignal : sig
  val request :
    Smaws_Lib.Context.t ->
      send_automation_signal_request ->
        (send_automation_signal_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
            | `AutomationStepNotFoundException of automation_step_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidAutomationSignalException of invalid_automation_signal_exception
            
        ]
      ) result
  (** 
    Sends a signal to an Automation execution to change the current behavior or status of the execution.
     *)

  
end

module SendCommand : sig
  val request :
    Smaws_Lib.Context.t ->
      send_command_request ->
        (send_command_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateInstanceId of duplicate_instance_id
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            | `InvalidInstanceId of invalid_instance_id
            | `InvalidNotificationConfig of invalid_notification_config
            | `InvalidOutputFolder of invalid_output_folder
            | `InvalidParameters of invalid_parameters
            | `InvalidRole of invalid_role
            | `MaxDocumentSizeExceeded of max_document_size_exceeded
            | `UnsupportedPlatformType of unsupported_platform_type
            
        ]
      ) result
  (** 
    Runs commands on one or more managed nodes.
     *)

  
end

module StartAssociationsOnce : sig
  val request :
    Smaws_Lib.Context.t ->
      start_associations_once_request ->
        (start_associations_once_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InvalidAssociation of invalid_association
            
        ]
      ) result
  (** 
    Runs an association immediately and only one time. This operation can be helpful when troubleshooting associations.
     *)

  
end

module StartAutomationExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_automation_execution_request ->
        (start_automation_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationDefinitionNotFoundException of automation_definition_not_found_exception
            | `AutomationDefinitionVersionNotFoundException of automation_definition_version_not_found_exception
            | `AutomationExecutionLimitExceededException of automation_execution_limit_exceeded_exception
            | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `InvalidAutomationExecutionParametersException of invalid_automation_execution_parameters_exception
            | `InvalidTarget of invalid_target
            
        ]
      ) result
  (** 
    Initiates execution of an Automation runbook.
     *)

  
end

module StartChangeRequestExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_change_request_execution_request ->
        (start_change_request_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationDefinitionNotApprovedException of automation_definition_not_approved_exception
            | `AutomationDefinitionNotFoundException of automation_definition_not_found_exception
            | `AutomationDefinitionVersionNotFoundException of automation_definition_version_not_found_exception
            | `AutomationExecutionLimitExceededException of automation_execution_limit_exceeded_exception
            | `IdempotentParameterMismatch of idempotent_parameter_mismatch
            | `InternalServerError of internal_server_error
            | `InvalidAutomationExecutionParametersException of invalid_automation_execution_parameters_exception
            
        ]
      ) result
  (** 
    Creates a change request for Change Manager. The Automation runbooks specified in the change request run only after all required approvals for the change request have been received.
     *)

  
end

module StartSession : sig
  val request :
    Smaws_Lib.Context.t ->
      start_session_request ->
        (start_session_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `TargetNotConnected of target_not_connected
            
        ]
      ) result
  (** 
    Initiates a connection to a target (for example, a managed node) for a Session Manager session. Returns a URL and token that can be used to open a WebSocket connection for sending input and receiving outputs.
    
     Amazon Web Services CLI usage: [start-session] is an interactive command that requires the Session Manager plugin to be installed on the client machine making the call. For information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html}Install the Session Manager plugin for the Amazon Web Services CLI} in the {i Amazon Web Services Systems Manager User Guide}.
     
      Amazon Web Services Tools for PowerShell usage: Start-SSMSession isn't currently supported by Amazon Web Services Tools for PowerShell on Windows local machines.
      
       *)

  
end

module StopAutomationExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_automation_execution_request ->
        (stop_automation_execution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
            | `InternalServerError of internal_server_error
            | `InvalidAutomationStatusUpdateException of invalid_automation_status_update_exception
            
        ]
      ) result
  (** 
    Stop an Automation that is currently running.
     *)

  
end

module TerminateSession : sig
  val request :
    Smaws_Lib.Context.t ->
      terminate_session_request ->
        (terminate_session_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Permanently ends a session and closes the data connection between the Session Manager client and SSM Agent on the managed node. A terminated session can't be resumed.
     *)

  
end

module UnlabelParameterVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      unlabel_parameter_version_request ->
        (unlabel_parameter_version_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ParameterNotFound of parameter_not_found
            | `ParameterVersionNotFound of parameter_version_not_found
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Remove a label or labels from a parameter.
     *)

  
end

module UpdateAssociation : sig
  val request :
    Smaws_Lib.Context.t ->
      update_association_request ->
        (update_association_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `AssociationVersionLimitExceeded of association_version_limit_exceeded
            | `InternalServerError of internal_server_error
            | `InvalidAssociationVersion of invalid_association_version
            | `InvalidDocument of invalid_document
            | `InvalidDocumentVersion of invalid_document_version
            | `InvalidOutputLocation of invalid_output_location
            | `InvalidParameters of invalid_parameters
            | `InvalidSchedule of invalid_schedule
            | `InvalidTarget of invalid_target
            | `InvalidTargetMaps of invalid_target_maps
            | `InvalidUpdate of invalid_update
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Updates an association. You can update the association name and version, the document version, schedule, parameters, and Amazon Simple Storage Service (Amazon S3) output. When you call [UpdateAssociation], the system removes all optional parameters from the request and overwrites the association with null values for those parameters. This is by design. You must specify all optional parameters in the call, even if you are not changing the parameters. This includes the [Name] parameter. Before calling this API action, we recommend that you call the [DescribeAssociation] API operation and make a note of all optional parameters required for your [UpdateAssociation] call.
    
     In order to call this API operation, a user, group, or role must be granted permission to call the [DescribeAssociation] API operation. If you don't have permission to call [DescribeAssociation], then you receive the following error: 
     {[
     An error occurred (AccessDeniedException) when calling the UpdateAssociation operation: User: isn't authorized to perform: ssm:DescribeAssociation on resource: 
     ]}
     
     
      When you update an association, the association immediately runs against the specified targets. You can add the [ApplyOnlyAtCronInterval] parameter to run the association during the next schedule run.
      
       *)

  
end

module UpdateAssociationStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      update_association_status_request ->
        (update_association_status_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AssociationDoesNotExist of association_does_not_exist
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidInstanceId of invalid_instance_id
            | `StatusUnchanged of status_unchanged
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  (** 
    Updates the status of the Amazon Web Services Systems Manager document (SSM document) associated with the specified managed node.
    
     [UpdateAssociationStatus] is primarily used by the Amazon Web Services Systems Manager Agent (SSM Agent) to report status updates about your associations and is only used for associations created with the [InstanceId] legacy parameter.
      *)

  
end

module UpdateDocument : sig
  val request :
    Smaws_Lib.Context.t ->
      update_document_request ->
        (update_document_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DocumentVersionLimitExceeded of document_version_limit_exceeded
            | `DuplicateDocumentContent of duplicate_document_content
            | `DuplicateDocumentVersionName of duplicate_document_version_name
            | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentContent of invalid_document_content
            | `InvalidDocumentOperation of invalid_document_operation
            | `InvalidDocumentSchemaVersion of invalid_document_schema_version
            | `InvalidDocumentVersion of invalid_document_version
            | `MaxDocumentSizeExceeded of max_document_size_exceeded
            
        ]
      ) result
  (** 
    Updates one or more values for an SSM document.
     *)

  
end

module UpdateDocumentDefaultVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      update_document_default_version_request ->
        (update_document_default_version_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentSchemaVersion of invalid_document_schema_version
            | `InvalidDocumentVersion of invalid_document_version
            
        ]
      ) result
  (** 
    Set the default version of a document.
    
     If you change a document version for a State Manager association, Systems Manager immediately runs the association unless you previously specifed the [apply-only-at-cron-interval] parameter.
     
      *)

  
end

module UpdateDocumentMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      update_document_metadata_request ->
        (update_document_metadata_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidDocument of invalid_document
            | `InvalidDocumentOperation of invalid_document_operation
            | `InvalidDocumentVersion of invalid_document_version
            
        ]
      ) result
  (** 
    Updates information related to approval reviews for a specific version of a change template in Change Manager.
     *)

  
end

module UpdateMaintenanceWindow : sig
  val request :
    Smaws_Lib.Context.t ->
      update_maintenance_window_request ->
        (update_maintenance_window_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Updates an existing maintenance window. Only specified parameters are modified.
    
     The value you specify for [Duration] determines the specific end time for the maintenance window based on the time it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the number of hours you specify for [Cutoff]. For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value you specify for [Cutoff] is one hour, no maintenance window tasks can start after 5 PM.
     
      *)

  
end

module UpdateMaintenanceWindowTarget : sig
  val request :
    Smaws_Lib.Context.t ->
      update_maintenance_window_target_request ->
        (update_maintenance_window_target_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Modifies the target of an existing maintenance window. You can change the following:
    
     {ul
          {- Name
             
             }
           {- Description
              
              }
           {- Owner
              
              }
           {- IDs for an ID target
              
              }
           {- Tags for a Tag target
              
              }
           {- From any supported tag type to another. The three supported tag types are ID target, Tag target, and resource group. For more information, see [Target].
              
              }
          
      }
       If a parameter is null, then the corresponding field isn't modified.
       
        *)

  
end

module UpdateMaintenanceWindowTask : sig
  val request :
    Smaws_Lib.Context.t ->
      update_maintenance_window_task_request ->
        (update_maintenance_window_task_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Modifies a task assigned to a maintenance window. You can't change the task type, but you can change the following values:
    
     {ul
          {- [TaskARN]. For example, you can change a [RUN_COMMAND] task from [AWS-RunPowerShellScript] to [AWS-RunShellScript].
             
             }
           {- [ServiceRoleArn]
              
              }
           {- [TaskInvocationParameters]
              
              }
           {- [Priority]
              
              }
           {- [MaxConcurrency]
              
              }
           {- [MaxErrors]
              
              }
          
      }
       One or more targets must be specified for maintenance window Run Command-type tasks. Depending on the task, targets are optional for other maintenance window task types (Automation, Lambda, and Step Functions). For more information about running tasks that don't specify targets, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User Guide}.
       
        If the value for a parameter in [UpdateMaintenanceWindowTask] is null, then the corresponding field isn't modified. If you set [Replace] to true, then all fields required by the [RegisterTaskWithMaintenanceWindow] operation are required for this request. Optional fields that aren't specified are set to null.
        
         When you update a maintenance window task that has options specified in [TaskInvocationParameters], you must provide again all the [TaskInvocationParameters] values that you want to retain. The values you don't specify again are removed. For example, suppose that when you registered a Run Command task, you specified [TaskInvocationParameters] values for [Comment], [NotificationConfig], and [OutputS3BucketName]. If you update the maintenance window task and specify only a different [OutputS3BucketName] value, the values for [Comment] and [NotificationConfig] are removed.
         
          *)

  
end

module UpdateManagedInstanceRole : sig
  val request :
    Smaws_Lib.Context.t ->
      update_managed_instance_role_request ->
        (update_managed_instance_role_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `InvalidInstanceId of invalid_instance_id
            
        ]
      ) result
  (** 
    Changes the Identity and Access Management (IAM) role that is assigned to the on-premises server, edge device, or virtual machines (VM). IAM roles are first assigned to these hybrid nodes during the activation process. For more information, see [CreateActivation].
     *)

  
end

module UpdateOpsItem : sig
  val request :
    Smaws_Lib.Context.t ->
      update_ops_item_request ->
        (update_ops_item_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsItemAccessDeniedException of ops_item_access_denied_exception
            | `OpsItemAlreadyExistsException of ops_item_already_exists_exception
            | `OpsItemConflictException of ops_item_conflict_exception
            | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
            | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
            | `OpsItemNotFoundException of ops_item_not_found_exception
            
        ]
      ) result
  (** 
    Edit or change an OpsItem. You must have permission in Identity and Access Management (IAM) to update an OpsItem. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
    
     Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance and health of their Amazon Web Services resources. For more information, see {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.
      *)

  
end

module UpdateOpsMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      update_ops_metadata_request ->
        (update_ops_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
            | `OpsMetadataKeyLimitExceededException of ops_metadata_key_limit_exceeded_exception
            | `OpsMetadataNotFoundException of ops_metadata_not_found_exception
            | `OpsMetadataTooManyUpdatesException of ops_metadata_too_many_updates_exception
            
        ]
      ) result
  (** 
    Amazon Web Services Systems Manager calls this API operation when you edit OpsMetadata in Application Manager.
     *)

  
end

module UpdatePatchBaseline : sig
  val request :
    Smaws_Lib.Context.t ->
      update_patch_baseline_request ->
        (update_patch_baseline_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DoesNotExistException of does_not_exist_exception
            | `InternalServerError of internal_server_error
            
        ]
      ) result
  (** 
    Modifies an existing patch baseline. Fields not specified in the request are left unchanged.
    
     For information about valid key-value pairs in [PatchFilters] for each supported operating system type, see [PatchFilter].
     
      *)

  
end

module UpdateResourceDataSync : sig
  val request :
    Smaws_Lib.Context.t ->
      update_resource_data_sync_request ->
        (update_resource_data_sync_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ResourceDataSyncConflictException of resource_data_sync_conflict_exception
            | `ResourceDataSyncInvalidConfigurationException of resource_data_sync_invalid_configuration_exception
            | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
            
        ]
      ) result
  (** 
    Update a resource data sync. After you create a resource data sync for a Region, you can't change the account options for that sync. For example, if you create a sync in the us-east-2 (Ohio) Region and you choose the [Include only the current account] option, you can't edit that sync later and choose the [Include all accounts from my Organizations
    configuration] option. Instead, you must delete the first resource data sync, and create a new one.
    
     This API operation only supports a resource data sync that was created with a SyncFromSource [SyncType].
     
      *)

  
end

module UpdateServiceSetting : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_setting_request ->
        (update_service_setting_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error
            | `ServiceSettingNotFound of service_setting_not_found
            | `TooManyUpdates of too_many_updates
            
        ]
      ) result
  [@@ocaml.doc {| 
    [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting defines how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web Services service charges money to the account based on feature or service usage, then the Amazon Web Services service team might create a default setting of "false". This means the user can't use this feature unless they change the setting to "true" and intentionally opt in for a paid feature.
    
     Services map a [SettingId] object to a setting value. Amazon Web Services services teams define the default value for a [SettingId]. You can't create a new [SettingId], but you can overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the setting. Use the [GetServiceSetting] API operation to view the current value. Or, use the [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web Services service team.
     
      Update the service setting for the account.
       |}]

  
end

