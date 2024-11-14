open Smaws_Lib.Json.DeserializeHelpers

open Types

let timestamp__of_yojson = timestamp_of_yojson

let string__of_yojson = string_of_yojson

let non_empty_string_of_yojson = string_of_yojson

let resource_name_of_yojson = string_of_yojson

let setup_domain_name_of_yojson = string_of_yojson

let setup_domain_name_list_of_yojson = 
  fun tree path -> list_of_yojson setup_domain_name_of_yojson tree path 

let base_unit_of_yojson = unit_of_yojson

let certificate_provider_of_yojson = 
  fun (tree: t) path : certificate_provider -> match tree with 
    | `String "LetsEncrypt" -> LetsEncrypt
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateProvider" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateProvider")

let setup_request_of_yojson = 
  fun tree path : setup_request ->
  let _list = assoc_of_yojson tree path in
  let _res : setup_request = {
    certificate_provider = option_of_yojson (value_for_key (certificate_provider_of_yojson) "certificateProvider") _list path;
    domain_names = option_of_yojson (value_for_key (setup_domain_name_list_of_yojson) "domainNames") _list path;
    instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "instanceName") _list path;
    
  }
  in _res

let iso_date_of_yojson = timestamp_of_yojson

let region_name_of_yojson = 
  fun (tree: t) path : region_name -> match tree with 
    | `String "eu-north-1" -> EU_NORTH_1
    | `String "ap-northeast-2" -> AP_NORTHEAST_2
    | `String "ap-northeast-1" -> AP_NORTHEAST_1
    | `String "ap-southeast-2" -> AP_SOUTHEAST_2
    | `String "ap-southeast-1" -> AP_SOUTHEAST_1
    | `String "ap-south-1" -> AP_SOUTH_1
    | `String "ca-central-1" -> CA_CENTRAL_1
    | `String "eu-central-1" -> EU_CENTRAL_1
    | `String "eu-west-3" -> EU_WEST_3
    | `String "eu-west-2" -> EU_WEST_2
    | `String "eu-west-1" -> EU_WEST_1
    | `String "us-west-2" -> US_WEST_2
    | `String "us-west-1" -> US_WEST_1
    | `String "us-east-2" -> US_EAST_2
    | `String "us-east-1" -> US_EAST_1
    | `String value -> raise (deserialize_unknown_enum_value_error path "RegionName" value)
    | _ -> raise (deserialize_wrong_type_error path "RegionName")

let resource_location_of_yojson = 
  fun tree path : resource_location ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_location = {
    region_name = option_of_yojson (value_for_key (region_name_of_yojson) "regionName") _list path;
    availability_zone = option_of_yojson (value_for_key (string__of_yojson) "availabilityZone") _list path;
    
  }
  in _res

let resource_type_of_yojson = 
  fun (tree: t) path : resource_type -> match tree with 
    | `String "Bucket" -> Bucket
    | `String "Certificate" -> Certificate
    | `String "Distribution" -> Distribution
    | `String "ContactMethod" -> ContactMethod
    | `String "Alarm" -> Alarm
    | `String "CloudFormationStackRecord" -> CloudFormationStackRecord
    | `String "ExportSnapshotRecord" -> ExportSnapshotRecord
    | `String "RelationalDatabaseSnapshot" -> RelationalDatabaseSnapshot
    | `String "RelationalDatabase" -> RelationalDatabase
    | `String "DiskSnapshot" -> DiskSnapshot
    | `String "Disk" -> Disk
    | `String "LoadBalancerTlsCertificate" -> LoadBalancerTlsCertificate
    | `String "LoadBalancer" -> LoadBalancer
    | `String "PeeredVpc" -> PeeredVpc
    | `String "Domain" -> Domain
    | `String "InstanceSnapshot" -> InstanceSnapshot
    | `String "KeyPair" -> KeyPair
    | `String "StaticIp" -> StaticIp
    | `String "Instance" -> Instance
    | `String "ContainerService" -> ContainerService
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")

let setup_history_resource_of_yojson = 
  fun tree path : setup_history_resource ->
  let _list = assoc_of_yojson tree path in
  let _res : setup_history_resource = {
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let setup_status_of_yojson = 
  fun (tree: t) path : setup_status -> match tree with 
    | `String "inProgress" -> InProgress
    | `String "failed" -> Failed
    | `String "succeeded" -> Succeeded
    | `String value -> raise (deserialize_unknown_enum_value_error path "SetupStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SetupStatus")

let setup_execution_details_of_yojson = 
  fun tree path : setup_execution_details ->
  let _list = assoc_of_yojson tree path in
  let _res : setup_execution_details = {
    version = option_of_yojson (value_for_key (string__of_yojson) "version") _list path;
    standard_output = option_of_yojson (value_for_key (string__of_yojson) "standardOutput") _list path;
    standard_error = option_of_yojson (value_for_key (string__of_yojson) "standardError") _list path;
    status = option_of_yojson (value_for_key (setup_status_of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "name") _list path;
    date_time = option_of_yojson (value_for_key (iso_date_of_yojson) "dateTime") _list path;
    command = option_of_yojson (value_for_key (string__of_yojson) "command") _list path;
    
  }
  in _res

let setup_execution_details_list_of_yojson = 
  fun tree path -> list_of_yojson setup_execution_details_of_yojson tree path 

let setup_history_of_yojson = 
  fun tree path : setup_history ->
  let _list = assoc_of_yojson tree path in
  let _res : setup_history = {
    status = option_of_yojson (value_for_key (setup_status_of_yojson) "status") _list path;
    execution_details = option_of_yojson (value_for_key (setup_execution_details_list_of_yojson) "executionDetails") _list path;
    resource = option_of_yojson (value_for_key (setup_history_resource_of_yojson) "resource") _list path;
    request = option_of_yojson (value_for_key (setup_request_of_yojson) "request") _list path;
    operation_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "operationId") _list path;
    
  }
  in _res

let setup_history_list_of_yojson = 
  fun tree path -> list_of_yojson setup_history_of_yojson tree path 

let long_of_yojson = long_of_yojson

let integer__of_yojson = int_of_yojson

let float__of_yojson = float_of_yojson

let double_of_yojson = double_of_yojson

let boolean__of_yojson = bool_of_yojson

let viewer_minimum_tls_protocol_version_enum_of_yojson = 
  fun (tree: t) path : viewer_minimum_tls_protocol_version_enum -> match tree with 
    | `String "TLSv1.2_2021" -> TLSv12_2021
    | `String "TLSv1.2_2019" -> TLSv12_2019
    | `String "TLSv1.2_2018" -> TLSv12_2018
    | `String "TLSv1.1_2016" -> TLSv11_2016
    | `String value -> raise (deserialize_unknown_enum_value_error path "ViewerMinimumTlsProtocolVersionEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ViewerMinimumTlsProtocolVersionEnum")

let operation_type_of_yojson = 
  fun (tree: t) path : operation_type -> match tree with 
    | `String "SetupInstanceHttps" -> SetupInstanceHttps
    | `String "StopGUISession" -> StopGUISession
    | `String "StartGUISession" -> StartGUISession
    | `String "UpdateInstanceMetadataOptions" -> UpdateInstanceMetadataOptions
    | `String "SetResourceAccessForBucket" -> SetResourceAccessForBucket
    | `String "UpdateBucket" -> UpdateBucket
    | `String "UpdateBucketBundle" -> UpdateBucketBundle
    | `String "DeleteBucketAccessKey" -> DeleteBucketAccessKey
    | `String "CreateBucketAccessKey" -> CreateBucketAccessKey
    | `String "DeleteBucket" -> DeleteBucket
    | `String "CreateBucket" -> CreateBucket
    | `String "DeleteContainerImage" -> DeleteContainerImage
    | `String "RegisterContainerImage" -> RegisterContainerImage
    | `String "CreateContainerServiceRegistryLogin" -> CreateContainerServiceRegistryLogin
    | `String "CreateContainerServiceDeployment" -> CreateContainerServiceDeployment
    | `String "DeleteContainerService" -> DeleteContainerService
    | `String "UpdateContainerService" -> UpdateContainerService
    | `String "CreateContainerService" -> CreateContainerService
    | `String "DeleteCertificate" -> DeleteCertificate
    | `String "CreateCertificate" -> CreateCertificate
    | `String "SetIpAddressType" -> SetIpAddressType
    | `String "UpdateDistributionBundle" -> UpdateDistributionBundle
    | `String "DetachCertificateFromDistribution" -> DetachCertificateFromDistribution
    | `String "AttachCertificateToDistribution" -> AttachCertificateToDistribution
    | `String "ResetDistributionCache" -> ResetDistributionCache
    | `String "DeleteDistribution" -> DeleteDistribution
    | `String "UpdateDistribution" -> UpdateDistribution
    | `String "CreateDistribution" -> CreateDistribution
    | `String "DeleteContactMethod" -> DeleteContactMethod
    | `String "SendContactMethodVerification" -> SendContactMethodVerification
    | `String "GetContactMethods" -> GetContactMethods
    | `String "CreateContactMethod" -> CreateContactMethod
    | `String "TestAlarm" -> TestAlarm
    | `String "DeleteAlarm" -> DeleteAlarm
    | `String "GetAlarms" -> GetAlarms
    | `String "PutAlarm" -> PutAlarm
    | `String "DisableAddOn" -> DisableAddOn
    | `String "EnableAddOn" -> EnableAddOn
    | `String "StopRelationalDatabase" -> StopRelationalDatabase
    | `String "RebootRelationalDatabase" -> RebootRelationalDatabase
    | `String "StartRelationalDatabase" -> StartRelationalDatabase
    | `String "UpdateRelationalDatabaseParameters" -> UpdateRelationalDatabaseParameters
    | `String "DeleteRelationalDatabaseSnapshot" -> DeleteRelationalDatabaseSnapshot
    | `String "CreateRelationalDatabaseSnapshot" -> CreateRelationalDatabaseSnapshot
    | `String "CreateRelationalDatabaseFromSnapshot" -> CreateRelationalDatabaseFromSnapshot
    | `String "DeleteRelationalDatabase" -> DeleteRelationalDatabase
    | `String "UpdateRelationalDatabase" -> UpdateRelationalDatabase
    | `String "CreateRelationalDatabase" -> CreateRelationalDatabase
    | `String "CreateDiskFromSnapshot" -> CreateDiskFromSnapshot
    | `String "DeleteDiskSnapshot" -> DeleteDiskSnapshot
    | `String "CreateDiskSnapshot" -> CreateDiskSnapshot
    | `String "DetachDisk" -> DetachDisk
    | `String "AttachDisk" -> AttachDisk
    | `String "DeleteDisk" -> DeleteDisk
    | `String "CreateDisk" -> CreateDisk
    | `String "AttachLoadBalancerTlsCertificate" -> AttachLoadBalancerTlsCertificate
    | `String "DeleteLoadBalancerTlsCertificate" -> DeleteLoadBalancerTlsCertificate
    | `String "CreateLoadBalancerTlsCertificate" -> CreateLoadBalancerTlsCertificate
    | `String "UpdateLoadBalancerAttribute" -> UpdateLoadBalancerAttribute
    | `String "DetachInstancesFromLoadBalancer" -> DetachInstancesFromLoadBalancer
    | `String "AttachInstancesToLoadBalancer" -> AttachInstancesToLoadBalancer
    | `String "DeleteLoadBalancer" -> DeleteLoadBalancer
    | `String "CreateLoadBalancer" -> CreateLoadBalancer
    | `String "CreateInstancesFromSnapshot" -> CreateInstancesFromSnapshot
    | `String "DeleteInstanceSnapshot" -> DeleteInstanceSnapshot
    | `String "CreateInstanceSnapshot" -> CreateInstanceSnapshot
    | `String "DeleteDomain" -> DeleteDomain
    | `String "CreateDomain" -> CreateDomain
    | `String "DeleteDomainEntry" -> DeleteDomainEntry
    | `String "UpdateDomainEntry" -> UpdateDomainEntry
    | `String "DetachStaticIp" -> DetachStaticIp
    | `String "AttachStaticIp" -> AttachStaticIp
    | `String "ReleaseStaticIp" -> ReleaseStaticIp
    | `String "AllocateStaticIp" -> AllocateStaticIp
    | `String "CloseInstancePublicPorts" -> CloseInstancePublicPorts
    | `String "PutInstancePublicPorts" -> PutInstancePublicPorts
    | `String "OpenInstancePublicPorts" -> OpenInstancePublicPorts
    | `String "RebootInstance" -> RebootInstance
    | `String "StartInstance" -> StartInstance
    | `String "StopInstance" -> StopInstance
    | `String "CreateInstance" -> CreateInstance
    | `String "DeleteInstance" -> DeleteInstance
    | `String "DeleteKnownHostKeys" -> DeleteKnownHostKeys
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationType" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationType")

let operation_status_of_yojson = 
  fun (tree: t) path : operation_status -> match tree with 
    | `String "Succeeded" -> Succeeded
    | `String "Completed" -> Completed
    | `String "Failed" -> Failed
    | `String "Started" -> Started
    | `String "NotStarted" -> NotStarted
    | `String value -> raise (deserialize_unknown_enum_value_error path "OperationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OperationStatus")

let operation_of_yojson = 
  fun tree path : operation ->
  let _list = assoc_of_yojson tree path in
  let _res : operation = {
    error_details = option_of_yojson (value_for_key (string__of_yojson) "errorDetails") _list path;
    error_code = option_of_yojson (value_for_key (string__of_yojson) "errorCode") _list path;
    status_changed_at = option_of_yojson (value_for_key (iso_date_of_yojson) "statusChangedAt") _list path;
    status = option_of_yojson (value_for_key (operation_status_of_yojson) "status") _list path;
    operation_type = option_of_yojson (value_for_key (operation_type_of_yojson) "operationType") _list path;
    operation_details = option_of_yojson (value_for_key (string__of_yojson) "operationDetails") _list path;
    is_terminal = option_of_yojson (value_for_key (boolean__of_yojson) "isTerminal") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "resourceName") _list path;
    id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "id") _list path;
    
  }
  in _res

let operation_list_of_yojson = 
  fun tree path -> list_of_yojson operation_of_yojson tree path 

let update_relational_database_result_of_yojson = 
  fun tree path : update_relational_database_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_relational_database_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let sensitive_string_of_yojson = string_of_yojson

let update_relational_database_request_of_yojson = 
  fun tree path : update_relational_database_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_relational_database_request = {
    relational_database_blueprint_id = option_of_yojson (value_for_key (string__of_yojson) "relationalDatabaseBlueprintId") _list path;
    ca_certificate_identifier = option_of_yojson (value_for_key (string__of_yojson) "caCertificateIdentifier") _list path;
    apply_immediately = option_of_yojson (value_for_key (boolean__of_yojson) "applyImmediately") _list path;
    publicly_accessible = option_of_yojson (value_for_key (boolean__of_yojson) "publiclyAccessible") _list path;
    disable_backup_retention = option_of_yojson (value_for_key (boolean__of_yojson) "disableBackupRetention") _list path;
    enable_backup_retention = option_of_yojson (value_for_key (boolean__of_yojson) "enableBackupRetention") _list path;
    preferred_maintenance_window = option_of_yojson (value_for_key (string__of_yojson) "preferredMaintenanceWindow") _list path;
    preferred_backup_window = option_of_yojson (value_for_key (string__of_yojson) "preferredBackupWindow") _list path;
    rotate_master_user_password = option_of_yojson (value_for_key (boolean__of_yojson) "rotateMasterUserPassword") _list path;
    master_user_password = option_of_yojson (value_for_key (sensitive_string_of_yojson) "masterUserPassword") _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let update_relational_database_parameters_result_of_yojson = 
  fun tree path : update_relational_database_parameters_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_relational_database_parameters_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let relational_database_parameter_of_yojson = 
  fun tree path : relational_database_parameter ->
  let _list = assoc_of_yojson tree path in
  let _res : relational_database_parameter = {
    parameter_value = option_of_yojson (value_for_key (string__of_yojson) "parameterValue") _list path;
    parameter_name = option_of_yojson (value_for_key (string__of_yojson) "parameterName") _list path;
    is_modifiable = option_of_yojson (value_for_key (boolean__of_yojson) "isModifiable") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "description") _list path;
    data_type = option_of_yojson (value_for_key (string__of_yojson) "dataType") _list path;
    apply_type = option_of_yojson (value_for_key (string__of_yojson) "applyType") _list path;
    apply_method = option_of_yojson (value_for_key (string__of_yojson) "applyMethod") _list path;
    allowed_values = option_of_yojson (value_for_key (string__of_yojson) "allowedValues") _list path;
    
  }
  in _res

let relational_database_parameter_list_of_yojson = 
  fun tree path -> list_of_yojson relational_database_parameter_of_yojson tree path 

let update_relational_database_parameters_request_of_yojson = 
  fun tree path : update_relational_database_parameters_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_relational_database_parameters_request = {
    parameters = value_for_key (relational_database_parameter_list_of_yojson) "parameters" _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let unauthenticated_exception_of_yojson = 
  fun tree path : unauthenticated_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unauthenticated_exception = {
    tip = option_of_yojson (value_for_key (string__of_yojson) "tip") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    docs = option_of_yojson (value_for_key (string__of_yojson) "docs") _list path;
    code = option_of_yojson (value_for_key (string__of_yojson) "code") _list path;
    
  }
  in _res

let service_exception_of_yojson = 
  fun tree path : service_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : service_exception = {
    tip = option_of_yojson (value_for_key (string__of_yojson) "tip") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    docs = option_of_yojson (value_for_key (string__of_yojson) "docs") _list path;
    code = option_of_yojson (value_for_key (string__of_yojson) "code") _list path;
    
  }
  in _res

let operation_failure_exception_of_yojson = 
  fun tree path : operation_failure_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : operation_failure_exception = {
    tip = option_of_yojson (value_for_key (string__of_yojson) "tip") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    docs = option_of_yojson (value_for_key (string__of_yojson) "docs") _list path;
    code = option_of_yojson (value_for_key (string__of_yojson) "code") _list path;
    
  }
  in _res

let not_found_exception_of_yojson = 
  fun tree path : not_found_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : not_found_exception = {
    tip = option_of_yojson (value_for_key (string__of_yojson) "tip") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    docs = option_of_yojson (value_for_key (string__of_yojson) "docs") _list path;
    code = option_of_yojson (value_for_key (string__of_yojson) "code") _list path;
    
  }
  in _res

let invalid_input_exception_of_yojson = 
  fun tree path : invalid_input_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_input_exception = {
    tip = option_of_yojson (value_for_key (string__of_yojson) "tip") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    docs = option_of_yojson (value_for_key (string__of_yojson) "docs") _list path;
    code = option_of_yojson (value_for_key (string__of_yojson) "code") _list path;
    
  }
  in _res

let account_setup_in_progress_exception_of_yojson = 
  fun tree path : account_setup_in_progress_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : account_setup_in_progress_exception = {
    tip = option_of_yojson (value_for_key (string__of_yojson) "tip") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    docs = option_of_yojson (value_for_key (string__of_yojson) "docs") _list path;
    code = option_of_yojson (value_for_key (string__of_yojson) "code") _list path;
    
  }
  in _res

let access_denied_exception_of_yojson = 
  fun tree path : access_denied_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : access_denied_exception = {
    tip = option_of_yojson (value_for_key (string__of_yojson) "tip") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    docs = option_of_yojson (value_for_key (string__of_yojson) "docs") _list path;
    code = option_of_yojson (value_for_key (string__of_yojson) "code") _list path;
    
  }
  in _res

let update_load_balancer_attribute_result_of_yojson = 
  fun tree path : update_load_balancer_attribute_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_load_balancer_attribute_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let load_balancer_attribute_name_of_yojson = 
  fun (tree: t) path : load_balancer_attribute_name -> match tree with 
    | `String "TlsPolicyName" -> TlsPolicyName
    | `String "HttpsRedirectionEnabled" -> HttpsRedirectionEnabled
    | `String "SessionStickiness_LB_CookieDurationSeconds" -> SessionStickiness_LB_CookieDurationSeconds
    | `String "SessionStickinessEnabled" -> SessionStickinessEnabled
    | `String "HealthCheckPath" -> HealthCheckPath
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerAttributeName" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerAttributeName")

let string_max256_of_yojson = string_of_yojson

