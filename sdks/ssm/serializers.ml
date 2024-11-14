open Smaws_Lib.Json.SerializeHelpers

open Types

let version_to_yojson = string_to_yojson

let valid_next_step_to_yojson = string_to_yojson

let valid_next_step_list_to_yojson = 
  fun tree -> list_to_yojson valid_next_step_to_yojson tree

let url_to_yojson = string_to_yojson

let update_service_setting_result_to_yojson = 
  fun (x: update_service_setting_result) -> assoc_to_yojson(
    [
  ])

let service_setting_id_to_yojson = string_to_yojson

let service_setting_value_to_yojson = string_to_yojson

let update_service_setting_request_to_yojson = 
  fun (x: update_service_setting_request) -> assoc_to_yojson(
    [(
         "SettingValue",
         (Some (service_setting_value_to_yojson x.setting_value)));
       (
         "SettingId",
         (Some (service_setting_id_to_yojson x.setting_id)));
       
  ])

let string__to_yojson = string_to_yojson

let too_many_updates_to_yojson = 
  fun (x: too_many_updates) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let service_setting_not_found_to_yojson = 
  fun (x: service_setting_not_found) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let internal_server_error_to_yojson = 
  fun (x: internal_server_error) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_resource_data_sync_result_to_yojson = 
  fun (x: update_resource_data_sync_result) -> assoc_to_yojson(
    [
  ])

let resource_data_sync_name_to_yojson = string_to_yojson

let resource_data_sync_type_to_yojson = string_to_yojson

let resource_data_sync_source_type_to_yojson = string_to_yojson

let resource_data_sync_organization_source_type_to_yojson = 
  string_to_yojson

let resource_data_sync_organizational_unit_id_to_yojson = string_to_yojson

let resource_data_sync_organizational_unit_to_yojson = 
  fun (x: resource_data_sync_organizational_unit) -> assoc_to_yojson(
    [(
         "OrganizationalUnitId",
         (option_to_yojson resource_data_sync_organizational_unit_id_to_yojson x.organizational_unit_id));
       
  ])

let resource_data_sync_organizational_unit_list_to_yojson = 
  fun tree -> list_to_yojson resource_data_sync_organizational_unit_to_yojson tree

let resource_data_sync_aws_organizations_source_to_yojson = 
  fun (x: resource_data_sync_aws_organizations_source) -> assoc_to_yojson(
    [(
         "OrganizationalUnits",
         (option_to_yojson resource_data_sync_organizational_unit_list_to_yojson x.organizational_units));
       (
         "OrganizationSourceType",
         (Some (resource_data_sync_organization_source_type_to_yojson x.organization_source_type)));
       
  ])

let resource_data_sync_source_region_to_yojson = string_to_yojson

let resource_data_sync_source_region_list_to_yojson = 
  fun tree -> list_to_yojson resource_data_sync_source_region_to_yojson tree

let resource_data_sync_include_future_regions_to_yojson = bool_to_yojson

let resource_data_sync_enable_all_ops_data_sources_to_yojson = 
  bool_to_yojson

let resource_data_sync_source_to_yojson = 
  fun (x: resource_data_sync_source) -> assoc_to_yojson(
    [(
         "EnableAllOpsDataSources",
         (option_to_yojson resource_data_sync_enable_all_ops_data_sources_to_yojson x.enable_all_ops_data_sources));
       (
         "IncludeFutureRegions",
         (option_to_yojson resource_data_sync_include_future_regions_to_yojson x.include_future_regions));
       (
         "SourceRegions",
         (Some (resource_data_sync_source_region_list_to_yojson x.source_regions)));
       (
         "AwsOrganizationsSource",
         (option_to_yojson resource_data_sync_aws_organizations_source_to_yojson x.aws_organizations_source));
       (
         "SourceType",
         (Some (resource_data_sync_source_type_to_yojson x.source_type)));
       
  ])

let update_resource_data_sync_request_to_yojson = 
  fun (x: update_resource_data_sync_request) -> assoc_to_yojson(
    [(
         "SyncSource",
         (Some (resource_data_sync_source_to_yojson x.sync_source)));
       (
         "SyncType",
         (Some (resource_data_sync_type_to_yojson x.sync_type)));
       (
         "SyncName",
         (Some (resource_data_sync_name_to_yojson x.sync_name)));
       
  ])

let resource_data_sync_not_found_exception_to_yojson = 
  fun (x: resource_data_sync_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "SyncType",
         (option_to_yojson resource_data_sync_type_to_yojson x.sync_type));
       (
         "SyncName",
         (option_to_yojson resource_data_sync_name_to_yojson x.sync_name));
       
  ])

let resource_data_sync_invalid_configuration_exception_to_yojson = 
  fun (x: resource_data_sync_invalid_configuration_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let resource_data_sync_conflict_exception_to_yojson = 
  fun (x: resource_data_sync_conflict_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let baseline_id_to_yojson = string_to_yojson

let baseline_name_to_yojson = string_to_yojson

let base_unit_to_yojson = unit_to_yojson

let operating_system_to_yojson = 
  fun (x: operating_system) -> match x with 
 
| AmazonLinux2023 -> `String "AMAZON_LINUX_2023"
  | AlmaLinux -> `String "ALMA_LINUX"
  | Rocky_Linux -> `String "ROCKY_LINUX"
  | Raspbian -> `String "RASPBIAN"
  | MacOS -> `String "MACOS"
  | Debian -> `String "DEBIAN"
  | OracleLinux -> `String "ORACLE_LINUX"
  | CentOS -> `String "CENTOS"
  | Suse -> `String "SUSE"
  | RedhatEnterpriseLinux -> `String "REDHAT_ENTERPRISE_LINUX"
  | Ubuntu -> `String "UBUNTU"
  | AmazonLinux2022 -> `String "AMAZON_LINUX_2022"
  | AmazonLinux2 -> `String "AMAZON_LINUX_2"
  | AmazonLinux -> `String "AMAZON_LINUX"
  | Windows -> `String "WINDOWS"
   

let patch_filter_key_to_yojson = 
  fun (x: patch_filter_key) -> match x with 
 
| Version -> `String "VERSION"
  | Security -> `String "SECURITY"
  | Severity -> `String "SEVERITY"
  | Release -> `String "RELEASE"
  | Repository -> `String "REPOSITORY"
  | Priority -> `String "PRIORITY"
  | Section -> `String "SECTION"
  | PatchId -> `String "PATCH_ID"
  | Name -> `String "NAME"
  | MsrcSeverity -> `String "MSRC_SEVERITY"
  | Epoch -> `String "EPOCH"
  | CVEId -> `String "CVE_ID"
  | Classification -> `String "CLASSIFICATION"
  | ProductFamily -> `String "PRODUCT_FAMILY"
  | Product -> `String "PRODUCT"
  | PatchSet -> `String "PATCH_SET"
  | BugzillaId -> `String "BUGZILLA_ID"
  | AdvisoryId -> `String "ADVISORY_ID"
  | Arch -> `String "ARCH"
   

let patch_filter_value_to_yojson = string_to_yojson

let patch_filter_value_list_to_yojson = 
  fun tree -> list_to_yojson patch_filter_value_to_yojson tree

let patch_filter_to_yojson = 
  fun (x: patch_filter) -> assoc_to_yojson(
    [(
         "Values",
         (Some (patch_filter_value_list_to_yojson x.values)));
       (
         "Key",
         (Some (patch_filter_key_to_yojson x.key)));
       
  ])

let patch_filter_list_to_yojson = 
  fun tree -> list_to_yojson patch_filter_to_yojson tree

let patch_filter_group_to_yojson = 
  fun (x: patch_filter_group) -> assoc_to_yojson(
    [(
         "PatchFilters",
         (Some (patch_filter_list_to_yojson x.patch_filters)));
       
  ])

let patch_compliance_level_to_yojson = 
  fun (x: patch_compliance_level) -> match x with 
 
| Unspecified -> `String "UNSPECIFIED"
  | Informational -> `String "INFORMATIONAL"
  | Low -> `String "LOW"
  | Medium -> `String "MEDIUM"
  | High -> `String "HIGH"
  | Critical -> `String "CRITICAL"
   

let approve_after_days_to_yojson = int_to_yojson

let patch_string_date_time_to_yojson = string_to_yojson

let boolean__to_yojson = bool_to_yojson

let patch_rule_to_yojson = 
  fun (x: patch_rule) -> assoc_to_yojson(
    [(
         "EnableNonSecurity",
         (option_to_yojson boolean__to_yojson x.enable_non_security));
       (
         "ApproveUntilDate",
         (option_to_yojson patch_string_date_time_to_yojson x.approve_until_date));
       (
         "ApproveAfterDays",
         (option_to_yojson approve_after_days_to_yojson x.approve_after_days));
       (
         "ComplianceLevel",
         (option_to_yojson patch_compliance_level_to_yojson x.compliance_level));
       (
         "PatchFilterGroup",
         (Some (patch_filter_group_to_yojson x.patch_filter_group)));
       
  ])

let patch_rule_list_to_yojson = 
  fun tree -> list_to_yojson patch_rule_to_yojson tree

let patch_rule_group_to_yojson = 
  fun (x: patch_rule_group) -> assoc_to_yojson(
    [(
         "PatchRules",
         (Some (patch_rule_list_to_yojson x.patch_rules)));
       
  ])

let patch_id_to_yojson = string_to_yojson

let patch_id_list_to_yojson = 
  fun tree -> list_to_yojson patch_id_to_yojson tree

let patch_action_to_yojson = 
  fun (x: patch_action) -> match x with 
 
| Block -> `String "BLOCK"
  | AllowAsDependency -> `String "ALLOW_AS_DEPENDENCY"
   

let date_time_to_yojson = timestamp_to_yojson

let baseline_description_to_yojson = string_to_yojson

let patch_source_name_to_yojson = string_to_yojson

let patch_source_product_to_yojson = string_to_yojson

let patch_source_product_list_to_yojson = 
  fun tree -> list_to_yojson patch_source_product_to_yojson tree

let patch_source_configuration_to_yojson = string_to_yojson

let patch_source_to_yojson = 
  fun (x: patch_source) -> assoc_to_yojson(
    [(
         "Configuration",
         (Some (patch_source_configuration_to_yojson x.configuration)));
       (
         "Products",
         (Some (patch_source_product_list_to_yojson x.products)));
       (
         "Name",
         (Some (patch_source_name_to_yojson x.name)));
       
  ])

let patch_source_list_to_yojson = 
  fun tree -> list_to_yojson patch_source_to_yojson tree

let update_patch_baseline_result_to_yojson = 
  fun (x: update_patch_baseline_result) -> assoc_to_yojson(
    [(
         "Sources",
         (option_to_yojson patch_source_list_to_yojson x.sources));
       (
         "Description",
         (option_to_yojson baseline_description_to_yojson x.description));
       (
         "ModifiedDate",
         (option_to_yojson date_time_to_yojson x.modified_date));
       (
         "CreatedDate",
         (option_to_yojson date_time_to_yojson x.created_date));
       (
         "RejectedPatchesAction",
         (option_to_yojson patch_action_to_yojson x.rejected_patches_action));
       (
         "RejectedPatches",
         (option_to_yojson patch_id_list_to_yojson x.rejected_patches));
       (
         "ApprovedPatchesEnableNonSecurity",
         (option_to_yojson boolean__to_yojson x.approved_patches_enable_non_security));
       (
         "ApprovedPatchesComplianceLevel",
         (option_to_yojson patch_compliance_level_to_yojson x.approved_patches_compliance_level));
       (
         "ApprovedPatches",
         (option_to_yojson patch_id_list_to_yojson x.approved_patches));
       (
         "ApprovalRules",
         (option_to_yojson patch_rule_group_to_yojson x.approval_rules));
       (
         "GlobalFilters",
         (option_to_yojson patch_filter_group_to_yojson x.global_filters));
       (
         "OperatingSystem",
         (option_to_yojson operating_system_to_yojson x.operating_system));
       (
         "Name",
         (option_to_yojson baseline_name_to_yojson x.name));
       (
         "BaselineId",
         (option_to_yojson baseline_id_to_yojson x.baseline_id));
       
  ])

let update_patch_baseline_request_to_yojson = 
  fun (x: update_patch_baseline_request) -> assoc_to_yojson(
    [(
         "Replace",
         (option_to_yojson boolean__to_yojson x.replace));
       (
         "Sources",
         (option_to_yojson patch_source_list_to_yojson x.sources));
       (
         "Description",
         (option_to_yojson baseline_description_to_yojson x.description));
       (
         "RejectedPatchesAction",
         (option_to_yojson patch_action_to_yojson x.rejected_patches_action));
       (
         "RejectedPatches",
         (option_to_yojson patch_id_list_to_yojson x.rejected_patches));
       (
         "ApprovedPatchesEnableNonSecurity",
         (option_to_yojson boolean__to_yojson x.approved_patches_enable_non_security));
       (
         "ApprovedPatchesComplianceLevel",
         (option_to_yojson patch_compliance_level_to_yojson x.approved_patches_compliance_level));
       (
         "ApprovedPatches",
         (option_to_yojson patch_id_list_to_yojson x.approved_patches));
       (
         "ApprovalRules",
         (option_to_yojson patch_rule_group_to_yojson x.approval_rules));
       (
         "GlobalFilters",
         (option_to_yojson patch_filter_group_to_yojson x.global_filters));
       (
         "Name",
         (option_to_yojson baseline_name_to_yojson x.name));
       (
         "BaselineId",
         (Some (baseline_id_to_yojson x.baseline_id)));
       
  ])

let does_not_exist_exception_to_yojson = 
  fun (x: does_not_exist_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_metadata_arn_to_yojson = string_to_yojson

let update_ops_metadata_result_to_yojson = 
  fun (x: update_ops_metadata_result) -> assoc_to_yojson(
    [(
         "OpsMetadataArn",
         (option_to_yojson ops_metadata_arn_to_yojson x.ops_metadata_arn));
       
  ])

let metadata_value_string_to_yojson = string_to_yojson

let metadata_value_to_yojson = 
  fun (x: metadata_value) -> assoc_to_yojson(
    [(
         "Value",
         (option_to_yojson metadata_value_string_to_yojson x.value));
       
  ])

let metadata_key_to_yojson = string_to_yojson

let metadata_map_to_yojson = 
  fun tree -> map_to_yojson metadata_value_to_yojson tree

let metadata_keys_to_delete_list_to_yojson = 
  fun tree -> list_to_yojson metadata_key_to_yojson tree

let update_ops_metadata_request_to_yojson = 
  fun (x: update_ops_metadata_request) -> assoc_to_yojson(
    [(
         "KeysToDelete",
         (option_to_yojson metadata_keys_to_delete_list_to_yojson x.keys_to_delete));
       (
         "MetadataToUpdate",
         (option_to_yojson metadata_map_to_yojson x.metadata_to_update));
       (
         "OpsMetadataArn",
         (Some (ops_metadata_arn_to_yojson x.ops_metadata_arn)));
       
  ])

let ops_metadata_too_many_updates_exception_to_yojson = 
  fun (x: ops_metadata_too_many_updates_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_metadata_not_found_exception_to_yojson = 
  fun (x: ops_metadata_not_found_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_metadata_key_limit_exceeded_exception_to_yojson = 
  fun (x: ops_metadata_key_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_metadata_invalid_argument_exception_to_yojson = 
  fun (x: ops_metadata_invalid_argument_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_ops_item_response_to_yojson = 
  fun (x: update_ops_item_response) -> assoc_to_yojson(
    [
  ])

let ops_item_description_to_yojson = string_to_yojson

let ops_item_data_value_string_to_yojson = string_to_yojson

let ops_item_data_type_to_yojson = 
  fun (x: ops_item_data_type) -> match x with 
 
| STRING -> `String "String"
  | SEARCHABLE_STRING -> `String "SearchableString"
   

let ops_item_data_value_to_yojson = 
  fun (x: ops_item_data_value) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson ops_item_data_type_to_yojson x.type_));
       (
         "Value",
         (option_to_yojson ops_item_data_value_string_to_yojson x.value));
       
  ])

let ops_item_data_key_to_yojson = string_to_yojson

let ops_item_operational_data_to_yojson = 
  fun tree -> map_to_yojson ops_item_data_value_to_yojson tree

let ops_item_ops_data_keys_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let ops_item_notification_to_yojson = 
  fun (x: ops_item_notification) -> assoc_to_yojson(
    [(
         "Arn",
         (option_to_yojson string__to_yojson x.arn));
       
  ])

let ops_item_notifications_to_yojson = 
  fun tree -> list_to_yojson ops_item_notification_to_yojson tree

let ops_item_priority_to_yojson = int_to_yojson

let related_ops_item_to_yojson = 
  fun (x: related_ops_item) -> assoc_to_yojson(
    [(
         "OpsItemId",
         (Some (string__to_yojson x.ops_item_id)));
       
  ])

let related_ops_items_to_yojson = 
  fun tree -> list_to_yojson related_ops_item_to_yojson tree

let ops_item_status_to_yojson = 
  fun (x: ops_item_status) -> match x with 
 
| CLOSED -> `String "Closed"
  | REJECTED -> `String "Rejected"
  | APPROVED -> `String "Approved"
  | PENDING_APPROVAL -> `String "PendingApproval"
  | CHANGE_CALENDAR_OVERRIDE_REJECTED -> `String "ChangeCalendarOverrideRejected"
  | CHANGE_CALENDAR_OVERRIDE_APPROVED -> `String "ChangeCalendarOverrideApproved"
  | PENDING_CHANGE_CALENDAR_OVERRIDE -> `String "PendingChangeCalendarOverride"
  | RUNBOOK_IN_PROGRESS -> `String "RunbookInProgress"
  | SCHEDULED -> `String "Scheduled"
  | COMPLETED_WITH_FAILURE -> `String "CompletedWithFailure"
  | COMPLETED_WITH_SUCCESS -> `String "CompletedWithSuccess"
  | FAILED -> `String "Failed"
  | CANCELLED -> `String "Cancelled"
  | CANCELLING -> `String "Cancelling"
  | TIMED_OUT -> `String "TimedOut"
  | PENDING -> `String "Pending"
  | RESOLVED -> `String "Resolved"
  | IN_PROGRESS -> `String "InProgress"
  | OPEN -> `String "Open"
   

let ops_item_id_to_yojson = string_to_yojson

let ops_item_title_to_yojson = string_to_yojson

let ops_item_category_to_yojson = string_to_yojson

let ops_item_severity_to_yojson = string_to_yojson

let ops_item_arn_to_yojson = string_to_yojson

let update_ops_item_request_to_yojson = 
  fun (x: update_ops_item_request) -> assoc_to_yojson(
    [(
         "OpsItemArn",
         (option_to_yojson ops_item_arn_to_yojson x.ops_item_arn));
       (
         "PlannedEndTime",
         (option_to_yojson date_time_to_yojson x.planned_end_time));
       (
         "PlannedStartTime",
         (option_to_yojson date_time_to_yojson x.planned_start_time));
       (
         "ActualEndTime",
         (option_to_yojson date_time_to_yojson x.actual_end_time));
       (
         "ActualStartTime",
         (option_to_yojson date_time_to_yojson x.actual_start_time));
       (
         "Severity",
         (option_to_yojson ops_item_severity_to_yojson x.severity));
       (
         "Category",
         (option_to_yojson ops_item_category_to_yojson x.category));
       (
         "Title",
         (option_to_yojson ops_item_title_to_yojson x.title));
       (
         "OpsItemId",
         (Some (ops_item_id_to_yojson x.ops_item_id)));
       (
         "Status",
         (option_to_yojson ops_item_status_to_yojson x.status));
       (
         "RelatedOpsItems",
         (option_to_yojson related_ops_items_to_yojson x.related_ops_items));
       (
         "Priority",
         (option_to_yojson ops_item_priority_to_yojson x.priority));
       (
         "Notifications",
         (option_to_yojson ops_item_notifications_to_yojson x.notifications));
       (
         "OperationalDataToDelete",
         (option_to_yojson ops_item_ops_data_keys_list_to_yojson x.operational_data_to_delete));
       (
         "OperationalData",
         (option_to_yojson ops_item_operational_data_to_yojson x.operational_data));
       (
         "Description",
         (option_to_yojson ops_item_description_to_yojson x.description));
       
  ])

let ops_item_not_found_exception_to_yojson = 
  fun (x: ops_item_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_item_parameter_names_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let integer__to_yojson = int_to_yojson

let ops_item_limit_exceeded_exception_to_yojson = 
  fun (x: ops_item_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "LimitType",
         (option_to_yojson string__to_yojson x.limit_type));
       (
         "Limit",
         (option_to_yojson integer__to_yojson x.limit));
       (
         "ResourceTypes",
         (option_to_yojson ops_item_parameter_names_list_to_yojson x.resource_types));
       
  ])

let ops_item_invalid_parameter_exception_to_yojson = 
  fun (x: ops_item_invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "ParameterNames",
         (option_to_yojson ops_item_parameter_names_list_to_yojson x.parameter_names));
       
  ])

let ops_item_conflict_exception_to_yojson = 
  fun (x: ops_item_conflict_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_item_already_exists_exception_to_yojson = 
  fun (x: ops_item_already_exists_exception) -> assoc_to_yojson(
    [(
         "OpsItemId",
         (option_to_yojson string__to_yojson x.ops_item_id));
       (
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_item_access_denied_exception_to_yojson = 
  fun (x: ops_item_access_denied_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_managed_instance_role_result_to_yojson = 
  fun (x: update_managed_instance_role_result) -> assoc_to_yojson(
    [
  ])

let managed_instance_id_to_yojson = string_to_yojson

let iam_role_to_yojson = string_to_yojson

let update_managed_instance_role_request_to_yojson = 
  fun (x: update_managed_instance_role_request) -> assoc_to_yojson(
    [(
         "IamRole",
         (Some (iam_role_to_yojson x.iam_role)));
       (
         "InstanceId",
         (Some (managed_instance_id_to_yojson x.instance_id)));
       
  ])

let invalid_instance_id_to_yojson = 
  fun (x: invalid_instance_id) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let maintenance_window_id_to_yojson = string_to_yojson

let maintenance_window_task_id_to_yojson = string_to_yojson

let target_key_to_yojson = string_to_yojson

let target_value_to_yojson = string_to_yojson

let target_values_to_yojson = 
  fun tree -> list_to_yojson target_value_to_yojson tree

let target_to_yojson = 
  fun (x: target) -> assoc_to_yojson(
    [(
         "Values",
         (option_to_yojson target_values_to_yojson x.values));
       (
         "Key",
         (option_to_yojson target_key_to_yojson x.key));
       
  ])

let targets_to_yojson = fun tree -> list_to_yojson target_to_yojson tree

let maintenance_window_task_arn_to_yojson = string_to_yojson

let service_role_to_yojson = string_to_yojson

let maintenance_window_task_parameter_value_to_yojson = string_to_yojson

let maintenance_window_task_parameter_value_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_task_parameter_value_to_yojson tree

let maintenance_window_task_parameter_value_expression_to_yojson = 
  fun (x: maintenance_window_task_parameter_value_expression) -> assoc_to_yojson(
    [(
         "Values",
         (option_to_yojson maintenance_window_task_parameter_value_list_to_yojson x.values));
       
  ])

let maintenance_window_task_parameter_name_to_yojson = string_to_yojson

let maintenance_window_task_parameters_to_yojson = 
  fun tree -> map_to_yojson maintenance_window_task_parameter_value_expression_to_yojson tree

let comment_to_yojson = string_to_yojson

let cloud_watch_log_group_name_to_yojson = string_to_yojson

let cloud_watch_output_enabled_to_yojson = bool_to_yojson

let cloud_watch_output_config_to_yojson = 
  fun (x: cloud_watch_output_config) -> assoc_to_yojson(
    [(
         "CloudWatchOutputEnabled",
         (option_to_yojson cloud_watch_output_enabled_to_yojson x.cloud_watch_output_enabled));
       (
         "CloudWatchLogGroupName",
         (option_to_yojson cloud_watch_log_group_name_to_yojson x.cloud_watch_log_group_name));
       
  ])

let document_hash_to_yojson = string_to_yojson

let document_hash_type_to_yojson = 
  fun (x: document_hash_type) -> match x with 
  | SHA1 -> `String "Sha1"
    | SHA256 -> `String "Sha256"
     

let document_version_to_yojson = string_to_yojson

let notification_arn_to_yojson = string_to_yojson

let notification_event_to_yojson = 
  fun (x: notification_event) -> match x with 
 
| FAILED -> `String "Failed"
  | CANCELLED -> `String "Cancelled"
  | TIMED_OUT -> `String "TimedOut"
  | SUCCESS -> `String "Success"
  | IN_PROGRESS -> `String "InProgress"
  | ALL -> `String "All"
   

let notification_event_list_to_yojson = 
  fun tree -> list_to_yojson notification_event_to_yojson tree

let notification_type_to_yojson = 
  fun (x: notification_type) -> match x with 
  | Invocation -> `String "Invocation"
    | Command -> `String "Command"
     

let notification_config_to_yojson = 
  fun (x: notification_config) -> assoc_to_yojson(
    [(
         "NotificationType",
         (option_to_yojson notification_type_to_yojson x.notification_type));
       (
         "NotificationEvents",
         (option_to_yojson notification_event_list_to_yojson x.notification_events));
       (
         "NotificationArn",
         (option_to_yojson notification_arn_to_yojson x.notification_arn));
       
  ])

let s3_bucket_name_to_yojson = string_to_yojson

let s3_key_prefix_to_yojson = string_to_yojson

let parameter_value_to_yojson = string_to_yojson

let parameter_value_list_to_yojson = 
  fun tree -> list_to_yojson parameter_value_to_yojson tree

let parameter_name_to_yojson = string_to_yojson

let parameters_to_yojson = 
  fun tree -> map_to_yojson parameter_value_list_to_yojson tree

let timeout_seconds_to_yojson = int_to_yojson

let maintenance_window_run_command_parameters_to_yojson = 
  fun (x: maintenance_window_run_command_parameters) -> assoc_to_yojson(
    [(
         "TimeoutSeconds",
         (option_to_yojson timeout_seconds_to_yojson x.timeout_seconds));
       (
         "ServiceRoleArn",
         (option_to_yojson service_role_to_yojson x.service_role_arn));
       (
         "Parameters",
         (option_to_yojson parameters_to_yojson x.parameters));
       (
         "OutputS3KeyPrefix",
         (option_to_yojson s3_key_prefix_to_yojson x.output_s3_key_prefix));
       (
         "OutputS3BucketName",
         (option_to_yojson s3_bucket_name_to_yojson x.output_s3_bucket_name));
       (
         "NotificationConfig",
         (option_to_yojson notification_config_to_yojson x.notification_config));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DocumentHashType",
         (option_to_yojson document_hash_type_to_yojson x.document_hash_type));
       (
         "DocumentHash",
         (option_to_yojson document_hash_to_yojson x.document_hash));
       (
         "CloudWatchOutputConfig",
         (option_to_yojson cloud_watch_output_config_to_yojson x.cloud_watch_output_config));
       (
         "Comment",
         (option_to_yojson comment_to_yojson x.comment));
       
  ])

let automation_parameter_value_to_yojson = string_to_yojson

let automation_parameter_value_list_to_yojson = 
  fun tree -> list_to_yojson automation_parameter_value_to_yojson tree

let automation_parameter_key_to_yojson = string_to_yojson

let automation_parameter_map_to_yojson = 
  fun tree -> map_to_yojson automation_parameter_value_list_to_yojson tree

let maintenance_window_automation_parameters_to_yojson = 
  fun (x: maintenance_window_automation_parameters) -> assoc_to_yojson(
    [(
         "Parameters",
         (option_to_yojson automation_parameter_map_to_yojson x.parameters));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       
  ])

let maintenance_window_step_functions_input_to_yojson = string_to_yojson

let maintenance_window_step_functions_name_to_yojson = string_to_yojson

let maintenance_window_step_functions_parameters_to_yojson = 
  fun (x: maintenance_window_step_functions_parameters) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson maintenance_window_step_functions_name_to_yojson x.name));
       (
         "Input",
         (option_to_yojson maintenance_window_step_functions_input_to_yojson x.input));
       
  ])

let maintenance_window_lambda_client_context_to_yojson = string_to_yojson

let maintenance_window_lambda_qualifier_to_yojson = string_to_yojson

let maintenance_window_lambda_payload_to_yojson = blob_to_yojson

let maintenance_window_lambda_parameters_to_yojson = 
  fun (x: maintenance_window_lambda_parameters) -> assoc_to_yojson(
    [(
         "Payload",
         (option_to_yojson maintenance_window_lambda_payload_to_yojson x.payload));
       (
         "Qualifier",
         (option_to_yojson maintenance_window_lambda_qualifier_to_yojson x.qualifier));
       (
         "ClientContext",
         (option_to_yojson maintenance_window_lambda_client_context_to_yojson x.client_context));
       
  ])

let maintenance_window_task_invocation_parameters_to_yojson = 
  fun (x: maintenance_window_task_invocation_parameters) -> assoc_to_yojson(
    [(
         "Lambda",
         (option_to_yojson maintenance_window_lambda_parameters_to_yojson x.lambda));
       (
         "StepFunctions",
         (option_to_yojson maintenance_window_step_functions_parameters_to_yojson x.step_functions));
       (
         "Automation",
         (option_to_yojson maintenance_window_automation_parameters_to_yojson x.automation));
       (
         "RunCommand",
         (option_to_yojson maintenance_window_run_command_parameters_to_yojson x.run_command));
       
  ])

let maintenance_window_task_priority_to_yojson = int_to_yojson

let max_concurrency_to_yojson = string_to_yojson

let max_errors_to_yojson = string_to_yojson

let s3_region_to_yojson = string_to_yojson

let logging_info_to_yojson = 
  fun (x: logging_info) -> assoc_to_yojson(
    [(
         "S3Region",
         (Some (s3_region_to_yojson x.s3_region)));
       (
         "S3KeyPrefix",
         (option_to_yojson s3_key_prefix_to_yojson x.s3_key_prefix));
       (
         "S3BucketName",
         (Some (s3_bucket_name_to_yojson x.s3_bucket_name)));
       
  ])

let maintenance_window_name_to_yojson = string_to_yojson

let maintenance_window_description_to_yojson = string_to_yojson

let maintenance_window_task_cutoff_behavior_to_yojson = 
  fun (x: maintenance_window_task_cutoff_behavior) -> match x with 
 
| CancelTask -> `String "CANCEL_TASK"
  | ContinueTask -> `String "CONTINUE_TASK"
   

let alarm_name_to_yojson = string_to_yojson

let alarm_to_yojson = 
  fun (x: alarm) -> assoc_to_yojson(
    [(
         "Name",
         (Some (alarm_name_to_yojson x.name)));
       
  ])

let alarm_list_to_yojson = fun tree -> list_to_yojson alarm_to_yojson tree

let alarm_configuration_to_yojson = 
  fun (x: alarm_configuration) -> assoc_to_yojson(
    [(
         "Alarms",
         (Some (alarm_list_to_yojson x.alarms)));
       (
         "IgnorePollAlarmFailure",
         (option_to_yojson boolean__to_yojson x.ignore_poll_alarm_failure));
       
  ])

let update_maintenance_window_task_result_to_yojson = 
  fun (x: update_maintenance_window_task_result) -> assoc_to_yojson(
    [(
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "CutoffBehavior",
         (option_to_yojson maintenance_window_task_cutoff_behavior_to_yojson x.cutoff_behavior));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "LoggingInfo",
         (option_to_yojson logging_info_to_yojson x.logging_info));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "Priority",
         (option_to_yojson maintenance_window_task_priority_to_yojson x.priority));
       (
         "TaskInvocationParameters",
         (option_to_yojson maintenance_window_task_invocation_parameters_to_yojson x.task_invocation_parameters));
       (
         "TaskParameters",
         (option_to_yojson maintenance_window_task_parameters_to_yojson x.task_parameters));
       (
         "ServiceRoleArn",
         (option_to_yojson service_role_to_yojson x.service_role_arn));
       (
         "TaskArn",
         (option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "WindowTaskId",
         (option_to_yojson maintenance_window_task_id_to_yojson x.window_task_id));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let update_maintenance_window_task_request_to_yojson = 
  fun (x: update_maintenance_window_task_request) -> assoc_to_yojson(
    [(
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "CutoffBehavior",
         (option_to_yojson maintenance_window_task_cutoff_behavior_to_yojson x.cutoff_behavior));
       (
         "Replace",
         (option_to_yojson boolean__to_yojson x.replace));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "LoggingInfo",
         (option_to_yojson logging_info_to_yojson x.logging_info));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "Priority",
         (option_to_yojson maintenance_window_task_priority_to_yojson x.priority));
       (
         "TaskInvocationParameters",
         (option_to_yojson maintenance_window_task_invocation_parameters_to_yojson x.task_invocation_parameters));
       (
         "TaskParameters",
         (option_to_yojson maintenance_window_task_parameters_to_yojson x.task_parameters));
       (
         "ServiceRoleArn",
         (option_to_yojson service_role_to_yojson x.service_role_arn));
       (
         "TaskArn",
         (option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "WindowTaskId",
         (Some (maintenance_window_task_id_to_yojson x.window_task_id)));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let maintenance_window_target_id_to_yojson = string_to_yojson

let owner_information_to_yojson = string_to_yojson

let update_maintenance_window_target_result_to_yojson = 
  fun (x: update_maintenance_window_target_result) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "OwnerInformation",
         (option_to_yojson owner_information_to_yojson x.owner_information));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "WindowTargetId",
         (option_to_yojson maintenance_window_target_id_to_yojson x.window_target_id));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let update_maintenance_window_target_request_to_yojson = 
  fun (x: update_maintenance_window_target_request) -> assoc_to_yojson(
    [(
         "Replace",
         (option_to_yojson boolean__to_yojson x.replace));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "OwnerInformation",
         (option_to_yojson owner_information_to_yojson x.owner_information));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "WindowTargetId",
         (Some (maintenance_window_target_id_to_yojson x.window_target_id)));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let maintenance_window_string_date_time_to_yojson = string_to_yojson

let maintenance_window_schedule_to_yojson = string_to_yojson

let maintenance_window_timezone_to_yojson = string_to_yojson

let maintenance_window_offset_to_yojson = int_to_yojson

let maintenance_window_duration_hours_to_yojson = int_to_yojson

let maintenance_window_cutoff_to_yojson = int_to_yojson

let maintenance_window_allow_unassociated_targets_to_yojson = 
  bool_to_yojson

let maintenance_window_enabled_to_yojson = bool_to_yojson

let update_maintenance_window_result_to_yojson = 
  fun (x: update_maintenance_window_result) -> assoc_to_yojson(
    [(
         "Enabled",
         (option_to_yojson maintenance_window_enabled_to_yojson x.enabled));
       (
         "AllowUnassociatedTargets",
         (option_to_yojson maintenance_window_allow_unassociated_targets_to_yojson x.allow_unassociated_targets));
       (
         "Cutoff",
         (option_to_yojson maintenance_window_cutoff_to_yojson x.cutoff));
       (
         "Duration",
         (option_to_yojson maintenance_window_duration_hours_to_yojson x.duration));
       (
         "ScheduleOffset",
         (option_to_yojson maintenance_window_offset_to_yojson x.schedule_offset));
       (
         "ScheduleTimezone",
         (option_to_yojson maintenance_window_timezone_to_yojson x.schedule_timezone));
       (
         "Schedule",
         (option_to_yojson maintenance_window_schedule_to_yojson x.schedule));
       (
         "EndDate",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.end_date));
       (
         "StartDate",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.start_date));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let update_maintenance_window_request_to_yojson = 
  fun (x: update_maintenance_window_request) -> assoc_to_yojson(
    [(
         "Replace",
         (option_to_yojson boolean__to_yojson x.replace));
       (
         "Enabled",
         (option_to_yojson maintenance_window_enabled_to_yojson x.enabled));
       (
         "AllowUnassociatedTargets",
         (option_to_yojson maintenance_window_allow_unassociated_targets_to_yojson x.allow_unassociated_targets));
       (
         "Cutoff",
         (option_to_yojson maintenance_window_cutoff_to_yojson x.cutoff));
       (
         "Duration",
         (option_to_yojson maintenance_window_duration_hours_to_yojson x.duration));
       (
         "ScheduleOffset",
         (option_to_yojson maintenance_window_offset_to_yojson x.schedule_offset));
       (
         "ScheduleTimezone",
         (option_to_yojson maintenance_window_timezone_to_yojson x.schedule_timezone));
       (
         "Schedule",
         (option_to_yojson maintenance_window_schedule_to_yojson x.schedule));
       (
         "EndDate",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.end_date));
       (
         "StartDate",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.start_date));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let document_sha1_to_yojson = string_to_yojson

let document_ar_n_to_yojson = string_to_yojson

let document_display_name_to_yojson = string_to_yojson

let document_version_name_to_yojson = string_to_yojson

let document_owner_to_yojson = string_to_yojson

let document_status_to_yojson = 
  fun (x: document_status) -> match x with 
 
| Failed -> `String "Failed"
  | Deleting -> `String "Deleting"
  | Updating -> `String "Updating"
  | Active -> `String "Active"
  | Creating -> `String "Creating"
   

let document_status_information_to_yojson = string_to_yojson

let description_in_document_to_yojson = string_to_yojson

let document_parameter_name_to_yojson = string_to_yojson

let document_parameter_type_to_yojson = 
  fun (x: document_parameter_type) -> match x with 
  | StringList -> `String "StringList"
    | String -> `String "String"
     

let document_parameter_descrption_to_yojson = string_to_yojson

let document_parameter_default_value_to_yojson = string_to_yojson

let document_parameter_to_yojson = 
  fun (x: document_parameter) -> assoc_to_yojson(
    [(
         "DefaultValue",
         (option_to_yojson document_parameter_default_value_to_yojson x.default_value));
       (
         "Description",
         (option_to_yojson document_parameter_descrption_to_yojson x.description));
       (
         "Type",
         (option_to_yojson document_parameter_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson document_parameter_name_to_yojson x.name));
       
  ])

let document_parameter_list_to_yojson = 
  fun tree -> list_to_yojson document_parameter_to_yojson tree

let platform_type_to_yojson = 
  fun (x: platform_type) -> match x with 
 
| MACOS -> `String "MacOS"
  | LINUX -> `String "Linux"
  | WINDOWS -> `String "Windows"
   

let platform_type_list_to_yojson = 
  fun tree -> list_to_yojson platform_type_to_yojson tree

let document_type_to_yojson = 
  fun (x: document_type) -> match x with 
 
| QuickSetup -> `String "QuickSetup"
  | ConformancePackTemplate -> `String "ConformancePackTemplate"
  | CloudFormation -> `String "CloudFormation"
  | ProblemAnalysisTemplate -> `String "ProblemAnalysisTemplate"
  | ProblemAnalysis -> `String "ProblemAnalysis"
  | ChangeTemplate -> `String "Automation.ChangeTemplate"
  | ChangeCalendar -> `String "ChangeCalendar"
  | DeploymentStrategy -> `String "DeploymentStrategy"
  | ApplicationConfigurationSchema -> `String "ApplicationConfigurationSchema"
  | ApplicationConfiguration -> `String "ApplicationConfiguration"
  | Package -> `String "Package"
  | Session -> `String "Session"
  | Automation -> `String "Automation"
  | Policy -> `String "Policy"
  | Command -> `String "Command"
   

let document_schema_version_to_yojson = string_to_yojson

let document_format_to_yojson = 
  fun (x: document_format) -> match x with 
  | TEXT -> `String "TEXT"
    | JSON -> `String "JSON"
    | YAML -> `String "YAML"
     

let target_type_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "Value",
         (Some (tag_value_to_yojson x.value)));
       (
         "Key",
         (Some (tag_key_to_yojson x.key)));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let attachment_name_to_yojson = string_to_yojson

let attachment_information_to_yojson = 
  fun (x: attachment_information) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson attachment_name_to_yojson x.name));
       
  ])

let attachment_information_list_to_yojson = 
  fun tree -> list_to_yojson attachment_information_to_yojson tree

let require_type_to_yojson = string_to_yojson

let document_requires_to_yojson = 
  fun (x: document_requires) -> assoc_to_yojson(
    [(
         "VersionName",
         (option_to_yojson document_version_name_to_yojson x.version_name));
       (
         "RequireType",
         (option_to_yojson require_type_to_yojson x.require_type));
       (
         "Version",
         (option_to_yojson document_version_to_yojson x.version));
       (
         "Name",
         (Some (document_ar_n_to_yojson x.name)));
       
  ])

let document_requires_list_to_yojson = 
  fun tree -> list_to_yojson document_requires_to_yojson tree

let document_author_to_yojson = string_to_yojson

let review_status_to_yojson = 
  fun (x: review_status) -> match x with 
 
| REJECTED -> `String "REJECTED"
  | PENDING -> `String "PENDING"
  | NOT_REVIEWED -> `String "NOT_REVIEWED"
  | APPROVED -> `String "APPROVED"
   

let reviewer_to_yojson = string_to_yojson

let review_information_to_yojson = 
  fun (x: review_information) -> assoc_to_yojson(
    [(
         "Reviewer",
         (option_to_yojson reviewer_to_yojson x.reviewer));
       (
         "Status",
         (option_to_yojson review_status_to_yojson x.status));
       (
         "ReviewedTime",
         (option_to_yojson date_time_to_yojson x.reviewed_time));
       
  ])

let review_information_list_to_yojson = 
  fun tree -> list_to_yojson review_information_to_yojson tree

let category_to_yojson = string_to_yojson

let category_list_to_yojson = 
  fun tree -> list_to_yojson category_to_yojson tree

let category_enum_list_to_yojson = 
  fun tree -> list_to_yojson category_to_yojson tree

let document_description_to_yojson = 
  fun (x: document_description) -> assoc_to_yojson(
    [(
         "CategoryEnum",
         (option_to_yojson category_enum_list_to_yojson x.category_enum));
       (
         "Category",
         (option_to_yojson category_list_to_yojson x.category));
       (
         "ReviewStatus",
         (option_to_yojson review_status_to_yojson x.review_status));
       (
         "PendingReviewVersion",
         (option_to_yojson document_version_to_yojson x.pending_review_version));
       (
         "ApprovedVersion",
         (option_to_yojson document_version_to_yojson x.approved_version));
       (
         "ReviewInformation",
         (option_to_yojson review_information_list_to_yojson x.review_information));
       (
         "Author",
         (option_to_yojson document_author_to_yojson x.author));
       (
         "Requires",
         (option_to_yojson document_requires_list_to_yojson x.requires));
       (
         "AttachmentsInformation",
         (option_to_yojson attachment_information_list_to_yojson x.attachments_information));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "TargetType",
         (option_to_yojson target_type_to_yojson x.target_type));
       (
         "DocumentFormat",
         (option_to_yojson document_format_to_yojson x.document_format));
       (
         "DefaultVersion",
         (option_to_yojson document_version_to_yojson x.default_version));
       (
         "LatestVersion",
         (option_to_yojson document_version_to_yojson x.latest_version));
       (
         "SchemaVersion",
         (option_to_yojson document_schema_version_to_yojson x.schema_version));
       (
         "DocumentType",
         (option_to_yojson document_type_to_yojson x.document_type));
       (
         "PlatformTypes",
         (option_to_yojson platform_type_list_to_yojson x.platform_types));
       (
         "Parameters",
         (option_to_yojson document_parameter_list_to_yojson x.parameters));
       (
         "Description",
         (option_to_yojson description_in_document_to_yojson x.description));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "StatusInformation",
         (option_to_yojson document_status_information_to_yojson x.status_information));
       (
         "Status",
         (option_to_yojson document_status_to_yojson x.status));
       (
         "CreatedDate",
         (option_to_yojson date_time_to_yojson x.created_date));
       (
         "Owner",
         (option_to_yojson document_owner_to_yojson x.owner));
       (
         "VersionName",
         (option_to_yojson document_version_name_to_yojson x.version_name));
       (
         "DisplayName",
         (option_to_yojson document_display_name_to_yojson x.display_name));
       (
         "Name",
         (option_to_yojson document_ar_n_to_yojson x.name));
       (
         "HashType",
         (option_to_yojson document_hash_type_to_yojson x.hash_type));
       (
         "Hash",
         (option_to_yojson document_hash_to_yojson x.hash));
       (
         "Sha1",
         (option_to_yojson document_sha1_to_yojson x.sha1));
       
  ])

let update_document_result_to_yojson = 
  fun (x: update_document_result) -> assoc_to_yojson(
    [(
         "DocumentDescription",
         (option_to_yojson document_description_to_yojson x.document_description));
       
  ])

let document_content_to_yojson = string_to_yojson

let attachments_source_key_to_yojson = 
  fun (x: attachments_source_key) -> match x with 
 
| AttachmentReference -> `String "AttachmentReference"
  | S3FileUrl -> `String "S3FileUrl"
  | SourceUrl -> `String "SourceUrl"
   

let attachments_source_value_to_yojson = string_to_yojson

let attachments_source_values_to_yojson = 
  fun tree -> list_to_yojson attachments_source_value_to_yojson tree

let attachment_identifier_to_yojson = string_to_yojson

let attachments_source_to_yojson = 
  fun (x: attachments_source) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson attachment_identifier_to_yojson x.name));
       (
         "Values",
         (option_to_yojson attachments_source_values_to_yojson x.values));
       (
         "Key",
         (option_to_yojson attachments_source_key_to_yojson x.key));
       
  ])

