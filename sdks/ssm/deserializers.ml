open Smaws_Lib.Json.DeserializeHelpers

open Types

let version_of_yojson = string_of_yojson

let valid_next_step_of_yojson = string_of_yojson

let valid_next_step_list_of_yojson = 
  fun tree path -> list_of_yojson valid_next_step_of_yojson tree path 

let url_of_yojson = string_of_yojson

let update_service_setting_result_of_yojson = 
  fun tree path : update_service_setting_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_setting_result = ()
  in _res

let service_setting_id_of_yojson = string_of_yojson

let service_setting_value_of_yojson = string_of_yojson

let update_service_setting_request_of_yojson = 
  fun tree path : update_service_setting_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_service_setting_request = {
    setting_value = value_for_key (service_setting_value_of_yojson) "SettingValue" _list path;
    setting_id = value_for_key (service_setting_id_of_yojson) "SettingId" _list path;
    
  }
  in _res

let string__of_yojson = string_of_yojson

let too_many_updates_of_yojson = 
  fun tree path : too_many_updates ->
  let _list = assoc_of_yojson tree path in
  let _res : too_many_updates = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let service_setting_not_found_of_yojson = 
  fun tree path : service_setting_not_found ->
  let _list = assoc_of_yojson tree path in
  let _res : service_setting_not_found = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let internal_server_error_of_yojson = 
  fun tree path : internal_server_error ->
  let _list = assoc_of_yojson tree path in
  let _res : internal_server_error = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let update_resource_data_sync_result_of_yojson = 
  fun tree path : update_resource_data_sync_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_resource_data_sync_result = ()
  in _res

let resource_data_sync_name_of_yojson = string_of_yojson

let resource_data_sync_type_of_yojson = string_of_yojson

let resource_data_sync_source_type_of_yojson = string_of_yojson

let resource_data_sync_organization_source_type_of_yojson = 
  string_of_yojson

let resource_data_sync_organizational_unit_id_of_yojson = string_of_yojson

let resource_data_sync_organizational_unit_of_yojson = 
  fun tree path : resource_data_sync_organizational_unit ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_organizational_unit = {
    organizational_unit_id = option_of_yojson (value_for_key (resource_data_sync_organizational_unit_id_of_yojson) "OrganizationalUnitId") _list path;
    
  }
  in _res

let resource_data_sync_organizational_unit_list_of_yojson = 
  fun tree path -> list_of_yojson resource_data_sync_organizational_unit_of_yojson tree path 

let resource_data_sync_aws_organizations_source_of_yojson = 
  fun tree path : resource_data_sync_aws_organizations_source ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_aws_organizations_source = {
    organizational_units = option_of_yojson (value_for_key (resource_data_sync_organizational_unit_list_of_yojson) "OrganizationalUnits") _list path;
    organization_source_type = value_for_key (resource_data_sync_organization_source_type_of_yojson) "OrganizationSourceType" _list path;
    
  }
  in _res

let resource_data_sync_source_region_of_yojson = string_of_yojson

let resource_data_sync_source_region_list_of_yojson = 
  fun tree path -> list_of_yojson resource_data_sync_source_region_of_yojson tree path 

let resource_data_sync_include_future_regions_of_yojson = bool_of_yojson

let resource_data_sync_enable_all_ops_data_sources_of_yojson = 
  bool_of_yojson

let resource_data_sync_source_of_yojson = 
  fun tree path : resource_data_sync_source ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_source = {
    enable_all_ops_data_sources = option_of_yojson (value_for_key (resource_data_sync_enable_all_ops_data_sources_of_yojson) "EnableAllOpsDataSources") _list path;
    include_future_regions = option_of_yojson (value_for_key (resource_data_sync_include_future_regions_of_yojson) "IncludeFutureRegions") _list path;
    source_regions = value_for_key (resource_data_sync_source_region_list_of_yojson) "SourceRegions" _list path;
    aws_organizations_source = option_of_yojson (value_for_key (resource_data_sync_aws_organizations_source_of_yojson) "AwsOrganizationsSource") _list path;
    source_type = value_for_key (resource_data_sync_source_type_of_yojson) "SourceType" _list path;
    
  }
  in _res

let update_resource_data_sync_request_of_yojson = 
  fun tree path : update_resource_data_sync_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_resource_data_sync_request = {
    sync_source = value_for_key (resource_data_sync_source_of_yojson) "SyncSource" _list path;
    sync_type = value_for_key (resource_data_sync_type_of_yojson) "SyncType" _list path;
    sync_name = value_for_key (resource_data_sync_name_of_yojson) "SyncName" _list path;
    
  }
  in _res

let resource_data_sync_not_found_exception_of_yojson = 
  fun tree path : resource_data_sync_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    sync_type = option_of_yojson (value_for_key (resource_data_sync_type_of_yojson) "SyncType") _list path;
    sync_name = option_of_yojson (value_for_key (resource_data_sync_name_of_yojson) "SyncName") _list path;
    
  }
  in _res

let resource_data_sync_invalid_configuration_exception_of_yojson = 
  fun tree path : resource_data_sync_invalid_configuration_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_invalid_configuration_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let resource_data_sync_conflict_exception_of_yojson = 
  fun tree path : resource_data_sync_conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_conflict_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let baseline_id_of_yojson = string_of_yojson

let baseline_name_of_yojson = string_of_yojson

let base_unit_of_yojson = unit_of_yojson

let operating_system_of_yojson = 
  fun (tree: t) path : operating_system -> match tree with 
    | `String "AMAZON_LINUX_2023" -> AmazonLinux2023
    | `String "ALMA_LINUX" -> AlmaLinux
    | `String "ROCKY_LINUX" -> Rocky_Linux
    | `String "RASPBIAN" -> Raspbian
    | `String "MACOS" -> MacOS
    | `String "DEBIAN" -> Debian
    | `String "ORACLE_LINUX" -> OracleLinux
    | `String "CENTOS" -> CentOS
    | `String "SUSE" -> Suse
    | `String "REDHAT_ENTERPRISE_LINUX" -> RedhatEnterpriseLinux
    | `String "UBUNTU" -> Ubuntu
    | `String "AMAZON_LINUX_2022" -> AmazonLinux2022
    | `String "AMAZON_LINUX_2" -> AmazonLinux2
    | `String "AMAZON_LINUX" -> AmazonLinux
    | `String "WINDOWS" -> Windows
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperatingSystem" value)
    | _ -> raise (deserialize_wrong_type_error path "OperatingSystem")

let patch_filter_key_of_yojson = 
  fun (tree: t) path : patch_filter_key -> match tree with 
    | `String "VERSION" -> Version
    | `String "SECURITY" -> Security
    | `String "SEVERITY" -> Severity
    | `String "RELEASE" -> Release
    | `String "REPOSITORY" -> Repository
    | `String "PRIORITY" -> Priority
    | `String "SECTION" -> Section
    | `String "PATCH_ID" -> PatchId
    | `String "NAME" -> Name
    | `String "MSRC_SEVERITY" -> MsrcSeverity
    | `String "EPOCH" -> Epoch
    | `String "CVE_ID" -> CVEId
    | `String "CLASSIFICATION" -> Classification
    | `String "PRODUCT_FAMILY" -> ProductFamily
    | `String "PRODUCT" -> Product
    | `String "PATCH_SET" -> PatchSet
    | `String "BUGZILLA_ID" -> BugzillaId
    | `String "ADVISORY_ID" -> AdvisoryId
    | `String "ARCH" -> Arch
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchFilterKey")

let patch_filter_value_of_yojson = string_of_yojson

let patch_filter_value_list_of_yojson = 
  fun tree path -> list_of_yojson patch_filter_value_of_yojson tree path 

let patch_filter_of_yojson = 
  fun tree path : patch_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : patch_filter = {
    values = value_for_key (patch_filter_value_list_of_yojson) "Values" _list path;
    key = value_for_key (patch_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let patch_filter_list_of_yojson = 
  fun tree path -> list_of_yojson patch_filter_of_yojson tree path 

let patch_filter_group_of_yojson = 
  fun tree path : patch_filter_group ->
  let _list = assoc_of_yojson tree path in
  let _res : patch_filter_group = {
    patch_filters = value_for_key (patch_filter_list_of_yojson) "PatchFilters" _list path;
    
  }
  in _res

let patch_compliance_level_of_yojson = 
  fun (tree: t) path : patch_compliance_level -> match tree with 
    | `String "UNSPECIFIED" -> Unspecified
    | `String "INFORMATIONAL" -> Informational
    | `String "LOW" -> Low
    | `String "MEDIUM" -> Medium
    | `String "HIGH" -> High
    | `String "CRITICAL" -> Critical
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchComplianceLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchComplianceLevel")

let approve_after_days_of_yojson = int_of_yojson

let patch_string_date_time_of_yojson = string_of_yojson

let boolean__of_yojson = bool_of_yojson

let patch_rule_of_yojson = 
  fun tree path : patch_rule ->
  let _list = assoc_of_yojson tree path in
  let _res : patch_rule = {
    enable_non_security = option_of_yojson (value_for_key (boolean__of_yojson) "EnableNonSecurity") _list path;
    approve_until_date = option_of_yojson (value_for_key (patch_string_date_time_of_yojson) "ApproveUntilDate") _list path;
    approve_after_days = option_of_yojson (value_for_key (approve_after_days_of_yojson) "ApproveAfterDays") _list path;
    compliance_level = option_of_yojson (value_for_key (patch_compliance_level_of_yojson) "ComplianceLevel") _list path;
    patch_filter_group = value_for_key (patch_filter_group_of_yojson) "PatchFilterGroup" _list path;
    
  }
  in _res

let patch_rule_list_of_yojson = 
  fun tree path -> list_of_yojson patch_rule_of_yojson tree path 

let patch_rule_group_of_yojson = 
  fun tree path : patch_rule_group ->
  let _list = assoc_of_yojson tree path in
  let _res : patch_rule_group = {
    patch_rules = value_for_key (patch_rule_list_of_yojson) "PatchRules" _list path;
    
  }
  in _res

let patch_id_of_yojson = string_of_yojson

let patch_id_list_of_yojson = 
  fun tree path -> list_of_yojson patch_id_of_yojson tree path 

let patch_action_of_yojson = 
  fun (tree: t) path : patch_action -> match tree with 
    | `String "BLOCK" -> Block
    | `String "ALLOW_AS_DEPENDENCY" -> AllowAsDependency
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchAction" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchAction")

let date_time_of_yojson = timestamp_of_yojson

let baseline_description_of_yojson = string_of_yojson

let patch_source_name_of_yojson = string_of_yojson

let patch_source_product_of_yojson = string_of_yojson

let patch_source_product_list_of_yojson = 
  fun tree path -> list_of_yojson patch_source_product_of_yojson tree path 

let patch_source_configuration_of_yojson = string_of_yojson

let patch_source_of_yojson = 
  fun tree path : patch_source ->
  let _list = assoc_of_yojson tree path in
  let _res : patch_source = {
    configuration = value_for_key (patch_source_configuration_of_yojson) "Configuration" _list path;
    products = value_for_key (patch_source_product_list_of_yojson) "Products" _list path;
    name = value_for_key (patch_source_name_of_yojson) "Name" _list path;
    
  }
  in _res

let patch_source_list_of_yojson = 
  fun tree path -> list_of_yojson patch_source_of_yojson tree path 

let update_patch_baseline_result_of_yojson = 
  fun tree path : update_patch_baseline_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_patch_baseline_result = {
    sources = option_of_yojson (value_for_key (patch_source_list_of_yojson) "Sources") _list path;
    description = option_of_yojson (value_for_key (baseline_description_of_yojson) "Description") _list path;
    modified_date = option_of_yojson (value_for_key (date_time_of_yojson) "ModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedDate") _list path;
    rejected_patches_action = option_of_yojson (value_for_key (patch_action_of_yojson) "RejectedPatchesAction") _list path;
    rejected_patches = option_of_yojson (value_for_key (patch_id_list_of_yojson) "RejectedPatches") _list path;
    approved_patches_enable_non_security = option_of_yojson (value_for_key (boolean__of_yojson) "ApprovedPatchesEnableNonSecurity") _list path;
    approved_patches_compliance_level = option_of_yojson (value_for_key (patch_compliance_level_of_yojson) "ApprovedPatchesComplianceLevel") _list path;
    approved_patches = option_of_yojson (value_for_key (patch_id_list_of_yojson) "ApprovedPatches") _list path;
    approval_rules = option_of_yojson (value_for_key (patch_rule_group_of_yojson) "ApprovalRules") _list path;
    global_filters = option_of_yojson (value_for_key (patch_filter_group_of_yojson) "GlobalFilters") _list path;
    operating_system = option_of_yojson (value_for_key (operating_system_of_yojson) "OperatingSystem") _list path;
    name = option_of_yojson (value_for_key (baseline_name_of_yojson) "Name") _list path;
    baseline_id = option_of_yojson (value_for_key (baseline_id_of_yojson) "BaselineId") _list path;
    
  }
  in _res

let update_patch_baseline_request_of_yojson = 
  fun tree path : update_patch_baseline_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_patch_baseline_request = {
    replace = option_of_yojson (value_for_key (boolean__of_yojson) "Replace") _list path;
    sources = option_of_yojson (value_for_key (patch_source_list_of_yojson) "Sources") _list path;
    description = option_of_yojson (value_for_key (baseline_description_of_yojson) "Description") _list path;
    rejected_patches_action = option_of_yojson (value_for_key (patch_action_of_yojson) "RejectedPatchesAction") _list path;
    rejected_patches = option_of_yojson (value_for_key (patch_id_list_of_yojson) "RejectedPatches") _list path;
    approved_patches_enable_non_security = option_of_yojson (value_for_key (boolean__of_yojson) "ApprovedPatchesEnableNonSecurity") _list path;
    approved_patches_compliance_level = option_of_yojson (value_for_key (patch_compliance_level_of_yojson) "ApprovedPatchesComplianceLevel") _list path;
    approved_patches = option_of_yojson (value_for_key (patch_id_list_of_yojson) "ApprovedPatches") _list path;
    approval_rules = option_of_yojson (value_for_key (patch_rule_group_of_yojson) "ApprovalRules") _list path;
    global_filters = option_of_yojson (value_for_key (patch_filter_group_of_yojson) "GlobalFilters") _list path;
    name = option_of_yojson (value_for_key (baseline_name_of_yojson) "Name") _list path;
    baseline_id = value_for_key (baseline_id_of_yojson) "BaselineId" _list path;
    
  }
  in _res

let does_not_exist_exception_of_yojson = 
  fun tree path : does_not_exist_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : does_not_exist_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let ops_metadata_arn_of_yojson = string_of_yojson

let update_ops_metadata_result_of_yojson = 
  fun tree path : update_ops_metadata_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_ops_metadata_result = {
    ops_metadata_arn = option_of_yojson (value_for_key (ops_metadata_arn_of_yojson) "OpsMetadataArn") _list path;
    
  }
  in _res

let metadata_value_string_of_yojson = string_of_yojson

let metadata_value_of_yojson = 
  fun tree path : metadata_value ->
  let _list = assoc_of_yojson tree path in
  let _res : metadata_value = {
    value = option_of_yojson (value_for_key (metadata_value_string_of_yojson) "Value") _list path;
    
  }
  in _res

let metadata_key_of_yojson = string_of_yojson

let metadata_map_of_yojson = 
  fun tree path -> map_of_yojson metadata_value_of_yojson tree path

let metadata_keys_to_delete_list_of_yojson = 
  fun tree path -> list_of_yojson metadata_key_of_yojson tree path 

let update_ops_metadata_request_of_yojson = 
  fun tree path : update_ops_metadata_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_ops_metadata_request = {
    keys_to_delete = option_of_yojson (value_for_key (metadata_keys_to_delete_list_of_yojson) "KeysToDelete") _list path;
    metadata_to_update = option_of_yojson (value_for_key (metadata_map_of_yojson) "MetadataToUpdate") _list path;
    ops_metadata_arn = value_for_key (ops_metadata_arn_of_yojson) "OpsMetadataArn" _list path;
    
  }
  in _res

let ops_metadata_too_many_updates_exception_of_yojson = 
  fun tree path : ops_metadata_too_many_updates_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_metadata_too_many_updates_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let ops_metadata_not_found_exception_of_yojson = 
  fun tree path : ops_metadata_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_metadata_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let ops_metadata_key_limit_exceeded_exception_of_yojson = 
  fun tree path : ops_metadata_key_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_metadata_key_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let ops_metadata_invalid_argument_exception_of_yojson = 
  fun tree path : ops_metadata_invalid_argument_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_metadata_invalid_argument_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let update_ops_item_response_of_yojson = 
  fun tree path : update_ops_item_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_ops_item_response = ()
  in _res

let ops_item_description_of_yojson = string_of_yojson

let ops_item_data_value_string_of_yojson = string_of_yojson

let ops_item_data_type_of_yojson = 
  fun (tree: t) path : ops_item_data_type -> match tree with 
    | `String "String" -> STRING
    | `String "SearchableString" -> SEARCHABLE_STRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemDataType")

let ops_item_data_value_of_yojson = 
  fun tree path : ops_item_data_value ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_data_value = {
    type_ = option_of_yojson (value_for_key (ops_item_data_type_of_yojson) "Type") _list path;
    value = option_of_yojson (value_for_key (ops_item_data_value_string_of_yojson) "Value") _list path;
    
  }
  in _res

let ops_item_data_key_of_yojson = string_of_yojson

let ops_item_operational_data_of_yojson = 
  fun tree path -> map_of_yojson ops_item_data_value_of_yojson tree path

let ops_item_ops_data_keys_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let ops_item_notification_of_yojson = 
  fun tree path : ops_item_notification ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_notification = {
    arn = option_of_yojson (value_for_key (string__of_yojson) "Arn") _list path;
    
  }
  in _res

let ops_item_notifications_of_yojson = 
  fun tree path -> list_of_yojson ops_item_notification_of_yojson tree path 

let ops_item_priority_of_yojson = int_of_yojson

let related_ops_item_of_yojson = 
  fun tree path : related_ops_item ->
  let _list = assoc_of_yojson tree path in
  let _res : related_ops_item = {
    ops_item_id = value_for_key (string__of_yojson) "OpsItemId" _list path;
    
  }
  in _res

let related_ops_items_of_yojson = 
  fun tree path -> list_of_yojson related_ops_item_of_yojson tree path 

let ops_item_status_of_yojson = 
  fun (tree: t) path : ops_item_status -> match tree with 
    | `String "Closed" -> CLOSED
    | `String "Rejected" -> REJECTED
    | `String "Approved" -> APPROVED
    | `String "PendingApproval" -> PENDING_APPROVAL
    | `String "ChangeCalendarOverrideRejected" -> CHANGE_CALENDAR_OVERRIDE_REJECTED
    | `String "ChangeCalendarOverrideApproved" -> CHANGE_CALENDAR_OVERRIDE_APPROVED
    | `String "PendingChangeCalendarOverride" -> PENDING_CHANGE_CALENDAR_OVERRIDE
    | `String "RunbookInProgress" -> RUNBOOK_IN_PROGRESS
    | `String "Scheduled" -> SCHEDULED
    | `String "CompletedWithFailure" -> COMPLETED_WITH_FAILURE
    | `String "CompletedWithSuccess" -> COMPLETED_WITH_SUCCESS
    | `String "Failed" -> FAILED
    | `String "Cancelled" -> CANCELLED
    | `String "Cancelling" -> CANCELLING
    | `String "TimedOut" -> TIMED_OUT
    | `String "Pending" -> PENDING
    | `String "Resolved" -> RESOLVED
    | `String "InProgress" -> IN_PROGRESS
    | `String "Open" -> OPEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemStatus")

let ops_item_id_of_yojson = string_of_yojson

let ops_item_title_of_yojson = string_of_yojson

let ops_item_category_of_yojson = string_of_yojson

let ops_item_severity_of_yojson = string_of_yojson

let ops_item_arn_of_yojson = string_of_yojson

let update_ops_item_request_of_yojson = 
  fun tree path : update_ops_item_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_ops_item_request = {
    ops_item_arn = option_of_yojson (value_for_key (ops_item_arn_of_yojson) "OpsItemArn") _list path;
    planned_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "PlannedEndTime") _list path;
    planned_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "PlannedStartTime") _list path;
    actual_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "ActualEndTime") _list path;
    actual_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "ActualStartTime") _list path;
    severity = option_of_yojson (value_for_key (ops_item_severity_of_yojson) "Severity") _list path;
    category = option_of_yojson (value_for_key (ops_item_category_of_yojson) "Category") _list path;
    title = option_of_yojson (value_for_key (ops_item_title_of_yojson) "Title") _list path;
    ops_item_id = value_for_key (ops_item_id_of_yojson) "OpsItemId" _list path;
    status = option_of_yojson (value_for_key (ops_item_status_of_yojson) "Status") _list path;
    related_ops_items = option_of_yojson (value_for_key (related_ops_items_of_yojson) "RelatedOpsItems") _list path;
    priority = option_of_yojson (value_for_key (ops_item_priority_of_yojson) "Priority") _list path;
    notifications = option_of_yojson (value_for_key (ops_item_notifications_of_yojson) "Notifications") _list path;
    operational_data_to_delete = option_of_yojson (value_for_key (ops_item_ops_data_keys_list_of_yojson) "OperationalDataToDelete") _list path;
    operational_data = option_of_yojson (value_for_key (ops_item_operational_data_of_yojson) "OperationalData") _list path;
    description = option_of_yojson (value_for_key (ops_item_description_of_yojson) "Description") _list path;
    
  }
  in _res

let ops_item_not_found_exception_of_yojson = 
  fun tree path : ops_item_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let ops_item_parameter_names_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let integer__of_yojson = int_of_yojson

let ops_item_limit_exceeded_exception_of_yojson = 
  fun tree path : ops_item_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    limit_type = option_of_yojson (value_for_key (string__of_yojson) "LimitType") _list path;
    limit = option_of_yojson (value_for_key (integer__of_yojson) "Limit") _list path;
    resource_types = option_of_yojson (value_for_key (ops_item_parameter_names_list_of_yojson) "ResourceTypes") _list path;
    
  }
  in _res

let ops_item_invalid_parameter_exception_of_yojson = 
  fun tree path : ops_item_invalid_parameter_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_invalid_parameter_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    parameter_names = option_of_yojson (value_for_key (ops_item_parameter_names_list_of_yojson) "ParameterNames") _list path;
    
  }
  in _res

let ops_item_conflict_exception_of_yojson = 
  fun tree path : ops_item_conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_conflict_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let ops_item_already_exists_exception_of_yojson = 
  fun tree path : ops_item_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_already_exists_exception = {
    ops_item_id = option_of_yojson (value_for_key (string__of_yojson) "OpsItemId") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let ops_item_access_denied_exception_of_yojson = 
  fun tree path : ops_item_access_denied_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_access_denied_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let update_managed_instance_role_result_of_yojson = 
  fun tree path : update_managed_instance_role_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_managed_instance_role_result = ()
  in _res

let managed_instance_id_of_yojson = string_of_yojson

let iam_role_of_yojson = string_of_yojson

let update_managed_instance_role_request_of_yojson = 
  fun tree path : update_managed_instance_role_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_managed_instance_role_request = {
    iam_role = value_for_key (iam_role_of_yojson) "IamRole" _list path;
    instance_id = value_for_key (managed_instance_id_of_yojson) "InstanceId" _list path;
    
  }
  in _res

let invalid_instance_id_of_yojson = 
  fun tree path : invalid_instance_id ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_instance_id = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let maintenance_window_id_of_yojson = string_of_yojson

let maintenance_window_task_id_of_yojson = string_of_yojson

let target_key_of_yojson = string_of_yojson

let target_value_of_yojson = string_of_yojson

let target_values_of_yojson = 
  fun tree path -> list_of_yojson target_value_of_yojson tree path 

let target_of_yojson = 
  fun tree path : target ->
  let _list = assoc_of_yojson tree path in
  let _res : target = {
    values = option_of_yojson (value_for_key (target_values_of_yojson) "Values") _list path;
    key = option_of_yojson (value_for_key (target_key_of_yojson) "Key") _list path;
    
  }
  in _res

let targets_of_yojson = 
  fun tree path -> list_of_yojson target_of_yojson tree path 

let maintenance_window_task_arn_of_yojson = string_of_yojson

let service_role_of_yojson = string_of_yojson

let maintenance_window_task_parameter_value_of_yojson = string_of_yojson

let maintenance_window_task_parameter_value_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_task_parameter_value_of_yojson tree path 

let maintenance_window_task_parameter_value_expression_of_yojson = 
  fun tree path : maintenance_window_task_parameter_value_expression ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_task_parameter_value_expression = {
    values = option_of_yojson (value_for_key (maintenance_window_task_parameter_value_list_of_yojson) "Values") _list path;
    
  }
  in _res

let maintenance_window_task_parameter_name_of_yojson = string_of_yojson

let maintenance_window_task_parameters_of_yojson = 
  fun tree path -> map_of_yojson maintenance_window_task_parameter_value_expression_of_yojson tree path

let comment_of_yojson = string_of_yojson

let cloud_watch_log_group_name_of_yojson = string_of_yojson

let cloud_watch_output_enabled_of_yojson = bool_of_yojson

let cloud_watch_output_config_of_yojson = 
  fun tree path : cloud_watch_output_config ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_watch_output_config = {
    cloud_watch_output_enabled = option_of_yojson (value_for_key (cloud_watch_output_enabled_of_yojson) "CloudWatchOutputEnabled") _list path;
    cloud_watch_log_group_name = option_of_yojson (value_for_key (cloud_watch_log_group_name_of_yojson) "CloudWatchLogGroupName") _list path;
    
  }
  in _res

let document_hash_of_yojson = string_of_yojson

let document_hash_type_of_yojson = 
  fun (tree: t) path : document_hash_type -> match tree with 
    | `String "Sha1" -> SHA1
    | `String "Sha256" -> SHA256
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentHashType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentHashType")

let document_version_of_yojson = string_of_yojson

let notification_arn_of_yojson = string_of_yojson

let notification_event_of_yojson = 
  fun (tree: t) path : notification_event -> match tree with 
    | `String "Failed" -> FAILED
    | `String "Cancelled" -> CANCELLED
    | `String "TimedOut" -> TIMED_OUT
    | `String "Success" -> SUCCESS
    | `String "InProgress" -> IN_PROGRESS
    | `String "All" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "NotificationEvent" value)
    | _ -> raise (deserialize_wrong_type_error path "NotificationEvent")

let notification_event_list_of_yojson = 
  fun tree path -> list_of_yojson notification_event_of_yojson tree path 

let notification_type_of_yojson = 
  fun (tree: t) path : notification_type -> match tree with 
    | `String "Invocation" -> Invocation
    | `String "Command" -> Command
    | `String value -> raise (deserialize_unknown_enum_value_error path "NotificationType" value)
    | _ -> raise (deserialize_wrong_type_error path "NotificationType")

let notification_config_of_yojson = 
  fun tree path : notification_config ->
  let _list = assoc_of_yojson tree path in
  let _res : notification_config = {
    notification_type = option_of_yojson (value_for_key (notification_type_of_yojson) "NotificationType") _list path;
    notification_events = option_of_yojson (value_for_key (notification_event_list_of_yojson) "NotificationEvents") _list path;
    notification_arn = option_of_yojson (value_for_key (notification_arn_of_yojson) "NotificationArn") _list path;
    
  }
  in _res

let s3_bucket_name_of_yojson = string_of_yojson

let s3_key_prefix_of_yojson = string_of_yojson

let parameter_value_of_yojson = string_of_yojson

let parameter_value_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_value_of_yojson tree path 

let parameter_name_of_yojson = string_of_yojson

let parameters_of_yojson = 
  fun tree path -> map_of_yojson parameter_value_list_of_yojson tree path

let timeout_seconds_of_yojson = int_of_yojson

let maintenance_window_run_command_parameters_of_yojson = 
  fun tree path : maintenance_window_run_command_parameters ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_run_command_parameters = {
    timeout_seconds = option_of_yojson (value_for_key (timeout_seconds_of_yojson) "TimeoutSeconds") _list path;
    service_role_arn = option_of_yojson (value_for_key (service_role_of_yojson) "ServiceRoleArn") _list path;
    parameters = option_of_yojson (value_for_key (parameters_of_yojson) "Parameters") _list path;
    output_s3_key_prefix = option_of_yojson (value_for_key (s3_key_prefix_of_yojson) "OutputS3KeyPrefix") _list path;
    output_s3_bucket_name = option_of_yojson (value_for_key (s3_bucket_name_of_yojson) "OutputS3BucketName") _list path;
    notification_config = option_of_yojson (value_for_key (notification_config_of_yojson) "NotificationConfig") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    document_hash_type = option_of_yojson (value_for_key (document_hash_type_of_yojson) "DocumentHashType") _list path;
    document_hash = option_of_yojson (value_for_key (document_hash_of_yojson) "DocumentHash") _list path;
    cloud_watch_output_config = option_of_yojson (value_for_key (cloud_watch_output_config_of_yojson) "CloudWatchOutputConfig") _list path;
    comment = option_of_yojson (value_for_key (comment_of_yojson) "Comment") _list path;
    
  }
  in _res

let automation_parameter_value_of_yojson = string_of_yojson

let automation_parameter_value_list_of_yojson = 
  fun tree path -> list_of_yojson automation_parameter_value_of_yojson tree path 

let automation_parameter_key_of_yojson = string_of_yojson

let automation_parameter_map_of_yojson = 
  fun tree path -> map_of_yojson automation_parameter_value_list_of_yojson tree path

let maintenance_window_automation_parameters_of_yojson = 
  fun tree path : maintenance_window_automation_parameters ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_automation_parameters = {
    parameters = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Parameters") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    
  }
  in _res

let maintenance_window_step_functions_input_of_yojson = string_of_yojson

let maintenance_window_step_functions_name_of_yojson = string_of_yojson

let maintenance_window_step_functions_parameters_of_yojson = 
  fun tree path : maintenance_window_step_functions_parameters ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_step_functions_parameters = {
    name = option_of_yojson (value_for_key (maintenance_window_step_functions_name_of_yojson) "Name") _list path;
    input = option_of_yojson (value_for_key (maintenance_window_step_functions_input_of_yojson) "Input") _list path;
    
  }
  in _res

let maintenance_window_lambda_client_context_of_yojson = string_of_yojson

let maintenance_window_lambda_qualifier_of_yojson = string_of_yojson

let maintenance_window_lambda_payload_of_yojson = blob_of_yojson

let maintenance_window_lambda_parameters_of_yojson = 
  fun tree path : maintenance_window_lambda_parameters ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_lambda_parameters = {
    payload = option_of_yojson (value_for_key (maintenance_window_lambda_payload_of_yojson) "Payload") _list path;
    qualifier = option_of_yojson (value_for_key (maintenance_window_lambda_qualifier_of_yojson) "Qualifier") _list path;
    client_context = option_of_yojson (value_for_key (maintenance_window_lambda_client_context_of_yojson) "ClientContext") _list path;
    
  }
  in _res

let maintenance_window_task_invocation_parameters_of_yojson = 
  fun tree path : maintenance_window_task_invocation_parameters ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_task_invocation_parameters = {
    lambda = option_of_yojson (value_for_key (maintenance_window_lambda_parameters_of_yojson) "Lambda") _list path;
    step_functions = option_of_yojson (value_for_key (maintenance_window_step_functions_parameters_of_yojson) "StepFunctions") _list path;
    automation = option_of_yojson (value_for_key (maintenance_window_automation_parameters_of_yojson) "Automation") _list path;
    run_command = option_of_yojson (value_for_key (maintenance_window_run_command_parameters_of_yojson) "RunCommand") _list path;
    
  }
  in _res

let maintenance_window_task_priority_of_yojson = int_of_yojson

let max_concurrency_of_yojson = string_of_yojson

let max_errors_of_yojson = string_of_yojson

let s3_region_of_yojson = string_of_yojson

let logging_info_of_yojson = 
  fun tree path : logging_info ->
  let _list = assoc_of_yojson tree path in
  let _res : logging_info = {
    s3_region = value_for_key (s3_region_of_yojson) "S3Region" _list path;
    s3_key_prefix = option_of_yojson (value_for_key (s3_key_prefix_of_yojson) "S3KeyPrefix") _list path;
    s3_bucket_name = value_for_key (s3_bucket_name_of_yojson) "S3BucketName" _list path;
    
  }
  in _res

let maintenance_window_name_of_yojson = string_of_yojson

let maintenance_window_description_of_yojson = string_of_yojson

let maintenance_window_task_cutoff_behavior_of_yojson = 
  fun (tree: t) path : maintenance_window_task_cutoff_behavior -> match tree with 
    | `String "CANCEL_TASK" -> CancelTask
    | `String "CONTINUE_TASK" -> ContinueTask
    | `String value -> raise (deserialize_unknown_enum_value_error path "MaintenanceWindowTaskCutoffBehavior" value)
    | _ -> raise (deserialize_wrong_type_error path "MaintenanceWindowTaskCutoffBehavior")

let alarm_name_of_yojson = string_of_yojson

let alarm_of_yojson = 
  fun tree path : alarm ->
  let _list = assoc_of_yojson tree path in
  let _res : alarm = {
    name = value_for_key (alarm_name_of_yojson) "Name" _list path;
    
  }
  in _res

let alarm_list_of_yojson = 
  fun tree path -> list_of_yojson alarm_of_yojson tree path 

let alarm_configuration_of_yojson = 
  fun tree path : alarm_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : alarm_configuration = {
    alarms = value_for_key (alarm_list_of_yojson) "Alarms" _list path;
    ignore_poll_alarm_failure = option_of_yojson (value_for_key (boolean__of_yojson) "IgnorePollAlarmFailure") _list path;
    
  }
  in _res

let update_maintenance_window_task_result_of_yojson = 
  fun tree path : update_maintenance_window_task_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_maintenance_window_task_result = {
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    cutoff_behavior = option_of_yojson (value_for_key (maintenance_window_task_cutoff_behavior_of_yojson) "CutoffBehavior") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    logging_info = option_of_yojson (value_for_key (logging_info_of_yojson) "LoggingInfo") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    priority = option_of_yojson (value_for_key (maintenance_window_task_priority_of_yojson) "Priority") _list path;
    task_invocation_parameters = option_of_yojson (value_for_key (maintenance_window_task_invocation_parameters_of_yojson) "TaskInvocationParameters") _list path;
    task_parameters = option_of_yojson (value_for_key (maintenance_window_task_parameters_of_yojson) "TaskParameters") _list path;
    service_role_arn = option_of_yojson (value_for_key (service_role_of_yojson) "ServiceRoleArn") _list path;
    task_arn = option_of_yojson (value_for_key (maintenance_window_task_arn_of_yojson) "TaskArn") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    window_task_id = option_of_yojson (value_for_key (maintenance_window_task_id_of_yojson) "WindowTaskId") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let update_maintenance_window_task_request_of_yojson = 
  fun tree path : update_maintenance_window_task_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_maintenance_window_task_request = {
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    cutoff_behavior = option_of_yojson (value_for_key (maintenance_window_task_cutoff_behavior_of_yojson) "CutoffBehavior") _list path;
    replace = option_of_yojson (value_for_key (boolean__of_yojson) "Replace") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    logging_info = option_of_yojson (value_for_key (logging_info_of_yojson) "LoggingInfo") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    priority = option_of_yojson (value_for_key (maintenance_window_task_priority_of_yojson) "Priority") _list path;
    task_invocation_parameters = option_of_yojson (value_for_key (maintenance_window_task_invocation_parameters_of_yojson) "TaskInvocationParameters") _list path;
    task_parameters = option_of_yojson (value_for_key (maintenance_window_task_parameters_of_yojson) "TaskParameters") _list path;
    service_role_arn = option_of_yojson (value_for_key (service_role_of_yojson) "ServiceRoleArn") _list path;
    task_arn = option_of_yojson (value_for_key (maintenance_window_task_arn_of_yojson) "TaskArn") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    window_task_id = value_for_key (maintenance_window_task_id_of_yojson) "WindowTaskId" _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let maintenance_window_target_id_of_yojson = string_of_yojson

let owner_information_of_yojson = string_of_yojson

let update_maintenance_window_target_result_of_yojson = 
  fun tree path : update_maintenance_window_target_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_maintenance_window_target_result = {
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    owner_information = option_of_yojson (value_for_key (owner_information_of_yojson) "OwnerInformation") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    window_target_id = option_of_yojson (value_for_key (maintenance_window_target_id_of_yojson) "WindowTargetId") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let update_maintenance_window_target_request_of_yojson = 
  fun tree path : update_maintenance_window_target_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_maintenance_window_target_request = {
    replace = option_of_yojson (value_for_key (boolean__of_yojson) "Replace") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    owner_information = option_of_yojson (value_for_key (owner_information_of_yojson) "OwnerInformation") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    window_target_id = value_for_key (maintenance_window_target_id_of_yojson) "WindowTargetId" _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let maintenance_window_string_date_time_of_yojson = string_of_yojson

let maintenance_window_schedule_of_yojson = string_of_yojson

let maintenance_window_timezone_of_yojson = string_of_yojson

let maintenance_window_offset_of_yojson = int_of_yojson

let maintenance_window_duration_hours_of_yojson = int_of_yojson

let maintenance_window_cutoff_of_yojson = int_of_yojson

let maintenance_window_allow_unassociated_targets_of_yojson = 
  bool_of_yojson

let maintenance_window_enabled_of_yojson = bool_of_yojson

let update_maintenance_window_result_of_yojson = 
  fun tree path : update_maintenance_window_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_maintenance_window_result = {
    enabled = option_of_yojson (value_for_key (maintenance_window_enabled_of_yojson) "Enabled") _list path;
    allow_unassociated_targets = option_of_yojson (value_for_key (maintenance_window_allow_unassociated_targets_of_yojson) "AllowUnassociatedTargets") _list path;
    cutoff = option_of_yojson (value_for_key (maintenance_window_cutoff_of_yojson) "Cutoff") _list path;
    duration = option_of_yojson (value_for_key (maintenance_window_duration_hours_of_yojson) "Duration") _list path;
    schedule_offset = option_of_yojson (value_for_key (maintenance_window_offset_of_yojson) "ScheduleOffset") _list path;
    schedule_timezone = option_of_yojson (value_for_key (maintenance_window_timezone_of_yojson) "ScheduleTimezone") _list path;
    schedule = option_of_yojson (value_for_key (maintenance_window_schedule_of_yojson) "Schedule") _list path;
    end_date = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "EndDate") _list path;
    start_date = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "StartDate") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let update_maintenance_window_request_of_yojson = 
  fun tree path : update_maintenance_window_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_maintenance_window_request = {
    replace = option_of_yojson (value_for_key (boolean__of_yojson) "Replace") _list path;
    enabled = option_of_yojson (value_for_key (maintenance_window_enabled_of_yojson) "Enabled") _list path;
    allow_unassociated_targets = option_of_yojson (value_for_key (maintenance_window_allow_unassociated_targets_of_yojson) "AllowUnassociatedTargets") _list path;
    cutoff = option_of_yojson (value_for_key (maintenance_window_cutoff_of_yojson) "Cutoff") _list path;
    duration = option_of_yojson (value_for_key (maintenance_window_duration_hours_of_yojson) "Duration") _list path;
    schedule_offset = option_of_yojson (value_for_key (maintenance_window_offset_of_yojson) "ScheduleOffset") _list path;
    schedule_timezone = option_of_yojson (value_for_key (maintenance_window_timezone_of_yojson) "ScheduleTimezone") _list path;
    schedule = option_of_yojson (value_for_key (maintenance_window_schedule_of_yojson) "Schedule") _list path;
    end_date = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "EndDate") _list path;
    start_date = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "StartDate") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let document_sha1_of_yojson = string_of_yojson

let document_ar_n_of_yojson = string_of_yojson

let document_display_name_of_yojson = string_of_yojson

let document_version_name_of_yojson = string_of_yojson

let document_owner_of_yojson = string_of_yojson

let document_status_of_yojson = 
  fun (tree: t) path : document_status -> match tree with 
    | `String "Failed" -> Failed
    | `String "Deleting" -> Deleting
    | `String "Updating" -> Updating
    | `String "Active" -> Active
    | `String "Creating" -> Creating
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentStatus")

let document_status_information_of_yojson = string_of_yojson

let description_in_document_of_yojson = string_of_yojson

let document_parameter_name_of_yojson = string_of_yojson

let document_parameter_type_of_yojson = 
  fun (tree: t) path : document_parameter_type -> match tree with 
    | `String "StringList" -> StringList
    | `String "String" -> String
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentParameterType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentParameterType")

let document_parameter_descrption_of_yojson = string_of_yojson

let document_parameter_default_value_of_yojson = string_of_yojson

let document_parameter_of_yojson = 
  fun tree path : document_parameter ->
  let _list = assoc_of_yojson tree path in
  let _res : document_parameter = {
    default_value = option_of_yojson (value_for_key (document_parameter_default_value_of_yojson) "DefaultValue") _list path;
    description = option_of_yojson (value_for_key (document_parameter_descrption_of_yojson) "Description") _list path;
    type_ = option_of_yojson (value_for_key (document_parameter_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (document_parameter_name_of_yojson) "Name") _list path;
    
  }
  in _res

let document_parameter_list_of_yojson = 
  fun tree path -> list_of_yojson document_parameter_of_yojson tree path 

let platform_type_of_yojson = 
  fun (tree: t) path : platform_type -> match tree with 
    | `String "MacOS" -> MACOS
    | `String "Linux" -> LINUX
    | `String "Windows" -> WINDOWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlatformType" value)
    | _ -> raise (deserialize_wrong_type_error path "PlatformType")

let platform_type_list_of_yojson = 
  fun tree path -> list_of_yojson platform_type_of_yojson tree path 

let document_type_of_yojson = 
  fun (tree: t) path : document_type -> match tree with 
    | `String "QuickSetup" -> QuickSetup
    | `String "ConformancePackTemplate" -> ConformancePackTemplate
    | `String "CloudFormation" -> CloudFormation
    | `String "ProblemAnalysisTemplate" -> ProblemAnalysisTemplate
    | `String "ProblemAnalysis" -> ProblemAnalysis
    | `String "Automation.ChangeTemplate" -> ChangeTemplate
    | `String "ChangeCalendar" -> ChangeCalendar
    | `String "DeploymentStrategy" -> DeploymentStrategy
    | `String "ApplicationConfigurationSchema" -> ApplicationConfigurationSchema
    | `String "ApplicationConfiguration" -> ApplicationConfiguration
    | `String "Package" -> Package
    | `String "Session" -> Session
    | `String "Automation" -> Automation
    | `String "Policy" -> Policy
    | `String "Command" -> Command
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentType")

let document_schema_version_of_yojson = string_of_yojson

let document_format_of_yojson = 
  fun (tree: t) path : document_format -> match tree with 
    | `String "TEXT" -> TEXT
    | `String "JSON" -> JSON
    | `String "YAML" -> YAML
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentFormat")

let target_type_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = value_for_key (tag_value_of_yojson) "Value" _list path;
    key = value_for_key (tag_key_of_yojson) "Key" _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let attachment_name_of_yojson = string_of_yojson

let attachment_information_of_yojson = 
  fun tree path : attachment_information ->
  let _list = assoc_of_yojson tree path in
  let _res : attachment_information = {
    name = option_of_yojson (value_for_key (attachment_name_of_yojson) "Name") _list path;
    
  }
  in _res

let attachment_information_list_of_yojson = 
  fun tree path -> list_of_yojson attachment_information_of_yojson tree path 

let require_type_of_yojson = string_of_yojson

let document_requires_of_yojson = 
  fun tree path : document_requires ->
  let _list = assoc_of_yojson tree path in
  let _res : document_requires = {
    version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "VersionName") _list path;
    require_type = option_of_yojson (value_for_key (require_type_of_yojson) "RequireType") _list path;
    version = option_of_yojson (value_for_key (document_version_of_yojson) "Version") _list path;
    name = value_for_key (document_ar_n_of_yojson) "Name" _list path;
    
  }
  in _res

let document_requires_list_of_yojson = 
  fun tree path -> list_of_yojson document_requires_of_yojson tree path 

let document_author_of_yojson = string_of_yojson

let review_status_of_yojson = 
  fun (tree: t) path : review_status -> match tree with 
    | `String "REJECTED" -> REJECTED
    | `String "PENDING" -> PENDING
    | `String "NOT_REVIEWED" -> NOT_REVIEWED
    | `String "APPROVED" -> APPROVED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReviewStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReviewStatus")

let reviewer_of_yojson = string_of_yojson

let review_information_of_yojson = 
  fun tree path : review_information ->
  let _list = assoc_of_yojson tree path in
  let _res : review_information = {
    reviewer = option_of_yojson (value_for_key (reviewer_of_yojson) "Reviewer") _list path;
    status = option_of_yojson (value_for_key (review_status_of_yojson) "Status") _list path;
    reviewed_time = option_of_yojson (value_for_key (date_time_of_yojson) "ReviewedTime") _list path;
    
  }
  in _res

let review_information_list_of_yojson = 
  fun tree path -> list_of_yojson review_information_of_yojson tree path 

let category_of_yojson = string_of_yojson

let category_list_of_yojson = 
  fun tree path -> list_of_yojson category_of_yojson tree path 

let category_enum_list_of_yojson = 
  fun tree path -> list_of_yojson category_of_yojson tree path 

let document_description_of_yojson = 
  fun tree path : document_description ->
  let _list = assoc_of_yojson tree path in
  let _res : document_description = {
    category_enum = option_of_yojson (value_for_key (category_enum_list_of_yojson) "CategoryEnum") _list path;
    category = option_of_yojson (value_for_key (category_list_of_yojson) "Category") _list path;
    review_status = option_of_yojson (value_for_key (review_status_of_yojson) "ReviewStatus") _list path;
    pending_review_version = option_of_yojson (value_for_key (document_version_of_yojson) "PendingReviewVersion") _list path;
    approved_version = option_of_yojson (value_for_key (document_version_of_yojson) "ApprovedVersion") _list path;
    review_information = option_of_yojson (value_for_key (review_information_list_of_yojson) "ReviewInformation") _list path;
    author = option_of_yojson (value_for_key (document_author_of_yojson) "Author") _list path;
    requires = option_of_yojson (value_for_key (document_requires_list_of_yojson) "Requires") _list path;
    attachments_information = option_of_yojson (value_for_key (attachment_information_list_of_yojson) "AttachmentsInformation") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    target_type = option_of_yojson (value_for_key (target_type_of_yojson) "TargetType") _list path;
    document_format = option_of_yojson (value_for_key (document_format_of_yojson) "DocumentFormat") _list path;
    default_version = option_of_yojson (value_for_key (document_version_of_yojson) "DefaultVersion") _list path;
    latest_version = option_of_yojson (value_for_key (document_version_of_yojson) "LatestVersion") _list path;
    schema_version = option_of_yojson (value_for_key (document_schema_version_of_yojson) "SchemaVersion") _list path;
    document_type = option_of_yojson (value_for_key (document_type_of_yojson) "DocumentType") _list path;
    platform_types = option_of_yojson (value_for_key (platform_type_list_of_yojson) "PlatformTypes") _list path;
    parameters = option_of_yojson (value_for_key (document_parameter_list_of_yojson) "Parameters") _list path;
    description = option_of_yojson (value_for_key (description_in_document_of_yojson) "Description") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    status_information = option_of_yojson (value_for_key (document_status_information_of_yojson) "StatusInformation") _list path;
    status = option_of_yojson (value_for_key (document_status_of_yojson) "Status") _list path;
    created_date = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedDate") _list path;
    owner = option_of_yojson (value_for_key (document_owner_of_yojson) "Owner") _list path;
    version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "VersionName") _list path;
    display_name = option_of_yojson (value_for_key (document_display_name_of_yojson) "DisplayName") _list path;
    name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "Name") _list path;
    hash_type = option_of_yojson (value_for_key (document_hash_type_of_yojson) "HashType") _list path;
    hash = option_of_yojson (value_for_key (document_hash_of_yojson) "Hash") _list path;
    sha1 = option_of_yojson (value_for_key (document_sha1_of_yojson) "Sha1") _list path;
    
  }
  in _res

let update_document_result_of_yojson = 
  fun tree path : update_document_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_document_result = {
    document_description = option_of_yojson (value_for_key (document_description_of_yojson) "DocumentDescription") _list path;
    
  }
  in _res

let document_content_of_yojson = string_of_yojson

let attachments_source_key_of_yojson = 
  fun (tree: t) path : attachments_source_key -> match tree with 
    | `String "AttachmentReference" -> AttachmentReference
    | `String "S3FileUrl" -> S3FileUrl
    | `String "SourceUrl" -> SourceUrl
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttachmentsSourceKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AttachmentsSourceKey")

let attachments_source_value_of_yojson = string_of_yojson

let attachments_source_values_of_yojson = 
  fun tree path -> list_of_yojson attachments_source_value_of_yojson tree path 

let attachment_identifier_of_yojson = string_of_yojson

let attachments_source_of_yojson = 
  fun tree path : attachments_source ->
  let _list = assoc_of_yojson tree path in
  let _res : attachments_source = {
    name = option_of_yojson (value_for_key (attachment_identifier_of_yojson) "Name") _list path;
    values = option_of_yojson (value_for_key (attachments_source_values_of_yojson) "Values") _list path;
    key = option_of_yojson (value_for_key (attachments_source_key_of_yojson) "Key") _list path;
    
  }
  in _res

let attachments_source_list_of_yojson = 
  fun tree path -> list_of_yojson attachments_source_of_yojson tree path 

let document_name_of_yojson = string_of_yojson

let update_document_request_of_yojson = 
  fun tree path : update_document_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_document_request = {
    target_type = option_of_yojson (value_for_key (target_type_of_yojson) "TargetType") _list path;
    document_format = option_of_yojson (value_for_key (document_format_of_yojson) "DocumentFormat") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "VersionName") _list path;
    display_name = option_of_yojson (value_for_key (document_display_name_of_yojson) "DisplayName") _list path;
    name = value_for_key (document_name_of_yojson) "Name" _list path;
    attachments = option_of_yojson (value_for_key (attachments_source_list_of_yojson) "Attachments") _list path;
    content = value_for_key (document_content_of_yojson) "Content" _list path;
    
  }
  in _res

let update_document_metadata_response_of_yojson = 
  fun tree path : update_document_metadata_response ->
  let _list = assoc_of_yojson tree path in
  let _res : update_document_metadata_response = ()
  in _res

let document_review_action_of_yojson = 
  fun (tree: t) path : document_review_action -> match tree with 
    | `String "Reject" -> Reject
    | `String "Approve" -> Approve
    | `String "UpdateReview" -> UpdateReview
    | `String "SendForReview" -> SendForReview
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentReviewAction" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentReviewAction")

let document_review_comment_type_of_yojson = 
  fun (tree: t) path : document_review_comment_type -> match tree with 
    | `String "Comment" -> Comment
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentReviewCommentType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentReviewCommentType")

let document_review_comment_of_yojson = string_of_yojson

let document_review_comment_source_of_yojson = 
  fun tree path : document_review_comment_source ->
  let _list = assoc_of_yojson tree path in
  let _res : document_review_comment_source = {
    content = option_of_yojson (value_for_key (document_review_comment_of_yojson) "Content") _list path;
    type_ = option_of_yojson (value_for_key (document_review_comment_type_of_yojson) "Type") _list path;
    
  }
  in _res

let document_review_comment_list_of_yojson = 
  fun tree path -> list_of_yojson document_review_comment_source_of_yojson tree path 

let document_reviews_of_yojson = 
  fun tree path : document_reviews ->
  let _list = assoc_of_yojson tree path in
  let _res : document_reviews = {
    comment = option_of_yojson (value_for_key (document_review_comment_list_of_yojson) "Comment") _list path;
    action = value_for_key (document_review_action_of_yojson) "Action" _list path;
    
  }
  in _res

let update_document_metadata_request_of_yojson = 
  fun tree path : update_document_metadata_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_document_metadata_request = {
    document_reviews = value_for_key (document_reviews_of_yojson) "DocumentReviews" _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    name = value_for_key (document_name_of_yojson) "Name" _list path;
    
  }
  in _res

let invalid_document_version_of_yojson = 
  fun tree path : invalid_document_version ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_document_version = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_document_operation_of_yojson = 
  fun tree path : invalid_document_operation ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_document_operation = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_document_of_yojson = 
  fun tree path : invalid_document ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_document = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let document_default_version_description_of_yojson = 
  fun tree path : document_default_version_description ->
  let _list = assoc_of_yojson tree path in
  let _res : document_default_version_description = {
    default_version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "DefaultVersionName") _list path;
    default_version = option_of_yojson (value_for_key (document_version_of_yojson) "DefaultVersion") _list path;
    name = option_of_yojson (value_for_key (document_name_of_yojson) "Name") _list path;
    
  }
  in _res

let update_document_default_version_result_of_yojson = 
  fun tree path : update_document_default_version_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_document_default_version_result = {
    description = option_of_yojson (value_for_key (document_default_version_description_of_yojson) "Description") _list path;
    
  }
  in _res

let document_version_number_of_yojson = string_of_yojson

let update_document_default_version_request_of_yojson = 
  fun tree path : update_document_default_version_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_document_default_version_request = {
    document_version = value_for_key (document_version_number_of_yojson) "DocumentVersion" _list path;
    name = value_for_key (document_name_of_yojson) "Name" _list path;
    
  }
  in _res

let invalid_document_schema_version_of_yojson = 
  fun tree path : invalid_document_schema_version ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_document_schema_version = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let max_document_size_exceeded_of_yojson = 
  fun tree path : max_document_size_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : max_document_size_exceeded = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_document_content_of_yojson = 
  fun tree path : invalid_document_content ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_document_content = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let duplicate_document_version_name_of_yojson = 
  fun tree path : duplicate_document_version_name ->
  let _list = assoc_of_yojson tree path in
  let _res : duplicate_document_version_name = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let duplicate_document_content_of_yojson = 
  fun tree path : duplicate_document_content ->
  let _list = assoc_of_yojson tree path in
  let _res : duplicate_document_content = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let document_version_limit_exceeded_of_yojson = 
  fun tree path : document_version_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : document_version_limit_exceeded = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let instance_id_of_yojson = string_of_yojson

let association_version_of_yojson = string_of_yojson

let association_status_name_of_yojson = 
  fun (tree: t) path : association_status_name -> match tree with 
    | `String "Failed" -> Failed
    | `String "Success" -> Success
    | `String "Pending" -> Pending
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationStatusName" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationStatusName")

let status_message_of_yojson = string_of_yojson

let status_additional_info_of_yojson = string_of_yojson

let association_status_of_yojson = 
  fun tree path : association_status ->
  let _list = assoc_of_yojson tree path in
  let _res : association_status = {
    additional_info = option_of_yojson (value_for_key (status_additional_info_of_yojson) "AdditionalInfo") _list path;
    message = value_for_key (status_message_of_yojson) "Message" _list path;
    name = value_for_key (association_status_name_of_yojson) "Name" _list path;
    date = value_for_key (date_time_of_yojson) "Date" _list path;
    
  }
  in _res

let status_name_of_yojson = string_of_yojson

let instance_count_of_yojson = int_of_yojson

let association_status_aggregated_count_of_yojson = 
  fun tree path -> map_of_yojson instance_count_of_yojson tree path

let association_overview_of_yojson = 
  fun tree path : association_overview ->
  let _list = assoc_of_yojson tree path in
  let _res : association_overview = {
    association_status_aggregated_count = option_of_yojson (value_for_key (association_status_aggregated_count_of_yojson) "AssociationStatusAggregatedCount") _list path;
    detailed_status = option_of_yojson (value_for_key (status_name_of_yojson) "DetailedStatus") _list path;
    status = option_of_yojson (value_for_key (status_name_of_yojson) "Status") _list path;
    
  }
  in _res

let automation_target_parameter_name_of_yojson = string_of_yojson

let association_id_of_yojson = string_of_yojson

let schedule_expression_of_yojson = string_of_yojson

let s3_output_location_of_yojson = 
  fun tree path : s3_output_location ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_output_location = {
    output_s3_key_prefix = option_of_yojson (value_for_key (s3_key_prefix_of_yojson) "OutputS3KeyPrefix") _list path;
    output_s3_bucket_name = option_of_yojson (value_for_key (s3_bucket_name_of_yojson) "OutputS3BucketName") _list path;
    output_s3_region = option_of_yojson (value_for_key (s3_region_of_yojson) "OutputS3Region") _list path;
    
  }
  in _res

let instance_association_output_location_of_yojson = 
  fun tree path : instance_association_output_location ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_association_output_location = {
    s3_location = option_of_yojson (value_for_key (s3_output_location_of_yojson) "S3Location") _list path;
    
  }
  in _res

let association_name_of_yojson = string_of_yojson

let association_compliance_severity_of_yojson = 
  fun (tree: t) path : association_compliance_severity -> match tree with 
    | `String "UNSPECIFIED" -> Unspecified
    | `String "LOW" -> Low
    | `String "MEDIUM" -> Medium
    | `String "HIGH" -> High
    | `String "CRITICAL" -> Critical
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationComplianceSeverity" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationComplianceSeverity")

let association_sync_compliance_of_yojson = 
  fun (tree: t) path : association_sync_compliance -> match tree with 
    | `String "MANUAL" -> Manual
    | `String "AUTO" -> Auto
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationSyncCompliance" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationSyncCompliance")

let apply_only_at_cron_interval_of_yojson = bool_of_yojson

let calendar_name_or_ar_n_of_yojson = string_of_yojson

let calendar_name_or_arn_list_of_yojson = 
  fun tree path -> list_of_yojson calendar_name_or_ar_n_of_yojson tree path 

let account_of_yojson = string_of_yojson

let accounts_of_yojson = 
  fun tree path -> list_of_yojson account_of_yojson tree path 

let region_of_yojson = string_of_yojson

let regions_of_yojson = 
  fun tree path -> list_of_yojson region_of_yojson tree path 

let execution_role_name_of_yojson = string_of_yojson

let target_location_of_yojson = 
  fun tree path : target_location ->
  let _list = assoc_of_yojson tree path in
  let _res : target_location = {
    target_location_alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "TargetLocationAlarmConfiguration") _list path;
    execution_role_name = option_of_yojson (value_for_key (execution_role_name_of_yojson) "ExecutionRoleName") _list path;
    target_location_max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "TargetLocationMaxErrors") _list path;
    target_location_max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "TargetLocationMaxConcurrency") _list path;
    regions = option_of_yojson (value_for_key (regions_of_yojson) "Regions") _list path;
    accounts = option_of_yojson (value_for_key (accounts_of_yojson) "Accounts") _list path;
    
  }
  in _res

let target_locations_of_yojson = 
  fun tree path -> list_of_yojson target_location_of_yojson tree path 

let schedule_offset_of_yojson = int_of_yojson

let duration_of_yojson = int_of_yojson

let target_map_value_of_yojson = string_of_yojson

let target_map_value_list_of_yojson = 
  fun tree path -> list_of_yojson target_map_value_of_yojson tree path 

let target_map_key_of_yojson = string_of_yojson

let target_map_of_yojson = 
  fun tree path -> map_of_yojson target_map_value_list_of_yojson tree path

let target_maps_of_yojson = 
  fun tree path -> list_of_yojson target_map_of_yojson tree path 

let external_alarm_state_of_yojson = 
  fun (tree: t) path : external_alarm_state -> match tree with 
    | `String "ALARM" -> ALARM
    | `String "UNKNOWN" -> UNKNOWN
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExternalAlarmState" value)
    | _ -> raise (deserialize_wrong_type_error path "ExternalAlarmState")

let alarm_state_information_of_yojson = 
  fun tree path : alarm_state_information ->
  let _list = assoc_of_yojson tree path in
  let _res : alarm_state_information = {
    state = value_for_key (external_alarm_state_of_yojson) "State" _list path;
    name = value_for_key (alarm_name_of_yojson) "Name" _list path;
    
  }
  in _res

let alarm_state_information_list_of_yojson = 
  fun tree path -> list_of_yojson alarm_state_information_of_yojson tree path 

let association_description_of_yojson = 
  fun tree path : association_description ->
  let _list = assoc_of_yojson tree path in
  let _res : association_description = {
    triggered_alarms = option_of_yojson (value_for_key (alarm_state_information_list_of_yojson) "TriggeredAlarms") _list path;
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    target_maps = option_of_yojson (value_for_key (target_maps_of_yojson) "TargetMaps") _list path;
    duration = option_of_yojson (value_for_key (duration_of_yojson) "Duration") _list path;
    schedule_offset = option_of_yojson (value_for_key (schedule_offset_of_yojson) "ScheduleOffset") _list path;
    target_locations = option_of_yojson (value_for_key (target_locations_of_yojson) "TargetLocations") _list path;
    calendar_names = option_of_yojson (value_for_key (calendar_name_or_arn_list_of_yojson) "CalendarNames") _list path;
    apply_only_at_cron_interval = option_of_yojson (value_for_key (apply_only_at_cron_interval_of_yojson) "ApplyOnlyAtCronInterval") _list path;
    sync_compliance = option_of_yojson (value_for_key (association_sync_compliance_of_yojson) "SyncCompliance") _list path;
    compliance_severity = option_of_yojson (value_for_key (association_compliance_severity_of_yojson) "ComplianceSeverity") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    association_name = option_of_yojson (value_for_key (association_name_of_yojson) "AssociationName") _list path;
    last_successful_execution_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastSuccessfulExecutionDate") _list path;
    last_execution_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastExecutionDate") _list path;
    output_location = option_of_yojson (value_for_key (instance_association_output_location_of_yojson) "OutputLocation") _list path;
    schedule_expression = option_of_yojson (value_for_key (schedule_expression_of_yojson) "ScheduleExpression") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    association_id = option_of_yojson (value_for_key (association_id_of_yojson) "AssociationId") _list path;
    parameters = option_of_yojson (value_for_key (parameters_of_yojson) "Parameters") _list path;
    automation_target_parameter_name = option_of_yojson (value_for_key (automation_target_parameter_name_of_yojson) "AutomationTargetParameterName") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    overview = option_of_yojson (value_for_key (association_overview_of_yojson) "Overview") _list path;
    status = option_of_yojson (value_for_key (association_status_of_yojson) "Status") _list path;
    last_update_association_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastUpdateAssociationDate") _list path;
    date = option_of_yojson (value_for_key (date_time_of_yojson) "Date") _list path;
    association_version = option_of_yojson (value_for_key (association_version_of_yojson) "AssociationVersion") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "Name") _list path;
    
  }
  in _res

let update_association_status_result_of_yojson = 
  fun tree path : update_association_status_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_association_status_result = {
    association_description = option_of_yojson (value_for_key (association_description_of_yojson) "AssociationDescription") _list path;
    
  }
  in _res

let update_association_status_request_of_yojson = 
  fun tree path : update_association_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_association_status_request = {
    association_status = value_for_key (association_status_of_yojson) "AssociationStatus" _list path;
    instance_id = value_for_key (instance_id_of_yojson) "InstanceId" _list path;
    name = value_for_key (document_ar_n_of_yojson) "Name" _list path;
    
  }
  in _res

let status_unchanged_of_yojson = 
  fun tree path : status_unchanged ->
  let _list = assoc_of_yojson tree path in
  let _res : status_unchanged = ()
  in _res

let association_does_not_exist_of_yojson = 
  fun tree path : association_does_not_exist ->
  let _list = assoc_of_yojson tree path in
  let _res : association_does_not_exist = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let update_association_result_of_yojson = 
  fun tree path : update_association_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_association_result = {
    association_description = option_of_yojson (value_for_key (association_description_of_yojson) "AssociationDescription") _list path;
    
  }
  in _res

let update_association_request_of_yojson = 
  fun tree path : update_association_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_association_request = {
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    target_maps = option_of_yojson (value_for_key (target_maps_of_yojson) "TargetMaps") _list path;
    duration = option_of_yojson (value_for_key (duration_of_yojson) "Duration") _list path;
    schedule_offset = option_of_yojson (value_for_key (schedule_offset_of_yojson) "ScheduleOffset") _list path;
    target_locations = option_of_yojson (value_for_key (target_locations_of_yojson) "TargetLocations") _list path;
    calendar_names = option_of_yojson (value_for_key (calendar_name_or_arn_list_of_yojson) "CalendarNames") _list path;
    apply_only_at_cron_interval = option_of_yojson (value_for_key (apply_only_at_cron_interval_of_yojson) "ApplyOnlyAtCronInterval") _list path;
    sync_compliance = option_of_yojson (value_for_key (association_sync_compliance_of_yojson) "SyncCompliance") _list path;
    compliance_severity = option_of_yojson (value_for_key (association_compliance_severity_of_yojson) "ComplianceSeverity") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    automation_target_parameter_name = option_of_yojson (value_for_key (automation_target_parameter_name_of_yojson) "AutomationTargetParameterName") _list path;
    association_version = option_of_yojson (value_for_key (association_version_of_yojson) "AssociationVersion") _list path;
    association_name = option_of_yojson (value_for_key (association_name_of_yojson) "AssociationName") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "Name") _list path;
    output_location = option_of_yojson (value_for_key (instance_association_output_location_of_yojson) "OutputLocation") _list path;
    schedule_expression = option_of_yojson (value_for_key (schedule_expression_of_yojson) "ScheduleExpression") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    parameters = option_of_yojson (value_for_key (parameters_of_yojson) "Parameters") _list path;
    association_id = value_for_key (association_id_of_yojson) "AssociationId" _list path;
    
  }
  in _res

let invalid_update_of_yojson = 
  fun tree path : invalid_update ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_update = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_target_maps_of_yojson = 
  fun tree path : invalid_target_maps ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_target_maps = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_target_of_yojson = 
  fun tree path : invalid_target ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_target = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_schedule_of_yojson = 
  fun tree path : invalid_schedule ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_schedule = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_parameters_of_yojson = 
  fun tree path : invalid_parameters ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_parameters = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_output_location_of_yojson = 
  fun tree path : invalid_output_location ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_output_location = ()
  in _res

let invalid_association_version_of_yojson = 
  fun tree path : invalid_association_version ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_association_version = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let association_version_limit_exceeded_of_yojson = 
  fun tree path : association_version_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : association_version_limit_exceeded = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let unsupported_platform_type_of_yojson = 
  fun tree path : unsupported_platform_type ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_platform_type = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let unsupported_parameter_type_of_yojson = 
  fun tree path : unsupported_parameter_type ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_parameter_type = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let unsupported_operating_system_of_yojson = 
  fun tree path : unsupported_operating_system ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_operating_system = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let unsupported_inventory_schema_version_exception_of_yojson = 
  fun tree path : unsupported_inventory_schema_version_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_inventory_schema_version_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let inventory_item_type_name_of_yojson = string_of_yojson

let unsupported_inventory_item_context_exception_of_yojson = 
  fun tree path : unsupported_inventory_item_context_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_inventory_item_context_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    type_name = option_of_yojson (value_for_key (inventory_item_type_name_of_yojson) "TypeName") _list path;
    
  }
  in _res

let unsupported_feature_required_exception_of_yojson = 
  fun tree path : unsupported_feature_required_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_feature_required_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let unsupported_calendar_exception_of_yojson = 
  fun tree path : unsupported_calendar_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_calendar_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let parameter_label_of_yojson = string_of_yojson

let parameter_label_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_label_of_yojson tree path 

let unlabel_parameter_version_result_of_yojson = 
  fun tree path : unlabel_parameter_version_result ->
  let _list = assoc_of_yojson tree path in
  let _res : unlabel_parameter_version_result = {
    invalid_labels = option_of_yojson (value_for_key (parameter_label_list_of_yojson) "InvalidLabels") _list path;
    removed_labels = option_of_yojson (value_for_key (parameter_label_list_of_yojson) "RemovedLabels") _list path;
    
  }
  in _res

let ps_parameter_name_of_yojson = string_of_yojson

let ps_parameter_version_of_yojson = long_of_yojson

let unlabel_parameter_version_request_of_yojson = 
  fun tree path : unlabel_parameter_version_request ->
  let _list = assoc_of_yojson tree path in
  let _res : unlabel_parameter_version_request = {
    labels = value_for_key (parameter_label_list_of_yojson) "Labels" _list path;
    parameter_version = value_for_key (ps_parameter_version_of_yojson) "ParameterVersion" _list path;
    name = value_for_key (ps_parameter_name_of_yojson) "Name" _list path;
    
  }
  in _res

let parameter_version_not_found_of_yojson = 
  fun tree path : parameter_version_not_found ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_version_not_found = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let parameter_not_found_of_yojson = 
  fun tree path : parameter_not_found ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_not_found = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let uui_d_of_yojson = string_of_yojson

let total_size_limit_exceeded_exception_of_yojson = 
  fun tree path : total_size_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : total_size_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let total_count_of_yojson = int_of_yojson

let too_many_tags_error_of_yojson = 
  fun tree path : too_many_tags_error ->
  let _list = assoc_of_yojson tree path in
  let _res : too_many_tags_error = ()
  in _res

let token_value_of_yojson = string_of_yojson

let session_id_of_yojson = string_of_yojson

let terminate_session_response_of_yojson = 
  fun tree path : terminate_session_response ->
  let _list = assoc_of_yojson tree path in
  let _res : terminate_session_response = {
    session_id = option_of_yojson (value_for_key (session_id_of_yojson) "SessionId") _list path;
    
  }
  in _res

let terminate_session_request_of_yojson = 
  fun tree path : terminate_session_request ->
  let _list = assoc_of_yojson tree path in
  let _res : terminate_session_request = {
    session_id = value_for_key (session_id_of_yojson) "SessionId" _list path;
    
  }
  in _res

let target_parameter_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_value_of_yojson tree path 

let target_not_connected_of_yojson = 
  fun tree path : target_not_connected ->
  let _list = assoc_of_yojson tree path in
  let _res : target_not_connected = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let target_in_use_exception_of_yojson = 
  fun tree path : target_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : target_in_use_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let target_count_of_yojson = int_of_yojson

let sub_type_count_limit_exceeded_exception_of_yojson = 
  fun tree path : sub_type_count_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : sub_type_count_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let string_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let string_date_time_of_yojson = string_of_yojson

let stream_url_of_yojson = string_of_yojson

let stop_type_of_yojson = 
  fun (tree: t) path : stop_type -> match tree with 
    | `String "Cancel" -> CANCEL
    | `String "Complete" -> COMPLETE
    | `String value -> raise (deserialize_unknown_enum_value_error path "StopType" value)
    | _ -> raise (deserialize_wrong_type_error path "StopType")

let stop_automation_execution_result_of_yojson = 
  fun tree path : stop_automation_execution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_automation_execution_result = ()
  in _res

let automation_execution_id_of_yojson = string_of_yojson

let stop_automation_execution_request_of_yojson = 
  fun tree path : stop_automation_execution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_automation_execution_request = {
    type_ = option_of_yojson (value_for_key (stop_type_of_yojson) "Type") _list path;
    automation_execution_id = value_for_key (automation_execution_id_of_yojson) "AutomationExecutionId" _list path;
    
  }
  in _res

let invalid_automation_status_update_exception_of_yojson = 
  fun tree path : invalid_automation_status_update_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_automation_status_update_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let automation_execution_not_found_exception_of_yojson = 
  fun tree path : automation_execution_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : automation_execution_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let automation_action_name_of_yojson = string_of_yojson

let long_of_yojson = long_of_yojson

let automation_execution_status_of_yojson = 
  fun (tree: t) path : automation_execution_status -> match tree with 
    | `String "Exited" -> EXITED
    | `String "CompletedWithFailure" -> COMPLETED_WITH_FAILURE
    | `String "CompletedWithSuccess" -> COMPLETED_WITH_SUCCESS
    | `String "ChangeCalendarOverrideRejected" -> CHANGE_CALENDAR_OVERRIDE_REJECTED
    | `String "ChangeCalendarOverrideApproved" -> CHANGE_CALENDAR_OVERRIDE_APPROVED
    | `String "PendingChangeCalendarOverride" -> PENDING_CHANGE_CALENDAR_OVERRIDE
    | `String "RunbookInProgress" -> RUNBOOK_INPROGRESS
    | `String "Scheduled" -> SCHEDULED
    | `String "Rejected" -> REJECTED
    | `String "Approved" -> APPROVED
    | `String "PendingApproval" -> PENDING_APPROVAL
    | `String "Failed" -> FAILED
    | `String "Cancelled" -> CANCELLED
    | `String "Cancelling" -> CANCELLING
    | `String "TimedOut" -> TIMEDOUT
    | `String "Success" -> SUCCESS
    | `String "Waiting" -> WAITING
    | `String "InProgress" -> INPROGRESS
    | `String "Pending" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutomationExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationExecutionStatus")

let normal_string_map_of_yojson = 
  fun tree path -> map_of_yojson string__of_yojson tree path

let failure_details_of_yojson = 
  fun tree path : failure_details ->
  let _list = assoc_of_yojson tree path in
  let _res : failure_details = {
    details = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Details") _list path;
    failure_type = option_of_yojson (value_for_key (string__of_yojson) "FailureType") _list path;
    failure_stage = option_of_yojson (value_for_key (string__of_yojson) "FailureStage") _list path;
    
  }
  in _res

let parent_step_details_of_yojson = 
  fun tree path : parent_step_details ->
  let _list = assoc_of_yojson tree path in
  let _res : parent_step_details = {
    iterator_value = option_of_yojson (value_for_key (string__of_yojson) "IteratorValue") _list path;
    iteration = option_of_yojson (value_for_key (integer__of_yojson) "Iteration") _list path;
    action = option_of_yojson (value_for_key (automation_action_name_of_yojson) "Action") _list path;
    step_name = option_of_yojson (value_for_key (string__of_yojson) "StepName") _list path;
    step_execution_id = option_of_yojson (value_for_key (string__of_yojson) "StepExecutionId") _list path;
    
  }
  in _res

let step_execution_of_yojson = 
  fun tree path : step_execution ->
  let _list = assoc_of_yojson tree path in
  let _res : step_execution = {
    parent_step_details = option_of_yojson (value_for_key (parent_step_details_of_yojson) "ParentStepDetails") _list path;
    triggered_alarms = option_of_yojson (value_for_key (alarm_state_information_list_of_yojson) "TriggeredAlarms") _list path;
    target_location = option_of_yojson (value_for_key (target_location_of_yojson) "TargetLocation") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    valid_next_steps = option_of_yojson (value_for_key (valid_next_step_list_of_yojson) "ValidNextSteps") _list path;
    is_critical = option_of_yojson (value_for_key (boolean__of_yojson) "IsCritical") _list path;
    next_step = option_of_yojson (value_for_key (string__of_yojson) "NextStep") _list path;
    is_end = option_of_yojson (value_for_key (boolean__of_yojson) "IsEnd") _list path;
    overridden_parameters = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "OverriddenParameters") _list path;
    step_execution_id = option_of_yojson (value_for_key (string__of_yojson) "StepExecutionId") _list path;
    failure_details = option_of_yojson (value_for_key (failure_details_of_yojson) "FailureDetails") _list path;
    failure_message = option_of_yojson (value_for_key (string__of_yojson) "FailureMessage") _list path;
    response = option_of_yojson (value_for_key (string__of_yojson) "Response") _list path;
    outputs = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Outputs") _list path;
    inputs = option_of_yojson (value_for_key (normal_string_map_of_yojson) "Inputs") _list path;
    response_code = option_of_yojson (value_for_key (string__of_yojson) "ResponseCode") _list path;
    step_status = option_of_yojson (value_for_key (automation_execution_status_of_yojson) "StepStatus") _list path;
    execution_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "ExecutionEndTime") _list path;
    execution_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "ExecutionStartTime") _list path;
    max_attempts = option_of_yojson (value_for_key (integer__of_yojson) "MaxAttempts") _list path;
    on_failure = option_of_yojson (value_for_key (string__of_yojson) "OnFailure") _list path;
    timeout_seconds = option_of_yojson (value_for_key (long_of_yojson) "TimeoutSeconds") _list path;
    action = option_of_yojson (value_for_key (automation_action_name_of_yojson) "Action") _list path;
    step_name = option_of_yojson (value_for_key (string__of_yojson) "StepName") _list path;
    
  }
  in _res

let step_execution_list_of_yojson = 
  fun tree path -> list_of_yojson step_execution_of_yojson tree path 

let step_execution_filter_value_of_yojson = string_of_yojson

let step_execution_filter_value_list_of_yojson = 
  fun tree path -> list_of_yojson step_execution_filter_value_of_yojson tree path 

let step_execution_filter_key_of_yojson = 
  fun (tree: t) path : step_execution_filter_key -> match tree with 
    | `String "ParentStepIteratorValue" -> PARENT_STEP_ITERATOR_VALUE
    | `String "ParentStepIteration" -> PARENT_STEP_ITERATION
    | `String "ParentStepExecutionId" -> PARENT_STEP_EXECUTION_ID
    | `String "Action" -> ACTION
    | `String "StepName" -> STEP_NAME
    | `String "StepExecutionId" -> STEP_EXECUTION_ID
    | `String "StepExecutionStatus" -> STEP_EXECUTION_STATUS
    | `String "StartTimeAfter" -> START_TIME_AFTER
    | `String "StartTimeBefore" -> START_TIME_BEFORE
    | `String value -> raise (deserialize_unknown_enum_value_error path "StepExecutionFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "StepExecutionFilterKey")

let step_execution_filter_of_yojson = 
  fun tree path : step_execution_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : step_execution_filter = {
    values = value_for_key (step_execution_filter_value_list_of_yojson) "Values" _list path;
    key = value_for_key (step_execution_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let step_execution_filter_list_of_yojson = 
  fun tree path -> list_of_yojson step_execution_filter_of_yojson tree path 

let status_details_of_yojson = string_of_yojson

let start_session_response_of_yojson = 
  fun tree path : start_session_response ->
  let _list = assoc_of_yojson tree path in
  let _res : start_session_response = {
    stream_url = option_of_yojson (value_for_key (stream_url_of_yojson) "StreamUrl") _list path;
    token_value = option_of_yojson (value_for_key (token_value_of_yojson) "TokenValue") _list path;
    session_id = option_of_yojson (value_for_key (session_id_of_yojson) "SessionId") _list path;
    
  }
  in _res

let session_target_of_yojson = string_of_yojson

let session_reason_of_yojson = string_of_yojson

let session_manager_parameter_value_of_yojson = string_of_yojson

let session_manager_parameter_value_list_of_yojson = 
  fun tree path -> list_of_yojson session_manager_parameter_value_of_yojson tree path 

let session_manager_parameter_name_of_yojson = string_of_yojson

let session_manager_parameters_of_yojson = 
  fun tree path -> map_of_yojson session_manager_parameter_value_list_of_yojson tree path

let start_session_request_of_yojson = 
  fun tree path : start_session_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_session_request = {
    parameters = option_of_yojson (value_for_key (session_manager_parameters_of_yojson) "Parameters") _list path;
    reason = option_of_yojson (value_for_key (session_reason_of_yojson) "Reason") _list path;
    document_name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "DocumentName") _list path;
    target = value_for_key (session_target_of_yojson) "Target" _list path;
    
  }
  in _res

let start_change_request_execution_result_of_yojson = 
  fun tree path : start_change_request_execution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : start_change_request_execution_result = {
    automation_execution_id = option_of_yojson (value_for_key (automation_execution_id_of_yojson) "AutomationExecutionId") _list path;
    
  }
  in _res

let change_request_name_of_yojson = string_of_yojson

let idempotency_token_of_yojson = string_of_yojson

let runbook_of_yojson = 
  fun tree path : runbook ->
  let _list = assoc_of_yojson tree path in
  let _res : runbook = {
    target_locations = option_of_yojson (value_for_key (target_locations_of_yojson) "TargetLocations") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    target_maps = option_of_yojson (value_for_key (target_maps_of_yojson) "TargetMaps") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    target_parameter_name = option_of_yojson (value_for_key (automation_parameter_key_of_yojson) "TargetParameterName") _list path;
    parameters = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Parameters") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    document_name = value_for_key (document_ar_n_of_yojson) "DocumentName" _list path;
    
  }
  in _res

let runbooks_of_yojson = 
  fun tree path -> list_of_yojson runbook_of_yojson tree path 

let change_details_value_of_yojson = string_of_yojson

let start_change_request_execution_request_of_yojson = 
  fun tree path : start_change_request_execution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_change_request_execution_request = {
    change_details = option_of_yojson (value_for_key (change_details_value_of_yojson) "ChangeDetails") _list path;
    scheduled_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "ScheduledEndTime") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    runbooks = value_for_key (runbooks_of_yojson) "Runbooks" _list path;
    auto_approve = option_of_yojson (value_for_key (boolean__of_yojson) "AutoApprove") _list path;
    client_token = option_of_yojson (value_for_key (idempotency_token_of_yojson) "ClientToken") _list path;
    change_request_name = option_of_yojson (value_for_key (change_request_name_of_yojson) "ChangeRequestName") _list path;
    parameters = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Parameters") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    document_name = value_for_key (document_ar_n_of_yojson) "DocumentName" _list path;
    scheduled_time = option_of_yojson (value_for_key (date_time_of_yojson) "ScheduledTime") _list path;
    
  }
  in _res

let invalid_automation_execution_parameters_exception_of_yojson = 
  fun tree path : invalid_automation_execution_parameters_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_automation_execution_parameters_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let idempotent_parameter_mismatch_of_yojson = 
  fun tree path : idempotent_parameter_mismatch ->
  let _list = assoc_of_yojson tree path in
  let _res : idempotent_parameter_mismatch = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let automation_execution_limit_exceeded_exception_of_yojson = 
  fun tree path : automation_execution_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : automation_execution_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let automation_definition_version_not_found_exception_of_yojson = 
  fun tree path : automation_definition_version_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : automation_definition_version_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let automation_definition_not_found_exception_of_yojson = 
  fun tree path : automation_definition_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : automation_definition_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let automation_definition_not_approved_exception_of_yojson = 
  fun tree path : automation_definition_not_approved_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : automation_definition_not_approved_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let start_automation_execution_result_of_yojson = 
  fun tree path : start_automation_execution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : start_automation_execution_result = {
    automation_execution_id = option_of_yojson (value_for_key (automation_execution_id_of_yojson) "AutomationExecutionId") _list path;
    
  }
  in _res

let execution_mode_of_yojson = 
  fun (tree: t) path : execution_mode -> match tree with 
    | `String "Interactive" -> Interactive
    | `String "Auto" -> Auto
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionMode")

let start_automation_execution_request_of_yojson = 
  fun tree path : start_automation_execution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_automation_execution_request = {
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    target_locations = option_of_yojson (value_for_key (target_locations_of_yojson) "TargetLocations") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    target_maps = option_of_yojson (value_for_key (target_maps_of_yojson) "TargetMaps") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    target_parameter_name = option_of_yojson (value_for_key (automation_parameter_key_of_yojson) "TargetParameterName") _list path;
    mode = option_of_yojson (value_for_key (execution_mode_of_yojson) "Mode") _list path;
    client_token = option_of_yojson (value_for_key (idempotency_token_of_yojson) "ClientToken") _list path;
    parameters = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Parameters") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    document_name = value_for_key (document_ar_n_of_yojson) "DocumentName" _list path;
    
  }
  in _res

let start_associations_once_result_of_yojson = 
  fun tree path : start_associations_once_result ->
  let _list = assoc_of_yojson tree path in
  let _res : start_associations_once_result = ()
  in _res

let association_id_list_of_yojson = 
  fun tree path -> list_of_yojson association_id_of_yojson tree path 

let start_associations_once_request_of_yojson = 
  fun tree path : start_associations_once_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_associations_once_request = {
    association_ids = value_for_key (association_id_list_of_yojson) "AssociationIds" _list path;
    
  }
  in _res

let invalid_association_of_yojson = 
  fun tree path : invalid_association ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_association = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let standard_output_content_of_yojson = string_of_yojson

let standard_error_content_of_yojson = string_of_yojson

let source_type_of_yojson = 
  fun (tree: t) path : source_type -> match tree with 
    | `String "AWS::SSM::ManagedInstance" -> AWS_SSM_MANAGEDINSTANCE
    | `String "AWS::IoT::Thing" -> AWS_IOT_THING
    | `String "AWS::EC2::Instance" -> AWS_EC2_INSTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SourceType")

let source_id_of_yojson = string_of_yojson

let snapshot_id_of_yojson = string_of_yojson

let snapshot_download_url_of_yojson = string_of_yojson

let signal_type_of_yojson = 
  fun (tree: t) path : signal_type -> match tree with 
    | `String "Resume" -> RESUME
    | `String "StopStep" -> STOP_STEP
    | `String "StartStep" -> START_STEP
    | `String "Reject" -> REJECT
    | `String "Approve" -> APPROVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SignalType" value)
    | _ -> raise (deserialize_wrong_type_error path "SignalType")

let shared_document_version_of_yojson = string_of_yojson

let compliance_summary_count_of_yojson = int_of_yojson

let severity_summary_of_yojson = 
  fun tree path : severity_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : severity_summary = {
    unspecified_count = option_of_yojson (value_for_key (compliance_summary_count_of_yojson) "UnspecifiedCount") _list path;
    informational_count = option_of_yojson (value_for_key (compliance_summary_count_of_yojson) "InformationalCount") _list path;
    low_count = option_of_yojson (value_for_key (compliance_summary_count_of_yojson) "LowCount") _list path;
    medium_count = option_of_yojson (value_for_key (compliance_summary_count_of_yojson) "MediumCount") _list path;
    high_count = option_of_yojson (value_for_key (compliance_summary_count_of_yojson) "HighCount") _list path;
    critical_count = option_of_yojson (value_for_key (compliance_summary_count_of_yojson) "CriticalCount") _list path;
    
  }
  in _res

let session_status_of_yojson = 
  fun (tree: t) path : session_status -> match tree with 
    | `String "Failed" -> FAILED
    | `String "Terminating" -> TERMINATING
    | `String "Terminated" -> TERMINATED
    | `String "Disconnected" -> DISCONNECTED
    | `String "Connecting" -> CONNECTING
    | `String "Connected" -> CONNECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionStatus")

let session_state_of_yojson = 
  fun (tree: t) path : session_state -> match tree with 
    | `String "History" -> HISTORY
    | `String "Active" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionState" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionState")

let session_owner_of_yojson = string_of_yojson

let session_max_results_of_yojson = int_of_yojson

let session_manager_s3_output_url_of_yojson = string_of_yojson

let session_manager_cloud_watch_output_url_of_yojson = string_of_yojson

let session_manager_output_url_of_yojson = 
  fun tree path : session_manager_output_url ->
  let _list = assoc_of_yojson tree path in
  let _res : session_manager_output_url = {
    cloud_watch_output_url = option_of_yojson (value_for_key (session_manager_cloud_watch_output_url_of_yojson) "CloudWatchOutputUrl") _list path;
    s3_output_url = option_of_yojson (value_for_key (session_manager_s3_output_url_of_yojson) "S3OutputUrl") _list path;
    
  }
  in _res

let session_details_of_yojson = string_of_yojson

let max_session_duration_of_yojson = string_of_yojson

let session_of_yojson = 
  fun tree path : session ->
  let _list = assoc_of_yojson tree path in
  let _res : session = {
    max_session_duration = option_of_yojson (value_for_key (max_session_duration_of_yojson) "MaxSessionDuration") _list path;
    output_url = option_of_yojson (value_for_key (session_manager_output_url_of_yojson) "OutputUrl") _list path;
    details = option_of_yojson (value_for_key (session_details_of_yojson) "Details") _list path;
    reason = option_of_yojson (value_for_key (session_reason_of_yojson) "Reason") _list path;
    owner = option_of_yojson (value_for_key (session_owner_of_yojson) "Owner") _list path;
    document_name = option_of_yojson (value_for_key (document_name_of_yojson) "DocumentName") _list path;
    end_date = option_of_yojson (value_for_key (date_time_of_yojson) "EndDate") _list path;
    start_date = option_of_yojson (value_for_key (date_time_of_yojson) "StartDate") _list path;
    status = option_of_yojson (value_for_key (session_status_of_yojson) "Status") _list path;
    target = option_of_yojson (value_for_key (session_target_of_yojson) "Target") _list path;
    session_id = option_of_yojson (value_for_key (session_id_of_yojson) "SessionId") _list path;
    
  }
  in _res

let session_list_of_yojson = 
  fun tree path -> list_of_yojson session_of_yojson tree path 

let session_filter_value_of_yojson = string_of_yojson

let session_filter_key_of_yojson = 
  fun (tree: t) path : session_filter_key -> match tree with 
    | `String "SessionId" -> SESSION_ID
    | `String "Status" -> STATUS
    | `String "Owner" -> OWNER
    | `String "Target" -> TARGET_ID
    | `String "InvokedBefore" -> INVOKED_BEFORE
    | `String "InvokedAfter" -> INVOKED_AFTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionFilterKey")

let session_filter_of_yojson = 
  fun tree path : session_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : session_filter = {
    value = value_for_key (session_filter_value_of_yojson) "value" _list path;
    key = value_for_key (session_filter_key_of_yojson) "key" _list path;
    
  }
  in _res

let session_filter_list_of_yojson = 
  fun tree path -> list_of_yojson session_filter_of_yojson tree path 

let service_setting_of_yojson = 
  fun tree path : service_setting ->
  let _list = assoc_of_yojson tree path in
  let _res : service_setting = {
    status = option_of_yojson (value_for_key (string__of_yojson) "Status") _list path;
    ar_n = option_of_yojson (value_for_key (string__of_yojson) "ARN") _list path;
    last_modified_user = option_of_yojson (value_for_key (string__of_yojson) "LastModifiedUser") _list path;
    last_modified_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedDate") _list path;
    setting_value = option_of_yojson (value_for_key (service_setting_value_of_yojson) "SettingValue") _list path;
    setting_id = option_of_yojson (value_for_key (service_setting_id_of_yojson) "SettingId") _list path;
    
  }
  in _res

let command_id_of_yojson = string_of_yojson

let instance_id_list_of_yojson = 
  fun tree path -> list_of_yojson instance_id_of_yojson tree path 

let command_status_of_yojson = 
  fun (tree: t) path : command_status -> match tree with 
    | `String "Cancelling" -> CANCELLING
    | `String "TimedOut" -> TIMED_OUT
    | `String "Failed" -> FAILED
    | `String "Cancelled" -> CANCELLED
    | `String "Success" -> SUCCESS
    | `String "InProgress" -> IN_PROGRESS
    | `String "Pending" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "CommandStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CommandStatus")

let completed_count_of_yojson = int_of_yojson

let error_count_of_yojson = int_of_yojson

let delivery_timed_out_count_of_yojson = int_of_yojson

let command_of_yojson = 
  fun tree path : command ->
  let _list = assoc_of_yojson tree path in
  let _res : command = {
    triggered_alarms = option_of_yojson (value_for_key (alarm_state_information_list_of_yojson) "TriggeredAlarms") _list path;
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    timeout_seconds = option_of_yojson (value_for_key (timeout_seconds_of_yojson) "TimeoutSeconds") _list path;
    cloud_watch_output_config = option_of_yojson (value_for_key (cloud_watch_output_config_of_yojson) "CloudWatchOutputConfig") _list path;
    notification_config = option_of_yojson (value_for_key (notification_config_of_yojson) "NotificationConfig") _list path;
    service_role = option_of_yojson (value_for_key (service_role_of_yojson) "ServiceRole") _list path;
    delivery_timed_out_count = option_of_yojson (value_for_key (delivery_timed_out_count_of_yojson) "DeliveryTimedOutCount") _list path;
    error_count = option_of_yojson (value_for_key (error_count_of_yojson) "ErrorCount") _list path;
    completed_count = option_of_yojson (value_for_key (completed_count_of_yojson) "CompletedCount") _list path;
    target_count = option_of_yojson (value_for_key (target_count_of_yojson) "TargetCount") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    output_s3_key_prefix = option_of_yojson (value_for_key (s3_key_prefix_of_yojson) "OutputS3KeyPrefix") _list path;
    output_s3_bucket_name = option_of_yojson (value_for_key (s3_bucket_name_of_yojson) "OutputS3BucketName") _list path;
    output_s3_region = option_of_yojson (value_for_key (s3_region_of_yojson) "OutputS3Region") _list path;
    status_details = option_of_yojson (value_for_key (status_details_of_yojson) "StatusDetails") _list path;
    status = option_of_yojson (value_for_key (command_status_of_yojson) "Status") _list path;
    requested_date_time = option_of_yojson (value_for_key (date_time_of_yojson) "RequestedDateTime") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    instance_ids = option_of_yojson (value_for_key (instance_id_list_of_yojson) "InstanceIds") _list path;
    parameters = option_of_yojson (value_for_key (parameters_of_yojson) "Parameters") _list path;
    expires_after = option_of_yojson (value_for_key (date_time_of_yojson) "ExpiresAfter") _list path;
    comment = option_of_yojson (value_for_key (comment_of_yojson) "Comment") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    document_name = option_of_yojson (value_for_key (document_name_of_yojson) "DocumentName") _list path;
    command_id = option_of_yojson (value_for_key (command_id_of_yojson) "CommandId") _list path;
    
  }
  in _res

let send_command_result_of_yojson = 
  fun tree path : send_command_result ->
  let _list = assoc_of_yojson tree path in
  let _res : send_command_result = {
    command = option_of_yojson (value_for_key (command_of_yojson) "Command") _list path;
    
  }
  in _res

let send_command_request_of_yojson = 
  fun tree path : send_command_request ->
  let _list = assoc_of_yojson tree path in
  let _res : send_command_request = {
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    cloud_watch_output_config = option_of_yojson (value_for_key (cloud_watch_output_config_of_yojson) "CloudWatchOutputConfig") _list path;
    notification_config = option_of_yojson (value_for_key (notification_config_of_yojson) "NotificationConfig") _list path;
    service_role_arn = option_of_yojson (value_for_key (service_role_of_yojson) "ServiceRoleArn") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    output_s3_key_prefix = option_of_yojson (value_for_key (s3_key_prefix_of_yojson) "OutputS3KeyPrefix") _list path;
    output_s3_bucket_name = option_of_yojson (value_for_key (s3_bucket_name_of_yojson) "OutputS3BucketName") _list path;
    output_s3_region = option_of_yojson (value_for_key (s3_region_of_yojson) "OutputS3Region") _list path;
    parameters = option_of_yojson (value_for_key (parameters_of_yojson) "Parameters") _list path;
    comment = option_of_yojson (value_for_key (comment_of_yojson) "Comment") _list path;
    timeout_seconds = option_of_yojson (value_for_key (timeout_seconds_of_yojson) "TimeoutSeconds") _list path;
    document_hash_type = option_of_yojson (value_for_key (document_hash_type_of_yojson) "DocumentHashType") _list path;
    document_hash = option_of_yojson (value_for_key (document_hash_of_yojson) "DocumentHash") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    document_name = value_for_key (document_ar_n_of_yojson) "DocumentName" _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    instance_ids = option_of_yojson (value_for_key (instance_id_list_of_yojson) "InstanceIds") _list path;
    
  }
  in _res

let invalid_role_of_yojson = 
  fun tree path : invalid_role ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_role = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_output_folder_of_yojson = 
  fun tree path : invalid_output_folder ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_output_folder = ()
  in _res

let invalid_notification_config_of_yojson = 
  fun tree path : invalid_notification_config ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_notification_config = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let duplicate_instance_id_of_yojson = 
  fun tree path : duplicate_instance_id ->
  let _list = assoc_of_yojson tree path in
  let _res : duplicate_instance_id = ()
  in _res

let send_automation_signal_result_of_yojson = 
  fun tree path : send_automation_signal_result ->
  let _list = assoc_of_yojson tree path in
  let _res : send_automation_signal_result = ()
  in _res

let send_automation_signal_request_of_yojson = 
  fun tree path : send_automation_signal_request ->
  let _list = assoc_of_yojson tree path in
  let _res : send_automation_signal_request = {
    payload = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Payload") _list path;
    signal_type = value_for_key (signal_type_of_yojson) "SignalType" _list path;
    automation_execution_id = value_for_key (automation_execution_id_of_yojson) "AutomationExecutionId" _list path;
    
  }
  in _res

let invalid_automation_signal_exception_of_yojson = 
  fun tree path : invalid_automation_signal_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_automation_signal_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let automation_step_not_found_exception_of_yojson = 
  fun tree path : automation_step_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : automation_step_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let scheduled_window_execution_of_yojson = 
  fun tree path : scheduled_window_execution ->
  let _list = assoc_of_yojson tree path in
  let _res : scheduled_window_execution = {
    execution_time = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "ExecutionTime") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let scheduled_window_execution_list_of_yojson = 
  fun tree path -> list_of_yojson scheduled_window_execution_of_yojson tree path 

let s3_output_url_of_yojson = 
  fun tree path : s3_output_url ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_output_url = {
    output_url = option_of_yojson (value_for_key (url_of_yojson) "OutputUrl") _list path;
    
  }
  in _res

let resume_session_response_of_yojson = 
  fun tree path : resume_session_response ->
  let _list = assoc_of_yojson tree path in
  let _res : resume_session_response = {
    stream_url = option_of_yojson (value_for_key (stream_url_of_yojson) "StreamUrl") _list path;
    token_value = option_of_yojson (value_for_key (token_value_of_yojson) "TokenValue") _list path;
    session_id = option_of_yojson (value_for_key (session_id_of_yojson) "SessionId") _list path;
    
  }
  in _res

let resume_session_request_of_yojson = 
  fun tree path : resume_session_request ->
  let _list = assoc_of_yojson tree path in
  let _res : resume_session_request = {
    session_id = value_for_key (session_id_of_yojson) "SessionId" _list path;
    
  }
  in _res

let result_attribute_of_yojson = 
  fun tree path : result_attribute ->
  let _list = assoc_of_yojson tree path in
  let _res : result_attribute = {
    type_name = value_for_key (inventory_item_type_name_of_yojson) "TypeName" _list path;
    
  }
  in _res

let result_attribute_list_of_yojson = 
  fun tree path -> list_of_yojson result_attribute_of_yojson tree path 

let response_code_of_yojson = int_of_yojson

let resource_type_for_tagging_of_yojson = 
  fun (tree: t) path : resource_type_for_tagging -> match tree with 
    | `String "Association" -> ASSOCIATION
    | `String "Automation" -> AUTOMATION
    | `String "OpsMetadata" -> OPSMETADATA
    | `String "OpsItem" -> OPS_ITEM
    | `String "PatchBaseline" -> PATCH_BASELINE
    | `String "Parameter" -> PARAMETER
    | `String "MaintenanceWindow" -> MAINTENANCE_WINDOW
    | `String "ManagedInstance" -> MANAGED_INSTANCE
    | `String "Document" -> DOCUMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceTypeForTagging" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceTypeForTagging")

let resource_type_of_yojson = 
  fun (tree: t) path : resource_type -> match tree with 
    | `String "EC2Instance" -> EC2_INSTANCE
    | `String "ManagedInstance" -> MANAGED_INSTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")

let resource_policy_parameter_names_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let resource_policy_not_found_exception_of_yojson = 
  fun tree path : resource_policy_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_policy_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let resource_policy_max_results_of_yojson = int_of_yojson

let resource_policy_limit_exceeded_exception_of_yojson = 
  fun tree path : resource_policy_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_policy_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    limit_type = option_of_yojson (value_for_key (string__of_yojson) "LimitType") _list path;
    limit = option_of_yojson (value_for_key (integer__of_yojson) "Limit") _list path;
    
  }
  in _res

let resource_policy_invalid_parameter_exception_of_yojson = 
  fun tree path : resource_policy_invalid_parameter_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_policy_invalid_parameter_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    parameter_names = option_of_yojson (value_for_key (resource_policy_parameter_names_list_of_yojson) "ParameterNames") _list path;
    
  }
  in _res

let resource_policy_conflict_exception_of_yojson = 
  fun tree path : resource_policy_conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_policy_conflict_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let resource_not_found_exception_of_yojson = 
  fun tree path : resource_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let resource_limit_exceeded_exception_of_yojson = 
  fun tree path : resource_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let resource_in_use_exception_of_yojson = 
  fun tree path : resource_in_use_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_in_use_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let resource_id_of_yojson = string_of_yojson

let resource_data_sync_state_of_yojson = string_of_yojson

let resource_data_sync_source_with_state_of_yojson = 
  fun tree path : resource_data_sync_source_with_state ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_source_with_state = {
    enable_all_ops_data_sources = option_of_yojson (value_for_key (resource_data_sync_enable_all_ops_data_sources_of_yojson) "EnableAllOpsDataSources") _list path;
    state = option_of_yojson (value_for_key (resource_data_sync_state_of_yojson) "State") _list path;
    include_future_regions = option_of_yojson (value_for_key (resource_data_sync_include_future_regions_of_yojson) "IncludeFutureRegions") _list path;
    source_regions = option_of_yojson (value_for_key (resource_data_sync_source_region_list_of_yojson) "SourceRegions") _list path;
    aws_organizations_source = option_of_yojson (value_for_key (resource_data_sync_aws_organizations_source_of_yojson) "AwsOrganizationsSource") _list path;
    source_type = option_of_yojson (value_for_key (resource_data_sync_source_type_of_yojson) "SourceType") _list path;
    
  }
  in _res

let resource_data_sync_s3_region_of_yojson = string_of_yojson

let resource_data_sync_s3_prefix_of_yojson = string_of_yojson

let resource_data_sync_s3_format_of_yojson = 
  fun (tree: t) path : resource_data_sync_s3_format -> match tree with 
    | `String "JsonSerDe" -> JSON_SERDE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceDataSyncS3Format" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceDataSyncS3Format")

let resource_data_sync_s3_bucket_name_of_yojson = string_of_yojson

let resource_data_sync_awskms_key_ar_n_of_yojson = string_of_yojson

let resource_data_sync_destination_data_sharing_type_of_yojson = 
  string_of_yojson

let resource_data_sync_destination_data_sharing_of_yojson = 
  fun tree path : resource_data_sync_destination_data_sharing ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_destination_data_sharing = {
    destination_data_sharing_type = option_of_yojson (value_for_key (resource_data_sync_destination_data_sharing_type_of_yojson) "DestinationDataSharingType") _list path;
    
  }
  in _res

let resource_data_sync_s3_destination_of_yojson = 
  fun tree path : resource_data_sync_s3_destination ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_s3_destination = {
    destination_data_sharing = option_of_yojson (value_for_key (resource_data_sync_destination_data_sharing_of_yojson) "DestinationDataSharing") _list path;
    awskms_key_ar_n = option_of_yojson (value_for_key (resource_data_sync_awskms_key_ar_n_of_yojson) "AWSKMSKeyARN") _list path;
    region = value_for_key (resource_data_sync_s3_region_of_yojson) "Region" _list path;
    sync_format = value_for_key (resource_data_sync_s3_format_of_yojson) "SyncFormat" _list path;
    prefix = option_of_yojson (value_for_key (resource_data_sync_s3_prefix_of_yojson) "Prefix") _list path;
    bucket_name = value_for_key (resource_data_sync_s3_bucket_name_of_yojson) "BucketName" _list path;
    
  }
  in _res

let resource_data_sync_last_modified_time_of_yojson = timestamp_of_yojson

let last_resource_data_sync_time_of_yojson = timestamp_of_yojson

let last_successful_resource_data_sync_time_of_yojson = 
  timestamp_of_yojson

let last_resource_data_sync_status_of_yojson = 
  fun (tree: t) path : last_resource_data_sync_status -> match tree with 
    | `String "InProgress" -> INPROGRESS
    | `String "Failed" -> FAILED
    | `String "Successful" -> SUCCESSFUL
    | `String value -> raise (deserialize_unknown_enum_value_error path "LastResourceDataSyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LastResourceDataSyncStatus")

let resource_data_sync_created_time_of_yojson = timestamp_of_yojson

let last_resource_data_sync_message_of_yojson = string_of_yojson

let resource_data_sync_item_of_yojson = 
  fun tree path : resource_data_sync_item ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_item = {
    last_sync_status_message = option_of_yojson (value_for_key (last_resource_data_sync_message_of_yojson) "LastSyncStatusMessage") _list path;
    sync_created_time = option_of_yojson (value_for_key (resource_data_sync_created_time_of_yojson) "SyncCreatedTime") _list path;
    last_status = option_of_yojson (value_for_key (last_resource_data_sync_status_of_yojson) "LastStatus") _list path;
    sync_last_modified_time = option_of_yojson (value_for_key (resource_data_sync_last_modified_time_of_yojson) "SyncLastModifiedTime") _list path;
    last_successful_sync_time = option_of_yojson (value_for_key (last_successful_resource_data_sync_time_of_yojson) "LastSuccessfulSyncTime") _list path;
    last_sync_time = option_of_yojson (value_for_key (last_resource_data_sync_time_of_yojson) "LastSyncTime") _list path;
    s3_destination = option_of_yojson (value_for_key (resource_data_sync_s3_destination_of_yojson) "S3Destination") _list path;
    sync_source = option_of_yojson (value_for_key (resource_data_sync_source_with_state_of_yojson) "SyncSource") _list path;
    sync_type = option_of_yojson (value_for_key (resource_data_sync_type_of_yojson) "SyncType") _list path;
    sync_name = option_of_yojson (value_for_key (resource_data_sync_name_of_yojson) "SyncName") _list path;
    
  }
  in _res

let resource_data_sync_item_list_of_yojson = 
  fun tree path -> list_of_yojson resource_data_sync_item_of_yojson tree path 

let resource_data_sync_count_exceeded_exception_of_yojson = 
  fun tree path : resource_data_sync_count_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_count_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let resource_data_sync_already_exists_exception_of_yojson = 
  fun tree path : resource_data_sync_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_data_sync_already_exists_exception = {
    sync_name = option_of_yojson (value_for_key (resource_data_sync_name_of_yojson) "SyncName") _list path;
    
  }
  in _res

let resource_count_by_status_of_yojson = string_of_yojson

let resource_count_of_yojson = int_of_yojson

let compliance_type_name_of_yojson = string_of_yojson

let compliance_resource_type_of_yojson = string_of_yojson

let compliance_resource_id_of_yojson = string_of_yojson

let compliance_status_of_yojson = 
  fun (tree: t) path : compliance_status -> match tree with 
    | `String "NON_COMPLIANT" -> NonCompliant
    | `String "COMPLIANT" -> Compliant
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComplianceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ComplianceStatus")

let compliance_severity_of_yojson = 
  fun (tree: t) path : compliance_severity -> match tree with 
    | `String "UNSPECIFIED" -> Unspecified
    | `String "INFORMATIONAL" -> Informational
    | `String "LOW" -> Low
    | `String "MEDIUM" -> Medium
    | `String "HIGH" -> High
    | `String "CRITICAL" -> Critical
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComplianceSeverity" value)
    | _ -> raise (deserialize_wrong_type_error path "ComplianceSeverity")

let compliance_execution_id_of_yojson = string_of_yojson

let compliance_execution_type_of_yojson = string_of_yojson

let compliance_execution_summary_of_yojson = 
  fun tree path : compliance_execution_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_execution_summary = {
    execution_type = option_of_yojson (value_for_key (compliance_execution_type_of_yojson) "ExecutionType") _list path;
    execution_id = option_of_yojson (value_for_key (compliance_execution_id_of_yojson) "ExecutionId") _list path;
    execution_time = value_for_key (date_time_of_yojson) "ExecutionTime" _list path;
    
  }
  in _res

let compliant_summary_of_yojson = 
  fun tree path : compliant_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : compliant_summary = {
    severity_summary = option_of_yojson (value_for_key (severity_summary_of_yojson) "SeveritySummary") _list path;
    compliant_count = option_of_yojson (value_for_key (compliance_summary_count_of_yojson) "CompliantCount") _list path;
    
  }
  in _res

let non_compliant_summary_of_yojson = 
  fun tree path : non_compliant_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : non_compliant_summary = {
    severity_summary = option_of_yojson (value_for_key (severity_summary_of_yojson) "SeveritySummary") _list path;
    non_compliant_count = option_of_yojson (value_for_key (compliance_summary_count_of_yojson) "NonCompliantCount") _list path;
    
  }
  in _res

let resource_compliance_summary_item_of_yojson = 
  fun tree path : resource_compliance_summary_item ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_compliance_summary_item = {
    non_compliant_summary = option_of_yojson (value_for_key (non_compliant_summary_of_yojson) "NonCompliantSummary") _list path;
    compliant_summary = option_of_yojson (value_for_key (compliant_summary_of_yojson) "CompliantSummary") _list path;
    execution_summary = option_of_yojson (value_for_key (compliance_execution_summary_of_yojson) "ExecutionSummary") _list path;
    overall_severity = option_of_yojson (value_for_key (compliance_severity_of_yojson) "OverallSeverity") _list path;
    status = option_of_yojson (value_for_key (compliance_status_of_yojson) "Status") _list path;
    resource_id = option_of_yojson (value_for_key (compliance_resource_id_of_yojson) "ResourceId") _list path;
    resource_type = option_of_yojson (value_for_key (compliance_resource_type_of_yojson) "ResourceType") _list path;
    compliance_type = option_of_yojson (value_for_key (compliance_type_name_of_yojson) "ComplianceType") _list path;
    
  }
  in _res

let resource_compliance_summary_item_list_of_yojson = 
  fun tree path -> list_of_yojson resource_compliance_summary_item_of_yojson tree path 

let resource_arn_string_of_yojson = string_of_yojson

let resolved_targets_of_yojson = 
  fun tree path : resolved_targets ->
  let _list = assoc_of_yojson tree path in
  let _res : resolved_targets = {
    truncated = option_of_yojson (value_for_key (boolean__of_yojson) "Truncated") _list path;
    parameter_values = option_of_yojson (value_for_key (target_parameter_list_of_yojson) "ParameterValues") _list path;
    
  }
  in _res

let reset_service_setting_result_of_yojson = 
  fun tree path : reset_service_setting_result ->
  let _list = assoc_of_yojson tree path in
  let _res : reset_service_setting_result = {
    service_setting = option_of_yojson (value_for_key (service_setting_of_yojson) "ServiceSetting") _list path;
    
  }
  in _res

let reset_service_setting_request_of_yojson = 
  fun tree path : reset_service_setting_request ->
  let _list = assoc_of_yojson tree path in
  let _res : reset_service_setting_request = {
    setting_id = value_for_key (service_setting_id_of_yojson) "SettingId" _list path;
    
  }
  in _res

let remove_tags_from_resource_result_of_yojson = 
  fun tree path : remove_tags_from_resource_result ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_tags_from_resource_result = ()
  in _res

let key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let remove_tags_from_resource_request_of_yojson = 
  fun tree path : remove_tags_from_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : remove_tags_from_resource_request = {
    tag_keys = value_for_key (key_list_of_yojson) "TagKeys" _list path;
    resource_id = value_for_key (resource_id_of_yojson) "ResourceId" _list path;
    resource_type = value_for_key (resource_type_for_tagging_of_yojson) "ResourceType" _list path;
    
  }
  in _res

let invalid_resource_type_of_yojson = 
  fun tree path : invalid_resource_type ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_resource_type = ()
  in _res

let invalid_resource_id_of_yojson = 
  fun tree path : invalid_resource_id ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_resource_id = ()
  in _res

let remaining_count_of_yojson = int_of_yojson

let registrations_count_of_yojson = int_of_yojson

let registration_metadata_value_of_yojson = string_of_yojson

let registration_metadata_key_of_yojson = string_of_yojson

let registration_metadata_item_of_yojson = 
  fun tree path : registration_metadata_item ->
  let _list = assoc_of_yojson tree path in
  let _res : registration_metadata_item = {
    value = value_for_key (registration_metadata_value_of_yojson) "Value" _list path;
    key = value_for_key (registration_metadata_key_of_yojson) "Key" _list path;
    
  }
  in _res

let registration_metadata_list_of_yojson = 
  fun tree path -> list_of_yojson registration_metadata_item_of_yojson tree path 

let registration_limit_of_yojson = int_of_yojson

let register_task_with_maintenance_window_result_of_yojson = 
  fun tree path : register_task_with_maintenance_window_result ->
  let _list = assoc_of_yojson tree path in
  let _res : register_task_with_maintenance_window_result = {
    window_task_id = option_of_yojson (value_for_key (maintenance_window_task_id_of_yojson) "WindowTaskId") _list path;
    
  }
  in _res

let maintenance_window_task_type_of_yojson = 
  fun (tree: t) path : maintenance_window_task_type -> match tree with 
    | `String "LAMBDA" -> Lambda
    | `String "STEP_FUNCTIONS" -> StepFunctions
    | `String "AUTOMATION" -> Automation
    | `String "RUN_COMMAND" -> RunCommand
    | `String value -> raise (deserialize_unknown_enum_value_error path "MaintenanceWindowTaskType" value)
    | _ -> raise (deserialize_wrong_type_error path "MaintenanceWindowTaskType")

let client_token_of_yojson = string_of_yojson

let register_task_with_maintenance_window_request_of_yojson = 
  fun tree path : register_task_with_maintenance_window_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_task_with_maintenance_window_request = {
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    cutoff_behavior = option_of_yojson (value_for_key (maintenance_window_task_cutoff_behavior_of_yojson) "CutoffBehavior") _list path;
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "ClientToken") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    logging_info = option_of_yojson (value_for_key (logging_info_of_yojson) "LoggingInfo") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    priority = option_of_yojson (value_for_key (maintenance_window_task_priority_of_yojson) "Priority") _list path;
    task_invocation_parameters = option_of_yojson (value_for_key (maintenance_window_task_invocation_parameters_of_yojson) "TaskInvocationParameters") _list path;
    task_parameters = option_of_yojson (value_for_key (maintenance_window_task_parameters_of_yojson) "TaskParameters") _list path;
    task_type = value_for_key (maintenance_window_task_type_of_yojson) "TaskType" _list path;
    service_role_arn = option_of_yojson (value_for_key (service_role_of_yojson) "ServiceRoleArn") _list path;
    task_arn = value_for_key (maintenance_window_task_arn_of_yojson) "TaskArn" _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let feature_not_available_exception_of_yojson = 
  fun tree path : feature_not_available_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : feature_not_available_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let register_target_with_maintenance_window_result_of_yojson = 
  fun tree path : register_target_with_maintenance_window_result ->
  let _list = assoc_of_yojson tree path in
  let _res : register_target_with_maintenance_window_result = {
    window_target_id = option_of_yojson (value_for_key (maintenance_window_target_id_of_yojson) "WindowTargetId") _list path;
    
  }
  in _res

let maintenance_window_resource_type_of_yojson = 
  fun (tree: t) path : maintenance_window_resource_type -> match tree with 
    | `String "RESOURCE_GROUP" -> ResourceGroup
    | `String "INSTANCE" -> Instance
    | `String value -> raise (deserialize_unknown_enum_value_error path "MaintenanceWindowResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "MaintenanceWindowResourceType")

let register_target_with_maintenance_window_request_of_yojson = 
  fun tree path : register_target_with_maintenance_window_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_target_with_maintenance_window_request = {
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "ClientToken") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    owner_information = option_of_yojson (value_for_key (owner_information_of_yojson) "OwnerInformation") _list path;
    targets = value_for_key (targets_of_yojson) "Targets" _list path;
    resource_type = value_for_key (maintenance_window_resource_type_of_yojson) "ResourceType" _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let patch_group_of_yojson = string_of_yojson

let register_patch_baseline_for_patch_group_result_of_yojson = 
  fun tree path : register_patch_baseline_for_patch_group_result ->
  let _list = assoc_of_yojson tree path in
  let _res : register_patch_baseline_for_patch_group_result = {
    patch_group = option_of_yojson (value_for_key (patch_group_of_yojson) "PatchGroup") _list path;
    baseline_id = option_of_yojson (value_for_key (baseline_id_of_yojson) "BaselineId") _list path;
    
  }
  in _res

let register_patch_baseline_for_patch_group_request_of_yojson = 
  fun tree path : register_patch_baseline_for_patch_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_patch_baseline_for_patch_group_request = {
    patch_group = value_for_key (patch_group_of_yojson) "PatchGroup" _list path;
    baseline_id = value_for_key (baseline_id_of_yojson) "BaselineId" _list path;
    
  }
  in _res

let already_exists_exception_of_yojson = 
  fun tree path : already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : already_exists_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let register_default_patch_baseline_result_of_yojson = 
  fun tree path : register_default_patch_baseline_result ->
  let _list = assoc_of_yojson tree path in
  let _res : register_default_patch_baseline_result = {
    baseline_id = option_of_yojson (value_for_key (baseline_id_of_yojson) "BaselineId") _list path;
    
  }
  in _res

let register_default_patch_baseline_request_of_yojson = 
  fun tree path : register_default_patch_baseline_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_default_patch_baseline_request = {
    baseline_id = value_for_key (baseline_id_of_yojson) "BaselineId" _list path;
    
  }
  in _res

let reboot_option_of_yojson = 
  fun (tree: t) path : reboot_option -> match tree with 
    | `String "NoReboot" -> NO_REBOOT
    | `String "RebootIfNeeded" -> REBOOT_IF_NEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RebootOption" value)
    | _ -> raise (deserialize_wrong_type_error path "RebootOption")

let policy_id_of_yojson = string_of_yojson

let policy_hash_of_yojson = string_of_yojson

let put_resource_policy_response_of_yojson = 
  fun tree path : put_resource_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : put_resource_policy_response = {
    policy_hash = option_of_yojson (value_for_key (policy_hash_of_yojson) "PolicyHash") _list path;
    policy_id = option_of_yojson (value_for_key (policy_id_of_yojson) "PolicyId") _list path;
    
  }
  in _res

let policy_of_yojson = string_of_yojson

let put_resource_policy_request_of_yojson = 
  fun tree path : put_resource_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_resource_policy_request = {
    policy_hash = option_of_yojson (value_for_key (policy_hash_of_yojson) "PolicyHash") _list path;
    policy_id = option_of_yojson (value_for_key (policy_id_of_yojson) "PolicyId") _list path;
    policy = value_for_key (policy_of_yojson) "Policy" _list path;
    resource_arn = value_for_key (resource_arn_string_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let malformed_resource_policy_document_exception_of_yojson = 
  fun tree path : malformed_resource_policy_document_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : malformed_resource_policy_document_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let parameter_tier_of_yojson = 
  fun (tree: t) path : parameter_tier -> match tree with 
    | `String "Intelligent-Tiering" -> INTELLIGENT_TIERING
    | `String "Advanced" -> ADVANCED
    | `String "Standard" -> STANDARD
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParameterTier" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterTier")

let put_parameter_result_of_yojson = 
  fun tree path : put_parameter_result ->
  let _list = assoc_of_yojson tree path in
  let _res : put_parameter_result = {
    tier = option_of_yojson (value_for_key (parameter_tier_of_yojson) "Tier") _list path;
    version = option_of_yojson (value_for_key (ps_parameter_version_of_yojson) "Version") _list path;
    
  }
  in _res

let parameter_description_of_yojson = string_of_yojson

let ps_parameter_value_of_yojson = string_of_yojson

let parameter_type_of_yojson = 
  fun (tree: t) path : parameter_type -> match tree with 
    | `String "SecureString" -> SECURE_STRING
    | `String "StringList" -> STRING_LIST
    | `String "String" -> STRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParameterType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParameterType")

let parameter_key_id_of_yojson = string_of_yojson

let allowed_pattern_of_yojson = string_of_yojson

let parameter_policies_of_yojson = string_of_yojson

let parameter_data_type_of_yojson = string_of_yojson

let put_parameter_request_of_yojson = 
  fun tree path : put_parameter_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_parameter_request = {
    data_type = option_of_yojson (value_for_key (parameter_data_type_of_yojson) "DataType") _list path;
    policies = option_of_yojson (value_for_key (parameter_policies_of_yojson) "Policies") _list path;
    tier = option_of_yojson (value_for_key (parameter_tier_of_yojson) "Tier") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    allowed_pattern = option_of_yojson (value_for_key (allowed_pattern_of_yojson) "AllowedPattern") _list path;
    overwrite = option_of_yojson (value_for_key (boolean__of_yojson) "Overwrite") _list path;
    key_id = option_of_yojson (value_for_key (parameter_key_id_of_yojson) "KeyId") _list path;
    type_ = option_of_yojson (value_for_key (parameter_type_of_yojson) "Type") _list path;
    value = value_for_key (ps_parameter_value_of_yojson) "Value" _list path;
    description = option_of_yojson (value_for_key (parameter_description_of_yojson) "Description") _list path;
    name = value_for_key (ps_parameter_name_of_yojson) "Name" _list path;
    
  }
  in _res

let policies_limit_exceeded_exception_of_yojson = 
  fun tree path : policies_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : policies_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let parameter_pattern_mismatch_exception_of_yojson = 
  fun tree path : parameter_pattern_mismatch_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_pattern_mismatch_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let parameter_max_version_limit_exceeded_of_yojson = 
  fun tree path : parameter_max_version_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_max_version_limit_exceeded = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let parameter_limit_exceeded_of_yojson = 
  fun tree path : parameter_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_limit_exceeded = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let parameter_already_exists_of_yojson = 
  fun tree path : parameter_already_exists ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_already_exists = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let invalid_policy_type_exception_of_yojson = 
  fun tree path : invalid_policy_type_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_policy_type_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let invalid_policy_attribute_exception_of_yojson = 
  fun tree path : invalid_policy_attribute_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_policy_attribute_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let invalid_key_id_of_yojson = 
  fun tree path : invalid_key_id ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_key_id = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let invalid_allowed_pattern_exception_of_yojson = 
  fun tree path : invalid_allowed_pattern_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_allowed_pattern_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let incompatible_policy_exception_of_yojson = 
  fun tree path : incompatible_policy_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : incompatible_policy_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let hierarchy_type_mismatch_exception_of_yojson = 
  fun tree path : hierarchy_type_mismatch_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : hierarchy_type_mismatch_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let hierarchy_level_limit_exceeded_exception_of_yojson = 
  fun tree path : hierarchy_level_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : hierarchy_level_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let put_inventory_message_of_yojson = string_of_yojson

let put_inventory_result_of_yojson = 
  fun tree path : put_inventory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : put_inventory_result = {
    message = option_of_yojson (value_for_key (put_inventory_message_of_yojson) "Message") _list path;
    
  }
  in _res

let inventory_item_schema_version_of_yojson = string_of_yojson

let inventory_item_capture_time_of_yojson = string_of_yojson

let inventory_item_content_hash_of_yojson = string_of_yojson

let attribute_value_of_yojson = string_of_yojson

let attribute_name_of_yojson = string_of_yojson

let inventory_item_entry_of_yojson = 
  fun tree path -> map_of_yojson attribute_value_of_yojson tree path

let inventory_item_entry_list_of_yojson = 
  fun tree path -> list_of_yojson inventory_item_entry_of_yojson tree path 

let inventory_item_content_context_of_yojson = 
  fun tree path -> map_of_yojson attribute_value_of_yojson tree path

let inventory_item_of_yojson = 
  fun tree path : inventory_item ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_item = {
    context = option_of_yojson (value_for_key (inventory_item_content_context_of_yojson) "Context") _list path;
    content = option_of_yojson (value_for_key (inventory_item_entry_list_of_yojson) "Content") _list path;
    content_hash = option_of_yojson (value_for_key (inventory_item_content_hash_of_yojson) "ContentHash") _list path;
    capture_time = value_for_key (inventory_item_capture_time_of_yojson) "CaptureTime" _list path;
    schema_version = value_for_key (inventory_item_schema_version_of_yojson) "SchemaVersion" _list path;
    type_name = value_for_key (inventory_item_type_name_of_yojson) "TypeName" _list path;
    
  }
  in _res

let inventory_item_list_of_yojson = 
  fun tree path -> list_of_yojson inventory_item_of_yojson tree path 

let put_inventory_request_of_yojson = 
  fun tree path : put_inventory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_inventory_request = {
    items = value_for_key (inventory_item_list_of_yojson) "Items" _list path;
    instance_id = value_for_key (instance_id_of_yojson) "InstanceId" _list path;
    
  }
  in _res

let item_size_limit_exceeded_exception_of_yojson = 
  fun tree path : item_size_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : item_size_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    type_name = option_of_yojson (value_for_key (inventory_item_type_name_of_yojson) "TypeName") _list path;
    
  }
  in _res

let item_content_mismatch_exception_of_yojson = 
  fun tree path : item_content_mismatch_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : item_content_mismatch_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    type_name = option_of_yojson (value_for_key (inventory_item_type_name_of_yojson) "TypeName") _list path;
    
  }
  in _res

let invalid_type_name_exception_of_yojson = 
  fun tree path : invalid_type_name_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_type_name_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_item_content_exception_of_yojson = 
  fun tree path : invalid_item_content_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_item_content_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    type_name = option_of_yojson (value_for_key (inventory_item_type_name_of_yojson) "TypeName") _list path;
    
  }
  in _res

let invalid_inventory_item_context_exception_of_yojson = 
  fun tree path : invalid_inventory_item_context_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_inventory_item_context_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let custom_schema_count_limit_exceeded_exception_of_yojson = 
  fun tree path : custom_schema_count_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : custom_schema_count_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let put_compliance_items_result_of_yojson = 
  fun tree path : put_compliance_items_result ->
  let _list = assoc_of_yojson tree path in
  let _res : put_compliance_items_result = ()
  in _res

let compliance_item_id_of_yojson = string_of_yojson

let compliance_item_title_of_yojson = string_of_yojson

let compliance_item_details_of_yojson = 
  fun tree path -> map_of_yojson attribute_value_of_yojson tree path

let compliance_item_entry_of_yojson = 
  fun tree path : compliance_item_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_item_entry = {
    details = option_of_yojson (value_for_key (compliance_item_details_of_yojson) "Details") _list path;
    status = value_for_key (compliance_status_of_yojson) "Status" _list path;
    severity = value_for_key (compliance_severity_of_yojson) "Severity" _list path;
    title = option_of_yojson (value_for_key (compliance_item_title_of_yojson) "Title") _list path;
    id = option_of_yojson (value_for_key (compliance_item_id_of_yojson) "Id") _list path;
    
  }
  in _res

let compliance_item_entry_list_of_yojson = 
  fun tree path -> list_of_yojson compliance_item_entry_of_yojson tree path 

let compliance_item_content_hash_of_yojson = string_of_yojson

let compliance_upload_type_of_yojson = 
  fun (tree: t) path : compliance_upload_type -> match tree with 
    | `String "PARTIAL" -> Partial
    | `String "COMPLETE" -> Complete
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComplianceUploadType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComplianceUploadType")

let put_compliance_items_request_of_yojson = 
  fun tree path : put_compliance_items_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_compliance_items_request = {
    upload_type = option_of_yojson (value_for_key (compliance_upload_type_of_yojson) "UploadType") _list path;
    item_content_hash = option_of_yojson (value_for_key (compliance_item_content_hash_of_yojson) "ItemContentHash") _list path;
    items = value_for_key (compliance_item_entry_list_of_yojson) "Items" _list path;
    execution_summary = value_for_key (compliance_execution_summary_of_yojson) "ExecutionSummary" _list path;
    compliance_type = value_for_key (compliance_type_name_of_yojson) "ComplianceType" _list path;
    resource_type = value_for_key (compliance_resource_type_of_yojson) "ResourceType" _list path;
    resource_id = value_for_key (compliance_resource_id_of_yojson) "ResourceId" _list path;
    
  }
  in _res

let compliance_type_count_limit_exceeded_exception_of_yojson = 
  fun tree path : compliance_type_count_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_type_count_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let progress_counters_of_yojson = 
  fun tree path : progress_counters ->
  let _list = assoc_of_yojson tree path in
  let _res : progress_counters = {
    timed_out_steps = option_of_yojson (value_for_key (integer__of_yojson) "TimedOutSteps") _list path;
    cancelled_steps = option_of_yojson (value_for_key (integer__of_yojson) "CancelledSteps") _list path;
    failed_steps = option_of_yojson (value_for_key (integer__of_yojson) "FailedSteps") _list path;
    success_steps = option_of_yojson (value_for_key (integer__of_yojson) "SuccessSteps") _list path;
    total_steps = option_of_yojson (value_for_key (integer__of_yojson) "TotalSteps") _list path;
    
  }
  in _res

let product_of_yojson = string_of_yojson

let platform_version_of_yojson = string_of_yojson

let platform_name_of_yojson = string_of_yojson

let ping_status_of_yojson = 
  fun (tree: t) path : ping_status -> match tree with 
    | `String "Inactive" -> INACTIVE
    | `String "ConnectionLost" -> CONNECTION_LOST
    | `String "Online" -> ONLINE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PingStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PingStatus")

let patch_version_of_yojson = string_of_yojson

let patch_vendor_of_yojson = string_of_yojson

let patch_unreported_not_applicable_count_of_yojson = int_of_yojson

let patch_title_of_yojson = string_of_yojson

let patch_deployment_status_of_yojson = 
  fun (tree: t) path : patch_deployment_status -> match tree with 
    | `String "EXPLICIT_REJECTED" -> ExplicitRejected
    | `String "EXPLICIT_APPROVED" -> ExplicitApproved
    | `String "PENDING_APPROVAL" -> PendingApproval
    | `String "APPROVED" -> Approved
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchDeploymentStatus")

let patch_status_of_yojson = 
  fun tree path : patch_status ->
  let _list = assoc_of_yojson tree path in
  let _res : patch_status = {
    approval_date = option_of_yojson (value_for_key (date_time_of_yojson) "ApprovalDate") _list path;
    compliance_level = option_of_yojson (value_for_key (patch_compliance_level_of_yojson) "ComplianceLevel") _list path;
    deployment_status = option_of_yojson (value_for_key (patch_deployment_status_of_yojson) "DeploymentStatus") _list path;
    
  }
  in _res

let patch_severity_of_yojson = string_of_yojson

let patch_set_of_yojson = 
  fun (tree: t) path : patch_set -> match tree with 
    | `String "APPLICATION" -> Application
    | `String "OS" -> Os
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchSet" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchSet")

let patch_security_non_compliant_count_of_yojson = int_of_yojson

let patch_repository_of_yojson = string_of_yojson

let patch_release_of_yojson = string_of_yojson

let patch_property_entry_of_yojson = 
  fun tree path -> map_of_yojson attribute_value_of_yojson tree path

let patch_property_of_yojson = 
  fun (tree: t) path : patch_property -> match tree with 
    | `String "SEVERITY" -> PatchSeverity
    | `String "PRIORITY" -> PatchPriority
    | `String "MSRC_SEVERITY" -> PatchMsrcSeverity
    | `String "CLASSIFICATION" -> PatchClassification
    | `String "PRODUCT_FAMILY" -> PatchProductFamily
    | `String "PRODUCT" -> Product
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchProperty" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchProperty")

let patch_properties_list_of_yojson = 
  fun tree path -> list_of_yojson patch_property_entry_of_yojson tree path 

let patch_product_family_of_yojson = string_of_yojson

let patch_product_of_yojson = string_of_yojson

let patch_other_non_compliant_count_of_yojson = int_of_yojson

let patch_orchestrator_filter_value_of_yojson = string_of_yojson

let patch_orchestrator_filter_values_of_yojson = 
  fun tree path -> list_of_yojson patch_orchestrator_filter_value_of_yojson tree path 

let patch_orchestrator_filter_key_of_yojson = string_of_yojson

let patch_orchestrator_filter_of_yojson = 
  fun tree path : patch_orchestrator_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : patch_orchestrator_filter = {
    values = option_of_yojson (value_for_key (patch_orchestrator_filter_values_of_yojson) "Values") _list path;
    key = option_of_yojson (value_for_key (patch_orchestrator_filter_key_of_yojson) "Key") _list path;
    
  }
  in _res

let patch_orchestrator_filter_list_of_yojson = 
  fun tree path -> list_of_yojson patch_orchestrator_filter_of_yojson tree path 

let patch_operation_type_of_yojson = 
  fun (tree: t) path : patch_operation_type -> match tree with 
    | `String "Install" -> INSTALL
    | `String "Scan" -> SCAN
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchOperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchOperationType")

let patch_not_applicable_count_of_yojson = int_of_yojson

let patch_name_of_yojson = string_of_yojson

let patch_msrc_severity_of_yojson = string_of_yojson

let patch_msrc_number_of_yojson = string_of_yojson

let patch_missing_count_of_yojson = int_of_yojson

let patch_description_of_yojson = string_of_yojson

let patch_content_url_of_yojson = string_of_yojson

let patch_classification_of_yojson = string_of_yojson

let patch_kb_number_of_yojson = string_of_yojson

let patch_language_of_yojson = string_of_yojson

let patch_advisory_id_of_yojson = string_of_yojson

let patch_advisory_id_list_of_yojson = 
  fun tree path -> list_of_yojson patch_advisory_id_of_yojson tree path 

let patch_bugzilla_id_of_yojson = string_of_yojson

let patch_bugzilla_id_list_of_yojson = 
  fun tree path -> list_of_yojson patch_bugzilla_id_of_yojson tree path 

let patch_cve_id_of_yojson = string_of_yojson

let patch_cve_id_list_of_yojson = 
  fun tree path -> list_of_yojson patch_cve_id_of_yojson tree path 

let patch_epoch_of_yojson = int_of_yojson

let patch_arch_of_yojson = string_of_yojson

let patch_of_yojson = 
  fun tree path : patch ->
  let _list = assoc_of_yojson tree path in
  let _res : patch = {
    repository = option_of_yojson (value_for_key (patch_repository_of_yojson) "Repository") _list path;
    severity = option_of_yojson (value_for_key (patch_severity_of_yojson) "Severity") _list path;
    arch = option_of_yojson (value_for_key (patch_arch_of_yojson) "Arch") _list path;
    release = option_of_yojson (value_for_key (patch_release_of_yojson) "Release") _list path;
    version = option_of_yojson (value_for_key (patch_version_of_yojson) "Version") _list path;
    epoch = option_of_yojson (value_for_key (patch_epoch_of_yojson) "Epoch") _list path;
    name = option_of_yojson (value_for_key (patch_name_of_yojson) "Name") _list path;
    cve_ids = option_of_yojson (value_for_key (patch_cve_id_list_of_yojson) "CVEIds") _list path;
    bugzilla_ids = option_of_yojson (value_for_key (patch_bugzilla_id_list_of_yojson) "BugzillaIds") _list path;
    advisory_ids = option_of_yojson (value_for_key (patch_advisory_id_list_of_yojson) "AdvisoryIds") _list path;
    language = option_of_yojson (value_for_key (patch_language_of_yojson) "Language") _list path;
    msrc_number = option_of_yojson (value_for_key (patch_msrc_number_of_yojson) "MsrcNumber") _list path;
    kb_number = option_of_yojson (value_for_key (patch_kb_number_of_yojson) "KbNumber") _list path;
    msrc_severity = option_of_yojson (value_for_key (patch_msrc_severity_of_yojson) "MsrcSeverity") _list path;
    classification = option_of_yojson (value_for_key (patch_classification_of_yojson) "Classification") _list path;
    product = option_of_yojson (value_for_key (patch_product_of_yojson) "Product") _list path;
    product_family = option_of_yojson (value_for_key (patch_product_family_of_yojson) "ProductFamily") _list path;
    vendor = option_of_yojson (value_for_key (patch_vendor_of_yojson) "Vendor") _list path;
    content_url = option_of_yojson (value_for_key (patch_content_url_of_yojson) "ContentUrl") _list path;
    description = option_of_yojson (value_for_key (patch_description_of_yojson) "Description") _list path;
    title = option_of_yojson (value_for_key (patch_title_of_yojson) "Title") _list path;
    release_date = option_of_yojson (value_for_key (date_time_of_yojson) "ReleaseDate") _list path;
    id = option_of_yojson (value_for_key (patch_id_of_yojson) "Id") _list path;
    
  }
  in _res

let patch_list_of_yojson = 
  fun tree path -> list_of_yojson patch_of_yojson tree path 

let patch_installed_rejected_count_of_yojson = int_of_yojson

let patch_installed_pending_reboot_count_of_yojson = int_of_yojson

let patch_installed_other_count_of_yojson = int_of_yojson

let patch_installed_count_of_yojson = int_of_yojson

let default_baseline_of_yojson = bool_of_yojson

let patch_baseline_identity_of_yojson = 
  fun tree path : patch_baseline_identity ->
  let _list = assoc_of_yojson tree path in
  let _res : patch_baseline_identity = {
    default_baseline = option_of_yojson (value_for_key (default_baseline_of_yojson) "DefaultBaseline") _list path;
    baseline_description = option_of_yojson (value_for_key (baseline_description_of_yojson) "BaselineDescription") _list path;
    operating_system = option_of_yojson (value_for_key (operating_system_of_yojson) "OperatingSystem") _list path;
    baseline_name = option_of_yojson (value_for_key (baseline_name_of_yojson) "BaselineName") _list path;
    baseline_id = option_of_yojson (value_for_key (baseline_id_of_yojson) "BaselineId") _list path;
    
  }
  in _res

let patch_group_patch_baseline_mapping_of_yojson = 
  fun tree path : patch_group_patch_baseline_mapping ->
  let _list = assoc_of_yojson tree path in
  let _res : patch_group_patch_baseline_mapping = {
    baseline_identity = option_of_yojson (value_for_key (patch_baseline_identity_of_yojson) "BaselineIdentity") _list path;
    patch_group = option_of_yojson (value_for_key (patch_group_of_yojson) "PatchGroup") _list path;
    
  }
  in _res

let patch_group_patch_baseline_mapping_list_of_yojson = 
  fun tree path -> list_of_yojson patch_group_patch_baseline_mapping_of_yojson tree path 

let patch_group_list_of_yojson = 
  fun tree path -> list_of_yojson patch_group_of_yojson tree path 

let patch_failed_count_of_yojson = int_of_yojson

let patch_critical_non_compliant_count_of_yojson = int_of_yojson

let patch_compliance_max_results_of_yojson = int_of_yojson

let patch_compliance_data_state_of_yojson = 
  fun (tree: t) path : patch_compliance_data_state -> match tree with 
    | `String "FAILED" -> Failed
    | `String "NOT_APPLICABLE" -> NotApplicable
    | `String "MISSING" -> Missing
    | `String "INSTALLED_REJECTED" -> InstalledRejected
    | `String "INSTALLED_PENDING_REBOOT" -> InstalledPendingReboot
    | `String "INSTALLED_OTHER" -> InstalledOther
    | `String "INSTALLED" -> Installed
    | `String value -> raise (deserialize_unknown_enum_value_error path "PatchComplianceDataState" value)
    | _ -> raise (deserialize_wrong_type_error path "PatchComplianceDataState")

let patch_cve_ids_of_yojson = string_of_yojson

let patch_compliance_data_of_yojson = 
  fun tree path : patch_compliance_data ->
  let _list = assoc_of_yojson tree path in
  let _res : patch_compliance_data = {
    cve_ids = option_of_yojson (value_for_key (patch_cve_ids_of_yojson) "CVEIds") _list path;
    installed_time = value_for_key (date_time_of_yojson) "InstalledTime" _list path;
    state = value_for_key (patch_compliance_data_state_of_yojson) "State" _list path;
    severity = value_for_key (patch_severity_of_yojson) "Severity" _list path;
    classification = value_for_key (patch_classification_of_yojson) "Classification" _list path;
    kb_id = value_for_key (patch_kb_number_of_yojson) "KBId" _list path;
    title = value_for_key (patch_title_of_yojson) "Title" _list path;
    
  }
  in _res

let patch_compliance_data_list_of_yojson = 
  fun tree path -> list_of_yojson patch_compliance_data_of_yojson tree path 

let patch_baseline_max_results_of_yojson = int_of_yojson

let patch_baseline_identity_list_of_yojson = 
  fun tree path -> list_of_yojson patch_baseline_identity_of_yojson tree path 

let parameters_filter_value_of_yojson = string_of_yojson

let parameters_filter_value_list_of_yojson = 
  fun tree path -> list_of_yojson parameters_filter_value_of_yojson tree path 

let parameters_filter_key_of_yojson = 
  fun (tree: t) path : parameters_filter_key -> match tree with 
    | `String "KeyId" -> KEY_ID
    | `String "Type" -> TYPE
    | `String "Name" -> NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParametersFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "ParametersFilterKey")

let parameters_filter_of_yojson = 
  fun tree path : parameters_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : parameters_filter = {
    values = value_for_key (parameters_filter_value_list_of_yojson) "Values" _list path;
    key = value_for_key (parameters_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let parameters_filter_list_of_yojson = 
  fun tree path -> list_of_yojson parameters_filter_of_yojson tree path 

let parameter_version_label_limit_exceeded_of_yojson = 
  fun tree path : parameter_version_label_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_version_label_limit_exceeded = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let parameter_string_query_option_of_yojson = string_of_yojson

let parameter_string_filter_value_of_yojson = string_of_yojson

let parameter_string_filter_value_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_string_filter_value_of_yojson tree path 

let parameter_string_filter_key_of_yojson = string_of_yojson

let parameter_string_filter_of_yojson = 
  fun tree path : parameter_string_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_string_filter = {
    values = option_of_yojson (value_for_key (parameter_string_filter_value_list_of_yojson) "Values") _list path;
    option_ = option_of_yojson (value_for_key (parameter_string_query_option_of_yojson) "Option") _list path;
    key = value_for_key (parameter_string_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let parameter_string_filter_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_string_filter_of_yojson tree path 

let parameter_inline_policy_of_yojson = 
  fun tree path : parameter_inline_policy ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_inline_policy = {
    policy_status = option_of_yojson (value_for_key (string__of_yojson) "PolicyStatus") _list path;
    policy_type = option_of_yojson (value_for_key (string__of_yojson) "PolicyType") _list path;
    policy_text = option_of_yojson (value_for_key (string__of_yojson) "PolicyText") _list path;
    
  }
  in _res

let parameter_policy_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_inline_policy_of_yojson tree path 

let parameter_name_list_of_yojson = 
  fun tree path -> list_of_yojson ps_parameter_name_of_yojson tree path 

let parameter_metadata_of_yojson = 
  fun tree path : parameter_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_metadata = {
    data_type = option_of_yojson (value_for_key (parameter_data_type_of_yojson) "DataType") _list path;
    policies = option_of_yojson (value_for_key (parameter_policy_list_of_yojson) "Policies") _list path;
    tier = option_of_yojson (value_for_key (parameter_tier_of_yojson) "Tier") _list path;
    version = option_of_yojson (value_for_key (ps_parameter_version_of_yojson) "Version") _list path;
    allowed_pattern = option_of_yojson (value_for_key (allowed_pattern_of_yojson) "AllowedPattern") _list path;
    description = option_of_yojson (value_for_key (parameter_description_of_yojson) "Description") _list path;
    last_modified_user = option_of_yojson (value_for_key (string__of_yojson) "LastModifiedUser") _list path;
    last_modified_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedDate") _list path;
    key_id = option_of_yojson (value_for_key (parameter_key_id_of_yojson) "KeyId") _list path;
    type_ = option_of_yojson (value_for_key (parameter_type_of_yojson) "Type") _list path;
    ar_n = option_of_yojson (value_for_key (string__of_yojson) "ARN") _list path;
    name = option_of_yojson (value_for_key (ps_parameter_name_of_yojson) "Name") _list path;
    
  }
  in _res

let parameter_metadata_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_metadata_of_yojson tree path 

let ps_parameter_selector_of_yojson = string_of_yojson

let parameter_of_yojson = 
  fun tree path : parameter ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter = {
    data_type = option_of_yojson (value_for_key (parameter_data_type_of_yojson) "DataType") _list path;
    ar_n = option_of_yojson (value_for_key (string__of_yojson) "ARN") _list path;
    last_modified_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedDate") _list path;
    source_result = option_of_yojson (value_for_key (string__of_yojson) "SourceResult") _list path;
    selector = option_of_yojson (value_for_key (ps_parameter_selector_of_yojson) "Selector") _list path;
    version = option_of_yojson (value_for_key (ps_parameter_version_of_yojson) "Version") _list path;
    value = option_of_yojson (value_for_key (ps_parameter_value_of_yojson) "Value") _list path;
    type_ = option_of_yojson (value_for_key (parameter_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (ps_parameter_name_of_yojson) "Name") _list path;
    
  }
  in _res

let parameter_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_of_yojson tree path 

let parameter_history_of_yojson = 
  fun tree path : parameter_history ->
  let _list = assoc_of_yojson tree path in
  let _res : parameter_history = {
    data_type = option_of_yojson (value_for_key (parameter_data_type_of_yojson) "DataType") _list path;
    policies = option_of_yojson (value_for_key (parameter_policy_list_of_yojson) "Policies") _list path;
    tier = option_of_yojson (value_for_key (parameter_tier_of_yojson) "Tier") _list path;
    labels = option_of_yojson (value_for_key (parameter_label_list_of_yojson) "Labels") _list path;
    version = option_of_yojson (value_for_key (ps_parameter_version_of_yojson) "Version") _list path;
    allowed_pattern = option_of_yojson (value_for_key (allowed_pattern_of_yojson) "AllowedPattern") _list path;
    value = option_of_yojson (value_for_key (ps_parameter_value_of_yojson) "Value") _list path;
    description = option_of_yojson (value_for_key (parameter_description_of_yojson) "Description") _list path;
    last_modified_user = option_of_yojson (value_for_key (string__of_yojson) "LastModifiedUser") _list path;
    last_modified_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedDate") _list path;
    key_id = option_of_yojson (value_for_key (parameter_key_id_of_yojson) "KeyId") _list path;
    type_ = option_of_yojson (value_for_key (parameter_type_of_yojson) "Type") _list path;
    name = option_of_yojson (value_for_key (ps_parameter_name_of_yojson) "Name") _list path;
    
  }
  in _res

let parameter_history_list_of_yojson = 
  fun tree path -> list_of_yojson parameter_history_of_yojson tree path 

let output_source_type_of_yojson = string_of_yojson

let output_source_id_of_yojson = string_of_yojson

let output_source_of_yojson = 
  fun tree path : output_source ->
  let _list = assoc_of_yojson tree path in
  let _res : output_source = {
    output_source_type = option_of_yojson (value_for_key (output_source_type_of_yojson) "OutputSourceType") _list path;
    output_source_id = option_of_yojson (value_for_key (output_source_id_of_yojson) "OutputSourceId") _list path;
    
  }
  in _res

let ops_data_type_name_of_yojson = string_of_yojson

let ops_result_attribute_of_yojson = 
  fun tree path : ops_result_attribute ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_result_attribute = {
    type_name = value_for_key (ops_data_type_name_of_yojson) "TypeName" _list path;
    
  }
  in _res

let ops_result_attribute_list_of_yojson = 
  fun tree path -> list_of_yojson ops_result_attribute_of_yojson tree path 

let ops_metadata_resource_id_of_yojson = string_of_yojson

let ops_metadata_of_yojson = 
  fun tree path : ops_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_metadata = {
    creation_date = option_of_yojson (value_for_key (date_time_of_yojson) "CreationDate") _list path;
    last_modified_user = option_of_yojson (value_for_key (string__of_yojson) "LastModifiedUser") _list path;
    last_modified_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedDate") _list path;
    ops_metadata_arn = option_of_yojson (value_for_key (ops_metadata_arn_of_yojson) "OpsMetadataArn") _list path;
    resource_id = option_of_yojson (value_for_key (ops_metadata_resource_id_of_yojson) "ResourceId") _list path;
    
  }
  in _res

let ops_metadata_list_of_yojson = 
  fun tree path -> list_of_yojson ops_metadata_of_yojson tree path 

let ops_metadata_limit_exceeded_exception_of_yojson = 
  fun tree path : ops_metadata_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_metadata_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let ops_metadata_filter_value_of_yojson = string_of_yojson

let ops_metadata_filter_value_list_of_yojson = 
  fun tree path -> list_of_yojson ops_metadata_filter_value_of_yojson tree path 

let ops_metadata_filter_key_of_yojson = string_of_yojson

let ops_metadata_filter_of_yojson = 
  fun tree path : ops_metadata_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_metadata_filter = {
    values = value_for_key (ops_metadata_filter_value_list_of_yojson) "Values" _list path;
    key = value_for_key (ops_metadata_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let ops_metadata_filter_list_of_yojson = 
  fun tree path -> list_of_yojson ops_metadata_filter_of_yojson tree path 

let ops_metadata_already_exists_exception_of_yojson = 
  fun tree path : ops_metadata_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_metadata_already_exists_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let ops_item_type_of_yojson = string_of_yojson

let ops_item_source_of_yojson = string_of_yojson

let ops_item_summary_of_yojson = 
  fun tree path : ops_item_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_summary = {
    planned_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "PlannedEndTime") _list path;
    planned_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "PlannedStartTime") _list path;
    actual_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "ActualEndTime") _list path;
    actual_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "ActualStartTime") _list path;
    ops_item_type = option_of_yojson (value_for_key (ops_item_type_of_yojson) "OpsItemType") _list path;
    severity = option_of_yojson (value_for_key (ops_item_severity_of_yojson) "Severity") _list path;
    category = option_of_yojson (value_for_key (ops_item_category_of_yojson) "Category") _list path;
    operational_data = option_of_yojson (value_for_key (ops_item_operational_data_of_yojson) "OperationalData") _list path;
    title = option_of_yojson (value_for_key (ops_item_title_of_yojson) "Title") _list path;
    ops_item_id = option_of_yojson (value_for_key (ops_item_id_of_yojson) "OpsItemId") _list path;
    status = option_of_yojson (value_for_key (ops_item_status_of_yojson) "Status") _list path;
    source = option_of_yojson (value_for_key (ops_item_source_of_yojson) "Source") _list path;
    priority = option_of_yojson (value_for_key (ops_item_priority_of_yojson) "Priority") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    last_modified_by = option_of_yojson (value_for_key (string__of_yojson) "LastModifiedBy") _list path;
    created_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedTime") _list path;
    created_by = option_of_yojson (value_for_key (string__of_yojson) "CreatedBy") _list path;
    
  }
  in _res

let ops_item_summaries_of_yojson = 
  fun tree path -> list_of_yojson ops_item_summary_of_yojson tree path 

let ops_item_related_items_max_results_of_yojson = int_of_yojson

let ops_item_related_items_filter_key_of_yojson = 
  fun (tree: t) path : ops_item_related_items_filter_key -> match tree with 
    | `String "ResourceUri" -> RESOURCE_URI
    | `String "AssociationId" -> ASSOCIATION_ID
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemRelatedItemsFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemRelatedItemsFilterKey")

let ops_item_related_items_filter_value_of_yojson = string_of_yojson

let ops_item_related_items_filter_values_of_yojson = 
  fun tree path -> list_of_yojson ops_item_related_items_filter_value_of_yojson tree path 

let ops_item_related_items_filter_operator_of_yojson = 
  fun (tree: t) path : ops_item_related_items_filter_operator -> match tree with 
    | `String "Equal" -> EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemRelatedItemsFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemRelatedItemsFilterOperator")

let ops_item_related_items_filter_of_yojson = 
  fun tree path : ops_item_related_items_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_related_items_filter = {
    operator = value_for_key (ops_item_related_items_filter_operator_of_yojson) "Operator" _list path;
    values = value_for_key (ops_item_related_items_filter_values_of_yojson) "Values" _list path;
    key = value_for_key (ops_item_related_items_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let ops_item_related_items_filters_of_yojson = 
  fun tree path -> list_of_yojson ops_item_related_items_filter_of_yojson tree path 

let ops_item_related_item_association_id_of_yojson = string_of_yojson

let ops_item_related_item_association_resource_type_of_yojson = 
  string_of_yojson

let ops_item_related_item_association_type_of_yojson = string_of_yojson

let ops_item_related_item_association_resource_uri_of_yojson = 
  string_of_yojson

let ops_item_identity_of_yojson = 
  fun tree path : ops_item_identity ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_identity = {
    arn = option_of_yojson (value_for_key (string__of_yojson) "Arn") _list path;
    
  }
  in _res

let ops_item_related_item_summary_of_yojson = 
  fun tree path : ops_item_related_item_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_related_item_summary = {
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    last_modified_by = option_of_yojson (value_for_key (ops_item_identity_of_yojson) "LastModifiedBy") _list path;
    created_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedTime") _list path;
    created_by = option_of_yojson (value_for_key (ops_item_identity_of_yojson) "CreatedBy") _list path;
    resource_uri = option_of_yojson (value_for_key (ops_item_related_item_association_resource_uri_of_yojson) "ResourceUri") _list path;
    association_type = option_of_yojson (value_for_key (ops_item_related_item_association_type_of_yojson) "AssociationType") _list path;
    resource_type = option_of_yojson (value_for_key (ops_item_related_item_association_resource_type_of_yojson) "ResourceType") _list path;
    association_id = option_of_yojson (value_for_key (ops_item_related_item_association_id_of_yojson) "AssociationId") _list path;
    ops_item_id = option_of_yojson (value_for_key (ops_item_id_of_yojson) "OpsItemId") _list path;
    
  }
  in _res

let ops_item_related_item_summaries_of_yojson = 
  fun tree path -> list_of_yojson ops_item_related_item_summary_of_yojson tree path 

let ops_item_related_item_association_not_found_exception_of_yojson = 
  fun tree path : ops_item_related_item_association_not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_related_item_association_not_found_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let ops_item_related_item_already_exists_exception_of_yojson = 
  fun tree path : ops_item_related_item_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_related_item_already_exists_exception = {
    ops_item_id = option_of_yojson (value_for_key (ops_item_id_of_yojson) "OpsItemId") _list path;
    resource_uri = option_of_yojson (value_for_key (ops_item_related_item_association_resource_uri_of_yojson) "ResourceUri") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let ops_item_max_results_of_yojson = int_of_yojson

let ops_item_filter_key_of_yojson = 
  fun (tree: t) path : ops_item_filter_key -> match tree with 
    | `String "AccountId" -> ACCOUNT_ID
    | `String "InsightByType" -> INSIGHT_TYPE
    | `String "ChangeRequestByTargetsResourceGroup" -> CHANGE_REQUEST_TARGETS_RESOURCE_GROUP
    | `String "ChangeRequestByTemplate" -> CHANGE_REQUEST_TEMPLATE
    | `String "ChangeRequestByApproverName" -> CHANGE_REQUEST_APPROVER_NAME
    | `String "ChangeRequestByApproverArn" -> CHANGE_REQUEST_APPROVER_ARN
    | `String "ChangeRequestByRequesterName" -> CHANGE_REQUEST_REQUESTER_NAME
    | `String "ChangeRequestByRequesterArn" -> CHANGE_REQUEST_REQUESTER_ARN
    | `String "OpsItemType" -> OPSITEM_TYPE
    | `String "Severity" -> SEVERITY
    | `String "Category" -> CATEGORY
    | `String "AutomationId" -> AUTOMATION_ID
    | `String "ResourceId" -> RESOURCE_ID
    | `String "OperationalDataValue" -> OPERATIONAL_DATA_VALUE
    | `String "OperationalDataKey" -> OPERATIONAL_DATA_KEY
    | `String "OperationalData" -> OPERATIONAL_DATA
    | `String "PlannedEndTime" -> PLANNED_END_TIME
    | `String "PlannedStartTime" -> PLANNED_START_TIME
    | `String "ActualEndTime" -> ACTUAL_END_TIME
    | `String "ActualStartTime" -> ACTUAL_START_TIME
    | `String "LastModifiedTime" -> LAST_MODIFIED_TIME
    | `String "CreatedTime" -> CREATED_TIME
    | `String "OpsItemId" -> OPSITEM_ID
    | `String "Title" -> TITLE
    | `String "Priority" -> PRIORITY
    | `String "Source" -> SOURCE
    | `String "CreatedBy" -> CREATED_BY
    | `String "Status" -> STATUS
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemFilterKey")

let ops_item_filter_value_of_yojson = string_of_yojson

let ops_item_filter_values_of_yojson = 
  fun tree path -> list_of_yojson ops_item_filter_value_of_yojson tree path 

let ops_item_filter_operator_of_yojson = 
  fun (tree: t) path : ops_item_filter_operator -> match tree with 
    | `String "LessThan" -> LESS_THAN
    | `String "GreaterThan" -> GREATER_THAN
    | `String "Contains" -> CONTAINS
    | `String "Equal" -> EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemFilterOperator")

let ops_item_filter_of_yojson = 
  fun tree path : ops_item_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_filter = {
    operator = value_for_key (ops_item_filter_operator_of_yojson) "Operator" _list path;
    values = value_for_key (ops_item_filter_values_of_yojson) "Values" _list path;
    key = value_for_key (ops_item_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let ops_item_filters_of_yojson = 
  fun tree path -> list_of_yojson ops_item_filter_of_yojson tree path 

let ops_item_event_summary_of_yojson = 
  fun tree path : ops_item_event_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_event_summary = {
    created_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedTime") _list path;
    created_by = option_of_yojson (value_for_key (ops_item_identity_of_yojson) "CreatedBy") _list path;
    detail = option_of_yojson (value_for_key (string__of_yojson) "Detail") _list path;
    detail_type = option_of_yojson (value_for_key (string__of_yojson) "DetailType") _list path;
    source = option_of_yojson (value_for_key (string__of_yojson) "Source") _list path;
    event_id = option_of_yojson (value_for_key (string__of_yojson) "EventId") _list path;
    ops_item_id = option_of_yojson (value_for_key (string__of_yojson) "OpsItemId") _list path;
    
  }
  in _res

let ops_item_event_summaries_of_yojson = 
  fun tree path -> list_of_yojson ops_item_event_summary_of_yojson tree path 

let ops_item_event_max_results_of_yojson = int_of_yojson

let ops_item_event_filter_key_of_yojson = 
  fun (tree: t) path : ops_item_event_filter_key -> match tree with 
    | `String "OpsItemId" -> OPSITEM_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemEventFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemEventFilterKey")

let ops_item_event_filter_value_of_yojson = string_of_yojson

let ops_item_event_filter_values_of_yojson = 
  fun tree path -> list_of_yojson ops_item_event_filter_value_of_yojson tree path 

let ops_item_event_filter_operator_of_yojson = 
  fun (tree: t) path : ops_item_event_filter_operator -> match tree with 
    | `String "Equal" -> EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsItemEventFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsItemEventFilterOperator")

let ops_item_event_filter_of_yojson = 
  fun tree path : ops_item_event_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item_event_filter = {
    operator = value_for_key (ops_item_event_filter_operator_of_yojson) "Operator" _list path;
    values = value_for_key (ops_item_event_filter_values_of_yojson) "Values" _list path;
    key = value_for_key (ops_item_event_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let ops_item_event_filters_of_yojson = 
  fun tree path -> list_of_yojson ops_item_event_filter_of_yojson tree path 

let ops_item_account_id_of_yojson = string_of_yojson

let ops_item_of_yojson = 
  fun tree path : ops_item ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_item = {
    ops_item_arn = option_of_yojson (value_for_key (ops_item_arn_of_yojson) "OpsItemArn") _list path;
    planned_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "PlannedEndTime") _list path;
    planned_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "PlannedStartTime") _list path;
    actual_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "ActualEndTime") _list path;
    actual_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "ActualStartTime") _list path;
    severity = option_of_yojson (value_for_key (ops_item_severity_of_yojson) "Severity") _list path;
    category = option_of_yojson (value_for_key (ops_item_category_of_yojson) "Category") _list path;
    operational_data = option_of_yojson (value_for_key (ops_item_operational_data_of_yojson) "OperationalData") _list path;
    source = option_of_yojson (value_for_key (ops_item_source_of_yojson) "Source") _list path;
    title = option_of_yojson (value_for_key (ops_item_title_of_yojson) "Title") _list path;
    version = option_of_yojson (value_for_key (string__of_yojson) "Version") _list path;
    ops_item_id = option_of_yojson (value_for_key (ops_item_id_of_yojson) "OpsItemId") _list path;
    status = option_of_yojson (value_for_key (ops_item_status_of_yojson) "Status") _list path;
    related_ops_items = option_of_yojson (value_for_key (related_ops_items_of_yojson) "RelatedOpsItems") _list path;
    priority = option_of_yojson (value_for_key (ops_item_priority_of_yojson) "Priority") _list path;
    notifications = option_of_yojson (value_for_key (ops_item_notifications_of_yojson) "Notifications") _list path;
    last_modified_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastModifiedTime") _list path;
    last_modified_by = option_of_yojson (value_for_key (string__of_yojson) "LastModifiedBy") _list path;
    description = option_of_yojson (value_for_key (ops_item_description_of_yojson) "Description") _list path;
    created_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedTime") _list path;
    ops_item_type = option_of_yojson (value_for_key (ops_item_type_of_yojson) "OpsItemType") _list path;
    created_by = option_of_yojson (value_for_key (string__of_yojson) "CreatedBy") _list path;
    
  }
  in _res

let ops_filter_value_of_yojson = string_of_yojson

let ops_filter_value_list_of_yojson = 
  fun tree path -> list_of_yojson ops_filter_value_of_yojson tree path 

let ops_filter_operator_type_of_yojson = 
  fun (tree: t) path : ops_filter_operator_type -> match tree with 
    | `String "Exists" -> EXISTS
    | `String "GreaterThan" -> GREATER_THAN
    | `String "LessThan" -> LESS_THAN
    | `String "BeginWith" -> BEGIN_WITH
    | `String "NotEqual" -> NOT_EQUAL
    | `String "Equal" -> EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpsFilterOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpsFilterOperatorType")

let ops_filter_key_of_yojson = string_of_yojson

let ops_filter_of_yojson = 
  fun tree path : ops_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_filter = {
    type_ = option_of_yojson (value_for_key (ops_filter_operator_type_of_yojson) "Type") _list path;
    values = value_for_key (ops_filter_value_list_of_yojson) "Values" _list path;
    key = value_for_key (ops_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let ops_filter_list_of_yojson = 
  fun tree path -> list_of_yojson ops_filter_of_yojson tree path 

let ops_entity_id_of_yojson = string_of_yojson

let ops_entity_item_capture_time_of_yojson = string_of_yojson

let ops_entity_item_entry_of_yojson = 
  fun tree path -> map_of_yojson attribute_value_of_yojson tree path

let ops_entity_item_entry_list_of_yojson = 
  fun tree path -> list_of_yojson ops_entity_item_entry_of_yojson tree path 

let ops_entity_item_of_yojson = 
  fun tree path : ops_entity_item ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_entity_item = {
    content = option_of_yojson (value_for_key (ops_entity_item_entry_list_of_yojson) "Content") _list path;
    capture_time = option_of_yojson (value_for_key (ops_entity_item_capture_time_of_yojson) "CaptureTime") _list path;
    
  }
  in _res

let ops_entity_item_key_of_yojson = string_of_yojson

let ops_entity_item_map_of_yojson = 
  fun tree path -> map_of_yojson ops_entity_item_of_yojson tree path

let ops_entity_of_yojson = 
  fun tree path : ops_entity ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_entity = {
    data = option_of_yojson (value_for_key (ops_entity_item_map_of_yojson) "Data") _list path;
    id = option_of_yojson (value_for_key (ops_entity_id_of_yojson) "Id") _list path;
    
  }
  in _res

let ops_entity_list_of_yojson = 
  fun tree path -> list_of_yojson ops_entity_of_yojson tree path 

let ops_data_attribute_name_of_yojson = string_of_yojson

let ops_aggregator_value_of_yojson = string_of_yojson

let ops_aggregator_value_key_of_yojson = string_of_yojson

let ops_aggregator_value_map_of_yojson = 
  fun tree path -> map_of_yojson ops_aggregator_value_of_yojson tree path

let ops_aggregator_type_of_yojson = string_of_yojson

let rec ops_aggregator_of_yojson = 
  fun tree path : ops_aggregator ->
  let _list = assoc_of_yojson tree path in
  let _res : ops_aggregator = {
    aggregators = option_of_yojson (value_for_key (ops_aggregator_list_of_yojson) "Aggregators") _list path;
    filters = option_of_yojson (value_for_key (ops_filter_list_of_yojson) "Filters") _list path;
    values = option_of_yojson (value_for_key (ops_aggregator_value_map_of_yojson) "Values") _list path;
    attribute_name = option_of_yojson (value_for_key (ops_data_attribute_name_of_yojson) "AttributeName") _list path;
    type_name = option_of_yojson (value_for_key (ops_data_type_name_of_yojson) "TypeName") _list path;
    aggregator_type = option_of_yojson (value_for_key (ops_aggregator_type_of_yojson) "AggregatorType") _list path;
    
  }
  in _res

and ops_aggregator_list_of_yojson = 
  fun tree path -> list_of_yojson ops_aggregator_of_yojson tree path 

let next_token_of_yojson = string_of_yojson

let modify_document_permission_response_of_yojson = 
  fun tree path : modify_document_permission_response ->
  let _list = assoc_of_yojson tree path in
  let _res : modify_document_permission_response = ()
  in _res

let document_permission_type_of_yojson = 
  fun (tree: t) path : document_permission_type -> match tree with 
    | `String "Share" -> SHARE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentPermissionType" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentPermissionType")

let account_id_of_yojson = string_of_yojson

let account_id_list_of_yojson = 
  fun tree path -> list_of_yojson account_id_of_yojson tree path 

let modify_document_permission_request_of_yojson = 
  fun tree path : modify_document_permission_request ->
  let _list = assoc_of_yojson tree path in
  let _res : modify_document_permission_request = {
    shared_document_version = option_of_yojson (value_for_key (shared_document_version_of_yojson) "SharedDocumentVersion") _list path;
    account_ids_to_remove = option_of_yojson (value_for_key (account_id_list_of_yojson) "AccountIdsToRemove") _list path;
    account_ids_to_add = option_of_yojson (value_for_key (account_id_list_of_yojson) "AccountIdsToAdd") _list path;
    permission_type = value_for_key (document_permission_type_of_yojson) "PermissionType" _list path;
    name = value_for_key (document_name_of_yojson) "Name" _list path;
    
  }
  in _res

let invalid_permission_type_of_yojson = 
  fun tree path : invalid_permission_type ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_permission_type = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let document_permission_limit_of_yojson = 
  fun tree path : document_permission_limit ->
  let _list = assoc_of_yojson tree path in
  let _res : document_permission_limit = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let document_limit_exceeded_of_yojson = 
  fun tree path : document_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : document_limit_exceeded = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let max_results_ec2_compatible_of_yojson = int_of_yojson

let max_results_of_yojson = int_of_yojson

let maintenance_window_identity_for_target_of_yojson = 
  fun tree path : maintenance_window_identity_for_target ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_identity_for_target = {
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let maintenance_windows_for_target_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_identity_for_target_of_yojson tree path 

let maintenance_window_task_target_id_of_yojson = string_of_yojson

let maintenance_window_task_parameters_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_task_parameters_of_yojson tree path 

let maintenance_window_task_of_yojson = 
  fun tree path : maintenance_window_task ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_task = {
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    cutoff_behavior = option_of_yojson (value_for_key (maintenance_window_task_cutoff_behavior_of_yojson) "CutoffBehavior") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    service_role_arn = option_of_yojson (value_for_key (service_role_of_yojson) "ServiceRoleArn") _list path;
    logging_info = option_of_yojson (value_for_key (logging_info_of_yojson) "LoggingInfo") _list path;
    priority = option_of_yojson (value_for_key (maintenance_window_task_priority_of_yojson) "Priority") _list path;
    task_parameters = option_of_yojson (value_for_key (maintenance_window_task_parameters_of_yojson) "TaskParameters") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    type_ = option_of_yojson (value_for_key (maintenance_window_task_type_of_yojson) "Type") _list path;
    task_arn = option_of_yojson (value_for_key (maintenance_window_task_arn_of_yojson) "TaskArn") _list path;
    window_task_id = option_of_yojson (value_for_key (maintenance_window_task_id_of_yojson) "WindowTaskId") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let maintenance_window_task_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_task_of_yojson tree path 

let maintenance_window_target_of_yojson = 
  fun tree path : maintenance_window_target ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_target = {
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    owner_information = option_of_yojson (value_for_key (owner_information_of_yojson) "OwnerInformation") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    resource_type = option_of_yojson (value_for_key (maintenance_window_resource_type_of_yojson) "ResourceType") _list path;
    window_target_id = option_of_yojson (value_for_key (maintenance_window_target_id_of_yojson) "WindowTargetId") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let maintenance_window_target_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_target_of_yojson tree path 

let maintenance_window_search_max_results_of_yojson = int_of_yojson

let maintenance_window_max_results_of_yojson = int_of_yojson

let maintenance_window_identity_of_yojson = 
  fun tree path : maintenance_window_identity ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_identity = {
    next_execution_time = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "NextExecutionTime") _list path;
    start_date = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "StartDate") _list path;
    end_date = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "EndDate") _list path;
    schedule_offset = option_of_yojson (value_for_key (maintenance_window_offset_of_yojson) "ScheduleOffset") _list path;
    schedule_timezone = option_of_yojson (value_for_key (maintenance_window_timezone_of_yojson) "ScheduleTimezone") _list path;
    schedule = option_of_yojson (value_for_key (maintenance_window_schedule_of_yojson) "Schedule") _list path;
    cutoff = option_of_yojson (value_for_key (maintenance_window_cutoff_of_yojson) "Cutoff") _list path;
    duration = option_of_yojson (value_for_key (maintenance_window_duration_hours_of_yojson) "Duration") _list path;
    enabled = option_of_yojson (value_for_key (maintenance_window_enabled_of_yojson) "Enabled") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let maintenance_window_identity_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_identity_of_yojson tree path 

let maintenance_window_filter_value_of_yojson = string_of_yojson

let maintenance_window_filter_values_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_filter_value_of_yojson tree path 

let maintenance_window_filter_key_of_yojson = string_of_yojson

let maintenance_window_filter_of_yojson = 
  fun tree path : maintenance_window_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_filter = {
    values = option_of_yojson (value_for_key (maintenance_window_filter_values_of_yojson) "Values") _list path;
    key = option_of_yojson (value_for_key (maintenance_window_filter_key_of_yojson) "Key") _list path;
    
  }
  in _res

let maintenance_window_filter_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_filter_of_yojson tree path 

let maintenance_window_execution_task_invocation_parameters_of_yojson = 
  string_of_yojson

let maintenance_window_execution_id_of_yojson = string_of_yojson

let maintenance_window_execution_task_id_of_yojson = string_of_yojson

let maintenance_window_execution_task_invocation_id_of_yojson = 
  string_of_yojson

let maintenance_window_execution_task_execution_id_of_yojson = 
  string_of_yojson

let maintenance_window_execution_status_of_yojson = 
  fun (tree: t) path : maintenance_window_execution_status -> match tree with 
    | `String "SKIPPED_OVERLAPPING" -> SkippedOverlapping
    | `String "CANCELLED" -> Cancelled
    | `String "CANCELLING" -> Cancelling
    | `String "TIMED_OUT" -> TimedOut
    | `String "FAILED" -> Failed
    | `String "SUCCESS" -> Success
    | `String "IN_PROGRESS" -> InProgress
    | `String "PENDING" -> Pending
    | `String value -> raise (deserialize_unknown_enum_value_error path "MaintenanceWindowExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MaintenanceWindowExecutionStatus")

let maintenance_window_execution_status_details_of_yojson = 
  string_of_yojson

let maintenance_window_execution_task_invocation_identity_of_yojson = 
  fun tree path : maintenance_window_execution_task_invocation_identity ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_execution_task_invocation_identity = {
    window_target_id = option_of_yojson (value_for_key (maintenance_window_task_target_id_of_yojson) "WindowTargetId") _list path;
    owner_information = option_of_yojson (value_for_key (owner_information_of_yojson) "OwnerInformation") _list path;
    end_time = option_of_yojson (value_for_key (date_time_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    status_details = option_of_yojson (value_for_key (maintenance_window_execution_status_details_of_yojson) "StatusDetails") _list path;
    status = option_of_yojson (value_for_key (maintenance_window_execution_status_of_yojson) "Status") _list path;
    parameters = option_of_yojson (value_for_key (maintenance_window_execution_task_invocation_parameters_of_yojson) "Parameters") _list path;
    task_type = option_of_yojson (value_for_key (maintenance_window_task_type_of_yojson) "TaskType") _list path;
    execution_id = option_of_yojson (value_for_key (maintenance_window_execution_task_execution_id_of_yojson) "ExecutionId") _list path;
    invocation_id = option_of_yojson (value_for_key (maintenance_window_execution_task_invocation_id_of_yojson) "InvocationId") _list path;
    task_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_task_id_of_yojson) "TaskExecutionId") _list path;
    window_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId") _list path;
    
  }
  in _res

let maintenance_window_execution_task_invocation_identity_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_execution_task_invocation_identity_of_yojson tree path 

let maintenance_window_execution_task_identity_of_yojson = 
  fun tree path : maintenance_window_execution_task_identity ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_execution_task_identity = {
    triggered_alarms = option_of_yojson (value_for_key (alarm_state_information_list_of_yojson) "TriggeredAlarms") _list path;
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    task_type = option_of_yojson (value_for_key (maintenance_window_task_type_of_yojson) "TaskType") _list path;
    task_arn = option_of_yojson (value_for_key (maintenance_window_task_arn_of_yojson) "TaskArn") _list path;
    end_time = option_of_yojson (value_for_key (date_time_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    status_details = option_of_yojson (value_for_key (maintenance_window_execution_status_details_of_yojson) "StatusDetails") _list path;
    status = option_of_yojson (value_for_key (maintenance_window_execution_status_of_yojson) "Status") _list path;
    task_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_task_id_of_yojson) "TaskExecutionId") _list path;
    window_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId") _list path;
    
  }
  in _res

let maintenance_window_execution_task_identity_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_execution_task_identity_of_yojson tree path 

let maintenance_window_execution_task_id_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_execution_task_id_of_yojson tree path 

let maintenance_window_execution_of_yojson = 
  fun tree path : maintenance_window_execution ->
  let _list = assoc_of_yojson tree path in
  let _res : maintenance_window_execution = {
    end_time = option_of_yojson (value_for_key (date_time_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    status_details = option_of_yojson (value_for_key (maintenance_window_execution_status_details_of_yojson) "StatusDetails") _list path;
    status = option_of_yojson (value_for_key (maintenance_window_execution_status_of_yojson) "Status") _list path;
    window_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let maintenance_window_execution_list_of_yojson = 
  fun tree path -> list_of_yojson maintenance_window_execution_of_yojson tree path 

let list_tags_for_resource_result_of_yojson = 
  fun tree path : list_tags_for_resource_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_result = {
    tag_list = option_of_yojson (value_for_key (tag_list_of_yojson) "TagList") _list path;
    
  }
  in _res

let list_tags_for_resource_request_of_yojson = 
  fun tree path : list_tags_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_tags_for_resource_request = {
    resource_id = value_for_key (resource_id_of_yojson) "ResourceId" _list path;
    resource_type = value_for_key (resource_type_for_tagging_of_yojson) "ResourceType" _list path;
    
  }
  in _res

let list_resource_data_sync_result_of_yojson = 
  fun tree path : list_resource_data_sync_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resource_data_sync_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    resource_data_sync_items = option_of_yojson (value_for_key (resource_data_sync_item_list_of_yojson) "ResourceDataSyncItems") _list path;
    
  }
  in _res

let list_resource_data_sync_request_of_yojson = 
  fun tree path : list_resource_data_sync_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resource_data_sync_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    sync_type = option_of_yojson (value_for_key (resource_data_sync_type_of_yojson) "SyncType") _list path;
    
  }
  in _res

let invalid_next_token_of_yojson = 
  fun tree path : invalid_next_token ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_next_token = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let list_resource_compliance_summaries_result_of_yojson = 
  fun tree path : list_resource_compliance_summaries_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resource_compliance_summaries_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    resource_compliance_summary_items = option_of_yojson (value_for_key (resource_compliance_summary_item_list_of_yojson) "ResourceComplianceSummaryItems") _list path;
    
  }
  in _res

let compliance_string_filter_key_of_yojson = string_of_yojson

let compliance_filter_value_of_yojson = string_of_yojson

let compliance_string_filter_value_list_of_yojson = 
  fun tree path -> list_of_yojson compliance_filter_value_of_yojson tree path 

let compliance_query_operator_type_of_yojson = 
  fun (tree: t) path : compliance_query_operator_type -> match tree with 
    | `String "GREATER_THAN" -> GreaterThan
    | `String "LESS_THAN" -> LessThan
    | `String "BEGIN_WITH" -> BeginWith
    | `String "NOT_EQUAL" -> NotEqual
    | `String "EQUAL" -> Equal
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComplianceQueryOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ComplianceQueryOperatorType")

let compliance_string_filter_of_yojson = 
  fun tree path : compliance_string_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_string_filter = {
    type_ = option_of_yojson (value_for_key (compliance_query_operator_type_of_yojson) "Type") _list path;
    values = option_of_yojson (value_for_key (compliance_string_filter_value_list_of_yojson) "Values") _list path;
    key = option_of_yojson (value_for_key (compliance_string_filter_key_of_yojson) "Key") _list path;
    
  }
  in _res

let compliance_string_filter_list_of_yojson = 
  fun tree path -> list_of_yojson compliance_string_filter_of_yojson tree path 

let list_resource_compliance_summaries_request_of_yojson = 
  fun tree path : list_resource_compliance_summaries_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_resource_compliance_summaries_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    filters = option_of_yojson (value_for_key (compliance_string_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let invalid_filter_of_yojson = 
  fun tree path : invalid_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_filter = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let list_ops_metadata_result_of_yojson = 
  fun tree path : list_ops_metadata_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_ops_metadata_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    ops_metadata_list = option_of_yojson (value_for_key (ops_metadata_list_of_yojson) "OpsMetadataList") _list path;
    
  }
  in _res

let list_ops_metadata_max_results_of_yojson = int_of_yojson

let list_ops_metadata_request_of_yojson = 
  fun tree path : list_ops_metadata_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_ops_metadata_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_ops_metadata_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (ops_metadata_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let list_ops_item_related_items_response_of_yojson = 
  fun tree path : list_ops_item_related_items_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_ops_item_related_items_response = {
    summaries = option_of_yojson (value_for_key (ops_item_related_item_summaries_of_yojson) "Summaries") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let list_ops_item_related_items_request_of_yojson = 
  fun tree path : list_ops_item_related_items_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_ops_item_related_items_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (ops_item_related_items_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (ops_item_related_items_filters_of_yojson) "Filters") _list path;
    ops_item_id = option_of_yojson (value_for_key (ops_item_id_of_yojson) "OpsItemId") _list path;
    
  }
  in _res

let list_ops_item_events_response_of_yojson = 
  fun tree path : list_ops_item_events_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_ops_item_events_response = {
    summaries = option_of_yojson (value_for_key (ops_item_event_summaries_of_yojson) "Summaries") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let list_ops_item_events_request_of_yojson = 
  fun tree path : list_ops_item_events_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_ops_item_events_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (ops_item_event_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (ops_item_event_filters_of_yojson) "Filters") _list path;
    
  }
  in _res

let list_inventory_entries_result_of_yojson = 
  fun tree path : list_inventory_entries_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_inventory_entries_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    entries = option_of_yojson (value_for_key (inventory_item_entry_list_of_yojson) "Entries") _list path;
    capture_time = option_of_yojson (value_for_key (inventory_item_capture_time_of_yojson) "CaptureTime") _list path;
    schema_version = option_of_yojson (value_for_key (inventory_item_schema_version_of_yojson) "SchemaVersion") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    type_name = option_of_yojson (value_for_key (inventory_item_type_name_of_yojson) "TypeName") _list path;
    
  }
  in _res

let inventory_filter_key_of_yojson = string_of_yojson

let inventory_filter_value_of_yojson = string_of_yojson

let inventory_filter_value_list_of_yojson = 
  fun tree path -> list_of_yojson inventory_filter_value_of_yojson tree path 

let inventory_query_operator_type_of_yojson = 
  fun (tree: t) path : inventory_query_operator_type -> match tree with 
    | `String "Exists" -> EXISTS
    | `String "GreaterThan" -> GREATER_THAN
    | `String "LessThan" -> LESS_THAN
    | `String "BeginWith" -> BEGIN_WITH
    | `String "NotEqual" -> NOT_EQUAL
    | `String "Equal" -> EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "InventoryQueryOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "InventoryQueryOperatorType")

let inventory_filter_of_yojson = 
  fun tree path : inventory_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_filter = {
    type_ = option_of_yojson (value_for_key (inventory_query_operator_type_of_yojson) "Type") _list path;
    values = value_for_key (inventory_filter_value_list_of_yojson) "Values" _list path;
    key = value_for_key (inventory_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let inventory_filter_list_of_yojson = 
  fun tree path -> list_of_yojson inventory_filter_of_yojson tree path 

let list_inventory_entries_request_of_yojson = 
  fun tree path : list_inventory_entries_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_inventory_entries_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    filters = option_of_yojson (value_for_key (inventory_filter_list_of_yojson) "Filters") _list path;
    type_name = value_for_key (inventory_item_type_name_of_yojson) "TypeName" _list path;
    instance_id = value_for_key (instance_id_of_yojson) "InstanceId" _list path;
    
  }
  in _res

let document_identifier_of_yojson = 
  fun tree path : document_identifier ->
  let _list = assoc_of_yojson tree path in
  let _res : document_identifier = {
    author = option_of_yojson (value_for_key (document_author_of_yojson) "Author") _list path;
    review_status = option_of_yojson (value_for_key (review_status_of_yojson) "ReviewStatus") _list path;
    requires = option_of_yojson (value_for_key (document_requires_list_of_yojson) "Requires") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    target_type = option_of_yojson (value_for_key (target_type_of_yojson) "TargetType") _list path;
    document_format = option_of_yojson (value_for_key (document_format_of_yojson) "DocumentFormat") _list path;
    schema_version = option_of_yojson (value_for_key (document_schema_version_of_yojson) "SchemaVersion") _list path;
    document_type = option_of_yojson (value_for_key (document_type_of_yojson) "DocumentType") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    platform_types = option_of_yojson (value_for_key (platform_type_list_of_yojson) "PlatformTypes") _list path;
    version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "VersionName") _list path;
    owner = option_of_yojson (value_for_key (document_owner_of_yojson) "Owner") _list path;
    display_name = option_of_yojson (value_for_key (document_display_name_of_yojson) "DisplayName") _list path;
    created_date = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedDate") _list path;
    name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "Name") _list path;
    
  }
  in _res

let document_identifier_list_of_yojson = 
  fun tree path -> list_of_yojson document_identifier_of_yojson tree path 

let list_documents_result_of_yojson = 
  fun tree path : list_documents_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_documents_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    document_identifiers = option_of_yojson (value_for_key (document_identifier_list_of_yojson) "DocumentIdentifiers") _list path;
    
  }
  in _res

let document_filter_key_of_yojson = 
  fun (tree: t) path : document_filter_key -> match tree with 
    | `String "DocumentType" -> DocumentType
    | `String "PlatformTypes" -> PlatformTypes
    | `String "Owner" -> Owner
    | `String "Name" -> Name
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentFilterKey")

let document_filter_value_of_yojson = string_of_yojson

let document_filter_of_yojson = 
  fun tree path : document_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : document_filter = {
    value = value_for_key (document_filter_value_of_yojson) "value" _list path;
    key = value_for_key (document_filter_key_of_yojson) "key" _list path;
    
  }
  in _res

let document_filter_list_of_yojson = 
  fun tree path -> list_of_yojson document_filter_of_yojson tree path 

let document_key_values_filter_key_of_yojson = string_of_yojson

let document_key_values_filter_value_of_yojson = string_of_yojson

let document_key_values_filter_values_of_yojson = 
  fun tree path -> list_of_yojson document_key_values_filter_value_of_yojson tree path 

let document_key_values_filter_of_yojson = 
  fun tree path : document_key_values_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : document_key_values_filter = {
    values = option_of_yojson (value_for_key (document_key_values_filter_values_of_yojson) "Values") _list path;
    key = option_of_yojson (value_for_key (document_key_values_filter_key_of_yojson) "Key") _list path;
    
  }
  in _res

let document_key_values_filter_list_of_yojson = 
  fun tree path -> list_of_yojson document_key_values_filter_of_yojson tree path 

let list_documents_request_of_yojson = 
  fun tree path : list_documents_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_documents_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (document_key_values_filter_list_of_yojson) "Filters") _list path;
    document_filter_list = option_of_yojson (value_for_key (document_filter_list_of_yojson) "DocumentFilterList") _list path;
    
  }
  in _res

let invalid_filter_key_of_yojson = 
  fun tree path : invalid_filter_key ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_filter_key = ()
  in _res

let document_version_info_of_yojson = 
  fun tree path : document_version_info ->
  let _list = assoc_of_yojson tree path in
  let _res : document_version_info = {
    review_status = option_of_yojson (value_for_key (review_status_of_yojson) "ReviewStatus") _list path;
    status_information = option_of_yojson (value_for_key (document_status_information_of_yojson) "StatusInformation") _list path;
    status = option_of_yojson (value_for_key (document_status_of_yojson) "Status") _list path;
    document_format = option_of_yojson (value_for_key (document_format_of_yojson) "DocumentFormat") _list path;
    is_default_version = option_of_yojson (value_for_key (boolean__of_yojson) "IsDefaultVersion") _list path;
    created_date = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedDate") _list path;
    version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "VersionName") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    display_name = option_of_yojson (value_for_key (document_display_name_of_yojson) "DisplayName") _list path;
    name = option_of_yojson (value_for_key (document_name_of_yojson) "Name") _list path;
    
  }
  in _res

let document_version_list_of_yojson = 
  fun tree path -> list_of_yojson document_version_info_of_yojson tree path 

let list_document_versions_result_of_yojson = 
  fun tree path : list_document_versions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_document_versions_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    document_versions = option_of_yojson (value_for_key (document_version_list_of_yojson) "DocumentVersions") _list path;
    
  }
  in _res

let list_document_versions_request_of_yojson = 
  fun tree path : list_document_versions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_document_versions_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    name = value_for_key (document_ar_n_of_yojson) "Name" _list path;
    
  }
  in _res

let document_reviewer_response_source_of_yojson = 
  fun tree path : document_reviewer_response_source ->
  let _list = assoc_of_yojson tree path in
  let _res : document_reviewer_response_source = {
    reviewer = option_of_yojson (value_for_key (reviewer_of_yojson) "Reviewer") _list path;
    comment = option_of_yojson (value_for_key (document_review_comment_list_of_yojson) "Comment") _list path;
    review_status = option_of_yojson (value_for_key (review_status_of_yojson) "ReviewStatus") _list path;
    updated_time = option_of_yojson (value_for_key (date_time_of_yojson) "UpdatedTime") _list path;
    create_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreateTime") _list path;
    
  }
  in _res

let document_reviewer_response_list_of_yojson = 
  fun tree path -> list_of_yojson document_reviewer_response_source_of_yojson tree path 

let document_metadata_response_info_of_yojson = 
  fun tree path : document_metadata_response_info ->
  let _list = assoc_of_yojson tree path in
  let _res : document_metadata_response_info = {
    reviewer_response = option_of_yojson (value_for_key (document_reviewer_response_list_of_yojson) "ReviewerResponse") _list path;
    
  }
  in _res

let list_document_metadata_history_response_of_yojson = 
  fun tree path : list_document_metadata_history_response ->
  let _list = assoc_of_yojson tree path in
  let _res : list_document_metadata_history_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    metadata = option_of_yojson (value_for_key (document_metadata_response_info_of_yojson) "Metadata") _list path;
    author = option_of_yojson (value_for_key (document_author_of_yojson) "Author") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    name = option_of_yojson (value_for_key (document_name_of_yojson) "Name") _list path;
    
  }
  in _res

let document_metadata_enum_of_yojson = 
  fun (tree: t) path : document_metadata_enum -> match tree with 
    | `String "DocumentReviews" -> DocumentReviews
    | `String value -> raise (deserialize_unknown_enum_value_error path "DocumentMetadataEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "DocumentMetadataEnum")

let list_document_metadata_history_request_of_yojson = 
  fun tree path : list_document_metadata_history_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_document_metadata_history_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    metadata = value_for_key (document_metadata_enum_of_yojson) "Metadata" _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    name = value_for_key (document_name_of_yojson) "Name" _list path;
    
  }
  in _res

let compliance_summary_item_of_yojson = 
  fun tree path : compliance_summary_item ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_summary_item = {
    non_compliant_summary = option_of_yojson (value_for_key (non_compliant_summary_of_yojson) "NonCompliantSummary") _list path;
    compliant_summary = option_of_yojson (value_for_key (compliant_summary_of_yojson) "CompliantSummary") _list path;
    compliance_type = option_of_yojson (value_for_key (compliance_type_name_of_yojson) "ComplianceType") _list path;
    
  }
  in _res

let compliance_summary_item_list_of_yojson = 
  fun tree path -> list_of_yojson compliance_summary_item_of_yojson tree path 

let list_compliance_summaries_result_of_yojson = 
  fun tree path : list_compliance_summaries_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_compliance_summaries_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    compliance_summary_items = option_of_yojson (value_for_key (compliance_summary_item_list_of_yojson) "ComplianceSummaryItems") _list path;
    
  }
  in _res

let list_compliance_summaries_request_of_yojson = 
  fun tree path : list_compliance_summaries_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_compliance_summaries_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    filters = option_of_yojson (value_for_key (compliance_string_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let compliance_item_of_yojson = 
  fun tree path : compliance_item ->
  let _list = assoc_of_yojson tree path in
  let _res : compliance_item = {
    details = option_of_yojson (value_for_key (compliance_item_details_of_yojson) "Details") _list path;
    execution_summary = option_of_yojson (value_for_key (compliance_execution_summary_of_yojson) "ExecutionSummary") _list path;
    severity = option_of_yojson (value_for_key (compliance_severity_of_yojson) "Severity") _list path;
    status = option_of_yojson (value_for_key (compliance_status_of_yojson) "Status") _list path;
    title = option_of_yojson (value_for_key (compliance_item_title_of_yojson) "Title") _list path;
    id = option_of_yojson (value_for_key (compliance_item_id_of_yojson) "Id") _list path;
    resource_id = option_of_yojson (value_for_key (compliance_resource_id_of_yojson) "ResourceId") _list path;
    resource_type = option_of_yojson (value_for_key (compliance_resource_type_of_yojson) "ResourceType") _list path;
    compliance_type = option_of_yojson (value_for_key (compliance_type_name_of_yojson) "ComplianceType") _list path;
    
  }
  in _res

let compliance_item_list_of_yojson = 
  fun tree path -> list_of_yojson compliance_item_of_yojson tree path 

let list_compliance_items_result_of_yojson = 
  fun tree path : list_compliance_items_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_compliance_items_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    compliance_items = option_of_yojson (value_for_key (compliance_item_list_of_yojson) "ComplianceItems") _list path;
    
  }
  in _res

let compliance_resource_id_list_of_yojson = 
  fun tree path -> list_of_yojson compliance_resource_id_of_yojson tree path 

let compliance_resource_type_list_of_yojson = 
  fun tree path -> list_of_yojson compliance_resource_type_of_yojson tree path 

let list_compliance_items_request_of_yojson = 
  fun tree path : list_compliance_items_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_compliance_items_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    resource_types = option_of_yojson (value_for_key (compliance_resource_type_list_of_yojson) "ResourceTypes") _list path;
    resource_ids = option_of_yojson (value_for_key (compliance_resource_id_list_of_yojson) "ResourceIds") _list path;
    filters = option_of_yojson (value_for_key (compliance_string_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let command_list_of_yojson = 
  fun tree path -> list_of_yojson command_of_yojson tree path 

let list_commands_result_of_yojson = 
  fun tree path : list_commands_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_commands_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    commands = option_of_yojson (value_for_key (command_list_of_yojson) "Commands") _list path;
    
  }
  in _res

let command_max_results_of_yojson = int_of_yojson

let command_filter_key_of_yojson = 
  fun (tree: t) path : command_filter_key -> match tree with 
    | `String "DocumentName" -> DOCUMENT_NAME
    | `String "ExecutionStage" -> EXECUTION_STAGE
    | `String "Status" -> STATUS
    | `String "InvokedBefore" -> INVOKED_BEFORE
    | `String "InvokedAfter" -> INVOKED_AFTER
    | `String value -> raise (deserialize_unknown_enum_value_error path "CommandFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "CommandFilterKey")

let command_filter_value_of_yojson = string_of_yojson

let command_filter_of_yojson = 
  fun tree path : command_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : command_filter = {
    value = value_for_key (command_filter_value_of_yojson) "value" _list path;
    key = value_for_key (command_filter_key_of_yojson) "key" _list path;
    
  }
  in _res

let command_filter_list_of_yojson = 
  fun tree path -> list_of_yojson command_filter_of_yojson tree path 

let list_commands_request_of_yojson = 
  fun tree path : list_commands_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_commands_request = {
    filters = option_of_yojson (value_for_key (command_filter_list_of_yojson) "Filters") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (command_max_results_of_yojson) "MaxResults") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    command_id = option_of_yojson (value_for_key (command_id_of_yojson) "CommandId") _list path;
    
  }
  in _res

let invalid_command_id_of_yojson = 
  fun tree path : invalid_command_id ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_command_id = ()
  in _res

let instance_tag_name_of_yojson = string_of_yojson

let command_invocation_status_of_yojson = 
  fun (tree: t) path : command_invocation_status -> match tree with 
    | `String "Cancelling" -> CANCELLING
    | `String "Failed" -> FAILED
    | `String "TimedOut" -> TIMED_OUT
    | `String "Cancelled" -> CANCELLED
    | `String "Success" -> SUCCESS
    | `String "Delayed" -> DELAYED
    | `String "InProgress" -> IN_PROGRESS
    | `String "Pending" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "CommandInvocationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CommandInvocationStatus")

let invocation_trace_output_of_yojson = string_of_yojson

let command_plugin_name_of_yojson = string_of_yojson

let command_plugin_status_of_yojson = 
  fun (tree: t) path : command_plugin_status -> match tree with 
    | `String "Failed" -> FAILED
    | `String "Cancelled" -> CANCELLED
    | `String "TimedOut" -> TIMED_OUT
    | `String "Success" -> SUCCESS
    | `String "InProgress" -> IN_PROGRESS
    | `String "Pending" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "CommandPluginStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CommandPluginStatus")

let command_plugin_output_of_yojson = string_of_yojson

let command_plugin_of_yojson = 
  fun tree path : command_plugin ->
  let _list = assoc_of_yojson tree path in
  let _res : command_plugin = {
    output_s3_key_prefix = option_of_yojson (value_for_key (s3_key_prefix_of_yojson) "OutputS3KeyPrefix") _list path;
    output_s3_bucket_name = option_of_yojson (value_for_key (s3_bucket_name_of_yojson) "OutputS3BucketName") _list path;
    output_s3_region = option_of_yojson (value_for_key (s3_region_of_yojson) "OutputS3Region") _list path;
    standard_error_url = option_of_yojson (value_for_key (url_of_yojson) "StandardErrorUrl") _list path;
    standard_output_url = option_of_yojson (value_for_key (url_of_yojson) "StandardOutputUrl") _list path;
    output = option_of_yojson (value_for_key (command_plugin_output_of_yojson) "Output") _list path;
    response_finish_date_time = option_of_yojson (value_for_key (date_time_of_yojson) "ResponseFinishDateTime") _list path;
    response_start_date_time = option_of_yojson (value_for_key (date_time_of_yojson) "ResponseStartDateTime") _list path;
    response_code = option_of_yojson (value_for_key (response_code_of_yojson) "ResponseCode") _list path;
    status_details = option_of_yojson (value_for_key (status_details_of_yojson) "StatusDetails") _list path;
    status = option_of_yojson (value_for_key (command_plugin_status_of_yojson) "Status") _list path;
    name = option_of_yojson (value_for_key (command_plugin_name_of_yojson) "Name") _list path;
    
  }
  in _res

let command_plugin_list_of_yojson = 
  fun tree path -> list_of_yojson command_plugin_of_yojson tree path 

let command_invocation_of_yojson = 
  fun tree path : command_invocation ->
  let _list = assoc_of_yojson tree path in
  let _res : command_invocation = {
    cloud_watch_output_config = option_of_yojson (value_for_key (cloud_watch_output_config_of_yojson) "CloudWatchOutputConfig") _list path;
    notification_config = option_of_yojson (value_for_key (notification_config_of_yojson) "NotificationConfig") _list path;
    service_role = option_of_yojson (value_for_key (service_role_of_yojson) "ServiceRole") _list path;
    command_plugins = option_of_yojson (value_for_key (command_plugin_list_of_yojson) "CommandPlugins") _list path;
    standard_error_url = option_of_yojson (value_for_key (url_of_yojson) "StandardErrorUrl") _list path;
    standard_output_url = option_of_yojson (value_for_key (url_of_yojson) "StandardOutputUrl") _list path;
    trace_output = option_of_yojson (value_for_key (invocation_trace_output_of_yojson) "TraceOutput") _list path;
    status_details = option_of_yojson (value_for_key (status_details_of_yojson) "StatusDetails") _list path;
    status = option_of_yojson (value_for_key (command_invocation_status_of_yojson) "Status") _list path;
    requested_date_time = option_of_yojson (value_for_key (date_time_of_yojson) "RequestedDateTime") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    document_name = option_of_yojson (value_for_key (document_name_of_yojson) "DocumentName") _list path;
    comment = option_of_yojson (value_for_key (comment_of_yojson) "Comment") _list path;
    instance_name = option_of_yojson (value_for_key (instance_tag_name_of_yojson) "InstanceName") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    command_id = option_of_yojson (value_for_key (command_id_of_yojson) "CommandId") _list path;
    
  }
  in _res

let command_invocation_list_of_yojson = 
  fun tree path -> list_of_yojson command_invocation_of_yojson tree path 

let list_command_invocations_result_of_yojson = 
  fun tree path : list_command_invocations_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_command_invocations_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    command_invocations = option_of_yojson (value_for_key (command_invocation_list_of_yojson) "CommandInvocations") _list path;
    
  }
  in _res

let list_command_invocations_request_of_yojson = 
  fun tree path : list_command_invocations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_command_invocations_request = {
    details = option_of_yojson (value_for_key (boolean__of_yojson) "Details") _list path;
    filters = option_of_yojson (value_for_key (command_filter_list_of_yojson) "Filters") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (command_max_results_of_yojson) "MaxResults") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    command_id = option_of_yojson (value_for_key (command_id_of_yojson) "CommandId") _list path;
    
  }
  in _res

let association_of_yojson = 
  fun tree path : association ->
  let _list = assoc_of_yojson tree path in
  let _res : association = {
    target_maps = option_of_yojson (value_for_key (target_maps_of_yojson) "TargetMaps") _list path;
    duration = option_of_yojson (value_for_key (duration_of_yojson) "Duration") _list path;
    schedule_offset = option_of_yojson (value_for_key (schedule_offset_of_yojson) "ScheduleOffset") _list path;
    association_name = option_of_yojson (value_for_key (association_name_of_yojson) "AssociationName") _list path;
    schedule_expression = option_of_yojson (value_for_key (schedule_expression_of_yojson) "ScheduleExpression") _list path;
    overview = option_of_yojson (value_for_key (association_overview_of_yojson) "Overview") _list path;
    last_execution_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastExecutionDate") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    association_version = option_of_yojson (value_for_key (association_version_of_yojson) "AssociationVersion") _list path;
    association_id = option_of_yojson (value_for_key (association_id_of_yojson) "AssociationId") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "Name") _list path;
    
  }
  in _res

let association_list_of_yojson = 
  fun tree path -> list_of_yojson association_of_yojson tree path 

let list_associations_result_of_yojson = 
  fun tree path : list_associations_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_associations_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    associations = option_of_yojson (value_for_key (association_list_of_yojson) "Associations") _list path;
    
  }
  in _res

let association_filter_key_of_yojson = 
  fun (tree: t) path : association_filter_key -> match tree with 
    | `String "ResourceGroupName" -> ResourceGroupName
    | `String "AssociationName" -> AssociationName
    | `String "LastExecutedAfter" -> LastExecutedAfter
    | `String "LastExecutedBefore" -> LastExecutedBefore
    | `String "AssociationStatusName" -> Status
    | `String "AssociationId" -> AssociationId
    | `String "Name" -> Name
    | `String "InstanceId" -> InstanceId
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationFilterKey")

let association_filter_value_of_yojson = string_of_yojson

let association_filter_of_yojson = 
  fun tree path : association_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : association_filter = {
    value = value_for_key (association_filter_value_of_yojson) "value" _list path;
    key = value_for_key (association_filter_key_of_yojson) "key" _list path;
    
  }
  in _res

let association_filter_list_of_yojson = 
  fun tree path -> list_of_yojson association_filter_of_yojson tree path 

let list_associations_request_of_yojson = 
  fun tree path : list_associations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_associations_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    association_filter_list = option_of_yojson (value_for_key (association_filter_list_of_yojson) "AssociationFilterList") _list path;
    
  }
  in _res

let association_version_info_of_yojson = 
  fun tree path : association_version_info ->
  let _list = assoc_of_yojson tree path in
  let _res : association_version_info = {
    target_maps = option_of_yojson (value_for_key (target_maps_of_yojson) "TargetMaps") _list path;
    duration = option_of_yojson (value_for_key (duration_of_yojson) "Duration") _list path;
    schedule_offset = option_of_yojson (value_for_key (schedule_offset_of_yojson) "ScheduleOffset") _list path;
    target_locations = option_of_yojson (value_for_key (target_locations_of_yojson) "TargetLocations") _list path;
    calendar_names = option_of_yojson (value_for_key (calendar_name_or_arn_list_of_yojson) "CalendarNames") _list path;
    apply_only_at_cron_interval = option_of_yojson (value_for_key (apply_only_at_cron_interval_of_yojson) "ApplyOnlyAtCronInterval") _list path;
    sync_compliance = option_of_yojson (value_for_key (association_sync_compliance_of_yojson) "SyncCompliance") _list path;
    compliance_severity = option_of_yojson (value_for_key (association_compliance_severity_of_yojson) "ComplianceSeverity") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    association_name = option_of_yojson (value_for_key (association_name_of_yojson) "AssociationName") _list path;
    output_location = option_of_yojson (value_for_key (instance_association_output_location_of_yojson) "OutputLocation") _list path;
    schedule_expression = option_of_yojson (value_for_key (schedule_expression_of_yojson) "ScheduleExpression") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    parameters = option_of_yojson (value_for_key (parameters_of_yojson) "Parameters") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "Name") _list path;
    created_date = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedDate") _list path;
    association_version = option_of_yojson (value_for_key (association_version_of_yojson) "AssociationVersion") _list path;
    association_id = option_of_yojson (value_for_key (association_id_of_yojson) "AssociationId") _list path;
    
  }
  in _res

let association_version_list_of_yojson = 
  fun tree path -> list_of_yojson association_version_info_of_yojson tree path 

let list_association_versions_result_of_yojson = 
  fun tree path : list_association_versions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_association_versions_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    association_versions = option_of_yojson (value_for_key (association_version_list_of_yojson) "AssociationVersions") _list path;
    
  }
  in _res

let list_association_versions_request_of_yojson = 
  fun tree path : list_association_versions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_association_versions_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    association_id = value_for_key (association_id_of_yojson) "AssociationId" _list path;
    
  }
  in _res

let label_parameter_version_result_of_yojson = 
  fun tree path : label_parameter_version_result ->
  let _list = assoc_of_yojson tree path in
  let _res : label_parameter_version_result = {
    parameter_version = option_of_yojson (value_for_key (ps_parameter_version_of_yojson) "ParameterVersion") _list path;
    invalid_labels = option_of_yojson (value_for_key (parameter_label_list_of_yojson) "InvalidLabels") _list path;
    
  }
  in _res

let label_parameter_version_request_of_yojson = 
  fun tree path : label_parameter_version_request ->
  let _list = assoc_of_yojson tree path in
  let _res : label_parameter_version_request = {
    labels = value_for_key (parameter_label_list_of_yojson) "Labels" _list path;
    parameter_version = option_of_yojson (value_for_key (ps_parameter_version_of_yojson) "ParameterVersion") _list path;
    name = value_for_key (ps_parameter_name_of_yojson) "Name" _list path;
    
  }
  in _res

let key_name_of_yojson = string_of_yojson

let is_sub_type_schema_of_yojson = bool_of_yojson

let invocation_does_not_exist_of_yojson = 
  fun tree path : invocation_does_not_exist ->
  let _list = assoc_of_yojson tree path in
  let _res : invocation_does_not_exist = ()
  in _res

let inventory_type_display_name_of_yojson = string_of_yojson

let inventory_schema_delete_option_of_yojson = 
  fun (tree: t) path : inventory_schema_delete_option -> match tree with 
    | `String "DeleteSchema" -> DELETE_SCHEMA
    | `String "DisableSchema" -> DISABLE_SCHEMA
    | `String value -> raise (deserialize_unknown_enum_value_error path "InventorySchemaDeleteOption" value)
    | _ -> raise (deserialize_wrong_type_error path "InventorySchemaDeleteOption")

let inventory_result_item_of_yojson = 
  fun tree path : inventory_result_item ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_result_item = {
    content = value_for_key (inventory_item_entry_list_of_yojson) "Content" _list path;
    content_hash = option_of_yojson (value_for_key (inventory_item_content_hash_of_yojson) "ContentHash") _list path;
    capture_time = option_of_yojson (value_for_key (inventory_item_capture_time_of_yojson) "CaptureTime") _list path;
    schema_version = value_for_key (inventory_item_schema_version_of_yojson) "SchemaVersion" _list path;
    type_name = value_for_key (inventory_item_type_name_of_yojson) "TypeName" _list path;
    
  }
  in _res

let inventory_result_item_key_of_yojson = string_of_yojson

let inventory_result_item_map_of_yojson = 
  fun tree path -> map_of_yojson inventory_result_item_of_yojson tree path

let inventory_result_entity_id_of_yojson = string_of_yojson

let inventory_result_entity_of_yojson = 
  fun tree path : inventory_result_entity ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_result_entity = {
    data = option_of_yojson (value_for_key (inventory_result_item_map_of_yojson) "Data") _list path;
    id = option_of_yojson (value_for_key (inventory_result_entity_id_of_yojson) "Id") _list path;
    
  }
  in _res

let inventory_result_entity_list_of_yojson = 
  fun tree path -> list_of_yojson inventory_result_entity_of_yojson tree path 

let inventory_item_type_name_filter_of_yojson = string_of_yojson

let inventory_item_attribute_name_of_yojson = string_of_yojson

let inventory_attribute_data_type_of_yojson = 
  fun (tree: t) path : inventory_attribute_data_type -> match tree with 
    | `String "number" -> NUMBER
    | `String "string" -> STRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "InventoryAttributeDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "InventoryAttributeDataType")

let inventory_item_attribute_of_yojson = 
  fun tree path : inventory_item_attribute ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_item_attribute = {
    data_type = value_for_key (inventory_attribute_data_type_of_yojson) "DataType" _list path;
    name = value_for_key (inventory_item_attribute_name_of_yojson) "Name" _list path;
    
  }
  in _res

let inventory_item_attribute_list_of_yojson = 
  fun tree path -> list_of_yojson inventory_item_attribute_of_yojson tree path 

let inventory_item_schema_of_yojson = 
  fun tree path : inventory_item_schema ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_item_schema = {
    display_name = option_of_yojson (value_for_key (inventory_type_display_name_of_yojson) "DisplayName") _list path;
    attributes = value_for_key (inventory_item_attribute_list_of_yojson) "Attributes" _list path;
    version = option_of_yojson (value_for_key (inventory_item_schema_version_of_yojson) "Version") _list path;
    type_name = value_for_key (inventory_item_type_name_of_yojson) "TypeName" _list path;
    
  }
  in _res

let inventory_item_schema_result_list_of_yojson = 
  fun tree path -> list_of_yojson inventory_item_schema_of_yojson tree path 

let inventory_group_name_of_yojson = string_of_yojson

let inventory_group_of_yojson = 
  fun tree path : inventory_group ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_group = {
    filters = value_for_key (inventory_filter_list_of_yojson) "Filters" _list path;
    name = value_for_key (inventory_group_name_of_yojson) "Name" _list path;
    
  }
  in _res

let inventory_group_list_of_yojson = 
  fun tree path -> list_of_yojson inventory_group_of_yojson tree path 

let inventory_deletion_start_time_of_yojson = timestamp_of_yojson

let inventory_deletion_status_of_yojson = 
  fun (tree: t) path : inventory_deletion_status -> match tree with 
    | `String "Complete" -> COMPLETE
    | `String "InProgress" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "InventoryDeletionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InventoryDeletionStatus")

let inventory_deletion_last_status_message_of_yojson = string_of_yojson

let inventory_deletion_summary_item_of_yojson = 
  fun tree path : inventory_deletion_summary_item ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_deletion_summary_item = {
    remaining_count = option_of_yojson (value_for_key (remaining_count_of_yojson) "RemainingCount") _list path;
    count = option_of_yojson (value_for_key (resource_count_of_yojson) "Count") _list path;
    version = option_of_yojson (value_for_key (inventory_item_schema_version_of_yojson) "Version") _list path;
    
  }
  in _res

let inventory_deletion_summary_items_of_yojson = 
  fun tree path -> list_of_yojson inventory_deletion_summary_item_of_yojson tree path 

let inventory_deletion_summary_of_yojson = 
  fun tree path : inventory_deletion_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_deletion_summary = {
    summary_items = option_of_yojson (value_for_key (inventory_deletion_summary_items_of_yojson) "SummaryItems") _list path;
    remaining_count = option_of_yojson (value_for_key (remaining_count_of_yojson) "RemainingCount") _list path;
    total_count = option_of_yojson (value_for_key (total_count_of_yojson) "TotalCount") _list path;
    
  }
  in _res

let inventory_deletion_last_status_update_time_of_yojson = 
  timestamp_of_yojson

let inventory_deletion_status_item_of_yojson = 
  fun tree path : inventory_deletion_status_item ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_deletion_status_item = {
    last_status_update_time = option_of_yojson (value_for_key (inventory_deletion_last_status_update_time_of_yojson) "LastStatusUpdateTime") _list path;
    deletion_summary = option_of_yojson (value_for_key (inventory_deletion_summary_of_yojson) "DeletionSummary") _list path;
    last_status_message = option_of_yojson (value_for_key (inventory_deletion_last_status_message_of_yojson) "LastStatusMessage") _list path;
    last_status = option_of_yojson (value_for_key (inventory_deletion_status_of_yojson) "LastStatus") _list path;
    deletion_start_time = option_of_yojson (value_for_key (inventory_deletion_start_time_of_yojson) "DeletionStartTime") _list path;
    type_name = option_of_yojson (value_for_key (inventory_item_type_name_of_yojson) "TypeName") _list path;
    deletion_id = option_of_yojson (value_for_key (uui_d_of_yojson) "DeletionId") _list path;
    
  }
  in _res

let inventory_deletions_list_of_yojson = 
  fun tree path -> list_of_yojson inventory_deletion_status_item_of_yojson tree path 

let inventory_aggregator_expression_of_yojson = string_of_yojson

let rec inventory_aggregator_of_yojson = 
  fun tree path : inventory_aggregator ->
  let _list = assoc_of_yojson tree path in
  let _res : inventory_aggregator = {
    groups = option_of_yojson (value_for_key (inventory_group_list_of_yojson) "Groups") _list path;
    aggregators = option_of_yojson (value_for_key (inventory_aggregator_list_of_yojson) "Aggregators") _list path;
    expression = option_of_yojson (value_for_key (inventory_aggregator_expression_of_yojson) "Expression") _list path;
    
  }
  in _res

and inventory_aggregator_list_of_yojson = 
  fun tree path -> list_of_yojson inventory_aggregator_of_yojson tree path 

let invalid_tag_of_yojson = 
  fun tree path : invalid_tag ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_tag = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_result_attribute_exception_of_yojson = 
  fun tree path : invalid_result_attribute_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_result_attribute_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_plugin_name_of_yojson = 
  fun tree path : invalid_plugin_name ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_plugin_name = ()
  in _res

let invalid_option_exception_of_yojson = 
  fun tree path : invalid_option_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_option_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_inventory_request_exception_of_yojson = 
  fun tree path : invalid_inventory_request_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_inventory_request_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_inventory_group_exception_of_yojson = 
  fun tree path : invalid_inventory_group_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_inventory_group_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_instance_property_filter_value_of_yojson = 
  fun tree path : invalid_instance_property_filter_value ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_instance_property_filter_value = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let invalid_instance_information_filter_value_of_yojson = 
  fun tree path : invalid_instance_information_filter_value ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_instance_information_filter_value = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let invalid_filter_value_of_yojson = 
  fun tree path : invalid_filter_value ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_filter_value = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_filter_option_of_yojson = 
  fun tree path : invalid_filter_option ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_filter_option = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    
  }
  in _res

let invalid_document_type_of_yojson = 
  fun tree path : invalid_document_type ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_document_type = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_deletion_id_exception_of_yojson = 
  fun tree path : invalid_deletion_id_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_deletion_id_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_delete_inventory_parameters_exception_of_yojson = 
  fun tree path : invalid_delete_inventory_parameters_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_delete_inventory_parameters_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_aggregator_exception_of_yojson = 
  fun tree path : invalid_aggregator_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_aggregator_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_activation_id_of_yojson = 
  fun tree path : invalid_activation_id ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_activation_id = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_activation_of_yojson = 
  fun tree path : invalid_activation ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_activation = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let instances_count_of_yojson = int_of_yojson

let instance_type_of_yojson = string_of_yojson

let instance_state_of_yojson = string_of_yojson

let instance_role_of_yojson = string_of_yojson

let instance_property_string_filter_key_of_yojson = string_of_yojson

let instance_property_filter_value_of_yojson = string_of_yojson

let instance_property_filter_value_set_of_yojson = 
  fun tree path -> list_of_yojson instance_property_filter_value_of_yojson tree path 

let instance_property_filter_operator_of_yojson = 
  fun (tree: t) path : instance_property_filter_operator -> match tree with 
    | `String "GreaterThan" -> GREATER_THAN
    | `String "LessThan" -> LESS_THAN
    | `String "BeginWith" -> BEGIN_WITH
    | `String "NotEqual" -> NOT_EQUAL
    | `String "Equal" -> EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstancePropertyFilterOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "InstancePropertyFilterOperator")

let instance_property_string_filter_of_yojson = 
  fun tree path : instance_property_string_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_property_string_filter = {
    operator = option_of_yojson (value_for_key (instance_property_filter_operator_of_yojson) "Operator") _list path;
    values = value_for_key (instance_property_filter_value_set_of_yojson) "Values" _list path;
    key = value_for_key (instance_property_string_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let instance_property_string_filter_list_of_yojson = 
  fun tree path -> list_of_yojson instance_property_string_filter_of_yojson tree path 

let instance_property_filter_key_of_yojson = 
  fun (tree: t) path : instance_property_filter_key -> match tree with 
    | `String "AssociationStatus" -> ASSOCIATION_STATUS
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "IamRole" -> IAM_ROLE
    | `String "ActivationIds" -> ACTIVATION_IDS
    | `String "DocumentName" -> DOCUMENT_NAME
    | `String "PlatformTypes" -> PLATFORM_TYPES
    | `String "PingStatus" -> PING_STATUS
    | `String "AgentVersion" -> AGENT_VERSION
    | `String "InstanceIds" -> INSTANCE_IDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstancePropertyFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "InstancePropertyFilterKey")

let instance_property_filter_of_yojson = 
  fun tree path : instance_property_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_property_filter = {
    value_set = value_for_key (instance_property_filter_value_set_of_yojson) "valueSet" _list path;
    key = value_for_key (instance_property_filter_key_of_yojson) "key" _list path;
    
  }
  in _res

let instance_property_filter_list_of_yojson = 
  fun tree path -> list_of_yojson instance_property_filter_of_yojson tree path 

let instance_name_of_yojson = string_of_yojson

let architecture_of_yojson = string_of_yojson

let ip_address_of_yojson = string_of_yojson

let activation_id_of_yojson = string_of_yojson

let computer_name_of_yojson = string_of_yojson

let instance_association_status_aggregated_count_of_yojson = 
  fun tree path -> map_of_yojson instance_count_of_yojson tree path

let instance_aggregated_association_overview_of_yojson = 
  fun tree path : instance_aggregated_association_overview ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_aggregated_association_overview = {
    instance_association_status_aggregated_count = option_of_yojson (value_for_key (instance_association_status_aggregated_count_of_yojson) "InstanceAssociationStatusAggregatedCount") _list path;
    detailed_status = option_of_yojson (value_for_key (status_name_of_yojson) "DetailedStatus") _list path;
    
  }
  in _res

let instance_property_of_yojson = 
  fun tree path : instance_property ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_property = {
    source_type = option_of_yojson (value_for_key (source_type_of_yojson) "SourceType") _list path;
    source_id = option_of_yojson (value_for_key (source_id_of_yojson) "SourceId") _list path;
    association_overview = option_of_yojson (value_for_key (instance_aggregated_association_overview_of_yojson) "AssociationOverview") _list path;
    last_successful_association_execution_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastSuccessfulAssociationExecutionDate") _list path;
    last_association_execution_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastAssociationExecutionDate") _list path;
    association_status = option_of_yojson (value_for_key (status_name_of_yojson) "AssociationStatus") _list path;
    computer_name = option_of_yojson (value_for_key (computer_name_of_yojson) "ComputerName") _list path;
    resource_type = option_of_yojson (value_for_key (string__of_yojson) "ResourceType") _list path;
    registration_date = option_of_yojson (value_for_key (date_time_of_yojson) "RegistrationDate") _list path;
    iam_role = option_of_yojson (value_for_key (iam_role_of_yojson) "IamRole") _list path;
    activation_id = option_of_yojson (value_for_key (activation_id_of_yojson) "ActivationId") _list path;
    platform_version = option_of_yojson (value_for_key (platform_version_of_yojson) "PlatformVersion") _list path;
    platform_name = option_of_yojson (value_for_key (platform_name_of_yojson) "PlatformName") _list path;
    platform_type = option_of_yojson (value_for_key (platform_type_of_yojson) "PlatformType") _list path;
    agent_version = option_of_yojson (value_for_key (version_of_yojson) "AgentVersion") _list path;
    last_ping_date_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastPingDateTime") _list path;
    ping_status = option_of_yojson (value_for_key (ping_status_of_yojson) "PingStatus") _list path;
    launch_time = option_of_yojson (value_for_key (date_time_of_yojson) "LaunchTime") _list path;
    ip_address = option_of_yojson (value_for_key (ip_address_of_yojson) "IPAddress") _list path;
    architecture = option_of_yojson (value_for_key (architecture_of_yojson) "Architecture") _list path;
    instance_state = option_of_yojson (value_for_key (instance_state_of_yojson) "InstanceState") _list path;
    key_name = option_of_yojson (value_for_key (key_name_of_yojson) "KeyName") _list path;
    instance_role = option_of_yojson (value_for_key (instance_role_of_yojson) "InstanceRole") _list path;
    instance_type = option_of_yojson (value_for_key (instance_type_of_yojson) "InstanceType") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    name = option_of_yojson (value_for_key (instance_name_of_yojson) "Name") _list path;
    
  }
  in _res

let instance_properties_of_yojson = 
  fun tree path -> list_of_yojson instance_property_of_yojson tree path 

let install_override_list_of_yojson = string_of_yojson

let instance_patch_state_of_yojson = 
  fun tree path : instance_patch_state ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_patch_state = {
    other_non_compliant_count = option_of_yojson (value_for_key (patch_other_non_compliant_count_of_yojson) "OtherNonCompliantCount") _list path;
    security_non_compliant_count = option_of_yojson (value_for_key (patch_security_non_compliant_count_of_yojson) "SecurityNonCompliantCount") _list path;
    critical_non_compliant_count = option_of_yojson (value_for_key (patch_critical_non_compliant_count_of_yojson) "CriticalNonCompliantCount") _list path;
    reboot_option = option_of_yojson (value_for_key (reboot_option_of_yojson) "RebootOption") _list path;
    last_no_reboot_install_operation_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastNoRebootInstallOperationTime") _list path;
    operation = value_for_key (patch_operation_type_of_yojson) "Operation" _list path;
    operation_end_time = value_for_key (date_time_of_yojson) "OperationEndTime" _list path;
    operation_start_time = value_for_key (date_time_of_yojson) "OperationStartTime" _list path;
    not_applicable_count = option_of_yojson (value_for_key (patch_not_applicable_count_of_yojson) "NotApplicableCount") _list path;
    unreported_not_applicable_count = option_of_yojson (value_for_key (patch_unreported_not_applicable_count_of_yojson) "UnreportedNotApplicableCount") _list path;
    failed_count = option_of_yojson (value_for_key (patch_failed_count_of_yojson) "FailedCount") _list path;
    missing_count = option_of_yojson (value_for_key (patch_missing_count_of_yojson) "MissingCount") _list path;
    installed_rejected_count = option_of_yojson (value_for_key (patch_installed_rejected_count_of_yojson) "InstalledRejectedCount") _list path;
    installed_pending_reboot_count = option_of_yojson (value_for_key (patch_installed_pending_reboot_count_of_yojson) "InstalledPendingRebootCount") _list path;
    installed_other_count = option_of_yojson (value_for_key (patch_installed_other_count_of_yojson) "InstalledOtherCount") _list path;
    installed_count = option_of_yojson (value_for_key (patch_installed_count_of_yojson) "InstalledCount") _list path;
    owner_information = option_of_yojson (value_for_key (owner_information_of_yojson) "OwnerInformation") _list path;
    install_override_list = option_of_yojson (value_for_key (install_override_list_of_yojson) "InstallOverrideList") _list path;
    snapshot_id = option_of_yojson (value_for_key (snapshot_id_of_yojson) "SnapshotId") _list path;
    baseline_id = value_for_key (baseline_id_of_yojson) "BaselineId" _list path;
    patch_group = value_for_key (patch_group_of_yojson) "PatchGroup" _list path;
    instance_id = value_for_key (instance_id_of_yojson) "InstanceId" _list path;
    
  }
  in _res

let instance_patch_states_list_of_yojson = 
  fun tree path -> list_of_yojson instance_patch_state_of_yojson tree path 

let instance_patch_state_operator_type_of_yojson = 
  fun (tree: t) path : instance_patch_state_operator_type -> match tree with 
    | `String "GreaterThan" -> GREATER_THAN
    | `String "LessThan" -> LESS_THAN
    | `String "NotEqual" -> NOT_EQUAL
    | `String "Equal" -> EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstancePatchStateOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "InstancePatchStateOperatorType")

let instance_patch_state_list_of_yojson = 
  fun tree path -> list_of_yojson instance_patch_state_of_yojson tree path 

let instance_patch_state_filter_value_of_yojson = string_of_yojson

let instance_patch_state_filter_values_of_yojson = 
  fun tree path -> list_of_yojson instance_patch_state_filter_value_of_yojson tree path 

let instance_patch_state_filter_key_of_yojson = string_of_yojson

let instance_patch_state_filter_of_yojson = 
  fun tree path : instance_patch_state_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_patch_state_filter = {
    type_ = value_for_key (instance_patch_state_operator_type_of_yojson) "Type" _list path;
    values = value_for_key (instance_patch_state_filter_values_of_yojson) "Values" _list path;
    key = value_for_key (instance_patch_state_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let instance_patch_state_filter_list_of_yojson = 
  fun tree path -> list_of_yojson instance_patch_state_filter_of_yojson tree path 

let instance_information_string_filter_key_of_yojson = string_of_yojson

let instance_information_filter_value_of_yojson = string_of_yojson

let instance_information_filter_value_set_of_yojson = 
  fun tree path -> list_of_yojson instance_information_filter_value_of_yojson tree path 

let instance_information_string_filter_of_yojson = 
  fun tree path : instance_information_string_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_information_string_filter = {
    values = value_for_key (instance_information_filter_value_set_of_yojson) "Values" _list path;
    key = value_for_key (instance_information_string_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let instance_information_string_filter_list_of_yojson = 
  fun tree path -> list_of_yojson instance_information_string_filter_of_yojson tree path 

let instance_information_of_yojson = 
  fun tree path : instance_information ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_information = {
    source_type = option_of_yojson (value_for_key (source_type_of_yojson) "SourceType") _list path;
    source_id = option_of_yojson (value_for_key (source_id_of_yojson) "SourceId") _list path;
    association_overview = option_of_yojson (value_for_key (instance_aggregated_association_overview_of_yojson) "AssociationOverview") _list path;
    last_successful_association_execution_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastSuccessfulAssociationExecutionDate") _list path;
    last_association_execution_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastAssociationExecutionDate") _list path;
    association_status = option_of_yojson (value_for_key (status_name_of_yojson) "AssociationStatus") _list path;
    computer_name = option_of_yojson (value_for_key (computer_name_of_yojson) "ComputerName") _list path;
    ip_address = option_of_yojson (value_for_key (ip_address_of_yojson) "IPAddress") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "ResourceType") _list path;
    registration_date = option_of_yojson (value_for_key (date_time_of_yojson) "RegistrationDate") _list path;
    iam_role = option_of_yojson (value_for_key (iam_role_of_yojson) "IamRole") _list path;
    activation_id = option_of_yojson (value_for_key (activation_id_of_yojson) "ActivationId") _list path;
    platform_version = option_of_yojson (value_for_key (string__of_yojson) "PlatformVersion") _list path;
    platform_name = option_of_yojson (value_for_key (string__of_yojson) "PlatformName") _list path;
    platform_type = option_of_yojson (value_for_key (platform_type_of_yojson) "PlatformType") _list path;
    is_latest_version = option_of_yojson (value_for_key (boolean__of_yojson) "IsLatestVersion") _list path;
    agent_version = option_of_yojson (value_for_key (version_of_yojson) "AgentVersion") _list path;
    last_ping_date_time = option_of_yojson (value_for_key (date_time_of_yojson) "LastPingDateTime") _list path;
    ping_status = option_of_yojson (value_for_key (ping_status_of_yojson) "PingStatus") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    
  }
  in _res

let instance_information_list_of_yojson = 
  fun tree path -> list_of_yojson instance_information_of_yojson tree path 

let instance_information_filter_key_of_yojson = 
  fun (tree: t) path : instance_information_filter_key -> match tree with 
    | `String "AssociationStatus" -> ASSOCIATION_STATUS
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "IamRole" -> IAM_ROLE
    | `String "ActivationIds" -> ACTIVATION_IDS
    | `String "PlatformTypes" -> PLATFORM_TYPES
    | `String "PingStatus" -> PING_STATUS
    | `String "AgentVersion" -> AGENT_VERSION
    | `String "InstanceIds" -> INSTANCE_IDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceInformationFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceInformationFilterKey")

let instance_information_filter_of_yojson = 
  fun tree path : instance_information_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_information_filter = {
    value_set = value_for_key (instance_information_filter_value_set_of_yojson) "valueSet" _list path;
    key = value_for_key (instance_information_filter_key_of_yojson) "key" _list path;
    
  }
  in _res

let instance_information_filter_list_of_yojson = 
  fun tree path -> list_of_yojson instance_information_filter_of_yojson tree path 

let instance_association_execution_summary_of_yojson = string_of_yojson

let agent_error_code_of_yojson = string_of_yojson

let instance_association_output_url_of_yojson = 
  fun tree path : instance_association_output_url ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_association_output_url = {
    s3_output_url = option_of_yojson (value_for_key (s3_output_url_of_yojson) "S3OutputUrl") _list path;
    
  }
  in _res

let instance_association_status_info_of_yojson = 
  fun tree path : instance_association_status_info ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_association_status_info = {
    association_name = option_of_yojson (value_for_key (association_name_of_yojson) "AssociationName") _list path;
    output_url = option_of_yojson (value_for_key (instance_association_output_url_of_yojson) "OutputUrl") _list path;
    error_code = option_of_yojson (value_for_key (agent_error_code_of_yojson) "ErrorCode") _list path;
    execution_summary = option_of_yojson (value_for_key (instance_association_execution_summary_of_yojson) "ExecutionSummary") _list path;
    detailed_status = option_of_yojson (value_for_key (status_name_of_yojson) "DetailedStatus") _list path;
    status = option_of_yojson (value_for_key (status_name_of_yojson) "Status") _list path;
    execution_date = option_of_yojson (value_for_key (date_time_of_yojson) "ExecutionDate") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    association_version = option_of_yojson (value_for_key (association_version_of_yojson) "AssociationVersion") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "Name") _list path;
    association_id = option_of_yojson (value_for_key (association_id_of_yojson) "AssociationId") _list path;
    
  }
  in _res

let instance_association_status_infos_of_yojson = 
  fun tree path -> list_of_yojson instance_association_status_info_of_yojson tree path 

let instance_association_of_yojson = 
  fun tree path : instance_association ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_association = {
    association_version = option_of_yojson (value_for_key (association_version_of_yojson) "AssociationVersion") _list path;
    content = option_of_yojson (value_for_key (document_content_of_yojson) "Content") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    association_id = option_of_yojson (value_for_key (association_id_of_yojson) "AssociationId") _list path;
    
  }
  in _res

let instance_association_list_of_yojson = 
  fun tree path -> list_of_yojson instance_association_of_yojson tree path 

let iso8601_string_of_yojson = string_of_yojson

let get_service_setting_result_of_yojson = 
  fun tree path : get_service_setting_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_setting_result = {
    service_setting = option_of_yojson (value_for_key (service_setting_of_yojson) "ServiceSetting") _list path;
    
  }
  in _res

let get_service_setting_request_of_yojson = 
  fun tree path : get_service_setting_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_service_setting_request = {
    setting_id = value_for_key (service_setting_id_of_yojson) "SettingId" _list path;
    
  }
  in _res

let get_resource_policies_response_entry_of_yojson = 
  fun tree path : get_resource_policies_response_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_policies_response_entry = {
    policy = option_of_yojson (value_for_key (policy_of_yojson) "Policy") _list path;
    policy_hash = option_of_yojson (value_for_key (policy_hash_of_yojson) "PolicyHash") _list path;
    policy_id = option_of_yojson (value_for_key (policy_id_of_yojson) "PolicyId") _list path;
    
  }
  in _res

let get_resource_policies_response_entries_of_yojson = 
  fun tree path -> list_of_yojson get_resource_policies_response_entry_of_yojson tree path 

let get_resource_policies_response_of_yojson = 
  fun tree path : get_resource_policies_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_policies_response = {
    policies = option_of_yojson (value_for_key (get_resource_policies_response_entries_of_yojson) "Policies") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let get_resource_policies_request_of_yojson = 
  fun tree path : get_resource_policies_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_resource_policies_request = {
    max_results = option_of_yojson (value_for_key (resource_policy_max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    resource_arn = value_for_key (resource_arn_string_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let get_patch_baseline_result_of_yojson = 
  fun tree path : get_patch_baseline_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_patch_baseline_result = {
    sources = option_of_yojson (value_for_key (patch_source_list_of_yojson) "Sources") _list path;
    description = option_of_yojson (value_for_key (baseline_description_of_yojson) "Description") _list path;
    modified_date = option_of_yojson (value_for_key (date_time_of_yojson) "ModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedDate") _list path;
    patch_groups = option_of_yojson (value_for_key (patch_group_list_of_yojson) "PatchGroups") _list path;
    rejected_patches_action = option_of_yojson (value_for_key (patch_action_of_yojson) "RejectedPatchesAction") _list path;
    rejected_patches = option_of_yojson (value_for_key (patch_id_list_of_yojson) "RejectedPatches") _list path;
    approved_patches_enable_non_security = option_of_yojson (value_for_key (boolean__of_yojson) "ApprovedPatchesEnableNonSecurity") _list path;
    approved_patches_compliance_level = option_of_yojson (value_for_key (patch_compliance_level_of_yojson) "ApprovedPatchesComplianceLevel") _list path;
    approved_patches = option_of_yojson (value_for_key (patch_id_list_of_yojson) "ApprovedPatches") _list path;
    approval_rules = option_of_yojson (value_for_key (patch_rule_group_of_yojson) "ApprovalRules") _list path;
    global_filters = option_of_yojson (value_for_key (patch_filter_group_of_yojson) "GlobalFilters") _list path;
    operating_system = option_of_yojson (value_for_key (operating_system_of_yojson) "OperatingSystem") _list path;
    name = option_of_yojson (value_for_key (baseline_name_of_yojson) "Name") _list path;
    baseline_id = option_of_yojson (value_for_key (baseline_id_of_yojson) "BaselineId") _list path;
    
  }
  in _res

let get_patch_baseline_request_of_yojson = 
  fun tree path : get_patch_baseline_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_patch_baseline_request = {
    baseline_id = value_for_key (baseline_id_of_yojson) "BaselineId" _list path;
    
  }
  in _res

let get_patch_baseline_for_patch_group_result_of_yojson = 
  fun tree path : get_patch_baseline_for_patch_group_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_patch_baseline_for_patch_group_result = {
    operating_system = option_of_yojson (value_for_key (operating_system_of_yojson) "OperatingSystem") _list path;
    patch_group = option_of_yojson (value_for_key (patch_group_of_yojson) "PatchGroup") _list path;
    baseline_id = option_of_yojson (value_for_key (baseline_id_of_yojson) "BaselineId") _list path;
    
  }
  in _res

let get_patch_baseline_for_patch_group_request_of_yojson = 
  fun tree path : get_patch_baseline_for_patch_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_patch_baseline_for_patch_group_request = {
    operating_system = option_of_yojson (value_for_key (operating_system_of_yojson) "OperatingSystem") _list path;
    patch_group = value_for_key (patch_group_of_yojson) "PatchGroup" _list path;
    
  }
  in _res

let get_parameters_result_of_yojson = 
  fun tree path : get_parameters_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_parameters_result = {
    invalid_parameters = option_of_yojson (value_for_key (parameter_name_list_of_yojson) "InvalidParameters") _list path;
    parameters = option_of_yojson (value_for_key (parameter_list_of_yojson) "Parameters") _list path;
    
  }
  in _res

let get_parameters_request_of_yojson = 
  fun tree path : get_parameters_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_parameters_request = {
    with_decryption = option_of_yojson (value_for_key (boolean__of_yojson) "WithDecryption") _list path;
    names = value_for_key (parameter_name_list_of_yojson) "Names" _list path;
    
  }
  in _res

let get_parameters_by_path_result_of_yojson = 
  fun tree path : get_parameters_by_path_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_parameters_by_path_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    parameters = option_of_yojson (value_for_key (parameter_list_of_yojson) "Parameters") _list path;
    
  }
  in _res

let get_parameters_by_path_max_results_of_yojson = int_of_yojson

let get_parameters_by_path_request_of_yojson = 
  fun tree path : get_parameters_by_path_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_parameters_by_path_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (get_parameters_by_path_max_results_of_yojson) "MaxResults") _list path;
    with_decryption = option_of_yojson (value_for_key (boolean__of_yojson) "WithDecryption") _list path;
    parameter_filters = option_of_yojson (value_for_key (parameter_string_filter_list_of_yojson) "ParameterFilters") _list path;
    recursive = option_of_yojson (value_for_key (boolean__of_yojson) "Recursive") _list path;
    path = value_for_key (ps_parameter_name_of_yojson) "Path" _list path;
    
  }
  in _res

let get_parameter_result_of_yojson = 
  fun tree path : get_parameter_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_parameter_result = {
    parameter = option_of_yojson (value_for_key (parameter_of_yojson) "Parameter") _list path;
    
  }
  in _res

let get_parameter_request_of_yojson = 
  fun tree path : get_parameter_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_parameter_request = {
    with_decryption = option_of_yojson (value_for_key (boolean__of_yojson) "WithDecryption") _list path;
    name = value_for_key (ps_parameter_name_of_yojson) "Name" _list path;
    
  }
  in _res

let get_parameter_history_result_of_yojson = 
  fun tree path : get_parameter_history_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_parameter_history_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    parameters = option_of_yojson (value_for_key (parameter_history_list_of_yojson) "Parameters") _list path;
    
  }
  in _res

let get_parameter_history_request_of_yojson = 
  fun tree path : get_parameter_history_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_parameter_history_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    with_decryption = option_of_yojson (value_for_key (boolean__of_yojson) "WithDecryption") _list path;
    name = value_for_key (ps_parameter_name_of_yojson) "Name" _list path;
    
  }
  in _res

let get_ops_summary_result_of_yojson = 
  fun tree path : get_ops_summary_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_ops_summary_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    entities = option_of_yojson (value_for_key (ops_entity_list_of_yojson) "Entities") _list path;
    
  }
  in _res

let get_ops_summary_request_of_yojson = 
  fun tree path : get_ops_summary_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_ops_summary_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    result_attributes = option_of_yojson (value_for_key (ops_result_attribute_list_of_yojson) "ResultAttributes") _list path;
    aggregators = option_of_yojson (value_for_key (ops_aggregator_list_of_yojson) "Aggregators") _list path;
    filters = option_of_yojson (value_for_key (ops_filter_list_of_yojson) "Filters") _list path;
    sync_name = option_of_yojson (value_for_key (resource_data_sync_name_of_yojson) "SyncName") _list path;
    
  }
  in _res

let get_ops_metadata_result_of_yojson = 
  fun tree path : get_ops_metadata_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_ops_metadata_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    metadata = option_of_yojson (value_for_key (metadata_map_of_yojson) "Metadata") _list path;
    resource_id = option_of_yojson (value_for_key (ops_metadata_resource_id_of_yojson) "ResourceId") _list path;
    
  }
  in _res

let get_ops_metadata_max_results_of_yojson = int_of_yojson

let get_ops_metadata_request_of_yojson = 
  fun tree path : get_ops_metadata_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_ops_metadata_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (get_ops_metadata_max_results_of_yojson) "MaxResults") _list path;
    ops_metadata_arn = value_for_key (ops_metadata_arn_of_yojson) "OpsMetadataArn" _list path;
    
  }
  in _res

let get_ops_item_response_of_yojson = 
  fun tree path : get_ops_item_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_ops_item_response = {
    ops_item = option_of_yojson (value_for_key (ops_item_of_yojson) "OpsItem") _list path;
    
  }
  in _res

let get_ops_item_request_of_yojson = 
  fun tree path : get_ops_item_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_ops_item_request = {
    ops_item_arn = option_of_yojson (value_for_key (ops_item_arn_of_yojson) "OpsItemArn") _list path;
    ops_item_id = value_for_key (ops_item_id_of_yojson) "OpsItemId" _list path;
    
  }
  in _res

let get_maintenance_window_task_result_of_yojson = 
  fun tree path : get_maintenance_window_task_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_maintenance_window_task_result = {
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    cutoff_behavior = option_of_yojson (value_for_key (maintenance_window_task_cutoff_behavior_of_yojson) "CutoffBehavior") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    logging_info = option_of_yojson (value_for_key (logging_info_of_yojson) "LoggingInfo") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    priority = option_of_yojson (value_for_key (maintenance_window_task_priority_of_yojson) "Priority") _list path;
    task_invocation_parameters = option_of_yojson (value_for_key (maintenance_window_task_invocation_parameters_of_yojson) "TaskInvocationParameters") _list path;
    task_parameters = option_of_yojson (value_for_key (maintenance_window_task_parameters_of_yojson) "TaskParameters") _list path;
    task_type = option_of_yojson (value_for_key (maintenance_window_task_type_of_yojson) "TaskType") _list path;
    service_role_arn = option_of_yojson (value_for_key (service_role_of_yojson) "ServiceRoleArn") _list path;
    task_arn = option_of_yojson (value_for_key (maintenance_window_task_arn_of_yojson) "TaskArn") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    window_task_id = option_of_yojson (value_for_key (maintenance_window_task_id_of_yojson) "WindowTaskId") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let get_maintenance_window_task_request_of_yojson = 
  fun tree path : get_maintenance_window_task_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_maintenance_window_task_request = {
    window_task_id = value_for_key (maintenance_window_task_id_of_yojson) "WindowTaskId" _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let get_maintenance_window_result_of_yojson = 
  fun tree path : get_maintenance_window_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_maintenance_window_result = {
    modified_date = option_of_yojson (value_for_key (date_time_of_yojson) "ModifiedDate") _list path;
    created_date = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedDate") _list path;
    enabled = option_of_yojson (value_for_key (maintenance_window_enabled_of_yojson) "Enabled") _list path;
    allow_unassociated_targets = option_of_yojson (value_for_key (maintenance_window_allow_unassociated_targets_of_yojson) "AllowUnassociatedTargets") _list path;
    cutoff = option_of_yojson (value_for_key (maintenance_window_cutoff_of_yojson) "Cutoff") _list path;
    duration = option_of_yojson (value_for_key (maintenance_window_duration_hours_of_yojson) "Duration") _list path;
    next_execution_time = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "NextExecutionTime") _list path;
    schedule_offset = option_of_yojson (value_for_key (maintenance_window_offset_of_yojson) "ScheduleOffset") _list path;
    schedule_timezone = option_of_yojson (value_for_key (maintenance_window_timezone_of_yojson) "ScheduleTimezone") _list path;
    schedule = option_of_yojson (value_for_key (maintenance_window_schedule_of_yojson) "Schedule") _list path;
    end_date = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "EndDate") _list path;
    start_date = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "StartDate") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = option_of_yojson (value_for_key (maintenance_window_name_of_yojson) "Name") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let get_maintenance_window_request_of_yojson = 
  fun tree path : get_maintenance_window_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_maintenance_window_request = {
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let get_maintenance_window_execution_task_result_of_yojson = 
  fun tree path : get_maintenance_window_execution_task_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_maintenance_window_execution_task_result = {
    triggered_alarms = option_of_yojson (value_for_key (alarm_state_information_list_of_yojson) "TriggeredAlarms") _list path;
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    end_time = option_of_yojson (value_for_key (date_time_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    status_details = option_of_yojson (value_for_key (maintenance_window_execution_status_details_of_yojson) "StatusDetails") _list path;
    status = option_of_yojson (value_for_key (maintenance_window_execution_status_of_yojson) "Status") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    priority = option_of_yojson (value_for_key (maintenance_window_task_priority_of_yojson) "Priority") _list path;
    task_parameters = option_of_yojson (value_for_key (maintenance_window_task_parameters_list_of_yojson) "TaskParameters") _list path;
    type_ = option_of_yojson (value_for_key (maintenance_window_task_type_of_yojson) "Type") _list path;
    service_role = option_of_yojson (value_for_key (service_role_of_yojson) "ServiceRole") _list path;
    task_arn = option_of_yojson (value_for_key (maintenance_window_task_arn_of_yojson) "TaskArn") _list path;
    task_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_task_id_of_yojson) "TaskExecutionId") _list path;
    window_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId") _list path;
    
  }
  in _res

let get_maintenance_window_execution_task_request_of_yojson = 
  fun tree path : get_maintenance_window_execution_task_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_maintenance_window_execution_task_request = {
    task_id = value_for_key (maintenance_window_execution_task_id_of_yojson) "TaskId" _list path;
    window_execution_id = value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId" _list path;
    
  }
  in _res

let get_maintenance_window_execution_task_invocation_result_of_yojson = 
  fun tree path : get_maintenance_window_execution_task_invocation_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_maintenance_window_execution_task_invocation_result = {
    window_target_id = option_of_yojson (value_for_key (maintenance_window_task_target_id_of_yojson) "WindowTargetId") _list path;
    owner_information = option_of_yojson (value_for_key (owner_information_of_yojson) "OwnerInformation") _list path;
    end_time = option_of_yojson (value_for_key (date_time_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    status_details = option_of_yojson (value_for_key (maintenance_window_execution_status_details_of_yojson) "StatusDetails") _list path;
    status = option_of_yojson (value_for_key (maintenance_window_execution_status_of_yojson) "Status") _list path;
    parameters = option_of_yojson (value_for_key (maintenance_window_execution_task_invocation_parameters_of_yojson) "Parameters") _list path;
    task_type = option_of_yojson (value_for_key (maintenance_window_task_type_of_yojson) "TaskType") _list path;
    execution_id = option_of_yojson (value_for_key (maintenance_window_execution_task_execution_id_of_yojson) "ExecutionId") _list path;
    invocation_id = option_of_yojson (value_for_key (maintenance_window_execution_task_invocation_id_of_yojson) "InvocationId") _list path;
    task_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_task_id_of_yojson) "TaskExecutionId") _list path;
    window_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId") _list path;
    
  }
  in _res

let get_maintenance_window_execution_task_invocation_request_of_yojson = 
  fun tree path : get_maintenance_window_execution_task_invocation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_maintenance_window_execution_task_invocation_request = {
    invocation_id = value_for_key (maintenance_window_execution_task_invocation_id_of_yojson) "InvocationId" _list path;
    task_id = value_for_key (maintenance_window_execution_task_id_of_yojson) "TaskId" _list path;
    window_execution_id = value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId" _list path;
    
  }
  in _res

let get_maintenance_window_execution_result_of_yojson = 
  fun tree path : get_maintenance_window_execution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_maintenance_window_execution_result = {
    end_time = option_of_yojson (value_for_key (date_time_of_yojson) "EndTime") _list path;
    start_time = option_of_yojson (value_for_key (date_time_of_yojson) "StartTime") _list path;
    status_details = option_of_yojson (value_for_key (maintenance_window_execution_status_details_of_yojson) "StatusDetails") _list path;
    status = option_of_yojson (value_for_key (maintenance_window_execution_status_of_yojson) "Status") _list path;
    task_ids = option_of_yojson (value_for_key (maintenance_window_execution_task_id_list_of_yojson) "TaskIds") _list path;
    window_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId") _list path;
    
  }
  in _res

let get_maintenance_window_execution_request_of_yojson = 
  fun tree path : get_maintenance_window_execution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_maintenance_window_execution_request = {
    window_execution_id = value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId" _list path;
    
  }
  in _res

let get_inventory_schema_result_of_yojson = 
  fun tree path : get_inventory_schema_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_inventory_schema_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    schemas = option_of_yojson (value_for_key (inventory_item_schema_result_list_of_yojson) "Schemas") _list path;
    
  }
  in _res

let get_inventory_schema_max_results_of_yojson = int_of_yojson

let aggregator_schema_only_of_yojson = bool_of_yojson

let get_inventory_schema_request_of_yojson = 
  fun tree path : get_inventory_schema_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_inventory_schema_request = {
    sub_type = option_of_yojson (value_for_key (is_sub_type_schema_of_yojson) "SubType") _list path;
    aggregator = option_of_yojson (value_for_key (aggregator_schema_only_of_yojson) "Aggregator") _list path;
    max_results = option_of_yojson (value_for_key (get_inventory_schema_max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    type_name = option_of_yojson (value_for_key (inventory_item_type_name_filter_of_yojson) "TypeName") _list path;
    
  }
  in _res

let get_inventory_result_of_yojson = 
  fun tree path : get_inventory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_inventory_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    entities = option_of_yojson (value_for_key (inventory_result_entity_list_of_yojson) "Entities") _list path;
    
  }
  in _res

let get_inventory_request_of_yojson = 
  fun tree path : get_inventory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_inventory_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    result_attributes = option_of_yojson (value_for_key (result_attribute_list_of_yojson) "ResultAttributes") _list path;
    aggregators = option_of_yojson (value_for_key (inventory_aggregator_list_of_yojson) "Aggregators") _list path;
    filters = option_of_yojson (value_for_key (inventory_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let content_length_of_yojson = long_of_yojson

let attachment_hash_of_yojson = string_of_yojson

let attachment_hash_type_of_yojson = 
  fun (tree: t) path : attachment_hash_type -> match tree with 
    | `String "Sha256" -> SHA256
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttachmentHashType" value)
    | _ -> raise (deserialize_wrong_type_error path "AttachmentHashType")

let attachment_url_of_yojson = string_of_yojson

let attachment_content_of_yojson = 
  fun tree path : attachment_content ->
  let _list = assoc_of_yojson tree path in
  let _res : attachment_content = {
    url = option_of_yojson (value_for_key (attachment_url_of_yojson) "Url") _list path;
    hash_type = option_of_yojson (value_for_key (attachment_hash_type_of_yojson) "HashType") _list path;
    hash = option_of_yojson (value_for_key (attachment_hash_of_yojson) "Hash") _list path;
    size = option_of_yojson (value_for_key (content_length_of_yojson) "Size") _list path;
    name = option_of_yojson (value_for_key (attachment_name_of_yojson) "Name") _list path;
    
  }
  in _res

let attachment_content_list_of_yojson = 
  fun tree path -> list_of_yojson attachment_content_of_yojson tree path 

let get_document_result_of_yojson = 
  fun tree path : get_document_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_document_result = {
    review_status = option_of_yojson (value_for_key (review_status_of_yojson) "ReviewStatus") _list path;
    attachments_content = option_of_yojson (value_for_key (attachment_content_list_of_yojson) "AttachmentsContent") _list path;
    requires = option_of_yojson (value_for_key (document_requires_list_of_yojson) "Requires") _list path;
    document_format = option_of_yojson (value_for_key (document_format_of_yojson) "DocumentFormat") _list path;
    document_type = option_of_yojson (value_for_key (document_type_of_yojson) "DocumentType") _list path;
    content = option_of_yojson (value_for_key (document_content_of_yojson) "Content") _list path;
    status_information = option_of_yojson (value_for_key (document_status_information_of_yojson) "StatusInformation") _list path;
    status = option_of_yojson (value_for_key (document_status_of_yojson) "Status") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "VersionName") _list path;
    display_name = option_of_yojson (value_for_key (document_display_name_of_yojson) "DisplayName") _list path;
    created_date = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedDate") _list path;
    name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "Name") _list path;
    
  }
  in _res

let get_document_request_of_yojson = 
  fun tree path : get_document_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_document_request = {
    document_format = option_of_yojson (value_for_key (document_format_of_yojson) "DocumentFormat") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "VersionName") _list path;
    name = value_for_key (document_ar_n_of_yojson) "Name" _list path;
    
  }
  in _res

let get_deployable_patch_snapshot_for_instance_result_of_yojson = 
  fun tree path : get_deployable_patch_snapshot_for_instance_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_deployable_patch_snapshot_for_instance_result = {
    product = option_of_yojson (value_for_key (product_of_yojson) "Product") _list path;
    snapshot_download_url = option_of_yojson (value_for_key (snapshot_download_url_of_yojson) "SnapshotDownloadUrl") _list path;
    snapshot_id = option_of_yojson (value_for_key (snapshot_id_of_yojson) "SnapshotId") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    
  }
  in _res

let baseline_override_of_yojson = 
  fun tree path : baseline_override ->
  let _list = assoc_of_yojson tree path in
  let _res : baseline_override = {
    sources = option_of_yojson (value_for_key (patch_source_list_of_yojson) "Sources") _list path;
    approved_patches_enable_non_security = option_of_yojson (value_for_key (boolean__of_yojson) "ApprovedPatchesEnableNonSecurity") _list path;
    rejected_patches_action = option_of_yojson (value_for_key (patch_action_of_yojson) "RejectedPatchesAction") _list path;
    rejected_patches = option_of_yojson (value_for_key (patch_id_list_of_yojson) "RejectedPatches") _list path;
    approved_patches_compliance_level = option_of_yojson (value_for_key (patch_compliance_level_of_yojson) "ApprovedPatchesComplianceLevel") _list path;
    approved_patches = option_of_yojson (value_for_key (patch_id_list_of_yojson) "ApprovedPatches") _list path;
    approval_rules = option_of_yojson (value_for_key (patch_rule_group_of_yojson) "ApprovalRules") _list path;
    global_filters = option_of_yojson (value_for_key (patch_filter_group_of_yojson) "GlobalFilters") _list path;
    operating_system = option_of_yojson (value_for_key (operating_system_of_yojson) "OperatingSystem") _list path;
    
  }
  in _res

let get_deployable_patch_snapshot_for_instance_request_of_yojson = 
  fun tree path : get_deployable_patch_snapshot_for_instance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_deployable_patch_snapshot_for_instance_request = {
    baseline_override = option_of_yojson (value_for_key (baseline_override_of_yojson) "BaselineOverride") _list path;
    snapshot_id = value_for_key (snapshot_id_of_yojson) "SnapshotId" _list path;
    instance_id = value_for_key (instance_id_of_yojson) "InstanceId" _list path;
    
  }
  in _res

let get_default_patch_baseline_result_of_yojson = 
  fun tree path : get_default_patch_baseline_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_default_patch_baseline_result = {
    operating_system = option_of_yojson (value_for_key (operating_system_of_yojson) "OperatingSystem") _list path;
    baseline_id = option_of_yojson (value_for_key (baseline_id_of_yojson) "BaselineId") _list path;
    
  }
  in _res

let get_default_patch_baseline_request_of_yojson = 
  fun tree path : get_default_patch_baseline_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_default_patch_baseline_request = {
    operating_system = option_of_yojson (value_for_key (operating_system_of_yojson) "OperatingSystem") _list path;
    
  }
  in _res

let connection_status_of_yojson = 
  fun (tree: t) path : connection_status -> match tree with 
    | `String "notconnected" -> NOT_CONNECTED
    | `String "connected" -> CONNECTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ConnectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionStatus")

let get_connection_status_response_of_yojson = 
  fun tree path : get_connection_status_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_connection_status_response = {
    status = option_of_yojson (value_for_key (connection_status_of_yojson) "Status") _list path;
    target = option_of_yojson (value_for_key (session_target_of_yojson) "Target") _list path;
    
  }
  in _res

let get_connection_status_request_of_yojson = 
  fun tree path : get_connection_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_connection_status_request = {
    target = value_for_key (session_target_of_yojson) "Target" _list path;
    
  }
  in _res

let get_command_invocation_result_of_yojson = 
  fun tree path : get_command_invocation_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_command_invocation_result = {
    cloud_watch_output_config = option_of_yojson (value_for_key (cloud_watch_output_config_of_yojson) "CloudWatchOutputConfig") _list path;
    standard_error_url = option_of_yojson (value_for_key (url_of_yojson) "StandardErrorUrl") _list path;
    standard_error_content = option_of_yojson (value_for_key (standard_error_content_of_yojson) "StandardErrorContent") _list path;
    standard_output_url = option_of_yojson (value_for_key (url_of_yojson) "StandardOutputUrl") _list path;
    standard_output_content = option_of_yojson (value_for_key (standard_output_content_of_yojson) "StandardOutputContent") _list path;
    status_details = option_of_yojson (value_for_key (status_details_of_yojson) "StatusDetails") _list path;
    status = option_of_yojson (value_for_key (command_invocation_status_of_yojson) "Status") _list path;
    execution_end_date_time = option_of_yojson (value_for_key (string_date_time_of_yojson) "ExecutionEndDateTime") _list path;
    execution_elapsed_time = option_of_yojson (value_for_key (string_date_time_of_yojson) "ExecutionElapsedTime") _list path;
    execution_start_date_time = option_of_yojson (value_for_key (string_date_time_of_yojson) "ExecutionStartDateTime") _list path;
    response_code = option_of_yojson (value_for_key (response_code_of_yojson) "ResponseCode") _list path;
    plugin_name = option_of_yojson (value_for_key (command_plugin_name_of_yojson) "PluginName") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    document_name = option_of_yojson (value_for_key (document_name_of_yojson) "DocumentName") _list path;
    comment = option_of_yojson (value_for_key (comment_of_yojson) "Comment") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    command_id = option_of_yojson (value_for_key (command_id_of_yojson) "CommandId") _list path;
    
  }
  in _res

let get_command_invocation_request_of_yojson = 
  fun tree path : get_command_invocation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_command_invocation_request = {
    plugin_name = option_of_yojson (value_for_key (command_plugin_name_of_yojson) "PluginName") _list path;
    instance_id = value_for_key (instance_id_of_yojson) "InstanceId" _list path;
    command_id = value_for_key (command_id_of_yojson) "CommandId" _list path;
    
  }
  in _res

let calendar_state_of_yojson = 
  fun (tree: t) path : calendar_state -> match tree with 
    | `String "CLOSED" -> CLOSED
    | `String "OPEN" -> OPEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "CalendarState" value)
    | _ -> raise (deserialize_wrong_type_error path "CalendarState")

let get_calendar_state_response_of_yojson = 
  fun tree path : get_calendar_state_response ->
  let _list = assoc_of_yojson tree path in
  let _res : get_calendar_state_response = {
    next_transition_time = option_of_yojson (value_for_key (iso8601_string_of_yojson) "NextTransitionTime") _list path;
    at_time = option_of_yojson (value_for_key (iso8601_string_of_yojson) "AtTime") _list path;
    state = option_of_yojson (value_for_key (calendar_state_of_yojson) "State") _list path;
    
  }
  in _res

let get_calendar_state_request_of_yojson = 
  fun tree path : get_calendar_state_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_calendar_state_request = {
    at_time = option_of_yojson (value_for_key (iso8601_string_of_yojson) "AtTime") _list path;
    calendar_names = value_for_key (calendar_name_or_arn_list_of_yojson) "CalendarNames" _list path;
    
  }
  in _res

let automation_subtype_of_yojson = 
  fun (tree: t) path : automation_subtype -> match tree with 
    | `String "ChangeRequest" -> ChangeRequest
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutomationSubtype" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationSubtype")

let automation_execution_of_yojson = 
  fun tree path : automation_execution ->
  let _list = assoc_of_yojson tree path in
  let _res : automation_execution = {
    variables = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Variables") _list path;
    change_request_name = option_of_yojson (value_for_key (change_request_name_of_yojson) "ChangeRequestName") _list path;
    association_id = option_of_yojson (value_for_key (string__of_yojson) "AssociationId") _list path;
    ops_item_id = option_of_yojson (value_for_key (string__of_yojson) "OpsItemId") _list path;
    runbooks = option_of_yojson (value_for_key (runbooks_of_yojson) "Runbooks") _list path;
    scheduled_time = option_of_yojson (value_for_key (date_time_of_yojson) "ScheduledTime") _list path;
    automation_subtype = option_of_yojson (value_for_key (automation_subtype_of_yojson) "AutomationSubtype") _list path;
    triggered_alarms = option_of_yojson (value_for_key (alarm_state_information_list_of_yojson) "TriggeredAlarms") _list path;
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    progress_counters = option_of_yojson (value_for_key (progress_counters_of_yojson) "ProgressCounters") _list path;
    target_locations = option_of_yojson (value_for_key (target_locations_of_yojson) "TargetLocations") _list path;
    target = option_of_yojson (value_for_key (string__of_yojson) "Target") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    resolved_targets = option_of_yojson (value_for_key (resolved_targets_of_yojson) "ResolvedTargets") _list path;
    target_maps = option_of_yojson (value_for_key (target_maps_of_yojson) "TargetMaps") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    target_parameter_name = option_of_yojson (value_for_key (automation_parameter_key_of_yojson) "TargetParameterName") _list path;
    current_action = option_of_yojson (value_for_key (string__of_yojson) "CurrentAction") _list path;
    current_step_name = option_of_yojson (value_for_key (string__of_yojson) "CurrentStepName") _list path;
    executed_by = option_of_yojson (value_for_key (string__of_yojson) "ExecutedBy") _list path;
    parent_automation_execution_id = option_of_yojson (value_for_key (automation_execution_id_of_yojson) "ParentAutomationExecutionId") _list path;
    mode = option_of_yojson (value_for_key (execution_mode_of_yojson) "Mode") _list path;
    failure_message = option_of_yojson (value_for_key (string__of_yojson) "FailureMessage") _list path;
    outputs = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Outputs") _list path;
    parameters = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Parameters") _list path;
    step_executions_truncated = option_of_yojson (value_for_key (boolean__of_yojson) "StepExecutionsTruncated") _list path;
    step_executions = option_of_yojson (value_for_key (step_execution_list_of_yojson) "StepExecutions") _list path;
    automation_execution_status = option_of_yojson (value_for_key (automation_execution_status_of_yojson) "AutomationExecutionStatus") _list path;
    execution_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "ExecutionEndTime") _list path;
    execution_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "ExecutionStartTime") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    document_name = option_of_yojson (value_for_key (document_name_of_yojson) "DocumentName") _list path;
    automation_execution_id = option_of_yojson (value_for_key (automation_execution_id_of_yojson) "AutomationExecutionId") _list path;
    
  }
  in _res

let get_automation_execution_result_of_yojson = 
  fun tree path : get_automation_execution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_automation_execution_result = {
    automation_execution = option_of_yojson (value_for_key (automation_execution_of_yojson) "AutomationExecution") _list path;
    
  }
  in _res

let get_automation_execution_request_of_yojson = 
  fun tree path : get_automation_execution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_automation_execution_request = {
    automation_execution_id = value_for_key (automation_execution_id_of_yojson) "AutomationExecutionId" _list path;
    
  }
  in _res

let fault_of_yojson = 
  fun (tree: t) path : fault -> match tree with 
    | `String "Unknown" -> Unknown
    | `String "Server" -> Server
    | `String "Client" -> Client
    | `String value -> raise (deserialize_unknown_enum_value_error path "Fault" value)
    | _ -> raise (deserialize_wrong_type_error path "Fault")

let create_association_batch_request_entry_of_yojson = 
  fun tree path : create_association_batch_request_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : create_association_batch_request_entry = {
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    target_maps = option_of_yojson (value_for_key (target_maps_of_yojson) "TargetMaps") _list path;
    duration = option_of_yojson (value_for_key (duration_of_yojson) "Duration") _list path;
    schedule_offset = option_of_yojson (value_for_key (schedule_offset_of_yojson) "ScheduleOffset") _list path;
    target_locations = option_of_yojson (value_for_key (target_locations_of_yojson) "TargetLocations") _list path;
    calendar_names = option_of_yojson (value_for_key (calendar_name_or_arn_list_of_yojson) "CalendarNames") _list path;
    apply_only_at_cron_interval = option_of_yojson (value_for_key (apply_only_at_cron_interval_of_yojson) "ApplyOnlyAtCronInterval") _list path;
    sync_compliance = option_of_yojson (value_for_key (association_sync_compliance_of_yojson) "SyncCompliance") _list path;
    compliance_severity = option_of_yojson (value_for_key (association_compliance_severity_of_yojson) "ComplianceSeverity") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    association_name = option_of_yojson (value_for_key (association_name_of_yojson) "AssociationName") _list path;
    output_location = option_of_yojson (value_for_key (instance_association_output_location_of_yojson) "OutputLocation") _list path;
    schedule_expression = option_of_yojson (value_for_key (schedule_expression_of_yojson) "ScheduleExpression") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    automation_target_parameter_name = option_of_yojson (value_for_key (automation_target_parameter_name_of_yojson) "AutomationTargetParameterName") _list path;
    parameters = option_of_yojson (value_for_key (parameters_of_yojson) "Parameters") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    name = value_for_key (document_ar_n_of_yojson) "Name" _list path;
    
  }
  in _res

let batch_error_message_of_yojson = string_of_yojson

let failed_create_association_of_yojson = 
  fun tree path : failed_create_association ->
  let _list = assoc_of_yojson tree path in
  let _res : failed_create_association = {
    fault = option_of_yojson (value_for_key (fault_of_yojson) "Fault") _list path;
    message = option_of_yojson (value_for_key (batch_error_message_of_yojson) "Message") _list path;
    entry = option_of_yojson (value_for_key (create_association_batch_request_entry_of_yojson) "Entry") _list path;
    
  }
  in _res

let failed_create_association_list_of_yojson = 
  fun tree path -> list_of_yojson failed_create_association_of_yojson tree path 

let expiration_date_of_yojson = timestamp_of_yojson

let effective_patch_of_yojson = 
  fun tree path : effective_patch ->
  let _list = assoc_of_yojson tree path in
  let _res : effective_patch = {
    patch_status = option_of_yojson (value_for_key (patch_status_of_yojson) "PatchStatus") _list path;
    patch = option_of_yojson (value_for_key (patch_of_yojson) "Patch") _list path;
    
  }
  in _res

let effective_patch_list_of_yojson = 
  fun tree path -> list_of_yojson effective_patch_of_yojson tree path 

let effective_instance_association_max_results_of_yojson = int_of_yojson

let dry_run_of_yojson = bool_of_yojson

let document_permission_max_results_of_yojson = int_of_yojson

let document_already_exists_of_yojson = 
  fun tree path : document_already_exists ->
  let _list = assoc_of_yojson tree path in
  let _res : document_already_exists = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let disassociate_ops_item_related_item_response_of_yojson = 
  fun tree path : disassociate_ops_item_related_item_response ->
  let _list = assoc_of_yojson tree path in
  let _res : disassociate_ops_item_related_item_response = ()
  in _res

let disassociate_ops_item_related_item_request_of_yojson = 
  fun tree path : disassociate_ops_item_related_item_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disassociate_ops_item_related_item_request = {
    association_id = value_for_key (ops_item_related_item_association_id_of_yojson) "AssociationId" _list path;
    ops_item_id = value_for_key (ops_item_id_of_yojson) "OpsItemId" _list path;
    
  }
  in _res

let describe_sessions_response_of_yojson = 
  fun tree path : describe_sessions_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_sessions_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    sessions = option_of_yojson (value_for_key (session_list_of_yojson) "Sessions") _list path;
    
  }
  in _res

let describe_sessions_request_of_yojson = 
  fun tree path : describe_sessions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_sessions_request = {
    filters = option_of_yojson (value_for_key (session_filter_list_of_yojson) "Filters") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (session_max_results_of_yojson) "MaxResults") _list path;
    state = value_for_key (session_state_of_yojson) "State" _list path;
    
  }
  in _res

let describe_patch_properties_result_of_yojson = 
  fun tree path : describe_patch_properties_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_patch_properties_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    properties = option_of_yojson (value_for_key (patch_properties_list_of_yojson) "Properties") _list path;
    
  }
  in _res

let describe_patch_properties_request_of_yojson = 
  fun tree path : describe_patch_properties_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_patch_properties_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    patch_set = option_of_yojson (value_for_key (patch_set_of_yojson) "PatchSet") _list path;
    property = value_for_key (patch_property_of_yojson) "Property" _list path;
    operating_system = value_for_key (operating_system_of_yojson) "OperatingSystem" _list path;
    
  }
  in _res

let describe_patch_groups_result_of_yojson = 
  fun tree path : describe_patch_groups_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_patch_groups_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    mappings = option_of_yojson (value_for_key (patch_group_patch_baseline_mapping_list_of_yojson) "Mappings") _list path;
    
  }
  in _res

let describe_patch_groups_request_of_yojson = 
  fun tree path : describe_patch_groups_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_patch_groups_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    filters = option_of_yojson (value_for_key (patch_orchestrator_filter_list_of_yojson) "Filters") _list path;
    max_results = option_of_yojson (value_for_key (patch_baseline_max_results_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let describe_patch_group_state_result_of_yojson = 
  fun tree path : describe_patch_group_state_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_patch_group_state_result = {
    instances_with_other_non_compliant_patches = option_of_yojson (value_for_key (instances_count_of_yojson) "InstancesWithOtherNonCompliantPatches") _list path;
    instances_with_security_non_compliant_patches = option_of_yojson (value_for_key (instances_count_of_yojson) "InstancesWithSecurityNonCompliantPatches") _list path;
    instances_with_critical_non_compliant_patches = option_of_yojson (value_for_key (instances_count_of_yojson) "InstancesWithCriticalNonCompliantPatches") _list path;
    instances_with_unreported_not_applicable_patches = option_of_yojson (value_for_key (integer__of_yojson) "InstancesWithUnreportedNotApplicablePatches") _list path;
    instances_with_not_applicable_patches = option_of_yojson (value_for_key (integer__of_yojson) "InstancesWithNotApplicablePatches") _list path;
    instances_with_failed_patches = option_of_yojson (value_for_key (integer__of_yojson) "InstancesWithFailedPatches") _list path;
    instances_with_missing_patches = option_of_yojson (value_for_key (integer__of_yojson) "InstancesWithMissingPatches") _list path;
    instances_with_installed_rejected_patches = option_of_yojson (value_for_key (instances_count_of_yojson) "InstancesWithInstalledRejectedPatches") _list path;
    instances_with_installed_pending_reboot_patches = option_of_yojson (value_for_key (instances_count_of_yojson) "InstancesWithInstalledPendingRebootPatches") _list path;
    instances_with_installed_other_patches = option_of_yojson (value_for_key (integer__of_yojson) "InstancesWithInstalledOtherPatches") _list path;
    instances_with_installed_patches = option_of_yojson (value_for_key (integer__of_yojson) "InstancesWithInstalledPatches") _list path;
    instances = option_of_yojson (value_for_key (integer__of_yojson) "Instances") _list path;
    
  }
  in _res

let describe_patch_group_state_request_of_yojson = 
  fun tree path : describe_patch_group_state_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_patch_group_state_request = {
    patch_group = value_for_key (patch_group_of_yojson) "PatchGroup" _list path;
    
  }
  in _res

let describe_patch_baselines_result_of_yojson = 
  fun tree path : describe_patch_baselines_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_patch_baselines_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    baseline_identities = option_of_yojson (value_for_key (patch_baseline_identity_list_of_yojson) "BaselineIdentities") _list path;
    
  }
  in _res

let describe_patch_baselines_request_of_yojson = 
  fun tree path : describe_patch_baselines_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_patch_baselines_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (patch_baseline_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (patch_orchestrator_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let describe_parameters_result_of_yojson = 
  fun tree path : describe_parameters_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_parameters_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    parameters = option_of_yojson (value_for_key (parameter_metadata_list_of_yojson) "Parameters") _list path;
    
  }
  in _res

let describe_parameters_request_of_yojson = 
  fun tree path : describe_parameters_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_parameters_request = {
    shared = option_of_yojson (value_for_key (boolean__of_yojson) "Shared") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    parameter_filters = option_of_yojson (value_for_key (parameter_string_filter_list_of_yojson) "ParameterFilters") _list path;
    filters = option_of_yojson (value_for_key (parameters_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let describe_ops_items_response_of_yojson = 
  fun tree path : describe_ops_items_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_ops_items_response = {
    ops_item_summaries = option_of_yojson (value_for_key (ops_item_summaries_of_yojson) "OpsItemSummaries") _list path;
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    
  }
  in _res

let describe_ops_items_request_of_yojson = 
  fun tree path : describe_ops_items_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_ops_items_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (ops_item_max_results_of_yojson) "MaxResults") _list path;
    ops_item_filters = option_of_yojson (value_for_key (ops_item_filters_of_yojson) "OpsItemFilters") _list path;
    
  }
  in _res

let describe_maintenance_windows_result_of_yojson = 
  fun tree path : describe_maintenance_windows_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_windows_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    window_identities = option_of_yojson (value_for_key (maintenance_window_identity_list_of_yojson) "WindowIdentities") _list path;
    
  }
  in _res

let describe_maintenance_windows_request_of_yojson = 
  fun tree path : describe_maintenance_windows_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_windows_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (maintenance_window_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (maintenance_window_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let describe_maintenance_windows_for_target_result_of_yojson = 
  fun tree path : describe_maintenance_windows_for_target_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_windows_for_target_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    window_identities = option_of_yojson (value_for_key (maintenance_windows_for_target_list_of_yojson) "WindowIdentities") _list path;
    
  }
  in _res

let describe_maintenance_windows_for_target_request_of_yojson = 
  fun tree path : describe_maintenance_windows_for_target_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_windows_for_target_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (maintenance_window_search_max_results_of_yojson) "MaxResults") _list path;
    resource_type = value_for_key (maintenance_window_resource_type_of_yojson) "ResourceType" _list path;
    targets = value_for_key (targets_of_yojson) "Targets" _list path;
    
  }
  in _res

let describe_maintenance_window_tasks_result_of_yojson = 
  fun tree path : describe_maintenance_window_tasks_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_tasks_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    tasks = option_of_yojson (value_for_key (maintenance_window_task_list_of_yojson) "Tasks") _list path;
    
  }
  in _res

let describe_maintenance_window_tasks_request_of_yojson = 
  fun tree path : describe_maintenance_window_tasks_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_tasks_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (maintenance_window_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (maintenance_window_filter_list_of_yojson) "Filters") _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let describe_maintenance_window_targets_result_of_yojson = 
  fun tree path : describe_maintenance_window_targets_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_targets_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    targets = option_of_yojson (value_for_key (maintenance_window_target_list_of_yojson) "Targets") _list path;
    
  }
  in _res

let describe_maintenance_window_targets_request_of_yojson = 
  fun tree path : describe_maintenance_window_targets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_targets_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (maintenance_window_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (maintenance_window_filter_list_of_yojson) "Filters") _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let describe_maintenance_window_schedule_result_of_yojson = 
  fun tree path : describe_maintenance_window_schedule_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_schedule_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    scheduled_window_executions = option_of_yojson (value_for_key (scheduled_window_execution_list_of_yojson) "ScheduledWindowExecutions") _list path;
    
  }
  in _res

let describe_maintenance_window_schedule_request_of_yojson = 
  fun tree path : describe_maintenance_window_schedule_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_schedule_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (maintenance_window_search_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (patch_orchestrator_filter_list_of_yojson) "Filters") _list path;
    resource_type = option_of_yojson (value_for_key (maintenance_window_resource_type_of_yojson) "ResourceType") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let describe_maintenance_window_executions_result_of_yojson = 
  fun tree path : describe_maintenance_window_executions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_executions_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    window_executions = option_of_yojson (value_for_key (maintenance_window_execution_list_of_yojson) "WindowExecutions") _list path;
    
  }
  in _res

let describe_maintenance_window_executions_request_of_yojson = 
  fun tree path : describe_maintenance_window_executions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_executions_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (maintenance_window_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (maintenance_window_filter_list_of_yojson) "Filters") _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let describe_maintenance_window_execution_tasks_result_of_yojson = 
  fun tree path : describe_maintenance_window_execution_tasks_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_execution_tasks_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    window_execution_task_identities = option_of_yojson (value_for_key (maintenance_window_execution_task_identity_list_of_yojson) "WindowExecutionTaskIdentities") _list path;
    
  }
  in _res

let describe_maintenance_window_execution_tasks_request_of_yojson = 
  fun tree path : describe_maintenance_window_execution_tasks_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_execution_tasks_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (maintenance_window_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (maintenance_window_filter_list_of_yojson) "Filters") _list path;
    window_execution_id = value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId" _list path;
    
  }
  in _res

let describe_maintenance_window_execution_task_invocations_result_of_yojson = 
  fun tree path : describe_maintenance_window_execution_task_invocations_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_execution_task_invocations_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    window_execution_task_invocation_identities = option_of_yojson (value_for_key (maintenance_window_execution_task_invocation_identity_list_of_yojson) "WindowExecutionTaskInvocationIdentities") _list path;
    
  }
  in _res

let describe_maintenance_window_execution_task_invocations_request_of_yojson
= 
  fun tree path : describe_maintenance_window_execution_task_invocations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_maintenance_window_execution_task_invocations_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (maintenance_window_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (maintenance_window_filter_list_of_yojson) "Filters") _list path;
    task_id = value_for_key (maintenance_window_execution_task_id_of_yojson) "TaskId" _list path;
    window_execution_id = value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId" _list path;
    
  }
  in _res

let describe_inventory_deletions_result_of_yojson = 
  fun tree path : describe_inventory_deletions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_inventory_deletions_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    inventory_deletions = option_of_yojson (value_for_key (inventory_deletions_list_of_yojson) "InventoryDeletions") _list path;
    
  }
  in _res

let describe_inventory_deletions_request_of_yojson = 
  fun tree path : describe_inventory_deletions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_inventory_deletions_request = {
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    deletion_id = option_of_yojson (value_for_key (uui_d_of_yojson) "DeletionId") _list path;
    
  }
  in _res

let describe_instance_properties_result_of_yojson = 
  fun tree path : describe_instance_properties_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_properties_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    instance_properties = option_of_yojson (value_for_key (instance_properties_of_yojson) "InstanceProperties") _list path;
    
  }
  in _res

let describe_instance_properties_max_results_of_yojson = int_of_yojson

let describe_instance_properties_request_of_yojson = 
  fun tree path : describe_instance_properties_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_properties_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (describe_instance_properties_max_results_of_yojson) "MaxResults") _list path;
    filters_with_operator = option_of_yojson (value_for_key (instance_property_string_filter_list_of_yojson) "FiltersWithOperator") _list path;
    instance_property_filter_list = option_of_yojson (value_for_key (instance_property_filter_list_of_yojson) "InstancePropertyFilterList") _list path;
    
  }
  in _res

let describe_instance_patches_result_of_yojson = 
  fun tree path : describe_instance_patches_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_patches_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    patches = option_of_yojson (value_for_key (patch_compliance_data_list_of_yojson) "Patches") _list path;
    
  }
  in _res

let describe_instance_patches_request_of_yojson = 
  fun tree path : describe_instance_patches_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_patches_request = {
    max_results = option_of_yojson (value_for_key (patch_compliance_max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    filters = option_of_yojson (value_for_key (patch_orchestrator_filter_list_of_yojson) "Filters") _list path;
    instance_id = value_for_key (instance_id_of_yojson) "InstanceId" _list path;
    
  }
  in _res

let describe_instance_patch_states_result_of_yojson = 
  fun tree path : describe_instance_patch_states_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_patch_states_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    instance_patch_states = option_of_yojson (value_for_key (instance_patch_state_list_of_yojson) "InstancePatchStates") _list path;
    
  }
  in _res

let describe_instance_patch_states_request_of_yojson = 
  fun tree path : describe_instance_patch_states_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_patch_states_request = {
    max_results = option_of_yojson (value_for_key (patch_compliance_max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    instance_ids = value_for_key (instance_id_list_of_yojson) "InstanceIds" _list path;
    
  }
  in _res

let describe_instance_patch_states_for_patch_group_result_of_yojson = 
  fun tree path : describe_instance_patch_states_for_patch_group_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_patch_states_for_patch_group_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    instance_patch_states = option_of_yojson (value_for_key (instance_patch_states_list_of_yojson) "InstancePatchStates") _list path;
    
  }
  in _res

let describe_instance_patch_states_for_patch_group_request_of_yojson = 
  fun tree path : describe_instance_patch_states_for_patch_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_patch_states_for_patch_group_request = {
    max_results = option_of_yojson (value_for_key (patch_compliance_max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    filters = option_of_yojson (value_for_key (instance_patch_state_filter_list_of_yojson) "Filters") _list path;
    patch_group = value_for_key (patch_group_of_yojson) "PatchGroup" _list path;
    
  }
  in _res

let describe_instance_information_result_of_yojson = 
  fun tree path : describe_instance_information_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_information_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    instance_information_list = option_of_yojson (value_for_key (instance_information_list_of_yojson) "InstanceInformationList") _list path;
    
  }
  in _res

let describe_instance_information_request_of_yojson = 
  fun tree path : describe_instance_information_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_information_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_ec2_compatible_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (instance_information_string_filter_list_of_yojson) "Filters") _list path;
    instance_information_filter_list = option_of_yojson (value_for_key (instance_information_filter_list_of_yojson) "InstanceInformationFilterList") _list path;
    
  }
  in _res

let describe_instance_associations_status_result_of_yojson = 
  fun tree path : describe_instance_associations_status_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_associations_status_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    instance_association_status_infos = option_of_yojson (value_for_key (instance_association_status_infos_of_yojson) "InstanceAssociationStatusInfos") _list path;
    
  }
  in _res

let describe_instance_associations_status_request_of_yojson = 
  fun tree path : describe_instance_associations_status_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_instance_associations_status_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    instance_id = value_for_key (instance_id_of_yojson) "InstanceId" _list path;
    
  }
  in _res

let describe_effective_patches_for_patch_baseline_result_of_yojson = 
  fun tree path : describe_effective_patches_for_patch_baseline_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_effective_patches_for_patch_baseline_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    effective_patches = option_of_yojson (value_for_key (effective_patch_list_of_yojson) "EffectivePatches") _list path;
    
  }
  in _res

let describe_effective_patches_for_patch_baseline_request_of_yojson = 
  fun tree path : describe_effective_patches_for_patch_baseline_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_effective_patches_for_patch_baseline_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (patch_baseline_max_results_of_yojson) "MaxResults") _list path;
    baseline_id = value_for_key (baseline_id_of_yojson) "BaselineId" _list path;
    
  }
  in _res

let describe_effective_instance_associations_result_of_yojson = 
  fun tree path : describe_effective_instance_associations_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_effective_instance_associations_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    associations = option_of_yojson (value_for_key (instance_association_list_of_yojson) "Associations") _list path;
    
  }
  in _res

let describe_effective_instance_associations_request_of_yojson = 
  fun tree path : describe_effective_instance_associations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_effective_instance_associations_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (effective_instance_association_max_results_of_yojson) "MaxResults") _list path;
    instance_id = value_for_key (instance_id_of_yojson) "InstanceId" _list path;
    
  }
  in _res

let describe_document_result_of_yojson = 
  fun tree path : describe_document_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_document_result = {
    document = option_of_yojson (value_for_key (document_description_of_yojson) "Document") _list path;
    
  }
  in _res

let describe_document_request_of_yojson = 
  fun tree path : describe_document_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_document_request = {
    version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "VersionName") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    name = value_for_key (document_ar_n_of_yojson) "Name" _list path;
    
  }
  in _res

let account_sharing_info_of_yojson = 
  fun tree path : account_sharing_info ->
  let _list = assoc_of_yojson tree path in
  let _res : account_sharing_info = {
    shared_document_version = option_of_yojson (value_for_key (shared_document_version_of_yojson) "SharedDocumentVersion") _list path;
    account_id = option_of_yojson (value_for_key (account_id_of_yojson) "AccountId") _list path;
    
  }
  in _res

let account_sharing_info_list_of_yojson = 
  fun tree path -> list_of_yojson account_sharing_info_of_yojson tree path 

let describe_document_permission_response_of_yojson = 
  fun tree path : describe_document_permission_response ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_document_permission_response = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    account_sharing_info_list = option_of_yojson (value_for_key (account_sharing_info_list_of_yojson) "AccountSharingInfoList") _list path;
    account_ids = option_of_yojson (value_for_key (account_id_list_of_yojson) "AccountIds") _list path;
    
  }
  in _res

let describe_document_permission_request_of_yojson = 
  fun tree path : describe_document_permission_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_document_permission_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (document_permission_max_results_of_yojson) "MaxResults") _list path;
    permission_type = value_for_key (document_permission_type_of_yojson) "PermissionType" _list path;
    name = value_for_key (document_name_of_yojson) "Name" _list path;
    
  }
  in _res

let describe_available_patches_result_of_yojson = 
  fun tree path : describe_available_patches_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_available_patches_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    patches = option_of_yojson (value_for_key (patch_list_of_yojson) "Patches") _list path;
    
  }
  in _res

let describe_available_patches_request_of_yojson = 
  fun tree path : describe_available_patches_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_available_patches_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (patch_baseline_max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (patch_orchestrator_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let describe_automation_step_executions_result_of_yojson = 
  fun tree path : describe_automation_step_executions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_automation_step_executions_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    step_executions = option_of_yojson (value_for_key (step_execution_list_of_yojson) "StepExecutions") _list path;
    
  }
  in _res

let describe_automation_step_executions_request_of_yojson = 
  fun tree path : describe_automation_step_executions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_automation_step_executions_request = {
    reverse_order = option_of_yojson (value_for_key (boolean__of_yojson) "ReverseOrder") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    filters = option_of_yojson (value_for_key (step_execution_filter_list_of_yojson) "Filters") _list path;
    automation_execution_id = value_for_key (automation_execution_id_of_yojson) "AutomationExecutionId" _list path;
    
  }
  in _res

let automation_type_of_yojson = 
  fun (tree: t) path : automation_type -> match tree with 
    | `String "Local" -> Local
    | `String "CrossAccount" -> CrossAccount
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutomationType" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationType")

let automation_execution_metadata_of_yojson = 
  fun tree path : automation_execution_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : automation_execution_metadata = {
    change_request_name = option_of_yojson (value_for_key (change_request_name_of_yojson) "ChangeRequestName") _list path;
    association_id = option_of_yojson (value_for_key (string__of_yojson) "AssociationId") _list path;
    ops_item_id = option_of_yojson (value_for_key (string__of_yojson) "OpsItemId") _list path;
    runbooks = option_of_yojson (value_for_key (runbooks_of_yojson) "Runbooks") _list path;
    scheduled_time = option_of_yojson (value_for_key (date_time_of_yojson) "ScheduledTime") _list path;
    automation_subtype = option_of_yojson (value_for_key (automation_subtype_of_yojson) "AutomationSubtype") _list path;
    triggered_alarms = option_of_yojson (value_for_key (alarm_state_information_list_of_yojson) "TriggeredAlarms") _list path;
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    automation_type = option_of_yojson (value_for_key (automation_type_of_yojson) "AutomationType") _list path;
    target = option_of_yojson (value_for_key (string__of_yojson) "Target") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    resolved_targets = option_of_yojson (value_for_key (resolved_targets_of_yojson) "ResolvedTargets") _list path;
    target_maps = option_of_yojson (value_for_key (target_maps_of_yojson) "TargetMaps") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    target_parameter_name = option_of_yojson (value_for_key (automation_parameter_key_of_yojson) "TargetParameterName") _list path;
    failure_message = option_of_yojson (value_for_key (string__of_yojson) "FailureMessage") _list path;
    current_action = option_of_yojson (value_for_key (string__of_yojson) "CurrentAction") _list path;
    current_step_name = option_of_yojson (value_for_key (string__of_yojson) "CurrentStepName") _list path;
    parent_automation_execution_id = option_of_yojson (value_for_key (automation_execution_id_of_yojson) "ParentAutomationExecutionId") _list path;
    mode = option_of_yojson (value_for_key (execution_mode_of_yojson) "Mode") _list path;
    outputs = option_of_yojson (value_for_key (automation_parameter_map_of_yojson) "Outputs") _list path;
    log_file = option_of_yojson (value_for_key (string__of_yojson) "LogFile") _list path;
    executed_by = option_of_yojson (value_for_key (string__of_yojson) "ExecutedBy") _list path;
    execution_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "ExecutionEndTime") _list path;
    execution_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "ExecutionStartTime") _list path;
    automation_execution_status = option_of_yojson (value_for_key (automation_execution_status_of_yojson) "AutomationExecutionStatus") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    document_name = option_of_yojson (value_for_key (document_name_of_yojson) "DocumentName") _list path;
    automation_execution_id = option_of_yojson (value_for_key (automation_execution_id_of_yojson) "AutomationExecutionId") _list path;
    
  }
  in _res

let automation_execution_metadata_list_of_yojson = 
  fun tree path -> list_of_yojson automation_execution_metadata_of_yojson tree path 

let describe_automation_executions_result_of_yojson = 
  fun tree path : describe_automation_executions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_automation_executions_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    automation_execution_metadata_list = option_of_yojson (value_for_key (automation_execution_metadata_list_of_yojson) "AutomationExecutionMetadataList") _list path;
    
  }
  in _res

let automation_execution_filter_key_of_yojson = 
  fun (tree: t) path : automation_execution_filter_key -> match tree with 
    | `String "OpsItemId" -> OPS_ITEM_ID
    | `String "AutomationSubtype" -> AUTOMATION_SUBTYPE
    | `String "TargetResourceGroup" -> TARGET_RESOURCE_GROUP
    | `String "TagKey" -> TAG_KEY
    | `String "AutomationType" -> AUTOMATION_TYPE
    | `String "StartTimeAfter" -> START_TIME_AFTER
    | `String "StartTimeBefore" -> START_TIME_BEFORE
    | `String "CurrentAction" -> CURRENT_ACTION
    | `String "ParentExecutionId" -> PARENT_EXECUTION_ID
    | `String "ExecutionId" -> EXECUTION_ID
    | `String "ExecutionStatus" -> EXECUTION_STATUS
    | `String "DocumentNamePrefix" -> DOCUMENT_NAME_PREFIX
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutomationExecutionFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationExecutionFilterKey")

let automation_execution_filter_value_of_yojson = string_of_yojson

let automation_execution_filter_value_list_of_yojson = 
  fun tree path -> list_of_yojson automation_execution_filter_value_of_yojson tree path 

let automation_execution_filter_of_yojson = 
  fun tree path : automation_execution_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : automation_execution_filter = {
    values = value_for_key (automation_execution_filter_value_list_of_yojson) "Values" _list path;
    key = value_for_key (automation_execution_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let automation_execution_filter_list_of_yojson = 
  fun tree path -> list_of_yojson automation_execution_filter_of_yojson tree path 

let describe_automation_executions_request_of_yojson = 
  fun tree path : describe_automation_executions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_automation_executions_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (automation_execution_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let describe_association_result_of_yojson = 
  fun tree path : describe_association_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_association_result = {
    association_description = option_of_yojson (value_for_key (association_description_of_yojson) "AssociationDescription") _list path;
    
  }
  in _res

let describe_association_request_of_yojson = 
  fun tree path : describe_association_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_association_request = {
    association_version = option_of_yojson (value_for_key (association_version_of_yojson) "AssociationVersion") _list path;
    association_id = option_of_yojson (value_for_key (association_id_of_yojson) "AssociationId") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "Name") _list path;
    
  }
  in _res

let association_execution_id_of_yojson = string_of_yojson

let association_execution_of_yojson = 
  fun tree path : association_execution ->
  let _list = assoc_of_yojson tree path in
  let _res : association_execution = {
    triggered_alarms = option_of_yojson (value_for_key (alarm_state_information_list_of_yojson) "TriggeredAlarms") _list path;
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    resource_count_by_status = option_of_yojson (value_for_key (resource_count_by_status_of_yojson) "ResourceCountByStatus") _list path;
    last_execution_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastExecutionDate") _list path;
    created_time = option_of_yojson (value_for_key (date_time_of_yojson) "CreatedTime") _list path;
    detailed_status = option_of_yojson (value_for_key (status_name_of_yojson) "DetailedStatus") _list path;
    status = option_of_yojson (value_for_key (status_name_of_yojson) "Status") _list path;
    execution_id = option_of_yojson (value_for_key (association_execution_id_of_yojson) "ExecutionId") _list path;
    association_version = option_of_yojson (value_for_key (association_version_of_yojson) "AssociationVersion") _list path;
    association_id = option_of_yojson (value_for_key (association_id_of_yojson) "AssociationId") _list path;
    
  }
  in _res

let association_executions_list_of_yojson = 
  fun tree path -> list_of_yojson association_execution_of_yojson tree path 

let describe_association_executions_result_of_yojson = 
  fun tree path : describe_association_executions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_association_executions_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    association_executions = option_of_yojson (value_for_key (association_executions_list_of_yojson) "AssociationExecutions") _list path;
    
  }
  in _res

let association_execution_filter_key_of_yojson = 
  fun (tree: t) path : association_execution_filter_key -> match tree with 
    | `String "CreatedTime" -> CreatedTime
    | `String "Status" -> Status
    | `String "ExecutionId" -> ExecutionId
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationExecutionFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationExecutionFilterKey")

let association_execution_filter_value_of_yojson = string_of_yojson

let association_filter_operator_type_of_yojson = 
  fun (tree: t) path : association_filter_operator_type -> match tree with 
    | `String "GREATER_THAN" -> GreaterThan
    | `String "LESS_THAN" -> LessThan
    | `String "EQUAL" -> Equal
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationFilterOperatorType" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationFilterOperatorType")

let association_execution_filter_of_yojson = 
  fun tree path : association_execution_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : association_execution_filter = {
    type_ = value_for_key (association_filter_operator_type_of_yojson) "Type" _list path;
    value = value_for_key (association_execution_filter_value_of_yojson) "Value" _list path;
    key = value_for_key (association_execution_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let association_execution_filter_list_of_yojson = 
  fun tree path -> list_of_yojson association_execution_filter_of_yojson tree path 

let describe_association_executions_request_of_yojson = 
  fun tree path : describe_association_executions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_association_executions_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (association_execution_filter_list_of_yojson) "Filters") _list path;
    association_id = value_for_key (association_id_of_yojson) "AssociationId" _list path;
    
  }
  in _res

let association_resource_id_of_yojson = string_of_yojson

let association_resource_type_of_yojson = string_of_yojson

let association_execution_target_of_yojson = 
  fun tree path : association_execution_target ->
  let _list = assoc_of_yojson tree path in
  let _res : association_execution_target = {
    output_source = option_of_yojson (value_for_key (output_source_of_yojson) "OutputSource") _list path;
    last_execution_date = option_of_yojson (value_for_key (date_time_of_yojson) "LastExecutionDate") _list path;
    detailed_status = option_of_yojson (value_for_key (status_name_of_yojson) "DetailedStatus") _list path;
    status = option_of_yojson (value_for_key (status_name_of_yojson) "Status") _list path;
    resource_type = option_of_yojson (value_for_key (association_resource_type_of_yojson) "ResourceType") _list path;
    resource_id = option_of_yojson (value_for_key (association_resource_id_of_yojson) "ResourceId") _list path;
    execution_id = option_of_yojson (value_for_key (association_execution_id_of_yojson) "ExecutionId") _list path;
    association_version = option_of_yojson (value_for_key (association_version_of_yojson) "AssociationVersion") _list path;
    association_id = option_of_yojson (value_for_key (association_id_of_yojson) "AssociationId") _list path;
    
  }
  in _res

let association_execution_targets_list_of_yojson = 
  fun tree path -> list_of_yojson association_execution_target_of_yojson tree path 

let describe_association_execution_targets_result_of_yojson = 
  fun tree path : describe_association_execution_targets_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_association_execution_targets_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    association_execution_targets = option_of_yojson (value_for_key (association_execution_targets_list_of_yojson) "AssociationExecutionTargets") _list path;
    
  }
  in _res

let association_execution_targets_filter_key_of_yojson = 
  fun (tree: t) path : association_execution_targets_filter_key -> match tree with 
    | `String "ResourceType" -> ResourceType
    | `String "ResourceId" -> ResourceId
    | `String "Status" -> Status
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationExecutionTargetsFilterKey" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationExecutionTargetsFilterKey")

let association_execution_targets_filter_value_of_yojson = 
  string_of_yojson

let association_execution_targets_filter_of_yojson = 
  fun tree path : association_execution_targets_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : association_execution_targets_filter = {
    value = value_for_key (association_execution_targets_filter_value_of_yojson) "Value" _list path;
    key = value_for_key (association_execution_targets_filter_key_of_yojson) "Key" _list path;
    
  }
  in _res

let association_execution_targets_filter_list_of_yojson = 
  fun tree path -> list_of_yojson association_execution_targets_filter_of_yojson tree path 

let describe_association_execution_targets_request_of_yojson = 
  fun tree path : describe_association_execution_targets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_association_execution_targets_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (association_execution_targets_filter_list_of_yojson) "Filters") _list path;
    execution_id = value_for_key (association_execution_id_of_yojson) "ExecutionId" _list path;
    association_id = value_for_key (association_id_of_yojson) "AssociationId" _list path;
    
  }
  in _res

let association_execution_does_not_exist_of_yojson = 
  fun tree path : association_execution_does_not_exist ->
  let _list = assoc_of_yojson tree path in
  let _res : association_execution_does_not_exist = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let activation_description_of_yojson = string_of_yojson

let default_instance_name_of_yojson = string_of_yojson

let created_date_of_yojson = timestamp_of_yojson

let activation_of_yojson = 
  fun tree path : activation ->
  let _list = assoc_of_yojson tree path in
  let _res : activation = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    created_date = option_of_yojson (value_for_key (created_date_of_yojson) "CreatedDate") _list path;
    expired = option_of_yojson (value_for_key (boolean__of_yojson) "Expired") _list path;
    expiration_date = option_of_yojson (value_for_key (expiration_date_of_yojson) "ExpirationDate") _list path;
    registrations_count = option_of_yojson (value_for_key (registrations_count_of_yojson) "RegistrationsCount") _list path;
    registration_limit = option_of_yojson (value_for_key (registration_limit_of_yojson) "RegistrationLimit") _list path;
    iam_role = option_of_yojson (value_for_key (iam_role_of_yojson) "IamRole") _list path;
    default_instance_name = option_of_yojson (value_for_key (default_instance_name_of_yojson) "DefaultInstanceName") _list path;
    description = option_of_yojson (value_for_key (activation_description_of_yojson) "Description") _list path;
    activation_id = option_of_yojson (value_for_key (activation_id_of_yojson) "ActivationId") _list path;
    
  }
  in _res

let activation_list_of_yojson = 
  fun tree path -> list_of_yojson activation_of_yojson tree path 

let describe_activations_result_of_yojson = 
  fun tree path : describe_activations_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_activations_result = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    activation_list = option_of_yojson (value_for_key (activation_list_of_yojson) "ActivationList") _list path;
    
  }
  in _res

let describe_activations_filter_keys_of_yojson = 
  fun (tree: t) path : describe_activations_filter_keys -> match tree with 
    | `String "IamRole" -> IAM_ROLE
    | `String "DefaultInstanceName" -> DEFAULT_INSTANCE_NAME
    | `String "ActivationIds" -> ACTIVATION_IDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DescribeActivationsFilterKeys" value)
    | _ -> raise (deserialize_wrong_type_error path "DescribeActivationsFilterKeys")

let describe_activations_filter_of_yojson = 
  fun tree path : describe_activations_filter ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_activations_filter = {
    filter_values = option_of_yojson (value_for_key (string_list_of_yojson) "FilterValues") _list path;
    filter_key = option_of_yojson (value_for_key (describe_activations_filter_keys_of_yojson) "FilterKey") _list path;
    
  }
  in _res

let describe_activations_filter_list_of_yojson = 
  fun tree path -> list_of_yojson describe_activations_filter_of_yojson tree path 

let describe_activations_request_of_yojson = 
  fun tree path : describe_activations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_activations_request = {
    next_token = option_of_yojson (value_for_key (next_token_of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (max_results_of_yojson) "MaxResults") _list path;
    filters = option_of_yojson (value_for_key (describe_activations_filter_list_of_yojson) "Filters") _list path;
    
  }
  in _res

let deregister_task_from_maintenance_window_result_of_yojson = 
  fun tree path : deregister_task_from_maintenance_window_result ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_task_from_maintenance_window_result = {
    window_task_id = option_of_yojson (value_for_key (maintenance_window_task_id_of_yojson) "WindowTaskId") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let deregister_task_from_maintenance_window_request_of_yojson = 
  fun tree path : deregister_task_from_maintenance_window_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_task_from_maintenance_window_request = {
    window_task_id = value_for_key (maintenance_window_task_id_of_yojson) "WindowTaskId" _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let deregister_target_from_maintenance_window_result_of_yojson = 
  fun tree path : deregister_target_from_maintenance_window_result ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_target_from_maintenance_window_result = {
    window_target_id = option_of_yojson (value_for_key (maintenance_window_target_id_of_yojson) "WindowTargetId") _list path;
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let deregister_target_from_maintenance_window_request_of_yojson = 
  fun tree path : deregister_target_from_maintenance_window_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_target_from_maintenance_window_request = {
    safe = option_of_yojson (value_for_key (boolean__of_yojson) "Safe") _list path;
    window_target_id = value_for_key (maintenance_window_target_id_of_yojson) "WindowTargetId" _list path;
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let deregister_patch_baseline_for_patch_group_result_of_yojson = 
  fun tree path : deregister_patch_baseline_for_patch_group_result ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_patch_baseline_for_patch_group_result = {
    patch_group = option_of_yojson (value_for_key (patch_group_of_yojson) "PatchGroup") _list path;
    baseline_id = option_of_yojson (value_for_key (baseline_id_of_yojson) "BaselineId") _list path;
    
  }
  in _res

let deregister_patch_baseline_for_patch_group_request_of_yojson = 
  fun tree path : deregister_patch_baseline_for_patch_group_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_patch_baseline_for_patch_group_request = {
    patch_group = value_for_key (patch_group_of_yojson) "PatchGroup" _list path;
    baseline_id = value_for_key (baseline_id_of_yojson) "BaselineId" _list path;
    
  }
  in _res

let deregister_managed_instance_result_of_yojson = 
  fun tree path : deregister_managed_instance_result ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_managed_instance_result = ()
  in _res

let deregister_managed_instance_request_of_yojson = 
  fun tree path : deregister_managed_instance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : deregister_managed_instance_request = {
    instance_id = value_for_key (managed_instance_id_of_yojson) "InstanceId" _list path;
    
  }
  in _res

let delete_resource_policy_response_of_yojson = 
  fun tree path : delete_resource_policy_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_resource_policy_response = ()
  in _res

let delete_resource_policy_request_of_yojson = 
  fun tree path : delete_resource_policy_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_resource_policy_request = {
    policy_hash = value_for_key (policy_hash_of_yojson) "PolicyHash" _list path;
    policy_id = value_for_key (policy_id_of_yojson) "PolicyId" _list path;
    resource_arn = value_for_key (resource_arn_string_of_yojson) "ResourceArn" _list path;
    
  }
  in _res

let delete_resource_data_sync_result_of_yojson = 
  fun tree path : delete_resource_data_sync_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_resource_data_sync_result = ()
  in _res

let delete_resource_data_sync_request_of_yojson = 
  fun tree path : delete_resource_data_sync_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_resource_data_sync_request = {
    sync_type = option_of_yojson (value_for_key (resource_data_sync_type_of_yojson) "SyncType") _list path;
    sync_name = value_for_key (resource_data_sync_name_of_yojson) "SyncName" _list path;
    
  }
  in _res

let delete_patch_baseline_result_of_yojson = 
  fun tree path : delete_patch_baseline_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_patch_baseline_result = {
    baseline_id = option_of_yojson (value_for_key (baseline_id_of_yojson) "BaselineId") _list path;
    
  }
  in _res

let delete_patch_baseline_request_of_yojson = 
  fun tree path : delete_patch_baseline_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_patch_baseline_request = {
    baseline_id = value_for_key (baseline_id_of_yojson) "BaselineId" _list path;
    
  }
  in _res

let delete_parameters_result_of_yojson = 
  fun tree path : delete_parameters_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_parameters_result = {
    invalid_parameters = option_of_yojson (value_for_key (parameter_name_list_of_yojson) "InvalidParameters") _list path;
    deleted_parameters = option_of_yojson (value_for_key (parameter_name_list_of_yojson) "DeletedParameters") _list path;
    
  }
  in _res

let delete_parameters_request_of_yojson = 
  fun tree path : delete_parameters_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_parameters_request = {
    names = value_for_key (parameter_name_list_of_yojson) "Names" _list path;
    
  }
  in _res

let delete_parameter_result_of_yojson = 
  fun tree path : delete_parameter_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_parameter_result = ()
  in _res

let delete_parameter_request_of_yojson = 
  fun tree path : delete_parameter_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_parameter_request = {
    name = value_for_key (ps_parameter_name_of_yojson) "Name" _list path;
    
  }
  in _res

let delete_ops_metadata_result_of_yojson = 
  fun tree path : delete_ops_metadata_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_ops_metadata_result = ()
  in _res

let delete_ops_metadata_request_of_yojson = 
  fun tree path : delete_ops_metadata_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_ops_metadata_request = {
    ops_metadata_arn = value_for_key (ops_metadata_arn_of_yojson) "OpsMetadataArn" _list path;
    
  }
  in _res

let delete_ops_item_response_of_yojson = 
  fun tree path : delete_ops_item_response ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_ops_item_response = ()
  in _res

let delete_ops_item_request_of_yojson = 
  fun tree path : delete_ops_item_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_ops_item_request = {
    ops_item_id = value_for_key (ops_item_id_of_yojson) "OpsItemId" _list path;
    
  }
  in _res

let delete_maintenance_window_result_of_yojson = 
  fun tree path : delete_maintenance_window_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_maintenance_window_result = {
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let delete_maintenance_window_request_of_yojson = 
  fun tree path : delete_maintenance_window_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_maintenance_window_request = {
    window_id = value_for_key (maintenance_window_id_of_yojson) "WindowId" _list path;
    
  }
  in _res

let delete_inventory_result_of_yojson = 
  fun tree path : delete_inventory_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_inventory_result = {
    deletion_summary = option_of_yojson (value_for_key (inventory_deletion_summary_of_yojson) "DeletionSummary") _list path;
    type_name = option_of_yojson (value_for_key (inventory_item_type_name_of_yojson) "TypeName") _list path;
    deletion_id = option_of_yojson (value_for_key (uui_d_of_yojson) "DeletionId") _list path;
    
  }
  in _res

let delete_inventory_request_of_yojson = 
  fun tree path : delete_inventory_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_inventory_request = {
    client_token = option_of_yojson (value_for_key (uui_d_of_yojson) "ClientToken") _list path;
    dry_run = option_of_yojson (value_for_key (dry_run_of_yojson) "DryRun") _list path;
    schema_delete_option = option_of_yojson (value_for_key (inventory_schema_delete_option_of_yojson) "SchemaDeleteOption") _list path;
    type_name = value_for_key (inventory_item_type_name_of_yojson) "TypeName" _list path;
    
  }
  in _res

let delete_document_result_of_yojson = 
  fun tree path : delete_document_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_document_result = ()
  in _res

let delete_document_request_of_yojson = 
  fun tree path : delete_document_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_document_request = {
    force = option_of_yojson (value_for_key (boolean__of_yojson) "Force") _list path;
    version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "VersionName") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    name = value_for_key (document_name_of_yojson) "Name" _list path;
    
  }
  in _res

let associated_instances_of_yojson = 
  fun tree path : associated_instances ->
  let _list = assoc_of_yojson tree path in
  let _res : associated_instances = ()
  in _res

let delete_association_result_of_yojson = 
  fun tree path : delete_association_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_association_result = ()
  in _res

let delete_association_request_of_yojson = 
  fun tree path : delete_association_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_association_request = {
    association_id = option_of_yojson (value_for_key (association_id_of_yojson) "AssociationId") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    name = option_of_yojson (value_for_key (document_ar_n_of_yojson) "Name") _list path;
    
  }
  in _res

let delete_activation_result_of_yojson = 
  fun tree path : delete_activation_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_activation_result = ()
  in _res

let delete_activation_request_of_yojson = 
  fun tree path : delete_activation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_activation_request = {
    activation_id = value_for_key (activation_id_of_yojson) "ActivationId" _list path;
    
  }
  in _res

let create_resource_data_sync_result_of_yojson = 
  fun tree path : create_resource_data_sync_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_resource_data_sync_result = ()
  in _res

let create_resource_data_sync_request_of_yojson = 
  fun tree path : create_resource_data_sync_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_resource_data_sync_request = {
    sync_source = option_of_yojson (value_for_key (resource_data_sync_source_of_yojson) "SyncSource") _list path;
    sync_type = option_of_yojson (value_for_key (resource_data_sync_type_of_yojson) "SyncType") _list path;
    s3_destination = option_of_yojson (value_for_key (resource_data_sync_s3_destination_of_yojson) "S3Destination") _list path;
    sync_name = value_for_key (resource_data_sync_name_of_yojson) "SyncName" _list path;
    
  }
  in _res

let create_patch_baseline_result_of_yojson = 
  fun tree path : create_patch_baseline_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_patch_baseline_result = {
    baseline_id = option_of_yojson (value_for_key (baseline_id_of_yojson) "BaselineId") _list path;
    
  }
  in _res

let create_patch_baseline_request_of_yojson = 
  fun tree path : create_patch_baseline_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_patch_baseline_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "ClientToken") _list path;
    sources = option_of_yojson (value_for_key (patch_source_list_of_yojson) "Sources") _list path;
    description = option_of_yojson (value_for_key (baseline_description_of_yojson) "Description") _list path;
    rejected_patches_action = option_of_yojson (value_for_key (patch_action_of_yojson) "RejectedPatchesAction") _list path;
    rejected_patches = option_of_yojson (value_for_key (patch_id_list_of_yojson) "RejectedPatches") _list path;
    approved_patches_enable_non_security = option_of_yojson (value_for_key (boolean__of_yojson) "ApprovedPatchesEnableNonSecurity") _list path;
    approved_patches_compliance_level = option_of_yojson (value_for_key (patch_compliance_level_of_yojson) "ApprovedPatchesComplianceLevel") _list path;
    approved_patches = option_of_yojson (value_for_key (patch_id_list_of_yojson) "ApprovedPatches") _list path;
    approval_rules = option_of_yojson (value_for_key (patch_rule_group_of_yojson) "ApprovalRules") _list path;
    global_filters = option_of_yojson (value_for_key (patch_filter_group_of_yojson) "GlobalFilters") _list path;
    name = value_for_key (baseline_name_of_yojson) "Name" _list path;
    operating_system = option_of_yojson (value_for_key (operating_system_of_yojson) "OperatingSystem") _list path;
    
  }
  in _res

let create_ops_metadata_result_of_yojson = 
  fun tree path : create_ops_metadata_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_ops_metadata_result = {
    ops_metadata_arn = option_of_yojson (value_for_key (ops_metadata_arn_of_yojson) "OpsMetadataArn") _list path;
    
  }
  in _res

let create_ops_metadata_request_of_yojson = 
  fun tree path : create_ops_metadata_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_ops_metadata_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    metadata = option_of_yojson (value_for_key (metadata_map_of_yojson) "Metadata") _list path;
    resource_id = value_for_key (ops_metadata_resource_id_of_yojson) "ResourceId" _list path;
    
  }
  in _res

let create_ops_item_response_of_yojson = 
  fun tree path : create_ops_item_response ->
  let _list = assoc_of_yojson tree path in
  let _res : create_ops_item_response = {
    ops_item_arn = option_of_yojson (value_for_key (ops_item_arn_of_yojson) "OpsItemArn") _list path;
    ops_item_id = option_of_yojson (value_for_key (string__of_yojson) "OpsItemId") _list path;
    
  }
  in _res

let create_ops_item_request_of_yojson = 
  fun tree path : create_ops_item_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_ops_item_request = {
    account_id = option_of_yojson (value_for_key (ops_item_account_id_of_yojson) "AccountId") _list path;
    planned_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "PlannedEndTime") _list path;
    planned_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "PlannedStartTime") _list path;
    actual_end_time = option_of_yojson (value_for_key (date_time_of_yojson) "ActualEndTime") _list path;
    actual_start_time = option_of_yojson (value_for_key (date_time_of_yojson) "ActualStartTime") _list path;
    severity = option_of_yojson (value_for_key (ops_item_severity_of_yojson) "Severity") _list path;
    category = option_of_yojson (value_for_key (ops_item_category_of_yojson) "Category") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    title = value_for_key (ops_item_title_of_yojson) "Title" _list path;
    source = value_for_key (ops_item_source_of_yojson) "Source" _list path;
    related_ops_items = option_of_yojson (value_for_key (related_ops_items_of_yojson) "RelatedOpsItems") _list path;
    priority = option_of_yojson (value_for_key (ops_item_priority_of_yojson) "Priority") _list path;
    notifications = option_of_yojson (value_for_key (ops_item_notifications_of_yojson) "Notifications") _list path;
    operational_data = option_of_yojson (value_for_key (ops_item_operational_data_of_yojson) "OperationalData") _list path;
    ops_item_type = option_of_yojson (value_for_key (ops_item_type_of_yojson) "OpsItemType") _list path;
    description = value_for_key (ops_item_description_of_yojson) "Description" _list path;
    
  }
  in _res

let create_maintenance_window_result_of_yojson = 
  fun tree path : create_maintenance_window_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_maintenance_window_result = {
    window_id = option_of_yojson (value_for_key (maintenance_window_id_of_yojson) "WindowId") _list path;
    
  }
  in _res

let create_maintenance_window_request_of_yojson = 
  fun tree path : create_maintenance_window_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_maintenance_window_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    client_token = option_of_yojson (value_for_key (client_token_of_yojson) "ClientToken") _list path;
    allow_unassociated_targets = value_for_key (maintenance_window_allow_unassociated_targets_of_yojson) "AllowUnassociatedTargets" _list path;
    cutoff = value_for_key (maintenance_window_cutoff_of_yojson) "Cutoff" _list path;
    duration = value_for_key (maintenance_window_duration_hours_of_yojson) "Duration" _list path;
    schedule_offset = option_of_yojson (value_for_key (maintenance_window_offset_of_yojson) "ScheduleOffset") _list path;
    schedule_timezone = option_of_yojson (value_for_key (maintenance_window_timezone_of_yojson) "ScheduleTimezone") _list path;
    schedule = value_for_key (maintenance_window_schedule_of_yojson) "Schedule" _list path;
    end_date = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "EndDate") _list path;
    start_date = option_of_yojson (value_for_key (maintenance_window_string_date_time_of_yojson) "StartDate") _list path;
    description = option_of_yojson (value_for_key (maintenance_window_description_of_yojson) "Description") _list path;
    name = value_for_key (maintenance_window_name_of_yojson) "Name" _list path;
    
  }
  in _res

let create_document_result_of_yojson = 
  fun tree path : create_document_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_document_result = {
    document_description = option_of_yojson (value_for_key (document_description_of_yojson) "DocumentDescription") _list path;
    
  }
  in _res

let create_document_request_of_yojson = 
  fun tree path : create_document_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_document_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    target_type = option_of_yojson (value_for_key (target_type_of_yojson) "TargetType") _list path;
    document_format = option_of_yojson (value_for_key (document_format_of_yojson) "DocumentFormat") _list path;
    document_type = option_of_yojson (value_for_key (document_type_of_yojson) "DocumentType") _list path;
    version_name = option_of_yojson (value_for_key (document_version_name_of_yojson) "VersionName") _list path;
    display_name = option_of_yojson (value_for_key (document_display_name_of_yojson) "DisplayName") _list path;
    name = value_for_key (document_name_of_yojson) "Name" _list path;
    attachments = option_of_yojson (value_for_key (attachments_source_list_of_yojson) "Attachments") _list path;
    requires = option_of_yojson (value_for_key (document_requires_list_of_yojson) "Requires") _list path;
    content = value_for_key (document_content_of_yojson) "Content" _list path;
    
  }
  in _res

let create_association_result_of_yojson = 
  fun tree path : create_association_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_association_result = {
    association_description = option_of_yojson (value_for_key (association_description_of_yojson) "AssociationDescription") _list path;
    
  }
  in _res

let create_association_request_of_yojson = 
  fun tree path : create_association_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_association_request = {
    alarm_configuration = option_of_yojson (value_for_key (alarm_configuration_of_yojson) "AlarmConfiguration") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    target_maps = option_of_yojson (value_for_key (target_maps_of_yojson) "TargetMaps") _list path;
    duration = option_of_yojson (value_for_key (duration_of_yojson) "Duration") _list path;
    schedule_offset = option_of_yojson (value_for_key (schedule_offset_of_yojson) "ScheduleOffset") _list path;
    target_locations = option_of_yojson (value_for_key (target_locations_of_yojson) "TargetLocations") _list path;
    calendar_names = option_of_yojson (value_for_key (calendar_name_or_arn_list_of_yojson) "CalendarNames") _list path;
    apply_only_at_cron_interval = option_of_yojson (value_for_key (apply_only_at_cron_interval_of_yojson) "ApplyOnlyAtCronInterval") _list path;
    sync_compliance = option_of_yojson (value_for_key (association_sync_compliance_of_yojson) "SyncCompliance") _list path;
    compliance_severity = option_of_yojson (value_for_key (association_compliance_severity_of_yojson) "ComplianceSeverity") _list path;
    max_concurrency = option_of_yojson (value_for_key (max_concurrency_of_yojson) "MaxConcurrency") _list path;
    max_errors = option_of_yojson (value_for_key (max_errors_of_yojson) "MaxErrors") _list path;
    automation_target_parameter_name = option_of_yojson (value_for_key (automation_target_parameter_name_of_yojson) "AutomationTargetParameterName") _list path;
    association_name = option_of_yojson (value_for_key (association_name_of_yojson) "AssociationName") _list path;
    output_location = option_of_yojson (value_for_key (instance_association_output_location_of_yojson) "OutputLocation") _list path;
    schedule_expression = option_of_yojson (value_for_key (schedule_expression_of_yojson) "ScheduleExpression") _list path;
    targets = option_of_yojson (value_for_key (targets_of_yojson) "Targets") _list path;
    parameters = option_of_yojson (value_for_key (parameters_of_yojson) "Parameters") _list path;
    instance_id = option_of_yojson (value_for_key (instance_id_of_yojson) "InstanceId") _list path;
    document_version = option_of_yojson (value_for_key (document_version_of_yojson) "DocumentVersion") _list path;
    name = value_for_key (document_ar_n_of_yojson) "Name" _list path;
    
  }
  in _res

let association_description_list_of_yojson = 
  fun tree path -> list_of_yojson association_description_of_yojson tree path 

let create_association_batch_result_of_yojson = 
  fun tree path : create_association_batch_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_association_batch_result = {
    failed = option_of_yojson (value_for_key (failed_create_association_list_of_yojson) "Failed") _list path;
    successful = option_of_yojson (value_for_key (association_description_list_of_yojson) "Successful") _list path;
    
  }
  in _res

let create_association_batch_request_entries_of_yojson = 
  fun tree path -> list_of_yojson create_association_batch_request_entry_of_yojson tree path 

let create_association_batch_request_of_yojson = 
  fun tree path : create_association_batch_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_association_batch_request = {
    entries = value_for_key (create_association_batch_request_entries_of_yojson) "Entries" _list path;
    
  }
  in _res

let association_limit_exceeded_of_yojson = 
  fun tree path : association_limit_exceeded ->
  let _list = assoc_of_yojson tree path in
  let _res : association_limit_exceeded = ()
  in _res

let association_already_exists_of_yojson = 
  fun tree path : association_already_exists ->
  let _list = assoc_of_yojson tree path in
  let _res : association_already_exists = ()
  in _res

let activation_code_of_yojson = string_of_yojson

let create_activation_result_of_yojson = 
  fun tree path : create_activation_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_activation_result = {
    activation_code = option_of_yojson (value_for_key (activation_code_of_yojson) "ActivationCode") _list path;
    activation_id = option_of_yojson (value_for_key (activation_id_of_yojson) "ActivationId") _list path;
    
  }
  in _res

let create_activation_request_of_yojson = 
  fun tree path : create_activation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_activation_request = {
    registration_metadata = option_of_yojson (value_for_key (registration_metadata_list_of_yojson) "RegistrationMetadata") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "Tags") _list path;
    expiration_date = option_of_yojson (value_for_key (expiration_date_of_yojson) "ExpirationDate") _list path;
    registration_limit = option_of_yojson (value_for_key (registration_limit_of_yojson) "RegistrationLimit") _list path;
    iam_role = value_for_key (iam_role_of_yojson) "IamRole" _list path;
    default_instance_name = option_of_yojson (value_for_key (default_instance_name_of_yojson) "DefaultInstanceName") _list path;
    description = option_of_yojson (value_for_key (activation_description_of_yojson) "Description") _list path;
    
  }
  in _res

let cancel_maintenance_window_execution_result_of_yojson = 
  fun tree path : cancel_maintenance_window_execution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_maintenance_window_execution_result = {
    window_execution_id = option_of_yojson (value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId") _list path;
    
  }
  in _res

let cancel_maintenance_window_execution_request_of_yojson = 
  fun tree path : cancel_maintenance_window_execution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_maintenance_window_execution_request = {
    window_execution_id = value_for_key (maintenance_window_execution_id_of_yojson) "WindowExecutionId" _list path;
    
  }
  in _res

let cancel_command_result_of_yojson = 
  fun tree path : cancel_command_result ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_command_result = ()
  in _res

let cancel_command_request_of_yojson = 
  fun tree path : cancel_command_request ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_command_request = {
    instance_ids = option_of_yojson (value_for_key (instance_id_list_of_yojson) "InstanceIds") _list path;
    command_id = value_for_key (command_id_of_yojson) "CommandId" _list path;
    
  }
  in _res

let associate_ops_item_related_item_response_of_yojson = 
  fun tree path : associate_ops_item_related_item_response ->
  let _list = assoc_of_yojson tree path in
  let _res : associate_ops_item_related_item_response = {
    association_id = option_of_yojson (value_for_key (ops_item_related_item_association_id_of_yojson) "AssociationId") _list path;
    
  }
  in _res

let associate_ops_item_related_item_request_of_yojson = 
  fun tree path : associate_ops_item_related_item_request ->
  let _list = assoc_of_yojson tree path in
  let _res : associate_ops_item_related_item_request = {
    resource_uri = value_for_key (ops_item_related_item_association_resource_uri_of_yojson) "ResourceUri" _list path;
    resource_type = value_for_key (ops_item_related_item_association_resource_type_of_yojson) "ResourceType" _list path;
    association_type = value_for_key (ops_item_related_item_association_type_of_yojson) "AssociationType" _list path;
    ops_item_id = value_for_key (ops_item_id_of_yojson) "OpsItemId" _list path;
    
  }
  in _res

let add_tags_to_resource_result_of_yojson = 
  fun tree path : add_tags_to_resource_result ->
  let _list = assoc_of_yojson tree path in
  let _res : add_tags_to_resource_result = ()
  in _res

let add_tags_to_resource_request_of_yojson = 
  fun tree path : add_tags_to_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_tags_to_resource_request = {
    tags = value_for_key (tag_list_of_yojson) "Tags" _list path;
    resource_id = value_for_key (resource_id_of_yojson) "ResourceId" _list path;
    resource_type = value_for_key (resource_type_for_tagging_of_yojson) "ResourceType" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