let update_load_balancer_attribute_request_of_yojson = 
  fun tree path : update_load_balancer_attribute_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_load_balancer_attribute_request = {
    attribute_value = value_for_key (string_max256_of_yojson) "attributeValue" _list path;
    attribute_name = value_for_key (load_balancer_attribute_name_of_yojson) "attributeName" _list path;
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let update_instance_metadata_options_result_of_yojson = 
  fun tree path : update_instance_metadata_options_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_instance_metadata_options_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let http_tokens_of_yojson = 
  fun (tree: t) path : http_tokens -> match tree with 
    | `String "required" -> Required
    | `String "optional" -> Optional
    | `String value -> raise (deserialize_unknown_enum_value_error path "HttpTokens" value)
    | _ -> raise (deserialize_wrong_type_error path "HttpTokens")

let http_endpoint_of_yojson = 
  fun (tree: t) path : http_endpoint -> match tree with 
    | `String "enabled" -> Enabled
    | `String "disabled" -> Disabled
    | `String value -> raise (deserialize_unknown_enum_value_error path "HttpEndpoint" value)
    | _ -> raise (deserialize_wrong_type_error path "HttpEndpoint")

let http_protocol_ipv6_of_yojson = 
  fun (tree: t) path : http_protocol_ipv6 -> match tree with 
    | `String "enabled" -> Enabled
    | `String "disabled" -> Disabled
    | `String value -> raise (deserialize_unknown_enum_value_error path "HttpProtocolIpv6" value)
    | _ -> raise (deserialize_wrong_type_error path "HttpProtocolIpv6")

let update_instance_metadata_options_request_of_yojson = 
  fun tree path : update_instance_metadata_options_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_instance_metadata_options_request = {
    http_protocol_ipv6 = option_of_yojson (value_for_key (http_protocol_ipv6_of_yojson) "httpProtocolIpv6") _list path;
    http_put_response_hop_limit = option_of_yojson (value_for_key (integer__of_yojson) "httpPutResponseHopLimit") _list path;
    http_endpoint = option_of_yojson (value_for_key (http_endpoint_of_yojson) "httpEndpoint") _list path;
    http_tokens = option_of_yojson (value_for_key (http_tokens_of_yojson) "httpTokens") _list path;
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let update_domain_entry_result_of_yojson = 
  fun tree path : update_domain_entry_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_domain_entry_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let domain_name_of_yojson = string_of_yojson

let domain_entry_type_of_yojson = string_of_yojson

let domain_entry_options_keys_of_yojson = string_of_yojson

let domain_entry_options_of_yojson = 
  fun tree path -> map_of_yojson string__of_yojson tree path

let domain_entry_of_yojson = 
  fun tree path : domain_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_entry = {
    options = option_of_yojson (value_for_key (domain_entry_options_of_yojson) "options") _list path;
    type_ = option_of_yojson (value_for_key (domain_entry_type_of_yojson) "type") _list path;
    is_alias = option_of_yojson (value_for_key (boolean__of_yojson) "isAlias") _list path;
    target = option_of_yojson (value_for_key (string__of_yojson) "target") _list path;
    name = option_of_yojson (value_for_key (domain_name_of_yojson) "name") _list path;
    id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "id") _list path;
    
  }
  in _res

let update_domain_entry_request_of_yojson = 
  fun tree path : update_domain_entry_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_domain_entry_request = {
    domain_entry = value_for_key (domain_entry_of_yojson) "domainEntry" _list path;
    domain_name = value_for_key (domain_name_of_yojson) "domainName" _list path;
    
  }
  in _res

let update_distribution_result_of_yojson = 
  fun tree path : update_distribution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_distribution_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let origin_protocol_policy_enum_of_yojson = 
  fun (tree: t) path : origin_protocol_policy_enum -> match tree with 
    | `String "https-only" -> HTTPSOnly
    | `String "http-only" -> HTTPOnly
    | `String value -> raise (deserialize_unknown_enum_value_error path "OriginProtocolPolicyEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "OriginProtocolPolicyEnum")

let input_origin_of_yojson = 
  fun tree path : input_origin ->
  let _list = assoc_of_yojson tree path in
  let _res : input_origin = {
    response_timeout = option_of_yojson (value_for_key (integer__of_yojson) "responseTimeout") _list path;
    protocol_policy = option_of_yojson (value_for_key (origin_protocol_policy_enum_of_yojson) "protocolPolicy") _list path;
    region_name = option_of_yojson (value_for_key (region_name_of_yojson) "regionName") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let behavior_enum_of_yojson = 
  fun (tree: t) path : behavior_enum -> match tree with 
    | `String "cache" -> CacheSetting
    | `String "dont-cache" -> DontCacheSetting
    | `String value -> raise (deserialize_unknown_enum_value_error path "BehaviorEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "BehaviorEnum")

let cache_behavior_of_yojson = 
  fun tree path : cache_behavior ->
  let _list = assoc_of_yojson tree path in
  let _res : cache_behavior = {
    behavior = option_of_yojson (value_for_key (behavior_enum_of_yojson) "behavior") _list path;
    
  }
  in _res

let forward_values_of_yojson = 
  fun (tree: t) path : forward_values -> match tree with 
    | `String "all" -> All
    | `String "allow-list" -> AllowList
    | `String "none" -> None
    | `String value -> raise (deserialize_unknown_enum_value_error path "ForwardValues" value)
    | _ -> raise (deserialize_wrong_type_error path "ForwardValues")

let string_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let cookie_object_of_yojson = 
  fun tree path : cookie_object ->
  let _list = assoc_of_yojson tree path in
  let _res : cookie_object = {
    cookies_allow_list = option_of_yojson (value_for_key (string_list_of_yojson) "cookiesAllowList") _list path;
    option_ = option_of_yojson (value_for_key (forward_values_of_yojson) "option") _list path;
    
  }
  in _res

let header_enum_of_yojson = 
  fun (tree: t) path : header_enum -> match tree with 
    | `String "Referer" -> Referer
    | `String "Origin" -> Origin
    | `String "Host" -> Host
    | `String "CloudFront-Viewer-Country" -> CloudFrontViewerCountry
    | `String "CloudFront-Is-Tablet-Viewer" -> CloudFrontIsTabletViewer
    | `String "CloudFront-Is-SmartTV-Viewer" -> CloudFrontIsSmartTVViewer
    | `String "CloudFront-Is-Mobile-Viewer" -> CloudFrontIsMobileViewer
    | `String "CloudFront-Is-Desktop-Viewer" -> CloudFrontIsDesktopViewer
    | `String "CloudFront-Forwarded-Proto" -> CloudFrontForwardedProto
    | `String "Authorization" -> Authorization
    | `String "Accept-Language" -> AcceptLanguage
    | `String "Accept-Encoding" -> AcceptEncoding
    | `String "Accept-Datetime" -> AcceptDatetime
    | `String "Accept-Charset" -> AcceptCharset
    | `String "Accept" -> Accept
    | `String value -> raise (deserialize_unknown_enum_value_error path "HeaderEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "HeaderEnum")

let header_forward_list_of_yojson = 
  fun tree path -> list_of_yojson header_enum_of_yojson tree path 

let header_object_of_yojson = 
  fun tree path : header_object ->
  let _list = assoc_of_yojson tree path in
  let _res : header_object = {
    headers_allow_list = option_of_yojson (value_for_key (header_forward_list_of_yojson) "headersAllowList") _list path;
    option_ = option_of_yojson (value_for_key (forward_values_of_yojson) "option") _list path;
    
  }
  in _res

let query_string_object_of_yojson = 
  fun tree path : query_string_object ->
  let _list = assoc_of_yojson tree path in
  let _res : query_string_object = {
    query_strings_allow_list = option_of_yojson (value_for_key (string_list_of_yojson) "queryStringsAllowList") _list path;
    option_ = option_of_yojson (value_for_key (boolean__of_yojson) "option") _list path;
    
  }
  in _res

let cache_settings_of_yojson = 
  fun tree path : cache_settings ->
  let _list = assoc_of_yojson tree path in
  let _res : cache_settings = {
    forwarded_query_strings = option_of_yojson (value_for_key (query_string_object_of_yojson) "forwardedQueryStrings") _list path;
    forwarded_headers = option_of_yojson (value_for_key (header_object_of_yojson) "forwardedHeaders") _list path;
    forwarded_cookies = option_of_yojson (value_for_key (cookie_object_of_yojson) "forwardedCookies") _list path;
    cached_http_methods = option_of_yojson (value_for_key (non_empty_string_of_yojson) "cachedHTTPMethods") _list path;
    allowed_http_methods = option_of_yojson (value_for_key (non_empty_string_of_yojson) "allowedHTTPMethods") _list path;
    maximum_tt_l = option_of_yojson (value_for_key (long_of_yojson) "maximumTTL") _list path;
    minimum_tt_l = option_of_yojson (value_for_key (long_of_yojson) "minimumTTL") _list path;
    default_tt_l = option_of_yojson (value_for_key (long_of_yojson) "defaultTTL") _list path;
    
  }
  in _res

let cache_behavior_per_path_of_yojson = 
  fun tree path : cache_behavior_per_path ->
  let _list = assoc_of_yojson tree path in
  let _res : cache_behavior_per_path = {
    behavior = option_of_yojson (value_for_key (behavior_enum_of_yojson) "behavior") _list path;
    path = option_of_yojson (value_for_key (string__of_yojson) "path") _list path;
    
  }
  in _res

let cache_behavior_list_of_yojson = 
  fun tree path -> list_of_yojson cache_behavior_per_path_of_yojson tree path 

let update_distribution_request_of_yojson = 
  fun tree path : update_distribution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_distribution_request = {
    use_default_certificate = option_of_yojson (value_for_key (boolean__of_yojson) "useDefaultCertificate") _list path;
    certificate_name = option_of_yojson (value_for_key (resource_name_of_yojson) "certificateName") _list path;
    viewer_minimum_tls_protocol_version = option_of_yojson (value_for_key (viewer_minimum_tls_protocol_version_enum_of_yojson) "viewerMinimumTlsProtocolVersion") _list path;
    is_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "isEnabled") _list path;
    cache_behaviors = option_of_yojson (value_for_key (cache_behavior_list_of_yojson) "cacheBehaviors") _list path;
    cache_behavior_settings = option_of_yojson (value_for_key (cache_settings_of_yojson) "cacheBehaviorSettings") _list path;
    default_cache_behavior = option_of_yojson (value_for_key (cache_behavior_of_yojson) "defaultCacheBehavior") _list path;
    origin = option_of_yojson (value_for_key (input_origin_of_yojson) "origin") _list path;
    distribution_name = value_for_key (resource_name_of_yojson) "distributionName" _list path;
    
  }
  in _res

let update_distribution_bundle_result_of_yojson = 
  fun tree path : update_distribution_bundle_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_distribution_bundle_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let update_distribution_bundle_request_of_yojson = 
  fun tree path : update_distribution_bundle_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_distribution_bundle_request = {
    bundle_id = option_of_yojson (value_for_key (string__of_yojson) "bundleId") _list path;
    distribution_name = option_of_yojson (value_for_key (resource_name_of_yojson) "distributionName") _list path;
    
  }
  in _res

let container_service_name_of_yojson = string_of_yojson

let tag_key_of_yojson = string_of_yojson

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson = 
  fun tree path : tag ->
  let _list = assoc_of_yojson tree path in
  let _res : tag = {
    value = option_of_yojson (value_for_key (tag_value_of_yojson) "value") _list path;
    key = option_of_yojson (value_for_key (tag_key_of_yojson) "key") _list path;
    
  }
  in _res

let tag_list_of_yojson = 
  fun tree path -> list_of_yojson tag_of_yojson tree path 

let container_service_power_name_of_yojson = 
  fun (tree: t) path : container_service_power_name -> match tree with 
    | `String "xlarge" -> Xlarge
    | `String "large" -> Large
    | `String "medium" -> Medium
    | `String "small" -> Small
    | `String "micro" -> Micro
    | `String "nano" -> Nano
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContainerServicePowerName" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServicePowerName")

let container_service_state_of_yojson = 
  fun (tree: t) path : container_service_state -> match tree with 
    | `String "DEPLOYING" -> DEPLOYING
    | `String "DISABLED" -> DISABLED
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "RUNNING" -> RUNNING
    | `String "READY" -> READY
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContainerServiceState" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServiceState")

let container_service_state_detail_code_of_yojson = 
  fun (tree: t) path : container_service_state_detail_code -> match tree with 
    | `String "UNKNOWN_ERROR" -> UNKNOWN_ERROR
    | `String "CERTIFICATE_LIMIT_EXCEEDED" -> CERTIFICATE_LIMIT_EXCEEDED
    | `String "ACTIVATING_DEPLOYMENT" -> ACTIVATING_DEPLOYMENT
    | `String "EVALUATING_HEALTH_CHECK" -> EVALUATING_HEALTH_CHECK
    | `String "CREATING_DEPLOYMENT" -> CREATING_DEPLOYMENT
    | `String "PROVISIONING_SERVICE" -> PROVISIONING_SERVICE
    | `String "PROVISIONING_CERTIFICATE" -> PROVISIONING_CERTIFICATE
    | `String "CREATING_NETWORK_INFRASTRUCTURE" -> CREATING_NETWORK_INFRASTRUCTURE
    | `String "CREATING_SYSTEM_RESOURCES" -> CREATING_SYSTEM_RESOURCES
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContainerServiceStateDetailCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServiceStateDetailCode")

let container_service_state_detail_of_yojson = 
  fun tree path : container_service_state_detail ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service_state_detail = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    code = option_of_yojson (value_for_key (container_service_state_detail_code_of_yojson) "code") _list path;
    
  }
  in _res

let container_service_scale_of_yojson = int_of_yojson

let container_service_deployment_state_of_yojson = 
  fun (tree: t) path : container_service_deployment_state -> match tree with 
    | `String "FAILED" -> FAILED
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String "ACTIVATING" -> ACTIVATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContainerServiceDeploymentState" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServiceDeploymentState")

let environment_of_yojson = 
  fun tree path -> map_of_yojson string__of_yojson tree path

let container_service_protocol_of_yojson = 
  fun (tree: t) path : container_service_protocol -> match tree with 
    | `String "UDP" -> UDP
    | `String "TCP" -> TCP
    | `String "HTTPS" -> HTTPS
    | `String "HTTP" -> HTTP
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContainerServiceProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServiceProtocol")

let port_map_of_yojson = 
  fun tree path -> map_of_yojson container_service_protocol_of_yojson tree path

let container_of_yojson = 
  fun tree path : container ->
  let _list = assoc_of_yojson tree path in
  let _res : container = {
    ports = option_of_yojson (value_for_key (port_map_of_yojson) "ports") _list path;
    environment = option_of_yojson (value_for_key (environment_of_yojson) "environment") _list path;
    command = option_of_yojson (value_for_key (string_list_of_yojson) "command") _list path;
    image = option_of_yojson (value_for_key (string__of_yojson) "image") _list path;
    
  }
  in _res

let container_name_of_yojson = string_of_yojson

let container_map_of_yojson = 
  fun tree path -> map_of_yojson container_of_yojson tree path

let container_service_health_check_config_of_yojson = 
  fun tree path : container_service_health_check_config ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service_health_check_config = {
    success_codes = option_of_yojson (value_for_key (string__of_yojson) "successCodes") _list path;
    path = option_of_yojson (value_for_key (string__of_yojson) "path") _list path;
    interval_seconds = option_of_yojson (value_for_key (integer__of_yojson) "intervalSeconds") _list path;
    timeout_seconds = option_of_yojson (value_for_key (integer__of_yojson) "timeoutSeconds") _list path;
    unhealthy_threshold = option_of_yojson (value_for_key (integer__of_yojson) "unhealthyThreshold") _list path;
    healthy_threshold = option_of_yojson (value_for_key (integer__of_yojson) "healthyThreshold") _list path;
    
  }
  in _res

let container_service_endpoint_of_yojson = 
  fun tree path : container_service_endpoint ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service_endpoint = {
    health_check = option_of_yojson (value_for_key (container_service_health_check_config_of_yojson) "healthCheck") _list path;
    container_port = option_of_yojson (value_for_key (integer__of_yojson) "containerPort") _list path;
    container_name = option_of_yojson (value_for_key (string__of_yojson) "containerName") _list path;
    
  }
  in _res

let container_service_deployment_of_yojson = 
  fun tree path : container_service_deployment ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service_deployment = {
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    public_endpoint = option_of_yojson (value_for_key (container_service_endpoint_of_yojson) "publicEndpoint") _list path;
    containers = option_of_yojson (value_for_key (container_map_of_yojson) "containers") _list path;
    state = option_of_yojson (value_for_key (container_service_deployment_state_of_yojson) "state") _list path;
    version = option_of_yojson (value_for_key (integer__of_yojson) "version") _list path;
    
  }
  in _res

let container_service_public_domains_list_of_yojson = 
  fun tree path -> list_of_yojson string__of_yojson tree path 

let container_service_public_domains_of_yojson = 
  fun tree path -> map_of_yojson container_service_public_domains_list_of_yojson tree path

let container_service_ecr_image_puller_role_of_yojson = 
  fun tree path : container_service_ecr_image_puller_role ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service_ecr_image_puller_role = {
    principal_arn = option_of_yojson (value_for_key (string__of_yojson) "principalArn") _list path;
    is_active = option_of_yojson (value_for_key (boolean__of_yojson) "isActive") _list path;
    
  }
  in _res

let private_registry_access_of_yojson = 
  fun tree path : private_registry_access ->
  let _list = assoc_of_yojson tree path in
  let _res : private_registry_access = {
    ecr_image_puller_role = option_of_yojson (value_for_key (container_service_ecr_image_puller_role_of_yojson) "ecrImagePullerRole") _list path;
    
  }
  in _res

let container_service_of_yojson = 
  fun tree path : container_service ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service = {
    private_registry_access = option_of_yojson (value_for_key (private_registry_access_of_yojson) "privateRegistryAccess") _list path;
    url = option_of_yojson (value_for_key (string__of_yojson) "url") _list path;
    public_domain_names = option_of_yojson (value_for_key (container_service_public_domains_of_yojson) "publicDomainNames") _list path;
    private_domain_name = option_of_yojson (value_for_key (string__of_yojson) "privateDomainName") _list path;
    principal_arn = option_of_yojson (value_for_key (string__of_yojson) "principalArn") _list path;
    is_disabled = option_of_yojson (value_for_key (boolean__of_yojson) "isDisabled") _list path;
    next_deployment = option_of_yojson (value_for_key (container_service_deployment_of_yojson) "nextDeployment") _list path;
    current_deployment = option_of_yojson (value_for_key (container_service_deployment_of_yojson) "currentDeployment") _list path;
    scale = option_of_yojson (value_for_key (container_service_scale_of_yojson) "scale") _list path;
    state_detail = option_of_yojson (value_for_key (container_service_state_detail_of_yojson) "stateDetail") _list path;
    state = option_of_yojson (value_for_key (container_service_state_of_yojson) "state") _list path;
    power_id = option_of_yojson (value_for_key (string__of_yojson) "powerId") _list path;
    power = option_of_yojson (value_for_key (container_service_power_name_of_yojson) "power") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    container_service_name = option_of_yojson (value_for_key (container_service_name_of_yojson) "containerServiceName") _list path;
    
  }
  in _res

let update_container_service_result_of_yojson = 
  fun tree path : update_container_service_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_container_service_result = {
    container_service = option_of_yojson (value_for_key (container_service_of_yojson) "containerService") _list path;
    
  }
  in _res

let container_service_ecr_image_puller_role_request_of_yojson = 
  fun tree path : container_service_ecr_image_puller_role_request ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service_ecr_image_puller_role_request = {
    is_active = option_of_yojson (value_for_key (boolean__of_yojson) "isActive") _list path;
    
  }
  in _res

let private_registry_access_request_of_yojson = 
  fun tree path : private_registry_access_request ->
  let _list = assoc_of_yojson tree path in
  let _res : private_registry_access_request = {
    ecr_image_puller_role = option_of_yojson (value_for_key (container_service_ecr_image_puller_role_request_of_yojson) "ecrImagePullerRole") _list path;
    
  }
  in _res

let update_container_service_request_of_yojson = 
  fun tree path : update_container_service_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_container_service_request = {
    private_registry_access = option_of_yojson (value_for_key (private_registry_access_request_of_yojson) "privateRegistryAccess") _list path;
    public_domain_names = option_of_yojson (value_for_key (container_service_public_domains_of_yojson) "publicDomainNames") _list path;
    is_disabled = option_of_yojson (value_for_key (boolean__of_yojson) "isDisabled") _list path;
    scale = option_of_yojson (value_for_key (container_service_scale_of_yojson) "scale") _list path;
    power = option_of_yojson (value_for_key (container_service_power_name_of_yojson) "power") _list path;
    service_name = value_for_key (container_service_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let access_type_of_yojson = 
  fun (tree: t) path : access_type -> match tree with 
    | `String "private" -> Private
    | `String "public" -> Public
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessType")

let access_rules_of_yojson = 
  fun tree path : access_rules ->
  let _list = assoc_of_yojson tree path in
  let _res : access_rules = {
    allow_public_overrides = option_of_yojson (value_for_key (boolean__of_yojson) "allowPublicOverrides") _list path;
    get_object = option_of_yojson (value_for_key (access_type_of_yojson) "getObject") _list path;
    
  }
  in _res

let bucket_name_of_yojson = string_of_yojson

let partner_id_list_of_yojson = 
  fun tree path -> list_of_yojson non_empty_string_of_yojson tree path 

let resource_receiving_access_of_yojson = 
  fun tree path : resource_receiving_access ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_receiving_access = {
    resource_type = option_of_yojson (value_for_key (non_empty_string_of_yojson) "resourceType") _list path;
    name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "name") _list path;
    
  }
  in _res

let access_receiver_list_of_yojson = 
  fun tree path -> list_of_yojson resource_receiving_access_of_yojson tree path 

let bucket_state_of_yojson = 
  fun tree path : bucket_state ->
  let _list = assoc_of_yojson tree path in
  let _res : bucket_state = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    code = option_of_yojson (value_for_key (non_empty_string_of_yojson) "code") _list path;
    
  }
  in _res

let bucket_access_log_prefix_of_yojson = string_of_yojson

let bucket_access_log_config_of_yojson = 
  fun tree path : bucket_access_log_config ->
  let _list = assoc_of_yojson tree path in
  let _res : bucket_access_log_config = {
    prefix = option_of_yojson (value_for_key (bucket_access_log_prefix_of_yojson) "prefix") _list path;
    destination = option_of_yojson (value_for_key (bucket_name_of_yojson) "destination") _list path;
    enabled = value_for_key (boolean__of_yojson) "enabled" _list path;
    
  }
  in _res

let bucket_of_yojson = 
  fun tree path : bucket ->
  let _list = assoc_of_yojson tree path in
  let _res : bucket = {
    access_log_config = option_of_yojson (value_for_key (bucket_access_log_config_of_yojson) "accessLogConfig") _list path;
    state = option_of_yojson (value_for_key (bucket_state_of_yojson) "state") _list path;
    resources_receiving_access = option_of_yojson (value_for_key (access_receiver_list_of_yojson) "resourcesReceivingAccess") _list path;
    readonly_access_accounts = option_of_yojson (value_for_key (partner_id_list_of_yojson) "readonlyAccessAccounts") _list path;
    able_to_update_bundle = option_of_yojson (value_for_key (boolean__of_yojson) "ableToUpdateBundle") _list path;
    object_versioning = option_of_yojson (value_for_key (non_empty_string_of_yojson) "objectVersioning") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    support_code = option_of_yojson (value_for_key (non_empty_string_of_yojson) "supportCode") _list path;
    name = option_of_yojson (value_for_key (bucket_name_of_yojson) "name") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    url = option_of_yojson (value_for_key (non_empty_string_of_yojson) "url") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    bundle_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "bundleId") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    access_rules = option_of_yojson (value_for_key (access_rules_of_yojson) "accessRules") _list path;
    resource_type = option_of_yojson (value_for_key (non_empty_string_of_yojson) "resourceType") _list path;
    
  }
  in _res

let update_bucket_result_of_yojson = 
  fun tree path : update_bucket_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_bucket_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    bucket = option_of_yojson (value_for_key (bucket_of_yojson) "bucket") _list path;
    
  }
  in _res

let update_bucket_request_of_yojson = 
  fun tree path : update_bucket_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_bucket_request = {
    access_log_config = option_of_yojson (value_for_key (bucket_access_log_config_of_yojson) "accessLogConfig") _list path;
    readonly_access_accounts = option_of_yojson (value_for_key (partner_id_list_of_yojson) "readonlyAccessAccounts") _list path;
    versioning = option_of_yojson (value_for_key (non_empty_string_of_yojson) "versioning") _list path;
    access_rules = option_of_yojson (value_for_key (access_rules_of_yojson) "accessRules") _list path;
    bucket_name = value_for_key (bucket_name_of_yojson) "bucketName" _list path;
    
  }
  in _res

let update_bucket_bundle_result_of_yojson = 
  fun tree path : update_bucket_bundle_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_bucket_bundle_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let update_bucket_bundle_request_of_yojson = 
  fun tree path : update_bucket_bundle_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_bucket_bundle_request = {
    bundle_id = value_for_key (non_empty_string_of_yojson) "bundleId" _list path;
    bucket_name = value_for_key (bucket_name_of_yojson) "bucketName" _list path;
    
  }
  in _res

let untag_resource_result_of_yojson = 
  fun tree path : untag_resource_result ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let resource_arn_of_yojson = string_of_yojson

let tag_key_list_of_yojson = 
  fun tree path -> list_of_yojson tag_key_of_yojson tree path 

let untag_resource_request_of_yojson = 
  fun tree path : untag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : untag_resource_request = {
    tag_keys = value_for_key (tag_key_list_of_yojson) "tagKeys" _list path;
    resource_arn = option_of_yojson (value_for_key (resource_arn_of_yojson) "resourceArn") _list path;
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let unpeer_vpc_result_of_yojson = 
  fun tree path : unpeer_vpc_result ->
  let _list = assoc_of_yojson tree path in
  let _res : unpeer_vpc_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let unpeer_vpc_request_of_yojson = 
  fun tree path : unpeer_vpc_request ->
  let _list = assoc_of_yojson tree path in
  let _res : unpeer_vpc_request = ()
  in _res

let treat_missing_data_of_yojson = 
  fun (tree: t) path : treat_missing_data -> match tree with 
    | `String "missing" -> Missing
    | `String "ignore" -> Ignore
    | `String "notBreaching" -> NotBreaching
    | `String "breaching" -> Breaching
    | `String value -> raise (deserialize_unknown_enum_value_error path "TreatMissingData" value)
    | _ -> raise (deserialize_wrong_type_error path "TreatMissingData")

let time_period_of_yojson = 
  fun tree path : time_period ->
  let _list = assoc_of_yojson tree path in
  let _res : time_period = {
    end_ = option_of_yojson (value_for_key (iso_date_of_yojson) "end") _list path;
    start = option_of_yojson (value_for_key (iso_date_of_yojson) "start") _list path;
    
  }
  in _res

let time_of_day_of_yojson = string_of_yojson

let test_alarm_result_of_yojson = 
  fun tree path : test_alarm_result ->
  let _list = assoc_of_yojson tree path in
  let _res : test_alarm_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let alarm_state_of_yojson = 
  fun (tree: t) path : alarm_state -> match tree with 
    | `String "INSUFFICIENT_DATA" -> INSUFFICIENT_DATA
    | `String "ALARM" -> ALARM
    | `String "OK" -> OK
    | `String value -> raise (deserialize_unknown_enum_value_error path "AlarmState" value)
    | _ -> raise (deserialize_wrong_type_error path "AlarmState")

let test_alarm_request_of_yojson = 
  fun tree path : test_alarm_request ->
  let _list = assoc_of_yojson tree path in
  let _res : test_alarm_request = {
    state = value_for_key (alarm_state_of_yojson) "state" _list path;
    alarm_name = value_for_key (resource_name_of_yojson) "alarmName" _list path;
    
  }
  in _res

let tag_resource_result_of_yojson = 
  fun tree path : tag_resource_result ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let tag_resource_request_of_yojson = 
  fun tree path : tag_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : tag_resource_request = {
    tags = value_for_key (tag_list_of_yojson) "tags" _list path;
    resource_arn = option_of_yojson (value_for_key (resource_arn_of_yojson) "resourceArn") _list path;
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let subject_alternative_name_list_of_yojson = 
  fun tree path -> list_of_yojson domain_name_of_yojson tree path 

let stop_relational_database_result_of_yojson = 
  fun tree path : stop_relational_database_result ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_relational_database_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let stop_relational_database_request_of_yojson = 
  fun tree path : stop_relational_database_request ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_relational_database_request = {
    relational_database_snapshot_name = option_of_yojson (value_for_key (resource_name_of_yojson) "relationalDatabaseSnapshotName") _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let stop_instance_result_of_yojson = 
  fun tree path : stop_instance_result ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_instance_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let stop_instance_request_of_yojson = 
  fun tree path : stop_instance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_instance_request = {
    force = option_of_yojson (value_for_key (boolean__of_yojson) "force") _list path;
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let stop_instance_on_idle_request_of_yojson = 
  fun tree path : stop_instance_on_idle_request ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_instance_on_idle_request = {
    duration = option_of_yojson (value_for_key (string__of_yojson) "duration") _list path;
    threshold = option_of_yojson (value_for_key (string__of_yojson) "threshold") _list path;
    
  }
  in _res

let stop_gui_session_result_of_yojson = 
  fun tree path : stop_gui_session_result ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_gui_session_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let stop_gui_session_request_of_yojson = 
  fun tree path : stop_gui_session_request ->
  let _list = assoc_of_yojson tree path in
  let _res : stop_gui_session_request = {
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let status_type_of_yojson = 
  fun (tree: t) path : status_type -> match tree with 
    | `String "Inactive" -> Inactive
    | `String "Active" -> Active
    | `String value -> raise (deserialize_unknown_enum_value_error path "StatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "StatusType")

let status_of_yojson = 
  fun (tree: t) path : status -> match tree with 
    | `String "failedStoppingGUISession" -> FailedStoppingGUISession
    | `String "failedStartingGUISession" -> FailedStartingGUISession
    | `String "failedInstanceCreation" -> FailedInstanceCreation
    | `String "settingUpInstance" -> SettingUpInstance
    | `String "stopping" -> Stopping
    | `String "stopped" -> Stopped
    | `String "starting" -> Starting
    | `String "started" -> Started
    | `String "notStarted" -> NotStarted
    | `String "startExpired" -> StartExpired
    | `String value -> raise (deserialize_unknown_enum_value_error path "Status" value)
    | _ -> raise (deserialize_wrong_type_error path "Status")

let ip_address_of_yojson = string_of_yojson

let static_ip_of_yojson = 
  fun tree path : static_ip ->
  let _list = assoc_of_yojson tree path in
  let _res : static_ip = {
    is_attached = option_of_yojson (value_for_key (boolean__of_yojson) "isAttached") _list path;
    attached_to = option_of_yojson (value_for_key (resource_name_of_yojson) "attachedTo") _list path;
    ip_address = option_of_yojson (value_for_key (ip_address_of_yojson) "ipAddress") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let static_ip_list_of_yojson = 
  fun tree path -> list_of_yojson static_ip_of_yojson tree path 

let start_relational_database_result_of_yojson = 
  fun tree path : start_relational_database_result ->
  let _list = assoc_of_yojson tree path in
  let _res : start_relational_database_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let start_relational_database_request_of_yojson = 
  fun tree path : start_relational_database_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_relational_database_request = {
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let start_instance_result_of_yojson = 
  fun tree path : start_instance_result ->
  let _list = assoc_of_yojson tree path in
  let _res : start_instance_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let start_instance_request_of_yojson = 
  fun tree path : start_instance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_instance_request = {
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let start_gui_session_result_of_yojson = 
  fun tree path : start_gui_session_result ->
  let _list = assoc_of_yojson tree path in
  let _res : start_gui_session_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let start_gui_session_request_of_yojson = 
  fun tree path : start_gui_session_request ->
  let _list = assoc_of_yojson tree path in
  let _res : start_gui_session_request = {
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let setup_instance_https_result_of_yojson = 
  fun tree path : setup_instance_https_result ->
  let _list = assoc_of_yojson tree path in
  let _res : setup_instance_https_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let email_address_of_yojson = string_of_yojson

let setup_instance_https_request_of_yojson = 
  fun tree path : setup_instance_https_request ->
  let _list = assoc_of_yojson tree path in
  let _res : setup_instance_https_request = {
    certificate_provider = value_for_key (certificate_provider_of_yojson) "certificateProvider" _list path;
    domain_names = value_for_key (setup_domain_name_list_of_yojson) "domainNames" _list path;
    email_address = value_for_key (email_address_of_yojson) "emailAddress" _list path;
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let setup_history_page_token_of_yojson = string_of_yojson

let set_resource_access_for_bucket_result_of_yojson = 
  fun tree path : set_resource_access_for_bucket_result ->
  let _list = assoc_of_yojson tree path in
  let _res : set_resource_access_for_bucket_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let resource_bucket_access_of_yojson = 
  fun (tree: t) path : resource_bucket_access -> match tree with 
    | `String "deny" -> Deny
    | `String "allow" -> Allow
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceBucketAccess" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceBucketAccess")

let set_resource_access_for_bucket_request_of_yojson = 
  fun tree path : set_resource_access_for_bucket_request ->
  let _list = assoc_of_yojson tree path in
  let _res : set_resource_access_for_bucket_request = {
    access = value_for_key (resource_bucket_access_of_yojson) "access" _list path;
    bucket_name = value_for_key (bucket_name_of_yojson) "bucketName" _list path;
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let set_ip_address_type_result_of_yojson = 
  fun tree path : set_ip_address_type_result ->
  let _list = assoc_of_yojson tree path in
  let _res : set_ip_address_type_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let ip_address_type_of_yojson = 
  fun (tree: t) path : ip_address_type -> match tree with 
    | `String "ipv6" -> IPV6
    | `String "ipv4" -> IPV4
    | `String "dualstack" -> DUALSTACK
    | `String value -> raise (deserialize_unknown_enum_value_error path "IpAddressType" value)
    | _ -> raise (deserialize_wrong_type_error path "IpAddressType")

let set_ip_address_type_request_of_yojson = 
  fun tree path : set_ip_address_type_request ->
  let _list = assoc_of_yojson tree path in
  let _res : set_ip_address_type_request = {
    accept_bundle_update = option_of_yojson (value_for_key (boolean__of_yojson) "acceptBundleUpdate") _list path;
    ip_address_type = value_for_key (ip_address_type_of_yojson) "ipAddressType" _list path;
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    resource_type = value_for_key (resource_type_of_yojson) "resourceType" _list path;
    
  }
  in _res

let sensitive_non_empty_string_of_yojson = string_of_yojson

let session_of_yojson = 
  fun tree path : session ->
  let _list = assoc_of_yojson tree path in
  let _res : session = {
    is_primary = option_of_yojson (value_for_key (boolean__of_yojson) "isPrimary") _list path;
    url = option_of_yojson (value_for_key (sensitive_non_empty_string_of_yojson) "url") _list path;
    name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "name") _list path;
    
  }
  in _res

let sessions_of_yojson = 
  fun tree path -> list_of_yojson session_of_yojson tree path 

let serial_number_of_yojson = string_of_yojson

let send_contact_method_verification_result_of_yojson = 
  fun tree path : send_contact_method_verification_result ->
  let _list = assoc_of_yojson tree path in
  let _res : send_contact_method_verification_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let contact_method_verification_protocol_of_yojson = 
  fun (tree: t) path : contact_method_verification_protocol -> match tree with 
    | `String "Email" -> Email
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContactMethodVerificationProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "ContactMethodVerificationProtocol")

let send_contact_method_verification_request_of_yojson = 
  fun tree path : send_contact_method_verification_request ->
  let _list = assoc_of_yojson tree path in
  let _res : send_contact_method_verification_request = {
    protocol = value_for_key (contact_method_verification_protocol_of_yojson) "protocol" _list path;
    
  }
  in _res

let revocation_reason_of_yojson = string_of_yojson

let pricing_unit_of_yojson = 
  fun (tree: t) path : pricing_unit -> match tree with 
    | `String "Queries" -> Queries
    | `String "Bundles" -> Bundles
    | `String "GB-Mo" -> GBMo
    | `String "Hrs" -> Hrs
    | `String "GB" -> GB
    | `String value -> raise (deserialize_unknown_enum_value_error path "PricingUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "PricingUnit")

let currency_of_yojson = 
  fun (tree: t) path : currency -> match tree with 
    | `String "USD" -> USD
    | `String value -> raise (deserialize_unknown_enum_value_error path "Currency" value)
    | _ -> raise (deserialize_wrong_type_error path "Currency")

let estimate_by_time_of_yojson = 
  fun tree path : estimate_by_time ->
  let _list = assoc_of_yojson tree path in
  let _res : estimate_by_time = {
    time_period = option_of_yojson (value_for_key (time_period_of_yojson) "timePeriod") _list path;
    currency = option_of_yojson (value_for_key (currency_of_yojson) "currency") _list path;
    unit_ = option_of_yojson (value_for_key (double_of_yojson) "unit") _list path;
    pricing_unit = option_of_yojson (value_for_key (pricing_unit_of_yojson) "pricingUnit") _list path;
    usage_cost = option_of_yojson (value_for_key (double_of_yojson) "usageCost") _list path;
    
  }
  in _res

let estimates_by_time_of_yojson = 
  fun tree path -> list_of_yojson estimate_by_time_of_yojson tree path 

let cost_estimate_of_yojson = 
  fun tree path : cost_estimate ->
  let _list = assoc_of_yojson tree path in
  let _res : cost_estimate = {
    results_by_time = option_of_yojson (value_for_key (estimates_by_time_of_yojson) "resultsByTime") _list path;
    usage_type = option_of_yojson (value_for_key (non_empty_string_of_yojson) "usageType") _list path;
    
  }
  in _res

let cost_estimates_of_yojson = 
  fun tree path -> list_of_yojson cost_estimate_of_yojson tree path 

let resource_budget_estimate_of_yojson = 
  fun tree path : resource_budget_estimate ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_budget_estimate = {
    end_time = option_of_yojson (value_for_key (iso_date_of_yojson) "endTime") _list path;
    start_time = option_of_yojson (value_for_key (iso_date_of_yojson) "startTime") _list path;
    cost_estimates = option_of_yojson (value_for_key (cost_estimates_of_yojson) "costEstimates") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "resourceName") _list path;
    
  }
  in _res

let resources_budget_estimate_of_yojson = 
  fun tree path -> list_of_yojson resource_budget_estimate_of_yojson tree path 

let resource_record_of_yojson = 
  fun tree path : resource_record ->
  let _list = assoc_of_yojson tree path in
  let _res : resource_record = {
    value = option_of_yojson (value_for_key (string__of_yojson) "value") _list path;
    type_ = option_of_yojson (value_for_key (string__of_yojson) "type") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "name") _list path;
    
  }
  in _res