let attachments_source_list_to_yojson = 
  fun tree -> list_to_yojson attachments_source_to_yojson tree

let document_name_to_yojson = string_to_yojson

let update_document_request_to_yojson = 
  fun (x: update_document_request) -> assoc_to_yojson(
    [(
         "TargetType",
         (option_to_yojson target_type_to_yojson x.target_type));
       (
         "DocumentFormat",
         (option_to_yojson document_format_to_yojson x.document_format));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "VersionName",
         (option_to_yojson document_version_name_to_yojson x.version_name));
       (
         "DisplayName",
         (option_to_yojson document_display_name_to_yojson x.display_name));
       (
         "Name",
         (Some (document_name_to_yojson x.name)));
       (
         "Attachments",
         (option_to_yojson attachments_source_list_to_yojson x.attachments));
       (
         "Content",
         (Some (document_content_to_yojson x.content)));
       
  ])

let update_document_metadata_response_to_yojson = 
  fun (x: update_document_metadata_response) -> assoc_to_yojson(
    [
  ])

let document_review_action_to_yojson = 
  fun (x: document_review_action) -> match x with 
 
| Reject -> `String "Reject"
  | Approve -> `String "Approve"
  | UpdateReview -> `String "UpdateReview"
  | SendForReview -> `String "SendForReview"
   

let document_review_comment_type_to_yojson = 
  fun (x: document_review_comment_type) -> match x with 
  | Comment -> `String "Comment"
     

let document_review_comment_to_yojson = string_to_yojson

let document_review_comment_source_to_yojson = 
  fun (x: document_review_comment_source) -> assoc_to_yojson(
    [(
         "Content",
         (option_to_yojson document_review_comment_to_yojson x.content));
       (
         "Type",
         (option_to_yojson document_review_comment_type_to_yojson x.type_));
       
  ])

let document_review_comment_list_to_yojson = 
  fun tree -> list_to_yojson document_review_comment_source_to_yojson tree

let document_reviews_to_yojson = 
  fun (x: document_reviews) -> assoc_to_yojson(
    [(
         "Comment",
         (option_to_yojson document_review_comment_list_to_yojson x.comment));
       (
         "Action",
         (Some (document_review_action_to_yojson x.action)));
       
  ])

let update_document_metadata_request_to_yojson = 
  fun (x: update_document_metadata_request) -> assoc_to_yojson(
    [(
         "DocumentReviews",
         (Some (document_reviews_to_yojson x.document_reviews)));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "Name",
         (Some (document_name_to_yojson x.name)));
       
  ])

let invalid_document_version_to_yojson = 
  fun (x: invalid_document_version) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_document_operation_to_yojson = 
  fun (x: invalid_document_operation) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_document_to_yojson = 
  fun (x: invalid_document) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let document_default_version_description_to_yojson = 
  fun (x: document_default_version_description) -> assoc_to_yojson(
    [(
         "DefaultVersionName",
         (option_to_yojson document_version_name_to_yojson x.default_version_name));
       (
         "DefaultVersion",
         (option_to_yojson document_version_to_yojson x.default_version));
       (
         "Name",
         (option_to_yojson document_name_to_yojson x.name));
       
  ])

let update_document_default_version_result_to_yojson = 
  fun (x: update_document_default_version_result) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson document_default_version_description_to_yojson x.description));
       
  ])

let document_version_number_to_yojson = string_to_yojson

let update_document_default_version_request_to_yojson = 
  fun (x: update_document_default_version_request) -> assoc_to_yojson(
    [(
         "DocumentVersion",
         (Some (document_version_number_to_yojson x.document_version)));
       (
         "Name",
         (Some (document_name_to_yojson x.name)));
       
  ])

let invalid_document_schema_version_to_yojson = 
  fun (x: invalid_document_schema_version) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let max_document_size_exceeded_to_yojson = 
  fun (x: max_document_size_exceeded) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_document_content_to_yojson = 
  fun (x: invalid_document_content) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let duplicate_document_version_name_to_yojson = 
  fun (x: duplicate_document_version_name) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let duplicate_document_content_to_yojson = 
  fun (x: duplicate_document_content) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let document_version_limit_exceeded_to_yojson = 
  fun (x: document_version_limit_exceeded) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let instance_id_to_yojson = string_to_yojson

let association_version_to_yojson = string_to_yojson

let association_status_name_to_yojson = 
  fun (x: association_status_name) -> match x with 
 
| Failed -> `String "Failed"
  | Success -> `String "Success"
  | Pending -> `String "Pending"
   

let status_message_to_yojson = string_to_yojson

let status_additional_info_to_yojson = string_to_yojson

let association_status_to_yojson = 
  fun (x: association_status) -> assoc_to_yojson(
    [(
         "AdditionalInfo",
         (option_to_yojson status_additional_info_to_yojson x.additional_info));
       (
         "Message",
         (Some (status_message_to_yojson x.message)));
       (
         "Name",
         (Some (association_status_name_to_yojson x.name)));
       (
         "Date",
         (Some (date_time_to_yojson x.date)));
       
  ])

let status_name_to_yojson = string_to_yojson

let instance_count_to_yojson = int_to_yojson

let association_status_aggregated_count_to_yojson = 
  fun tree -> map_to_yojson instance_count_to_yojson tree

let association_overview_to_yojson = 
  fun (x: association_overview) -> assoc_to_yojson(
    [(
         "AssociationStatusAggregatedCount",
         (option_to_yojson association_status_aggregated_count_to_yojson x.association_status_aggregated_count));
       (
         "DetailedStatus",
         (option_to_yojson status_name_to_yojson x.detailed_status));
       (
         "Status",
         (option_to_yojson status_name_to_yojson x.status));
       
  ])

let automation_target_parameter_name_to_yojson = string_to_yojson

let association_id_to_yojson = string_to_yojson

let schedule_expression_to_yojson = string_to_yojson

let s3_output_location_to_yojson = 
  fun (x: s3_output_location) -> assoc_to_yojson(
    [(
         "OutputS3KeyPrefix",
         (option_to_yojson s3_key_prefix_to_yojson x.output_s3_key_prefix));
       (
         "OutputS3BucketName",
         (option_to_yojson s3_bucket_name_to_yojson x.output_s3_bucket_name));
       (
         "OutputS3Region",
         (option_to_yojson s3_region_to_yojson x.output_s3_region));
       
  ])

let instance_association_output_location_to_yojson = 
  fun (x: instance_association_output_location) -> assoc_to_yojson(
    [(
         "S3Location",
         (option_to_yojson s3_output_location_to_yojson x.s3_location));
       
  ])

let association_name_to_yojson = string_to_yojson

let association_compliance_severity_to_yojson = 
  fun (x: association_compliance_severity) -> match x with 
 
| Unspecified -> `String "UNSPECIFIED"
  | Low -> `String "LOW"
  | Medium -> `String "MEDIUM"
  | High -> `String "HIGH"
  | Critical -> `String "CRITICAL"
   

let association_sync_compliance_to_yojson = 
  fun (x: association_sync_compliance) -> match x with 
  | Manual -> `String "MANUAL"
    | Auto -> `String "AUTO"
     

let apply_only_at_cron_interval_to_yojson = bool_to_yojson

let calendar_name_or_ar_n_to_yojson = string_to_yojson

let calendar_name_or_arn_list_to_yojson = 
  fun tree -> list_to_yojson calendar_name_or_ar_n_to_yojson tree

let account_to_yojson = string_to_yojson

let accounts_to_yojson = fun tree -> list_to_yojson account_to_yojson tree

let region_to_yojson = string_to_yojson

let regions_to_yojson = fun tree -> list_to_yojson region_to_yojson tree

let execution_role_name_to_yojson = string_to_yojson

let target_location_to_yojson = 
  fun (x: target_location) -> assoc_to_yojson(
    [(
         "TargetLocationAlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.target_location_alarm_configuration));
       (
         "ExecutionRoleName",
         (option_to_yojson execution_role_name_to_yojson x.execution_role_name));
       (
         "TargetLocationMaxErrors",
         (option_to_yojson max_errors_to_yojson x.target_location_max_errors));
       (
         "TargetLocationMaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.target_location_max_concurrency));
       (
         "Regions",
         (option_to_yojson regions_to_yojson x.regions));
       (
         "Accounts",
         (option_to_yojson accounts_to_yojson x.accounts));
       
  ])

let target_locations_to_yojson = 
  fun tree -> list_to_yojson target_location_to_yojson tree

let schedule_offset_to_yojson = int_to_yojson

let duration_to_yojson = int_to_yojson

let target_map_value_to_yojson = string_to_yojson

let target_map_value_list_to_yojson = 
  fun tree -> list_to_yojson target_map_value_to_yojson tree

let target_map_key_to_yojson = string_to_yojson

let target_map_to_yojson = 
  fun tree -> map_to_yojson target_map_value_list_to_yojson tree

let target_maps_to_yojson = 
  fun tree -> list_to_yojson target_map_to_yojson tree

let external_alarm_state_to_yojson = 
  fun (x: external_alarm_state) -> match x with 
  | ALARM -> `String "ALARM"
    | UNKNOWN -> `String "UNKNOWN"
     

let alarm_state_information_to_yojson = 
  fun (x: alarm_state_information) -> assoc_to_yojson(
    [(
         "State",
         (Some (external_alarm_state_to_yojson x.state)));
       (
         "Name",
         (Some (alarm_name_to_yojson x.name)));
       
  ])

let alarm_state_information_list_to_yojson = 
  fun tree -> list_to_yojson alarm_state_information_to_yojson tree

let association_description_to_yojson = 
  fun (x: association_description) -> assoc_to_yojson(
    [(
         "TriggeredAlarms",
         (option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms));
       (
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "TargetMaps",
         (option_to_yojson target_maps_to_yojson x.target_maps));
       (
         "Duration",
         (option_to_yojson duration_to_yojson x.duration));
       (
         "ScheduleOffset",
         (option_to_yojson schedule_offset_to_yojson x.schedule_offset));
       (
         "TargetLocations",
         (option_to_yojson target_locations_to_yojson x.target_locations));
       (
         "CalendarNames",
         (option_to_yojson calendar_name_or_arn_list_to_yojson x.calendar_names));
       (
         "ApplyOnlyAtCronInterval",
         (option_to_yojson apply_only_at_cron_interval_to_yojson x.apply_only_at_cron_interval));
       (
         "SyncCompliance",
         (option_to_yojson association_sync_compliance_to_yojson x.sync_compliance));
       (
         "ComplianceSeverity",
         (option_to_yojson association_compliance_severity_to_yojson x.compliance_severity));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "AssociationName",
         (option_to_yojson association_name_to_yojson x.association_name));
       (
         "LastSuccessfulExecutionDate",
         (option_to_yojson date_time_to_yojson x.last_successful_execution_date));
       (
         "LastExecutionDate",
         (option_to_yojson date_time_to_yojson x.last_execution_date));
       (
         "OutputLocation",
         (option_to_yojson instance_association_output_location_to_yojson x.output_location));
       (
         "ScheduleExpression",
         (option_to_yojson schedule_expression_to_yojson x.schedule_expression));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "AssociationId",
         (option_to_yojson association_id_to_yojson x.association_id));
       (
         "Parameters",
         (option_to_yojson parameters_to_yojson x.parameters));
       (
         "AutomationTargetParameterName",
         (option_to_yojson automation_target_parameter_name_to_yojson x.automation_target_parameter_name));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "Overview",
         (option_to_yojson association_overview_to_yojson x.overview));
       (
         "Status",
         (option_to_yojson association_status_to_yojson x.status));
       (
         "LastUpdateAssociationDate",
         (option_to_yojson date_time_to_yojson x.last_update_association_date));
       (
         "Date",
         (option_to_yojson date_time_to_yojson x.date));
       (
         "AssociationVersion",
         (option_to_yojson association_version_to_yojson x.association_version));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "Name",
         (option_to_yojson document_ar_n_to_yojson x.name));
       
  ])

let update_association_status_result_to_yojson = 
  fun (x: update_association_status_result) -> assoc_to_yojson(
    [(
         "AssociationDescription",
         (option_to_yojson association_description_to_yojson x.association_description));
       
  ])

let update_association_status_request_to_yojson = 
  fun (x: update_association_status_request) -> assoc_to_yojson(
    [(
         "AssociationStatus",
         (Some (association_status_to_yojson x.association_status)));
       (
         "InstanceId",
         (Some (instance_id_to_yojson x.instance_id)));
       (
         "Name",
         (Some (document_ar_n_to_yojson x.name)));
       
  ])

let status_unchanged_to_yojson = 
  fun (x: status_unchanged) -> assoc_to_yojson(
    [
  ])

let association_does_not_exist_to_yojson = 
  fun (x: association_does_not_exist) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_association_result_to_yojson = 
  fun (x: update_association_result) -> assoc_to_yojson(
    [(
         "AssociationDescription",
         (option_to_yojson association_description_to_yojson x.association_description));
       
  ])

let update_association_request_to_yojson = 
  fun (x: update_association_request) -> assoc_to_yojson(
    [(
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "TargetMaps",
         (option_to_yojson target_maps_to_yojson x.target_maps));
       (
         "Duration",
         (option_to_yojson duration_to_yojson x.duration));
       (
         "ScheduleOffset",
         (option_to_yojson schedule_offset_to_yojson x.schedule_offset));
       (
         "TargetLocations",
         (option_to_yojson target_locations_to_yojson x.target_locations));
       (
         "CalendarNames",
         (option_to_yojson calendar_name_or_arn_list_to_yojson x.calendar_names));
       (
         "ApplyOnlyAtCronInterval",
         (option_to_yojson apply_only_at_cron_interval_to_yojson x.apply_only_at_cron_interval));
       (
         "SyncCompliance",
         (option_to_yojson association_sync_compliance_to_yojson x.sync_compliance));
       (
         "ComplianceSeverity",
         (option_to_yojson association_compliance_severity_to_yojson x.compliance_severity));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "AutomationTargetParameterName",
         (option_to_yojson automation_target_parameter_name_to_yojson x.automation_target_parameter_name));
       (
         "AssociationVersion",
         (option_to_yojson association_version_to_yojson x.association_version));
       (
         "AssociationName",
         (option_to_yojson association_name_to_yojson x.association_name));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "Name",
         (option_to_yojson document_ar_n_to_yojson x.name));
       (
         "OutputLocation",
         (option_to_yojson instance_association_output_location_to_yojson x.output_location));
       (
         "ScheduleExpression",
         (option_to_yojson schedule_expression_to_yojson x.schedule_expression));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "Parameters",
         (option_to_yojson parameters_to_yojson x.parameters));
       (
         "AssociationId",
         (Some (association_id_to_yojson x.association_id)));
       
  ])

let invalid_update_to_yojson = 
  fun (x: invalid_update) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_target_maps_to_yojson = 
  fun (x: invalid_target_maps) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_target_to_yojson = 
  fun (x: invalid_target) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_schedule_to_yojson = 
  fun (x: invalid_schedule) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_parameters_to_yojson = 
  fun (x: invalid_parameters) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_output_location_to_yojson = 
  fun (x: invalid_output_location) -> assoc_to_yojson(
    [
  ])

let invalid_association_version_to_yojson = 
  fun (x: invalid_association_version) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let association_version_limit_exceeded_to_yojson = 
  fun (x: association_version_limit_exceeded) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let unsupported_platform_type_to_yojson = 
  fun (x: unsupported_platform_type) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let unsupported_parameter_type_to_yojson = 
  fun (x: unsupported_parameter_type) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let unsupported_operating_system_to_yojson = 
  fun (x: unsupported_operating_system) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let unsupported_inventory_schema_version_exception_to_yojson = 
  fun (x: unsupported_inventory_schema_version_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let inventory_item_type_name_to_yojson = string_to_yojson

let unsupported_inventory_item_context_exception_to_yojson = 
  fun (x: unsupported_inventory_item_context_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "TypeName",
         (option_to_yojson inventory_item_type_name_to_yojson x.type_name));
       
  ])

let unsupported_feature_required_exception_to_yojson = 
  fun (x: unsupported_feature_required_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let unsupported_calendar_exception_to_yojson = 
  fun (x: unsupported_calendar_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let parameter_label_to_yojson = string_to_yojson

let parameter_label_list_to_yojson = 
  fun tree -> list_to_yojson parameter_label_to_yojson tree

let unlabel_parameter_version_result_to_yojson = 
  fun (x: unlabel_parameter_version_result) -> assoc_to_yojson(
    [(
         "InvalidLabels",
         (option_to_yojson parameter_label_list_to_yojson x.invalid_labels));
       (
         "RemovedLabels",
         (option_to_yojson parameter_label_list_to_yojson x.removed_labels));
       
  ])

let ps_parameter_name_to_yojson = string_to_yojson

let ps_parameter_version_to_yojson = long_to_yojson

let unlabel_parameter_version_request_to_yojson = 
  fun (x: unlabel_parameter_version_request) -> assoc_to_yojson(
    [(
         "Labels",
         (Some (parameter_label_list_to_yojson x.labels)));
       (
         "ParameterVersion",
         (Some (ps_parameter_version_to_yojson x.parameter_version)));
       (
         "Name",
         (Some (ps_parameter_name_to_yojson x.name)));
       
  ])

let parameter_version_not_found_to_yojson = 
  fun (x: parameter_version_not_found) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let parameter_not_found_to_yojson = 
  fun (x: parameter_not_found) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let uui_d_to_yojson = string_to_yojson

let total_size_limit_exceeded_exception_to_yojson = 
  fun (x: total_size_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let total_count_to_yojson = int_to_yojson

let too_many_tags_error_to_yojson = 
  fun (x: too_many_tags_error) -> assoc_to_yojson(
    [
  ])

let token_value_to_yojson = string_to_yojson

let session_id_to_yojson = string_to_yojson

let terminate_session_response_to_yojson = 
  fun (x: terminate_session_response) -> assoc_to_yojson(
    [(
         "SessionId",
         (option_to_yojson session_id_to_yojson x.session_id));
       
  ])

let terminate_session_request_to_yojson = 
  fun (x: terminate_session_request) -> assoc_to_yojson(
    [(
         "SessionId",
         (Some (session_id_to_yojson x.session_id)));
       
  ])

let target_parameter_list_to_yojson = 
  fun tree -> list_to_yojson parameter_value_to_yojson tree

let target_not_connected_to_yojson = 
  fun (x: target_not_connected) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let target_in_use_exception_to_yojson = 
  fun (x: target_in_use_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let target_count_to_yojson = int_to_yojson

let sub_type_count_limit_exceeded_exception_to_yojson = 
  fun (x: sub_type_count_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let string_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let string_date_time_to_yojson = string_to_yojson

let stream_url_to_yojson = string_to_yojson

let stop_type_to_yojson = 
  fun (x: stop_type) -> match x with 
  | CANCEL -> `String "Cancel"
    | COMPLETE -> `String "Complete"
     

let stop_automation_execution_result_to_yojson = 
  fun (x: stop_automation_execution_result) -> assoc_to_yojson(
    [
  ])

let automation_execution_id_to_yojson = string_to_yojson

let stop_automation_execution_request_to_yojson = 
  fun (x: stop_automation_execution_request) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson stop_type_to_yojson x.type_));
       (
         "AutomationExecutionId",
         (Some (automation_execution_id_to_yojson x.automation_execution_id)));
       
  ])

let invalid_automation_status_update_exception_to_yojson = 
  fun (x: invalid_automation_status_update_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let automation_execution_not_found_exception_to_yojson = 
  fun (x: automation_execution_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let automation_action_name_to_yojson = string_to_yojson

let long_to_yojson = long_to_yojson

let automation_execution_status_to_yojson = 
  fun (x: automation_execution_status) -> match x with 
 
| EXITED -> `String "Exited"
  | COMPLETED_WITH_FAILURE -> `String "CompletedWithFailure"
  | COMPLETED_WITH_SUCCESS -> `String "CompletedWithSuccess"
  | CHANGE_CALENDAR_OVERRIDE_REJECTED -> `String "ChangeCalendarOverrideRejected"
  | CHANGE_CALENDAR_OVERRIDE_APPROVED -> `String "ChangeCalendarOverrideApproved"
  | PENDING_CHANGE_CALENDAR_OVERRIDE -> `String "PendingChangeCalendarOverride"
  | RUNBOOK_INPROGRESS -> `String "RunbookInProgress"
  | SCHEDULED -> `String "Scheduled"
  | REJECTED -> `String "Rejected"
  | APPROVED -> `String "Approved"
  | PENDING_APPROVAL -> `String "PendingApproval"
  | FAILED -> `String "Failed"
  | CANCELLED -> `String "Cancelled"
  | CANCELLING -> `String "Cancelling"
  | TIMEDOUT -> `String "TimedOut"
  | SUCCESS -> `String "Success"
  | WAITING -> `String "Waiting"
  | INPROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"
   

let normal_string_map_to_yojson = 
  fun tree -> map_to_yojson string__to_yojson tree

let failure_details_to_yojson = 
  fun (x: failure_details) -> assoc_to_yojson(
    [(
         "Details",
         (option_to_yojson automation_parameter_map_to_yojson x.details));
       (
         "FailureType",
         (option_to_yojson string__to_yojson x.failure_type));
       (
         "FailureStage",
         (option_to_yojson string__to_yojson x.failure_stage));
       
  ])

let parent_step_details_to_yojson = 
  fun (x: parent_step_details) -> assoc_to_yojson(
    [(
         "IteratorValue",
         (option_to_yojson string__to_yojson x.iterator_value));
       (
         "Iteration",
         (option_to_yojson integer__to_yojson x.iteration));
       (
         "Action",
         (option_to_yojson automation_action_name_to_yojson x.action));
       (
         "StepName",
         (option_to_yojson string__to_yojson x.step_name));
       (
         "StepExecutionId",
         (option_to_yojson string__to_yojson x.step_execution_id));
       
  ])

let step_execution_to_yojson = 
  fun (x: step_execution) -> assoc_to_yojson(
    [(
         "ParentStepDetails",
         (option_to_yojson parent_step_details_to_yojson x.parent_step_details));
       (
         "TriggeredAlarms",
         (option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms));
       (
         "TargetLocation",
         (option_to_yojson target_location_to_yojson x.target_location));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "ValidNextSteps",
         (option_to_yojson valid_next_step_list_to_yojson x.valid_next_steps));
       (
         "IsCritical",
         (option_to_yojson boolean__to_yojson x.is_critical));
       (
         "NextStep",
         (option_to_yojson string__to_yojson x.next_step));
       (
         "IsEnd",
         (option_to_yojson boolean__to_yojson x.is_end));
       (
         "OverriddenParameters",
         (option_to_yojson automation_parameter_map_to_yojson x.overridden_parameters));
       (
         "StepExecutionId",
         (option_to_yojson string__to_yojson x.step_execution_id));
       (
         "FailureDetails",
         (option_to_yojson failure_details_to_yojson x.failure_details));
       (
         "FailureMessage",
         (option_to_yojson string__to_yojson x.failure_message));
       (
         "Response",
         (option_to_yojson string__to_yojson x.response));
       (
         "Outputs",
         (option_to_yojson automation_parameter_map_to_yojson x.outputs));
       (
         "Inputs",
         (option_to_yojson normal_string_map_to_yojson x.inputs));
       (
         "ResponseCode",
         (option_to_yojson string__to_yojson x.response_code));
       (
         "StepStatus",
         (option_to_yojson automation_execution_status_to_yojson x.step_status));
       (
         "ExecutionEndTime",
         (option_to_yojson date_time_to_yojson x.execution_end_time));
       (
         "ExecutionStartTime",
         (option_to_yojson date_time_to_yojson x.execution_start_time));
       (
         "MaxAttempts",
         (option_to_yojson integer__to_yojson x.max_attempts));
       (
         "OnFailure",
         (option_to_yojson string__to_yojson x.on_failure));
       (
         "TimeoutSeconds",
         (option_to_yojson long_to_yojson x.timeout_seconds));
       (
         "Action",
         (option_to_yojson automation_action_name_to_yojson x.action));
       (
         "StepName",
         (option_to_yojson string__to_yojson x.step_name));
       
  ])

let step_execution_list_to_yojson = 
  fun tree -> list_to_yojson step_execution_to_yojson tree

let step_execution_filter_value_to_yojson = string_to_yojson

let step_execution_filter_value_list_to_yojson = 
  fun tree -> list_to_yojson step_execution_filter_value_to_yojson tree

let step_execution_filter_key_to_yojson = 
  fun (x: step_execution_filter_key) -> match x with 
 
| PARENT_STEP_ITERATOR_VALUE -> `String "ParentStepIteratorValue"
  | PARENT_STEP_ITERATION -> `String "ParentStepIteration"
  | PARENT_STEP_EXECUTION_ID -> `String "ParentStepExecutionId"
  | ACTION -> `String "Action"
  | STEP_NAME -> `String "StepName"
  | STEP_EXECUTION_ID -> `String "StepExecutionId"
  | STEP_EXECUTION_STATUS -> `String "StepExecutionStatus"
  | START_TIME_AFTER -> `String "StartTimeAfter"
  | START_TIME_BEFORE -> `String "StartTimeBefore"
   

let step_execution_filter_to_yojson = 
  fun (x: step_execution_filter) -> assoc_to_yojson(
    [(
         "Values",
         (Some (step_execution_filter_value_list_to_yojson x.values)));
       (
         "Key",
         (Some (step_execution_filter_key_to_yojson x.key)));
       
  ])

let step_execution_filter_list_to_yojson = 
  fun tree -> list_to_yojson step_execution_filter_to_yojson tree

let status_details_to_yojson = string_to_yojson

let start_session_response_to_yojson = 
  fun (x: start_session_response) -> assoc_to_yojson(
    [(
         "StreamUrl",
         (option_to_yojson stream_url_to_yojson x.stream_url));
       (
         "TokenValue",
         (option_to_yojson token_value_to_yojson x.token_value));
       (
         "SessionId",
         (option_to_yojson session_id_to_yojson x.session_id));
       
  ])

let session_target_to_yojson = string_to_yojson

let session_reason_to_yojson = string_to_yojson

let session_manager_parameter_value_to_yojson = string_to_yojson

let session_manager_parameter_value_list_to_yojson = 
  fun tree -> list_to_yojson session_manager_parameter_value_to_yojson tree

let session_manager_parameter_name_to_yojson = string_to_yojson

let session_manager_parameters_to_yojson = 
  fun tree -> map_to_yojson session_manager_parameter_value_list_to_yojson tree

let start_session_request_to_yojson = 
  fun (x: start_session_request) -> assoc_to_yojson(
    [(
         "Parameters",
         (option_to_yojson session_manager_parameters_to_yojson x.parameters));
       (
         "Reason",
         (option_to_yojson session_reason_to_yojson x.reason));
       (
         "DocumentName",
         (option_to_yojson document_ar_n_to_yojson x.document_name));
       (
         "Target",
         (Some (session_target_to_yojson x.target)));
       
  ])

let start_change_request_execution_result_to_yojson = 
  fun (x: start_change_request_execution_result) -> assoc_to_yojson(
    [(
         "AutomationExecutionId",
         (option_to_yojson automation_execution_id_to_yojson x.automation_execution_id));
       
  ])

let change_request_name_to_yojson = string_to_yojson

let idempotency_token_to_yojson = string_to_yojson

let runbook_to_yojson = 
  fun (x: runbook) -> assoc_to_yojson(
    [(
         "TargetLocations",
         (option_to_yojson target_locations_to_yojson x.target_locations));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "TargetMaps",
         (option_to_yojson target_maps_to_yojson x.target_maps));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "TargetParameterName",
         (option_to_yojson automation_parameter_key_to_yojson x.target_parameter_name));
       (
         "Parameters",
         (option_to_yojson automation_parameter_map_to_yojson x.parameters));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DocumentName",
         (Some (document_ar_n_to_yojson x.document_name)));
       
  ])

let runbooks_to_yojson = fun tree -> list_to_yojson runbook_to_yojson tree

let change_details_value_to_yojson = string_to_yojson

let start_change_request_execution_request_to_yojson = 
  fun (x: start_change_request_execution_request) -> assoc_to_yojson(
    [(
         "ChangeDetails",
         (option_to_yojson change_details_value_to_yojson x.change_details));
       (
         "ScheduledEndTime",
         (option_to_yojson date_time_to_yojson x.scheduled_end_time));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Runbooks",
         (Some (runbooks_to_yojson x.runbooks)));
       (
         "AutoApprove",
         (option_to_yojson boolean__to_yojson x.auto_approve));
       (
         "ClientToken",
         (option_to_yojson idempotency_token_to_yojson x.client_token));
       (
         "ChangeRequestName",
         (option_to_yojson change_request_name_to_yojson x.change_request_name));
       (
         "Parameters",
         (option_to_yojson automation_parameter_map_to_yojson x.parameters));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DocumentName",
         (Some (document_ar_n_to_yojson x.document_name)));
       (
         "ScheduledTime",
         (option_to_yojson date_time_to_yojson x.scheduled_time));
       
  ])

let invalid_automation_execution_parameters_exception_to_yojson = 
  fun (x: invalid_automation_execution_parameters_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let idempotent_parameter_mismatch_to_yojson = 
  fun (x: idempotent_parameter_mismatch) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let automation_execution_limit_exceeded_exception_to_yojson = 
  fun (x: automation_execution_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let automation_definition_version_not_found_exception_to_yojson = 
  fun (x: automation_definition_version_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let automation_definition_not_found_exception_to_yojson = 
  fun (x: automation_definition_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let automation_definition_not_approved_exception_to_yojson = 
  fun (x: automation_definition_not_approved_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let start_automation_execution_result_to_yojson = 
  fun (x: start_automation_execution_result) -> assoc_to_yojson(
    [(
         "AutomationExecutionId",
         (option_to_yojson automation_execution_id_to_yojson x.automation_execution_id));
       
  ])

let execution_mode_to_yojson = 
  fun (x: execution_mode) -> match x with 
  | Interactive -> `String "Interactive"
    | Auto -> `String "Auto"
     

let start_automation_execution_request_to_yojson = 
  fun (x: start_automation_execution_request) -> assoc_to_yojson(
    [(
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "TargetLocations",
         (option_to_yojson target_locations_to_yojson x.target_locations));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "TargetMaps",
         (option_to_yojson target_maps_to_yojson x.target_maps));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "TargetParameterName",
         (option_to_yojson automation_parameter_key_to_yojson x.target_parameter_name));
       (
         "Mode",
         (option_to_yojson execution_mode_to_yojson x.mode));
       (
         "ClientToken",
         (option_to_yojson idempotency_token_to_yojson x.client_token));
       (
         "Parameters",
         (option_to_yojson automation_parameter_map_to_yojson x.parameters));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DocumentName",
         (Some (document_ar_n_to_yojson x.document_name)));
       
  ])

let start_associations_once_result_to_yojson = 
  fun (x: start_associations_once_result) -> assoc_to_yojson(
    [
  ])

let association_id_list_to_yojson = 
  fun tree -> list_to_yojson association_id_to_yojson tree

let start_associations_once_request_to_yojson = 
  fun (x: start_associations_once_request) -> assoc_to_yojson(
    [(
         "AssociationIds",
         (Some (association_id_list_to_yojson x.association_ids)));
       
  ])

let invalid_association_to_yojson = 
  fun (x: invalid_association) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let standard_output_content_to_yojson = string_to_yojson

let standard_error_content_to_yojson = string_to_yojson

let source_type_to_yojson = 
  fun (x: source_type) -> match x with 
 
| AWS_SSM_MANAGEDINSTANCE -> `String "AWS::SSM::ManagedInstance"
  | AWS_IOT_THING -> `String "AWS::IoT::Thing"
  | AWS_EC2_INSTANCE -> `String "AWS::EC2::Instance"
   