let resource_name_list_of_yojson = 
  fun tree path -> list_of_yojson resource_name_of_yojson tree path 

let reset_distribution_cache_result_of_yojson = 
  fun tree path : reset_distribution_cache_result ->
  let _list = assoc_of_yojson tree path in
  let _res : reset_distribution_cache_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    create_time = option_of_yojson (value_for_key (iso_date_of_yojson) "createTime") _list path;
    status = option_of_yojson (value_for_key (string__of_yojson) "status") _list path;
    
  }
  in _res

let reset_distribution_cache_request_of_yojson = 
  fun tree path : reset_distribution_cache_request ->
  let _list = assoc_of_yojson tree path in
  let _res : reset_distribution_cache_request = {
    distribution_name = option_of_yojson (value_for_key (resource_name_of_yojson) "distributionName") _list path;
    
  }
  in _res

let request_failure_reason_of_yojson = string_of_yojson

let dns_record_creation_state_code_of_yojson = 
  fun (tree: t) path : dns_record_creation_state_code -> match tree with 
    | `String "FAILED" -> Failed
    | `String "STARTED" -> Started
    | `String "SUCCEEDED" -> Succeeded
    | `String value -> raise (deserialize_unknown_enum_value_error path "DnsRecordCreationStateCode" value)
    | _ -> raise (deserialize_wrong_type_error path "DnsRecordCreationStateCode")

let dns_record_creation_state_of_yojson = 
  fun tree path : dns_record_creation_state ->
  let _list = assoc_of_yojson tree path in
  let _res : dns_record_creation_state = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    code = option_of_yojson (value_for_key (dns_record_creation_state_code_of_yojson) "code") _list path;
    
  }
  in _res

let certificate_domain_validation_status_of_yojson = 
  fun (tree: t) path : certificate_domain_validation_status -> match tree with 
    | `String "SUCCESS" -> Success
    | `String "FAILED" -> Failed
    | `String "PENDING_VALIDATION" -> PendingValidation
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateDomainValidationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateDomainValidationStatus")

let domain_validation_record_of_yojson = 
  fun tree path : domain_validation_record ->
  let _list = assoc_of_yojson tree path in
  let _res : domain_validation_record = {
    validation_status = option_of_yojson (value_for_key (certificate_domain_validation_status_of_yojson) "validationStatus") _list path;
    dns_record_creation_state = option_of_yojson (value_for_key (dns_record_creation_state_of_yojson) "dnsRecordCreationState") _list path;
    resource_record = option_of_yojson (value_for_key (resource_record_of_yojson) "resourceRecord") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_of_yojson) "domainName") _list path;
    
  }
  in _res

let domain_validation_record_list_of_yojson = 
  fun tree path -> list_of_yojson domain_validation_record_of_yojson tree path 

let renewal_status_of_yojson = 
  fun (tree: t) path : renewal_status -> match tree with 
    | `String "Failed" -> Failed
    | `String "Success" -> Success
    | `String "PendingValidation" -> PendingValidation
    | `String "PendingAutoRenewal" -> PendingAutoRenewal
    | `String value -> raise (deserialize_unknown_enum_value_error path "RenewalStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RenewalStatus")

let renewal_status_reason_of_yojson = string_of_yojson

let renewal_summary_of_yojson = 
  fun tree path : renewal_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : renewal_summary = {
    updated_at = option_of_yojson (value_for_key (iso_date_of_yojson) "updatedAt") _list path;
    renewal_status_reason = option_of_yojson (value_for_key (renewal_status_reason_of_yojson) "renewalStatusReason") _list path;
    renewal_status = option_of_yojson (value_for_key (renewal_status_of_yojson) "renewalStatus") _list path;
    domain_validation_records = option_of_yojson (value_for_key (domain_validation_record_list_of_yojson) "domainValidationRecords") _list path;
    
  }
  in _res

let release_static_ip_result_of_yojson = 
  fun tree path : release_static_ip_result ->
  let _list = assoc_of_yojson tree path in
  let _res : release_static_ip_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let release_static_ip_request_of_yojson = 
  fun tree path : release_static_ip_request ->
  let _list = assoc_of_yojson tree path in
  let _res : release_static_ip_request = {
    static_ip_name = value_for_key (resource_name_of_yojson) "staticIpName" _list path;
    
  }
  in _res

let relational_database_snapshot_of_yojson = 
  fun tree path : relational_database_snapshot ->
  let _list = assoc_of_yojson tree path in
  let _res : relational_database_snapshot = {
    from_relational_database_blueprint_id = option_of_yojson (value_for_key (string__of_yojson) "fromRelationalDatabaseBlueprintId") _list path;
    from_relational_database_bundle_id = option_of_yojson (value_for_key (string__of_yojson) "fromRelationalDatabaseBundleId") _list path;
    from_relational_database_arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "fromRelationalDatabaseArn") _list path;
    from_relational_database_name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "fromRelationalDatabaseName") _list path;
    state = option_of_yojson (value_for_key (non_empty_string_of_yojson) "state") _list path;
    size_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "sizeInGb") _list path;
    engine_version = option_of_yojson (value_for_key (non_empty_string_of_yojson) "engineVersion") _list path;
    engine = option_of_yojson (value_for_key (non_empty_string_of_yojson) "engine") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let relational_database_snapshot_list_of_yojson = 
  fun tree path -> list_of_yojson relational_database_snapshot_of_yojson tree path 

let relational_database_password_version_of_yojson = 
  fun (tree: t) path : relational_database_password_version -> match tree with 
    | `String "PENDING" -> PENDING
    | `String "PREVIOUS" -> PREVIOUS
    | `String "CURRENT" -> CURRENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "RelationalDatabasePasswordVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "RelationalDatabasePasswordVersion")

let relational_database_metric_name_of_yojson = 
  fun (tree: t) path : relational_database_metric_name -> match tree with 
    | `String "NetworkTransmitThroughput" -> NetworkTransmitThroughput
    | `String "NetworkReceiveThroughput" -> NetworkReceiveThroughput
    | `String "FreeStorageSpace" -> FreeStorageSpace
    | `String "DiskQueueDepth" -> DiskQueueDepth
    | `String "DatabaseConnections" -> DatabaseConnections
    | `String "CPUUtilization" -> CPUUtilization
    | `String value -> raise (deserialize_unknown_enum_value_error path "RelationalDatabaseMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "RelationalDatabaseMetricName")

let relational_database_hardware_of_yojson = 
  fun tree path : relational_database_hardware ->
  let _list = assoc_of_yojson tree path in
  let _res : relational_database_hardware = {
    ram_size_in_gb = option_of_yojson (value_for_key (float__of_yojson) "ramSizeInGb") _list path;
    disk_size_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "diskSizeInGb") _list path;
    cpu_count = option_of_yojson (value_for_key (integer__of_yojson) "cpuCount") _list path;
    
  }
  in _res

let pending_modified_relational_database_values_of_yojson = 
  fun tree path : pending_modified_relational_database_values ->
  let _list = assoc_of_yojson tree path in
  let _res : pending_modified_relational_database_values = {
    backup_retention_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "backupRetentionEnabled") _list path;
    engine_version = option_of_yojson (value_for_key (string__of_yojson) "engineVersion") _list path;
    master_user_password = option_of_yojson (value_for_key (string__of_yojson) "masterUserPassword") _list path;
    
  }
  in _res

let relational_database_endpoint_of_yojson = 
  fun tree path : relational_database_endpoint ->
  let _list = assoc_of_yojson tree path in
  let _res : relational_database_endpoint = {
    address = option_of_yojson (value_for_key (non_empty_string_of_yojson) "address") _list path;
    port = option_of_yojson (value_for_key (integer__of_yojson) "port") _list path;
    
  }
  in _res

let pending_maintenance_action_of_yojson = 
  fun tree path : pending_maintenance_action ->
  let _list = assoc_of_yojson tree path in
  let _res : pending_maintenance_action = {
    current_apply_date = option_of_yojson (value_for_key (iso_date_of_yojson) "currentApplyDate") _list path;
    description = option_of_yojson (value_for_key (non_empty_string_of_yojson) "description") _list path;
    action = option_of_yojson (value_for_key (non_empty_string_of_yojson) "action") _list path;
    
  }
  in _res

let pending_maintenance_action_list_of_yojson = 
  fun tree path -> list_of_yojson pending_maintenance_action_of_yojson tree path 

let relational_database_of_yojson = 
  fun tree path : relational_database ->
  let _list = assoc_of_yojson tree path in
  let _res : relational_database = {
    ca_certificate_identifier = option_of_yojson (value_for_key (string__of_yojson) "caCertificateIdentifier") _list path;
    pending_maintenance_actions = option_of_yojson (value_for_key (pending_maintenance_action_list_of_yojson) "pendingMaintenanceActions") _list path;
    master_endpoint = option_of_yojson (value_for_key (relational_database_endpoint_of_yojson) "masterEndpoint") _list path;
    publicly_accessible = option_of_yojson (value_for_key (boolean__of_yojson) "publiclyAccessible") _list path;
    preferred_maintenance_window = option_of_yojson (value_for_key (non_empty_string_of_yojson) "preferredMaintenanceWindow") _list path;
    preferred_backup_window = option_of_yojson (value_for_key (non_empty_string_of_yojson) "preferredBackupWindow") _list path;
    parameter_apply_status = option_of_yojson (value_for_key (non_empty_string_of_yojson) "parameterApplyStatus") _list path;
    master_username = option_of_yojson (value_for_key (non_empty_string_of_yojson) "masterUsername") _list path;
    latest_restorable_time = option_of_yojson (value_for_key (iso_date_of_yojson) "latestRestorableTime") _list path;
    engine_version = option_of_yojson (value_for_key (non_empty_string_of_yojson) "engineVersion") _list path;
    engine = option_of_yojson (value_for_key (non_empty_string_of_yojson) "engine") _list path;
    pending_modified_values = option_of_yojson (value_for_key (pending_modified_relational_database_values_of_yojson) "pendingModifiedValues") _list path;
    backup_retention_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "backupRetentionEnabled") _list path;
    secondary_availability_zone = option_of_yojson (value_for_key (string__of_yojson) "secondaryAvailabilityZone") _list path;
    state = option_of_yojson (value_for_key (non_empty_string_of_yojson) "state") _list path;
    hardware = option_of_yojson (value_for_key (relational_database_hardware_of_yojson) "hardware") _list path;
    master_database_name = option_of_yojson (value_for_key (string__of_yojson) "masterDatabaseName") _list path;
    relational_database_bundle_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "relationalDatabaseBundleId") _list path;
    relational_database_blueprint_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "relationalDatabaseBlueprintId") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let relational_database_list_of_yojson = 
  fun tree path -> list_of_yojson relational_database_of_yojson tree path 

let relational_database_event_of_yojson = 
  fun tree path : relational_database_event ->
  let _list = assoc_of_yojson tree path in
  let _res : relational_database_event = {
    event_categories = option_of_yojson (value_for_key (string_list_of_yojson) "eventCategories") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    resource = option_of_yojson (value_for_key (resource_name_of_yojson) "resource") _list path;
    
  }
  in _res

let relational_database_event_list_of_yojson = 
  fun tree path -> list_of_yojson relational_database_event_of_yojson tree path 

let relational_database_engine_of_yojson = 
  fun (tree: t) path : relational_database_engine -> match tree with 
    | `String "mysql" -> MYSQL
    | `String value -> raise (deserialize_unknown_enum_value_error path "RelationalDatabaseEngine" value)
    | _ -> raise (deserialize_wrong_type_error path "RelationalDatabaseEngine")

let relational_database_bundle_of_yojson = 
  fun tree path : relational_database_bundle ->
  let _list = assoc_of_yojson tree path in
  let _res : relational_database_bundle = {
    is_active = option_of_yojson (value_for_key (boolean__of_yojson) "isActive") _list path;
    is_encrypted = option_of_yojson (value_for_key (boolean__of_yojson) "isEncrypted") _list path;
    cpu_count = option_of_yojson (value_for_key (integer__of_yojson) "cpuCount") _list path;
    transfer_per_month_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "transferPerMonthInGb") _list path;
    disk_size_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "diskSizeInGb") _list path;
    ram_size_in_gb = option_of_yojson (value_for_key (float__of_yojson) "ramSizeInGb") _list path;
    price = option_of_yojson (value_for_key (float__of_yojson) "price") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "name") _list path;
    bundle_id = option_of_yojson (value_for_key (string__of_yojson) "bundleId") _list path;
    
  }
  in _res

let relational_database_bundle_list_of_yojson = 
  fun tree path -> list_of_yojson relational_database_bundle_of_yojson tree path 

let relational_database_blueprint_of_yojson = 
  fun tree path : relational_database_blueprint ->
  let _list = assoc_of_yojson tree path in
  let _res : relational_database_blueprint = {
    is_engine_default = option_of_yojson (value_for_key (boolean__of_yojson) "isEngineDefault") _list path;
    engine_version_description = option_of_yojson (value_for_key (string__of_yojson) "engineVersionDescription") _list path;
    engine_description = option_of_yojson (value_for_key (string__of_yojson) "engineDescription") _list path;
    engine_version = option_of_yojson (value_for_key (string__of_yojson) "engineVersion") _list path;
    engine = option_of_yojson (value_for_key (relational_database_engine_of_yojson) "engine") _list path;
    blueprint_id = option_of_yojson (value_for_key (string__of_yojson) "blueprintId") _list path;
    
  }
  in _res

let relational_database_blueprint_list_of_yojson = 
  fun tree path -> list_of_yojson relational_database_blueprint_of_yojson tree path 

let name_servers_update_state_code_of_yojson = 
  fun (tree: t) path : name_servers_update_state_code -> match tree with 
    | `String "STARTED" -> Started
    | `String "FAILED" -> Failed
    | `String "PENDING" -> Pending
    | `String "SUCCEEDED" -> Succeeded
    | `String value -> raise (deserialize_unknown_enum_value_error path "NameServersUpdateStateCode" value)
    | _ -> raise (deserialize_wrong_type_error path "NameServersUpdateStateCode")

let name_servers_update_state_of_yojson = 
  fun tree path : name_servers_update_state ->
  let _list = assoc_of_yojson tree path in
  let _res : name_servers_update_state = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    code = option_of_yojson (value_for_key (name_servers_update_state_code_of_yojson) "code") _list path;
    
  }
  in _res

let r53_hosted_zone_deletion_state_code_of_yojson = 
  fun (tree: t) path : r53_hosted_zone_deletion_state_code -> match tree with 
    | `String "STARTED" -> Started
    | `String "FAILED" -> Failed
    | `String "PENDING" -> Pending
    | `String "SUCCEEDED" -> Succeeded
    | `String value -> raise (deserialize_unknown_enum_value_error path "R53HostedZoneDeletionStateCode" value)
    | _ -> raise (deserialize_wrong_type_error path "R53HostedZoneDeletionStateCode")

let r53_hosted_zone_deletion_state_of_yojson = 
  fun tree path : r53_hosted_zone_deletion_state ->
  let _list = assoc_of_yojson tree path in
  let _res : r53_hosted_zone_deletion_state = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    code = option_of_yojson (value_for_key (r53_hosted_zone_deletion_state_code_of_yojson) "code") _list path;
    
  }
  in _res

let registered_domain_delegation_info_of_yojson = 
  fun tree path : registered_domain_delegation_info ->
  let _list = assoc_of_yojson tree path in
  let _res : registered_domain_delegation_info = {
    r53_hosted_zone_deletion_state = option_of_yojson (value_for_key (r53_hosted_zone_deletion_state_of_yojson) "r53HostedZoneDeletionState") _list path;
    name_servers_update_state = option_of_yojson (value_for_key (name_servers_update_state_of_yojson) "nameServersUpdateState") _list path;
    
  }
  in _res

let container_image_of_yojson = 
  fun tree path : container_image ->
  let _list = assoc_of_yojson tree path in
  let _res : container_image = {
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    digest = option_of_yojson (value_for_key (string__of_yojson) "digest") _list path;
    image = option_of_yojson (value_for_key (string__of_yojson) "image") _list path;
    
  }
  in _res

let register_container_image_result_of_yojson = 
  fun tree path : register_container_image_result ->
  let _list = assoc_of_yojson tree path in
  let _res : register_container_image_result = {
    container_image = option_of_yojson (value_for_key (container_image_of_yojson) "containerImage") _list path;
    
  }
  in _res

let container_label_of_yojson = string_of_yojson

let register_container_image_request_of_yojson = 
  fun tree path : register_container_image_request ->
  let _list = assoc_of_yojson tree path in
  let _res : register_container_image_request = {
    digest = value_for_key (string__of_yojson) "digest" _list path;
    label = value_for_key (container_label_of_yojson) "label" _list path;
    service_name = value_for_key (container_service_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let availability_zone_of_yojson = 
  fun tree path : availability_zone ->
  let _list = assoc_of_yojson tree path in
  let _res : availability_zone = {
    state = option_of_yojson (value_for_key (non_empty_string_of_yojson) "state") _list path;
    zone_name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "zoneName") _list path;
    
  }
  in _res

let availability_zone_list_of_yojson = 
  fun tree path -> list_of_yojson availability_zone_of_yojson tree path 

let region_of_yojson = 
  fun tree path : region ->
  let _list = assoc_of_yojson tree path in
  let _res : region = {
    relational_database_availability_zones = option_of_yojson (value_for_key (availability_zone_list_of_yojson) "relationalDatabaseAvailabilityZones") _list path;
    availability_zones = option_of_yojson (value_for_key (availability_zone_list_of_yojson) "availabilityZones") _list path;
    name = option_of_yojson (value_for_key (region_name_of_yojson) "name") _list path;
    display_name = option_of_yojson (value_for_key (string__of_yojson) "displayName") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "description") _list path;
    continent_code = option_of_yojson (value_for_key (string__of_yojson) "continentCode") _list path;
    
  }
  in _res

let region_list_of_yojson = 
  fun tree path -> list_of_yojson region_of_yojson tree path 

let record_state_of_yojson = 
  fun (tree: t) path : record_state -> match tree with 
    | `String "Failed" -> Failed
    | `String "Succeeded" -> Succeeded
    | `String "Started" -> Started
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecordState" value)
    | _ -> raise (deserialize_wrong_type_error path "RecordState")

let reboot_relational_database_result_of_yojson = 
  fun tree path : reboot_relational_database_result ->
  let _list = assoc_of_yojson tree path in
  let _res : reboot_relational_database_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let reboot_relational_database_request_of_yojson = 
  fun tree path : reboot_relational_database_request ->
  let _list = assoc_of_yojson tree path in
  let _res : reboot_relational_database_request = {
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let reboot_instance_result_of_yojson = 
  fun tree path : reboot_instance_result ->
  let _list = assoc_of_yojson tree path in
  let _res : reboot_instance_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let reboot_instance_request_of_yojson = 
  fun tree path : reboot_instance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : reboot_instance_request = {
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let put_instance_public_ports_result_of_yojson = 
  fun tree path : put_instance_public_ports_result ->
  let _list = assoc_of_yojson tree path in
  let _res : put_instance_public_ports_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let port_of_yojson = int_of_yojson

let network_protocol_of_yojson = 
  fun (tree: t) path : network_protocol -> match tree with 
    | `String "icmpv6" -> ICMPV6
    | `String "icmp" -> ICMP
    | `String "udp" -> UDP
    | `String "all" -> ALL
    | `String "tcp" -> TCP
    | `String value -> raise (deserialize_unknown_enum_value_error path "NetworkProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkProtocol")

let port_info_of_yojson = 
  fun tree path : port_info ->
  let _list = assoc_of_yojson tree path in
  let _res : port_info = {
    cidr_list_aliases = option_of_yojson (value_for_key (string_list_of_yojson) "cidrListAliases") _list path;
    ipv6_cidrs = option_of_yojson (value_for_key (string_list_of_yojson) "ipv6Cidrs") _list path;
    cidrs = option_of_yojson (value_for_key (string_list_of_yojson) "cidrs") _list path;
    protocol = option_of_yojson (value_for_key (network_protocol_of_yojson) "protocol") _list path;
    to_port = option_of_yojson (value_for_key (port_of_yojson) "toPort") _list path;
    from_port = option_of_yojson (value_for_key (port_of_yojson) "fromPort") _list path;
    
  }
  in _res

let port_info_list_of_yojson = 
  fun tree path -> list_of_yojson port_info_of_yojson tree path 

let put_instance_public_ports_request_of_yojson = 
  fun tree path : put_instance_public_ports_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_instance_public_ports_request = {
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    port_infos = value_for_key (port_info_list_of_yojson) "portInfos" _list path;
    
  }
  in _res

let put_alarm_result_of_yojson = 
  fun tree path : put_alarm_result ->
  let _list = assoc_of_yojson tree path in
  let _res : put_alarm_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let metric_name_of_yojson = 
  fun (tree: t) path : metric_name -> match tree with 
    | `String "BurstCapacityPercentage" -> BurstCapacityPercentage
    | `String "BurstCapacityTime" -> BurstCapacityTime
    | `String "NetworkTransmitThroughput" -> NetworkTransmitThroughput
    | `String "NetworkReceiveThroughput" -> NetworkReceiveThroughput
    | `String "FreeStorageSpace" -> FreeStorageSpace
    | `String "DiskQueueDepth" -> DiskQueueDepth
    | `String "DatabaseConnections" -> DatabaseConnections
    | `String "RequestCount" -> RequestCount
    | `String "RejectedConnectionCount" -> RejectedConnectionCount
    | `String "InstanceResponseTime" -> InstanceResponseTime
    | `String "HTTPCode_Instance_5XX_Count" -> HTTPCode_Instance_5XX_Count
    | `String "HTTPCode_Instance_4XX_Count" -> HTTPCode_Instance_4XX_Count
    | `String "HTTPCode_Instance_3XX_Count" -> HTTPCode_Instance_3XX_Count
    | `String "HTTPCode_Instance_2XX_Count" -> HTTPCode_Instance_2XX_Count
    | `String "HTTPCode_LB_5XX_Count" -> HTTPCode_LB_5XX_Count
    | `String "HTTPCode_LB_4XX_Count" -> HTTPCode_LB_4XX_Count
    | `String "UnhealthyHostCount" -> UnhealthyHostCount
    | `String "HealthyHostCount" -> HealthyHostCount
    | `String "ClientTLSNegotiationErrorCount" -> ClientTLSNegotiationErrorCount
    | `String "StatusCheckFailed_System" -> StatusCheckFailed_System
    | `String "StatusCheckFailed_Instance" -> StatusCheckFailed_Instance
    | `String "StatusCheckFailed" -> StatusCheckFailed
    | `String "NetworkOut" -> NetworkOut
    | `String "NetworkIn" -> NetworkIn
    | `String "CPUUtilization" -> CPUUtilization
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricName")