let source_id_to_yojson = string_to_yojson

let snapshot_id_to_yojson = string_to_yojson

let snapshot_download_url_to_yojson = string_to_yojson

let signal_type_to_yojson = 
  fun (x: signal_type) -> match x with 
 
| RESUME -> `String "Resume"
  | STOP_STEP -> `String "StopStep"
  | START_STEP -> `String "StartStep"
  | REJECT -> `String "Reject"
  | APPROVE -> `String "Approve"
   

let shared_document_version_to_yojson = string_to_yojson

let compliance_summary_count_to_yojson = int_to_yojson

let severity_summary_to_yojson = 
  fun (x: severity_summary) -> assoc_to_yojson(
    [(
         "UnspecifiedCount",
         (option_to_yojson compliance_summary_count_to_yojson x.unspecified_count));
       (
         "InformationalCount",
         (option_to_yojson compliance_summary_count_to_yojson x.informational_count));
       (
         "LowCount",
         (option_to_yojson compliance_summary_count_to_yojson x.low_count));
       (
         "MediumCount",
         (option_to_yojson compliance_summary_count_to_yojson x.medium_count));
       (
         "HighCount",
         (option_to_yojson compliance_summary_count_to_yojson x.high_count));
       (
         "CriticalCount",
         (option_to_yojson compliance_summary_count_to_yojson x.critical_count));
       
  ])

let session_status_to_yojson = 
  fun (x: session_status) -> match x with 
 
| FAILED -> `String "Failed"
  | TERMINATING -> `String "Terminating"
  | TERMINATED -> `String "Terminated"
  | DISCONNECTED -> `String "Disconnected"
  | CONNECTING -> `String "Connecting"
  | CONNECTED -> `String "Connected"
   

let session_state_to_yojson = 
  fun (x: session_state) -> match x with 
  | HISTORY -> `String "History"
    | ACTIVE -> `String "Active"
     

let session_owner_to_yojson = string_to_yojson

let session_max_results_to_yojson = int_to_yojson

let session_manager_s3_output_url_to_yojson = string_to_yojson

let session_manager_cloud_watch_output_url_to_yojson = string_to_yojson

let session_manager_output_url_to_yojson = 
  fun (x: session_manager_output_url) -> assoc_to_yojson(
    [(
         "CloudWatchOutputUrl",
         (option_to_yojson session_manager_cloud_watch_output_url_to_yojson x.cloud_watch_output_url));
       (
         "S3OutputUrl",
         (option_to_yojson session_manager_s3_output_url_to_yojson x.s3_output_url));
       
  ])

let session_details_to_yojson = string_to_yojson

let max_session_duration_to_yojson = string_to_yojson

let session_to_yojson = 
  fun (x: session) -> assoc_to_yojson(
    [(
         "MaxSessionDuration",
         (option_to_yojson max_session_duration_to_yojson x.max_session_duration));
       (
         "OutputUrl",
         (option_to_yojson session_manager_output_url_to_yojson x.output_url));
       (
         "Details",
         (option_to_yojson session_details_to_yojson x.details));
       (
         "Reason",
         (option_to_yojson session_reason_to_yojson x.reason));
       (
         "Owner",
         (option_to_yojson session_owner_to_yojson x.owner));
       (
         "DocumentName",
         (option_to_yojson document_name_to_yojson x.document_name));
       (
         "EndDate",
         (option_to_yojson date_time_to_yojson x.end_date));
       (
         "StartDate",
         (option_to_yojson date_time_to_yojson x.start_date));
       (
         "Status",
         (option_to_yojson session_status_to_yojson x.status));
       (
         "Target",
         (option_to_yojson session_target_to_yojson x.target));
       (
         "SessionId",
         (option_to_yojson session_id_to_yojson x.session_id));
       
  ])

let session_list_to_yojson = 
  fun tree -> list_to_yojson session_to_yojson tree

let session_filter_value_to_yojson = string_to_yojson

let session_filter_key_to_yojson = 
  fun (x: session_filter_key) -> match x with 
 
| SESSION_ID -> `String "SessionId"
  | STATUS -> `String "Status"
  | OWNER -> `String "Owner"
  | TARGET_ID -> `String "Target"
  | INVOKED_BEFORE -> `String "InvokedBefore"
  | INVOKED_AFTER -> `String "InvokedAfter"
   

let session_filter_to_yojson = 
  fun (x: session_filter) -> assoc_to_yojson(
    [(
         "value",
         (Some (session_filter_value_to_yojson x.value)));
       (
         "key",
         (Some (session_filter_key_to_yojson x.key)));
       
  ])

let session_filter_list_to_yojson = 
  fun tree -> list_to_yojson session_filter_to_yojson tree

let service_setting_to_yojson = 
  fun (x: service_setting) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson string__to_yojson x.status));
       (
         "ARN",
         (option_to_yojson string__to_yojson x.ar_n));
       (
         "LastModifiedUser",
         (option_to_yojson string__to_yojson x.last_modified_user));
       (
         "LastModifiedDate",
         (option_to_yojson date_time_to_yojson x.last_modified_date));
       (
         "SettingValue",
         (option_to_yojson service_setting_value_to_yojson x.setting_value));
       (
         "SettingId",
         (option_to_yojson service_setting_id_to_yojson x.setting_id));
       
  ])

let command_id_to_yojson = string_to_yojson

let instance_id_list_to_yojson = 
  fun tree -> list_to_yojson instance_id_to_yojson tree

let command_status_to_yojson = 
  fun (x: command_status) -> match x with 
 
| CANCELLING -> `String "Cancelling"
  | TIMED_OUT -> `String "TimedOut"
  | FAILED -> `String "Failed"
  | CANCELLED -> `String "Cancelled"
  | SUCCESS -> `String "Success"
  | IN_PROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"
   

let completed_count_to_yojson = int_to_yojson

let error_count_to_yojson = int_to_yojson

let delivery_timed_out_count_to_yojson = int_to_yojson

let command_to_yojson = 
  fun (x: command) -> assoc_to_yojson(
    [(
         "TriggeredAlarms",
         (option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms));
       (
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "TimeoutSeconds",
         (option_to_yojson timeout_seconds_to_yojson x.timeout_seconds));
       (
         "CloudWatchOutputConfig",
         (option_to_yojson cloud_watch_output_config_to_yojson x.cloud_watch_output_config));
       (
         "NotificationConfig",
         (option_to_yojson notification_config_to_yojson x.notification_config));
       (
         "ServiceRole",
         (option_to_yojson service_role_to_yojson x.service_role));
       (
         "DeliveryTimedOutCount",
         (option_to_yojson delivery_timed_out_count_to_yojson x.delivery_timed_out_count));
       (
         "ErrorCount",
         (option_to_yojson error_count_to_yojson x.error_count));
       (
         "CompletedCount",
         (option_to_yojson completed_count_to_yojson x.completed_count));
       (
         "TargetCount",
         (option_to_yojson target_count_to_yojson x.target_count));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "OutputS3KeyPrefix",
         (option_to_yojson s3_key_prefix_to_yojson x.output_s3_key_prefix));
       (
         "OutputS3BucketName",
         (option_to_yojson s3_bucket_name_to_yojson x.output_s3_bucket_name));
       (
         "OutputS3Region",
         (option_to_yojson s3_region_to_yojson x.output_s3_region));
       (
         "StatusDetails",
         (option_to_yojson status_details_to_yojson x.status_details));
       (
         "Status",
         (option_to_yojson command_status_to_yojson x.status));
       (
         "RequestedDateTime",
         (option_to_yojson date_time_to_yojson x.requested_date_time));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "InstanceIds",
         (option_to_yojson instance_id_list_to_yojson x.instance_ids));
       (
         "Parameters",
         (option_to_yojson parameters_to_yojson x.parameters));
       (
         "ExpiresAfter",
         (option_to_yojson date_time_to_yojson x.expires_after));
       (
         "Comment",
         (option_to_yojson comment_to_yojson x.comment));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DocumentName",
         (option_to_yojson document_name_to_yojson x.document_name));
       (
         "CommandId",
         (option_to_yojson command_id_to_yojson x.command_id));
       
  ])

let send_command_result_to_yojson = 
  fun (x: send_command_result) -> assoc_to_yojson(
    [(
         "Command",
         (option_to_yojson command_to_yojson x.command));
       
  ])

let send_command_request_to_yojson = 
  fun (x: send_command_request) -> assoc_to_yojson(
    [(
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "CloudWatchOutputConfig",
         (option_to_yojson cloud_watch_output_config_to_yojson x.cloud_watch_output_config));
       (
         "NotificationConfig",
         (option_to_yojson notification_config_to_yojson x.notification_config));
       (
         "ServiceRoleArn",
         (option_to_yojson service_role_to_yojson x.service_role_arn));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "OutputS3KeyPrefix",
         (option_to_yojson s3_key_prefix_to_yojson x.output_s3_key_prefix));
       (
         "OutputS3BucketName",
         (option_to_yojson s3_bucket_name_to_yojson x.output_s3_bucket_name));
       (
         "OutputS3Region",
         (option_to_yojson s3_region_to_yojson x.output_s3_region));
       (
         "Parameters",
         (option_to_yojson parameters_to_yojson x.parameters));
       (
         "Comment",
         (option_to_yojson comment_to_yojson x.comment));
       (
         "TimeoutSeconds",
         (option_to_yojson timeout_seconds_to_yojson x.timeout_seconds));
       (
         "DocumentHashType",
         (option_to_yojson document_hash_type_to_yojson x.document_hash_type));
       (
         "DocumentHash",
         (option_to_yojson document_hash_to_yojson x.document_hash));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DocumentName",
         (Some (document_ar_n_to_yojson x.document_name)));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "InstanceIds",
         (option_to_yojson instance_id_list_to_yojson x.instance_ids));
       
  ])

let invalid_role_to_yojson = 
  fun (x: invalid_role) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_output_folder_to_yojson = 
  fun (x: invalid_output_folder) -> assoc_to_yojson(
    [
  ])

let invalid_notification_config_to_yojson = 
  fun (x: invalid_notification_config) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let duplicate_instance_id_to_yojson = 
  fun (x: duplicate_instance_id) -> assoc_to_yojson(
    [
  ])

let send_automation_signal_result_to_yojson = 
  fun (x: send_automation_signal_result) -> assoc_to_yojson(
    [
  ])

let send_automation_signal_request_to_yojson = 
  fun (x: send_automation_signal_request) -> assoc_to_yojson(
    [(
         "Payload",
         (option_to_yojson automation_parameter_map_to_yojson x.payload));
       (
         "SignalType",
         (Some (signal_type_to_yojson x.signal_type)));
       (
         "AutomationExecutionId",
         (Some (automation_execution_id_to_yojson x.automation_execution_id)));
       
  ])

let invalid_automation_signal_exception_to_yojson = 
  fun (x: invalid_automation_signal_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let automation_step_not_found_exception_to_yojson = 
  fun (x: automation_step_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let scheduled_window_execution_to_yojson = 
  fun (x: scheduled_window_execution) -> assoc_to_yojson(
    [(
         "ExecutionTime",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.execution_time));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let scheduled_window_execution_list_to_yojson = 
  fun tree -> list_to_yojson scheduled_window_execution_to_yojson tree

let s3_output_url_to_yojson = 
  fun (x: s3_output_url) -> assoc_to_yojson(
    [(
         "OutputUrl",
         (option_to_yojson url_to_yojson x.output_url));
       
  ])

let resume_session_response_to_yojson = 
  fun (x: resume_session_response) -> assoc_to_yojson(
    [(
         "StreamUrl",
         (option_to_yojson stream_url_to_yojson x.stream_url));
       (
         "TokenValue",
         (option_to_yojson token_value_to_yojson x.token_value));
       (
         "SessionId",
         (option_to_yojson session_id_to_yojson x.session_id));
       
  ])

let resume_session_request_to_yojson = 
  fun (x: resume_session_request) -> assoc_to_yojson(
    [(
         "SessionId",
         (Some (session_id_to_yojson x.session_id)));
       
  ])

let result_attribute_to_yojson = 
  fun (x: result_attribute) -> assoc_to_yojson(
    [(
         "TypeName",
         (Some (inventory_item_type_name_to_yojson x.type_name)));
       
  ])

let result_attribute_list_to_yojson = 
  fun tree -> list_to_yojson result_attribute_to_yojson tree

let response_code_to_yojson = int_to_yojson

let resource_type_for_tagging_to_yojson = 
  fun (x: resource_type_for_tagging) -> match x with 
 
| ASSOCIATION -> `String "Association"
  | AUTOMATION -> `String "Automation"
  | OPSMETADATA -> `String "OpsMetadata"
  | OPS_ITEM -> `String "OpsItem"
  | PATCH_BASELINE -> `String "PatchBaseline"
  | PARAMETER -> `String "Parameter"
  | MAINTENANCE_WINDOW -> `String "MaintenanceWindow"
  | MANAGED_INSTANCE -> `String "ManagedInstance"
  | DOCUMENT -> `String "Document"
   

let resource_type_to_yojson = 
  fun (x: resource_type) -> match x with 
 
| EC2_INSTANCE -> `String "EC2Instance"
  | MANAGED_INSTANCE -> `String "ManagedInstance"
   

let resource_policy_parameter_names_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let resource_policy_not_found_exception_to_yojson = 
  fun (x: resource_policy_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let resource_policy_max_results_to_yojson = int_to_yojson

let resource_policy_limit_exceeded_exception_to_yojson = 
  fun (x: resource_policy_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "LimitType",
         (option_to_yojson string__to_yojson x.limit_type));
       (
         "Limit",
         (option_to_yojson integer__to_yojson x.limit));
       
  ])

let resource_policy_invalid_parameter_exception_to_yojson = 
  fun (x: resource_policy_invalid_parameter_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "ParameterNames",
         (option_to_yojson resource_policy_parameter_names_list_to_yojson x.parameter_names));
       
  ])

let resource_policy_conflict_exception_to_yojson = 
  fun (x: resource_policy_conflict_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let resource_not_found_exception_to_yojson = 
  fun (x: resource_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let resource_limit_exceeded_exception_to_yojson = 
  fun (x: resource_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let resource_in_use_exception_to_yojson = 
  fun (x: resource_in_use_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let resource_id_to_yojson = string_to_yojson

let resource_data_sync_state_to_yojson = string_to_yojson

let resource_data_sync_source_with_state_to_yojson = 
  fun (x: resource_data_sync_source_with_state) -> assoc_to_yojson(
    [(
         "EnableAllOpsDataSources",
         (option_to_yojson resource_data_sync_enable_all_ops_data_sources_to_yojson x.enable_all_ops_data_sources));
       (
         "State",
         (option_to_yojson resource_data_sync_state_to_yojson x.state));
       (
         "IncludeFutureRegions",
         (option_to_yojson resource_data_sync_include_future_regions_to_yojson x.include_future_regions));
       (
         "SourceRegions",
         (option_to_yojson resource_data_sync_source_region_list_to_yojson x.source_regions));
       (
         "AwsOrganizationsSource",
         (option_to_yojson resource_data_sync_aws_organizations_source_to_yojson x.aws_organizations_source));
       (
         "SourceType",
         (option_to_yojson resource_data_sync_source_type_to_yojson x.source_type));
       
  ])

let resource_data_sync_s3_region_to_yojson = string_to_yojson

let resource_data_sync_s3_prefix_to_yojson = string_to_yojson

let resource_data_sync_s3_format_to_yojson = 
  fun (x: resource_data_sync_s3_format) -> match x with 
  | JSON_SERDE -> `String "JsonSerDe"
     

let resource_data_sync_s3_bucket_name_to_yojson = string_to_yojson

let resource_data_sync_awskms_key_ar_n_to_yojson = string_to_yojson

let resource_data_sync_destination_data_sharing_type_to_yojson = 
  string_to_yojson

let resource_data_sync_destination_data_sharing_to_yojson = 
  fun (x: resource_data_sync_destination_data_sharing) -> assoc_to_yojson(
    [(
         "DestinationDataSharingType",
         (option_to_yojson resource_data_sync_destination_data_sharing_type_to_yojson x.destination_data_sharing_type));
       
  ])

let resource_data_sync_s3_destination_to_yojson = 
  fun (x: resource_data_sync_s3_destination) -> assoc_to_yojson(
    [(
         "DestinationDataSharing",
         (option_to_yojson resource_data_sync_destination_data_sharing_to_yojson x.destination_data_sharing));
       (
         "AWSKMSKeyARN",
         (option_to_yojson resource_data_sync_awskms_key_ar_n_to_yojson x.awskms_key_ar_n));
       (
         "Region",
         (Some (resource_data_sync_s3_region_to_yojson x.region)));
       (
         "SyncFormat",
         (Some (resource_data_sync_s3_format_to_yojson x.sync_format)));
       (
         "Prefix",
         (option_to_yojson resource_data_sync_s3_prefix_to_yojson x.prefix));
       (
         "BucketName",
         (Some (resource_data_sync_s3_bucket_name_to_yojson x.bucket_name)));
       
  ])

let resource_data_sync_last_modified_time_to_yojson = timestamp_to_yojson

let last_resource_data_sync_time_to_yojson = timestamp_to_yojson

let last_successful_resource_data_sync_time_to_yojson = 
  timestamp_to_yojson

let last_resource_data_sync_status_to_yojson = 
  fun (x: last_resource_data_sync_status) -> match x with 
 
| INPROGRESS -> `String "InProgress"
  | FAILED -> `String "Failed"
  | SUCCESSFUL -> `String "Successful"
   

let resource_data_sync_created_time_to_yojson = timestamp_to_yojson

let last_resource_data_sync_message_to_yojson = string_to_yojson

let resource_data_sync_item_to_yojson = 
  fun (x: resource_data_sync_item) -> assoc_to_yojson(
    [(
         "LastSyncStatusMessage",
         (option_to_yojson last_resource_data_sync_message_to_yojson x.last_sync_status_message));
       (
         "SyncCreatedTime",
         (option_to_yojson resource_data_sync_created_time_to_yojson x.sync_created_time));
       (
         "LastStatus",
         (option_to_yojson last_resource_data_sync_status_to_yojson x.last_status));
       (
         "SyncLastModifiedTime",
         (option_to_yojson resource_data_sync_last_modified_time_to_yojson x.sync_last_modified_time));
       (
         "LastSuccessfulSyncTime",
         (option_to_yojson last_successful_resource_data_sync_time_to_yojson x.last_successful_sync_time));
       (
         "LastSyncTime",
         (option_to_yojson last_resource_data_sync_time_to_yojson x.last_sync_time));
       (
         "S3Destination",
         (option_to_yojson resource_data_sync_s3_destination_to_yojson x.s3_destination));
       (
         "SyncSource",
         (option_to_yojson resource_data_sync_source_with_state_to_yojson x.sync_source));
       (
         "SyncType",
         (option_to_yojson resource_data_sync_type_to_yojson x.sync_type));
       (
         "SyncName",
         (option_to_yojson resource_data_sync_name_to_yojson x.sync_name));
       
  ])

let resource_data_sync_item_list_to_yojson = 
  fun tree -> list_to_yojson resource_data_sync_item_to_yojson tree

let resource_data_sync_count_exceeded_exception_to_yojson = 
  fun (x: resource_data_sync_count_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let resource_data_sync_already_exists_exception_to_yojson = 
  fun (x: resource_data_sync_already_exists_exception) -> assoc_to_yojson(
    [(
         "SyncName",
         (option_to_yojson resource_data_sync_name_to_yojson x.sync_name));
       
  ])

let resource_count_by_status_to_yojson = string_to_yojson

let resource_count_to_yojson = int_to_yojson

let compliance_type_name_to_yojson = string_to_yojson

let compliance_resource_type_to_yojson = string_to_yojson

let compliance_resource_id_to_yojson = string_to_yojson

let compliance_status_to_yojson = 
  fun (x: compliance_status) -> match x with 
 
| NonCompliant -> `String "NON_COMPLIANT"
  | Compliant -> `String "COMPLIANT"
   

let compliance_severity_to_yojson = 
  fun (x: compliance_severity) -> match x with 
 
| Unspecified -> `String "UNSPECIFIED"
  | Informational -> `String "INFORMATIONAL"
  | Low -> `String "LOW"
  | Medium -> `String "MEDIUM"
  | High -> `String "HIGH"
  | Critical -> `String "CRITICAL"
   

let compliance_execution_id_to_yojson = string_to_yojson

let compliance_execution_type_to_yojson = string_to_yojson

let compliance_execution_summary_to_yojson = 
  fun (x: compliance_execution_summary) -> assoc_to_yojson(
    [(
         "ExecutionType",
         (option_to_yojson compliance_execution_type_to_yojson x.execution_type));
       (
         "ExecutionId",
         (option_to_yojson compliance_execution_id_to_yojson x.execution_id));
       (
         "ExecutionTime",
         (Some (date_time_to_yojson x.execution_time)));
       
  ])

let compliant_summary_to_yojson = 
  fun (x: compliant_summary) -> assoc_to_yojson(
    [(
         "SeveritySummary",
         (option_to_yojson severity_summary_to_yojson x.severity_summary));
       (
         "CompliantCount",
         (option_to_yojson compliance_summary_count_to_yojson x.compliant_count));
       
  ])

let non_compliant_summary_to_yojson = 
  fun (x: non_compliant_summary) -> assoc_to_yojson(
    [(
         "SeveritySummary",
         (option_to_yojson severity_summary_to_yojson x.severity_summary));
       (
         "NonCompliantCount",
         (option_to_yojson compliance_summary_count_to_yojson x.non_compliant_count));
       
  ])

let resource_compliance_summary_item_to_yojson = 
  fun (x: resource_compliance_summary_item) -> assoc_to_yojson(
    [(
         "NonCompliantSummary",
         (option_to_yojson non_compliant_summary_to_yojson x.non_compliant_summary));
       (
         "CompliantSummary",
         (option_to_yojson compliant_summary_to_yojson x.compliant_summary));
       (
         "ExecutionSummary",
         (option_to_yojson compliance_execution_summary_to_yojson x.execution_summary));
       (
         "OverallSeverity",
         (option_to_yojson compliance_severity_to_yojson x.overall_severity));
       (
         "Status",
         (option_to_yojson compliance_status_to_yojson x.status));
       (
         "ResourceId",
         (option_to_yojson compliance_resource_id_to_yojson x.resource_id));
       (
         "ResourceType",
         (option_to_yojson compliance_resource_type_to_yojson x.resource_type));
       (
         "ComplianceType",
         (option_to_yojson compliance_type_name_to_yojson x.compliance_type));
       
  ])

let resource_compliance_summary_item_list_to_yojson = 
  fun tree -> list_to_yojson resource_compliance_summary_item_to_yojson tree

let resource_arn_string_to_yojson = string_to_yojson

let resolved_targets_to_yojson = 
  fun (x: resolved_targets) -> assoc_to_yojson(
    [(
         "Truncated",
         (option_to_yojson boolean__to_yojson x.truncated));
       (
         "ParameterValues",
         (option_to_yojson target_parameter_list_to_yojson x.parameter_values));
       
  ])

let reset_service_setting_result_to_yojson = 
  fun (x: reset_service_setting_result) -> assoc_to_yojson(
    [(
         "ServiceSetting",
         (option_to_yojson service_setting_to_yojson x.service_setting));
       
  ])

let reset_service_setting_request_to_yojson = 
  fun (x: reset_service_setting_request) -> assoc_to_yojson(
    [(
         "SettingId",
         (Some (service_setting_id_to_yojson x.setting_id)));
       
  ])

let remove_tags_from_resource_result_to_yojson = 
  fun (x: remove_tags_from_resource_result) -> assoc_to_yojson(
    [
  ])

let key_list_to_yojson = fun tree -> list_to_yojson tag_key_to_yojson tree

let remove_tags_from_resource_request_to_yojson = 
  fun (x: remove_tags_from_resource_request) -> assoc_to_yojson(
    [(
         "TagKeys",
         (Some (key_list_to_yojson x.tag_keys)));
       (
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       (
         "ResourceType",
         (Some (resource_type_for_tagging_to_yojson x.resource_type)));
       
  ])

let invalid_resource_type_to_yojson = 
  fun (x: invalid_resource_type) -> assoc_to_yojson(
    [
  ])

let invalid_resource_id_to_yojson = 
  fun (x: invalid_resource_id) -> assoc_to_yojson(
    [
  ])

let remaining_count_to_yojson = int_to_yojson

let registrations_count_to_yojson = int_to_yojson

let registration_metadata_value_to_yojson = string_to_yojson

let registration_metadata_key_to_yojson = string_to_yojson

let registration_metadata_item_to_yojson = 
  fun (x: registration_metadata_item) -> assoc_to_yojson(
    [(
         "Value",
         (Some (registration_metadata_value_to_yojson x.value)));
       (
         "Key",
         (Some (registration_metadata_key_to_yojson x.key)));
       
  ])

let registration_metadata_list_to_yojson = 
  fun tree -> list_to_yojson registration_metadata_item_to_yojson tree

let registration_limit_to_yojson = int_to_yojson

let register_task_with_maintenance_window_result_to_yojson = 
  fun (x: register_task_with_maintenance_window_result) -> assoc_to_yojson(
    [(
         "WindowTaskId",
         (option_to_yojson maintenance_window_task_id_to_yojson x.window_task_id));
       
  ])

let maintenance_window_task_type_to_yojson = 
  fun (x: maintenance_window_task_type) -> match x with 
 
| Lambda -> `String "LAMBDA"
  | StepFunctions -> `String "STEP_FUNCTIONS"
  | Automation -> `String "AUTOMATION"
  | RunCommand -> `String "RUN_COMMAND"
   

let client_token_to_yojson = string_to_yojson

let register_task_with_maintenance_window_request_to_yojson = 
  fun (x: register_task_with_maintenance_window_request) -> assoc_to_yojson(
    [(
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "CutoffBehavior",
         (option_to_yojson maintenance_window_task_cutoff_behavior_to_yojson x.cutoff_behavior));
       (
         "ClientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "LoggingInfo",
         (option_to_yojson logging_info_to_yojson x.logging_info));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "Priority",
         (option_to_yojson maintenance_window_task_priority_to_yojson x.priority));
       (
         "TaskInvocationParameters",
         (option_to_yojson maintenance_window_task_invocation_parameters_to_yojson x.task_invocation_parameters));
       (
         "TaskParameters",
         (option_to_yojson maintenance_window_task_parameters_to_yojson x.task_parameters));
       (
         "TaskType",
         (Some (maintenance_window_task_type_to_yojson x.task_type)));
       (
         "ServiceRoleArn",
         (option_to_yojson service_role_to_yojson x.service_role_arn));
       (
         "TaskArn",
         (Some (maintenance_window_task_arn_to_yojson x.task_arn)));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let feature_not_available_exception_to_yojson = 
  fun (x: feature_not_available_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let register_target_with_maintenance_window_result_to_yojson = 
  fun (x: register_target_with_maintenance_window_result) -> assoc_to_yojson(
    [(
         "WindowTargetId",
         (option_to_yojson maintenance_window_target_id_to_yojson x.window_target_id));
       
  ])

let maintenance_window_resource_type_to_yojson = 
  fun (x: maintenance_window_resource_type) -> match x with 
 
| ResourceGroup -> `String "RESOURCE_GROUP"
  | Instance -> `String "INSTANCE"
   

let register_target_with_maintenance_window_request_to_yojson = 
  fun (x: register_target_with_maintenance_window_request) -> assoc_to_yojson(
    [(
         "ClientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "OwnerInformation",
         (option_to_yojson owner_information_to_yojson x.owner_information));
       (
         "Targets",
         (Some (targets_to_yojson x.targets)));
       (
         "ResourceType",
         (Some (maintenance_window_resource_type_to_yojson x.resource_type)));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let patch_group_to_yojson = string_to_yojson

let register_patch_baseline_for_patch_group_result_to_yojson = 
  fun (x: register_patch_baseline_for_patch_group_result) -> assoc_to_yojson(
    [(
         "PatchGroup",
         (option_to_yojson patch_group_to_yojson x.patch_group));
       (
         "BaselineId",
         (option_to_yojson baseline_id_to_yojson x.baseline_id));
       
  ])

let register_patch_baseline_for_patch_group_request_to_yojson = 
  fun (x: register_patch_baseline_for_patch_group_request) -> assoc_to_yojson(
    [(
         "PatchGroup",
         (Some (patch_group_to_yojson x.patch_group)));
       (
         "BaselineId",
         (Some (baseline_id_to_yojson x.baseline_id)));
       
  ])

let already_exists_exception_to_yojson = 
  fun (x: already_exists_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let register_default_patch_baseline_result_to_yojson = 
  fun (x: register_default_patch_baseline_result) -> assoc_to_yojson(
    [(
         "BaselineId",
         (option_to_yojson baseline_id_to_yojson x.baseline_id));
       
  ])

let register_default_patch_baseline_request_to_yojson = 
  fun (x: register_default_patch_baseline_request) -> assoc_to_yojson(
    [(
         "BaselineId",
         (Some (baseline_id_to_yojson x.baseline_id)));
       
  ])

let reboot_option_to_yojson = 
  fun (x: reboot_option) -> match x with 
 
| NO_REBOOT -> `String "NoReboot"
  | REBOOT_IF_NEEDED -> `String "RebootIfNeeded"
   

let policy_id_to_yojson = string_to_yojson

let policy_hash_to_yojson = string_to_yojson

let put_resource_policy_response_to_yojson = 
  fun (x: put_resource_policy_response) -> assoc_to_yojson(
    [(
         "PolicyHash",
         (option_to_yojson policy_hash_to_yojson x.policy_hash));
       (
         "PolicyId",
         (option_to_yojson policy_id_to_yojson x.policy_id));
       
  ])

let policy_to_yojson = string_to_yojson

let put_resource_policy_request_to_yojson = 
  fun (x: put_resource_policy_request) -> assoc_to_yojson(
    [(
         "PolicyHash",
         (option_to_yojson policy_hash_to_yojson x.policy_hash));
       (
         "PolicyId",
         (option_to_yojson policy_id_to_yojson x.policy_id));
       (
         "Policy",
         (Some (policy_to_yojson x.policy)));
       (
         "ResourceArn",
         (Some (resource_arn_string_to_yojson x.resource_arn)));
       
  ])

let malformed_resource_policy_document_exception_to_yojson = 
  fun (x: malformed_resource_policy_document_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let parameter_tier_to_yojson = 
  fun (x: parameter_tier) -> match x with 
 
| INTELLIGENT_TIERING -> `String "Intelligent-Tiering"
  | ADVANCED -> `String "Advanced"
  | STANDARD -> `String "Standard"
   

let put_parameter_result_to_yojson = 
  fun (x: put_parameter_result) -> assoc_to_yojson(
    [(
         "Tier",
         (option_to_yojson parameter_tier_to_yojson x.tier));
       (
         "Version",
         (option_to_yojson ps_parameter_version_to_yojson x.version));
       
  ])

let parameter_description_to_yojson = string_to_yojson

let ps_parameter_value_to_yojson = string_to_yojson

let parameter_type_to_yojson = 
  fun (x: parameter_type) -> match x with 
 
| SECURE_STRING -> `String "SecureString"
  | STRING_LIST -> `String "StringList"
  | STRING -> `String "String"
   

let parameter_key_id_to_yojson = string_to_yojson

let allowed_pattern_to_yojson = string_to_yojson

let parameter_policies_to_yojson = string_to_yojson

let parameter_data_type_to_yojson = string_to_yojson

let put_parameter_request_to_yojson = 
  fun (x: put_parameter_request) -> assoc_to_yojson(
    [(
         "DataType",
         (option_to_yojson parameter_data_type_to_yojson x.data_type));
       (
         "Policies",
         (option_to_yojson parameter_policies_to_yojson x.policies));
       (
         "Tier",
         (option_to_yojson parameter_tier_to_yojson x.tier));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "AllowedPattern",
         (option_to_yojson allowed_pattern_to_yojson x.allowed_pattern));
       (
         "Overwrite",
         (option_to_yojson boolean__to_yojson x.overwrite));
       (
         "KeyId",
         (option_to_yojson parameter_key_id_to_yojson x.key_id));
       (
         "Type",
         (option_to_yojson parameter_type_to_yojson x.type_));
       (
         "Value",
         (Some (ps_parameter_value_to_yojson x.value)));
       (
         "Description",
         (option_to_yojson parameter_description_to_yojson x.description));
       (
         "Name",
         (Some (ps_parameter_name_to_yojson x.name)));
       
  ])

let policies_limit_exceeded_exception_to_yojson = 
  fun (x: policies_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let parameter_pattern_mismatch_exception_to_yojson = 
  fun (x: parameter_pattern_mismatch_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let parameter_max_version_limit_exceeded_to_yojson = 
  fun (x: parameter_max_version_limit_exceeded) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let parameter_limit_exceeded_to_yojson = 
  fun (x: parameter_limit_exceeded) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let parameter_already_exists_to_yojson = 
  fun (x: parameter_already_exists) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_policy_type_exception_to_yojson = 
  fun (x: invalid_policy_type_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_policy_attribute_exception_to_yojson = 
  fun (x: invalid_policy_attribute_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_key_id_to_yojson = 
  fun (x: invalid_key_id) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_allowed_pattern_exception_to_yojson = 
  fun (x: invalid_allowed_pattern_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let incompatible_policy_exception_to_yojson = 
  fun (x: incompatible_policy_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let hierarchy_type_mismatch_exception_to_yojson = 
  fun (x: hierarchy_type_mismatch_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let hierarchy_level_limit_exceeded_exception_to_yojson = 
  fun (x: hierarchy_level_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let put_inventory_message_to_yojson = string_to_yojson

let put_inventory_result_to_yojson = 
  fun (x: put_inventory_result) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson put_inventory_message_to_yojson x.message));
       
  ])

let inventory_item_schema_version_to_yojson = string_to_yojson

let inventory_item_capture_time_to_yojson = string_to_yojson

let inventory_item_content_hash_to_yojson = string_to_yojson

let attribute_value_to_yojson = string_to_yojson

let attribute_name_to_yojson = string_to_yojson

let inventory_item_entry_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let inventory_item_entry_list_to_yojson = 
  fun tree -> list_to_yojson inventory_item_entry_to_yojson tree

let inventory_item_content_context_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let inventory_item_to_yojson = 
  fun (x: inventory_item) -> assoc_to_yojson(
    [(
         "Context",
         (option_to_yojson inventory_item_content_context_to_yojson x.context));
       (
         "Content",
         (option_to_yojson inventory_item_entry_list_to_yojson x.content));
       (
         "ContentHash",
         (option_to_yojson inventory_item_content_hash_to_yojson x.content_hash));
       (
         "CaptureTime",
         (Some (inventory_item_capture_time_to_yojson x.capture_time)));
       (
         "SchemaVersion",
         (Some (inventory_item_schema_version_to_yojson x.schema_version)));
       (
         "TypeName",
         (Some (inventory_item_type_name_to_yojson x.type_name)));
       
  ])

let inventory_item_list_to_yojson = 
  fun tree -> list_to_yojson inventory_item_to_yojson tree

let put_inventory_request_to_yojson = 
  fun (x: put_inventory_request) -> assoc_to_yojson(
    [(
         "Items",
         (Some (inventory_item_list_to_yojson x.items)));
       (
         "InstanceId",
         (Some (instance_id_to_yojson x.instance_id)));
       
  ])

let item_size_limit_exceeded_exception_to_yojson = 
  fun (x: item_size_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "TypeName",
         (option_to_yojson inventory_item_type_name_to_yojson x.type_name));
       
  ])

let item_content_mismatch_exception_to_yojson = 
  fun (x: item_content_mismatch_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "TypeName",
         (option_to_yojson inventory_item_type_name_to_yojson x.type_name));
       
  ])

let invalid_type_name_exception_to_yojson = 
  fun (x: invalid_type_name_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_item_content_exception_to_yojson = 
  fun (x: invalid_item_content_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "TypeName",
         (option_to_yojson inventory_item_type_name_to_yojson x.type_name));
       
  ])

let invalid_inventory_item_context_exception_to_yojson = 
  fun (x: invalid_inventory_item_context_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let custom_schema_count_limit_exceeded_exception_to_yojson = 
  fun (x: custom_schema_count_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let put_compliance_items_result_to_yojson = 
  fun (x: put_compliance_items_result) -> assoc_to_yojson(
    [
  ])

let compliance_item_id_to_yojson = string_to_yojson

let compliance_item_title_to_yojson = string_to_yojson

let compliance_item_details_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let compliance_item_entry_to_yojson = 
  fun (x: compliance_item_entry) -> assoc_to_yojson(
    [(
         "Details",
         (option_to_yojson compliance_item_details_to_yojson x.details));
       (
         "Status",
         (Some (compliance_status_to_yojson x.status)));
       (
         "Severity",
         (Some (compliance_severity_to_yojson x.severity)));
       (
         "Title",
         (option_to_yojson compliance_item_title_to_yojson x.title));
       (
         "Id",
         (option_to_yojson compliance_item_id_to_yojson x.id));
       
  ])

let compliance_item_entry_list_to_yojson = 
  fun tree -> list_to_yojson compliance_item_entry_to_yojson tree

let compliance_item_content_hash_to_yojson = string_to_yojson

let compliance_upload_type_to_yojson = 
  fun (x: compliance_upload_type) -> match x with 
  | Partial -> `String "PARTIAL"
    | Complete -> `String "COMPLETE"
     

let put_compliance_items_request_to_yojson = 
  fun (x: put_compliance_items_request) -> assoc_to_yojson(
    [(
         "UploadType",
         (option_to_yojson compliance_upload_type_to_yojson x.upload_type));
       (
         "ItemContentHash",
         (option_to_yojson compliance_item_content_hash_to_yojson x.item_content_hash));
       (
         "Items",
         (Some (compliance_item_entry_list_to_yojson x.items)));
       (
         "ExecutionSummary",
         (Some (compliance_execution_summary_to_yojson x.execution_summary)));
       (
         "ComplianceType",
         (Some (compliance_type_name_to_yojson x.compliance_type)));
       (
         "ResourceType",
         (Some (compliance_resource_type_to_yojson x.resource_type)));
       (
         "ResourceId",
         (Some (compliance_resource_id_to_yojson x.resource_id)));
       
  ])

let compliance_type_count_limit_exceeded_exception_to_yojson = 
  fun (x: compliance_type_count_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let progress_counters_to_yojson = 
  fun (x: progress_counters) -> assoc_to_yojson(
    [(
         "TimedOutSteps",
         (option_to_yojson integer__to_yojson x.timed_out_steps));
       (
         "CancelledSteps",
         (option_to_yojson integer__to_yojson x.cancelled_steps));
       (
         "FailedSteps",
         (option_to_yojson integer__to_yojson x.failed_steps));
       (
         "SuccessSteps",
         (option_to_yojson integer__to_yojson x.success_steps));
       (
         "TotalSteps",
         (option_to_yojson integer__to_yojson x.total_steps));
       
  ])

let product_to_yojson = string_to_yojson

let platform_version_to_yojson = string_to_yojson

let platform_name_to_yojson = string_to_yojson

let ping_status_to_yojson = 
  fun (x: ping_status) -> match x with 
 
| INACTIVE -> `String "Inactive"
  | CONNECTION_LOST -> `String "ConnectionLost"
  | ONLINE -> `String "Online"
   

let patch_version_to_yojson = string_to_yojson

let patch_vendor_to_yojson = string_to_yojson

let patch_unreported_not_applicable_count_to_yojson = int_to_yojson

let patch_title_to_yojson = string_to_yojson

let patch_deployment_status_to_yojson = 
  fun (x: patch_deployment_status) -> match x with 
 
| ExplicitRejected -> `String "EXPLICIT_REJECTED"
  | ExplicitApproved -> `String "EXPLICIT_APPROVED"
  | PendingApproval -> `String "PENDING_APPROVAL"
  | Approved -> `String "APPROVED"
   

let patch_status_to_yojson = 
  fun (x: patch_status) -> assoc_to_yojson(
    [(
         "ApprovalDate",
         (option_to_yojson date_time_to_yojson x.approval_date));
       (
         "ComplianceLevel",
         (option_to_yojson patch_compliance_level_to_yojson x.compliance_level));
       (
         "DeploymentStatus",
         (option_to_yojson patch_deployment_status_to_yojson x.deployment_status));
       
  ])

let patch_severity_to_yojson = string_to_yojson

let patch_set_to_yojson = 
  fun (x: patch_set) -> match x with 
  | Application -> `String "APPLICATION"
    | Os -> `String "OS"
     

let patch_security_non_compliant_count_to_yojson = int_to_yojson

let patch_repository_to_yojson = string_to_yojson

let patch_release_to_yojson = string_to_yojson

let patch_property_entry_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let patch_property_to_yojson = 
  fun (x: patch_property) -> match x with 
 
| PatchSeverity -> `String "SEVERITY"
  | PatchPriority -> `String "PRIORITY"
  | PatchMsrcSeverity -> `String "MSRC_SEVERITY"
  | PatchClassification -> `String "CLASSIFICATION"
  | PatchProductFamily -> `String "PRODUCT_FAMILY"
  | Product -> `String "PRODUCT"
   

let patch_properties_list_to_yojson = 
  fun tree -> list_to_yojson patch_property_entry_to_yojson tree

let patch_product_family_to_yojson = string_to_yojson

let patch_product_to_yojson = string_to_yojson

let patch_other_non_compliant_count_to_yojson = int_to_yojson

let patch_orchestrator_filter_value_to_yojson = string_to_yojson

let patch_orchestrator_filter_values_to_yojson = 
  fun tree -> list_to_yojson patch_orchestrator_filter_value_to_yojson tree

let patch_orchestrator_filter_key_to_yojson = string_to_yojson

let patch_orchestrator_filter_to_yojson = 
  fun (x: patch_orchestrator_filter) -> assoc_to_yojson(
    [(
         "Values",
         (option_to_yojson patch_orchestrator_filter_values_to_yojson x.values));
       (
         "Key",
         (option_to_yojson patch_orchestrator_filter_key_to_yojson x.key));
       
  ])

let patch_orchestrator_filter_list_to_yojson = 
  fun tree -> list_to_yojson patch_orchestrator_filter_to_yojson tree

let patch_operation_type_to_yojson = 
  fun (x: patch_operation_type) -> match x with 
  | INSTALL -> `String "Install"
    | SCAN -> `String "Scan"
     

let patch_not_applicable_count_to_yojson = int_to_yojson

let patch_name_to_yojson = string_to_yojson

let patch_msrc_severity_to_yojson = string_to_yojson

let patch_msrc_number_to_yojson = string_to_yojson

let patch_missing_count_to_yojson = int_to_yojson

let patch_description_to_yojson = string_to_yojson

let patch_content_url_to_yojson = string_to_yojson

let patch_classification_to_yojson = string_to_yojson

let patch_kb_number_to_yojson = string_to_yojson

let patch_language_to_yojson = string_to_yojson

let patch_advisory_id_to_yojson = string_to_yojson

let patch_advisory_id_list_to_yojson = 
  fun tree -> list_to_yojson patch_advisory_id_to_yojson tree

let patch_bugzilla_id_to_yojson = string_to_yojson

let patch_bugzilla_id_list_to_yojson = 
  fun tree -> list_to_yojson patch_bugzilla_id_to_yojson tree

let patch_cve_id_to_yojson = string_to_yojson

let patch_cve_id_list_to_yojson = 
  fun tree -> list_to_yojson patch_cve_id_to_yojson tree

let patch_epoch_to_yojson = int_to_yojson

let patch_arch_to_yojson = string_to_yojson

let patch_to_yojson = 
  fun (x: patch) -> assoc_to_yojson(
    [(
         "Repository",
         (option_to_yojson patch_repository_to_yojson x.repository));
       (
         "Severity",
         (option_to_yojson patch_severity_to_yojson x.severity));
       (
         "Arch",
         (option_to_yojson patch_arch_to_yojson x.arch));
       (
         "Release",
         (option_to_yojson patch_release_to_yojson x.release));
       (
         "Version",
         (option_to_yojson patch_version_to_yojson x.version));
       (
         "Epoch",
         (option_to_yojson patch_epoch_to_yojson x.epoch));
       (
         "Name",
         (option_to_yojson patch_name_to_yojson x.name));
       (
         "CVEIds",
         (option_to_yojson patch_cve_id_list_to_yojson x.cve_ids));
       (
         "BugzillaIds",
         (option_to_yojson patch_bugzilla_id_list_to_yojson x.bugzilla_ids));
       (
         "AdvisoryIds",
         (option_to_yojson patch_advisory_id_list_to_yojson x.advisory_ids));
       (
         "Language",
         (option_to_yojson patch_language_to_yojson x.language));
       (
         "MsrcNumber",
         (option_to_yojson patch_msrc_number_to_yojson x.msrc_number));
       (
         "KbNumber",
         (option_to_yojson patch_kb_number_to_yojson x.kb_number));
       (
         "MsrcSeverity",
         (option_to_yojson patch_msrc_severity_to_yojson x.msrc_severity));
       (
         "Classification",
         (option_to_yojson patch_classification_to_yojson x.classification));
       (
         "Product",
         (option_to_yojson patch_product_to_yojson x.product));
       (
         "ProductFamily",
         (option_to_yojson patch_product_family_to_yojson x.product_family));
       (
         "Vendor",
         (option_to_yojson patch_vendor_to_yojson x.vendor));
       (
         "ContentUrl",
         (option_to_yojson patch_content_url_to_yojson x.content_url));
       (
         "Description",
         (option_to_yojson patch_description_to_yojson x.description));
       (
         "Title",
         (option_to_yojson patch_title_to_yojson x.title));
       (
         "ReleaseDate",
         (option_to_yojson date_time_to_yojson x.release_date));
       (
         "Id",
         (option_to_yojson patch_id_to_yojson x.id));
       
  ])

let patch_list_to_yojson = fun tree -> list_to_yojson patch_to_yojson tree

let patch_installed_rejected_count_to_yojson = int_to_yojson

let patch_installed_pending_reboot_count_to_yojson = int_to_yojson

let patch_installed_other_count_to_yojson = int_to_yojson

let patch_installed_count_to_yojson = int_to_yojson

let default_baseline_to_yojson = bool_to_yojson

let patch_baseline_identity_to_yojson = 
  fun (x: patch_baseline_identity) -> assoc_to_yojson(
    [(
         "DefaultBaseline",
         (option_to_yojson default_baseline_to_yojson x.default_baseline));
       (
         "BaselineDescription",
         (option_to_yojson baseline_description_to_yojson x.baseline_description));
       (
         "OperatingSystem",
         (option_to_yojson operating_system_to_yojson x.operating_system));
       (
         "BaselineName",
         (option_to_yojson baseline_name_to_yojson x.baseline_name));
       (
         "BaselineId",
         (option_to_yojson baseline_id_to_yojson x.baseline_id));
       
  ])

let patch_group_patch_baseline_mapping_to_yojson = 
  fun (x: patch_group_patch_baseline_mapping) -> assoc_to_yojson(
    [(
         "BaselineIdentity",
         (option_to_yojson patch_baseline_identity_to_yojson x.baseline_identity));
       (
         "PatchGroup",
         (option_to_yojson patch_group_to_yojson x.patch_group));
       
  ])

let patch_group_patch_baseline_mapping_list_to_yojson = 
  fun tree -> list_to_yojson patch_group_patch_baseline_mapping_to_yojson tree

let patch_group_list_to_yojson = 
  fun tree -> list_to_yojson patch_group_to_yojson tree

let patch_failed_count_to_yojson = int_to_yojson

let patch_critical_non_compliant_count_to_yojson = int_to_yojson

let patch_compliance_max_results_to_yojson = int_to_yojson

let patch_compliance_data_state_to_yojson = 
  fun (x: patch_compliance_data_state) -> match x with 
 
| Failed -> `String "FAILED"
  | NotApplicable -> `String "NOT_APPLICABLE"
  | Missing -> `String "MISSING"
  | InstalledRejected -> `String "INSTALLED_REJECTED"
  | InstalledPendingReboot -> `String "INSTALLED_PENDING_REBOOT"
  | InstalledOther -> `String "INSTALLED_OTHER"
  | Installed -> `String "INSTALLED"
   

let patch_cve_ids_to_yojson = string_to_yojson

let patch_compliance_data_to_yojson = 
  fun (x: patch_compliance_data) -> assoc_to_yojson(
    [(
         "CVEIds",
         (option_to_yojson patch_cve_ids_to_yojson x.cve_ids));
       (
         "InstalledTime",
         (Some (date_time_to_yojson x.installed_time)));
       (
         "State",
         (Some (patch_compliance_data_state_to_yojson x.state)));
       (
         "Severity",
         (Some (patch_severity_to_yojson x.severity)));
       (
         "Classification",
         (Some (patch_classification_to_yojson x.classification)));
       (
         "KBId",
         (Some (patch_kb_number_to_yojson x.kb_id)));
       (
         "Title",
         (Some (patch_title_to_yojson x.title)));
       
  ])

let patch_compliance_data_list_to_yojson = 
  fun tree -> list_to_yojson patch_compliance_data_to_yojson tree

let patch_baseline_max_results_to_yojson = int_to_yojson

let patch_baseline_identity_list_to_yojson = 
  fun tree -> list_to_yojson patch_baseline_identity_to_yojson tree

let parameters_filter_value_to_yojson = string_to_yojson

let parameters_filter_value_list_to_yojson = 
  fun tree -> list_to_yojson parameters_filter_value_to_yojson tree

let parameters_filter_key_to_yojson = 
  fun (x: parameters_filter_key) -> match x with 
 
| KEY_ID -> `String "KeyId"
  | TYPE -> `String "Type"
  | NAME -> `String "Name"
   

let parameters_filter_to_yojson = 
  fun (x: parameters_filter) -> assoc_to_yojson(
    [(
         "Values",
         (Some (parameters_filter_value_list_to_yojson x.values)));
       (
         "Key",
         (Some (parameters_filter_key_to_yojson x.key)));
       
  ])

let parameters_filter_list_to_yojson = 
  fun tree -> list_to_yojson parameters_filter_to_yojson tree

let parameter_version_label_limit_exceeded_to_yojson = 
  fun (x: parameter_version_label_limit_exceeded) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let parameter_string_query_option_to_yojson = string_to_yojson

let parameter_string_filter_value_to_yojson = string_to_yojson

let parameter_string_filter_value_list_to_yojson = 
  fun tree -> list_to_yojson parameter_string_filter_value_to_yojson tree

let parameter_string_filter_key_to_yojson = string_to_yojson

let parameter_string_filter_to_yojson = 
  fun (x: parameter_string_filter) -> assoc_to_yojson(
    [(
         "Values",
         (option_to_yojson parameter_string_filter_value_list_to_yojson x.values));
       (
         "Option",
         (option_to_yojson parameter_string_query_option_to_yojson x.option_));
       (
         "Key",
         (Some (parameter_string_filter_key_to_yojson x.key)));
       
  ])

let parameter_string_filter_list_to_yojson = 
  fun tree -> list_to_yojson parameter_string_filter_to_yojson tree

let parameter_inline_policy_to_yojson = 
  fun (x: parameter_inline_policy) -> assoc_to_yojson(
    [(
         "PolicyStatus",
         (option_to_yojson string__to_yojson x.policy_status));
       (
         "PolicyType",
         (option_to_yojson string__to_yojson x.policy_type));
       (
         "PolicyText",
         (option_to_yojson string__to_yojson x.policy_text));
       
  ])

let parameter_policy_list_to_yojson = 
  fun tree -> list_to_yojson parameter_inline_policy_to_yojson tree

let parameter_name_list_to_yojson = 
  fun tree -> list_to_yojson ps_parameter_name_to_yojson tree

let parameter_metadata_to_yojson = 
  fun (x: parameter_metadata) -> assoc_to_yojson(
    [(
         "DataType",
         (option_to_yojson parameter_data_type_to_yojson x.data_type));
       (
         "Policies",
         (option_to_yojson parameter_policy_list_to_yojson x.policies));
       (
         "Tier",
         (option_to_yojson parameter_tier_to_yojson x.tier));
       (
         "Version",
         (option_to_yojson ps_parameter_version_to_yojson x.version));
       (
         "AllowedPattern",
         (option_to_yojson allowed_pattern_to_yojson x.allowed_pattern));
       (
         "Description",
         (option_to_yojson parameter_description_to_yojson x.description));
       (
         "LastModifiedUser",
         (option_to_yojson string__to_yojson x.last_modified_user));
       (
         "LastModifiedDate",
         (option_to_yojson date_time_to_yojson x.last_modified_date));
       (
         "KeyId",
         (option_to_yojson parameter_key_id_to_yojson x.key_id));
       (
         "Type",
         (option_to_yojson parameter_type_to_yojson x.type_));
       (
         "ARN",
         (option_to_yojson string__to_yojson x.ar_n));
       (
         "Name",
         (option_to_yojson ps_parameter_name_to_yojson x.name));
       
  ])

let parameter_metadata_list_to_yojson = 
  fun tree -> list_to_yojson parameter_metadata_to_yojson tree

let ps_parameter_selector_to_yojson = string_to_yojson

let parameter_to_yojson = 
  fun (x: parameter) -> assoc_to_yojson(
    [(
         "DataType",
         (option_to_yojson parameter_data_type_to_yojson x.data_type));
       (
         "ARN",
         (option_to_yojson string__to_yojson x.ar_n));
       (
         "LastModifiedDate",
         (option_to_yojson date_time_to_yojson x.last_modified_date));
       (
         "SourceResult",
         (option_to_yojson string__to_yojson x.source_result));
       (
         "Selector",
         (option_to_yojson ps_parameter_selector_to_yojson x.selector));
       (
         "Version",
         (option_to_yojson ps_parameter_version_to_yojson x.version));
       (
         "Value",
         (option_to_yojson ps_parameter_value_to_yojson x.value));
       (
         "Type",
         (option_to_yojson parameter_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson ps_parameter_name_to_yojson x.name));
       
  ])

let parameter_list_to_yojson = 
  fun tree -> list_to_yojson parameter_to_yojson tree

let parameter_history_to_yojson = 
  fun (x: parameter_history) -> assoc_to_yojson(
    [(
         "DataType",
         (option_to_yojson parameter_data_type_to_yojson x.data_type));
       (
         "Policies",
         (option_to_yojson parameter_policy_list_to_yojson x.policies));
       (
         "Tier",
         (option_to_yojson parameter_tier_to_yojson x.tier));
       (
         "Labels",
         (option_to_yojson parameter_label_list_to_yojson x.labels));
       (
         "Version",
         (option_to_yojson ps_parameter_version_to_yojson x.version));
       (
         "AllowedPattern",
         (option_to_yojson allowed_pattern_to_yojson x.allowed_pattern));
       (
         "Value",
         (option_to_yojson ps_parameter_value_to_yojson x.value));
       (
         "Description",
         (option_to_yojson parameter_description_to_yojson x.description));
       (
         "LastModifiedUser",
         (option_to_yojson string__to_yojson x.last_modified_user));
       (
         "LastModifiedDate",
         (option_to_yojson date_time_to_yojson x.last_modified_date));
       (
         "KeyId",
         (option_to_yojson parameter_key_id_to_yojson x.key_id));
       (
         "Type",
         (option_to_yojson parameter_type_to_yojson x.type_));
       (
         "Name",
         (option_to_yojson ps_parameter_name_to_yojson x.name));
       
  ])

let parameter_history_list_to_yojson = 
  fun tree -> list_to_yojson parameter_history_to_yojson tree

let output_source_type_to_yojson = string_to_yojson

let output_source_id_to_yojson = string_to_yojson

let output_source_to_yojson = 
  fun (x: output_source) -> assoc_to_yojson(
    [(
         "OutputSourceType",
         (option_to_yojson output_source_type_to_yojson x.output_source_type));
       (
         "OutputSourceId",
         (option_to_yojson output_source_id_to_yojson x.output_source_id));
       
  ])

let ops_data_type_name_to_yojson = string_to_yojson

let ops_result_attribute_to_yojson = 
  fun (x: ops_result_attribute) -> assoc_to_yojson(
    [(
         "TypeName",
         (Some (ops_data_type_name_to_yojson x.type_name)));
       
  ])

let ops_result_attribute_list_to_yojson = 
  fun tree -> list_to_yojson ops_result_attribute_to_yojson tree

let ops_metadata_resource_id_to_yojson = string_to_yojson

let ops_metadata_to_yojson = 
  fun (x: ops_metadata) -> assoc_to_yojson(
    [(
         "CreationDate",
         (option_to_yojson date_time_to_yojson x.creation_date));
       (
         "LastModifiedUser",
         (option_to_yojson string__to_yojson x.last_modified_user));
       (
         "LastModifiedDate",
         (option_to_yojson date_time_to_yojson x.last_modified_date));
       (
         "OpsMetadataArn",
         (option_to_yojson ops_metadata_arn_to_yojson x.ops_metadata_arn));
       (
         "ResourceId",
         (option_to_yojson ops_metadata_resource_id_to_yojson x.resource_id));
       
  ])

let ops_metadata_list_to_yojson = 
  fun tree -> list_to_yojson ops_metadata_to_yojson tree

let ops_metadata_limit_exceeded_exception_to_yojson = 
  fun (x: ops_metadata_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_metadata_filter_value_to_yojson = string_to_yojson

let ops_metadata_filter_value_list_to_yojson = 
  fun tree -> list_to_yojson ops_metadata_filter_value_to_yojson tree

let ops_metadata_filter_key_to_yojson = string_to_yojson

let ops_metadata_filter_to_yojson = 
  fun (x: ops_metadata_filter) -> assoc_to_yojson(
    [(
         "Values",
         (Some (ops_metadata_filter_value_list_to_yojson x.values)));
       (
         "Key",
         (Some (ops_metadata_filter_key_to_yojson x.key)));
       
  ])

let ops_metadata_filter_list_to_yojson = 
  fun tree -> list_to_yojson ops_metadata_filter_to_yojson tree

let ops_metadata_already_exists_exception_to_yojson = 
  fun (x: ops_metadata_already_exists_exception) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_item_type_to_yojson = string_to_yojson

let ops_item_source_to_yojson = string_to_yojson

let ops_item_summary_to_yojson = 
  fun (x: ops_item_summary) -> assoc_to_yojson(
    [(
         "PlannedEndTime",
         (option_to_yojson date_time_to_yojson x.planned_end_time));
       (
         "PlannedStartTime",
         (option_to_yojson date_time_to_yojson x.planned_start_time));
       (
         "ActualEndTime",
         (option_to_yojson date_time_to_yojson x.actual_end_time));
       (
         "ActualStartTime",
         (option_to_yojson date_time_to_yojson x.actual_start_time));
       (
         "OpsItemType",
         (option_to_yojson ops_item_type_to_yojson x.ops_item_type));
       (
         "Severity",
         (option_to_yojson ops_item_severity_to_yojson x.severity));
       (
         "Category",
         (option_to_yojson ops_item_category_to_yojson x.category));
       (
         "OperationalData",
         (option_to_yojson ops_item_operational_data_to_yojson x.operational_data));
       (
         "Title",
         (option_to_yojson ops_item_title_to_yojson x.title));
       (
         "OpsItemId",
         (option_to_yojson ops_item_id_to_yojson x.ops_item_id));
       (
         "Status",
         (option_to_yojson ops_item_status_to_yojson x.status));
       (
         "Source",
         (option_to_yojson ops_item_source_to_yojson x.source));
       (
         "Priority",
         (option_to_yojson ops_item_priority_to_yojson x.priority));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "LastModifiedBy",
         (option_to_yojson string__to_yojson x.last_modified_by));
       (
         "CreatedTime",
         (option_to_yojson date_time_to_yojson x.created_time));
       (
         "CreatedBy",
         (option_to_yojson string__to_yojson x.created_by));
       
  ])

let ops_item_summaries_to_yojson = 
  fun tree -> list_to_yojson ops_item_summary_to_yojson tree

let ops_item_related_items_max_results_to_yojson = int_to_yojson

let ops_item_related_items_filter_key_to_yojson = 
  fun (x: ops_item_related_items_filter_key) -> match x with 
 
| RESOURCE_URI -> `String "ResourceUri"
  | ASSOCIATION_ID -> `String "AssociationId"
  | RESOURCE_TYPE -> `String "ResourceType"
   

let ops_item_related_items_filter_value_to_yojson = string_to_yojson

let ops_item_related_items_filter_values_to_yojson = 
  fun tree -> list_to_yojson ops_item_related_items_filter_value_to_yojson tree

let ops_item_related_items_filter_operator_to_yojson = 
  fun (x: ops_item_related_items_filter_operator) -> match x with 
  | EQUAL -> `String "Equal"
     

let ops_item_related_items_filter_to_yojson = 
  fun (x: ops_item_related_items_filter) -> assoc_to_yojson(
    [(
         "Operator",
         (Some (ops_item_related_items_filter_operator_to_yojson x.operator)));
       (
         "Values",
         (Some (ops_item_related_items_filter_values_to_yojson x.values)));
       (
         "Key",
         (Some (ops_item_related_items_filter_key_to_yojson x.key)));
       
  ])

let ops_item_related_items_filters_to_yojson = 
  fun tree -> list_to_yojson ops_item_related_items_filter_to_yojson tree

let ops_item_related_item_association_id_to_yojson = string_to_yojson

let ops_item_related_item_association_resource_type_to_yojson = 
  string_to_yojson

let ops_item_related_item_association_type_to_yojson = string_to_yojson

let ops_item_related_item_association_resource_uri_to_yojson = 
  string_to_yojson

let ops_item_identity_to_yojson = 
  fun (x: ops_item_identity) -> assoc_to_yojson(
    [(
         "Arn",
         (option_to_yojson string__to_yojson x.arn));
       
  ])

let ops_item_related_item_summary_to_yojson = 
  fun (x: ops_item_related_item_summary) -> assoc_to_yojson(
    [(
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "LastModifiedBy",
         (option_to_yojson ops_item_identity_to_yojson x.last_modified_by));
       (
         "CreatedTime",
         (option_to_yojson date_time_to_yojson x.created_time));
       (
         "CreatedBy",
         (option_to_yojson ops_item_identity_to_yojson x.created_by));
       (
         "ResourceUri",
         (option_to_yojson ops_item_related_item_association_resource_uri_to_yojson x.resource_uri));
       (
         "AssociationType",
         (option_to_yojson ops_item_related_item_association_type_to_yojson x.association_type));
       (
         "ResourceType",
         (option_to_yojson ops_item_related_item_association_resource_type_to_yojson x.resource_type));
       (
         "AssociationId",
         (option_to_yojson ops_item_related_item_association_id_to_yojson x.association_id));
       (
         "OpsItemId",
         (option_to_yojson ops_item_id_to_yojson x.ops_item_id));
       
  ])

let ops_item_related_item_summaries_to_yojson = 
  fun tree -> list_to_yojson ops_item_related_item_summary_to_yojson tree

let ops_item_related_item_association_not_found_exception_to_yojson = 
  fun (x: ops_item_related_item_association_not_found_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_item_related_item_already_exists_exception_to_yojson = 
  fun (x: ops_item_related_item_already_exists_exception) -> assoc_to_yojson(
    [(
         "OpsItemId",
         (option_to_yojson ops_item_id_to_yojson x.ops_item_id));
       (
         "ResourceUri",
         (option_to_yojson ops_item_related_item_association_resource_uri_to_yojson x.resource_uri));
       (
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ops_item_max_results_to_yojson = int_to_yojson

let ops_item_filter_key_to_yojson = 
  fun (x: ops_item_filter_key) -> match x with 
 
| ACCOUNT_ID -> `String "AccountId"
  | INSIGHT_TYPE -> `String "InsightByType"
  | CHANGE_REQUEST_TARGETS_RESOURCE_GROUP -> `String "ChangeRequestByTargetsResourceGroup"
  | CHANGE_REQUEST_TEMPLATE -> `String "ChangeRequestByTemplate"
  | CHANGE_REQUEST_APPROVER_NAME -> `String "ChangeRequestByApproverName"
  | CHANGE_REQUEST_APPROVER_ARN -> `String "ChangeRequestByApproverArn"
  | CHANGE_REQUEST_REQUESTER_NAME -> `String "ChangeRequestByRequesterName"
  | CHANGE_REQUEST_REQUESTER_ARN -> `String "ChangeRequestByRequesterArn"
  | OPSITEM_TYPE -> `String "OpsItemType"
  | SEVERITY -> `String "Severity"
  | CATEGORY -> `String "Category"
  | AUTOMATION_ID -> `String "AutomationId"
  | RESOURCE_ID -> `String "ResourceId"
  | OPERATIONAL_DATA_VALUE -> `String "OperationalDataValue"
  | OPERATIONAL_DATA_KEY -> `String "OperationalDataKey"
  | OPERATIONAL_DATA -> `String "OperationalData"
  | PLANNED_END_TIME -> `String "PlannedEndTime"
  | PLANNED_START_TIME -> `String "PlannedStartTime"
  | ACTUAL_END_TIME -> `String "ActualEndTime"
  | ACTUAL_START_TIME -> `String "ActualStartTime"
  | LAST_MODIFIED_TIME -> `String "LastModifiedTime"
  | CREATED_TIME -> `String "CreatedTime"
  | OPSITEM_ID -> `String "OpsItemId"
  | TITLE -> `String "Title"
  | PRIORITY -> `String "Priority"
  | SOURCE -> `String "Source"
  | CREATED_BY -> `String "CreatedBy"
  | STATUS -> `String "Status"
   

let ops_item_filter_value_to_yojson = string_to_yojson

let ops_item_filter_values_to_yojson = 
  fun tree -> list_to_yojson ops_item_filter_value_to_yojson tree

let ops_item_filter_operator_to_yojson = 
  fun (x: ops_item_filter_operator) -> match x with 
 
| LESS_THAN -> `String "LessThan"
  | GREATER_THAN -> `String "GreaterThan"
  | CONTAINS -> `String "Contains"
  | EQUAL -> `String "Equal"
   

let ops_item_filter_to_yojson = 
  fun (x: ops_item_filter) -> assoc_to_yojson(
    [(
         "Operator",
         (Some (ops_item_filter_operator_to_yojson x.operator)));
       (
         "Values",
         (Some (ops_item_filter_values_to_yojson x.values)));
       (
         "Key",
         (Some (ops_item_filter_key_to_yojson x.key)));
       
  ])

let ops_item_filters_to_yojson = 
  fun tree -> list_to_yojson ops_item_filter_to_yojson tree

let ops_item_event_summary_to_yojson = 
  fun (x: ops_item_event_summary) -> assoc_to_yojson(
    [(
         "CreatedTime",
         (option_to_yojson date_time_to_yojson x.created_time));
       (
         "CreatedBy",
         (option_to_yojson ops_item_identity_to_yojson x.created_by));
       (
         "Detail",
         (option_to_yojson string__to_yojson x.detail));
       (
         "DetailType",
         (option_to_yojson string__to_yojson x.detail_type));
       (
         "Source",
         (option_to_yojson string__to_yojson x.source));
       (
         "EventId",
         (option_to_yojson string__to_yojson x.event_id));
       (
         "OpsItemId",
         (option_to_yojson string__to_yojson x.ops_item_id));
       
  ])

let ops_item_event_summaries_to_yojson = 
  fun tree -> list_to_yojson ops_item_event_summary_to_yojson tree

let ops_item_event_max_results_to_yojson = int_to_yojson

let ops_item_event_filter_key_to_yojson = 
  fun (x: ops_item_event_filter_key) -> match x with 
  | OPSITEM_ID -> `String "OpsItemId"
     

let ops_item_event_filter_value_to_yojson = string_to_yojson

let ops_item_event_filter_values_to_yojson = 
  fun tree -> list_to_yojson ops_item_event_filter_value_to_yojson tree

let ops_item_event_filter_operator_to_yojson = 
  fun (x: ops_item_event_filter_operator) -> match x with 
  | EQUAL -> `String "Equal"
     

let ops_item_event_filter_to_yojson = 
  fun (x: ops_item_event_filter) -> assoc_to_yojson(
    [(
         "Operator",
         (Some (ops_item_event_filter_operator_to_yojson x.operator)));
       (
         "Values",
         (Some (ops_item_event_filter_values_to_yojson x.values)));
       (
         "Key",
         (Some (ops_item_event_filter_key_to_yojson x.key)));
       
  ])

let ops_item_event_filters_to_yojson = 
  fun tree -> list_to_yojson ops_item_event_filter_to_yojson tree

let ops_item_account_id_to_yojson = string_to_yojson

let ops_item_to_yojson = 
  fun (x: ops_item) -> assoc_to_yojson(
    [(
         "OpsItemArn",
         (option_to_yojson ops_item_arn_to_yojson x.ops_item_arn));
       (
         "PlannedEndTime",
         (option_to_yojson date_time_to_yojson x.planned_end_time));
       (
         "PlannedStartTime",
         (option_to_yojson date_time_to_yojson x.planned_start_time));
       (
         "ActualEndTime",
         (option_to_yojson date_time_to_yojson x.actual_end_time));
       (
         "ActualStartTime",
         (option_to_yojson date_time_to_yojson x.actual_start_time));
       (
         "Severity",
         (option_to_yojson ops_item_severity_to_yojson x.severity));
       (
         "Category",
         (option_to_yojson ops_item_category_to_yojson x.category));
       (
         "OperationalData",
         (option_to_yojson ops_item_operational_data_to_yojson x.operational_data));
       (
         "Source",
         (option_to_yojson ops_item_source_to_yojson x.source));
       (
         "Title",
         (option_to_yojson ops_item_title_to_yojson x.title));
       (
         "Version",
         (option_to_yojson string__to_yojson x.version));
       (
         "OpsItemId",
         (option_to_yojson ops_item_id_to_yojson x.ops_item_id));
       (
         "Status",
         (option_to_yojson ops_item_status_to_yojson x.status));
       (
         "RelatedOpsItems",
         (option_to_yojson related_ops_items_to_yojson x.related_ops_items));
       (
         "Priority",
         (option_to_yojson ops_item_priority_to_yojson x.priority));
       (
         "Notifications",
         (option_to_yojson ops_item_notifications_to_yojson x.notifications));
       (
         "LastModifiedTime",
         (option_to_yojson date_time_to_yojson x.last_modified_time));
       (
         "LastModifiedBy",
         (option_to_yojson string__to_yojson x.last_modified_by));
       (
         "Description",
         (option_to_yojson ops_item_description_to_yojson x.description));
       (
         "CreatedTime",
         (option_to_yojson date_time_to_yojson x.created_time));
       (
         "OpsItemType",
         (option_to_yojson ops_item_type_to_yojson x.ops_item_type));
       (
         "CreatedBy",
         (option_to_yojson string__to_yojson x.created_by));
       
  ])

let ops_filter_value_to_yojson = string_to_yojson

let ops_filter_value_list_to_yojson = 
  fun tree -> list_to_yojson ops_filter_value_to_yojson tree

let ops_filter_operator_type_to_yojson = 
  fun (x: ops_filter_operator_type) -> match x with 
 
| EXISTS -> `String "Exists"
  | GREATER_THAN -> `String "GreaterThan"
  | LESS_THAN -> `String "LessThan"
  | BEGIN_WITH -> `String "BeginWith"
  | NOT_EQUAL -> `String "NotEqual"
  | EQUAL -> `String "Equal"
   

let ops_filter_key_to_yojson = string_to_yojson

let ops_filter_to_yojson = 
  fun (x: ops_filter) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson ops_filter_operator_type_to_yojson x.type_));
       (
         "Values",
         (Some (ops_filter_value_list_to_yojson x.values)));
       (
         "Key",
         (Some (ops_filter_key_to_yojson x.key)));
       
  ])

let ops_filter_list_to_yojson = 
  fun tree -> list_to_yojson ops_filter_to_yojson tree

let ops_entity_id_to_yojson = string_to_yojson

let ops_entity_item_capture_time_to_yojson = string_to_yojson

let ops_entity_item_entry_to_yojson = 
  fun tree -> map_to_yojson attribute_value_to_yojson tree

let ops_entity_item_entry_list_to_yojson = 
  fun tree -> list_to_yojson ops_entity_item_entry_to_yojson tree

let ops_entity_item_to_yojson = 
  fun (x: ops_entity_item) -> assoc_to_yojson(
    [(
         "Content",
         (option_to_yojson ops_entity_item_entry_list_to_yojson x.content));
       (
         "CaptureTime",
         (option_to_yojson ops_entity_item_capture_time_to_yojson x.capture_time));
       
  ])

let ops_entity_item_key_to_yojson = string_to_yojson

let ops_entity_item_map_to_yojson = 
  fun tree -> map_to_yojson ops_entity_item_to_yojson tree

let ops_entity_to_yojson = 
  fun (x: ops_entity) -> assoc_to_yojson(
    [(
         "Data",
         (option_to_yojson ops_entity_item_map_to_yojson x.data));
       (
         "Id",
         (option_to_yojson ops_entity_id_to_yojson x.id));
       
  ])

let ops_entity_list_to_yojson = 
  fun tree -> list_to_yojson ops_entity_to_yojson tree

let ops_data_attribute_name_to_yojson = string_to_yojson

let ops_aggregator_value_to_yojson = string_to_yojson

let ops_aggregator_value_key_to_yojson = string_to_yojson

let ops_aggregator_value_map_to_yojson = 
  fun tree -> map_to_yojson ops_aggregator_value_to_yojson tree

let ops_aggregator_type_to_yojson = string_to_yojson

let rec ops_aggregator_to_yojson = 
  fun (x: ops_aggregator) -> assoc_to_yojson(
    [(
         "Aggregators",
         (option_to_yojson ops_aggregator_list_to_yojson x.aggregators));
       (
         "Filters",
         (option_to_yojson ops_filter_list_to_yojson x.filters));
       (
         "Values",
         (option_to_yojson ops_aggregator_value_map_to_yojson x.values));
       (
         "AttributeName",
         (option_to_yojson ops_data_attribute_name_to_yojson x.attribute_name));
       (
         "TypeName",
         (option_to_yojson ops_data_type_name_to_yojson x.type_name));
       (
         "AggregatorType",
         (option_to_yojson ops_aggregator_type_to_yojson x.aggregator_type));
       
  ])

and ops_aggregator_list_to_yojson = 
  fun tree -> list_to_yojson ops_aggregator_to_yojson tree

let next_token_to_yojson = string_to_yojson

let modify_document_permission_response_to_yojson = 
  fun (x: modify_document_permission_response) -> assoc_to_yojson(
    [
  ])

let document_permission_type_to_yojson = 
  fun (x: document_permission_type) -> match x with 
  | SHARE -> `String "Share"
     

let account_id_to_yojson = string_to_yojson

let account_id_list_to_yojson = 
  fun tree -> list_to_yojson account_id_to_yojson tree

let modify_document_permission_request_to_yojson = 
  fun (x: modify_document_permission_request) -> assoc_to_yojson(
    [(
         "SharedDocumentVersion",
         (option_to_yojson shared_document_version_to_yojson x.shared_document_version));
       (
         "AccountIdsToRemove",
         (option_to_yojson account_id_list_to_yojson x.account_ids_to_remove));
       (
         "AccountIdsToAdd",
         (option_to_yojson account_id_list_to_yojson x.account_ids_to_add));
       (
         "PermissionType",
         (Some (document_permission_type_to_yojson x.permission_type)));
       (
         "Name",
         (Some (document_name_to_yojson x.name)));
       
  ])

let invalid_permission_type_to_yojson = 
  fun (x: invalid_permission_type) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let document_permission_limit_to_yojson = 
  fun (x: document_permission_limit) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let document_limit_exceeded_to_yojson = 
  fun (x: document_limit_exceeded) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let max_results_ec2_compatible_to_yojson = int_to_yojson

let max_results_to_yojson = int_to_yojson

let maintenance_window_identity_for_target_to_yojson = 
  fun (x: maintenance_window_identity_for_target) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let maintenance_windows_for_target_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_identity_for_target_to_yojson tree

let maintenance_window_task_target_id_to_yojson = string_to_yojson

let maintenance_window_task_parameters_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_task_parameters_to_yojson tree

let maintenance_window_task_to_yojson = 
  fun (x: maintenance_window_task) -> assoc_to_yojson(
    [(
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "CutoffBehavior",
         (option_to_yojson maintenance_window_task_cutoff_behavior_to_yojson x.cutoff_behavior));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "ServiceRoleArn",
         (option_to_yojson service_role_to_yojson x.service_role_arn));
       (
         "LoggingInfo",
         (option_to_yojson logging_info_to_yojson x.logging_info));
       (
         "Priority",
         (option_to_yojson maintenance_window_task_priority_to_yojson x.priority));
       (
         "TaskParameters",
         (option_to_yojson maintenance_window_task_parameters_to_yojson x.task_parameters));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "Type",
         (option_to_yojson maintenance_window_task_type_to_yojson x.type_));
       (
         "TaskArn",
         (option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn));
       (
         "WindowTaskId",
         (option_to_yojson maintenance_window_task_id_to_yojson x.window_task_id));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let maintenance_window_task_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_task_to_yojson tree

let maintenance_window_target_to_yojson = 
  fun (x: maintenance_window_target) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "OwnerInformation",
         (option_to_yojson owner_information_to_yojson x.owner_information));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "ResourceType",
         (option_to_yojson maintenance_window_resource_type_to_yojson x.resource_type));
       (
         "WindowTargetId",
         (option_to_yojson maintenance_window_target_id_to_yojson x.window_target_id));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let maintenance_window_target_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_target_to_yojson tree

let maintenance_window_search_max_results_to_yojson = int_to_yojson

let maintenance_window_max_results_to_yojson = int_to_yojson

let maintenance_window_identity_to_yojson = 
  fun (x: maintenance_window_identity) -> assoc_to_yojson(
    [(
         "NextExecutionTime",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.next_execution_time));
       (
         "StartDate",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.start_date));
       (
         "EndDate",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.end_date));
       (
         "ScheduleOffset",
         (option_to_yojson maintenance_window_offset_to_yojson x.schedule_offset));
       (
         "ScheduleTimezone",
         (option_to_yojson maintenance_window_timezone_to_yojson x.schedule_timezone));
       (
         "Schedule",
         (option_to_yojson maintenance_window_schedule_to_yojson x.schedule));
       (
         "Cutoff",
         (option_to_yojson maintenance_window_cutoff_to_yojson x.cutoff));
       (
         "Duration",
         (option_to_yojson maintenance_window_duration_hours_to_yojson x.duration));
       (
         "Enabled",
         (option_to_yojson maintenance_window_enabled_to_yojson x.enabled));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let maintenance_window_identity_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_identity_to_yojson tree

let maintenance_window_filter_value_to_yojson = string_to_yojson

let maintenance_window_filter_values_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_filter_value_to_yojson tree

let maintenance_window_filter_key_to_yojson = string_to_yojson

let maintenance_window_filter_to_yojson = 
  fun (x: maintenance_window_filter) -> assoc_to_yojson(
    [(
         "Values",
         (option_to_yojson maintenance_window_filter_values_to_yojson x.values));
       (
         "Key",
         (option_to_yojson maintenance_window_filter_key_to_yojson x.key));
       
  ])

let maintenance_window_filter_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_filter_to_yojson tree

let maintenance_window_execution_task_invocation_parameters_to_yojson = 
  string_to_yojson

let maintenance_window_execution_id_to_yojson = string_to_yojson

let maintenance_window_execution_task_id_to_yojson = string_to_yojson

let maintenance_window_execution_task_invocation_id_to_yojson = 
  string_to_yojson

let maintenance_window_execution_task_execution_id_to_yojson = 
  string_to_yojson

let maintenance_window_execution_status_to_yojson = 
  fun (x: maintenance_window_execution_status) -> match x with 
 
| SkippedOverlapping -> `String "SKIPPED_OVERLAPPING"
  | Cancelled -> `String "CANCELLED"
  | Cancelling -> `String "CANCELLING"
  | TimedOut -> `String "TIMED_OUT"
  | Failed -> `String "FAILED"
  | Success -> `String "SUCCESS"
  | InProgress -> `String "IN_PROGRESS"
  | Pending -> `String "PENDING"
   

let maintenance_window_execution_status_details_to_yojson = 
  string_to_yojson

let maintenance_window_execution_task_invocation_identity_to_yojson = 
  fun (x: maintenance_window_execution_task_invocation_identity) -> assoc_to_yojson(
    [(
         "WindowTargetId",
         (option_to_yojson maintenance_window_task_target_id_to_yojson x.window_target_id));
       (
         "OwnerInformation",
         (option_to_yojson owner_information_to_yojson x.owner_information));
       (
         "EndTime",
         (option_to_yojson date_time_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "StatusDetails",
         (option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details));
       (
         "Status",
         (option_to_yojson maintenance_window_execution_status_to_yojson x.status));
       (
         "Parameters",
         (option_to_yojson maintenance_window_execution_task_invocation_parameters_to_yojson x.parameters));
       (
         "TaskType",
         (option_to_yojson maintenance_window_task_type_to_yojson x.task_type));
       (
         "ExecutionId",
         (option_to_yojson maintenance_window_execution_task_execution_id_to_yojson x.execution_id));
       (
         "InvocationId",
         (option_to_yojson maintenance_window_execution_task_invocation_id_to_yojson x.invocation_id));
       (
         "TaskExecutionId",
         (option_to_yojson maintenance_window_execution_task_id_to_yojson x.task_execution_id));
       (
         "WindowExecutionId",
         (option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id));
       
  ])

let maintenance_window_execution_task_invocation_identity_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_execution_task_invocation_identity_to_yojson tree

let maintenance_window_execution_task_identity_to_yojson = 
  fun (x: maintenance_window_execution_task_identity) -> assoc_to_yojson(
    [(
         "TriggeredAlarms",
         (option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms));
       (
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "TaskType",
         (option_to_yojson maintenance_window_task_type_to_yojson x.task_type));
       (
         "TaskArn",
         (option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn));
       (
         "EndTime",
         (option_to_yojson date_time_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "StatusDetails",
         (option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details));
       (
         "Status",
         (option_to_yojson maintenance_window_execution_status_to_yojson x.status));
       (
         "TaskExecutionId",
         (option_to_yojson maintenance_window_execution_task_id_to_yojson x.task_execution_id));
       (
         "WindowExecutionId",
         (option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id));
       
  ])

let maintenance_window_execution_task_identity_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_execution_task_identity_to_yojson tree

let maintenance_window_execution_task_id_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_execution_task_id_to_yojson tree

let maintenance_window_execution_to_yojson = 
  fun (x: maintenance_window_execution) -> assoc_to_yojson(
    [(
         "EndTime",
         (option_to_yojson date_time_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "StatusDetails",
         (option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details));
       (
         "Status",
         (option_to_yojson maintenance_window_execution_status_to_yojson x.status));
       (
         "WindowExecutionId",
         (option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let maintenance_window_execution_list_to_yojson = 
  fun tree -> list_to_yojson maintenance_window_execution_to_yojson tree

let list_tags_for_resource_result_to_yojson = 
  fun (x: list_tags_for_resource_result) -> assoc_to_yojson(
    [(
         "TagList",
         (option_to_yojson tag_list_to_yojson x.tag_list));
       
  ])

let list_tags_for_resource_request_to_yojson = 
  fun (x: list_tags_for_resource_request) -> assoc_to_yojson(
    [(
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       (
         "ResourceType",
         (Some (resource_type_for_tagging_to_yojson x.resource_type)));
       
  ])

let list_resource_data_sync_result_to_yojson = 
  fun (x: list_resource_data_sync_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ResourceDataSyncItems",
         (option_to_yojson resource_data_sync_item_list_to_yojson x.resource_data_sync_items));
       
  ])

let list_resource_data_sync_request_to_yojson = 
  fun (x: list_resource_data_sync_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "SyncType",
         (option_to_yojson resource_data_sync_type_to_yojson x.sync_type));
       
  ])

let invalid_next_token_to_yojson = 
  fun (x: invalid_next_token) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let list_resource_compliance_summaries_result_to_yojson = 
  fun (x: list_resource_compliance_summaries_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ResourceComplianceSummaryItems",
         (option_to_yojson resource_compliance_summary_item_list_to_yojson x.resource_compliance_summary_items));
       
  ])

let compliance_string_filter_key_to_yojson = string_to_yojson

let compliance_filter_value_to_yojson = string_to_yojson

let compliance_string_filter_value_list_to_yojson = 
  fun tree -> list_to_yojson compliance_filter_value_to_yojson tree

let compliance_query_operator_type_to_yojson = 
  fun (x: compliance_query_operator_type) -> match x with 
 
| GreaterThan -> `String "GREATER_THAN"
  | LessThan -> `String "LESS_THAN"
  | BeginWith -> `String "BEGIN_WITH"
  | NotEqual -> `String "NOT_EQUAL"
  | Equal -> `String "EQUAL"
   

let compliance_string_filter_to_yojson = 
  fun (x: compliance_string_filter) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson compliance_query_operator_type_to_yojson x.type_));
       (
         "Values",
         (option_to_yojson compliance_string_filter_value_list_to_yojson x.values));
       (
         "Key",
         (option_to_yojson compliance_string_filter_key_to_yojson x.key));
       
  ])