let comparison_operator_of_yojson = 
  fun (tree: t) path : comparison_operator -> match tree with 
    | `String "LessThanOrEqualToThreshold" -> LessThanOrEqualToThreshold
    | `String "LessThanThreshold" -> LessThanThreshold
    | `String "GreaterThanThreshold" -> GreaterThanThreshold
    | `String "GreaterThanOrEqualToThreshold" -> GreaterThanOrEqualToThreshold
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")

let contact_protocol_of_yojson = 
  fun (tree: t) path : contact_protocol -> match tree with 
    | `String "SMS" -> SMS
    | `String "Email" -> Email
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContactProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "ContactProtocol")

let contact_protocols_list_of_yojson = 
  fun tree path -> list_of_yojson contact_protocol_of_yojson tree path 

let notification_trigger_list_of_yojson = 
  fun tree path -> list_of_yojson alarm_state_of_yojson tree path 

let put_alarm_request_of_yojson = 
  fun tree path : put_alarm_request ->
  let _list = assoc_of_yojson tree path in
  let _res : put_alarm_request = {
    notification_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "notificationEnabled") _list path;
    notification_triggers = option_of_yojson (value_for_key (notification_trigger_list_of_yojson) "notificationTriggers") _list path;
    contact_protocols = option_of_yojson (value_for_key (contact_protocols_list_of_yojson) "contactProtocols") _list path;
    treat_missing_data = option_of_yojson (value_for_key (treat_missing_data_of_yojson) "treatMissingData") _list path;
    datapoints_to_alarm = option_of_yojson (value_for_key (integer__of_yojson) "datapointsToAlarm") _list path;
    evaluation_periods = value_for_key (integer__of_yojson) "evaluationPeriods" _list path;
    threshold = value_for_key (double_of_yojson) "threshold" _list path;
    comparison_operator = value_for_key (comparison_operator_of_yojson) "comparisonOperator" _list path;
    monitored_resource_name = value_for_key (resource_name_of_yojson) "monitoredResourceName" _list path;
    metric_name = value_for_key (metric_name_of_yojson) "metricName" _list path;
    alarm_name = value_for_key (resource_name_of_yojson) "alarmName" _list path;
    
  }
  in _res

let port_state_of_yojson = 
  fun (tree: t) path : port_state -> match tree with 
    | `String "closed" -> Closed
    | `String "open" -> Open
    | `String value -> raise (deserialize_unknown_enum_value_error path "PortState" value)
    | _ -> raise (deserialize_wrong_type_error path "PortState")

let port_list_of_yojson = 
  fun tree path -> list_of_yojson port_of_yojson tree path 

let port_info_source_type_of_yojson = 
  fun (tree: t) path : port_info_source_type -> match tree with 
    | `String "CLOSED" -> Closed
    | `String "NONE" -> None
    | `String "INSTANCE" -> Instance
    | `String "DEFAULT" -> Default
    | `String value -> raise (deserialize_unknown_enum_value_error path "PortInfoSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "PortInfoSourceType")

let port_access_type_of_yojson = 
  fun (tree: t) path : port_access_type -> match tree with 
    | `String "Private" -> Private
    | `String "Public" -> Public
    | `String value -> raise (deserialize_unknown_enum_value_error path "PortAccessType" value)
    | _ -> raise (deserialize_wrong_type_error path "PortAccessType")

let peer_vpc_result_of_yojson = 
  fun tree path : peer_vpc_result ->
  let _list = assoc_of_yojson tree path in
  let _res : peer_vpc_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let peer_vpc_request_of_yojson = 
  fun tree path : peer_vpc_request ->
  let _list = assoc_of_yojson tree path in
  let _res : peer_vpc_request = ()
  in _res

let password_data_of_yojson = 
  fun tree path : password_data ->
  let _list = assoc_of_yojson tree path in
  let _res : password_data = {
    key_pair_name = option_of_yojson (value_for_key (resource_name_of_yojson) "keyPairName") _list path;
    ciphertext = option_of_yojson (value_for_key (string__of_yojson) "ciphertext") _list path;
    
  }
  in _res

let origin_of_yojson = 
  fun tree path : origin ->
  let _list = assoc_of_yojson tree path in
  let _res : origin = {
    response_timeout = option_of_yojson (value_for_key (integer__of_yojson) "responseTimeout") _list path;
    protocol_policy = option_of_yojson (value_for_key (origin_protocol_policy_enum_of_yojson) "protocolPolicy") _list path;
    region_name = option_of_yojson (value_for_key (region_name_of_yojson) "regionName") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let open_instance_public_ports_result_of_yojson = 
  fun tree path : open_instance_public_ports_result ->
  let _list = assoc_of_yojson tree path in
  let _res : open_instance_public_ports_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let open_instance_public_ports_request_of_yojson = 
  fun tree path : open_instance_public_ports_request ->
  let _list = assoc_of_yojson tree path in
  let _res : open_instance_public_ports_request = {
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    port_info = value_for_key (port_info_of_yojson) "portInfo" _list path;
    
  }
  in _res

let monthly_transfer_of_yojson = 
  fun tree path : monthly_transfer ->
  let _list = assoc_of_yojson tree path in
  let _res : monthly_transfer = {
    gb_per_month_allocated = option_of_yojson (value_for_key (integer__of_yojson) "gbPerMonthAllocated") _list path;
    
  }
  in _res

let monitored_resource_info_of_yojson = 
  fun tree path : monitored_resource_info ->
  let _list = assoc_of_yojson tree path in
  let _res : monitored_resource_info = {
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    arn = option_of_yojson (value_for_key (resource_arn_of_yojson) "arn") _list path;
    
  }
  in _res

let metric_unit_of_yojson = 
  fun (tree: t) path : metric_unit -> match tree with 
    | `String "None" -> None
    | `String "Count/Second" -> CountSecond
    | `String "Terabits/Second" -> TerabitsSecond
    | `String "Gigabits/Second" -> GigabitsSecond
    | `String "Megabits/Second" -> MegabitsSecond
    | `String "Kilobits/Second" -> KilobitsSecond
    | `String "Bits/Second" -> BitsSecond
    | `String "Terabytes/Second" -> TerabytesSecond
    | `String "Gigabytes/Second" -> GigabytesSecond
    | `String "Megabytes/Second" -> MegabytesSecond
    | `String "Kilobytes/Second" -> KilobytesSecond
    | `String "Bytes/Second" -> BytesSecond
    | `String "Count" -> Count
    | `String "Percent" -> Percent
    | `String "Terabits" -> Terabits
    | `String "Gigabits" -> Gigabits
    | `String "Megabits" -> Megabits
    | `String "Kilobits" -> Kilobits
    | `String "Bits" -> Bits
    | `String "Terabytes" -> Terabytes
    | `String "Gigabytes" -> Gigabytes
    | `String "Megabytes" -> Megabytes
    | `String "Kilobytes" -> Kilobytes
    | `String "Bytes" -> Bytes
    | `String "Milliseconds" -> Milliseconds
    | `String "Microseconds" -> Microseconds
    | `String "Seconds" -> Seconds
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricUnit")

let metric_statistic_of_yojson = 
  fun (tree: t) path : metric_statistic -> match tree with 
    | `String "SampleCount" -> SampleCount
    | `String "Average" -> Average
    | `String "Sum" -> Sum
    | `String "Maximum" -> Maximum
    | `String "Minimum" -> Minimum
    | `String value -> raise (deserialize_unknown_enum_value_error path "MetricStatistic" value)
    | _ -> raise (deserialize_wrong_type_error path "MetricStatistic")

let metric_statistic_list_of_yojson = 
  fun tree path -> list_of_yojson metric_statistic_of_yojson tree path 

let metric_period_of_yojson = int_of_yojson

let metric_datapoint_of_yojson = 
  fun tree path : metric_datapoint ->
  let _list = assoc_of_yojson tree path in
  let _res : metric_datapoint = {
    unit_ = option_of_yojson (value_for_key (metric_unit_of_yojson) "unit") _list path;
    timestamp_ = option_of_yojson (value_for_key (timestamp__of_yojson) "timestamp") _list path;
    sum = option_of_yojson (value_for_key (double_of_yojson) "sum") _list path;
    sample_count = option_of_yojson (value_for_key (double_of_yojson) "sampleCount") _list path;
    minimum = option_of_yojson (value_for_key (double_of_yojson) "minimum") _list path;
    maximum = option_of_yojson (value_for_key (double_of_yojson) "maximum") _list path;
    average = option_of_yojson (value_for_key (double_of_yojson) "average") _list path;
    
  }
  in _res

let metric_datapoint_list_of_yojson = 
  fun tree path -> list_of_yojson metric_datapoint_of_yojson tree path 

let log_event_of_yojson = 
  fun tree path : log_event ->
  let _list = assoc_of_yojson tree path in
  let _res : log_event = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    
  }
  in _res

let log_event_list_of_yojson = 
  fun tree path -> list_of_yojson log_event_of_yojson tree path 

let load_balancer_tls_policy_of_yojson = 
  fun tree path : load_balancer_tls_policy ->
  let _list = assoc_of_yojson tree path in
  let _res : load_balancer_tls_policy = {
    ciphers = option_of_yojson (value_for_key (string_list_of_yojson) "ciphers") _list path;
    protocols = option_of_yojson (value_for_key (string_list_of_yojson) "protocols") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "description") _list path;
    is_default = option_of_yojson (value_for_key (boolean__of_yojson) "isDefault") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let load_balancer_tls_policy_list_of_yojson = 
  fun tree path -> list_of_yojson load_balancer_tls_policy_of_yojson tree path 

let load_balancer_tls_certificate_summary_of_yojson = 
  fun tree path : load_balancer_tls_certificate_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : load_balancer_tls_certificate_summary = {
    is_attached = option_of_yojson (value_for_key (boolean__of_yojson) "isAttached") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let load_balancer_tls_certificate_summary_list_of_yojson = 
  fun tree path -> list_of_yojson load_balancer_tls_certificate_summary_of_yojson tree path 

let load_balancer_tls_certificate_status_of_yojson = 
  fun (tree: t) path : load_balancer_tls_certificate_status -> match tree with 
    | `String "UNKNOWN" -> Unknown
    | `String "FAILED" -> Failed
    | `String "REVOKED" -> Revoked
    | `String "VALIDATION_TIMED_OUT" -> ValidationTimedOut
    | `String "EXPIRED" -> Expired
    | `String "INACTIVE" -> Inactive
    | `String "ISSUED" -> Issued
    | `String "PENDING_VALIDATION" -> PendingValidation
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateStatus")

let load_balancer_tls_certificate_revocation_reason_of_yojson = 
  fun (tree: t) path : load_balancer_tls_certificate_revocation_reason -> match tree with 
    | `String "A_A_COMPROMISE" -> AACompromise
    | `String "PRIVILEGE_WITHDRAWN" -> PrivilegeWithdrawn
    | `String "REMOVE_FROM_CRL" -> RemoveFromCrl
    | `String "CERTIFICATE_HOLD" -> CertificateHold
    | `String "CESSATION_OF_OPERATION" -> CessationOfOperation
    | `String "SUPERCEDED" -> Superceded
    | `String "AFFILIATION_CHANGED" -> AffiliationChanged
    | `String "CA_COMPROMISE" -> CaCompromise
    | `String "KEY_COMPROMISE" -> KeyCompromise
    | `String "UNSPECIFIED" -> Unspecified
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateRevocationReason" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateRevocationReason")

let load_balancer_tls_certificate_renewal_status_of_yojson = 
  fun (tree: t) path : load_balancer_tls_certificate_renewal_status -> match tree with 
    | `String "FAILED" -> Failed
    | `String "SUCCESS" -> Success
    | `String "PENDING_VALIDATION" -> PendingValidation
    | `String "PENDING_AUTO_RENEWAL" -> PendingAutoRenewal
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateRenewalStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateRenewalStatus")

let load_balancer_tls_certificate_domain_status_of_yojson = 
  fun (tree: t) path : load_balancer_tls_certificate_domain_status -> match tree with 
    | `String "SUCCESS" -> Success
    | `String "FAILED" -> Failed
    | `String "PENDING_VALIDATION" -> PendingValidation
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateDomainStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateDomainStatus")

let load_balancer_tls_certificate_domain_validation_option_of_yojson = 
  fun tree path : load_balancer_tls_certificate_domain_validation_option ->
  let _list = assoc_of_yojson tree path in
  let _res : load_balancer_tls_certificate_domain_validation_option = {
    validation_status = option_of_yojson (value_for_key (load_balancer_tls_certificate_domain_status_of_yojson) "validationStatus") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_of_yojson) "domainName") _list path;
    
  }
  in _res

let load_balancer_tls_certificate_domain_validation_option_list_of_yojson = 
  fun tree path -> list_of_yojson load_balancer_tls_certificate_domain_validation_option_of_yojson tree path 

let load_balancer_tls_certificate_renewal_summary_of_yojson = 
  fun tree path : load_balancer_tls_certificate_renewal_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : load_balancer_tls_certificate_renewal_summary = {
    domain_validation_options = option_of_yojson (value_for_key (load_balancer_tls_certificate_domain_validation_option_list_of_yojson) "domainValidationOptions") _list path;
    renewal_status = option_of_yojson (value_for_key (load_balancer_tls_certificate_renewal_status_of_yojson) "renewalStatus") _list path;
    
  }
  in _res

let load_balancer_tls_certificate_dns_record_creation_state_code_of_yojson = 
  fun (tree: t) path : load_balancer_tls_certificate_dns_record_creation_state_code -> match tree with 
    | `String "FAILED" -> Failed
    | `String "STARTED" -> Started
    | `String "SUCCEEDED" -> Succeeded
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateDnsRecordCreationStateCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateDnsRecordCreationStateCode")

let load_balancer_tls_certificate_dns_record_creation_state_of_yojson = 
  fun tree path : load_balancer_tls_certificate_dns_record_creation_state ->
  let _list = assoc_of_yojson tree path in
  let _res : load_balancer_tls_certificate_dns_record_creation_state = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    code = option_of_yojson (value_for_key (load_balancer_tls_certificate_dns_record_creation_state_code_of_yojson) "code") _list path;
    
  }
  in _res

let load_balancer_tls_certificate_domain_validation_record_of_yojson = 
  fun tree path : load_balancer_tls_certificate_domain_validation_record ->
  let _list = assoc_of_yojson tree path in
  let _res : load_balancer_tls_certificate_domain_validation_record = {
    dns_record_creation_state = option_of_yojson (value_for_key (load_balancer_tls_certificate_dns_record_creation_state_of_yojson) "dnsRecordCreationState") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_of_yojson) "domainName") _list path;
    validation_status = option_of_yojson (value_for_key (load_balancer_tls_certificate_domain_status_of_yojson) "validationStatus") _list path;
    value = option_of_yojson (value_for_key (non_empty_string_of_yojson) "value") _list path;
    type_ = option_of_yojson (value_for_key (non_empty_string_of_yojson) "type") _list path;
    name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "name") _list path;
    
  }
  in _res

let load_balancer_tls_certificate_domain_validation_record_list_of_yojson = 
  fun tree path -> list_of_yojson load_balancer_tls_certificate_domain_validation_record_of_yojson tree path 

let load_balancer_tls_certificate_failure_reason_of_yojson = 
  fun (tree: t) path : load_balancer_tls_certificate_failure_reason -> match tree with 
    | `String "OTHER" -> Other
    | `String "INVALID_PUBLIC_DOMAIN" -> InvalidPublicDomain
    | `String "DOMAIN_NOT_ALLOWED" -> DomainNotAllowed
    | `String "ADDITIONAL_VERIFICATION_REQUIRED" -> AdditionalVerificationRequired
    | `String "NO_AVAILABLE_CONTACTS" -> NoAvailableContacts
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerTlsCertificateFailureReason" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerTlsCertificateFailureReason")

let load_balancer_tls_certificate_of_yojson = 
  fun tree path : load_balancer_tls_certificate ->
  let _list = assoc_of_yojson tree path in
  let _res : load_balancer_tls_certificate = {
    subject_alternative_names = option_of_yojson (value_for_key (string_list_of_yojson) "subjectAlternativeNames") _list path;
    subject = option_of_yojson (value_for_key (non_empty_string_of_yojson) "subject") _list path;
    signature_algorithm = option_of_yojson (value_for_key (non_empty_string_of_yojson) "signatureAlgorithm") _list path;
    serial = option_of_yojson (value_for_key (non_empty_string_of_yojson) "serial") _list path;
    revoked_at = option_of_yojson (value_for_key (iso_date_of_yojson) "revokedAt") _list path;
    revocation_reason = option_of_yojson (value_for_key (load_balancer_tls_certificate_revocation_reason_of_yojson) "revocationReason") _list path;
    renewal_summary = option_of_yojson (value_for_key (load_balancer_tls_certificate_renewal_summary_of_yojson) "renewalSummary") _list path;
    not_before = option_of_yojson (value_for_key (iso_date_of_yojson) "notBefore") _list path;
    not_after = option_of_yojson (value_for_key (iso_date_of_yojson) "notAfter") _list path;
    key_algorithm = option_of_yojson (value_for_key (non_empty_string_of_yojson) "keyAlgorithm") _list path;
    issuer = option_of_yojson (value_for_key (non_empty_string_of_yojson) "issuer") _list path;
    issued_at = option_of_yojson (value_for_key (iso_date_of_yojson) "issuedAt") _list path;
    failure_reason = option_of_yojson (value_for_key (load_balancer_tls_certificate_failure_reason_of_yojson) "failureReason") _list path;
    domain_validation_records = option_of_yojson (value_for_key (load_balancer_tls_certificate_domain_validation_record_list_of_yojson) "domainValidationRecords") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_of_yojson) "domainName") _list path;
    status = option_of_yojson (value_for_key (load_balancer_tls_certificate_status_of_yojson) "status") _list path;
    is_attached = option_of_yojson (value_for_key (boolean__of_yojson) "isAttached") _list path;
    load_balancer_name = option_of_yojson (value_for_key (resource_name_of_yojson) "loadBalancerName") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let load_balancer_tls_certificate_list_of_yojson = 
  fun tree path -> list_of_yojson load_balancer_tls_certificate_of_yojson tree path 

let load_balancer_state_of_yojson = 
  fun (tree: t) path : load_balancer_state -> match tree with 
    | `String "unknown" -> Unknown
    | `String "failed" -> Failed
    | `String "active_impaired" -> ActiveImpaired
    | `String "provisioning" -> Provisioning
    | `String "active" -> Active
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerState" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerState")

let load_balancer_protocol_of_yojson = 
  fun (tree: t) path : load_balancer_protocol -> match tree with 
    | `String "HTTP" -> HTTP
    | `String "HTTP_HTTPS" -> HTTP_HTTPS
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerProtocol")

let load_balancer_metric_name_of_yojson = 
  fun (tree: t) path : load_balancer_metric_name -> match tree with 
    | `String "RequestCount" -> RequestCount
    | `String "RejectedConnectionCount" -> RejectedConnectionCount
    | `String "InstanceResponseTime" -> InstanceResponseTime
    | `String "HTTPCode_Instance_5XX_Count" -> HTTPCode_Instance_5XX_Count
    | `String "HTTPCode_Instance_4XX_Count" -> HTTPCode_Instance_4XX_Count
    | `String "HTTPCode_Instance_3XX_Count" -> HTTPCode_Instance_3XX_Count
    | `String "HTTPCode_Instance_2XX_Count" -> HTTPCode_Instance_2XX_Count
    | `String "HTTPCode_LB_5XX_Count" -> HTTPCode_LB_5XX_Count
    | `String "HTTPCode_LB_4XX_Count" -> HTTPCode_LB_4XX_Count
    | `String "UnhealthyHostCount" -> UnhealthyHostCount
    | `String "HealthyHostCount" -> HealthyHostCount
    | `String "ClientTLSNegotiationErrorCount" -> ClientTLSNegotiationErrorCount
    | `String value -> raise (deserialize_unknown_enum_value_error path "LoadBalancerMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "LoadBalancerMetricName")

let instance_health_state_of_yojson = 
  fun (tree: t) path : instance_health_state -> match tree with 
    | `String "unavailable" -> Unavailable
    | `String "draining" -> Draining
    | `String "unused" -> Unused
    | `String "unhealthy" -> Unhealthy
    | `String "healthy" -> Healthy
    | `String "initial" -> Initial
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceHealthState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceHealthState")

let instance_health_reason_of_yojson = 
  fun (tree: t) path : instance_health_reason -> match tree with 
    | `String "Instance.IpUnusable" -> InstanceIpUnusable
    | `String "Instance.InvalidState" -> InstanceInvalidState
    | `String "Instance.DeregistrationInProgress" -> InstanceDeregistrationInProgress
    | `String "Instance.NotInUse" -> InstanceNotInUse
    | `String "Instance.NotRegistered" -> InstanceNotRegistered
    | `String "Instance.FailedHealthChecks" -> InstanceFailedHealthChecks
    | `String "Instance.Timeout" -> InstanceTimeout
    | `String "Instance.ResponseCodeMismatch" -> InstanceResponseCodeMismatch
    | `String "Lb.InternalError" -> LbInternalError
    | `String "Lb.InitialHealthChecking" -> LbInitialHealthChecking
    | `String "Lb.RegistrationInProgress" -> LbRegistrationInProgress
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceHealthReason" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceHealthReason")

let instance_health_summary_of_yojson = 
  fun tree path : instance_health_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_health_summary = {
    instance_health_reason = option_of_yojson (value_for_key (instance_health_reason_of_yojson) "instanceHealthReason") _list path;
    instance_health = option_of_yojson (value_for_key (instance_health_state_of_yojson) "instanceHealth") _list path;
    instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "instanceName") _list path;
    
  }
  in _res

let instance_health_summary_list_of_yojson = 
  fun tree path -> list_of_yojson instance_health_summary_of_yojson tree path 

let load_balancer_configuration_options_of_yojson = 
  fun tree path -> map_of_yojson string__of_yojson tree path

let load_balancer_of_yojson = 
  fun tree path : load_balancer ->
  let _list = assoc_of_yojson tree path in
  let _res : load_balancer = {
    tls_policy_name = option_of_yojson (value_for_key (resource_name_of_yojson) "tlsPolicyName") _list path;
    https_redirection_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "httpsRedirectionEnabled") _list path;
    ip_address_type = option_of_yojson (value_for_key (ip_address_type_of_yojson) "ipAddressType") _list path;
    configuration_options = option_of_yojson (value_for_key (load_balancer_configuration_options_of_yojson) "configurationOptions") _list path;
    tls_certificate_summaries = option_of_yojson (value_for_key (load_balancer_tls_certificate_summary_list_of_yojson) "tlsCertificateSummaries") _list path;
    instance_health_summary = option_of_yojson (value_for_key (instance_health_summary_list_of_yojson) "instanceHealthSummary") _list path;
    instance_port = option_of_yojson (value_for_key (integer__of_yojson) "instancePort") _list path;
    health_check_path = option_of_yojson (value_for_key (non_empty_string_of_yojson) "healthCheckPath") _list path;
    public_ports = option_of_yojson (value_for_key (port_list_of_yojson) "publicPorts") _list path;
    protocol = option_of_yojson (value_for_key (load_balancer_protocol_of_yojson) "protocol") _list path;
    state = option_of_yojson (value_for_key (load_balancer_state_of_yojson) "state") _list path;
    dns_name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "dnsName") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let load_balancer_list_of_yojson = 
  fun tree path -> list_of_yojson load_balancer_of_yojson tree path 

let is_vpc_peered_result_of_yojson = 
  fun tree path : is_vpc_peered_result ->
  let _list = assoc_of_yojson tree path in
  let _res : is_vpc_peered_result = {
    is_peered = option_of_yojson (value_for_key (boolean__of_yojson) "isPeered") _list path;
    
  }
  in _res

let is_vpc_peered_request_of_yojson = 
  fun tree path : is_vpc_peered_request ->
  let _list = assoc_of_yojson tree path in
  let _res : is_vpc_peered_request = ()
  in _res

let import_key_pair_result_of_yojson = 
  fun tree path : import_key_pair_result ->
  let _list = assoc_of_yojson tree path in
  let _res : import_key_pair_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let base64_of_yojson = string_of_yojson

let import_key_pair_request_of_yojson = 
  fun tree path : import_key_pair_request ->
  let _list = assoc_of_yojson tree path in
  let _res : import_key_pair_request = {
    public_key_base64 = value_for_key (base64_of_yojson) "publicKeyBase64" _list path;
    key_pair_name = value_for_key (resource_name_of_yojson) "keyPairName" _list path;
    
  }
  in _res

let get_static_ips_result_of_yojson = 
  fun tree path : get_static_ips_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_static_ips_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    static_ips = option_of_yojson (value_for_key (static_ip_list_of_yojson) "staticIps") _list path;
    
  }
  in _res

let get_static_ips_request_of_yojson = 
  fun tree path : get_static_ips_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_static_ips_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_static_ip_result_of_yojson = 
  fun tree path : get_static_ip_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_static_ip_result = {
    static_ip = option_of_yojson (value_for_key (static_ip_of_yojson) "staticIp") _list path;
    
  }
  in _res

let get_static_ip_request_of_yojson = 
  fun tree path : get_static_ip_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_static_ip_request = {
    static_ip_name = value_for_key (resource_name_of_yojson) "staticIpName" _list path;
    
  }
  in _res

let get_setup_history_result_of_yojson = 
  fun tree path : get_setup_history_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_setup_history_result = {
    next_page_token = option_of_yojson (value_for_key (setup_history_page_token_of_yojson) "nextPageToken") _list path;
    setup_history = option_of_yojson (value_for_key (setup_history_list_of_yojson) "setupHistory") _list path;
    
  }
  in _res

let get_setup_history_request_of_yojson = 
  fun tree path : get_setup_history_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_setup_history_request = {
    page_token = option_of_yojson (value_for_key (setup_history_page_token_of_yojson) "pageToken") _list path;
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let get_relational_database_snapshots_result_of_yojson = 
  fun tree path : get_relational_database_snapshots_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_snapshots_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    relational_database_snapshots = option_of_yojson (value_for_key (relational_database_snapshot_list_of_yojson) "relationalDatabaseSnapshots") _list path;
    
  }
  in _res

let get_relational_database_snapshots_request_of_yojson = 
  fun tree path : get_relational_database_snapshots_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_snapshots_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_relational_database_snapshot_result_of_yojson = 
  fun tree path : get_relational_database_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_snapshot_result = {
    relational_database_snapshot = option_of_yojson (value_for_key (relational_database_snapshot_of_yojson) "relationalDatabaseSnapshot") _list path;
    
  }
  in _res

let get_relational_database_snapshot_request_of_yojson = 
  fun tree path : get_relational_database_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_snapshot_request = {
    relational_database_snapshot_name = value_for_key (resource_name_of_yojson) "relationalDatabaseSnapshotName" _list path;
    
  }
  in _res

let get_relational_databases_result_of_yojson = 
  fun tree path : get_relational_databases_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_databases_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    relational_databases = option_of_yojson (value_for_key (relational_database_list_of_yojson) "relationalDatabases") _list path;
    
  }
  in _res

let get_relational_databases_request_of_yojson = 
  fun tree path : get_relational_databases_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_databases_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_relational_database_parameters_result_of_yojson = 
  fun tree path : get_relational_database_parameters_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_parameters_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    parameters = option_of_yojson (value_for_key (relational_database_parameter_list_of_yojson) "parameters") _list path;
    
  }
  in _res