let compliance_string_filter_list_to_yojson = 
  fun tree -> list_to_yojson compliance_string_filter_to_yojson tree

let list_resource_compliance_summaries_request_to_yojson = 
  fun (x: list_resource_compliance_summaries_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Filters",
         (option_to_yojson compliance_string_filter_list_to_yojson x.filters));
       
  ])

let invalid_filter_to_yojson = 
  fun (x: invalid_filter) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let list_ops_metadata_result_to_yojson = 
  fun (x: list_ops_metadata_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "OpsMetadataList",
         (option_to_yojson ops_metadata_list_to_yojson x.ops_metadata_list));
       
  ])

let list_ops_metadata_max_results_to_yojson = int_to_yojson

let list_ops_metadata_request_to_yojson = 
  fun (x: list_ops_metadata_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_ops_metadata_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson ops_metadata_filter_list_to_yojson x.filters));
       
  ])

let list_ops_item_related_items_response_to_yojson = 
  fun (x: list_ops_item_related_items_response) -> assoc_to_yojson(
    [(
         "Summaries",
         (option_to_yojson ops_item_related_item_summaries_to_yojson x.summaries));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let list_ops_item_related_items_request_to_yojson = 
  fun (x: list_ops_item_related_items_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson ops_item_related_items_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson ops_item_related_items_filters_to_yojson x.filters));
       (
         "OpsItemId",
         (option_to_yojson ops_item_id_to_yojson x.ops_item_id));
       
  ])

let list_ops_item_events_response_to_yojson = 
  fun (x: list_ops_item_events_response) -> assoc_to_yojson(
    [(
         "Summaries",
         (option_to_yojson ops_item_event_summaries_to_yojson x.summaries));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let list_ops_item_events_request_to_yojson = 
  fun (x: list_ops_item_events_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson ops_item_event_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson ops_item_event_filters_to_yojson x.filters));
       
  ])

let list_inventory_entries_result_to_yojson = 
  fun (x: list_inventory_entries_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Entries",
         (option_to_yojson inventory_item_entry_list_to_yojson x.entries));
       (
         "CaptureTime",
         (option_to_yojson inventory_item_capture_time_to_yojson x.capture_time));
       (
         "SchemaVersion",
         (option_to_yojson inventory_item_schema_version_to_yojson x.schema_version));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "TypeName",
         (option_to_yojson inventory_item_type_name_to_yojson x.type_name));
       
  ])

let inventory_filter_key_to_yojson = string_to_yojson

let inventory_filter_value_to_yojson = string_to_yojson

let inventory_filter_value_list_to_yojson = 
  fun tree -> list_to_yojson inventory_filter_value_to_yojson tree

let inventory_query_operator_type_to_yojson = 
  fun (x: inventory_query_operator_type) -> match x with 
 
| EXISTS -> `String "Exists"
  | GREATER_THAN -> `String "GreaterThan"
  | LESS_THAN -> `String "LessThan"
  | BEGIN_WITH -> `String "BeginWith"
  | NOT_EQUAL -> `String "NotEqual"
  | EQUAL -> `String "Equal"
   

let inventory_filter_to_yojson = 
  fun (x: inventory_filter) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson inventory_query_operator_type_to_yojson x.type_));
       (
         "Values",
         (Some (inventory_filter_value_list_to_yojson x.values)));
       (
         "Key",
         (Some (inventory_filter_key_to_yojson x.key)));
       
  ])

let inventory_filter_list_to_yojson = 
  fun tree -> list_to_yojson inventory_filter_to_yojson tree

let list_inventory_entries_request_to_yojson = 
  fun (x: list_inventory_entries_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Filters",
         (option_to_yojson inventory_filter_list_to_yojson x.filters));
       (
         "TypeName",
         (Some (inventory_item_type_name_to_yojson x.type_name)));
       (
         "InstanceId",
         (Some (instance_id_to_yojson x.instance_id)));
       
  ])

let document_identifier_to_yojson = 
  fun (x: document_identifier) -> assoc_to_yojson(
    [(
         "Author",
         (option_to_yojson document_author_to_yojson x.author));
       (
         "ReviewStatus",
         (option_to_yojson review_status_to_yojson x.review_status));
       (
         "Requires",
         (option_to_yojson document_requires_list_to_yojson x.requires));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "TargetType",
         (option_to_yojson target_type_to_yojson x.target_type));
       (
         "DocumentFormat",
         (option_to_yojson document_format_to_yojson x.document_format));
       (
         "SchemaVersion",
         (option_to_yojson document_schema_version_to_yojson x.schema_version));
       (
         "DocumentType",
         (option_to_yojson document_type_to_yojson x.document_type));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "PlatformTypes",
         (option_to_yojson platform_type_list_to_yojson x.platform_types));
       (
         "VersionName",
         (option_to_yojson document_version_name_to_yojson x.version_name));
       (
         "Owner",
         (option_to_yojson document_owner_to_yojson x.owner));
       (
         "DisplayName",
         (option_to_yojson document_display_name_to_yojson x.display_name));
       (
         "CreatedDate",
         (option_to_yojson date_time_to_yojson x.created_date));
       (
         "Name",
         (option_to_yojson document_ar_n_to_yojson x.name));
       
  ])

let document_identifier_list_to_yojson = 
  fun tree -> list_to_yojson document_identifier_to_yojson tree

let list_documents_result_to_yojson = 
  fun (x: list_documents_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DocumentIdentifiers",
         (option_to_yojson document_identifier_list_to_yojson x.document_identifiers));
       
  ])

let document_filter_key_to_yojson = 
  fun (x: document_filter_key) -> match x with 
 
| DocumentType -> `String "DocumentType"
  | PlatformTypes -> `String "PlatformTypes"
  | Owner -> `String "Owner"
  | Name -> `String "Name"
   

let document_filter_value_to_yojson = string_to_yojson

let document_filter_to_yojson = 
  fun (x: document_filter) -> assoc_to_yojson(
    [(
         "value",
         (Some (document_filter_value_to_yojson x.value)));
       (
         "key",
         (Some (document_filter_key_to_yojson x.key)));
       
  ])

let document_filter_list_to_yojson = 
  fun tree -> list_to_yojson document_filter_to_yojson tree

let document_key_values_filter_key_to_yojson = string_to_yojson

let document_key_values_filter_value_to_yojson = string_to_yojson

let document_key_values_filter_values_to_yojson = 
  fun tree -> list_to_yojson document_key_values_filter_value_to_yojson tree

let document_key_values_filter_to_yojson = 
  fun (x: document_key_values_filter) -> assoc_to_yojson(
    [(
         "Values",
         (option_to_yojson document_key_values_filter_values_to_yojson x.values));
       (
         "Key",
         (option_to_yojson document_key_values_filter_key_to_yojson x.key));
       
  ])

let document_key_values_filter_list_to_yojson = 
  fun tree -> list_to_yojson document_key_values_filter_to_yojson tree

let list_documents_request_to_yojson = 
  fun (x: list_documents_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson document_key_values_filter_list_to_yojson x.filters));
       (
         "DocumentFilterList",
         (option_to_yojson document_filter_list_to_yojson x.document_filter_list));
       
  ])

let invalid_filter_key_to_yojson = 
  fun (x: invalid_filter_key) -> assoc_to_yojson(
    [
  ])

let document_version_info_to_yojson = 
  fun (x: document_version_info) -> assoc_to_yojson(
    [(
         "ReviewStatus",
         (option_to_yojson review_status_to_yojson x.review_status));
       (
         "StatusInformation",
         (option_to_yojson document_status_information_to_yojson x.status_information));
       (
         "Status",
         (option_to_yojson document_status_to_yojson x.status));
       (
         "DocumentFormat",
         (option_to_yojson document_format_to_yojson x.document_format));
       (
         "IsDefaultVersion",
         (option_to_yojson boolean__to_yojson x.is_default_version));
       (
         "CreatedDate",
         (option_to_yojson date_time_to_yojson x.created_date));
       (
         "VersionName",
         (option_to_yojson document_version_name_to_yojson x.version_name));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DisplayName",
         (option_to_yojson document_display_name_to_yojson x.display_name));
       (
         "Name",
         (option_to_yojson document_name_to_yojson x.name));
       
  ])

let document_version_list_to_yojson = 
  fun tree -> list_to_yojson document_version_info_to_yojson tree

let list_document_versions_result_to_yojson = 
  fun (x: list_document_versions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DocumentVersions",
         (option_to_yojson document_version_list_to_yojson x.document_versions));
       
  ])

let list_document_versions_request_to_yojson = 
  fun (x: list_document_versions_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "Name",
         (Some (document_ar_n_to_yojson x.name)));
       
  ])

let document_reviewer_response_source_to_yojson = 
  fun (x: document_reviewer_response_source) -> assoc_to_yojson(
    [(
         "Reviewer",
         (option_to_yojson reviewer_to_yojson x.reviewer));
       (
         "Comment",
         (option_to_yojson document_review_comment_list_to_yojson x.comment));
       (
         "ReviewStatus",
         (option_to_yojson review_status_to_yojson x.review_status));
       (
         "UpdatedTime",
         (option_to_yojson date_time_to_yojson x.updated_time));
       (
         "CreateTime",
         (option_to_yojson date_time_to_yojson x.create_time));
       
  ])

let document_reviewer_response_list_to_yojson = 
  fun tree -> list_to_yojson document_reviewer_response_source_to_yojson tree

let document_metadata_response_info_to_yojson = 
  fun (x: document_metadata_response_info) -> assoc_to_yojson(
    [(
         "ReviewerResponse",
         (option_to_yojson document_reviewer_response_list_to_yojson x.reviewer_response));
       
  ])

let list_document_metadata_history_response_to_yojson = 
  fun (x: list_document_metadata_history_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Metadata",
         (option_to_yojson document_metadata_response_info_to_yojson x.metadata));
       (
         "Author",
         (option_to_yojson document_author_to_yojson x.author));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "Name",
         (option_to_yojson document_name_to_yojson x.name));
       
  ])

let document_metadata_enum_to_yojson = 
  fun (x: document_metadata_enum) -> match x with 
  | DocumentReviews -> `String "DocumentReviews"
     

let list_document_metadata_history_request_to_yojson = 
  fun (x: list_document_metadata_history_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Metadata",
         (Some (document_metadata_enum_to_yojson x.metadata)));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "Name",
         (Some (document_name_to_yojson x.name)));
       
  ])

let compliance_summary_item_to_yojson = 
  fun (x: compliance_summary_item) -> assoc_to_yojson(
    [(
         "NonCompliantSummary",
         (option_to_yojson non_compliant_summary_to_yojson x.non_compliant_summary));
       (
         "CompliantSummary",
         (option_to_yojson compliant_summary_to_yojson x.compliant_summary));
       (
         "ComplianceType",
         (option_to_yojson compliance_type_name_to_yojson x.compliance_type));
       
  ])

let compliance_summary_item_list_to_yojson = 
  fun tree -> list_to_yojson compliance_summary_item_to_yojson tree

let list_compliance_summaries_result_to_yojson = 
  fun (x: list_compliance_summaries_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ComplianceSummaryItems",
         (option_to_yojson compliance_summary_item_list_to_yojson x.compliance_summary_items));
       
  ])

let list_compliance_summaries_request_to_yojson = 
  fun (x: list_compliance_summaries_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Filters",
         (option_to_yojson compliance_string_filter_list_to_yojson x.filters));
       
  ])

let compliance_item_to_yojson = 
  fun (x: compliance_item) -> assoc_to_yojson(
    [(
         "Details",
         (option_to_yojson compliance_item_details_to_yojson x.details));
       (
         "ExecutionSummary",
         (option_to_yojson compliance_execution_summary_to_yojson x.execution_summary));
       (
         "Severity",
         (option_to_yojson compliance_severity_to_yojson x.severity));
       (
         "Status",
         (option_to_yojson compliance_status_to_yojson x.status));
       (
         "Title",
         (option_to_yojson compliance_item_title_to_yojson x.title));
       (
         "Id",
         (option_to_yojson compliance_item_id_to_yojson x.id));
       (
         "ResourceId",
         (option_to_yojson compliance_resource_id_to_yojson x.resource_id));
       (
         "ResourceType",
         (option_to_yojson compliance_resource_type_to_yojson x.resource_type));
       (
         "ComplianceType",
         (option_to_yojson compliance_type_name_to_yojson x.compliance_type));
       
  ])

let compliance_item_list_to_yojson = 
  fun tree -> list_to_yojson compliance_item_to_yojson tree

let list_compliance_items_result_to_yojson = 
  fun (x: list_compliance_items_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ComplianceItems",
         (option_to_yojson compliance_item_list_to_yojson x.compliance_items));
       
  ])

let compliance_resource_id_list_to_yojson = 
  fun tree -> list_to_yojson compliance_resource_id_to_yojson tree

let compliance_resource_type_list_to_yojson = 
  fun tree -> list_to_yojson compliance_resource_type_to_yojson tree

let list_compliance_items_request_to_yojson = 
  fun (x: list_compliance_items_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ResourceTypes",
         (option_to_yojson compliance_resource_type_list_to_yojson x.resource_types));
       (
         "ResourceIds",
         (option_to_yojson compliance_resource_id_list_to_yojson x.resource_ids));
       (
         "Filters",
         (option_to_yojson compliance_string_filter_list_to_yojson x.filters));
       
  ])

let command_list_to_yojson = 
  fun tree -> list_to_yojson command_to_yojson tree

let list_commands_result_to_yojson = 
  fun (x: list_commands_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Commands",
         (option_to_yojson command_list_to_yojson x.commands));
       
  ])

let command_max_results_to_yojson = int_to_yojson

let command_filter_key_to_yojson = 
  fun (x: command_filter_key) -> match x with 
 
| DOCUMENT_NAME -> `String "DocumentName"
  | EXECUTION_STAGE -> `String "ExecutionStage"
  | STATUS -> `String "Status"
  | INVOKED_BEFORE -> `String "InvokedBefore"
  | INVOKED_AFTER -> `String "InvokedAfter"
   

let command_filter_value_to_yojson = string_to_yojson

let command_filter_to_yojson = 
  fun (x: command_filter) -> assoc_to_yojson(
    [(
         "value",
         (Some (command_filter_value_to_yojson x.value)));
       (
         "key",
         (Some (command_filter_key_to_yojson x.key)));
       
  ])

let command_filter_list_to_yojson = 
  fun tree -> list_to_yojson command_filter_to_yojson tree

let list_commands_request_to_yojson = 
  fun (x: list_commands_request) -> assoc_to_yojson(
    [(
         "Filters",
         (option_to_yojson command_filter_list_to_yojson x.filters));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson command_max_results_to_yojson x.max_results));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "CommandId",
         (option_to_yojson command_id_to_yojson x.command_id));
       
  ])

let invalid_command_id_to_yojson = 
  fun (x: invalid_command_id) -> assoc_to_yojson(
    [
  ])

let instance_tag_name_to_yojson = string_to_yojson

let command_invocation_status_to_yojson = 
  fun (x: command_invocation_status) -> match x with 
 
| CANCELLING -> `String "Cancelling"
  | FAILED -> `String "Failed"
  | TIMED_OUT -> `String "TimedOut"
  | CANCELLED -> `String "Cancelled"
  | SUCCESS -> `String "Success"
  | DELAYED -> `String "Delayed"
  | IN_PROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"
   

let invocation_trace_output_to_yojson = string_to_yojson

let command_plugin_name_to_yojson = string_to_yojson

let command_plugin_status_to_yojson = 
  fun (x: command_plugin_status) -> match x with 
 
| FAILED -> `String "Failed"
  | CANCELLED -> `String "Cancelled"
  | TIMED_OUT -> `String "TimedOut"
  | SUCCESS -> `String "Success"
  | IN_PROGRESS -> `String "InProgress"
  | PENDING -> `String "Pending"
   

let command_plugin_output_to_yojson = string_to_yojson

let command_plugin_to_yojson = 
  fun (x: command_plugin) -> assoc_to_yojson(
    [(
         "OutputS3KeyPrefix",
         (option_to_yojson s3_key_prefix_to_yojson x.output_s3_key_prefix));
       (
         "OutputS3BucketName",
         (option_to_yojson s3_bucket_name_to_yojson x.output_s3_bucket_name));
       (
         "OutputS3Region",
         (option_to_yojson s3_region_to_yojson x.output_s3_region));
       (
         "StandardErrorUrl",
         (option_to_yojson url_to_yojson x.standard_error_url));
       (
         "StandardOutputUrl",
         (option_to_yojson url_to_yojson x.standard_output_url));
       (
         "Output",
         (option_to_yojson command_plugin_output_to_yojson x.output));
       (
         "ResponseFinishDateTime",
         (option_to_yojson date_time_to_yojson x.response_finish_date_time));
       (
         "ResponseStartDateTime",
         (option_to_yojson date_time_to_yojson x.response_start_date_time));
       (
         "ResponseCode",
         (option_to_yojson response_code_to_yojson x.response_code));
       (
         "StatusDetails",
         (option_to_yojson status_details_to_yojson x.status_details));
       (
         "Status",
         (option_to_yojson command_plugin_status_to_yojson x.status));
       (
         "Name",
         (option_to_yojson command_plugin_name_to_yojson x.name));
       
  ])

let command_plugin_list_to_yojson = 
  fun tree -> list_to_yojson command_plugin_to_yojson tree

let command_invocation_to_yojson = 
  fun (x: command_invocation) -> assoc_to_yojson(
    [(
         "CloudWatchOutputConfig",
         (option_to_yojson cloud_watch_output_config_to_yojson x.cloud_watch_output_config));
       (
         "NotificationConfig",
         (option_to_yojson notification_config_to_yojson x.notification_config));
       (
         "ServiceRole",
         (option_to_yojson service_role_to_yojson x.service_role));
       (
         "CommandPlugins",
         (option_to_yojson command_plugin_list_to_yojson x.command_plugins));
       (
         "StandardErrorUrl",
         (option_to_yojson url_to_yojson x.standard_error_url));
       (
         "StandardOutputUrl",
         (option_to_yojson url_to_yojson x.standard_output_url));
       (
         "TraceOutput",
         (option_to_yojson invocation_trace_output_to_yojson x.trace_output));
       (
         "StatusDetails",
         (option_to_yojson status_details_to_yojson x.status_details));
       (
         "Status",
         (option_to_yojson command_invocation_status_to_yojson x.status));
       (
         "RequestedDateTime",
         (option_to_yojson date_time_to_yojson x.requested_date_time));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DocumentName",
         (option_to_yojson document_name_to_yojson x.document_name));
       (
         "Comment",
         (option_to_yojson comment_to_yojson x.comment));
       (
         "InstanceName",
         (option_to_yojson instance_tag_name_to_yojson x.instance_name));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "CommandId",
         (option_to_yojson command_id_to_yojson x.command_id));
       
  ])

let command_invocation_list_to_yojson = 
  fun tree -> list_to_yojson command_invocation_to_yojson tree

let list_command_invocations_result_to_yojson = 
  fun (x: list_command_invocations_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "CommandInvocations",
         (option_to_yojson command_invocation_list_to_yojson x.command_invocations));
       
  ])

let list_command_invocations_request_to_yojson = 
  fun (x: list_command_invocations_request) -> assoc_to_yojson(
    [(
         "Details",
         (option_to_yojson boolean__to_yojson x.details));
       (
         "Filters",
         (option_to_yojson command_filter_list_to_yojson x.filters));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson command_max_results_to_yojson x.max_results));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "CommandId",
         (option_to_yojson command_id_to_yojson x.command_id));
       
  ])

let association_to_yojson = 
  fun (x: association) -> assoc_to_yojson(
    [(
         "TargetMaps",
         (option_to_yojson target_maps_to_yojson x.target_maps));
       (
         "Duration",
         (option_to_yojson duration_to_yojson x.duration));
       (
         "ScheduleOffset",
         (option_to_yojson schedule_offset_to_yojson x.schedule_offset));
       (
         "AssociationName",
         (option_to_yojson association_name_to_yojson x.association_name));
       (
         "ScheduleExpression",
         (option_to_yojson schedule_expression_to_yojson x.schedule_expression));
       (
         "Overview",
         (option_to_yojson association_overview_to_yojson x.overview));
       (
         "LastExecutionDate",
         (option_to_yojson date_time_to_yojson x.last_execution_date));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "AssociationVersion",
         (option_to_yojson association_version_to_yojson x.association_version));
       (
         "AssociationId",
         (option_to_yojson association_id_to_yojson x.association_id));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "Name",
         (option_to_yojson document_ar_n_to_yojson x.name));
       
  ])

let association_list_to_yojson = 
  fun tree -> list_to_yojson association_to_yojson tree

let list_associations_result_to_yojson = 
  fun (x: list_associations_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Associations",
         (option_to_yojson association_list_to_yojson x.associations));
       
  ])

let association_filter_key_to_yojson = 
  fun (x: association_filter_key) -> match x with 
 
| ResourceGroupName -> `String "ResourceGroupName"
  | AssociationName -> `String "AssociationName"
  | LastExecutedAfter -> `String "LastExecutedAfter"
  | LastExecutedBefore -> `String "LastExecutedBefore"
  | Status -> `String "AssociationStatusName"
  | AssociationId -> `String "AssociationId"
  | Name -> `String "Name"
  | InstanceId -> `String "InstanceId"
   

let association_filter_value_to_yojson = string_to_yojson

let association_filter_to_yojson = 
  fun (x: association_filter) -> assoc_to_yojson(
    [(
         "value",
         (Some (association_filter_value_to_yojson x.value)));
       (
         "key",
         (Some (association_filter_key_to_yojson x.key)));
       
  ])

let association_filter_list_to_yojson = 
  fun tree -> list_to_yojson association_filter_to_yojson tree

let list_associations_request_to_yojson = 
  fun (x: list_associations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "AssociationFilterList",
         (option_to_yojson association_filter_list_to_yojson x.association_filter_list));
       
  ])

let association_version_info_to_yojson = 
  fun (x: association_version_info) -> assoc_to_yojson(
    [(
         "TargetMaps",
         (option_to_yojson target_maps_to_yojson x.target_maps));
       (
         "Duration",
         (option_to_yojson duration_to_yojson x.duration));
       (
         "ScheduleOffset",
         (option_to_yojson schedule_offset_to_yojson x.schedule_offset));
       (
         "TargetLocations",
         (option_to_yojson target_locations_to_yojson x.target_locations));
       (
         "CalendarNames",
         (option_to_yojson calendar_name_or_arn_list_to_yojson x.calendar_names));
       (
         "ApplyOnlyAtCronInterval",
         (option_to_yojson apply_only_at_cron_interval_to_yojson x.apply_only_at_cron_interval));
       (
         "SyncCompliance",
         (option_to_yojson association_sync_compliance_to_yojson x.sync_compliance));
       (
         "ComplianceSeverity",
         (option_to_yojson association_compliance_severity_to_yojson x.compliance_severity));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "AssociationName",
         (option_to_yojson association_name_to_yojson x.association_name));
       (
         "OutputLocation",
         (option_to_yojson instance_association_output_location_to_yojson x.output_location));
       (
         "ScheduleExpression",
         (option_to_yojson schedule_expression_to_yojson x.schedule_expression));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "Parameters",
         (option_to_yojson parameters_to_yojson x.parameters));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "Name",
         (option_to_yojson document_ar_n_to_yojson x.name));
       (
         "CreatedDate",
         (option_to_yojson date_time_to_yojson x.created_date));
       (
         "AssociationVersion",
         (option_to_yojson association_version_to_yojson x.association_version));
       (
         "AssociationId",
         (option_to_yojson association_id_to_yojson x.association_id));
       
  ])

let association_version_list_to_yojson = 
  fun tree -> list_to_yojson association_version_info_to_yojson tree

let list_association_versions_result_to_yojson = 
  fun (x: list_association_versions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AssociationVersions",
         (option_to_yojson association_version_list_to_yojson x.association_versions));
       
  ])

let list_association_versions_request_to_yojson = 
  fun (x: list_association_versions_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "AssociationId",
         (Some (association_id_to_yojson x.association_id)));
       
  ])

let label_parameter_version_result_to_yojson = 
  fun (x: label_parameter_version_result) -> assoc_to_yojson(
    [(
         "ParameterVersion",
         (option_to_yojson ps_parameter_version_to_yojson x.parameter_version));
       (
         "InvalidLabels",
         (option_to_yojson parameter_label_list_to_yojson x.invalid_labels));
       
  ])

let label_parameter_version_request_to_yojson = 
  fun (x: label_parameter_version_request) -> assoc_to_yojson(
    [(
         "Labels",
         (Some (parameter_label_list_to_yojson x.labels)));
       (
         "ParameterVersion",
         (option_to_yojson ps_parameter_version_to_yojson x.parameter_version));
       (
         "Name",
         (Some (ps_parameter_name_to_yojson x.name)));
       
  ])

let key_name_to_yojson = string_to_yojson

let is_sub_type_schema_to_yojson = bool_to_yojson

let invocation_does_not_exist_to_yojson = 
  fun (x: invocation_does_not_exist) -> assoc_to_yojson(
    [
  ])

let inventory_type_display_name_to_yojson = string_to_yojson

let inventory_schema_delete_option_to_yojson = 
  fun (x: inventory_schema_delete_option) -> match x with 
 
| DELETE_SCHEMA -> `String "DeleteSchema"
  | DISABLE_SCHEMA -> `String "DisableSchema"
   

let inventory_result_item_to_yojson = 
  fun (x: inventory_result_item) -> assoc_to_yojson(
    [(
         "Content",
         (Some (inventory_item_entry_list_to_yojson x.content)));
       (
         "ContentHash",
         (option_to_yojson inventory_item_content_hash_to_yojson x.content_hash));
       (
         "CaptureTime",
         (option_to_yojson inventory_item_capture_time_to_yojson x.capture_time));
       (
         "SchemaVersion",
         (Some (inventory_item_schema_version_to_yojson x.schema_version)));
       (
         "TypeName",
         (Some (inventory_item_type_name_to_yojson x.type_name)));
       
  ])

let inventory_result_item_key_to_yojson = string_to_yojson

let inventory_result_item_map_to_yojson = 
  fun tree -> map_to_yojson inventory_result_item_to_yojson tree

let inventory_result_entity_id_to_yojson = string_to_yojson

let inventory_result_entity_to_yojson = 
  fun (x: inventory_result_entity) -> assoc_to_yojson(
    [(
         "Data",
         (option_to_yojson inventory_result_item_map_to_yojson x.data));
       (
         "Id",
         (option_to_yojson inventory_result_entity_id_to_yojson x.id));
       
  ])

let inventory_result_entity_list_to_yojson = 
  fun tree -> list_to_yojson inventory_result_entity_to_yojson tree

let inventory_item_type_name_filter_to_yojson = string_to_yojson

let inventory_item_attribute_name_to_yojson = string_to_yojson

let inventory_attribute_data_type_to_yojson = 
  fun (x: inventory_attribute_data_type) -> match x with 
  | NUMBER -> `String "number"
    | STRING -> `String "string"
     

let inventory_item_attribute_to_yojson = 
  fun (x: inventory_item_attribute) -> assoc_to_yojson(
    [(
         "DataType",
         (Some (inventory_attribute_data_type_to_yojson x.data_type)));
       (
         "Name",
         (Some (inventory_item_attribute_name_to_yojson x.name)));
       
  ])

let inventory_item_attribute_list_to_yojson = 
  fun tree -> list_to_yojson inventory_item_attribute_to_yojson tree

let inventory_item_schema_to_yojson = 
  fun (x: inventory_item_schema) -> assoc_to_yojson(
    [(
         "DisplayName",
         (option_to_yojson inventory_type_display_name_to_yojson x.display_name));
       (
         "Attributes",
         (Some (inventory_item_attribute_list_to_yojson x.attributes)));
       (
         "Version",
         (option_to_yojson inventory_item_schema_version_to_yojson x.version));
       (
         "TypeName",
         (Some (inventory_item_type_name_to_yojson x.type_name)));
       
  ])

let inventory_item_schema_result_list_to_yojson = 
  fun tree -> list_to_yojson inventory_item_schema_to_yojson tree

let inventory_group_name_to_yojson = string_to_yojson

let inventory_group_to_yojson = 
  fun (x: inventory_group) -> assoc_to_yojson(
    [(
         "Filters",
         (Some (inventory_filter_list_to_yojson x.filters)));
       (
         "Name",
         (Some (inventory_group_name_to_yojson x.name)));
       
  ])

let inventory_group_list_to_yojson = 
  fun tree -> list_to_yojson inventory_group_to_yojson tree

let inventory_deletion_start_time_to_yojson = timestamp_to_yojson

let inventory_deletion_status_to_yojson = 
  fun (x: inventory_deletion_status) -> match x with 
  | COMPLETE -> `String "Complete"
    | IN_PROGRESS -> `String "InProgress"
     

let inventory_deletion_last_status_message_to_yojson = string_to_yojson

let inventory_deletion_summary_item_to_yojson = 
  fun (x: inventory_deletion_summary_item) -> assoc_to_yojson(
    [(
         "RemainingCount",
         (option_to_yojson remaining_count_to_yojson x.remaining_count));
       (
         "Count",
         (option_to_yojson resource_count_to_yojson x.count));
       (
         "Version",
         (option_to_yojson inventory_item_schema_version_to_yojson x.version));
       
  ])

let inventory_deletion_summary_items_to_yojson = 
  fun tree -> list_to_yojson inventory_deletion_summary_item_to_yojson tree

let inventory_deletion_summary_to_yojson = 
  fun (x: inventory_deletion_summary) -> assoc_to_yojson(
    [(
         "SummaryItems",
         (option_to_yojson inventory_deletion_summary_items_to_yojson x.summary_items));
       (
         "RemainingCount",
         (option_to_yojson remaining_count_to_yojson x.remaining_count));
       (
         "TotalCount",
         (option_to_yojson total_count_to_yojson x.total_count));
       
  ])

let inventory_deletion_last_status_update_time_to_yojson = 
  timestamp_to_yojson

let inventory_deletion_status_item_to_yojson = 
  fun (x: inventory_deletion_status_item) -> assoc_to_yojson(
    [(
         "LastStatusUpdateTime",
         (option_to_yojson inventory_deletion_last_status_update_time_to_yojson x.last_status_update_time));
       (
         "DeletionSummary",
         (option_to_yojson inventory_deletion_summary_to_yojson x.deletion_summary));
       (
         "LastStatusMessage",
         (option_to_yojson inventory_deletion_last_status_message_to_yojson x.last_status_message));
       (
         "LastStatus",
         (option_to_yojson inventory_deletion_status_to_yojson x.last_status));
       (
         "DeletionStartTime",
         (option_to_yojson inventory_deletion_start_time_to_yojson x.deletion_start_time));
       (
         "TypeName",
         (option_to_yojson inventory_item_type_name_to_yojson x.type_name));
       (
         "DeletionId",
         (option_to_yojson uui_d_to_yojson x.deletion_id));
       
  ])

let inventory_deletions_list_to_yojson = 
  fun tree -> list_to_yojson inventory_deletion_status_item_to_yojson tree

let inventory_aggregator_expression_to_yojson = string_to_yojson

let rec inventory_aggregator_to_yojson = 
  fun (x: inventory_aggregator) -> assoc_to_yojson(
    [(
         "Groups",
         (option_to_yojson inventory_group_list_to_yojson x.groups));
       (
         "Aggregators",
         (option_to_yojson inventory_aggregator_list_to_yojson x.aggregators));
       (
         "Expression",
         (option_to_yojson inventory_aggregator_expression_to_yojson x.expression));
       
  ])

and inventory_aggregator_list_to_yojson = 
  fun tree -> list_to_yojson inventory_aggregator_to_yojson tree

let invalid_tag_to_yojson = 
  fun (x: invalid_tag) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_result_attribute_exception_to_yojson = 
  fun (x: invalid_result_attribute_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_plugin_name_to_yojson = 
  fun (x: invalid_plugin_name) -> assoc_to_yojson(
    [
  ])

let invalid_option_exception_to_yojson = 
  fun (x: invalid_option_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_inventory_request_exception_to_yojson = 
  fun (x: invalid_inventory_request_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_inventory_group_exception_to_yojson = 
  fun (x: invalid_inventory_group_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_instance_property_filter_value_to_yojson = 
  fun (x: invalid_instance_property_filter_value) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_instance_information_filter_value_to_yojson = 
  fun (x: invalid_instance_information_filter_value) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_filter_value_to_yojson = 
  fun (x: invalid_filter_value) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_filter_option_to_yojson = 
  fun (x: invalid_filter_option) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_document_type_to_yojson = 
  fun (x: invalid_document_type) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_deletion_id_exception_to_yojson = 
  fun (x: invalid_deletion_id_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_delete_inventory_parameters_exception_to_yojson = 
  fun (x: invalid_delete_inventory_parameters_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_aggregator_exception_to_yojson = 
  fun (x: invalid_aggregator_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_activation_id_to_yojson = 
  fun (x: invalid_activation_id) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_activation_to_yojson = 
  fun (x: invalid_activation) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let instances_count_to_yojson = int_to_yojson

let instance_type_to_yojson = string_to_yojson

let instance_state_to_yojson = string_to_yojson

let instance_role_to_yojson = string_to_yojson

let instance_property_string_filter_key_to_yojson = string_to_yojson

let instance_property_filter_value_to_yojson = string_to_yojson

let instance_property_filter_value_set_to_yojson = 
  fun tree -> list_to_yojson instance_property_filter_value_to_yojson tree

let instance_property_filter_operator_to_yojson = 
  fun (x: instance_property_filter_operator) -> match x with 
 
| GREATER_THAN -> `String "GreaterThan"
  | LESS_THAN -> `String "LessThan"
  | BEGIN_WITH -> `String "BeginWith"
  | NOT_EQUAL -> `String "NotEqual"
  | EQUAL -> `String "Equal"
   

let instance_property_string_filter_to_yojson = 
  fun (x: instance_property_string_filter) -> assoc_to_yojson(
    [(
         "Operator",
         (option_to_yojson instance_property_filter_operator_to_yojson x.operator));
       (
         "Values",
         (Some (instance_property_filter_value_set_to_yojson x.values)));
       (
         "Key",
         (Some (instance_property_string_filter_key_to_yojson x.key)));
       
  ])

let instance_property_string_filter_list_to_yojson = 
  fun tree -> list_to_yojson instance_property_string_filter_to_yojson tree

let instance_property_filter_key_to_yojson = 
  fun (x: instance_property_filter_key) -> match x with 
 
| ASSOCIATION_STATUS -> `String "AssociationStatus"
  | RESOURCE_TYPE -> `String "ResourceType"
  | IAM_ROLE -> `String "IamRole"
  | ACTIVATION_IDS -> `String "ActivationIds"
  | DOCUMENT_NAME -> `String "DocumentName"
  | PLATFORM_TYPES -> `String "PlatformTypes"
  | PING_STATUS -> `String "PingStatus"
  | AGENT_VERSION -> `String "AgentVersion"
  | INSTANCE_IDS -> `String "InstanceIds"
   

let instance_property_filter_to_yojson = 
  fun (x: instance_property_filter) -> assoc_to_yojson(
    [(
         "valueSet",
         (Some (instance_property_filter_value_set_to_yojson x.value_set)));
       (
         "key",
         (Some (instance_property_filter_key_to_yojson x.key)));
       
  ])

let instance_property_filter_list_to_yojson = 
  fun tree -> list_to_yojson instance_property_filter_to_yojson tree

let instance_name_to_yojson = string_to_yojson

let architecture_to_yojson = string_to_yojson

let ip_address_to_yojson = string_to_yojson

let activation_id_to_yojson = string_to_yojson

let computer_name_to_yojson = string_to_yojson

let instance_association_status_aggregated_count_to_yojson = 
  fun tree -> map_to_yojson instance_count_to_yojson tree

let instance_aggregated_association_overview_to_yojson = 
  fun (x: instance_aggregated_association_overview) -> assoc_to_yojson(
    [(
         "InstanceAssociationStatusAggregatedCount",
         (option_to_yojson instance_association_status_aggregated_count_to_yojson x.instance_association_status_aggregated_count));
       (
         "DetailedStatus",
         (option_to_yojson status_name_to_yojson x.detailed_status));
       
  ])

let instance_property_to_yojson = 
  fun (x: instance_property) -> assoc_to_yojson(
    [(
         "SourceType",
         (option_to_yojson source_type_to_yojson x.source_type));
       (
         "SourceId",
         (option_to_yojson source_id_to_yojson x.source_id));
       (
         "AssociationOverview",
         (option_to_yojson instance_aggregated_association_overview_to_yojson x.association_overview));
       (
         "LastSuccessfulAssociationExecutionDate",
         (option_to_yojson date_time_to_yojson x.last_successful_association_execution_date));
       (
         "LastAssociationExecutionDate",
         (option_to_yojson date_time_to_yojson x.last_association_execution_date));
       (
         "AssociationStatus",
         (option_to_yojson status_name_to_yojson x.association_status));
       (
         "ComputerName",
         (option_to_yojson computer_name_to_yojson x.computer_name));
       (
         "ResourceType",
         (option_to_yojson string__to_yojson x.resource_type));
       (
         "RegistrationDate",
         (option_to_yojson date_time_to_yojson x.registration_date));
       (
         "IamRole",
         (option_to_yojson iam_role_to_yojson x.iam_role));
       (
         "ActivationId",
         (option_to_yojson activation_id_to_yojson x.activation_id));
       (
         "PlatformVersion",
         (option_to_yojson platform_version_to_yojson x.platform_version));
       (
         "PlatformName",
         (option_to_yojson platform_name_to_yojson x.platform_name));
       (
         "PlatformType",
         (option_to_yojson platform_type_to_yojson x.platform_type));
       (
         "AgentVersion",
         (option_to_yojson version_to_yojson x.agent_version));
       (
         "LastPingDateTime",
         (option_to_yojson date_time_to_yojson x.last_ping_date_time));
       (
         "PingStatus",
         (option_to_yojson ping_status_to_yojson x.ping_status));
       (
         "LaunchTime",
         (option_to_yojson date_time_to_yojson x.launch_time));
       (
         "IPAddress",
         (option_to_yojson ip_address_to_yojson x.ip_address));
       (
         "Architecture",
         (option_to_yojson architecture_to_yojson x.architecture));
       (
         "InstanceState",
         (option_to_yojson instance_state_to_yojson x.instance_state));
       (
         "KeyName",
         (option_to_yojson key_name_to_yojson x.key_name));
       (
         "InstanceRole",
         (option_to_yojson instance_role_to_yojson x.instance_role));
       (
         "InstanceType",
         (option_to_yojson instance_type_to_yojson x.instance_type));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "Name",
         (option_to_yojson instance_name_to_yojson x.name));
       
  ])

let instance_properties_to_yojson = 
  fun tree -> list_to_yojson instance_property_to_yojson tree

let install_override_list_to_yojson = string_to_yojson

let instance_patch_state_to_yojson = 
  fun (x: instance_patch_state) -> assoc_to_yojson(
    [(
         "OtherNonCompliantCount",
         (option_to_yojson patch_other_non_compliant_count_to_yojson x.other_non_compliant_count));
       (
         "SecurityNonCompliantCount",
         (option_to_yojson patch_security_non_compliant_count_to_yojson x.security_non_compliant_count));
       (
         "CriticalNonCompliantCount",
         (option_to_yojson patch_critical_non_compliant_count_to_yojson x.critical_non_compliant_count));
       (
         "RebootOption",
         (option_to_yojson reboot_option_to_yojson x.reboot_option));
       (
         "LastNoRebootInstallOperationTime",
         (option_to_yojson date_time_to_yojson x.last_no_reboot_install_operation_time));
       (
         "Operation",
         (Some (patch_operation_type_to_yojson x.operation)));
       (
         "OperationEndTime",
         (Some (date_time_to_yojson x.operation_end_time)));
       (
         "OperationStartTime",
         (Some (date_time_to_yojson x.operation_start_time)));
       (
         "NotApplicableCount",
         (option_to_yojson patch_not_applicable_count_to_yojson x.not_applicable_count));
       (
         "UnreportedNotApplicableCount",
         (option_to_yojson patch_unreported_not_applicable_count_to_yojson x.unreported_not_applicable_count));
       (
         "FailedCount",
         (option_to_yojson patch_failed_count_to_yojson x.failed_count));
       (
         "MissingCount",
         (option_to_yojson patch_missing_count_to_yojson x.missing_count));
       (
         "InstalledRejectedCount",
         (option_to_yojson patch_installed_rejected_count_to_yojson x.installed_rejected_count));
       (
         "InstalledPendingRebootCount",
         (option_to_yojson patch_installed_pending_reboot_count_to_yojson x.installed_pending_reboot_count));
       (
         "InstalledOtherCount",
         (option_to_yojson patch_installed_other_count_to_yojson x.installed_other_count));
       (
         "InstalledCount",
         (option_to_yojson patch_installed_count_to_yojson x.installed_count));
       (
         "OwnerInformation",
         (option_to_yojson owner_information_to_yojson x.owner_information));
       (
         "InstallOverrideList",
         (option_to_yojson install_override_list_to_yojson x.install_override_list));
       (
         "SnapshotId",
         (option_to_yojson snapshot_id_to_yojson x.snapshot_id));
       (
         "BaselineId",
         (Some (baseline_id_to_yojson x.baseline_id)));
       (
         "PatchGroup",
         (Some (patch_group_to_yojson x.patch_group)));
       (
         "InstanceId",
         (Some (instance_id_to_yojson x.instance_id)));
       
  ])

let instance_patch_states_list_to_yojson = 
  fun tree -> list_to_yojson instance_patch_state_to_yojson tree

let instance_patch_state_operator_type_to_yojson = 
  fun (x: instance_patch_state_operator_type) -> match x with 
 
| GREATER_THAN -> `String "GreaterThan"
  | LESS_THAN -> `String "LessThan"
  | NOT_EQUAL -> `String "NotEqual"
  | EQUAL -> `String "Equal"
   

let instance_patch_state_list_to_yojson = 
  fun tree -> list_to_yojson instance_patch_state_to_yojson tree

let instance_patch_state_filter_value_to_yojson = string_to_yojson

let instance_patch_state_filter_values_to_yojson = 
  fun tree -> list_to_yojson instance_patch_state_filter_value_to_yojson tree

let instance_patch_state_filter_key_to_yojson = string_to_yojson

let instance_patch_state_filter_to_yojson = 
  fun (x: instance_patch_state_filter) -> assoc_to_yojson(
    [(
         "Type",
         (Some (instance_patch_state_operator_type_to_yojson x.type_)));
       (
         "Values",
         (Some (instance_patch_state_filter_values_to_yojson x.values)));
       (
         "Key",
         (Some (instance_patch_state_filter_key_to_yojson x.key)));
       
  ])

let instance_patch_state_filter_list_to_yojson = 
  fun tree -> list_to_yojson instance_patch_state_filter_to_yojson tree

let instance_information_string_filter_key_to_yojson = string_to_yojson

let instance_information_filter_value_to_yojson = string_to_yojson

let instance_information_filter_value_set_to_yojson = 
  fun tree -> list_to_yojson instance_information_filter_value_to_yojson tree

let instance_information_string_filter_to_yojson = 
  fun (x: instance_information_string_filter) -> assoc_to_yojson(
    [(
         "Values",
         (Some (instance_information_filter_value_set_to_yojson x.values)));
       (
         "Key",
         (Some (instance_information_string_filter_key_to_yojson x.key)));
       
  ])

let instance_information_string_filter_list_to_yojson = 
  fun tree -> list_to_yojson instance_information_string_filter_to_yojson tree

let instance_information_to_yojson = 
  fun (x: instance_information) -> assoc_to_yojson(
    [(
         "SourceType",
         (option_to_yojson source_type_to_yojson x.source_type));
       (
         "SourceId",
         (option_to_yojson source_id_to_yojson x.source_id));
       (
         "AssociationOverview",
         (option_to_yojson instance_aggregated_association_overview_to_yojson x.association_overview));
       (
         "LastSuccessfulAssociationExecutionDate",
         (option_to_yojson date_time_to_yojson x.last_successful_association_execution_date));
       (
         "LastAssociationExecutionDate",
         (option_to_yojson date_time_to_yojson x.last_association_execution_date));
       (
         "AssociationStatus",
         (option_to_yojson status_name_to_yojson x.association_status));
       (
         "ComputerName",
         (option_to_yojson computer_name_to_yojson x.computer_name));
       (
         "IPAddress",
         (option_to_yojson ip_address_to_yojson x.ip_address));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       (
         "ResourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "RegistrationDate",
         (option_to_yojson date_time_to_yojson x.registration_date));
       (
         "IamRole",
         (option_to_yojson iam_role_to_yojson x.iam_role));
       (
         "ActivationId",
         (option_to_yojson activation_id_to_yojson x.activation_id));
       (
         "PlatformVersion",
         (option_to_yojson string__to_yojson x.platform_version));
       (
         "PlatformName",
         (option_to_yojson string__to_yojson x.platform_name));
       (
         "PlatformType",
         (option_to_yojson platform_type_to_yojson x.platform_type));
       (
         "IsLatestVersion",
         (option_to_yojson boolean__to_yojson x.is_latest_version));
       (
         "AgentVersion",
         (option_to_yojson version_to_yojson x.agent_version));
       (
         "LastPingDateTime",
         (option_to_yojson date_time_to_yojson x.last_ping_date_time));
       (
         "PingStatus",
         (option_to_yojson ping_status_to_yojson x.ping_status));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       
  ])

let instance_information_list_to_yojson = 
  fun tree -> list_to_yojson instance_information_to_yojson tree

let instance_information_filter_key_to_yojson = 
  fun (x: instance_information_filter_key) -> match x with 
 
| ASSOCIATION_STATUS -> `String "AssociationStatus"
  | RESOURCE_TYPE -> `String "ResourceType"
  | IAM_ROLE -> `String "IamRole"
  | ACTIVATION_IDS -> `String "ActivationIds"
  | PLATFORM_TYPES -> `String "PlatformTypes"
  | PING_STATUS -> `String "PingStatus"
  | AGENT_VERSION -> `String "AgentVersion"
  | INSTANCE_IDS -> `String "InstanceIds"
   

let instance_information_filter_to_yojson = 
  fun (x: instance_information_filter) -> assoc_to_yojson(
    [(
         "valueSet",
         (Some (instance_information_filter_value_set_to_yojson x.value_set)));
       (
         "key",
         (Some (instance_information_filter_key_to_yojson x.key)));
       
  ])

let instance_information_filter_list_to_yojson = 
  fun tree -> list_to_yojson instance_information_filter_to_yojson tree

let instance_association_execution_summary_to_yojson = string_to_yojson

let agent_error_code_to_yojson = string_to_yojson

let instance_association_output_url_to_yojson = 
  fun (x: instance_association_output_url) -> assoc_to_yojson(
    [(
         "S3OutputUrl",
         (option_to_yojson s3_output_url_to_yojson x.s3_output_url));
       
  ])

let instance_association_status_info_to_yojson = 
  fun (x: instance_association_status_info) -> assoc_to_yojson(
    [(
         "AssociationName",
         (option_to_yojson association_name_to_yojson x.association_name));
       (
         "OutputUrl",
         (option_to_yojson instance_association_output_url_to_yojson x.output_url));
       (
         "ErrorCode",
         (option_to_yojson agent_error_code_to_yojson x.error_code));
       (
         "ExecutionSummary",
         (option_to_yojson instance_association_execution_summary_to_yojson x.execution_summary));
       (
         "DetailedStatus",
         (option_to_yojson status_name_to_yojson x.detailed_status));
       (
         "Status",
         (option_to_yojson status_name_to_yojson x.status));
       (
         "ExecutionDate",
         (option_to_yojson date_time_to_yojson x.execution_date));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "AssociationVersion",
         (option_to_yojson association_version_to_yojson x.association_version));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "Name",
         (option_to_yojson document_ar_n_to_yojson x.name));
       (
         "AssociationId",
         (option_to_yojson association_id_to_yojson x.association_id));
       
  ])

let instance_association_status_infos_to_yojson = 
  fun tree -> list_to_yojson instance_association_status_info_to_yojson tree

let instance_association_to_yojson = 
  fun (x: instance_association) -> assoc_to_yojson(
    [(
         "AssociationVersion",
         (option_to_yojson association_version_to_yojson x.association_version));
       (
         "Content",
         (option_to_yojson document_content_to_yojson x.content));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "AssociationId",
         (option_to_yojson association_id_to_yojson x.association_id));
       
  ])

let instance_association_list_to_yojson = 
  fun tree -> list_to_yojson instance_association_to_yojson tree

let iso8601_string_to_yojson = string_to_yojson

let get_service_setting_result_to_yojson = 
  fun (x: get_service_setting_result) -> assoc_to_yojson(
    [(
         "ServiceSetting",
         (option_to_yojson service_setting_to_yojson x.service_setting));
       
  ])

let get_service_setting_request_to_yojson = 
  fun (x: get_service_setting_request) -> assoc_to_yojson(
    [(
         "SettingId",
         (Some (service_setting_id_to_yojson x.setting_id)));
       
  ])

let get_resource_policies_response_entry_to_yojson = 
  fun (x: get_resource_policies_response_entry) -> assoc_to_yojson(
    [(
         "Policy",
         (option_to_yojson policy_to_yojson x.policy));
       (
         "PolicyHash",
         (option_to_yojson policy_hash_to_yojson x.policy_hash));
       (
         "PolicyId",
         (option_to_yojson policy_id_to_yojson x.policy_id));
       
  ])

let get_resource_policies_response_entries_to_yojson = 
  fun tree -> list_to_yojson get_resource_policies_response_entry_to_yojson tree

let get_resource_policies_response_to_yojson = 
  fun (x: get_resource_policies_response) -> assoc_to_yojson(
    [(
         "Policies",
         (option_to_yojson get_resource_policies_response_entries_to_yojson x.policies));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let get_resource_policies_request_to_yojson = 
  fun (x: get_resource_policies_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson resource_policy_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ResourceArn",
         (Some (resource_arn_string_to_yojson x.resource_arn)));
       
  ])

let get_patch_baseline_result_to_yojson = 
  fun (x: get_patch_baseline_result) -> assoc_to_yojson(
    [(
         "Sources",
         (option_to_yojson patch_source_list_to_yojson x.sources));
       (
         "Description",
         (option_to_yojson baseline_description_to_yojson x.description));
       (
         "ModifiedDate",
         (option_to_yojson date_time_to_yojson x.modified_date));
       (
         "CreatedDate",
         (option_to_yojson date_time_to_yojson x.created_date));
       (
         "PatchGroups",
         (option_to_yojson patch_group_list_to_yojson x.patch_groups));
       (
         "RejectedPatchesAction",
         (option_to_yojson patch_action_to_yojson x.rejected_patches_action));
       (
         "RejectedPatches",
         (option_to_yojson patch_id_list_to_yojson x.rejected_patches));
       (
         "ApprovedPatchesEnableNonSecurity",
         (option_to_yojson boolean__to_yojson x.approved_patches_enable_non_security));
       (
         "ApprovedPatchesComplianceLevel",
         (option_to_yojson patch_compliance_level_to_yojson x.approved_patches_compliance_level));
       (
         "ApprovedPatches",
         (option_to_yojson patch_id_list_to_yojson x.approved_patches));
       (
         "ApprovalRules",
         (option_to_yojson patch_rule_group_to_yojson x.approval_rules));
       (
         "GlobalFilters",
         (option_to_yojson patch_filter_group_to_yojson x.global_filters));
       (
         "OperatingSystem",
         (option_to_yojson operating_system_to_yojson x.operating_system));
       (
         "Name",
         (option_to_yojson baseline_name_to_yojson x.name));
       (
         "BaselineId",
         (option_to_yojson baseline_id_to_yojson x.baseline_id));
       
  ])

let get_patch_baseline_request_to_yojson = 
  fun (x: get_patch_baseline_request) -> assoc_to_yojson(
    [(
         "BaselineId",
         (Some (baseline_id_to_yojson x.baseline_id)));
       
  ])

let get_patch_baseline_for_patch_group_result_to_yojson = 
  fun (x: get_patch_baseline_for_patch_group_result) -> assoc_to_yojson(
    [(
         "OperatingSystem",
         (option_to_yojson operating_system_to_yojson x.operating_system));
       (
         "PatchGroup",
         (option_to_yojson patch_group_to_yojson x.patch_group));
       (
         "BaselineId",
         (option_to_yojson baseline_id_to_yojson x.baseline_id));
       
  ])

let get_patch_baseline_for_patch_group_request_to_yojson = 
  fun (x: get_patch_baseline_for_patch_group_request) -> assoc_to_yojson(
    [(
         "OperatingSystem",
         (option_to_yojson operating_system_to_yojson x.operating_system));
       (
         "PatchGroup",
         (Some (patch_group_to_yojson x.patch_group)));
       
  ])

let get_parameters_result_to_yojson = 
  fun (x: get_parameters_result) -> assoc_to_yojson(
    [(
         "InvalidParameters",
         (option_to_yojson parameter_name_list_to_yojson x.invalid_parameters));
       (
         "Parameters",
         (option_to_yojson parameter_list_to_yojson x.parameters));
       
  ])

let get_parameters_request_to_yojson = 
  fun (x: get_parameters_request) -> assoc_to_yojson(
    [(
         "WithDecryption",
         (option_to_yojson boolean__to_yojson x.with_decryption));
       (
         "Names",
         (Some (parameter_name_list_to_yojson x.names)));
       
  ])

let get_parameters_by_path_result_to_yojson = 
  fun (x: get_parameters_by_path_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Parameters",
         (option_to_yojson parameter_list_to_yojson x.parameters));
       
  ])

let get_parameters_by_path_max_results_to_yojson = int_to_yojson

let get_parameters_by_path_request_to_yojson = 
  fun (x: get_parameters_by_path_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson get_parameters_by_path_max_results_to_yojson x.max_results));
       (
         "WithDecryption",
         (option_to_yojson boolean__to_yojson x.with_decryption));
       (
         "ParameterFilters",
         (option_to_yojson parameter_string_filter_list_to_yojson x.parameter_filters));
       (
         "Recursive",
         (option_to_yojson boolean__to_yojson x.recursive));
       (
         "Path",
         (Some (ps_parameter_name_to_yojson x.path)));
       
  ])

let get_parameter_result_to_yojson = 
  fun (x: get_parameter_result) -> assoc_to_yojson(
    [(
         "Parameter",
         (option_to_yojson parameter_to_yojson x.parameter));
       
  ])

let get_parameter_request_to_yojson = 
  fun (x: get_parameter_request) -> assoc_to_yojson(
    [(
         "WithDecryption",
         (option_to_yojson boolean__to_yojson x.with_decryption));
       (
         "Name",
         (Some (ps_parameter_name_to_yojson x.name)));
       
  ])

let get_parameter_history_result_to_yojson = 
  fun (x: get_parameter_history_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Parameters",
         (option_to_yojson parameter_history_list_to_yojson x.parameters));
       
  ])

let get_parameter_history_request_to_yojson = 
  fun (x: get_parameter_history_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "WithDecryption",
         (option_to_yojson boolean__to_yojson x.with_decryption));
       (
         "Name",
         (Some (ps_parameter_name_to_yojson x.name)));
       
  ])

let get_ops_summary_result_to_yojson = 
  fun (x: get_ops_summary_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Entities",
         (option_to_yojson ops_entity_list_to_yojson x.entities));
       
  ])

let get_ops_summary_request_to_yojson = 
  fun (x: get_ops_summary_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ResultAttributes",
         (option_to_yojson ops_result_attribute_list_to_yojson x.result_attributes));
       (
         "Aggregators",
         (option_to_yojson ops_aggregator_list_to_yojson x.aggregators));
       (
         "Filters",
         (option_to_yojson ops_filter_list_to_yojson x.filters));
       (
         "SyncName",
         (option_to_yojson resource_data_sync_name_to_yojson x.sync_name));
       
  ])

let get_ops_metadata_result_to_yojson = 
  fun (x: get_ops_metadata_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Metadata",
         (option_to_yojson metadata_map_to_yojson x.metadata));
       (
         "ResourceId",
         (option_to_yojson ops_metadata_resource_id_to_yojson x.resource_id));
       
  ])

let get_ops_metadata_max_results_to_yojson = int_to_yojson

let get_ops_metadata_request_to_yojson = 
  fun (x: get_ops_metadata_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson get_ops_metadata_max_results_to_yojson x.max_results));
       (
         "OpsMetadataArn",
         (Some (ops_metadata_arn_to_yojson x.ops_metadata_arn)));
       
  ])

let get_ops_item_response_to_yojson = 
  fun (x: get_ops_item_response) -> assoc_to_yojson(
    [(
         "OpsItem",
         (option_to_yojson ops_item_to_yojson x.ops_item));
       
  ])

let get_ops_item_request_to_yojson = 
  fun (x: get_ops_item_request) -> assoc_to_yojson(
    [(
         "OpsItemArn",
         (option_to_yojson ops_item_arn_to_yojson x.ops_item_arn));
       (
         "OpsItemId",
         (Some (ops_item_id_to_yojson x.ops_item_id)));
       
  ])