let get_relational_database_parameters_request_of_yojson = 
  fun tree path : get_relational_database_parameters_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_parameters_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let get_relational_database_metric_data_result_of_yojson = 
  fun tree path : get_relational_database_metric_data_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_metric_data_result = {
    metric_data = option_of_yojson (value_for_key (metric_datapoint_list_of_yojson) "metricData") _list path;
    metric_name = option_of_yojson (value_for_key (relational_database_metric_name_of_yojson) "metricName") _list path;
    
  }
  in _res

let get_relational_database_metric_data_request_of_yojson = 
  fun tree path : get_relational_database_metric_data_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_metric_data_request = {
    statistics = value_for_key (metric_statistic_list_of_yojson) "statistics" _list path;
    unit_ = value_for_key (metric_unit_of_yojson) "unit" _list path;
    end_time = value_for_key (iso_date_of_yojson) "endTime" _list path;
    start_time = value_for_key (iso_date_of_yojson) "startTime" _list path;
    period = value_for_key (metric_period_of_yojson) "period" _list path;
    metric_name = value_for_key (relational_database_metric_name_of_yojson) "metricName" _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let get_relational_database_master_user_password_result_of_yojson = 
  fun tree path : get_relational_database_master_user_password_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_master_user_password_result = {
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    master_user_password = option_of_yojson (value_for_key (sensitive_string_of_yojson) "masterUserPassword") _list path;
    
  }
  in _res

let get_relational_database_master_user_password_request_of_yojson = 
  fun tree path : get_relational_database_master_user_password_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_master_user_password_request = {
    password_version = option_of_yojson (value_for_key (relational_database_password_version_of_yojson) "passwordVersion") _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let get_relational_database_log_streams_result_of_yojson = 
  fun tree path : get_relational_database_log_streams_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_log_streams_result = {
    log_streams = option_of_yojson (value_for_key (string_list_of_yojson) "logStreams") _list path;
    
  }
  in _res

let get_relational_database_log_streams_request_of_yojson = 
  fun tree path : get_relational_database_log_streams_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_log_streams_request = {
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let get_relational_database_log_events_result_of_yojson = 
  fun tree path : get_relational_database_log_events_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_log_events_result = {
    next_forward_token = option_of_yojson (value_for_key (string__of_yojson) "nextForwardToken") _list path;
    next_backward_token = option_of_yojson (value_for_key (string__of_yojson) "nextBackwardToken") _list path;
    resource_log_events = option_of_yojson (value_for_key (log_event_list_of_yojson) "resourceLogEvents") _list path;
    
  }
  in _res

let get_relational_database_log_events_request_of_yojson = 
  fun tree path : get_relational_database_log_events_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_log_events_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    start_from_head = option_of_yojson (value_for_key (boolean__of_yojson) "startFromHead") _list path;
    end_time = option_of_yojson (value_for_key (iso_date_of_yojson) "endTime") _list path;
    start_time = option_of_yojson (value_for_key (iso_date_of_yojson) "startTime") _list path;
    log_stream_name = value_for_key (string__of_yojson) "logStreamName" _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let get_relational_database_events_result_of_yojson = 
  fun tree path : get_relational_database_events_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_events_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    relational_database_events = option_of_yojson (value_for_key (relational_database_event_list_of_yojson) "relationalDatabaseEvents") _list path;
    
  }
  in _res

let get_relational_database_events_request_of_yojson = 
  fun tree path : get_relational_database_events_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_events_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    duration_in_minutes = option_of_yojson (value_for_key (integer__of_yojson) "durationInMinutes") _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let get_relational_database_bundles_result_of_yojson = 
  fun tree path : get_relational_database_bundles_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_bundles_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    bundles = option_of_yojson (value_for_key (relational_database_bundle_list_of_yojson) "bundles") _list path;
    
  }
  in _res

let get_relational_database_bundles_request_of_yojson = 
  fun tree path : get_relational_database_bundles_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_bundles_request = {
    include_inactive = option_of_yojson (value_for_key (boolean__of_yojson) "includeInactive") _list path;
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_relational_database_blueprints_result_of_yojson = 
  fun tree path : get_relational_database_blueprints_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_blueprints_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    blueprints = option_of_yojson (value_for_key (relational_database_blueprint_list_of_yojson) "blueprints") _list path;
    
  }
  in _res

let get_relational_database_blueprints_request_of_yojson = 
  fun tree path : get_relational_database_blueprints_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_blueprints_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_relational_database_result_of_yojson = 
  fun tree path : get_relational_database_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_result = {
    relational_database = option_of_yojson (value_for_key (relational_database_of_yojson) "relationalDatabase") _list path;
    
  }
  in _res

let get_relational_database_request_of_yojson = 
  fun tree path : get_relational_database_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_relational_database_request = {
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let get_regions_result_of_yojson = 
  fun tree path : get_regions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_regions_result = {
    regions = option_of_yojson (value_for_key (region_list_of_yojson) "regions") _list path;
    
  }
  in _res

let get_regions_request_of_yojson = 
  fun tree path : get_regions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_regions_request = {
    include_relational_database_availability_zones = option_of_yojson (value_for_key (boolean__of_yojson) "includeRelationalDatabaseAvailabilityZones") _list path;
    include_availability_zones = option_of_yojson (value_for_key (boolean__of_yojson) "includeAvailabilityZones") _list path;
    
  }
  in _res

let get_operations_for_resource_result_of_yojson = 
  fun tree path : get_operations_for_resource_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_operations_for_resource_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    next_page_count = option_of_yojson (value_for_key (string__of_yojson) "nextPageCount") _list path;
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let get_operations_for_resource_request_of_yojson = 
  fun tree path : get_operations_for_resource_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_operations_for_resource_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let get_operations_result_of_yojson = 
  fun tree path : get_operations_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_operations_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let get_operations_request_of_yojson = 
  fun tree path : get_operations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_operations_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_operation_result_of_yojson = 
  fun tree path : get_operation_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_operation_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let get_operation_request_of_yojson = 
  fun tree path : get_operation_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_operation_request = {
    operation_id = value_for_key (non_empty_string_of_yojson) "operationId" _list path;
    
  }
  in _res

let get_load_balancer_tls_policies_result_of_yojson = 
  fun tree path : get_load_balancer_tls_policies_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_load_balancer_tls_policies_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    tls_policies = option_of_yojson (value_for_key (load_balancer_tls_policy_list_of_yojson) "tlsPolicies") _list path;
    
  }
  in _res

let get_load_balancer_tls_policies_request_of_yojson = 
  fun tree path : get_load_balancer_tls_policies_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_load_balancer_tls_policies_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_load_balancer_tls_certificates_result_of_yojson = 
  fun tree path : get_load_balancer_tls_certificates_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_load_balancer_tls_certificates_result = {
    tls_certificates = option_of_yojson (value_for_key (load_balancer_tls_certificate_list_of_yojson) "tlsCertificates") _list path;
    
  }
  in _res

let get_load_balancer_tls_certificates_request_of_yojson = 
  fun tree path : get_load_balancer_tls_certificates_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_load_balancer_tls_certificates_request = {
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let get_load_balancers_result_of_yojson = 
  fun tree path : get_load_balancers_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_load_balancers_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    load_balancers = option_of_yojson (value_for_key (load_balancer_list_of_yojson) "loadBalancers") _list path;
    
  }
  in _res

let get_load_balancers_request_of_yojson = 
  fun tree path : get_load_balancers_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_load_balancers_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_load_balancer_metric_data_result_of_yojson = 
  fun tree path : get_load_balancer_metric_data_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_load_balancer_metric_data_result = {
    metric_data = option_of_yojson (value_for_key (metric_datapoint_list_of_yojson) "metricData") _list path;
    metric_name = option_of_yojson (value_for_key (load_balancer_metric_name_of_yojson) "metricName") _list path;
    
  }
  in _res

let get_load_balancer_metric_data_request_of_yojson = 
  fun tree path : get_load_balancer_metric_data_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_load_balancer_metric_data_request = {
    statistics = value_for_key (metric_statistic_list_of_yojson) "statistics" _list path;
    unit_ = value_for_key (metric_unit_of_yojson) "unit" _list path;
    end_time = value_for_key (timestamp__of_yojson) "endTime" _list path;
    start_time = value_for_key (timestamp__of_yojson) "startTime" _list path;
    period = value_for_key (metric_period_of_yojson) "period" _list path;
    metric_name = value_for_key (load_balancer_metric_name_of_yojson) "metricName" _list path;
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let get_load_balancer_result_of_yojson = 
  fun tree path : get_load_balancer_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_load_balancer_result = {
    load_balancer = option_of_yojson (value_for_key (load_balancer_of_yojson) "loadBalancer") _list path;
    
  }
  in _res

let get_load_balancer_request_of_yojson = 
  fun tree path : get_load_balancer_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_load_balancer_request = {
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let key_pair_of_yojson = 
  fun tree path : key_pair ->
  let _list = assoc_of_yojson tree path in
  let _res : key_pair = {
    fingerprint = option_of_yojson (value_for_key (base64_of_yojson) "fingerprint") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let key_pair_list_of_yojson = 
  fun tree path -> list_of_yojson key_pair_of_yojson tree path 

let get_key_pairs_result_of_yojson = 
  fun tree path : get_key_pairs_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_key_pairs_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    key_pairs = option_of_yojson (value_for_key (key_pair_list_of_yojson) "keyPairs") _list path;
    
  }
  in _res

let get_key_pairs_request_of_yojson = 
  fun tree path : get_key_pairs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_key_pairs_request = {
    include_default_key_pair = option_of_yojson (value_for_key (boolean__of_yojson) "includeDefaultKeyPair") _list path;
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_key_pair_result_of_yojson = 
  fun tree path : get_key_pair_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_key_pair_result = {
    key_pair = option_of_yojson (value_for_key (key_pair_of_yojson) "keyPair") _list path;
    
  }
  in _res

let get_key_pair_request_of_yojson = 
  fun tree path : get_key_pair_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_key_pair_request = {
    key_pair_name = value_for_key (resource_name_of_yojson) "keyPairName" _list path;
    
  }
  in _res

let instance_state_of_yojson = 
  fun tree path : instance_state ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_state = {
    name = option_of_yojson (value_for_key (string__of_yojson) "name") _list path;
    code = option_of_yojson (value_for_key (integer__of_yojson) "code") _list path;
    
  }
  in _res

let get_instance_state_result_of_yojson = 
  fun tree path : get_instance_state_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_state_result = {
    state = option_of_yojson (value_for_key (instance_state_of_yojson) "state") _list path;
    
  }
  in _res

let get_instance_state_request_of_yojson = 
  fun tree path : get_instance_state_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_state_request = {
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let instance_snapshot_state_of_yojson = 
  fun (tree: t) path : instance_snapshot_state -> match tree with 
    | `String "available" -> Available
    | `String "error" -> Error
    | `String "pending" -> Pending
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceSnapshotState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceSnapshotState")

let add_on_of_yojson = 
  fun tree path : add_on ->
  let _list = assoc_of_yojson tree path in
  let _res : add_on = {
    duration = option_of_yojson (value_for_key (string__of_yojson) "duration") _list path;
    threshold = option_of_yojson (value_for_key (string__of_yojson) "threshold") _list path;
    next_snapshot_time_of_day = option_of_yojson (value_for_key (time_of_day_of_yojson) "nextSnapshotTimeOfDay") _list path;
    snapshot_time_of_day = option_of_yojson (value_for_key (time_of_day_of_yojson) "snapshotTimeOfDay") _list path;
    status = option_of_yojson (value_for_key (string__of_yojson) "status") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "name") _list path;
    
  }
  in _res

let add_on_list_of_yojson = 
  fun tree path -> list_of_yojson add_on_of_yojson tree path 

let disk_state_of_yojson = 
  fun (tree: t) path : disk_state -> match tree with 
    | `String "unknown" -> Unknown
    | `String "in-use" -> InUse
    | `String "available" -> Available
    | `String "error" -> Error
    | `String "pending" -> Pending
    | `String value -> raise (deserialize_unknown_enum_value_error path "DiskState" value)
    | _ -> raise (deserialize_wrong_type_error path "DiskState")

let auto_mount_status_of_yojson = 
  fun (tree: t) path : auto_mount_status -> match tree with 
    | `String "NotMounted" -> NotMounted
    | `String "Mounted" -> Mounted
    | `String "Pending" -> Pending
    | `String "Failed" -> Failed
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoMountStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoMountStatus")

let disk_of_yojson = 
  fun tree path : disk ->
  let _list = assoc_of_yojson tree path in
  let _res : disk = {
    auto_mount_status = option_of_yojson (value_for_key (auto_mount_status_of_yojson) "autoMountStatus") _list path;
    gb_in_use = option_of_yojson (value_for_key (integer__of_yojson) "gbInUse") _list path;
    attachment_state = option_of_yojson (value_for_key (string__of_yojson) "attachmentState") _list path;
    is_attached = option_of_yojson (value_for_key (boolean__of_yojson) "isAttached") _list path;
    attached_to = option_of_yojson (value_for_key (resource_name_of_yojson) "attachedTo") _list path;
    state = option_of_yojson (value_for_key (disk_state_of_yojson) "state") _list path;
    path = option_of_yojson (value_for_key (string__of_yojson) "path") _list path;
    iops = option_of_yojson (value_for_key (integer__of_yojson) "iops") _list path;
    is_system_disk = option_of_yojson (value_for_key (boolean__of_yojson) "isSystemDisk") _list path;
    size_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "sizeInGb") _list path;
    add_ons = option_of_yojson (value_for_key (add_on_list_of_yojson) "addOns") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let disk_list_of_yojson = 
  fun tree path -> list_of_yojson disk_of_yojson tree path 

let instance_snapshot_of_yojson = 
  fun tree path : instance_snapshot ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_snapshot = {
    size_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "sizeInGb") _list path;
    is_from_auto_snapshot = option_of_yojson (value_for_key (boolean__of_yojson) "isFromAutoSnapshot") _list path;
    from_bundle_id = option_of_yojson (value_for_key (string__of_yojson) "fromBundleId") _list path;
    from_blueprint_id = option_of_yojson (value_for_key (string__of_yojson) "fromBlueprintId") _list path;
    from_instance_arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "fromInstanceArn") _list path;
    from_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "fromInstanceName") _list path;
    from_attached_disks = option_of_yojson (value_for_key (disk_list_of_yojson) "fromAttachedDisks") _list path;
    progress = option_of_yojson (value_for_key (string__of_yojson) "progress") _list path;
    state = option_of_yojson (value_for_key (instance_snapshot_state_of_yojson) "state") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let instance_snapshot_list_of_yojson = 
  fun tree path -> list_of_yojson instance_snapshot_of_yojson tree path 

let get_instance_snapshots_result_of_yojson = 
  fun tree path : get_instance_snapshots_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_snapshots_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    instance_snapshots = option_of_yojson (value_for_key (instance_snapshot_list_of_yojson) "instanceSnapshots") _list path;
    
  }
  in _res

let get_instance_snapshots_request_of_yojson = 
  fun tree path : get_instance_snapshots_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_snapshots_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_instance_snapshot_result_of_yojson = 
  fun tree path : get_instance_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_snapshot_result = {
    instance_snapshot = option_of_yojson (value_for_key (instance_snapshot_of_yojson) "instanceSnapshot") _list path;
    
  }
  in _res

let get_instance_snapshot_request_of_yojson = 
  fun tree path : get_instance_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_snapshot_request = {
    instance_snapshot_name = value_for_key (resource_name_of_yojson) "instanceSnapshotName" _list path;
    
  }
  in _res

let ipv6_address_of_yojson = string_of_yojson

let ipv6_address_list_of_yojson = 
  fun tree path -> list_of_yojson ipv6_address_of_yojson tree path 

let instance_hardware_of_yojson = 
  fun tree path : instance_hardware ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_hardware = {
    ram_size_in_gb = option_of_yojson (value_for_key (float__of_yojson) "ramSizeInGb") _list path;
    disks = option_of_yojson (value_for_key (disk_list_of_yojson) "disks") _list path;
    cpu_count = option_of_yojson (value_for_key (integer__of_yojson) "cpuCount") _list path;
    
  }
  in _res

let access_direction_of_yojson = 
  fun (tree: t) path : access_direction -> match tree with 
    | `String "outbound" -> Outbound
    | `String "inbound" -> Inbound
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessDirection" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDirection")

let instance_port_info_of_yojson = 
  fun tree path : instance_port_info ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_port_info = {
    cidr_list_aliases = option_of_yojson (value_for_key (string_list_of_yojson) "cidrListAliases") _list path;
    ipv6_cidrs = option_of_yojson (value_for_key (string_list_of_yojson) "ipv6Cidrs") _list path;
    cidrs = option_of_yojson (value_for_key (string_list_of_yojson) "cidrs") _list path;
    access_direction = option_of_yojson (value_for_key (access_direction_of_yojson) "accessDirection") _list path;
    common_name = option_of_yojson (value_for_key (string__of_yojson) "commonName") _list path;
    access_type = option_of_yojson (value_for_key (port_access_type_of_yojson) "accessType") _list path;
    access_from = option_of_yojson (value_for_key (string__of_yojson) "accessFrom") _list path;
    protocol = option_of_yojson (value_for_key (network_protocol_of_yojson) "protocol") _list path;
    to_port = option_of_yojson (value_for_key (port_of_yojson) "toPort") _list path;
    from_port = option_of_yojson (value_for_key (port_of_yojson) "fromPort") _list path;
    
  }
  in _res

let instance_port_info_list_of_yojson = 
  fun tree path -> list_of_yojson instance_port_info_of_yojson tree path 

let instance_networking_of_yojson = 
  fun tree path : instance_networking ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_networking = {
    ports = option_of_yojson (value_for_key (instance_port_info_list_of_yojson) "ports") _list path;
    monthly_transfer = option_of_yojson (value_for_key (monthly_transfer_of_yojson) "monthlyTransfer") _list path;
    
  }
  in _res

let instance_metadata_state_of_yojson = 
  fun (tree: t) path : instance_metadata_state -> match tree with 
    | `String "applied" -> Applied
    | `String "pending" -> Pending
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceMetadataState" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceMetadataState")

let instance_metadata_options_of_yojson = 
  fun tree path : instance_metadata_options ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_metadata_options = {
    http_protocol_ipv6 = option_of_yojson (value_for_key (http_protocol_ipv6_of_yojson) "httpProtocolIpv6") _list path;
    http_put_response_hop_limit = option_of_yojson (value_for_key (integer__of_yojson) "httpPutResponseHopLimit") _list path;
    http_endpoint = option_of_yojson (value_for_key (http_endpoint_of_yojson) "httpEndpoint") _list path;
    http_tokens = option_of_yojson (value_for_key (http_tokens_of_yojson) "httpTokens") _list path;
    state = option_of_yojson (value_for_key (instance_metadata_state_of_yojson) "state") _list path;
    
  }
  in _res

let instance_of_yojson = 
  fun tree path : instance ->
  let _list = assoc_of_yojson tree path in
  let _res : instance = {
    metadata_options = option_of_yojson (value_for_key (instance_metadata_options_of_yojson) "metadataOptions") _list path;
    ssh_key_name = option_of_yojson (value_for_key (resource_name_of_yojson) "sshKeyName") _list path;
    username = option_of_yojson (value_for_key (non_empty_string_of_yojson) "username") _list path;
    state = option_of_yojson (value_for_key (instance_state_of_yojson) "state") _list path;
    networking = option_of_yojson (value_for_key (instance_networking_of_yojson) "networking") _list path;
    hardware = option_of_yojson (value_for_key (instance_hardware_of_yojson) "hardware") _list path;
    ip_address_type = option_of_yojson (value_for_key (ip_address_type_of_yojson) "ipAddressType") _list path;
    ipv6_addresses = option_of_yojson (value_for_key (ipv6_address_list_of_yojson) "ipv6Addresses") _list path;
    public_ip_address = option_of_yojson (value_for_key (ip_address_of_yojson) "publicIpAddress") _list path;
    private_ip_address = option_of_yojson (value_for_key (ip_address_of_yojson) "privateIpAddress") _list path;
    is_static_ip = option_of_yojson (value_for_key (boolean__of_yojson) "isStaticIp") _list path;
    add_ons = option_of_yojson (value_for_key (add_on_list_of_yojson) "addOns") _list path;
    bundle_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "bundleId") _list path;
    blueprint_name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "blueprintName") _list path;
    blueprint_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "blueprintId") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let instance_list_of_yojson = 
  fun tree path -> list_of_yojson instance_of_yojson tree path 

let get_instances_result_of_yojson = 
  fun tree path : get_instances_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instances_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    instances = option_of_yojson (value_for_key (instance_list_of_yojson) "instances") _list path;
    
  }
  in _res

let get_instances_request_of_yojson = 
  fun tree path : get_instances_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instances_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let instance_port_state_of_yojson = 
  fun tree path : instance_port_state ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_port_state = {
    cidr_list_aliases = option_of_yojson (value_for_key (string_list_of_yojson) "cidrListAliases") _list path;
    ipv6_cidrs = option_of_yojson (value_for_key (string_list_of_yojson) "ipv6Cidrs") _list path;
    cidrs = option_of_yojson (value_for_key (string_list_of_yojson) "cidrs") _list path;
    state = option_of_yojson (value_for_key (port_state_of_yojson) "state") _list path;
    protocol = option_of_yojson (value_for_key (network_protocol_of_yojson) "protocol") _list path;
    to_port = option_of_yojson (value_for_key (port_of_yojson) "toPort") _list path;
    from_port = option_of_yojson (value_for_key (port_of_yojson) "fromPort") _list path;
    
  }
  in _res

let instance_port_state_list_of_yojson = 
  fun tree path -> list_of_yojson instance_port_state_of_yojson tree path 

let get_instance_port_states_result_of_yojson = 
  fun tree path : get_instance_port_states_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_port_states_result = {
    port_states = option_of_yojson (value_for_key (instance_port_state_list_of_yojson) "portStates") _list path;
    
  }
  in _res

let get_instance_port_states_request_of_yojson = 
  fun tree path : get_instance_port_states_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_port_states_request = {
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let instance_metric_name_of_yojson = 
  fun (tree: t) path : instance_metric_name -> match tree with 
    | `String "MetadataNoToken" -> MetadataNoToken
    | `String "BurstCapacityPercentage" -> BurstCapacityPercentage
    | `String "BurstCapacityTime" -> BurstCapacityTime
    | `String "StatusCheckFailed_System" -> StatusCheckFailed_System
    | `String "StatusCheckFailed_Instance" -> StatusCheckFailed_Instance
    | `String "StatusCheckFailed" -> StatusCheckFailed
    | `String "NetworkOut" -> NetworkOut
    | `String "NetworkIn" -> NetworkIn
    | `String "CPUUtilization" -> CPUUtilization
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceMetricName")

let get_instance_metric_data_result_of_yojson = 
  fun tree path : get_instance_metric_data_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_metric_data_result = {
    metric_data = option_of_yojson (value_for_key (metric_datapoint_list_of_yojson) "metricData") _list path;
    metric_name = option_of_yojson (value_for_key (instance_metric_name_of_yojson) "metricName") _list path;
    
  }
  in _res

let get_instance_metric_data_request_of_yojson = 
  fun tree path : get_instance_metric_data_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_metric_data_request = {
    statistics = value_for_key (metric_statistic_list_of_yojson) "statistics" _list path;
    unit_ = value_for_key (metric_unit_of_yojson) "unit" _list path;
    end_time = value_for_key (timestamp__of_yojson) "endTime" _list path;
    start_time = value_for_key (timestamp__of_yojson) "startTime" _list path;
    period = value_for_key (metric_period_of_yojson) "period" _list path;
    metric_name = value_for_key (instance_metric_name_of_yojson) "metricName" _list path;
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let instance_access_protocol_of_yojson = 
  fun (tree: t) path : instance_access_protocol -> match tree with 
    | `String "rdp" -> Rdp
    | `String "ssh" -> Ssh
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceAccessProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceAccessProtocol")

let host_key_attributes_of_yojson = 
  fun tree path : host_key_attributes ->
  let _list = assoc_of_yojson tree path in
  let _res : host_key_attributes = {
    not_valid_after = option_of_yojson (value_for_key (iso_date_of_yojson) "notValidAfter") _list path;
    not_valid_before = option_of_yojson (value_for_key (iso_date_of_yojson) "notValidBefore") _list path;
    fingerprint_sh_a256 = option_of_yojson (value_for_key (string__of_yojson) "fingerprintSHA256") _list path;
    fingerprint_sh_a1 = option_of_yojson (value_for_key (string__of_yojson) "fingerprintSHA1") _list path;
    witnessed_at = option_of_yojson (value_for_key (iso_date_of_yojson) "witnessedAt") _list path;
    public_key = option_of_yojson (value_for_key (string__of_yojson) "publicKey") _list path;
    algorithm = option_of_yojson (value_for_key (string__of_yojson) "algorithm") _list path;
    
  }
  in _res

let host_keys_list_of_yojson = 
  fun tree path -> list_of_yojson host_key_attributes_of_yojson tree path 

let instance_access_details_of_yojson = 
  fun tree path : instance_access_details ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_access_details = {
    host_keys = option_of_yojson (value_for_key (host_keys_list_of_yojson) "hostKeys") _list path;
    username = option_of_yojson (value_for_key (string__of_yojson) "username") _list path;
    instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "instanceName") _list path;
    protocol = option_of_yojson (value_for_key (instance_access_protocol_of_yojson) "protocol") _list path;
    private_key = option_of_yojson (value_for_key (string__of_yojson) "privateKey") _list path;
    password_data = option_of_yojson (value_for_key (password_data_of_yojson) "passwordData") _list path;
    password = option_of_yojson (value_for_key (string__of_yojson) "password") _list path;
    ipv6_addresses = option_of_yojson (value_for_key (ipv6_address_list_of_yojson) "ipv6Addresses") _list path;
    ip_address = option_of_yojson (value_for_key (ip_address_of_yojson) "ipAddress") _list path;
    expires_at = option_of_yojson (value_for_key (iso_date_of_yojson) "expiresAt") _list path;
    cert_key = option_of_yojson (value_for_key (string__of_yojson) "certKey") _list path;
    
  }
  in _res

let get_instance_access_details_result_of_yojson = 
  fun tree path : get_instance_access_details_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_access_details_result = {
    access_details = option_of_yojson (value_for_key (instance_access_details_of_yojson) "accessDetails") _list path;
    
  }
  in _res

let get_instance_access_details_request_of_yojson = 
  fun tree path : get_instance_access_details_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_access_details_request = {
    protocol = option_of_yojson (value_for_key (instance_access_protocol_of_yojson) "protocol") _list path;
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let get_instance_result_of_yojson = 
  fun tree path : get_instance_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_result = {
    instance = option_of_yojson (value_for_key (instance_of_yojson) "instance") _list path;
    
  }
  in _res

let get_instance_request_of_yojson = 
  fun tree path : get_instance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_instance_request = {
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let export_snapshot_record_source_type_of_yojson = 
  fun (tree: t) path : export_snapshot_record_source_type -> match tree with 
    | `String "DiskSnapshot" -> DiskSnapshot
    | `String "InstanceSnapshot" -> InstanceSnapshot
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportSnapshotRecordSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportSnapshotRecordSourceType")

let disk_info_of_yojson = 
  fun tree path : disk_info ->
  let _list = assoc_of_yojson tree path in
  let _res : disk_info = {
    is_system_disk = option_of_yojson (value_for_key (boolean__of_yojson) "isSystemDisk") _list path;
    size_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "sizeInGb") _list path;
    path = option_of_yojson (value_for_key (non_empty_string_of_yojson) "path") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "name") _list path;
    
  }
  in _res

let disk_info_list_of_yojson = 
  fun tree path -> list_of_yojson disk_info_of_yojson tree path 

let instance_snapshot_info_of_yojson = 
  fun tree path : instance_snapshot_info ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_snapshot_info = {
    from_disk_info = option_of_yojson (value_for_key (disk_info_list_of_yojson) "fromDiskInfo") _list path;
    from_blueprint_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "fromBlueprintId") _list path;
    from_bundle_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "fromBundleId") _list path;
    
  }
  in _res

let disk_snapshot_info_of_yojson = 
  fun tree path : disk_snapshot_info ->
  let _list = assoc_of_yojson tree path in
  let _res : disk_snapshot_info = {
    size_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "sizeInGb") _list path;
    
  }
  in _res

let export_snapshot_record_source_info_of_yojson = 
  fun tree path : export_snapshot_record_source_info ->
  let _list = assoc_of_yojson tree path in
  let _res : export_snapshot_record_source_info = {
    disk_snapshot_info = option_of_yojson (value_for_key (disk_snapshot_info_of_yojson) "diskSnapshotInfo") _list path;
    instance_snapshot_info = option_of_yojson (value_for_key (instance_snapshot_info_of_yojson) "instanceSnapshotInfo") _list path;
    from_resource_arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "fromResourceArn") _list path;
    from_resource_name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "fromResourceName") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "name") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    resource_type = option_of_yojson (value_for_key (export_snapshot_record_source_type_of_yojson) "resourceType") _list path;
    
  }
  in _res