let get_maintenance_window_task_result_to_yojson = 
  fun (x: get_maintenance_window_task_result) -> assoc_to_yojson(
    [(
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "CutoffBehavior",
         (option_to_yojson maintenance_window_task_cutoff_behavior_to_yojson x.cutoff_behavior));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "LoggingInfo",
         (option_to_yojson logging_info_to_yojson x.logging_info));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "Priority",
         (option_to_yojson maintenance_window_task_priority_to_yojson x.priority));
       (
         "TaskInvocationParameters",
         (option_to_yojson maintenance_window_task_invocation_parameters_to_yojson x.task_invocation_parameters));
       (
         "TaskParameters",
         (option_to_yojson maintenance_window_task_parameters_to_yojson x.task_parameters));
       (
         "TaskType",
         (option_to_yojson maintenance_window_task_type_to_yojson x.task_type));
       (
         "ServiceRoleArn",
         (option_to_yojson service_role_to_yojson x.service_role_arn));
       (
         "TaskArn",
         (option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "WindowTaskId",
         (option_to_yojson maintenance_window_task_id_to_yojson x.window_task_id));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let get_maintenance_window_task_request_to_yojson = 
  fun (x: get_maintenance_window_task_request) -> assoc_to_yojson(
    [(
         "WindowTaskId",
         (Some (maintenance_window_task_id_to_yojson x.window_task_id)));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let get_maintenance_window_result_to_yojson = 
  fun (x: get_maintenance_window_result) -> assoc_to_yojson(
    [(
         "ModifiedDate",
         (option_to_yojson date_time_to_yojson x.modified_date));
       (
         "CreatedDate",
         (option_to_yojson date_time_to_yojson x.created_date));
       (
         "Enabled",
         (option_to_yojson maintenance_window_enabled_to_yojson x.enabled));
       (
         "AllowUnassociatedTargets",
         (option_to_yojson maintenance_window_allow_unassociated_targets_to_yojson x.allow_unassociated_targets));
       (
         "Cutoff",
         (option_to_yojson maintenance_window_cutoff_to_yojson x.cutoff));
       (
         "Duration",
         (option_to_yojson maintenance_window_duration_hours_to_yojson x.duration));
       (
         "NextExecutionTime",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.next_execution_time));
       (
         "ScheduleOffset",
         (option_to_yojson maintenance_window_offset_to_yojson x.schedule_offset));
       (
         "ScheduleTimezone",
         (option_to_yojson maintenance_window_timezone_to_yojson x.schedule_timezone));
       (
         "Schedule",
         (option_to_yojson maintenance_window_schedule_to_yojson x.schedule));
       (
         "EndDate",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.end_date));
       (
         "StartDate",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.start_date));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (option_to_yojson maintenance_window_name_to_yojson x.name));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let get_maintenance_window_request_to_yojson = 
  fun (x: get_maintenance_window_request) -> assoc_to_yojson(
    [(
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let get_maintenance_window_execution_task_result_to_yojson = 
  fun (x: get_maintenance_window_execution_task_result) -> assoc_to_yojson(
    [(
         "TriggeredAlarms",
         (option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms));
       (
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "EndTime",
         (option_to_yojson date_time_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "StatusDetails",
         (option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details));
       (
         "Status",
         (option_to_yojson maintenance_window_execution_status_to_yojson x.status));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "Priority",
         (option_to_yojson maintenance_window_task_priority_to_yojson x.priority));
       (
         "TaskParameters",
         (option_to_yojson maintenance_window_task_parameters_list_to_yojson x.task_parameters));
       (
         "Type",
         (option_to_yojson maintenance_window_task_type_to_yojson x.type_));
       (
         "ServiceRole",
         (option_to_yojson service_role_to_yojson x.service_role));
       (
         "TaskArn",
         (option_to_yojson maintenance_window_task_arn_to_yojson x.task_arn));
       (
         "TaskExecutionId",
         (option_to_yojson maintenance_window_execution_task_id_to_yojson x.task_execution_id));
       (
         "WindowExecutionId",
         (option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id));
       
  ])

let get_maintenance_window_execution_task_request_to_yojson = 
  fun (x: get_maintenance_window_execution_task_request) -> assoc_to_yojson(
    [(
         "TaskId",
         (Some (maintenance_window_execution_task_id_to_yojson x.task_id)));
       (
         "WindowExecutionId",
         (Some (maintenance_window_execution_id_to_yojson x.window_execution_id)));
       
  ])

let get_maintenance_window_execution_task_invocation_result_to_yojson = 
  fun (x: get_maintenance_window_execution_task_invocation_result) -> assoc_to_yojson(
    [(
         "WindowTargetId",
         (option_to_yojson maintenance_window_task_target_id_to_yojson x.window_target_id));
       (
         "OwnerInformation",
         (option_to_yojson owner_information_to_yojson x.owner_information));
       (
         "EndTime",
         (option_to_yojson date_time_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "StatusDetails",
         (option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details));
       (
         "Status",
         (option_to_yojson maintenance_window_execution_status_to_yojson x.status));
       (
         "Parameters",
         (option_to_yojson maintenance_window_execution_task_invocation_parameters_to_yojson x.parameters));
       (
         "TaskType",
         (option_to_yojson maintenance_window_task_type_to_yojson x.task_type));
       (
         "ExecutionId",
         (option_to_yojson maintenance_window_execution_task_execution_id_to_yojson x.execution_id));
       (
         "InvocationId",
         (option_to_yojson maintenance_window_execution_task_invocation_id_to_yojson x.invocation_id));
       (
         "TaskExecutionId",
         (option_to_yojson maintenance_window_execution_task_id_to_yojson x.task_execution_id));
       (
         "WindowExecutionId",
         (option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id));
       
  ])

let get_maintenance_window_execution_task_invocation_request_to_yojson = 
  fun (x: get_maintenance_window_execution_task_invocation_request) -> assoc_to_yojson(
    [(
         "InvocationId",
         (Some (maintenance_window_execution_task_invocation_id_to_yojson x.invocation_id)));
       (
         "TaskId",
         (Some (maintenance_window_execution_task_id_to_yojson x.task_id)));
       (
         "WindowExecutionId",
         (Some (maintenance_window_execution_id_to_yojson x.window_execution_id)));
       
  ])

let get_maintenance_window_execution_result_to_yojson = 
  fun (x: get_maintenance_window_execution_result) -> assoc_to_yojson(
    [(
         "EndTime",
         (option_to_yojson date_time_to_yojson x.end_time));
       (
         "StartTime",
         (option_to_yojson date_time_to_yojson x.start_time));
       (
         "StatusDetails",
         (option_to_yojson maintenance_window_execution_status_details_to_yojson x.status_details));
       (
         "Status",
         (option_to_yojson maintenance_window_execution_status_to_yojson x.status));
       (
         "TaskIds",
         (option_to_yojson maintenance_window_execution_task_id_list_to_yojson x.task_ids));
       (
         "WindowExecutionId",
         (option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id));
       
  ])

let get_maintenance_window_execution_request_to_yojson = 
  fun (x: get_maintenance_window_execution_request) -> assoc_to_yojson(
    [(
         "WindowExecutionId",
         (Some (maintenance_window_execution_id_to_yojson x.window_execution_id)));
       
  ])

let get_inventory_schema_result_to_yojson = 
  fun (x: get_inventory_schema_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Schemas",
         (option_to_yojson inventory_item_schema_result_list_to_yojson x.schemas));
       
  ])

let get_inventory_schema_max_results_to_yojson = int_to_yojson

let aggregator_schema_only_to_yojson = bool_to_yojson

let get_inventory_schema_request_to_yojson = 
  fun (x: get_inventory_schema_request) -> assoc_to_yojson(
    [(
         "SubType",
         (option_to_yojson is_sub_type_schema_to_yojson x.sub_type));
       (
         "Aggregator",
         (option_to_yojson aggregator_schema_only_to_yojson x.aggregator));
       (
         "MaxResults",
         (option_to_yojson get_inventory_schema_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "TypeName",
         (option_to_yojson inventory_item_type_name_filter_to_yojson x.type_name));
       
  ])

let get_inventory_result_to_yojson = 
  fun (x: get_inventory_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Entities",
         (option_to_yojson inventory_result_entity_list_to_yojson x.entities));
       
  ])

let get_inventory_request_to_yojson = 
  fun (x: get_inventory_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ResultAttributes",
         (option_to_yojson result_attribute_list_to_yojson x.result_attributes));
       (
         "Aggregators",
         (option_to_yojson inventory_aggregator_list_to_yojson x.aggregators));
       (
         "Filters",
         (option_to_yojson inventory_filter_list_to_yojson x.filters));
       
  ])

let content_length_to_yojson = long_to_yojson

let attachment_hash_to_yojson = string_to_yojson

let attachment_hash_type_to_yojson = 
  fun (x: attachment_hash_type) -> match x with 
  | SHA256 -> `String "Sha256"
     

let attachment_url_to_yojson = string_to_yojson

let attachment_content_to_yojson = 
  fun (x: attachment_content) -> assoc_to_yojson(
    [(
         "Url",
         (option_to_yojson attachment_url_to_yojson x.url));
       (
         "HashType",
         (option_to_yojson attachment_hash_type_to_yojson x.hash_type));
       (
         "Hash",
         (option_to_yojson attachment_hash_to_yojson x.hash));
       (
         "Size",
         (option_to_yojson content_length_to_yojson x.size));
       (
         "Name",
         (option_to_yojson attachment_name_to_yojson x.name));
       
  ])

let attachment_content_list_to_yojson = 
  fun tree -> list_to_yojson attachment_content_to_yojson tree

let get_document_result_to_yojson = 
  fun (x: get_document_result) -> assoc_to_yojson(
    [(
         "ReviewStatus",
         (option_to_yojson review_status_to_yojson x.review_status));
       (
         "AttachmentsContent",
         (option_to_yojson attachment_content_list_to_yojson x.attachments_content));
       (
         "Requires",
         (option_to_yojson document_requires_list_to_yojson x.requires));
       (
         "DocumentFormat",
         (option_to_yojson document_format_to_yojson x.document_format));
       (
         "DocumentType",
         (option_to_yojson document_type_to_yojson x.document_type));
       (
         "Content",
         (option_to_yojson document_content_to_yojson x.content));
       (
         "StatusInformation",
         (option_to_yojson document_status_information_to_yojson x.status_information));
       (
         "Status",
         (option_to_yojson document_status_to_yojson x.status));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "VersionName",
         (option_to_yojson document_version_name_to_yojson x.version_name));
       (
         "DisplayName",
         (option_to_yojson document_display_name_to_yojson x.display_name));
       (
         "CreatedDate",
         (option_to_yojson date_time_to_yojson x.created_date));
       (
         "Name",
         (option_to_yojson document_ar_n_to_yojson x.name));
       
  ])

let get_document_request_to_yojson = 
  fun (x: get_document_request) -> assoc_to_yojson(
    [(
         "DocumentFormat",
         (option_to_yojson document_format_to_yojson x.document_format));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "VersionName",
         (option_to_yojson document_version_name_to_yojson x.version_name));
       (
         "Name",
         (Some (document_ar_n_to_yojson x.name)));
       
  ])

let get_deployable_patch_snapshot_for_instance_result_to_yojson = 
  fun (x: get_deployable_patch_snapshot_for_instance_result) -> assoc_to_yojson(
    [(
         "Product",
         (option_to_yojson product_to_yojson x.product));
       (
         "SnapshotDownloadUrl",
         (option_to_yojson snapshot_download_url_to_yojson x.snapshot_download_url));
       (
         "SnapshotId",
         (option_to_yojson snapshot_id_to_yojson x.snapshot_id));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       
  ])

let baseline_override_to_yojson = 
  fun (x: baseline_override) -> assoc_to_yojson(
    [(
         "Sources",
         (option_to_yojson patch_source_list_to_yojson x.sources));
       (
         "ApprovedPatchesEnableNonSecurity",
         (option_to_yojson boolean__to_yojson x.approved_patches_enable_non_security));
       (
         "RejectedPatchesAction",
         (option_to_yojson patch_action_to_yojson x.rejected_patches_action));
       (
         "RejectedPatches",
         (option_to_yojson patch_id_list_to_yojson x.rejected_patches));
       (
         "ApprovedPatchesComplianceLevel",
         (option_to_yojson patch_compliance_level_to_yojson x.approved_patches_compliance_level));
       (
         "ApprovedPatches",
         (option_to_yojson patch_id_list_to_yojson x.approved_patches));
       (
         "ApprovalRules",
         (option_to_yojson patch_rule_group_to_yojson x.approval_rules));
       (
         "GlobalFilters",
         (option_to_yojson patch_filter_group_to_yojson x.global_filters));
       (
         "OperatingSystem",
         (option_to_yojson operating_system_to_yojson x.operating_system));
       
  ])

let get_deployable_patch_snapshot_for_instance_request_to_yojson = 
  fun (x: get_deployable_patch_snapshot_for_instance_request) -> assoc_to_yojson(
    [(
         "BaselineOverride",
         (option_to_yojson baseline_override_to_yojson x.baseline_override));
       (
         "SnapshotId",
         (Some (snapshot_id_to_yojson x.snapshot_id)));
       (
         "InstanceId",
         (Some (instance_id_to_yojson x.instance_id)));
       
  ])

let get_default_patch_baseline_result_to_yojson = 
  fun (x: get_default_patch_baseline_result) -> assoc_to_yojson(
    [(
         "OperatingSystem",
         (option_to_yojson operating_system_to_yojson x.operating_system));
       (
         "BaselineId",
         (option_to_yojson baseline_id_to_yojson x.baseline_id));
       
  ])

let get_default_patch_baseline_request_to_yojson = 
  fun (x: get_default_patch_baseline_request) -> assoc_to_yojson(
    [(
         "OperatingSystem",
         (option_to_yojson operating_system_to_yojson x.operating_system));
       
  ])

let connection_status_to_yojson = 
  fun (x: connection_status) -> match x with 
 
| NOT_CONNECTED -> `String "notconnected"
  | CONNECTED -> `String "connected"
   

let get_connection_status_response_to_yojson = 
  fun (x: get_connection_status_response) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson connection_status_to_yojson x.status));
       (
         "Target",
         (option_to_yojson session_target_to_yojson x.target));
       
  ])

let get_connection_status_request_to_yojson = 
  fun (x: get_connection_status_request) -> assoc_to_yojson(
    [(
         "Target",
         (Some (session_target_to_yojson x.target)));
       
  ])

let get_command_invocation_result_to_yojson = 
  fun (x: get_command_invocation_result) -> assoc_to_yojson(
    [(
         "CloudWatchOutputConfig",
         (option_to_yojson cloud_watch_output_config_to_yojson x.cloud_watch_output_config));
       (
         "StandardErrorUrl",
         (option_to_yojson url_to_yojson x.standard_error_url));
       (
         "StandardErrorContent",
         (option_to_yojson standard_error_content_to_yojson x.standard_error_content));
       (
         "StandardOutputUrl",
         (option_to_yojson url_to_yojson x.standard_output_url));
       (
         "StandardOutputContent",
         (option_to_yojson standard_output_content_to_yojson x.standard_output_content));
       (
         "StatusDetails",
         (option_to_yojson status_details_to_yojson x.status_details));
       (
         "Status",
         (option_to_yojson command_invocation_status_to_yojson x.status));
       (
         "ExecutionEndDateTime",
         (option_to_yojson string_date_time_to_yojson x.execution_end_date_time));
       (
         "ExecutionElapsedTime",
         (option_to_yojson string_date_time_to_yojson x.execution_elapsed_time));
       (
         "ExecutionStartDateTime",
         (option_to_yojson string_date_time_to_yojson x.execution_start_date_time));
       (
         "ResponseCode",
         (option_to_yojson response_code_to_yojson x.response_code));
       (
         "PluginName",
         (option_to_yojson command_plugin_name_to_yojson x.plugin_name));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DocumentName",
         (option_to_yojson document_name_to_yojson x.document_name));
       (
         "Comment",
         (option_to_yojson comment_to_yojson x.comment));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "CommandId",
         (option_to_yojson command_id_to_yojson x.command_id));
       
  ])

let get_command_invocation_request_to_yojson = 
  fun (x: get_command_invocation_request) -> assoc_to_yojson(
    [(
         "PluginName",
         (option_to_yojson command_plugin_name_to_yojson x.plugin_name));
       (
         "InstanceId",
         (Some (instance_id_to_yojson x.instance_id)));
       (
         "CommandId",
         (Some (command_id_to_yojson x.command_id)));
       
  ])

let calendar_state_to_yojson = 
  fun (x: calendar_state) -> match x with 
  | CLOSED -> `String "CLOSED"
    | OPEN -> `String "OPEN"
     

let get_calendar_state_response_to_yojson = 
  fun (x: get_calendar_state_response) -> assoc_to_yojson(
    [(
         "NextTransitionTime",
         (option_to_yojson iso8601_string_to_yojson x.next_transition_time));
       (
         "AtTime",
         (option_to_yojson iso8601_string_to_yojson x.at_time));
       (
         "State",
         (option_to_yojson calendar_state_to_yojson x.state));
       
  ])

let get_calendar_state_request_to_yojson = 
  fun (x: get_calendar_state_request) -> assoc_to_yojson(
    [(
         "AtTime",
         (option_to_yojson iso8601_string_to_yojson x.at_time));
       (
         "CalendarNames",
         (Some (calendar_name_or_arn_list_to_yojson x.calendar_names)));
       
  ])

let automation_subtype_to_yojson = 
  fun (x: automation_subtype) -> match x with 
  | ChangeRequest -> `String "ChangeRequest"
     

let automation_execution_to_yojson = 
  fun (x: automation_execution) -> assoc_to_yojson(
    [(
         "Variables",
         (option_to_yojson automation_parameter_map_to_yojson x.variables));
       (
         "ChangeRequestName",
         (option_to_yojson change_request_name_to_yojson x.change_request_name));
       (
         "AssociationId",
         (option_to_yojson string__to_yojson x.association_id));
       (
         "OpsItemId",
         (option_to_yojson string__to_yojson x.ops_item_id));
       (
         "Runbooks",
         (option_to_yojson runbooks_to_yojson x.runbooks));
       (
         "ScheduledTime",
         (option_to_yojson date_time_to_yojson x.scheduled_time));
       (
         "AutomationSubtype",
         (option_to_yojson automation_subtype_to_yojson x.automation_subtype));
       (
         "TriggeredAlarms",
         (option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms));
       (
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "ProgressCounters",
         (option_to_yojson progress_counters_to_yojson x.progress_counters));
       (
         "TargetLocations",
         (option_to_yojson target_locations_to_yojson x.target_locations));
       (
         "Target",
         (option_to_yojson string__to_yojson x.target));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "ResolvedTargets",
         (option_to_yojson resolved_targets_to_yojson x.resolved_targets));
       (
         "TargetMaps",
         (option_to_yojson target_maps_to_yojson x.target_maps));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "TargetParameterName",
         (option_to_yojson automation_parameter_key_to_yojson x.target_parameter_name));
       (
         "CurrentAction",
         (option_to_yojson string__to_yojson x.current_action));
       (
         "CurrentStepName",
         (option_to_yojson string__to_yojson x.current_step_name));
       (
         "ExecutedBy",
         (option_to_yojson string__to_yojson x.executed_by));
       (
         "ParentAutomationExecutionId",
         (option_to_yojson automation_execution_id_to_yojson x.parent_automation_execution_id));
       (
         "Mode",
         (option_to_yojson execution_mode_to_yojson x.mode));
       (
         "FailureMessage",
         (option_to_yojson string__to_yojson x.failure_message));
       (
         "Outputs",
         (option_to_yojson automation_parameter_map_to_yojson x.outputs));
       (
         "Parameters",
         (option_to_yojson automation_parameter_map_to_yojson x.parameters));
       (
         "StepExecutionsTruncated",
         (option_to_yojson boolean__to_yojson x.step_executions_truncated));
       (
         "StepExecutions",
         (option_to_yojson step_execution_list_to_yojson x.step_executions));
       (
         "AutomationExecutionStatus",
         (option_to_yojson automation_execution_status_to_yojson x.automation_execution_status));
       (
         "ExecutionEndTime",
         (option_to_yojson date_time_to_yojson x.execution_end_time));
       (
         "ExecutionStartTime",
         (option_to_yojson date_time_to_yojson x.execution_start_time));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DocumentName",
         (option_to_yojson document_name_to_yojson x.document_name));
       (
         "AutomationExecutionId",
         (option_to_yojson automation_execution_id_to_yojson x.automation_execution_id));
       
  ])

let get_automation_execution_result_to_yojson = 
  fun (x: get_automation_execution_result) -> assoc_to_yojson(
    [(
         "AutomationExecution",
         (option_to_yojson automation_execution_to_yojson x.automation_execution));
       
  ])

let get_automation_execution_request_to_yojson = 
  fun (x: get_automation_execution_request) -> assoc_to_yojson(
    [(
         "AutomationExecutionId",
         (Some (automation_execution_id_to_yojson x.automation_execution_id)));
       
  ])

let fault_to_yojson = 
  fun (x: fault) -> match x with 
 
| Unknown -> `String "Unknown"
  | Server -> `String "Server"
  | Client -> `String "Client"
   

let create_association_batch_request_entry_to_yojson = 
  fun (x: create_association_batch_request_entry) -> assoc_to_yojson(
    [(
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "TargetMaps",
         (option_to_yojson target_maps_to_yojson x.target_maps));
       (
         "Duration",
         (option_to_yojson duration_to_yojson x.duration));
       (
         "ScheduleOffset",
         (option_to_yojson schedule_offset_to_yojson x.schedule_offset));
       (
         "TargetLocations",
         (option_to_yojson target_locations_to_yojson x.target_locations));
       (
         "CalendarNames",
         (option_to_yojson calendar_name_or_arn_list_to_yojson x.calendar_names));
       (
         "ApplyOnlyAtCronInterval",
         (option_to_yojson apply_only_at_cron_interval_to_yojson x.apply_only_at_cron_interval));
       (
         "SyncCompliance",
         (option_to_yojson association_sync_compliance_to_yojson x.sync_compliance));
       (
         "ComplianceSeverity",
         (option_to_yojson association_compliance_severity_to_yojson x.compliance_severity));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "AssociationName",
         (option_to_yojson association_name_to_yojson x.association_name));
       (
         "OutputLocation",
         (option_to_yojson instance_association_output_location_to_yojson x.output_location));
       (
         "ScheduleExpression",
         (option_to_yojson schedule_expression_to_yojson x.schedule_expression));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "AutomationTargetParameterName",
         (option_to_yojson automation_target_parameter_name_to_yojson x.automation_target_parameter_name));
       (
         "Parameters",
         (option_to_yojson parameters_to_yojson x.parameters));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "Name",
         (Some (document_ar_n_to_yojson x.name)));
       
  ])

let batch_error_message_to_yojson = string_to_yojson

let failed_create_association_to_yojson = 
  fun (x: failed_create_association) -> assoc_to_yojson(
    [(
         "Fault",
         (option_to_yojson fault_to_yojson x.fault));
       (
         "Message",
         (option_to_yojson batch_error_message_to_yojson x.message));
       (
         "Entry",
         (option_to_yojson create_association_batch_request_entry_to_yojson x.entry));
       
  ])

let failed_create_association_list_to_yojson = 
  fun tree -> list_to_yojson failed_create_association_to_yojson tree

let expiration_date_to_yojson = timestamp_to_yojson

let effective_patch_to_yojson = 
  fun (x: effective_patch) -> assoc_to_yojson(
    [(
         "PatchStatus",
         (option_to_yojson patch_status_to_yojson x.patch_status));
       (
         "Patch",
         (option_to_yojson patch_to_yojson x.patch));
       
  ])

let effective_patch_list_to_yojson = 
  fun tree -> list_to_yojson effective_patch_to_yojson tree

let effective_instance_association_max_results_to_yojson = int_to_yojson

let dry_run_to_yojson = bool_to_yojson

let document_permission_max_results_to_yojson = int_to_yojson

let document_already_exists_to_yojson = 
  fun (x: document_already_exists) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let disassociate_ops_item_related_item_response_to_yojson = 
  fun (x: disassociate_ops_item_related_item_response) -> assoc_to_yojson(
    [
  ])

let disassociate_ops_item_related_item_request_to_yojson = 
  fun (x: disassociate_ops_item_related_item_request) -> assoc_to_yojson(
    [(
         "AssociationId",
         (Some (ops_item_related_item_association_id_to_yojson x.association_id)));
       (
         "OpsItemId",
         (Some (ops_item_id_to_yojson x.ops_item_id)));
       
  ])

let describe_sessions_response_to_yojson = 
  fun (x: describe_sessions_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Sessions",
         (option_to_yojson session_list_to_yojson x.sessions));
       
  ])

let describe_sessions_request_to_yojson = 
  fun (x: describe_sessions_request) -> assoc_to_yojson(
    [(
         "Filters",
         (option_to_yojson session_filter_list_to_yojson x.filters));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson session_max_results_to_yojson x.max_results));
       (
         "State",
         (Some (session_state_to_yojson x.state)));
       
  ])

let describe_patch_properties_result_to_yojson = 
  fun (x: describe_patch_properties_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Properties",
         (option_to_yojson patch_properties_list_to_yojson x.properties));
       
  ])

let describe_patch_properties_request_to_yojson = 
  fun (x: describe_patch_properties_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "PatchSet",
         (option_to_yojson patch_set_to_yojson x.patch_set));
       (
         "Property",
         (Some (patch_property_to_yojson x.property)));
       (
         "OperatingSystem",
         (Some (operating_system_to_yojson x.operating_system)));
       
  ])

let describe_patch_groups_result_to_yojson = 
  fun (x: describe_patch_groups_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Mappings",
         (option_to_yojson patch_group_patch_baseline_mapping_list_to_yojson x.mappings));
       
  ])

let describe_patch_groups_request_to_yojson = 
  fun (x: describe_patch_groups_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Filters",
         (option_to_yojson patch_orchestrator_filter_list_to_yojson x.filters));
       (
         "MaxResults",
         (option_to_yojson patch_baseline_max_results_to_yojson x.max_results));
       
  ])

let describe_patch_group_state_result_to_yojson = 
  fun (x: describe_patch_group_state_result) -> assoc_to_yojson(
    [(
         "InstancesWithOtherNonCompliantPatches",
         (option_to_yojson instances_count_to_yojson x.instances_with_other_non_compliant_patches));
       (
         "InstancesWithSecurityNonCompliantPatches",
         (option_to_yojson instances_count_to_yojson x.instances_with_security_non_compliant_patches));
       (
         "InstancesWithCriticalNonCompliantPatches",
         (option_to_yojson instances_count_to_yojson x.instances_with_critical_non_compliant_patches));
       (
         "InstancesWithUnreportedNotApplicablePatches",
         (option_to_yojson integer__to_yojson x.instances_with_unreported_not_applicable_patches));
       (
         "InstancesWithNotApplicablePatches",
         (option_to_yojson integer__to_yojson x.instances_with_not_applicable_patches));
       (
         "InstancesWithFailedPatches",
         (option_to_yojson integer__to_yojson x.instances_with_failed_patches));
       (
         "InstancesWithMissingPatches",
         (option_to_yojson integer__to_yojson x.instances_with_missing_patches));
       (
         "InstancesWithInstalledRejectedPatches",
         (option_to_yojson instances_count_to_yojson x.instances_with_installed_rejected_patches));
       (
         "InstancesWithInstalledPendingRebootPatches",
         (option_to_yojson instances_count_to_yojson x.instances_with_installed_pending_reboot_patches));
       (
         "InstancesWithInstalledOtherPatches",
         (option_to_yojson integer__to_yojson x.instances_with_installed_other_patches));
       (
         "InstancesWithInstalledPatches",
         (option_to_yojson integer__to_yojson x.instances_with_installed_patches));
       (
         "Instances",
         (option_to_yojson integer__to_yojson x.instances));
       
  ])

let describe_patch_group_state_request_to_yojson = 
  fun (x: describe_patch_group_state_request) -> assoc_to_yojson(
    [(
         "PatchGroup",
         (Some (patch_group_to_yojson x.patch_group)));
       
  ])

let describe_patch_baselines_result_to_yojson = 
  fun (x: describe_patch_baselines_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "BaselineIdentities",
         (option_to_yojson patch_baseline_identity_list_to_yojson x.baseline_identities));
       
  ])

let describe_patch_baselines_request_to_yojson = 
  fun (x: describe_patch_baselines_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson patch_baseline_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson patch_orchestrator_filter_list_to_yojson x.filters));
       
  ])

let describe_parameters_result_to_yojson = 
  fun (x: describe_parameters_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Parameters",
         (option_to_yojson parameter_metadata_list_to_yojson x.parameters));
       
  ])

let describe_parameters_request_to_yojson = 
  fun (x: describe_parameters_request) -> assoc_to_yojson(
    [(
         "Shared",
         (option_to_yojson boolean__to_yojson x.shared));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "ParameterFilters",
         (option_to_yojson parameter_string_filter_list_to_yojson x.parameter_filters));
       (
         "Filters",
         (option_to_yojson parameters_filter_list_to_yojson x.filters));
       
  ])

let describe_ops_items_response_to_yojson = 
  fun (x: describe_ops_items_response) -> assoc_to_yojson(
    [(
         "OpsItemSummaries",
         (option_to_yojson ops_item_summaries_to_yojson x.ops_item_summaries));
       (
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       
  ])

let describe_ops_items_request_to_yojson = 
  fun (x: describe_ops_items_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson ops_item_max_results_to_yojson x.max_results));
       (
         "OpsItemFilters",
         (option_to_yojson ops_item_filters_to_yojson x.ops_item_filters));
       
  ])

let describe_maintenance_windows_result_to_yojson = 
  fun (x: describe_maintenance_windows_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "WindowIdentities",
         (option_to_yojson maintenance_window_identity_list_to_yojson x.window_identities));
       
  ])

let describe_maintenance_windows_request_to_yojson = 
  fun (x: describe_maintenance_windows_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson maintenance_window_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson maintenance_window_filter_list_to_yojson x.filters));
       
  ])

let describe_maintenance_windows_for_target_result_to_yojson = 
  fun (x: describe_maintenance_windows_for_target_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "WindowIdentities",
         (option_to_yojson maintenance_windows_for_target_list_to_yojson x.window_identities));
       
  ])

let describe_maintenance_windows_for_target_request_to_yojson = 
  fun (x: describe_maintenance_windows_for_target_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson maintenance_window_search_max_results_to_yojson x.max_results));
       (
         "ResourceType",
         (Some (maintenance_window_resource_type_to_yojson x.resource_type)));
       (
         "Targets",
         (Some (targets_to_yojson x.targets)));
       
  ])

let describe_maintenance_window_tasks_result_to_yojson = 
  fun (x: describe_maintenance_window_tasks_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Tasks",
         (option_to_yojson maintenance_window_task_list_to_yojson x.tasks));
       
  ])

let describe_maintenance_window_tasks_request_to_yojson = 
  fun (x: describe_maintenance_window_tasks_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson maintenance_window_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson maintenance_window_filter_list_to_yojson x.filters));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let describe_maintenance_window_targets_result_to_yojson = 
  fun (x: describe_maintenance_window_targets_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Targets",
         (option_to_yojson maintenance_window_target_list_to_yojson x.targets));
       
  ])

let describe_maintenance_window_targets_request_to_yojson = 
  fun (x: describe_maintenance_window_targets_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson maintenance_window_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson maintenance_window_filter_list_to_yojson x.filters));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let describe_maintenance_window_schedule_result_to_yojson = 
  fun (x: describe_maintenance_window_schedule_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ScheduledWindowExecutions",
         (option_to_yojson scheduled_window_execution_list_to_yojson x.scheduled_window_executions));
       
  ])

let describe_maintenance_window_schedule_request_to_yojson = 
  fun (x: describe_maintenance_window_schedule_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson maintenance_window_search_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson patch_orchestrator_filter_list_to_yojson x.filters));
       (
         "ResourceType",
         (option_to_yojson maintenance_window_resource_type_to_yojson x.resource_type));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let describe_maintenance_window_executions_result_to_yojson = 
  fun (x: describe_maintenance_window_executions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "WindowExecutions",
         (option_to_yojson maintenance_window_execution_list_to_yojson x.window_executions));
       
  ])

let describe_maintenance_window_executions_request_to_yojson = 
  fun (x: describe_maintenance_window_executions_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson maintenance_window_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson maintenance_window_filter_list_to_yojson x.filters));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let describe_maintenance_window_execution_tasks_result_to_yojson = 
  fun (x: describe_maintenance_window_execution_tasks_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "WindowExecutionTaskIdentities",
         (option_to_yojson maintenance_window_execution_task_identity_list_to_yojson x.window_execution_task_identities));
       
  ])

let describe_maintenance_window_execution_tasks_request_to_yojson = 
  fun (x: describe_maintenance_window_execution_tasks_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson maintenance_window_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson maintenance_window_filter_list_to_yojson x.filters));
       (
         "WindowExecutionId",
         (Some (maintenance_window_execution_id_to_yojson x.window_execution_id)));
       
  ])

let describe_maintenance_window_execution_task_invocations_result_to_yojson = 
  fun (x: describe_maintenance_window_execution_task_invocations_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "WindowExecutionTaskInvocationIdentities",
         (option_to_yojson maintenance_window_execution_task_invocation_identity_list_to_yojson x.window_execution_task_invocation_identities));
       
  ])

let describe_maintenance_window_execution_task_invocations_request_to_yojson
= 
  fun (x: describe_maintenance_window_execution_task_invocations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson maintenance_window_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson maintenance_window_filter_list_to_yojson x.filters));
       (
         "TaskId",
         (Some (maintenance_window_execution_task_id_to_yojson x.task_id)));
       (
         "WindowExecutionId",
         (Some (maintenance_window_execution_id_to_yojson x.window_execution_id)));
       
  ])

let describe_inventory_deletions_result_to_yojson = 
  fun (x: describe_inventory_deletions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "InventoryDeletions",
         (option_to_yojson inventory_deletions_list_to_yojson x.inventory_deletions));
       
  ])

let describe_inventory_deletions_request_to_yojson = 
  fun (x: describe_inventory_deletions_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "DeletionId",
         (option_to_yojson uui_d_to_yojson x.deletion_id));
       
  ])

let describe_instance_properties_result_to_yojson = 
  fun (x: describe_instance_properties_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "InstanceProperties",
         (option_to_yojson instance_properties_to_yojson x.instance_properties));
       
  ])

let describe_instance_properties_max_results_to_yojson = int_to_yojson

let describe_instance_properties_request_to_yojson = 
  fun (x: describe_instance_properties_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson describe_instance_properties_max_results_to_yojson x.max_results));
       (
         "FiltersWithOperator",
         (option_to_yojson instance_property_string_filter_list_to_yojson x.filters_with_operator));
       (
         "InstancePropertyFilterList",
         (option_to_yojson instance_property_filter_list_to_yojson x.instance_property_filter_list));
       
  ])

let describe_instance_patches_result_to_yojson = 
  fun (x: describe_instance_patches_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Patches",
         (option_to_yojson patch_compliance_data_list_to_yojson x.patches));
       
  ])

let describe_instance_patches_request_to_yojson = 
  fun (x: describe_instance_patches_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson patch_compliance_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Filters",
         (option_to_yojson patch_orchestrator_filter_list_to_yojson x.filters));
       (
         "InstanceId",
         (Some (instance_id_to_yojson x.instance_id)));
       
  ])

let describe_instance_patch_states_result_to_yojson = 
  fun (x: describe_instance_patch_states_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "InstancePatchStates",
         (option_to_yojson instance_patch_state_list_to_yojson x.instance_patch_states));
       
  ])

let describe_instance_patch_states_request_to_yojson = 
  fun (x: describe_instance_patch_states_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson patch_compliance_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "InstanceIds",
         (Some (instance_id_list_to_yojson x.instance_ids)));
       
  ])

let describe_instance_patch_states_for_patch_group_result_to_yojson = 
  fun (x: describe_instance_patch_states_for_patch_group_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "InstancePatchStates",
         (option_to_yojson instance_patch_states_list_to_yojson x.instance_patch_states));
       
  ])

let describe_instance_patch_states_for_patch_group_request_to_yojson = 
  fun (x: describe_instance_patch_states_for_patch_group_request) -> assoc_to_yojson(
    [(
         "MaxResults",
         (option_to_yojson patch_compliance_max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Filters",
         (option_to_yojson instance_patch_state_filter_list_to_yojson x.filters));
       (
         "PatchGroup",
         (Some (patch_group_to_yojson x.patch_group)));
       
  ])

let describe_instance_information_result_to_yojson = 
  fun (x: describe_instance_information_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "InstanceInformationList",
         (option_to_yojson instance_information_list_to_yojson x.instance_information_list));
       
  ])

let describe_instance_information_request_to_yojson = 
  fun (x: describe_instance_information_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_ec2_compatible_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson instance_information_string_filter_list_to_yojson x.filters));
       (
         "InstanceInformationFilterList",
         (option_to_yojson instance_information_filter_list_to_yojson x.instance_information_filter_list));
       
  ])

let describe_instance_associations_status_result_to_yojson = 
  fun (x: describe_instance_associations_status_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "InstanceAssociationStatusInfos",
         (option_to_yojson instance_association_status_infos_to_yojson x.instance_association_status_infos));
       
  ])

let describe_instance_associations_status_request_to_yojson = 
  fun (x: describe_instance_associations_status_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "InstanceId",
         (Some (instance_id_to_yojson x.instance_id)));
       
  ])

let describe_effective_patches_for_patch_baseline_result_to_yojson = 
  fun (x: describe_effective_patches_for_patch_baseline_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "EffectivePatches",
         (option_to_yojson effective_patch_list_to_yojson x.effective_patches));
       
  ])

let describe_effective_patches_for_patch_baseline_request_to_yojson = 
  fun (x: describe_effective_patches_for_patch_baseline_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson patch_baseline_max_results_to_yojson x.max_results));
       (
         "BaselineId",
         (Some (baseline_id_to_yojson x.baseline_id)));
       
  ])

let describe_effective_instance_associations_result_to_yojson = 
  fun (x: describe_effective_instance_associations_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Associations",
         (option_to_yojson instance_association_list_to_yojson x.associations));
       
  ])

let describe_effective_instance_associations_request_to_yojson = 
  fun (x: describe_effective_instance_associations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson effective_instance_association_max_results_to_yojson x.max_results));
       (
         "InstanceId",
         (Some (instance_id_to_yojson x.instance_id)));
       
  ])

let describe_document_result_to_yojson = 
  fun (x: describe_document_result) -> assoc_to_yojson(
    [(
         "Document",
         (option_to_yojson document_description_to_yojson x.document));
       
  ])

let describe_document_request_to_yojson = 
  fun (x: describe_document_request) -> assoc_to_yojson(
    [(
         "VersionName",
         (option_to_yojson document_version_name_to_yojson x.version_name));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "Name",
         (Some (document_ar_n_to_yojson x.name)));
       
  ])

let account_sharing_info_to_yojson = 
  fun (x: account_sharing_info) -> assoc_to_yojson(
    [(
         "SharedDocumentVersion",
         (option_to_yojson shared_document_version_to_yojson x.shared_document_version));
       (
         "AccountId",
         (option_to_yojson account_id_to_yojson x.account_id));
       
  ])

let account_sharing_info_list_to_yojson = 
  fun tree -> list_to_yojson account_sharing_info_to_yojson tree

let describe_document_permission_response_to_yojson = 
  fun (x: describe_document_permission_response) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AccountSharingInfoList",
         (option_to_yojson account_sharing_info_list_to_yojson x.account_sharing_info_list));
       (
         "AccountIds",
         (option_to_yojson account_id_list_to_yojson x.account_ids));
       
  ])

let describe_document_permission_request_to_yojson = 
  fun (x: describe_document_permission_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson document_permission_max_results_to_yojson x.max_results));
       (
         "PermissionType",
         (Some (document_permission_type_to_yojson x.permission_type)));
       (
         "Name",
         (Some (document_name_to_yojson x.name)));
       
  ])

let describe_available_patches_result_to_yojson = 
  fun (x: describe_available_patches_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Patches",
         (option_to_yojson patch_list_to_yojson x.patches));
       
  ])

let describe_available_patches_request_to_yojson = 
  fun (x: describe_available_patches_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson patch_baseline_max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson patch_orchestrator_filter_list_to_yojson x.filters));
       
  ])

let describe_automation_step_executions_result_to_yojson = 
  fun (x: describe_automation_step_executions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "StepExecutions",
         (option_to_yojson step_execution_list_to_yojson x.step_executions));
       
  ])

let describe_automation_step_executions_request_to_yojson = 
  fun (x: describe_automation_step_executions_request) -> assoc_to_yojson(
    [(
         "ReverseOrder",
         (option_to_yojson boolean__to_yojson x.reverse_order));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "Filters",
         (option_to_yojson step_execution_filter_list_to_yojson x.filters));
       (
         "AutomationExecutionId",
         (Some (automation_execution_id_to_yojson x.automation_execution_id)));
       
  ])

let automation_type_to_yojson = 
  fun (x: automation_type) -> match x with 
  | Local -> `String "Local"
    | CrossAccount -> `String "CrossAccount"
     

let automation_execution_metadata_to_yojson = 
  fun (x: automation_execution_metadata) -> assoc_to_yojson(
    [(
         "ChangeRequestName",
         (option_to_yojson change_request_name_to_yojson x.change_request_name));
       (
         "AssociationId",
         (option_to_yojson string__to_yojson x.association_id));
       (
         "OpsItemId",
         (option_to_yojson string__to_yojson x.ops_item_id));
       (
         "Runbooks",
         (option_to_yojson runbooks_to_yojson x.runbooks));
       (
         "ScheduledTime",
         (option_to_yojson date_time_to_yojson x.scheduled_time));
       (
         "AutomationSubtype",
         (option_to_yojson automation_subtype_to_yojson x.automation_subtype));
       (
         "TriggeredAlarms",
         (option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms));
       (
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "AutomationType",
         (option_to_yojson automation_type_to_yojson x.automation_type));
       (
         "Target",
         (option_to_yojson string__to_yojson x.target));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "ResolvedTargets",
         (option_to_yojson resolved_targets_to_yojson x.resolved_targets));
       (
         "TargetMaps",
         (option_to_yojson target_maps_to_yojson x.target_maps));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "TargetParameterName",
         (option_to_yojson automation_parameter_key_to_yojson x.target_parameter_name));
       (
         "FailureMessage",
         (option_to_yojson string__to_yojson x.failure_message));
       (
         "CurrentAction",
         (option_to_yojson string__to_yojson x.current_action));
       (
         "CurrentStepName",
         (option_to_yojson string__to_yojson x.current_step_name));
       (
         "ParentAutomationExecutionId",
         (option_to_yojson automation_execution_id_to_yojson x.parent_automation_execution_id));
       (
         "Mode",
         (option_to_yojson execution_mode_to_yojson x.mode));
       (
         "Outputs",
         (option_to_yojson automation_parameter_map_to_yojson x.outputs));
       (
         "LogFile",
         (option_to_yojson string__to_yojson x.log_file));
       (
         "ExecutedBy",
         (option_to_yojson string__to_yojson x.executed_by));
       (
         "ExecutionEndTime",
         (option_to_yojson date_time_to_yojson x.execution_end_time));
       (
         "ExecutionStartTime",
         (option_to_yojson date_time_to_yojson x.execution_start_time));
       (
         "AutomationExecutionStatus",
         (option_to_yojson automation_execution_status_to_yojson x.automation_execution_status));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "DocumentName",
         (option_to_yojson document_name_to_yojson x.document_name));
       (
         "AutomationExecutionId",
         (option_to_yojson automation_execution_id_to_yojson x.automation_execution_id));
       
  ])

let automation_execution_metadata_list_to_yojson = 
  fun tree -> list_to_yojson automation_execution_metadata_to_yojson tree

let describe_automation_executions_result_to_yojson = 
  fun (x: describe_automation_executions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AutomationExecutionMetadataList",
         (option_to_yojson automation_execution_metadata_list_to_yojson x.automation_execution_metadata_list));
       
  ])

let automation_execution_filter_key_to_yojson = 
  fun (x: automation_execution_filter_key) -> match x with 
 
| OPS_ITEM_ID -> `String "OpsItemId"
  | AUTOMATION_SUBTYPE -> `String "AutomationSubtype"
  | TARGET_RESOURCE_GROUP -> `String "TargetResourceGroup"
  | TAG_KEY -> `String "TagKey"
  | AUTOMATION_TYPE -> `String "AutomationType"
  | START_TIME_AFTER -> `String "StartTimeAfter"
  | START_TIME_BEFORE -> `String "StartTimeBefore"
  | CURRENT_ACTION -> `String "CurrentAction"
  | PARENT_EXECUTION_ID -> `String "ParentExecutionId"
  | EXECUTION_ID -> `String "ExecutionId"
  | EXECUTION_STATUS -> `String "ExecutionStatus"
  | DOCUMENT_NAME_PREFIX -> `String "DocumentNamePrefix"
   

let automation_execution_filter_value_to_yojson = string_to_yojson

let automation_execution_filter_value_list_to_yojson = 
  fun tree -> list_to_yojson automation_execution_filter_value_to_yojson tree

let automation_execution_filter_to_yojson = 
  fun (x: automation_execution_filter) -> assoc_to_yojson(
    [(
         "Values",
         (Some (automation_execution_filter_value_list_to_yojson x.values)));
       (
         "Key",
         (Some (automation_execution_filter_key_to_yojson x.key)));
       
  ])

let automation_execution_filter_list_to_yojson = 
  fun tree -> list_to_yojson automation_execution_filter_to_yojson tree

let describe_automation_executions_request_to_yojson = 
  fun (x: describe_automation_executions_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson automation_execution_filter_list_to_yojson x.filters));
       
  ])

let describe_association_result_to_yojson = 
  fun (x: describe_association_result) -> assoc_to_yojson(
    [(
         "AssociationDescription",
         (option_to_yojson association_description_to_yojson x.association_description));
       
  ])

let describe_association_request_to_yojson = 
  fun (x: describe_association_request) -> assoc_to_yojson(
    [(
         "AssociationVersion",
         (option_to_yojson association_version_to_yojson x.association_version));
       (
         "AssociationId",
         (option_to_yojson association_id_to_yojson x.association_id));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "Name",
         (option_to_yojson document_ar_n_to_yojson x.name));
       
  ])

let association_execution_id_to_yojson = string_to_yojson

let association_execution_to_yojson = 
  fun (x: association_execution) -> assoc_to_yojson(
    [(
         "TriggeredAlarms",
         (option_to_yojson alarm_state_information_list_to_yojson x.triggered_alarms));
       (
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "ResourceCountByStatus",
         (option_to_yojson resource_count_by_status_to_yojson x.resource_count_by_status));
       (
         "LastExecutionDate",
         (option_to_yojson date_time_to_yojson x.last_execution_date));
       (
         "CreatedTime",
         (option_to_yojson date_time_to_yojson x.created_time));
       (
         "DetailedStatus",
         (option_to_yojson status_name_to_yojson x.detailed_status));
       (
         "Status",
         (option_to_yojson status_name_to_yojson x.status));
       (
         "ExecutionId",
         (option_to_yojson association_execution_id_to_yojson x.execution_id));
       (
         "AssociationVersion",
         (option_to_yojson association_version_to_yojson x.association_version));
       (
         "AssociationId",
         (option_to_yojson association_id_to_yojson x.association_id));
       
  ])

let association_executions_list_to_yojson = 
  fun tree -> list_to_yojson association_execution_to_yojson tree

let describe_association_executions_result_to_yojson = 
  fun (x: describe_association_executions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AssociationExecutions",
         (option_to_yojson association_executions_list_to_yojson x.association_executions));
       
  ])

let association_execution_filter_key_to_yojson = 
  fun (x: association_execution_filter_key) -> match x with 
 
| CreatedTime -> `String "CreatedTime"
  | Status -> `String "Status"
  | ExecutionId -> `String "ExecutionId"
   

let association_execution_filter_value_to_yojson = string_to_yojson

let association_filter_operator_type_to_yojson = 
  fun (x: association_filter_operator_type) -> match x with 
 
| GreaterThan -> `String "GREATER_THAN"
  | LessThan -> `String "LESS_THAN"
  | Equal -> `String "EQUAL"
   

let association_execution_filter_to_yojson = 
  fun (x: association_execution_filter) -> assoc_to_yojson(
    [(
         "Type",
         (Some (association_filter_operator_type_to_yojson x.type_)));
       (
         "Value",
         (Some (association_execution_filter_value_to_yojson x.value)));
       (
         "Key",
         (Some (association_execution_filter_key_to_yojson x.key)));
       
  ])

let association_execution_filter_list_to_yojson = 
  fun tree -> list_to_yojson association_execution_filter_to_yojson tree

let describe_association_executions_request_to_yojson = 
  fun (x: describe_association_executions_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson association_execution_filter_list_to_yojson x.filters));
       (
         "AssociationId",
         (Some (association_id_to_yojson x.association_id)));
       
  ])

let association_resource_id_to_yojson = string_to_yojson

let association_resource_type_to_yojson = string_to_yojson

let association_execution_target_to_yojson = 
  fun (x: association_execution_target) -> assoc_to_yojson(
    [(
         "OutputSource",
         (option_to_yojson output_source_to_yojson x.output_source));
       (
         "LastExecutionDate",
         (option_to_yojson date_time_to_yojson x.last_execution_date));
       (
         "DetailedStatus",
         (option_to_yojson status_name_to_yojson x.detailed_status));
       (
         "Status",
         (option_to_yojson status_name_to_yojson x.status));
       (
         "ResourceType",
         (option_to_yojson association_resource_type_to_yojson x.resource_type));
       (
         "ResourceId",
         (option_to_yojson association_resource_id_to_yojson x.resource_id));
       (
         "ExecutionId",
         (option_to_yojson association_execution_id_to_yojson x.execution_id));
       (
         "AssociationVersion",
         (option_to_yojson association_version_to_yojson x.association_version));
       (
         "AssociationId",
         (option_to_yojson association_id_to_yojson x.association_id));
       
  ])

let association_execution_targets_list_to_yojson = 
  fun tree -> list_to_yojson association_execution_target_to_yojson tree

let describe_association_execution_targets_result_to_yojson = 
  fun (x: describe_association_execution_targets_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "AssociationExecutionTargets",
         (option_to_yojson association_execution_targets_list_to_yojson x.association_execution_targets));
       
  ])

let association_execution_targets_filter_key_to_yojson = 
  fun (x: association_execution_targets_filter_key) -> match x with 
 
| ResourceType -> `String "ResourceType"
  | ResourceId -> `String "ResourceId"
  | Status -> `String "Status"
   

let association_execution_targets_filter_value_to_yojson = 
  string_to_yojson

let association_execution_targets_filter_to_yojson = 
  fun (x: association_execution_targets_filter) -> assoc_to_yojson(
    [(
         "Value",
         (Some (association_execution_targets_filter_value_to_yojson x.value)));
       (
         "Key",
         (Some (association_execution_targets_filter_key_to_yojson x.key)));
       
  ])

let association_execution_targets_filter_list_to_yojson = 
  fun tree -> list_to_yojson association_execution_targets_filter_to_yojson tree

let describe_association_execution_targets_request_to_yojson = 
  fun (x: describe_association_execution_targets_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson association_execution_targets_filter_list_to_yojson x.filters));
       (
         "ExecutionId",
         (Some (association_execution_id_to_yojson x.execution_id)));
       (
         "AssociationId",
         (Some (association_id_to_yojson x.association_id)));
       
  ])

let association_execution_does_not_exist_to_yojson = 
  fun (x: association_execution_does_not_exist) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let activation_description_to_yojson = string_to_yojson

let default_instance_name_to_yojson = string_to_yojson

let created_date_to_yojson = timestamp_to_yojson

let activation_to_yojson = 
  fun (x: activation) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "CreatedDate",
         (option_to_yojson created_date_to_yojson x.created_date));
       (
         "Expired",
         (option_to_yojson boolean__to_yojson x.expired));
       (
         "ExpirationDate",
         (option_to_yojson expiration_date_to_yojson x.expiration_date));
       (
         "RegistrationsCount",
         (option_to_yojson registrations_count_to_yojson x.registrations_count));
       (
         "RegistrationLimit",
         (option_to_yojson registration_limit_to_yojson x.registration_limit));
       (
         "IamRole",
         (option_to_yojson iam_role_to_yojson x.iam_role));
       (
         "DefaultInstanceName",
         (option_to_yojson default_instance_name_to_yojson x.default_instance_name));
       (
         "Description",
         (option_to_yojson activation_description_to_yojson x.description));
       (
         "ActivationId",
         (option_to_yojson activation_id_to_yojson x.activation_id));
       
  ])

let activation_list_to_yojson = 
  fun tree -> list_to_yojson activation_to_yojson tree

let describe_activations_result_to_yojson = 
  fun (x: describe_activations_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "ActivationList",
         (option_to_yojson activation_list_to_yojson x.activation_list));
       
  ])

let describe_activations_filter_keys_to_yojson = 
  fun (x: describe_activations_filter_keys) -> match x with 
 
| IAM_ROLE -> `String "IamRole"
  | DEFAULT_INSTANCE_NAME -> `String "DefaultInstanceName"
  | ACTIVATION_IDS -> `String "ActivationIds"
   

let describe_activations_filter_to_yojson = 
  fun (x: describe_activations_filter) -> assoc_to_yojson(
    [(
         "FilterValues",
         (option_to_yojson string_list_to_yojson x.filter_values));
       (
         "FilterKey",
         (option_to_yojson describe_activations_filter_keys_to_yojson x.filter_key));
       
  ])

let describe_activations_filter_list_to_yojson = 
  fun tree -> list_to_yojson describe_activations_filter_to_yojson tree

let describe_activations_request_to_yojson = 
  fun (x: describe_activations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson next_token_to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson max_results_to_yojson x.max_results));
       (
         "Filters",
         (option_to_yojson describe_activations_filter_list_to_yojson x.filters));
       
  ])

let deregister_task_from_maintenance_window_result_to_yojson = 
  fun (x: deregister_task_from_maintenance_window_result) -> assoc_to_yojson(
    [(
         "WindowTaskId",
         (option_to_yojson maintenance_window_task_id_to_yojson x.window_task_id));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let deregister_task_from_maintenance_window_request_to_yojson = 
  fun (x: deregister_task_from_maintenance_window_request) -> assoc_to_yojson(
    [(
         "WindowTaskId",
         (Some (maintenance_window_task_id_to_yojson x.window_task_id)));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let deregister_target_from_maintenance_window_result_to_yojson = 
  fun (x: deregister_target_from_maintenance_window_result) -> assoc_to_yojson(
    [(
         "WindowTargetId",
         (option_to_yojson maintenance_window_target_id_to_yojson x.window_target_id));
       (
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let deregister_target_from_maintenance_window_request_to_yojson = 
  fun (x: deregister_target_from_maintenance_window_request) -> assoc_to_yojson(
    [(
         "Safe",
         (option_to_yojson boolean__to_yojson x.safe));
       (
         "WindowTargetId",
         (Some (maintenance_window_target_id_to_yojson x.window_target_id)));
       (
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let deregister_patch_baseline_for_patch_group_result_to_yojson = 
  fun (x: deregister_patch_baseline_for_patch_group_result) -> assoc_to_yojson(
    [(
         "PatchGroup",
         (option_to_yojson patch_group_to_yojson x.patch_group));
       (
         "BaselineId",
         (option_to_yojson baseline_id_to_yojson x.baseline_id));
       
  ])

let deregister_patch_baseline_for_patch_group_request_to_yojson = 
  fun (x: deregister_patch_baseline_for_patch_group_request) -> assoc_to_yojson(
    [(
         "PatchGroup",
         (Some (patch_group_to_yojson x.patch_group)));
       (
         "BaselineId",
         (Some (baseline_id_to_yojson x.baseline_id)));
       
  ])

let deregister_managed_instance_result_to_yojson = 
  fun (x: deregister_managed_instance_result) -> assoc_to_yojson(
    [
  ])

let deregister_managed_instance_request_to_yojson = 
  fun (x: deregister_managed_instance_request) -> assoc_to_yojson(
    [(
         "InstanceId",
         (Some (managed_instance_id_to_yojson x.instance_id)));
       
  ])

let delete_resource_policy_response_to_yojson = 
  fun (x: delete_resource_policy_response) -> assoc_to_yojson(
    [
  ])

let delete_resource_policy_request_to_yojson = 
  fun (x: delete_resource_policy_request) -> assoc_to_yojson(
    [(
         "PolicyHash",
         (Some (policy_hash_to_yojson x.policy_hash)));
       (
         "PolicyId",
         (Some (policy_id_to_yojson x.policy_id)));
       (
         "ResourceArn",
         (Some (resource_arn_string_to_yojson x.resource_arn)));
       
  ])

let delete_resource_data_sync_result_to_yojson = 
  fun (x: delete_resource_data_sync_result) -> assoc_to_yojson(
    [
  ])

let delete_resource_data_sync_request_to_yojson = 
  fun (x: delete_resource_data_sync_request) -> assoc_to_yojson(
    [(
         "SyncType",
         (option_to_yojson resource_data_sync_type_to_yojson x.sync_type));
       (
         "SyncName",
         (Some (resource_data_sync_name_to_yojson x.sync_name)));
       
  ])

let delete_patch_baseline_result_to_yojson = 
  fun (x: delete_patch_baseline_result) -> assoc_to_yojson(
    [(
         "BaselineId",
         (option_to_yojson baseline_id_to_yojson x.baseline_id));
       
  ])

let delete_patch_baseline_request_to_yojson = 
  fun (x: delete_patch_baseline_request) -> assoc_to_yojson(
    [(
         "BaselineId",
         (Some (baseline_id_to_yojson x.baseline_id)));
       
  ])

let delete_parameters_result_to_yojson = 
  fun (x: delete_parameters_result) -> assoc_to_yojson(
    [(
         "InvalidParameters",
         (option_to_yojson parameter_name_list_to_yojson x.invalid_parameters));
       (
         "DeletedParameters",
         (option_to_yojson parameter_name_list_to_yojson x.deleted_parameters));
       
  ])

let delete_parameters_request_to_yojson = 
  fun (x: delete_parameters_request) -> assoc_to_yojson(
    [(
         "Names",
         (Some (parameter_name_list_to_yojson x.names)));
       
  ])

let delete_parameter_result_to_yojson = 
  fun (x: delete_parameter_result) -> assoc_to_yojson(
    [
  ])

let delete_parameter_request_to_yojson = 
  fun (x: delete_parameter_request) -> assoc_to_yojson(
    [(
         "Name",
         (Some (ps_parameter_name_to_yojson x.name)));
       
  ])

let delete_ops_metadata_result_to_yojson = 
  fun (x: delete_ops_metadata_result) -> assoc_to_yojson(
    [
  ])

let delete_ops_metadata_request_to_yojson = 
  fun (x: delete_ops_metadata_request) -> assoc_to_yojson(
    [(
         "OpsMetadataArn",
         (Some (ops_metadata_arn_to_yojson x.ops_metadata_arn)));
       
  ])

let delete_ops_item_response_to_yojson = 
  fun (x: delete_ops_item_response) -> assoc_to_yojson(
    [
  ])

let delete_ops_item_request_to_yojson = 
  fun (x: delete_ops_item_request) -> assoc_to_yojson(
    [(
         "OpsItemId",
         (Some (ops_item_id_to_yojson x.ops_item_id)));
       
  ])

let delete_maintenance_window_result_to_yojson = 
  fun (x: delete_maintenance_window_result) -> assoc_to_yojson(
    [(
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let delete_maintenance_window_request_to_yojson = 
  fun (x: delete_maintenance_window_request) -> assoc_to_yojson(
    [(
         "WindowId",
         (Some (maintenance_window_id_to_yojson x.window_id)));
       
  ])

let delete_inventory_result_to_yojson = 
  fun (x: delete_inventory_result) -> assoc_to_yojson(
    [(
         "DeletionSummary",
         (option_to_yojson inventory_deletion_summary_to_yojson x.deletion_summary));
       (
         "TypeName",
         (option_to_yojson inventory_item_type_name_to_yojson x.type_name));
       (
         "DeletionId",
         (option_to_yojson uui_d_to_yojson x.deletion_id));
       
  ])

let delete_inventory_request_to_yojson = 
  fun (x: delete_inventory_request) -> assoc_to_yojson(
    [(
         "ClientToken",
         (option_to_yojson uui_d_to_yojson x.client_token));
       (
         "DryRun",
         (option_to_yojson dry_run_to_yojson x.dry_run));
       (
         "SchemaDeleteOption",
         (option_to_yojson inventory_schema_delete_option_to_yojson x.schema_delete_option));
       (
         "TypeName",
         (Some (inventory_item_type_name_to_yojson x.type_name)));
       
  ])

let delete_document_result_to_yojson = 
  fun (x: delete_document_result) -> assoc_to_yojson(
    [
  ])

let delete_document_request_to_yojson = 
  fun (x: delete_document_request) -> assoc_to_yojson(
    [(
         "Force",
         (option_to_yojson boolean__to_yojson x.force));
       (
         "VersionName",
         (option_to_yojson document_version_name_to_yojson x.version_name));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "Name",
         (Some (document_name_to_yojson x.name)));
       
  ])

let associated_instances_to_yojson = 
  fun (x: associated_instances) -> assoc_to_yojson(
    [
  ])

let delete_association_result_to_yojson = 
  fun (x: delete_association_result) -> assoc_to_yojson(
    [
  ])

let delete_association_request_to_yojson = 
  fun (x: delete_association_request) -> assoc_to_yojson(
    [(
         "AssociationId",
         (option_to_yojson association_id_to_yojson x.association_id));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "Name",
         (option_to_yojson document_ar_n_to_yojson x.name));
       
  ])

let delete_activation_result_to_yojson = 
  fun (x: delete_activation_result) -> assoc_to_yojson(
    [
  ])

let delete_activation_request_to_yojson = 
  fun (x: delete_activation_request) -> assoc_to_yojson(
    [(
         "ActivationId",
         (Some (activation_id_to_yojson x.activation_id)));
       
  ])

let create_resource_data_sync_result_to_yojson = 
  fun (x: create_resource_data_sync_result) -> assoc_to_yojson(
    [
  ])

let create_resource_data_sync_request_to_yojson = 
  fun (x: create_resource_data_sync_request) -> assoc_to_yojson(
    [(
         "SyncSource",
         (option_to_yojson resource_data_sync_source_to_yojson x.sync_source));
       (
         "SyncType",
         (option_to_yojson resource_data_sync_type_to_yojson x.sync_type));
       (
         "S3Destination",
         (option_to_yojson resource_data_sync_s3_destination_to_yojson x.s3_destination));
       (
         "SyncName",
         (Some (resource_data_sync_name_to_yojson x.sync_name)));
       
  ])

let create_patch_baseline_result_to_yojson = 
  fun (x: create_patch_baseline_result) -> assoc_to_yojson(
    [(
         "BaselineId",
         (option_to_yojson baseline_id_to_yojson x.baseline_id));
       
  ])

let create_patch_baseline_request_to_yojson = 
  fun (x: create_patch_baseline_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ClientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "Sources",
         (option_to_yojson patch_source_list_to_yojson x.sources));
       (
         "Description",
         (option_to_yojson baseline_description_to_yojson x.description));
       (
         "RejectedPatchesAction",
         (option_to_yojson patch_action_to_yojson x.rejected_patches_action));
       (
         "RejectedPatches",
         (option_to_yojson patch_id_list_to_yojson x.rejected_patches));
       (
         "ApprovedPatchesEnableNonSecurity",
         (option_to_yojson boolean__to_yojson x.approved_patches_enable_non_security));
       (
         "ApprovedPatchesComplianceLevel",
         (option_to_yojson patch_compliance_level_to_yojson x.approved_patches_compliance_level));
       (
         "ApprovedPatches",
         (option_to_yojson patch_id_list_to_yojson x.approved_patches));
       (
         "ApprovalRules",
         (option_to_yojson patch_rule_group_to_yojson x.approval_rules));
       (
         "GlobalFilters",
         (option_to_yojson patch_filter_group_to_yojson x.global_filters));
       (
         "Name",
         (Some (baseline_name_to_yojson x.name)));
       (
         "OperatingSystem",
         (option_to_yojson operating_system_to_yojson x.operating_system));
       
  ])

let create_ops_metadata_result_to_yojson = 
  fun (x: create_ops_metadata_result) -> assoc_to_yojson(
    [(
         "OpsMetadataArn",
         (option_to_yojson ops_metadata_arn_to_yojson x.ops_metadata_arn));
       
  ])

let create_ops_metadata_request_to_yojson = 
  fun (x: create_ops_metadata_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Metadata",
         (option_to_yojson metadata_map_to_yojson x.metadata));
       (
         "ResourceId",
         (Some (ops_metadata_resource_id_to_yojson x.resource_id)));
       
  ])

let create_ops_item_response_to_yojson = 
  fun (x: create_ops_item_response) -> assoc_to_yojson(
    [(
         "OpsItemArn",
         (option_to_yojson ops_item_arn_to_yojson x.ops_item_arn));
       (
         "OpsItemId",
         (option_to_yojson string__to_yojson x.ops_item_id));
       
  ])

let create_ops_item_request_to_yojson = 
  fun (x: create_ops_item_request) -> assoc_to_yojson(
    [(
         "AccountId",
         (option_to_yojson ops_item_account_id_to_yojson x.account_id));
       (
         "PlannedEndTime",
         (option_to_yojson date_time_to_yojson x.planned_end_time));
       (
         "PlannedStartTime",
         (option_to_yojson date_time_to_yojson x.planned_start_time));
       (
         "ActualEndTime",
         (option_to_yojson date_time_to_yojson x.actual_end_time));
       (
         "ActualStartTime",
         (option_to_yojson date_time_to_yojson x.actual_start_time));
       (
         "Severity",
         (option_to_yojson ops_item_severity_to_yojson x.severity));
       (
         "Category",
         (option_to_yojson ops_item_category_to_yojson x.category));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "Title",
         (Some (ops_item_title_to_yojson x.title)));
       (
         "Source",
         (Some (ops_item_source_to_yojson x.source)));
       (
         "RelatedOpsItems",
         (option_to_yojson related_ops_items_to_yojson x.related_ops_items));
       (
         "Priority",
         (option_to_yojson ops_item_priority_to_yojson x.priority));
       (
         "Notifications",
         (option_to_yojson ops_item_notifications_to_yojson x.notifications));
       (
         "OperationalData",
         (option_to_yojson ops_item_operational_data_to_yojson x.operational_data));
       (
         "OpsItemType",
         (option_to_yojson ops_item_type_to_yojson x.ops_item_type));
       (
         "Description",
         (Some (ops_item_description_to_yojson x.description)));
       
  ])

let create_maintenance_window_result_to_yojson = 
  fun (x: create_maintenance_window_result) -> assoc_to_yojson(
    [(
         "WindowId",
         (option_to_yojson maintenance_window_id_to_yojson x.window_id));
       
  ])

let create_maintenance_window_request_to_yojson = 
  fun (x: create_maintenance_window_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ClientToken",
         (option_to_yojson client_token_to_yojson x.client_token));
       (
         "AllowUnassociatedTargets",
         (Some (maintenance_window_allow_unassociated_targets_to_yojson x.allow_unassociated_targets)));
       (
         "Cutoff",
         (Some (maintenance_window_cutoff_to_yojson x.cutoff)));
       (
         "Duration",
         (Some (maintenance_window_duration_hours_to_yojson x.duration)));
       (
         "ScheduleOffset",
         (option_to_yojson maintenance_window_offset_to_yojson x.schedule_offset));
       (
         "ScheduleTimezone",
         (option_to_yojson maintenance_window_timezone_to_yojson x.schedule_timezone));
       (
         "Schedule",
         (Some (maintenance_window_schedule_to_yojson x.schedule)));
       (
         "EndDate",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.end_date));
       (
         "StartDate",
         (option_to_yojson maintenance_window_string_date_time_to_yojson x.start_date));
       (
         "Description",
         (option_to_yojson maintenance_window_description_to_yojson x.description));
       (
         "Name",
         (Some (maintenance_window_name_to_yojson x.name)));
       
  ])

let create_document_result_to_yojson = 
  fun (x: create_document_result) -> assoc_to_yojson(
    [(
         "DocumentDescription",
         (option_to_yojson document_description_to_yojson x.document_description));
       
  ])

let create_document_request_to_yojson = 
  fun (x: create_document_request) -> assoc_to_yojson(
    [(
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "TargetType",
         (option_to_yojson target_type_to_yojson x.target_type));
       (
         "DocumentFormat",
         (option_to_yojson document_format_to_yojson x.document_format));
       (
         "DocumentType",
         (option_to_yojson document_type_to_yojson x.document_type));
       (
         "VersionName",
         (option_to_yojson document_version_name_to_yojson x.version_name));
       (
         "DisplayName",
         (option_to_yojson document_display_name_to_yojson x.display_name));
       (
         "Name",
         (Some (document_name_to_yojson x.name)));
       (
         "Attachments",
         (option_to_yojson attachments_source_list_to_yojson x.attachments));
       (
         "Requires",
         (option_to_yojson document_requires_list_to_yojson x.requires));
       (
         "Content",
         (Some (document_content_to_yojson x.content)));
       
  ])

let create_association_result_to_yojson = 
  fun (x: create_association_result) -> assoc_to_yojson(
    [(
         "AssociationDescription",
         (option_to_yojson association_description_to_yojson x.association_description));
       
  ])

let create_association_request_to_yojson = 
  fun (x: create_association_request) -> assoc_to_yojson(
    [(
         "AlarmConfiguration",
         (option_to_yojson alarm_configuration_to_yojson x.alarm_configuration));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "TargetMaps",
         (option_to_yojson target_maps_to_yojson x.target_maps));
       (
         "Duration",
         (option_to_yojson duration_to_yojson x.duration));
       (
         "ScheduleOffset",
         (option_to_yojson schedule_offset_to_yojson x.schedule_offset));
       (
         "TargetLocations",
         (option_to_yojson target_locations_to_yojson x.target_locations));
       (
         "CalendarNames",
         (option_to_yojson calendar_name_or_arn_list_to_yojson x.calendar_names));
       (
         "ApplyOnlyAtCronInterval",
         (option_to_yojson apply_only_at_cron_interval_to_yojson x.apply_only_at_cron_interval));
       (
         "SyncCompliance",
         (option_to_yojson association_sync_compliance_to_yojson x.sync_compliance));
       (
         "ComplianceSeverity",
         (option_to_yojson association_compliance_severity_to_yojson x.compliance_severity));
       (
         "MaxConcurrency",
         (option_to_yojson max_concurrency_to_yojson x.max_concurrency));
       (
         "MaxErrors",
         (option_to_yojson max_errors_to_yojson x.max_errors));
       (
         "AutomationTargetParameterName",
         (option_to_yojson automation_target_parameter_name_to_yojson x.automation_target_parameter_name));
       (
         "AssociationName",
         (option_to_yojson association_name_to_yojson x.association_name));
       (
         "OutputLocation",
         (option_to_yojson instance_association_output_location_to_yojson x.output_location));
       (
         "ScheduleExpression",
         (option_to_yojson schedule_expression_to_yojson x.schedule_expression));
       (
         "Targets",
         (option_to_yojson targets_to_yojson x.targets));
       (
         "Parameters",
         (option_to_yojson parameters_to_yojson x.parameters));
       (
         "InstanceId",
         (option_to_yojson instance_id_to_yojson x.instance_id));
       (
         "DocumentVersion",
         (option_to_yojson document_version_to_yojson x.document_version));
       (
         "Name",
         (Some (document_ar_n_to_yojson x.name)));
       
  ])

let association_description_list_to_yojson = 
  fun tree -> list_to_yojson association_description_to_yojson tree

let create_association_batch_result_to_yojson = 
  fun (x: create_association_batch_result) -> assoc_to_yojson(
    [(
         "Failed",
         (option_to_yojson failed_create_association_list_to_yojson x.failed));
       (
         "Successful",
         (option_to_yojson association_description_list_to_yojson x.successful));
       
  ])

let create_association_batch_request_entries_to_yojson = 
  fun tree -> list_to_yojson create_association_batch_request_entry_to_yojson tree

let create_association_batch_request_to_yojson = 
  fun (x: create_association_batch_request) -> assoc_to_yojson(
    [(
         "Entries",
         (Some (create_association_batch_request_entries_to_yojson x.entries)));
       
  ])

let association_limit_exceeded_to_yojson = 
  fun (x: association_limit_exceeded) -> assoc_to_yojson(
    [
  ])

let association_already_exists_to_yojson = 
  fun (x: association_already_exists) -> assoc_to_yojson(
    [
  ])

let activation_code_to_yojson = string_to_yojson

let create_activation_result_to_yojson = 
  fun (x: create_activation_result) -> assoc_to_yojson(
    [(
         "ActivationCode",
         (option_to_yojson activation_code_to_yojson x.activation_code));
       (
         "ActivationId",
         (option_to_yojson activation_id_to_yojson x.activation_id));
       
  ])

let create_activation_request_to_yojson = 
  fun (x: create_activation_request) -> assoc_to_yojson(
    [(
         "RegistrationMetadata",
         (option_to_yojson registration_metadata_list_to_yojson x.registration_metadata));
       (
         "Tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ExpirationDate",
         (option_to_yojson expiration_date_to_yojson x.expiration_date));
       (
         "RegistrationLimit",
         (option_to_yojson registration_limit_to_yojson x.registration_limit));
       (
         "IamRole",
         (Some (iam_role_to_yojson x.iam_role)));
       (
         "DefaultInstanceName",
         (option_to_yojson default_instance_name_to_yojson x.default_instance_name));
       (
         "Description",
         (option_to_yojson activation_description_to_yojson x.description));
       
  ])

let cancel_maintenance_window_execution_result_to_yojson = 
  fun (x: cancel_maintenance_window_execution_result) -> assoc_to_yojson(
    [(
         "WindowExecutionId",
         (option_to_yojson maintenance_window_execution_id_to_yojson x.window_execution_id));
       
  ])

let cancel_maintenance_window_execution_request_to_yojson = 
  fun (x: cancel_maintenance_window_execution_request) -> assoc_to_yojson(
    [(
         "WindowExecutionId",
         (Some (maintenance_window_execution_id_to_yojson x.window_execution_id)));
       
  ])

let cancel_command_result_to_yojson = 
  fun (x: cancel_command_result) -> assoc_to_yojson(
    [
  ])

let cancel_command_request_to_yojson = 
  fun (x: cancel_command_request) -> assoc_to_yojson(
    [(
         "InstanceIds",
         (option_to_yojson instance_id_list_to_yojson x.instance_ids));
       (
         "CommandId",
         (Some (command_id_to_yojson x.command_id)));
       
  ])

let associate_ops_item_related_item_response_to_yojson = 
  fun (x: associate_ops_item_related_item_response) -> assoc_to_yojson(
    [(
         "AssociationId",
         (option_to_yojson ops_item_related_item_association_id_to_yojson x.association_id));
       
  ])

let associate_ops_item_related_item_request_to_yojson = 
  fun (x: associate_ops_item_related_item_request) -> assoc_to_yojson(
    [(
         "ResourceUri",
         (Some (ops_item_related_item_association_resource_uri_to_yojson x.resource_uri)));
       (
         "ResourceType",
         (Some (ops_item_related_item_association_resource_type_to_yojson x.resource_type)));
       (
         "AssociationType",
         (Some (ops_item_related_item_association_type_to_yojson x.association_type)));
       (
         "OpsItemId",
         (Some (ops_item_id_to_yojson x.ops_item_id)));
       
  ])

let add_tags_to_resource_result_to_yojson = 
  fun (x: add_tags_to_resource_result) -> assoc_to_yojson(
    [
  ])

let add_tags_to_resource_request_to_yojson = 
  fun (x: add_tags_to_resource_request) -> assoc_to_yojson(
    [(
         "Tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "ResourceId",
         (Some (resource_id_to_yojson x.resource_id)));
       (
         "ResourceType",
         (Some (resource_type_for_tagging_to_yojson x.resource_type)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