let destination_info_of_yojson = 
  fun tree path : destination_info ->
  let _list = assoc_of_yojson tree path in
  let _res : destination_info = {
    service = option_of_yojson (value_for_key (non_empty_string_of_yojson) "service") _list path;
    id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "id") _list path;
    
  }
  in _res

let export_snapshot_record_of_yojson = 
  fun tree path : export_snapshot_record ->
  let _list = assoc_of_yojson tree path in
  let _res : export_snapshot_record = {
    destination_info = option_of_yojson (value_for_key (destination_info_of_yojson) "destinationInfo") _list path;
    source_info = option_of_yojson (value_for_key (export_snapshot_record_source_info_of_yojson) "sourceInfo") _list path;
    state = option_of_yojson (value_for_key (record_state_of_yojson) "state") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let export_snapshot_record_list_of_yojson = 
  fun tree path -> list_of_yojson export_snapshot_record_of_yojson tree path 

let get_export_snapshot_records_result_of_yojson = 
  fun tree path : get_export_snapshot_records_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_export_snapshot_records_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    export_snapshot_records = option_of_yojson (value_for_key (export_snapshot_record_list_of_yojson) "exportSnapshotRecords") _list path;
    
  }
  in _res

let get_export_snapshot_records_request_of_yojson = 
  fun tree path : get_export_snapshot_records_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_export_snapshot_records_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let domain_entry_list_of_yojson = 
  fun tree path -> list_of_yojson domain_entry_of_yojson tree path 

let domain_of_yojson = 
  fun tree path : domain ->
  let _list = assoc_of_yojson tree path in
  let _res : domain = {
    registered_domain_delegation_info = option_of_yojson (value_for_key (registered_domain_delegation_info_of_yojson) "registeredDomainDelegationInfo") _list path;
    domain_entries = option_of_yojson (value_for_key (domain_entry_list_of_yojson) "domainEntries") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let domain_list_of_yojson = 
  fun tree path -> list_of_yojson domain_of_yojson tree path 

let get_domains_result_of_yojson = 
  fun tree path : get_domains_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_domains_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    domains = option_of_yojson (value_for_key (domain_list_of_yojson) "domains") _list path;
    
  }
  in _res

let get_domains_request_of_yojson = 
  fun tree path : get_domains_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_domains_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_domain_result_of_yojson = 
  fun tree path : get_domain_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_domain_result = {
    domain = option_of_yojson (value_for_key (domain_of_yojson) "domain") _list path;
    
  }
  in _res

let get_domain_request_of_yojson = 
  fun tree path : get_domain_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_domain_request = {
    domain_name = value_for_key (domain_name_of_yojson) "domainName" _list path;
    
  }
  in _res

let lightsail_distribution_of_yojson = 
  fun tree path : lightsail_distribution ->
  let _list = assoc_of_yojson tree path in
  let _res : lightsail_distribution = {
    viewer_minimum_tls_protocol_version = option_of_yojson (value_for_key (string__of_yojson) "viewerMinimumTlsProtocolVersion") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    ip_address_type = option_of_yojson (value_for_key (ip_address_type_of_yojson) "ipAddressType") _list path;
    able_to_update_bundle = option_of_yojson (value_for_key (boolean__of_yojson) "ableToUpdateBundle") _list path;
    cache_behaviors = option_of_yojson (value_for_key (cache_behavior_list_of_yojson) "cacheBehaviors") _list path;
    cache_behavior_settings = option_of_yojson (value_for_key (cache_settings_of_yojson) "cacheBehaviorSettings") _list path;
    default_cache_behavior = option_of_yojson (value_for_key (cache_behavior_of_yojson) "defaultCacheBehavior") _list path;
    origin_public_dn_s = option_of_yojson (value_for_key (string__of_yojson) "originPublicDNS") _list path;
    origin = option_of_yojson (value_for_key (origin_of_yojson) "origin") _list path;
    certificate_name = option_of_yojson (value_for_key (resource_name_of_yojson) "certificateName") _list path;
    bundle_id = option_of_yojson (value_for_key (string__of_yojson) "bundleId") _list path;
    domain_name = option_of_yojson (value_for_key (string__of_yojson) "domainName") _list path;
    is_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "isEnabled") _list path;
    status = option_of_yojson (value_for_key (string__of_yojson) "status") _list path;
    alternative_domain_names = option_of_yojson (value_for_key (string_list_of_yojson) "alternativeDomainNames") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let distribution_list_of_yojson = 
  fun tree path -> list_of_yojson lightsail_distribution_of_yojson tree path 

let get_distributions_result_of_yojson = 
  fun tree path : get_distributions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_distributions_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    distributions = option_of_yojson (value_for_key (distribution_list_of_yojson) "distributions") _list path;
    
  }
  in _res

let get_distributions_request_of_yojson = 
  fun tree path : get_distributions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_distributions_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    distribution_name = option_of_yojson (value_for_key (resource_name_of_yojson) "distributionName") _list path;
    
  }
  in _res

let distribution_metric_name_of_yojson = 
  fun (tree: t) path : distribution_metric_name -> match tree with 
    | `String "Http5xxErrorRate" -> Http5xxErrorRate
    | `String "Http4xxErrorRate" -> Http4xxErrorRate
    | `String "TotalErrorRate" -> TotalErrorRate
    | `String "BytesUploaded" -> BytesUploaded
    | `String "BytesDownloaded" -> BytesDownloaded
    | `String "Requests" -> Requests
    | `String value -> raise (deserialize_unknown_enum_value_error path "DistributionMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "DistributionMetricName")

let get_distribution_metric_data_result_of_yojson = 
  fun tree path : get_distribution_metric_data_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_distribution_metric_data_result = {
    metric_data = option_of_yojson (value_for_key (metric_datapoint_list_of_yojson) "metricData") _list path;
    metric_name = option_of_yojson (value_for_key (distribution_metric_name_of_yojson) "metricName") _list path;
    
  }
  in _res

let get_distribution_metric_data_request_of_yojson = 
  fun tree path : get_distribution_metric_data_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_distribution_metric_data_request = {
    statistics = value_for_key (metric_statistic_list_of_yojson) "statistics" _list path;
    unit_ = value_for_key (metric_unit_of_yojson) "unit" _list path;
    period = value_for_key (metric_period_of_yojson) "period" _list path;
    end_time = value_for_key (timestamp__of_yojson) "endTime" _list path;
    start_time = value_for_key (timestamp__of_yojson) "startTime" _list path;
    metric_name = value_for_key (distribution_metric_name_of_yojson) "metricName" _list path;
    distribution_name = value_for_key (resource_name_of_yojson) "distributionName" _list path;
    
  }
  in _res

let get_distribution_latest_cache_reset_result_of_yojson = 
  fun tree path : get_distribution_latest_cache_reset_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_distribution_latest_cache_reset_result = {
    create_time = option_of_yojson (value_for_key (iso_date_of_yojson) "createTime") _list path;
    status = option_of_yojson (value_for_key (string__of_yojson) "status") _list path;
    
  }
  in _res

let get_distribution_latest_cache_reset_request_of_yojson = 
  fun tree path : get_distribution_latest_cache_reset_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_distribution_latest_cache_reset_request = {
    distribution_name = option_of_yojson (value_for_key (resource_name_of_yojson) "distributionName") _list path;
    
  }
  in _res

let distribution_bundle_of_yojson = 
  fun tree path : distribution_bundle ->
  let _list = assoc_of_yojson tree path in
  let _res : distribution_bundle = {
    is_active = option_of_yojson (value_for_key (boolean__of_yojson) "isActive") _list path;
    transfer_per_month_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "transferPerMonthInGb") _list path;
    price = option_of_yojson (value_for_key (float__of_yojson) "price") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "name") _list path;
    bundle_id = option_of_yojson (value_for_key (string__of_yojson) "bundleId") _list path;
    
  }
  in _res

let distribution_bundle_list_of_yojson = 
  fun tree path -> list_of_yojson distribution_bundle_of_yojson tree path 

let get_distribution_bundles_result_of_yojson = 
  fun tree path : get_distribution_bundles_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_distribution_bundles_result = {
    bundles = option_of_yojson (value_for_key (distribution_bundle_list_of_yojson) "bundles") _list path;
    
  }
  in _res

let get_distribution_bundles_request_of_yojson = 
  fun tree path : get_distribution_bundles_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_distribution_bundles_request = ()
  in _res

let disk_snapshot_state_of_yojson = 
  fun (tree: t) path : disk_snapshot_state -> match tree with 
    | `String "unknown" -> Unknown
    | `String "error" -> Error
    | `String "completed" -> Completed
    | `String "pending" -> Pending
    | `String value -> raise (deserialize_unknown_enum_value_error path "DiskSnapshotState" value)
    | _ -> raise (deserialize_wrong_type_error path "DiskSnapshotState")

let disk_snapshot_of_yojson = 
  fun tree path : disk_snapshot ->
  let _list = assoc_of_yojson tree path in
  let _res : disk_snapshot = {
    is_from_auto_snapshot = option_of_yojson (value_for_key (boolean__of_yojson) "isFromAutoSnapshot") _list path;
    from_instance_arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "fromInstanceArn") _list path;
    from_instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "fromInstanceName") _list path;
    from_disk_arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "fromDiskArn") _list path;
    from_disk_name = option_of_yojson (value_for_key (resource_name_of_yojson) "fromDiskName") _list path;
    progress = option_of_yojson (value_for_key (string__of_yojson) "progress") _list path;
    state = option_of_yojson (value_for_key (disk_snapshot_state_of_yojson) "state") _list path;
    size_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "sizeInGb") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let disk_snapshot_list_of_yojson = 
  fun tree path -> list_of_yojson disk_snapshot_of_yojson tree path 

let get_disk_snapshots_result_of_yojson = 
  fun tree path : get_disk_snapshots_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_disk_snapshots_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    disk_snapshots = option_of_yojson (value_for_key (disk_snapshot_list_of_yojson) "diskSnapshots") _list path;
    
  }
  in _res

let get_disk_snapshots_request_of_yojson = 
  fun tree path : get_disk_snapshots_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_disk_snapshots_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_disk_snapshot_result_of_yojson = 
  fun tree path : get_disk_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_disk_snapshot_result = {
    disk_snapshot = option_of_yojson (value_for_key (disk_snapshot_of_yojson) "diskSnapshot") _list path;
    
  }
  in _res

let get_disk_snapshot_request_of_yojson = 
  fun tree path : get_disk_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_disk_snapshot_request = {
    disk_snapshot_name = value_for_key (resource_name_of_yojson) "diskSnapshotName" _list path;
    
  }
  in _res

let get_disks_result_of_yojson = 
  fun tree path : get_disks_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_disks_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    disks = option_of_yojson (value_for_key (disk_list_of_yojson) "disks") _list path;
    
  }
  in _res

let get_disks_request_of_yojson = 
  fun tree path : get_disks_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_disks_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let get_disk_result_of_yojson = 
  fun tree path : get_disk_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_disk_result = {
    disk = option_of_yojson (value_for_key (disk_of_yojson) "disk") _list path;
    
  }
  in _res

let get_disk_request_of_yojson = 
  fun tree path : get_disk_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_disk_request = {
    disk_name = value_for_key (resource_name_of_yojson) "diskName" _list path;
    
  }
  in _res

let get_cost_estimate_result_of_yojson = 
  fun tree path : get_cost_estimate_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_cost_estimate_result = {
    resources_budget_estimate = option_of_yojson (value_for_key (resources_budget_estimate_of_yojson) "resourcesBudgetEstimate") _list path;
    
  }
  in _res

let get_cost_estimate_request_of_yojson = 
  fun tree path : get_cost_estimate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_cost_estimate_request = {
    end_time = value_for_key (iso_date_of_yojson) "endTime" _list path;
    start_time = value_for_key (iso_date_of_yojson) "startTime" _list path;
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let container_service_list_of_yojson = 
  fun tree path -> list_of_yojson container_service_of_yojson tree path 

let container_services_list_result_of_yojson = 
  fun tree path : container_services_list_result ->
  let _list = assoc_of_yojson tree path in
  let _res : container_services_list_result = {
    container_services = option_of_yojson (value_for_key (container_service_list_of_yojson) "containerServices") _list path;
    
  }
  in _res

let get_container_services_request_of_yojson = 
  fun tree path : get_container_services_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_services_request = {
    service_name = option_of_yojson (value_for_key (container_service_name_of_yojson) "serviceName") _list path;
    
  }
  in _res

let container_service_power_of_yojson = 
  fun tree path : container_service_power ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service_power = {
    is_active = option_of_yojson (value_for_key (boolean__of_yojson) "isActive") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "name") _list path;
    ram_size_in_gb = option_of_yojson (value_for_key (float__of_yojson) "ramSizeInGb") _list path;
    cpu_count = option_of_yojson (value_for_key (float__of_yojson) "cpuCount") _list path;
    price = option_of_yojson (value_for_key (float__of_yojson) "price") _list path;
    power_id = option_of_yojson (value_for_key (string__of_yojson) "powerId") _list path;
    
  }
  in _res

let container_service_power_list_of_yojson = 
  fun tree path -> list_of_yojson container_service_power_of_yojson tree path 

let get_container_service_powers_result_of_yojson = 
  fun tree path : get_container_service_powers_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_service_powers_result = {
    powers = option_of_yojson (value_for_key (container_service_power_list_of_yojson) "powers") _list path;
    
  }
  in _res

let get_container_service_powers_request_of_yojson = 
  fun tree path : get_container_service_powers_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_service_powers_request = ()
  in _res

let container_service_metric_name_of_yojson = 
  fun (tree: t) path : container_service_metric_name -> match tree with 
    | `String "MemoryUtilization" -> MemoryUtilization
    | `String "CPUUtilization" -> CPUUtilization
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContainerServiceMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "ContainerServiceMetricName")

let get_container_service_metric_data_result_of_yojson = 
  fun tree path : get_container_service_metric_data_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_service_metric_data_result = {
    metric_data = option_of_yojson (value_for_key (metric_datapoint_list_of_yojson) "metricData") _list path;
    metric_name = option_of_yojson (value_for_key (container_service_metric_name_of_yojson) "metricName") _list path;
    
  }
  in _res

let get_container_service_metric_data_request_of_yojson = 
  fun tree path : get_container_service_metric_data_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_service_metric_data_request = {
    statistics = value_for_key (metric_statistic_list_of_yojson) "statistics" _list path;
    period = value_for_key (metric_period_of_yojson) "period" _list path;
    end_time = value_for_key (iso_date_of_yojson) "endTime" _list path;
    start_time = value_for_key (iso_date_of_yojson) "startTime" _list path;
    metric_name = value_for_key (container_service_metric_name_of_yojson) "metricName" _list path;
    service_name = value_for_key (container_service_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let container_service_deployment_list_of_yojson = 
  fun tree path -> list_of_yojson container_service_deployment_of_yojson tree path 

let get_container_service_deployments_result_of_yojson = 
  fun tree path : get_container_service_deployments_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_service_deployments_result = {
    deployments = option_of_yojson (value_for_key (container_service_deployment_list_of_yojson) "deployments") _list path;
    
  }
  in _res

let get_container_service_deployments_request_of_yojson = 
  fun tree path : get_container_service_deployments_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_service_deployments_request = {
    service_name = value_for_key (container_service_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let container_service_log_event_of_yojson = 
  fun tree path : container_service_log_event ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service_log_event = {
    message = option_of_yojson (value_for_key (string__of_yojson) "message") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    
  }
  in _res

let container_service_log_event_list_of_yojson = 
  fun tree path -> list_of_yojson container_service_log_event_of_yojson tree path 

let get_container_log_result_of_yojson = 
  fun tree path : get_container_log_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_log_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    log_events = option_of_yojson (value_for_key (container_service_log_event_list_of_yojson) "logEvents") _list path;
    
  }
  in _res

let get_container_log_request_of_yojson = 
  fun tree path : get_container_log_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_log_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    filter_pattern = option_of_yojson (value_for_key (string__of_yojson) "filterPattern") _list path;
    end_time = option_of_yojson (value_for_key (iso_date_of_yojson) "endTime") _list path;
    start_time = option_of_yojson (value_for_key (iso_date_of_yojson) "startTime") _list path;
    container_name = value_for_key (string__of_yojson) "containerName" _list path;
    service_name = value_for_key (container_service_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let container_image_list_of_yojson = 
  fun tree path -> list_of_yojson container_image_of_yojson tree path 

let get_container_images_result_of_yojson = 
  fun tree path : get_container_images_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_images_result = {
    container_images = option_of_yojson (value_for_key (container_image_list_of_yojson) "containerImages") _list path;
    
  }
  in _res

let get_container_images_request_of_yojson = 
  fun tree path : get_container_images_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_images_request = {
    service_name = value_for_key (container_service_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let container_service_metadata_entry_of_yojson = 
  fun tree path -> map_of_yojson string__of_yojson tree path

let container_service_metadata_entry_list_of_yojson = 
  fun tree path -> list_of_yojson container_service_metadata_entry_of_yojson tree path 

let get_container_api_metadata_result_of_yojson = 
  fun tree path : get_container_api_metadata_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_api_metadata_result = {
    metadata = option_of_yojson (value_for_key (container_service_metadata_entry_list_of_yojson) "metadata") _list path;
    
  }
  in _res

let get_container_api_metadata_request_of_yojson = 
  fun tree path : get_container_api_metadata_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_container_api_metadata_request = ()
  in _res

let contact_method_status_of_yojson = 
  fun (tree: t) path : contact_method_status -> match tree with 
    | `String "Invalid" -> Invalid
    | `String "Valid" -> Valid
    | `String "PendingVerification" -> PendingVerification
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContactMethodStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ContactMethodStatus")

let contact_method_of_yojson = 
  fun tree path : contact_method ->
  let _list = assoc_of_yojson tree path in
  let _res : contact_method = {
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    protocol = option_of_yojson (value_for_key (contact_protocol_of_yojson) "protocol") _list path;
    status = option_of_yojson (value_for_key (contact_method_status_of_yojson) "status") _list path;
    contact_endpoint = option_of_yojson (value_for_key (non_empty_string_of_yojson) "contactEndpoint") _list path;
    
  }
  in _res

let contact_methods_list_of_yojson = 
  fun tree path -> list_of_yojson contact_method_of_yojson tree path 

let get_contact_methods_result_of_yojson = 
  fun tree path : get_contact_methods_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_contact_methods_result = {
    contact_methods = option_of_yojson (value_for_key (contact_methods_list_of_yojson) "contactMethods") _list path;
    
  }
  in _res

let get_contact_methods_request_of_yojson = 
  fun tree path : get_contact_methods_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_contact_methods_request = {
    protocols = option_of_yojson (value_for_key (contact_protocols_list_of_yojson) "protocols") _list path;
    
  }
  in _res

let cloud_formation_stack_record_source_type_of_yojson = 
  fun (tree: t) path : cloud_formation_stack_record_source_type -> match tree with 
    | `String "ExportSnapshotRecord" -> ExportSnapshotRecord
    | `String value -> raise (deserialize_unknown_enum_value_error path "CloudFormationStackRecordSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "CloudFormationStackRecordSourceType")

let cloud_formation_stack_record_source_info_of_yojson = 
  fun tree path : cloud_formation_stack_record_source_info ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_formation_stack_record_source_info = {
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "name") _list path;
    resource_type = option_of_yojson (value_for_key (cloud_formation_stack_record_source_type_of_yojson) "resourceType") _list path;
    
  }
  in _res

let cloud_formation_stack_record_source_info_list_of_yojson = 
  fun tree path -> list_of_yojson cloud_formation_stack_record_source_info_of_yojson tree path 

let cloud_formation_stack_record_of_yojson = 
  fun tree path : cloud_formation_stack_record ->
  let _list = assoc_of_yojson tree path in
  let _res : cloud_formation_stack_record = {
    destination_info = option_of_yojson (value_for_key (destination_info_of_yojson) "destinationInfo") _list path;
    source_info = option_of_yojson (value_for_key (cloud_formation_stack_record_source_info_list_of_yojson) "sourceInfo") _list path;
    state = option_of_yojson (value_for_key (record_state_of_yojson) "state") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let cloud_formation_stack_record_list_of_yojson = 
  fun tree path -> list_of_yojson cloud_formation_stack_record_of_yojson tree path 

let get_cloud_formation_stack_records_result_of_yojson = 
  fun tree path : get_cloud_formation_stack_records_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_cloud_formation_stack_records_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    cloud_formation_stack_records = option_of_yojson (value_for_key (cloud_formation_stack_record_list_of_yojson) "cloudFormationStackRecords") _list path;
    
  }
  in _res

let get_cloud_formation_stack_records_request_of_yojson = 
  fun tree path : get_cloud_formation_stack_records_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_cloud_formation_stack_records_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let certificate_name_of_yojson = string_of_yojson

let certificate_status_of_yojson = 
  fun (tree: t) path : certificate_status -> match tree with 
    | `String "FAILED" -> Failed
    | `String "REVOKED" -> Revoked
    | `String "VALIDATION_TIMED_OUT" -> ValidationTimedOut
    | `String "EXPIRED" -> Expired
    | `String "INACTIVE" -> Inactive
    | `String "ISSUED" -> Issued
    | `String "PENDING_VALIDATION" -> PendingValidation
    | `String value -> raise (deserialize_unknown_enum_value_error path "CertificateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateStatus")

let in_use_resource_count_of_yojson = int_of_yojson

let key_algorithm_of_yojson = string_of_yojson

let issuer_c_a_of_yojson = string_of_yojson

let eligible_to_renew_of_yojson = string_of_yojson

let certificate_of_yojson = 
  fun tree path : certificate ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate = {
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    revocation_reason = option_of_yojson (value_for_key (revocation_reason_of_yojson) "revocationReason") _list path;
    revoked_at = option_of_yojson (value_for_key (iso_date_of_yojson) "revokedAt") _list path;
    renewal_summary = option_of_yojson (value_for_key (renewal_summary_of_yojson) "renewalSummary") _list path;
    eligible_to_renew = option_of_yojson (value_for_key (eligible_to_renew_of_yojson) "eligibleToRenew") _list path;
    not_after = option_of_yojson (value_for_key (iso_date_of_yojson) "notAfter") _list path;
    not_before = option_of_yojson (value_for_key (iso_date_of_yojson) "notBefore") _list path;
    issuer_c_a = option_of_yojson (value_for_key (issuer_c_a_of_yojson) "issuerCA") _list path;
    issued_at = option_of_yojson (value_for_key (iso_date_of_yojson) "issuedAt") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    key_algorithm = option_of_yojson (value_for_key (key_algorithm_of_yojson) "keyAlgorithm") _list path;
    in_use_resource_count = option_of_yojson (value_for_key (in_use_resource_count_of_yojson) "inUseResourceCount") _list path;
    request_failure_reason = option_of_yojson (value_for_key (request_failure_reason_of_yojson) "requestFailureReason") _list path;
    domain_validation_records = option_of_yojson (value_for_key (domain_validation_record_list_of_yojson) "domainValidationRecords") _list path;
    subject_alternative_names = option_of_yojson (value_for_key (subject_alternative_name_list_of_yojson) "subjectAlternativeNames") _list path;
    serial_number = option_of_yojson (value_for_key (serial_number_of_yojson) "serialNumber") _list path;
    status = option_of_yojson (value_for_key (certificate_status_of_yojson) "status") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_of_yojson) "domainName") _list path;
    name = option_of_yojson (value_for_key (certificate_name_of_yojson) "name") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    
  }
  in _res

let certificate_summary_of_yojson = 
  fun tree path : certificate_summary ->
  let _list = assoc_of_yojson tree path in
  let _res : certificate_summary = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    certificate_detail = option_of_yojson (value_for_key (certificate_of_yojson) "certificateDetail") _list path;
    domain_name = option_of_yojson (value_for_key (domain_name_of_yojson) "domainName") _list path;
    certificate_name = option_of_yojson (value_for_key (certificate_name_of_yojson) "certificateName") _list path;
    certificate_arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "certificateArn") _list path;
    
  }
  in _res

let certificate_summary_list_of_yojson = 
  fun tree path -> list_of_yojson certificate_summary_of_yojson tree path 

let get_certificates_result_of_yojson = 
  fun tree path : get_certificates_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_certificates_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    certificates = option_of_yojson (value_for_key (certificate_summary_list_of_yojson) "certificates") _list path;
    
  }
  in _res

let certificate_status_list_of_yojson = 
  fun tree path -> list_of_yojson certificate_status_of_yojson tree path 

let include_certificate_details_of_yojson = bool_of_yojson

let get_certificates_request_of_yojson = 
  fun tree path : get_certificates_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_certificates_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    certificate_name = option_of_yojson (value_for_key (certificate_name_of_yojson) "certificateName") _list path;
    include_certificate_details = option_of_yojson (value_for_key (include_certificate_details_of_yojson) "includeCertificateDetails") _list path;
    certificate_statuses = option_of_yojson (value_for_key (certificate_status_list_of_yojson) "certificateStatuses") _list path;
    
  }
  in _res

let instance_platform_of_yojson = 
  fun (tree: t) path : instance_platform -> match tree with 
    | `String "WINDOWS" -> Windows
    | `String "LINUX_UNIX" -> LinuxUnix
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstancePlatform" value)
    | _ -> raise (deserialize_wrong_type_error path "InstancePlatform")

let instance_platform_list_of_yojson = 
  fun tree path -> list_of_yojson instance_platform_of_yojson tree path 

let app_category_of_yojson = 
  fun (tree: t) path : app_category -> match tree with 
    | `String "LfR" -> LfR
    | `String value -> raise (deserialize_unknown_enum_value_error path "AppCategory" value)
    | _ -> raise (deserialize_wrong_type_error path "AppCategory")

let app_category_list_of_yojson = 
  fun tree path -> list_of_yojson app_category_of_yojson tree path 

let bundle_of_yojson = 
  fun tree path : bundle ->
  let _list = assoc_of_yojson tree path in
  let _res : bundle = {
    public_ipv4_address_count = option_of_yojson (value_for_key (integer__of_yojson) "publicIpv4AddressCount") _list path;
    supported_app_categories = option_of_yojson (value_for_key (app_category_list_of_yojson) "supportedAppCategories") _list path;
    supported_platforms = option_of_yojson (value_for_key (instance_platform_list_of_yojson) "supportedPlatforms") _list path;
    transfer_per_month_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "transferPerMonthInGb") _list path;
    ram_size_in_gb = option_of_yojson (value_for_key (float__of_yojson) "ramSizeInGb") _list path;
    power = option_of_yojson (value_for_key (integer__of_yojson) "power") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "name") _list path;
    is_active = option_of_yojson (value_for_key (boolean__of_yojson) "isActive") _list path;
    instance_type = option_of_yojson (value_for_key (string__of_yojson) "instanceType") _list path;
    bundle_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "bundleId") _list path;
    disk_size_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "diskSizeInGb") _list path;
    cpu_count = option_of_yojson (value_for_key (integer__of_yojson) "cpuCount") _list path;
    price = option_of_yojson (value_for_key (float__of_yojson) "price") _list path;
    
  }
  in _res

let bundle_list_of_yojson = 
  fun tree path -> list_of_yojson bundle_of_yojson tree path 

let get_bundles_result_of_yojson = 
  fun tree path : get_bundles_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_bundles_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    bundles = option_of_yojson (value_for_key (bundle_list_of_yojson) "bundles") _list path;
    
  }
  in _res

let get_bundles_request_of_yojson = 
  fun tree path : get_bundles_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_bundles_request = {
    app_category = option_of_yojson (value_for_key (app_category_of_yojson) "appCategory") _list path;
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    include_inactive = option_of_yojson (value_for_key (boolean__of_yojson) "includeInactive") _list path;
    
  }
  in _res

let bucket_list_of_yojson = 
  fun tree path -> list_of_yojson bucket_of_yojson tree path 

let account_level_bpa_sync_status_of_yojson = 
  fun (tree: t) path : account_level_bpa_sync_status -> match tree with 
    | `String "Defaulted" -> Defaulted
    | `String "NeverSynced" -> NeverSynced
    | `String "Failed" -> Failed
    | `String "InSync" -> InSync
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccountLevelBpaSyncStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountLevelBpaSyncStatus")

let bpa_status_message_of_yojson = 
  fun (tree: t) path : bpa_status_message -> match tree with 
    | `String "Unknown" -> Unknown
    | `String "DEFAULTED_FOR_SLR_MISSING_ON_HOLD" -> DEFAULTED_FOR_SLR_MISSING_ON_HOLD
    | `String "SYNC_ON_HOLD" -> SYNC_ON_HOLD
    | `String "DEFAULTED_FOR_SLR_MISSING" -> DEFAULTED_FOR_SLR_MISSING
    | `String value -> raise (deserialize_unknown_enum_value_error path "BPAStatusMessage" value)
    | _ -> raise (deserialize_wrong_type_error path "BPAStatusMessage")

let account_level_bpa_sync_of_yojson = 
  fun tree path : account_level_bpa_sync ->
  let _list = assoc_of_yojson tree path in
  let _res : account_level_bpa_sync = {
    bpa_impacts_lightsail = option_of_yojson (value_for_key (boolean__of_yojson) "bpaImpactsLightsail") _list path;
    message = option_of_yojson (value_for_key (bpa_status_message_of_yojson) "message") _list path;
    last_synced_at = option_of_yojson (value_for_key (iso_date_of_yojson) "lastSyncedAt") _list path;
    status = option_of_yojson (value_for_key (account_level_bpa_sync_status_of_yojson) "status") _list path;
    
  }
  in _res

let get_buckets_result_of_yojson = 
  fun tree path : get_buckets_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_buckets_result = {
    account_level_bpa_sync = option_of_yojson (value_for_key (account_level_bpa_sync_of_yojson) "accountLevelBpaSync") _list path;
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    buckets = option_of_yojson (value_for_key (bucket_list_of_yojson) "buckets") _list path;
    
  }
  in _res

let get_buckets_request_of_yojson = 
  fun tree path : get_buckets_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_buckets_request = {
    include_connected_resources = option_of_yojson (value_for_key (boolean__of_yojson) "includeConnectedResources") _list path;
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    bucket_name = option_of_yojson (value_for_key (bucket_name_of_yojson) "bucketName") _list path;
    
  }
  in _res

let bucket_metric_name_of_yojson = 
  fun (tree: t) path : bucket_metric_name -> match tree with 
    | `String "NumberOfObjects" -> NumberOfObjects
    | `String "BucketSizeBytes" -> BucketSizeBytes
    | `String value -> raise (deserialize_unknown_enum_value_error path "BucketMetricName" value)
    | _ -> raise (deserialize_wrong_type_error path "BucketMetricName")

let get_bucket_metric_data_result_of_yojson = 
  fun tree path : get_bucket_metric_data_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_bucket_metric_data_result = {
    metric_data = option_of_yojson (value_for_key (metric_datapoint_list_of_yojson) "metricData") _list path;
    metric_name = option_of_yojson (value_for_key (bucket_metric_name_of_yojson) "metricName") _list path;
    
  }
  in _res

let get_bucket_metric_data_request_of_yojson = 
  fun tree path : get_bucket_metric_data_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_bucket_metric_data_request = {
    unit_ = value_for_key (metric_unit_of_yojson) "unit" _list path;
    statistics = value_for_key (metric_statistic_list_of_yojson) "statistics" _list path;
    period = value_for_key (metric_period_of_yojson) "period" _list path;
    end_time = value_for_key (iso_date_of_yojson) "endTime" _list path;
    start_time = value_for_key (iso_date_of_yojson) "startTime" _list path;
    metric_name = value_for_key (bucket_metric_name_of_yojson) "metricName" _list path;
    bucket_name = value_for_key (bucket_name_of_yojson) "bucketName" _list path;
    
  }
  in _res

let bucket_bundle_of_yojson = 
  fun tree path : bucket_bundle ->
  let _list = assoc_of_yojson tree path in
  let _res : bucket_bundle = {
    is_active = option_of_yojson (value_for_key (boolean__of_yojson) "isActive") _list path;
    transfer_per_month_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "transferPerMonthInGb") _list path;
    storage_per_month_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "storagePerMonthInGb") _list path;
    price = option_of_yojson (value_for_key (float__of_yojson) "price") _list path;
    name = option_of_yojson (value_for_key (non_empty_string_of_yojson) "name") _list path;
    bundle_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "bundleId") _list path;
    
  }
  in _res

let bucket_bundle_list_of_yojson = 
  fun tree path -> list_of_yojson bucket_bundle_of_yojson tree path 

let get_bucket_bundles_result_of_yojson = 
  fun tree path : get_bucket_bundles_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_bucket_bundles_result = {
    bundles = option_of_yojson (value_for_key (bucket_bundle_list_of_yojson) "bundles") _list path;
    
  }
  in _res

let get_bucket_bundles_request_of_yojson = 
  fun tree path : get_bucket_bundles_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_bucket_bundles_request = {
    include_inactive = option_of_yojson (value_for_key (boolean__of_yojson) "includeInactive") _list path;
    
  }
  in _res

let iam_access_key_id_of_yojson = string_of_yojson

let access_key_last_used_of_yojson = 
  fun tree path : access_key_last_used ->
  let _list = assoc_of_yojson tree path in
  let _res : access_key_last_used = {
    service_name = option_of_yojson (value_for_key (string__of_yojson) "serviceName") _list path;
    region = option_of_yojson (value_for_key (string__of_yojson) "region") _list path;
    last_used_date = option_of_yojson (value_for_key (iso_date_of_yojson) "lastUsedDate") _list path;
    
  }
  in _res

let access_key_of_yojson = 
  fun tree path : access_key ->
  let _list = assoc_of_yojson tree path in
  let _res : access_key = {
    last_used = option_of_yojson (value_for_key (access_key_last_used_of_yojson) "lastUsed") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    status = option_of_yojson (value_for_key (status_type_of_yojson) "status") _list path;
    secret_access_key = option_of_yojson (value_for_key (non_empty_string_of_yojson) "secretAccessKey") _list path;
    access_key_id = option_of_yojson (value_for_key (iam_access_key_id_of_yojson) "accessKeyId") _list path;
    
  }
  in _res

let access_key_list_of_yojson = 
  fun tree path -> list_of_yojson access_key_of_yojson tree path 

let get_bucket_access_keys_result_of_yojson = 
  fun tree path : get_bucket_access_keys_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_bucket_access_keys_result = {
    access_keys = option_of_yojson (value_for_key (access_key_list_of_yojson) "accessKeys") _list path;
    
  }
  in _res

let get_bucket_access_keys_request_of_yojson = 
  fun tree path : get_bucket_access_keys_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_bucket_access_keys_request = {
    bucket_name = value_for_key (bucket_name_of_yojson) "bucketName" _list path;
    
  }
  in _res

let blueprint_type_of_yojson = 
  fun (tree: t) path : blueprint_type -> match tree with 
    | `String "app" -> App
    | `String "os" -> Os
    | `String value -> raise (deserialize_unknown_enum_value_error path "BlueprintType" value)
    | _ -> raise (deserialize_wrong_type_error path "BlueprintType")

let blueprint_of_yojson = 
  fun tree path : blueprint ->
  let _list = assoc_of_yojson tree path in
  let _res : blueprint = {
    app_category = option_of_yojson (value_for_key (app_category_of_yojson) "appCategory") _list path;
    platform = option_of_yojson (value_for_key (instance_platform_of_yojson) "platform") _list path;
    license_url = option_of_yojson (value_for_key (string__of_yojson) "licenseUrl") _list path;
    product_url = option_of_yojson (value_for_key (string__of_yojson) "productUrl") _list path;
    version_code = option_of_yojson (value_for_key (string__of_yojson) "versionCode") _list path;
    version = option_of_yojson (value_for_key (string__of_yojson) "version") _list path;
    min_power = option_of_yojson (value_for_key (integer__of_yojson) "minPower") _list path;
    is_active = option_of_yojson (value_for_key (boolean__of_yojson) "isActive") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "description") _list path;
    type_ = option_of_yojson (value_for_key (blueprint_type_of_yojson) "type") _list path;
    group = option_of_yojson (value_for_key (non_empty_string_of_yojson) "group") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    blueprint_id = option_of_yojson (value_for_key (non_empty_string_of_yojson) "blueprintId") _list path;
    
  }
  in _res

let blueprint_list_of_yojson = 
  fun tree path -> list_of_yojson blueprint_of_yojson tree path 

let get_blueprints_result_of_yojson = 
  fun tree path : get_blueprints_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_blueprints_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    blueprints = option_of_yojson (value_for_key (blueprint_list_of_yojson) "blueprints") _list path;
    
  }
  in _res

let get_blueprints_request_of_yojson = 
  fun tree path : get_blueprints_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_blueprints_request = {
    app_category = option_of_yojson (value_for_key (app_category_of_yojson) "appCategory") _list path;
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    include_inactive = option_of_yojson (value_for_key (boolean__of_yojson) "includeInactive") _list path;
    
  }
  in _res

let auto_snapshot_status_of_yojson = 
  fun (tree: t) path : auto_snapshot_status -> match tree with 
    | `String "NotFound" -> NOT_FOUND
    | `String "InProgress" -> IN_PROGRESS
    | `String "Failed" -> FAILED
    | `String "Success" -> SUCCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoSnapshotStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoSnapshotStatus")

let attached_disk_of_yojson = 
  fun tree path : attached_disk ->
  let _list = assoc_of_yojson tree path in
  let _res : attached_disk = {
    size_in_gb = option_of_yojson (value_for_key (integer__of_yojson) "sizeInGb") _list path;
    path = option_of_yojson (value_for_key (string__of_yojson) "path") _list path;
    
  }
  in _res

let attached_disk_list_of_yojson = 
  fun tree path -> list_of_yojson attached_disk_of_yojson tree path 

let auto_snapshot_details_of_yojson = 
  fun tree path : auto_snapshot_details ->
  let _list = assoc_of_yojson tree path in
  let _res : auto_snapshot_details = {
    from_attached_disks = option_of_yojson (value_for_key (attached_disk_list_of_yojson) "fromAttachedDisks") _list path;
    status = option_of_yojson (value_for_key (auto_snapshot_status_of_yojson) "status") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    date = option_of_yojson (value_for_key (string__of_yojson) "date") _list path;
    
  }
  in _res

let auto_snapshot_details_list_of_yojson = 
  fun tree path -> list_of_yojson auto_snapshot_details_of_yojson tree path 

let get_auto_snapshots_result_of_yojson = 
  fun tree path : get_auto_snapshots_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_auto_snapshots_result = {
    auto_snapshots = option_of_yojson (value_for_key (auto_snapshot_details_list_of_yojson) "autoSnapshots") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "resourceName") _list path;
    
  }
  in _res

let get_auto_snapshots_request_of_yojson = 
  fun tree path : get_auto_snapshots_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_auto_snapshots_request = {
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let alarm_of_yojson = 
  fun tree path : alarm ->
  let _list = assoc_of_yojson tree path in
  let _res : alarm = {
    notification_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "notificationEnabled") _list path;
    notification_triggers = option_of_yojson (value_for_key (notification_trigger_list_of_yojson) "notificationTriggers") _list path;
    contact_protocols = option_of_yojson (value_for_key (contact_protocols_list_of_yojson) "contactProtocols") _list path;
    unit_ = option_of_yojson (value_for_key (metric_unit_of_yojson) "unit") _list path;
    state = option_of_yojson (value_for_key (alarm_state_of_yojson) "state") _list path;
    metric_name = option_of_yojson (value_for_key (metric_name_of_yojson) "metricName") _list path;
    statistic = option_of_yojson (value_for_key (metric_statistic_of_yojson) "statistic") _list path;
    treat_missing_data = option_of_yojson (value_for_key (treat_missing_data_of_yojson) "treatMissingData") _list path;
    datapoints_to_alarm = option_of_yojson (value_for_key (integer__of_yojson) "datapointsToAlarm") _list path;
    threshold = option_of_yojson (value_for_key (double_of_yojson) "threshold") _list path;
    period = option_of_yojson (value_for_key (metric_period_of_yojson) "period") _list path;
    evaluation_periods = option_of_yojson (value_for_key (integer__of_yojson) "evaluationPeriods") _list path;
    comparison_operator = option_of_yojson (value_for_key (comparison_operator_of_yojson) "comparisonOperator") _list path;
    monitored_resource_info = option_of_yojson (value_for_key (monitored_resource_info_of_yojson) "monitoredResourceInfo") _list path;
    support_code = option_of_yojson (value_for_key (string__of_yojson) "supportCode") _list path;
    resource_type = option_of_yojson (value_for_key (resource_type_of_yojson) "resourceType") _list path;
    location = option_of_yojson (value_for_key (resource_location_of_yojson) "location") _list path;
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    arn = option_of_yojson (value_for_key (non_empty_string_of_yojson) "arn") _list path;
    name = option_of_yojson (value_for_key (resource_name_of_yojson) "name") _list path;
    
  }
  in _res

let alarms_list_of_yojson = 
  fun tree path -> list_of_yojson alarm_of_yojson tree path 

let get_alarms_result_of_yojson = 
  fun tree path : get_alarms_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_alarms_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    alarms = option_of_yojson (value_for_key (alarms_list_of_yojson) "alarms") _list path;
    
  }
  in _res

let get_alarms_request_of_yojson = 
  fun tree path : get_alarms_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_alarms_request = {
    monitored_resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "monitoredResourceName") _list path;
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    alarm_name = option_of_yojson (value_for_key (resource_name_of_yojson) "alarmName") _list path;
    
  }
  in _res

let get_active_names_result_of_yojson = 
  fun tree path : get_active_names_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_active_names_result = {
    next_page_token = option_of_yojson (value_for_key (string__of_yojson) "nextPageToken") _list path;
    active_names = option_of_yojson (value_for_key (string_list_of_yojson) "activeNames") _list path;
    
  }
  in _res

let get_active_names_request_of_yojson = 
  fun tree path : get_active_names_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_active_names_request = {
    page_token = option_of_yojson (value_for_key (string__of_yojson) "pageToken") _list path;
    
  }
  in _res

let export_snapshot_result_of_yojson = 
  fun tree path : export_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : export_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let export_snapshot_request_of_yojson = 
  fun tree path : export_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : export_snapshot_request = {
    source_snapshot_name = value_for_key (resource_name_of_yojson) "sourceSnapshotName" _list path;
    
  }
  in _res

let enable_add_on_result_of_yojson = 
  fun tree path : enable_add_on_result ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_add_on_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let add_on_type_of_yojson = 
  fun (tree: t) path : add_on_type -> match tree with 
    | `String "StopInstanceOnIdle" -> StopInstanceOnIdle
    | `String "AutoSnapshot" -> AutoSnapshot
    | `String value -> raise (deserialize_unknown_enum_value_error path "AddOnType" value)
    | _ -> raise (deserialize_wrong_type_error path "AddOnType")

let auto_snapshot_add_on_request_of_yojson = 
  fun tree path : auto_snapshot_add_on_request ->
  let _list = assoc_of_yojson tree path in
  let _res : auto_snapshot_add_on_request = {
    snapshot_time_of_day = option_of_yojson (value_for_key (time_of_day_of_yojson) "snapshotTimeOfDay") _list path;
    
  }
  in _res

let add_on_request_of_yojson = 
  fun tree path : add_on_request ->
  let _list = assoc_of_yojson tree path in
  let _res : add_on_request = {
    stop_instance_on_idle_request = option_of_yojson (value_for_key (stop_instance_on_idle_request_of_yojson) "stopInstanceOnIdleRequest") _list path;
    auto_snapshot_add_on_request = option_of_yojson (value_for_key (auto_snapshot_add_on_request_of_yojson) "autoSnapshotAddOnRequest") _list path;
    add_on_type = value_for_key (add_on_type_of_yojson) "addOnType" _list path;
    
  }
  in _res

let enable_add_on_request_of_yojson = 
  fun tree path : enable_add_on_request ->
  let _list = assoc_of_yojson tree path in
  let _res : enable_add_on_request = {
    add_on_request = value_for_key (add_on_request_of_yojson) "addOnRequest" _list path;
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let download_default_key_pair_result_of_yojson = 
  fun tree path : download_default_key_pair_result ->
  let _list = assoc_of_yojson tree path in
  let _res : download_default_key_pair_result = {
    created_at = option_of_yojson (value_for_key (iso_date_of_yojson) "createdAt") _list path;
    private_key_base64 = option_of_yojson (value_for_key (base64_of_yojson) "privateKeyBase64") _list path;
    public_key_base64 = option_of_yojson (value_for_key (base64_of_yojson) "publicKeyBase64") _list path;
    
  }
  in _res

let download_default_key_pair_request_of_yojson = 
  fun tree path : download_default_key_pair_request ->
  let _list = assoc_of_yojson tree path in
  let _res : download_default_key_pair_request = ()
  in _res

let disable_add_on_result_of_yojson = 
  fun tree path : disable_add_on_result ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_add_on_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let disable_add_on_request_of_yojson = 
  fun tree path : disable_add_on_request ->
  let _list = assoc_of_yojson tree path in
  let _res : disable_add_on_request = {
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    add_on_type = value_for_key (add_on_type_of_yojson) "addOnType" _list path;
    
  }
  in _res

let detach_static_ip_result_of_yojson = 
  fun tree path : detach_static_ip_result ->
  let _list = assoc_of_yojson tree path in
  let _res : detach_static_ip_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let detach_static_ip_request_of_yojson = 
  fun tree path : detach_static_ip_request ->
  let _list = assoc_of_yojson tree path in
  let _res : detach_static_ip_request = {
    static_ip_name = value_for_key (resource_name_of_yojson) "staticIpName" _list path;
    
  }
  in _res

let detach_instances_from_load_balancer_result_of_yojson = 
  fun tree path : detach_instances_from_load_balancer_result ->
  let _list = assoc_of_yojson tree path in
  let _res : detach_instances_from_load_balancer_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let detach_instances_from_load_balancer_request_of_yojson = 
  fun tree path : detach_instances_from_load_balancer_request ->
  let _list = assoc_of_yojson tree path in
  let _res : detach_instances_from_load_balancer_request = {
    instance_names = value_for_key (resource_name_list_of_yojson) "instanceNames" _list path;
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let detach_disk_result_of_yojson = 
  fun tree path : detach_disk_result ->
  let _list = assoc_of_yojson tree path in
  let _res : detach_disk_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let detach_disk_request_of_yojson = 
  fun tree path : detach_disk_request ->
  let _list = assoc_of_yojson tree path in
  let _res : detach_disk_request = {
    disk_name = value_for_key (resource_name_of_yojson) "diskName" _list path;
    
  }
  in _res

let detach_certificate_from_distribution_result_of_yojson = 
  fun tree path : detach_certificate_from_distribution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : detach_certificate_from_distribution_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let detach_certificate_from_distribution_request_of_yojson = 
  fun tree path : detach_certificate_from_distribution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : detach_certificate_from_distribution_request = {
    distribution_name = value_for_key (resource_name_of_yojson) "distributionName" _list path;
    
  }
  in _res

let delete_relational_database_snapshot_result_of_yojson = 
  fun tree path : delete_relational_database_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_relational_database_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_relational_database_snapshot_request_of_yojson = 
  fun tree path : delete_relational_database_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_relational_database_snapshot_request = {
    relational_database_snapshot_name = value_for_key (resource_name_of_yojson) "relationalDatabaseSnapshotName" _list path;
    
  }
  in _res

let delete_relational_database_result_of_yojson = 
  fun tree path : delete_relational_database_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_relational_database_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_relational_database_request_of_yojson = 
  fun tree path : delete_relational_database_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_relational_database_request = {
    final_relational_database_snapshot_name = option_of_yojson (value_for_key (resource_name_of_yojson) "finalRelationalDatabaseSnapshotName") _list path;
    skip_final_snapshot = option_of_yojson (value_for_key (boolean__of_yojson) "skipFinalSnapshot") _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let delete_load_balancer_tls_certificate_result_of_yojson = 
  fun tree path : delete_load_balancer_tls_certificate_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_load_balancer_tls_certificate_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_load_balancer_tls_certificate_request_of_yojson = 
  fun tree path : delete_load_balancer_tls_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_load_balancer_tls_certificate_request = {
    force = option_of_yojson (value_for_key (boolean__of_yojson) "force") _list path;
    certificate_name = value_for_key (resource_name_of_yojson) "certificateName" _list path;
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let delete_load_balancer_result_of_yojson = 
  fun tree path : delete_load_balancer_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_load_balancer_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_load_balancer_request_of_yojson = 
  fun tree path : delete_load_balancer_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_load_balancer_request = {
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let delete_known_host_keys_result_of_yojson = 
  fun tree path : delete_known_host_keys_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_known_host_keys_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_known_host_keys_request_of_yojson = 
  fun tree path : delete_known_host_keys_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_known_host_keys_request = {
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let delete_key_pair_result_of_yojson = 
  fun tree path : delete_key_pair_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_key_pair_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let delete_key_pair_request_of_yojson = 
  fun tree path : delete_key_pair_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_key_pair_request = {
    expected_fingerprint = option_of_yojson (value_for_key (string__of_yojson) "expectedFingerprint") _list path;
    key_pair_name = value_for_key (resource_name_of_yojson) "keyPairName" _list path;
    
  }
  in _res

let delete_instance_snapshot_result_of_yojson = 
  fun tree path : delete_instance_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_instance_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_instance_snapshot_request_of_yojson = 
  fun tree path : delete_instance_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_instance_snapshot_request = {
    instance_snapshot_name = value_for_key (resource_name_of_yojson) "instanceSnapshotName" _list path;
    
  }
  in _res

let delete_instance_result_of_yojson = 
  fun tree path : delete_instance_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_instance_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_instance_request_of_yojson = 
  fun tree path : delete_instance_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_instance_request = {
    force_delete_add_ons = option_of_yojson (value_for_key (boolean__of_yojson) "forceDeleteAddOns") _list path;
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    
  }
  in _res

let delete_domain_entry_result_of_yojson = 
  fun tree path : delete_domain_entry_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_domain_entry_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let delete_domain_entry_request_of_yojson = 
  fun tree path : delete_domain_entry_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_domain_entry_request = {
    domain_entry = value_for_key (domain_entry_of_yojson) "domainEntry" _list path;
    domain_name = value_for_key (domain_name_of_yojson) "domainName" _list path;
    
  }
  in _res

let delete_domain_result_of_yojson = 
  fun tree path : delete_domain_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_domain_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let delete_domain_request_of_yojson = 
  fun tree path : delete_domain_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_domain_request = {
    domain_name = value_for_key (domain_name_of_yojson) "domainName" _list path;
    
  }
  in _res

let delete_distribution_result_of_yojson = 
  fun tree path : delete_distribution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_distribution_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let delete_distribution_request_of_yojson = 
  fun tree path : delete_distribution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_distribution_request = {
    distribution_name = option_of_yojson (value_for_key (resource_name_of_yojson) "distributionName") _list path;
    
  }
  in _res

let delete_disk_snapshot_result_of_yojson = 
  fun tree path : delete_disk_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_disk_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_disk_snapshot_request_of_yojson = 
  fun tree path : delete_disk_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_disk_snapshot_request = {
    disk_snapshot_name = value_for_key (resource_name_of_yojson) "diskSnapshotName" _list path;
    
  }
  in _res

let delete_disk_result_of_yojson = 
  fun tree path : delete_disk_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_disk_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_disk_request_of_yojson = 
  fun tree path : delete_disk_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_disk_request = {
    force_delete_add_ons = option_of_yojson (value_for_key (boolean__of_yojson) "forceDeleteAddOns") _list path;
    disk_name = value_for_key (resource_name_of_yojson) "diskName" _list path;
    
  }
  in _res

let delete_container_service_result_of_yojson = 
  fun tree path : delete_container_service_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_container_service_result = ()
  in _res

let delete_container_service_request_of_yojson = 
  fun tree path : delete_container_service_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_container_service_request = {
    service_name = value_for_key (container_service_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let delete_container_image_result_of_yojson = 
  fun tree path : delete_container_image_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_container_image_result = ()
  in _res

let delete_container_image_request_of_yojson = 
  fun tree path : delete_container_image_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_container_image_request = {
    image = value_for_key (string__of_yojson) "image" _list path;
    service_name = value_for_key (container_service_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let delete_contact_method_result_of_yojson = 
  fun tree path : delete_contact_method_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_contact_method_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_contact_method_request_of_yojson = 
  fun tree path : delete_contact_method_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_contact_method_request = {
    protocol = value_for_key (contact_protocol_of_yojson) "protocol" _list path;
    
  }
  in _res

let delete_certificate_result_of_yojson = 
  fun tree path : delete_certificate_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_certificate_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_certificate_request_of_yojson = 
  fun tree path : delete_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_certificate_request = {
    certificate_name = value_for_key (certificate_name_of_yojson) "certificateName" _list path;
    
  }
  in _res

let delete_bucket_access_key_result_of_yojson = 
  fun tree path : delete_bucket_access_key_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_bucket_access_key_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_bucket_access_key_request_of_yojson = 
  fun tree path : delete_bucket_access_key_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_bucket_access_key_request = {
    access_key_id = value_for_key (non_empty_string_of_yojson) "accessKeyId" _list path;
    bucket_name = value_for_key (bucket_name_of_yojson) "bucketName" _list path;
    
  }
  in _res

let delete_bucket_result_of_yojson = 
  fun tree path : delete_bucket_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_bucket_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_bucket_request_of_yojson = 
  fun tree path : delete_bucket_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_bucket_request = {
    force_delete = option_of_yojson (value_for_key (boolean__of_yojson) "forceDelete") _list path;
    bucket_name = value_for_key (bucket_name_of_yojson) "bucketName" _list path;
    
  }
  in _res

let delete_auto_snapshot_result_of_yojson = 
  fun tree path : delete_auto_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_auto_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let auto_snapshot_date_of_yojson = string_of_yojson

let delete_auto_snapshot_request_of_yojson = 
  fun tree path : delete_auto_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_auto_snapshot_request = {
    date = value_for_key (auto_snapshot_date_of_yojson) "date" _list path;
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let delete_alarm_result_of_yojson = 
  fun tree path : delete_alarm_result ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_alarm_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let delete_alarm_request_of_yojson = 
  fun tree path : delete_alarm_request ->
  let _list = assoc_of_yojson tree path in
  let _res : delete_alarm_request = {
    alarm_name = value_for_key (resource_name_of_yojson) "alarmName" _list path;
    
  }
  in _res

let create_relational_database_snapshot_result_of_yojson = 
  fun tree path : create_relational_database_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_relational_database_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let create_relational_database_snapshot_request_of_yojson = 
  fun tree path : create_relational_database_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_relational_database_snapshot_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    relational_database_snapshot_name = value_for_key (resource_name_of_yojson) "relationalDatabaseSnapshotName" _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let create_relational_database_from_snapshot_result_of_yojson = 
  fun tree path : create_relational_database_from_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_relational_database_from_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let create_relational_database_from_snapshot_request_of_yojson = 
  fun tree path : create_relational_database_from_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_relational_database_from_snapshot_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    use_latest_restorable_time = option_of_yojson (value_for_key (boolean__of_yojson) "useLatestRestorableTime") _list path;
    restore_time = option_of_yojson (value_for_key (iso_date_of_yojson) "restoreTime") _list path;
    source_relational_database_name = option_of_yojson (value_for_key (resource_name_of_yojson) "sourceRelationalDatabaseName") _list path;
    relational_database_bundle_id = option_of_yojson (value_for_key (string__of_yojson) "relationalDatabaseBundleId") _list path;
    relational_database_snapshot_name = option_of_yojson (value_for_key (resource_name_of_yojson) "relationalDatabaseSnapshotName") _list path;
    publicly_accessible = option_of_yojson (value_for_key (boolean__of_yojson) "publiclyAccessible") _list path;
    availability_zone = option_of_yojson (value_for_key (string__of_yojson) "availabilityZone") _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let create_relational_database_result_of_yojson = 
  fun tree path : create_relational_database_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_relational_database_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let create_relational_database_request_of_yojson = 
  fun tree path : create_relational_database_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_relational_database_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    publicly_accessible = option_of_yojson (value_for_key (boolean__of_yojson) "publiclyAccessible") _list path;
    preferred_maintenance_window = option_of_yojson (value_for_key (string__of_yojson) "preferredMaintenanceWindow") _list path;
    preferred_backup_window = option_of_yojson (value_for_key (string__of_yojson) "preferredBackupWindow") _list path;
    master_user_password = option_of_yojson (value_for_key (sensitive_string_of_yojson) "masterUserPassword") _list path;
    master_username = value_for_key (string__of_yojson) "masterUsername" _list path;
    master_database_name = value_for_key (string__of_yojson) "masterDatabaseName" _list path;
    relational_database_bundle_id = value_for_key (string__of_yojson) "relationalDatabaseBundleId" _list path;
    relational_database_blueprint_id = value_for_key (string__of_yojson) "relationalDatabaseBlueprintId" _list path;
    availability_zone = option_of_yojson (value_for_key (string__of_yojson) "availabilityZone") _list path;
    relational_database_name = value_for_key (resource_name_of_yojson) "relationalDatabaseName" _list path;
    
  }
  in _res

let create_load_balancer_tls_certificate_result_of_yojson = 
  fun tree path : create_load_balancer_tls_certificate_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_load_balancer_tls_certificate_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let domain_name_list_of_yojson = 
  fun tree path -> list_of_yojson domain_name_of_yojson tree path 

let create_load_balancer_tls_certificate_request_of_yojson = 
  fun tree path : create_load_balancer_tls_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_load_balancer_tls_certificate_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    certificate_alternative_names = option_of_yojson (value_for_key (domain_name_list_of_yojson) "certificateAlternativeNames") _list path;
    certificate_domain_name = value_for_key (domain_name_of_yojson) "certificateDomainName" _list path;
    certificate_name = value_for_key (resource_name_of_yojson) "certificateName" _list path;
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let create_load_balancer_result_of_yojson = 
  fun tree path : create_load_balancer_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_load_balancer_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let create_load_balancer_request_of_yojson = 
  fun tree path : create_load_balancer_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_load_balancer_request = {
    tls_policy_name = option_of_yojson (value_for_key (string__of_yojson) "tlsPolicyName") _list path;
    ip_address_type = option_of_yojson (value_for_key (ip_address_type_of_yojson) "ipAddressType") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    certificate_alternative_names = option_of_yojson (value_for_key (domain_name_list_of_yojson) "certificateAlternativeNames") _list path;
    certificate_domain_name = option_of_yojson (value_for_key (domain_name_of_yojson) "certificateDomainName") _list path;
    certificate_name = option_of_yojson (value_for_key (resource_name_of_yojson) "certificateName") _list path;
    health_check_path = option_of_yojson (value_for_key (string__of_yojson) "healthCheckPath") _list path;
    instance_port = value_for_key (port_of_yojson) "instancePort" _list path;
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let create_key_pair_result_of_yojson = 
  fun tree path : create_key_pair_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_key_pair_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    private_key_base64 = option_of_yojson (value_for_key (base64_of_yojson) "privateKeyBase64") _list path;
    public_key_base64 = option_of_yojson (value_for_key (base64_of_yojson) "publicKeyBase64") _list path;
    key_pair = option_of_yojson (value_for_key (key_pair_of_yojson) "keyPair") _list path;
    
  }
  in _res

let create_key_pair_request_of_yojson = 
  fun tree path : create_key_pair_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_key_pair_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    key_pair_name = value_for_key (resource_name_of_yojson) "keyPairName" _list path;
    
  }
  in _res

let create_instance_snapshot_result_of_yojson = 
  fun tree path : create_instance_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_instance_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let create_instance_snapshot_request_of_yojson = 
  fun tree path : create_instance_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_instance_snapshot_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    instance_snapshot_name = value_for_key (resource_name_of_yojson) "instanceSnapshotName" _list path;
    
  }
  in _res

let create_instances_from_snapshot_result_of_yojson = 
  fun tree path : create_instances_from_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_instances_from_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let disk_map_of_yojson = 
  fun tree path : disk_map ->
  let _list = assoc_of_yojson tree path in
  let _res : disk_map = {
    new_disk_name = option_of_yojson (value_for_key (resource_name_of_yojson) "newDiskName") _list path;
    original_disk_path = option_of_yojson (value_for_key (non_empty_string_of_yojson) "originalDiskPath") _list path;
    
  }
  in _res

let disk_map_list_of_yojson = 
  fun tree path -> list_of_yojson disk_map_of_yojson tree path 

let attached_disk_map_of_yojson = 
  fun tree path -> map_of_yojson disk_map_list_of_yojson tree path

let add_on_request_list_of_yojson = 
  fun tree path -> list_of_yojson add_on_request_of_yojson tree path 

let create_instances_from_snapshot_request_of_yojson = 
  fun tree path : create_instances_from_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_instances_from_snapshot_request = {
    use_latest_restorable_auto_snapshot = option_of_yojson (value_for_key (boolean__of_yojson) "useLatestRestorableAutoSnapshot") _list path;
    restore_date = option_of_yojson (value_for_key (string__of_yojson) "restoreDate") _list path;
    source_instance_name = option_of_yojson (value_for_key (string__of_yojson) "sourceInstanceName") _list path;
    ip_address_type = option_of_yojson (value_for_key (ip_address_type_of_yojson) "ipAddressType") _list path;
    add_ons = option_of_yojson (value_for_key (add_on_request_list_of_yojson) "addOns") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    key_pair_name = option_of_yojson (value_for_key (resource_name_of_yojson) "keyPairName") _list path;
    user_data = option_of_yojson (value_for_key (string__of_yojson) "userData") _list path;
    bundle_id = value_for_key (non_empty_string_of_yojson) "bundleId" _list path;
    instance_snapshot_name = option_of_yojson (value_for_key (resource_name_of_yojson) "instanceSnapshotName") _list path;
    availability_zone = value_for_key (string__of_yojson) "availabilityZone" _list path;
    attached_disk_mapping = option_of_yojson (value_for_key (attached_disk_map_of_yojson) "attachedDiskMapping") _list path;
    instance_names = value_for_key (string_list_of_yojson) "instanceNames" _list path;
    
  }
  in _res

let create_instances_result_of_yojson = 
  fun tree path : create_instances_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_instances_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let create_instances_request_of_yojson = 
  fun tree path : create_instances_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_instances_request = {
    ip_address_type = option_of_yojson (value_for_key (ip_address_type_of_yojson) "ipAddressType") _list path;
    add_ons = option_of_yojson (value_for_key (add_on_request_list_of_yojson) "addOns") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    key_pair_name = option_of_yojson (value_for_key (resource_name_of_yojson) "keyPairName") _list path;
    user_data = option_of_yojson (value_for_key (string__of_yojson) "userData") _list path;
    bundle_id = value_for_key (non_empty_string_of_yojson) "bundleId" _list path;
    blueprint_id = value_for_key (non_empty_string_of_yojson) "blueprintId" _list path;
    custom_image_name = option_of_yojson (value_for_key (resource_name_of_yojson) "customImageName") _list path;
    availability_zone = value_for_key (string__of_yojson) "availabilityZone" _list path;
    instance_names = value_for_key (string_list_of_yojson) "instanceNames" _list path;
    
  }
  in _res

let create_gui_session_access_details_result_of_yojson = 
  fun tree path : create_gui_session_access_details_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_gui_session_access_details_result = {
    sessions = option_of_yojson (value_for_key (sessions_of_yojson) "sessions") _list path;
    failure_reason = option_of_yojson (value_for_key (string__of_yojson) "failureReason") _list path;
    percentage_complete = option_of_yojson (value_for_key (integer__of_yojson) "percentageComplete") _list path;
    status = option_of_yojson (value_for_key (status_of_yojson) "status") _list path;
    resource_name = option_of_yojson (value_for_key (resource_name_of_yojson) "resourceName") _list path;
    
  }
  in _res

let create_gui_session_access_details_request_of_yojson = 
  fun tree path : create_gui_session_access_details_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_gui_session_access_details_request = {
    resource_name = value_for_key (resource_name_of_yojson) "resourceName" _list path;
    
  }
  in _res

let create_domain_entry_result_of_yojson = 
  fun tree path : create_domain_entry_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_domain_entry_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let create_domain_entry_request_of_yojson = 
  fun tree path : create_domain_entry_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_domain_entry_request = {
    domain_entry = value_for_key (domain_entry_of_yojson) "domainEntry" _list path;
    domain_name = value_for_key (domain_name_of_yojson) "domainName" _list path;
    
  }
  in _res

let create_domain_result_of_yojson = 
  fun tree path : create_domain_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_domain_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let create_domain_request_of_yojson = 
  fun tree path : create_domain_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_domain_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    domain_name = value_for_key (domain_name_of_yojson) "domainName" _list path;
    
  }
  in _res

let create_distribution_result_of_yojson = 
  fun tree path : create_distribution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_distribution_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    distribution = option_of_yojson (value_for_key (lightsail_distribution_of_yojson) "distribution") _list path;
    
  }
  in _res

let create_distribution_request_of_yojson = 
  fun tree path : create_distribution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_distribution_request = {
    viewer_minimum_tls_protocol_version = option_of_yojson (value_for_key (viewer_minimum_tls_protocol_version_enum_of_yojson) "viewerMinimumTlsProtocolVersion") _list path;
    certificate_name = option_of_yojson (value_for_key (resource_name_of_yojson) "certificateName") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    ip_address_type = option_of_yojson (value_for_key (ip_address_type_of_yojson) "ipAddressType") _list path;
    bundle_id = value_for_key (string__of_yojson) "bundleId" _list path;
    cache_behaviors = option_of_yojson (value_for_key (cache_behavior_list_of_yojson) "cacheBehaviors") _list path;
    cache_behavior_settings = option_of_yojson (value_for_key (cache_settings_of_yojson) "cacheBehaviorSettings") _list path;
    default_cache_behavior = value_for_key (cache_behavior_of_yojson) "defaultCacheBehavior" _list path;
    origin = value_for_key (input_origin_of_yojson) "origin" _list path;
    distribution_name = value_for_key (resource_name_of_yojson) "distributionName" _list path;
    
  }
  in _res

let create_disk_snapshot_result_of_yojson = 
  fun tree path : create_disk_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_disk_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let create_disk_snapshot_request_of_yojson = 
  fun tree path : create_disk_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_disk_snapshot_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    instance_name = option_of_yojson (value_for_key (resource_name_of_yojson) "instanceName") _list path;
    disk_snapshot_name = value_for_key (resource_name_of_yojson) "diskSnapshotName" _list path;
    disk_name = option_of_yojson (value_for_key (resource_name_of_yojson) "diskName") _list path;
    
  }
  in _res

let create_disk_from_snapshot_result_of_yojson = 
  fun tree path : create_disk_from_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_disk_from_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let create_disk_from_snapshot_request_of_yojson = 
  fun tree path : create_disk_from_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_disk_from_snapshot_request = {
    use_latest_restorable_auto_snapshot = option_of_yojson (value_for_key (boolean__of_yojson) "useLatestRestorableAutoSnapshot") _list path;
    restore_date = option_of_yojson (value_for_key (string__of_yojson) "restoreDate") _list path;
    source_disk_name = option_of_yojson (value_for_key (string__of_yojson) "sourceDiskName") _list path;
    add_ons = option_of_yojson (value_for_key (add_on_request_list_of_yojson) "addOns") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    size_in_gb = value_for_key (integer__of_yojson) "sizeInGb" _list path;
    availability_zone = value_for_key (non_empty_string_of_yojson) "availabilityZone" _list path;
    disk_snapshot_name = option_of_yojson (value_for_key (resource_name_of_yojson) "diskSnapshotName") _list path;
    disk_name = value_for_key (resource_name_of_yojson) "diskName" _list path;
    
  }
  in _res

let create_disk_result_of_yojson = 
  fun tree path : create_disk_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_disk_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let create_disk_request_of_yojson = 
  fun tree path : create_disk_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_disk_request = {
    add_ons = option_of_yojson (value_for_key (add_on_request_list_of_yojson) "addOns") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    size_in_gb = value_for_key (integer__of_yojson) "sizeInGb" _list path;
    availability_zone = value_for_key (non_empty_string_of_yojson) "availabilityZone" _list path;
    disk_name = value_for_key (resource_name_of_yojson) "diskName" _list path;
    
  }
  in _res

let container_service_registry_login_of_yojson = 
  fun tree path : container_service_registry_login ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service_registry_login = {
    registry = option_of_yojson (value_for_key (string__of_yojson) "registry") _list path;
    expires_at = option_of_yojson (value_for_key (iso_date_of_yojson) "expiresAt") _list path;
    password = option_of_yojson (value_for_key (string__of_yojson) "password") _list path;
    username = option_of_yojson (value_for_key (string__of_yojson) "username") _list path;
    
  }
  in _res

let create_container_service_registry_login_result_of_yojson = 
  fun tree path : create_container_service_registry_login_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_container_service_registry_login_result = {
    registry_login = option_of_yojson (value_for_key (container_service_registry_login_of_yojson) "registryLogin") _list path;
    
  }
  in _res

let create_container_service_registry_login_request_of_yojson = 
  fun tree path : create_container_service_registry_login_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_container_service_registry_login_request = ()
  in _res

let create_container_service_deployment_result_of_yojson = 
  fun tree path : create_container_service_deployment_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_container_service_deployment_result = {
    container_service = option_of_yojson (value_for_key (container_service_of_yojson) "containerService") _list path;
    
  }
  in _res

let endpoint_request_of_yojson = 
  fun tree path : endpoint_request ->
  let _list = assoc_of_yojson tree path in
  let _res : endpoint_request = {
    health_check = option_of_yojson (value_for_key (container_service_health_check_config_of_yojson) "healthCheck") _list path;
    container_port = value_for_key (integer__of_yojson) "containerPort" _list path;
    container_name = value_for_key (string__of_yojson) "containerName" _list path;
    
  }
  in _res

let create_container_service_deployment_request_of_yojson = 
  fun tree path : create_container_service_deployment_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_container_service_deployment_request = {
    public_endpoint = option_of_yojson (value_for_key (endpoint_request_of_yojson) "publicEndpoint") _list path;
    containers = option_of_yojson (value_for_key (container_map_of_yojson) "containers") _list path;
    service_name = value_for_key (container_service_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let create_container_service_result_of_yojson = 
  fun tree path : create_container_service_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_container_service_result = {
    container_service = option_of_yojson (value_for_key (container_service_of_yojson) "containerService") _list path;
    
  }
  in _res

let container_service_deployment_request_of_yojson = 
  fun tree path : container_service_deployment_request ->
  let _list = assoc_of_yojson tree path in
  let _res : container_service_deployment_request = {
    public_endpoint = option_of_yojson (value_for_key (endpoint_request_of_yojson) "publicEndpoint") _list path;
    containers = option_of_yojson (value_for_key (container_map_of_yojson) "containers") _list path;
    
  }
  in _res

let create_container_service_request_of_yojson = 
  fun tree path : create_container_service_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_container_service_request = {
    private_registry_access = option_of_yojson (value_for_key (private_registry_access_request_of_yojson) "privateRegistryAccess") _list path;
    deployment = option_of_yojson (value_for_key (container_service_deployment_request_of_yojson) "deployment") _list path;
    public_domain_names = option_of_yojson (value_for_key (container_service_public_domains_of_yojson) "publicDomainNames") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    scale = value_for_key (container_service_scale_of_yojson) "scale" _list path;
    power = value_for_key (container_service_power_name_of_yojson) "power" _list path;
    service_name = value_for_key (container_service_name_of_yojson) "serviceName" _list path;
    
  }
  in _res

let create_contact_method_result_of_yojson = 
  fun tree path : create_contact_method_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_contact_method_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let create_contact_method_request_of_yojson = 
  fun tree path : create_contact_method_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_contact_method_request = {
    contact_endpoint = value_for_key (string_max256_of_yojson) "contactEndpoint" _list path;
    protocol = value_for_key (contact_protocol_of_yojson) "protocol" _list path;
    
  }
  in _res

let create_cloud_formation_stack_result_of_yojson = 
  fun tree path : create_cloud_formation_stack_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_cloud_formation_stack_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let instance_entry_of_yojson = 
  fun tree path : instance_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : instance_entry = {
    availability_zone = value_for_key (string__of_yojson) "availabilityZone" _list path;
    user_data = option_of_yojson (value_for_key (string__of_yojson) "userData") _list path;
    port_info_source = value_for_key (port_info_source_type_of_yojson) "portInfoSource" _list path;
    instance_type = value_for_key (non_empty_string_of_yojson) "instanceType" _list path;
    source_name = value_for_key (resource_name_of_yojson) "sourceName" _list path;
    
  }
  in _res

let instance_entry_list_of_yojson = 
  fun tree path -> list_of_yojson instance_entry_of_yojson tree path 

let create_cloud_formation_stack_request_of_yojson = 
  fun tree path : create_cloud_formation_stack_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_cloud_formation_stack_request = {
    instances = value_for_key (instance_entry_list_of_yojson) "instances" _list path;
    
  }
  in _res

let create_certificate_result_of_yojson = 
  fun tree path : create_certificate_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_certificate_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    certificate = option_of_yojson (value_for_key (certificate_summary_of_yojson) "certificate") _list path;
    
  }
  in _res

let create_certificate_request_of_yojson = 
  fun tree path : create_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_certificate_request = {
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    subject_alternative_names = option_of_yojson (value_for_key (subject_alternative_name_list_of_yojson) "subjectAlternativeNames") _list path;
    domain_name = value_for_key (domain_name_of_yojson) "domainName" _list path;
    certificate_name = value_for_key (certificate_name_of_yojson) "certificateName" _list path;
    
  }
  in _res

let create_bucket_access_key_result_of_yojson = 
  fun tree path : create_bucket_access_key_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_bucket_access_key_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    access_key = option_of_yojson (value_for_key (access_key_of_yojson) "accessKey") _list path;
    
  }
  in _res

let create_bucket_access_key_request_of_yojson = 
  fun tree path : create_bucket_access_key_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_bucket_access_key_request = {
    bucket_name = value_for_key (bucket_name_of_yojson) "bucketName" _list path;
    
  }
  in _res

let create_bucket_result_of_yojson = 
  fun tree path : create_bucket_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_bucket_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    bucket = option_of_yojson (value_for_key (bucket_of_yojson) "bucket") _list path;
    
  }
  in _res

let create_bucket_request_of_yojson = 
  fun tree path : create_bucket_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_bucket_request = {
    enable_object_versioning = option_of_yojson (value_for_key (boolean__of_yojson) "enableObjectVersioning") _list path;
    tags = option_of_yojson (value_for_key (tag_list_of_yojson) "tags") _list path;
    bundle_id = value_for_key (non_empty_string_of_yojson) "bundleId" _list path;
    bucket_name = value_for_key (bucket_name_of_yojson) "bucketName" _list path;
    
  }
  in _res

let copy_snapshot_result_of_yojson = 
  fun tree path : copy_snapshot_result ->
  let _list = assoc_of_yojson tree path in
  let _res : copy_snapshot_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let copy_snapshot_request_of_yojson = 
  fun tree path : copy_snapshot_request ->
  let _list = assoc_of_yojson tree path in
  let _res : copy_snapshot_request = {
    source_region = value_for_key (region_name_of_yojson) "sourceRegion" _list path;
    target_snapshot_name = value_for_key (resource_name_of_yojson) "targetSnapshotName" _list path;
    use_latest_restorable_auto_snapshot = option_of_yojson (value_for_key (boolean__of_yojson) "useLatestRestorableAutoSnapshot") _list path;
    restore_date = option_of_yojson (value_for_key (string__of_yojson) "restoreDate") _list path;
    source_resource_name = option_of_yojson (value_for_key (string__of_yojson) "sourceResourceName") _list path;
    source_snapshot_name = option_of_yojson (value_for_key (resource_name_of_yojson) "sourceSnapshotName") _list path;
    
  }
  in _res

let close_instance_public_ports_result_of_yojson = 
  fun tree path : close_instance_public_ports_result ->
  let _list = assoc_of_yojson tree path in
  let _res : close_instance_public_ports_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let close_instance_public_ports_request_of_yojson = 
  fun tree path : close_instance_public_ports_request ->
  let _list = assoc_of_yojson tree path in
  let _res : close_instance_public_ports_request = {
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    port_info = value_for_key (port_info_of_yojson) "portInfo" _list path;
    
  }
  in _res

let attach_static_ip_result_of_yojson = 
  fun tree path : attach_static_ip_result ->
  let _list = assoc_of_yojson tree path in
  let _res : attach_static_ip_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let attach_static_ip_request_of_yojson = 
  fun tree path : attach_static_ip_request ->
  let _list = assoc_of_yojson tree path in
  let _res : attach_static_ip_request = {
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    static_ip_name = value_for_key (resource_name_of_yojson) "staticIpName" _list path;
    
  }
  in _res

let attach_load_balancer_tls_certificate_result_of_yojson = 
  fun tree path : attach_load_balancer_tls_certificate_result ->
  let _list = assoc_of_yojson tree path in
  let _res : attach_load_balancer_tls_certificate_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let attach_load_balancer_tls_certificate_request_of_yojson = 
  fun tree path : attach_load_balancer_tls_certificate_request ->
  let _list = assoc_of_yojson tree path in
  let _res : attach_load_balancer_tls_certificate_request = {
    certificate_name = value_for_key (resource_name_of_yojson) "certificateName" _list path;
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let attach_instances_to_load_balancer_result_of_yojson = 
  fun tree path : attach_instances_to_load_balancer_result ->
  let _list = assoc_of_yojson tree path in
  let _res : attach_instances_to_load_balancer_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let attach_instances_to_load_balancer_request_of_yojson = 
  fun tree path : attach_instances_to_load_balancer_request ->
  let _list = assoc_of_yojson tree path in
  let _res : attach_instances_to_load_balancer_request = {
    instance_names = value_for_key (resource_name_list_of_yojson) "instanceNames" _list path;
    load_balancer_name = value_for_key (resource_name_of_yojson) "loadBalancerName" _list path;
    
  }
  in _res

let attach_disk_result_of_yojson = 
  fun tree path : attach_disk_result ->
  let _list = assoc_of_yojson tree path in
  let _res : attach_disk_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let attach_disk_request_of_yojson = 
  fun tree path : attach_disk_request ->
  let _list = assoc_of_yojson tree path in
  let _res : attach_disk_request = {
    auto_mounting = option_of_yojson (value_for_key (boolean__of_yojson) "autoMounting") _list path;
    disk_path = value_for_key (non_empty_string_of_yojson) "diskPath" _list path;
    instance_name = value_for_key (resource_name_of_yojson) "instanceName" _list path;
    disk_name = value_for_key (resource_name_of_yojson) "diskName" _list path;
    
  }
  in _res

let attach_certificate_to_distribution_result_of_yojson = 
  fun tree path : attach_certificate_to_distribution_result ->
  let _list = assoc_of_yojson tree path in
  let _res : attach_certificate_to_distribution_result = {
    operation = option_of_yojson (value_for_key (operation_of_yojson) "operation") _list path;
    
  }
  in _res

let attach_certificate_to_distribution_request_of_yojson = 
  fun tree path : attach_certificate_to_distribution_request ->
  let _list = assoc_of_yojson tree path in
  let _res : attach_certificate_to_distribution_request = {
    certificate_name = value_for_key (resource_name_of_yojson) "certificateName" _list path;
    distribution_name = value_for_key (resource_name_of_yojson) "distributionName" _list path;
    
  }
  in _res

let allocate_static_ip_result_of_yojson = 
  fun tree path : allocate_static_ip_result ->
  let _list = assoc_of_yojson tree path in
  let _res : allocate_static_ip_result = {
    operations = option_of_yojson (value_for_key (operation_list_of_yojson) "operations") _list path;
    
  }
  in _res

let allocate_static_ip_request_of_yojson = 
  fun tree path : allocate_static_ip_request ->
  let _list = assoc_of_yojson tree path in
  let _res : allocate_static_ip_request = {
    static_ip_name = value_for_key (resource_name_of_yojson) "staticIpName" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

