open Smaws_Lib.Json.SerializeHelpers

open Types

let timestamp__to_yojson = timestamp_to_yojson

let string__to_yojson = string_to_yojson

let non_empty_string_to_yojson = string_to_yojson

let resource_name_to_yojson = string_to_yojson

let setup_domain_name_to_yojson = string_to_yojson

let setup_domain_name_list_to_yojson = 
  fun tree -> list_to_yojson setup_domain_name_to_yojson tree

let base_unit_to_yojson = unit_to_yojson

let certificate_provider_to_yojson = 
  fun (x: certificate_provider) -> match x with 
  | LetsEncrypt -> `String "LetsEncrypt"
     

let setup_request_to_yojson = 
  fun (x: setup_request) -> assoc_to_yojson(
    [(
         "certificateProvider",
         (option_to_yojson certificate_provider_to_yojson x.certificate_provider));
       (
         "domainNames",
         (option_to_yojson setup_domain_name_list_to_yojson x.domain_names));
       (
         "instanceName",
         (option_to_yojson resource_name_to_yojson x.instance_name));
       
  ])

let iso_date_to_yojson = timestamp_to_yojson

let region_name_to_yojson = 
  fun (x: region_name) -> match x with 
 
| EU_NORTH_1 -> `String "eu-north-1"
  | AP_NORTHEAST_2 -> `String "ap-northeast-2"
  | AP_NORTHEAST_1 -> `String "ap-northeast-1"
  | AP_SOUTHEAST_2 -> `String "ap-southeast-2"
  | AP_SOUTHEAST_1 -> `String "ap-southeast-1"
  | AP_SOUTH_1 -> `String "ap-south-1"
  | CA_CENTRAL_1 -> `String "ca-central-1"
  | EU_CENTRAL_1 -> `String "eu-central-1"
  | EU_WEST_3 -> `String "eu-west-3"
  | EU_WEST_2 -> `String "eu-west-2"
  | EU_WEST_1 -> `String "eu-west-1"
  | US_WEST_2 -> `String "us-west-2"
  | US_WEST_1 -> `String "us-west-1"
  | US_EAST_2 -> `String "us-east-2"
  | US_EAST_1 -> `String "us-east-1"
   

let resource_location_to_yojson = 
  fun (x: resource_location) -> assoc_to_yojson(
    [(
         "regionName",
         (option_to_yojson region_name_to_yojson x.region_name));
       (
         "availabilityZone",
         (option_to_yojson string__to_yojson x.availability_zone));
       
  ])

let resource_type_to_yojson = 
  fun (x: resource_type) -> match x with 
 
| Bucket -> `String "Bucket"
  | Certificate -> `String "Certificate"
  | Distribution -> `String "Distribution"
  | ContactMethod -> `String "ContactMethod"
  | Alarm -> `String "Alarm"
  | CloudFormationStackRecord -> `String "CloudFormationStackRecord"
  | ExportSnapshotRecord -> `String "ExportSnapshotRecord"
  | RelationalDatabaseSnapshot -> `String "RelationalDatabaseSnapshot"
  | RelationalDatabase -> `String "RelationalDatabase"
  | DiskSnapshot -> `String "DiskSnapshot"
  | Disk -> `String "Disk"
  | LoadBalancerTlsCertificate -> `String "LoadBalancerTlsCertificate"
  | LoadBalancer -> `String "LoadBalancer"
  | PeeredVpc -> `String "PeeredVpc"
  | Domain -> `String "Domain"
  | InstanceSnapshot -> `String "InstanceSnapshot"
  | KeyPair -> `String "KeyPair"
  | StaticIp -> `String "StaticIp"
  | Instance -> `String "Instance"
  | ContainerService -> `String "ContainerService"
   

let setup_history_resource_to_yojson = 
  fun (x: setup_history_resource) -> assoc_to_yojson(
    [(
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let setup_status_to_yojson = 
  fun (x: setup_status) -> match x with 
 
| InProgress -> `String "inProgress"
  | Failed -> `String "failed"
  | Succeeded -> `String "succeeded"
   

let setup_execution_details_to_yojson = 
  fun (x: setup_execution_details) -> assoc_to_yojson(
    [(
         "version",
         (option_to_yojson string__to_yojson x.version));
       (
         "standardOutput",
         (option_to_yojson string__to_yojson x.standard_output));
       (
         "standardError",
         (option_to_yojson string__to_yojson x.standard_error));
       (
         "status",
         (option_to_yojson setup_status_to_yojson x.status));
       (
         "name",
         (option_to_yojson non_empty_string_to_yojson x.name));
       (
         "dateTime",
         (option_to_yojson iso_date_to_yojson x.date_time));
       (
         "command",
         (option_to_yojson string__to_yojson x.command));
       
  ])

let setup_execution_details_list_to_yojson = 
  fun tree -> list_to_yojson setup_execution_details_to_yojson tree

let setup_history_to_yojson = 
  fun (x: setup_history) -> assoc_to_yojson(
    [(
         "status",
         (option_to_yojson setup_status_to_yojson x.status));
       (
         "executionDetails",
         (option_to_yojson setup_execution_details_list_to_yojson x.execution_details));
       (
         "resource",
         (option_to_yojson setup_history_resource_to_yojson x.resource));
       (
         "request",
         (option_to_yojson setup_request_to_yojson x.request));
       (
         "operationId",
         (option_to_yojson non_empty_string_to_yojson x.operation_id));
       
  ])

let setup_history_list_to_yojson = 
  fun tree -> list_to_yojson setup_history_to_yojson tree

let long_to_yojson = long_to_yojson

let integer__to_yojson = int_to_yojson

let float__to_yojson = float_to_yojson

let double_to_yojson = double_to_yojson

let boolean__to_yojson = bool_to_yojson

let viewer_minimum_tls_protocol_version_enum_to_yojson = 
  fun (x: viewer_minimum_tls_protocol_version_enum) -> match x with 
 
| TLSv12_2021 -> `String "TLSv1.2_2021"
  | TLSv12_2019 -> `String "TLSv1.2_2019"
  | TLSv12_2018 -> `String "TLSv1.2_2018"
  | TLSv11_2016 -> `String "TLSv1.1_2016"
   

let operation_type_to_yojson = 
  fun (x: operation_type) -> match x with 
 
| SetupInstanceHttps -> `String "SetupInstanceHttps"
  | StopGUISession -> `String "StopGUISession"
  | StartGUISession -> `String "StartGUISession"
  | UpdateInstanceMetadataOptions -> `String "UpdateInstanceMetadataOptions"
  | SetResourceAccessForBucket -> `String "SetResourceAccessForBucket"
  | UpdateBucket -> `String "UpdateBucket"
  | UpdateBucketBundle -> `String "UpdateBucketBundle"
  | DeleteBucketAccessKey -> `String "DeleteBucketAccessKey"
  | CreateBucketAccessKey -> `String "CreateBucketAccessKey"
  | DeleteBucket -> `String "DeleteBucket"
  | CreateBucket -> `String "CreateBucket"
  | DeleteContainerImage -> `String "DeleteContainerImage"
  | RegisterContainerImage -> `String "RegisterContainerImage"
  | CreateContainerServiceRegistryLogin -> `String "CreateContainerServiceRegistryLogin"
  | CreateContainerServiceDeployment -> `String "CreateContainerServiceDeployment"
  | DeleteContainerService -> `String "DeleteContainerService"
  | UpdateContainerService -> `String "UpdateContainerService"
  | CreateContainerService -> `String "CreateContainerService"
  | DeleteCertificate -> `String "DeleteCertificate"
  | CreateCertificate -> `String "CreateCertificate"
  | SetIpAddressType -> `String "SetIpAddressType"
  | UpdateDistributionBundle -> `String "UpdateDistributionBundle"
  | DetachCertificateFromDistribution -> `String "DetachCertificateFromDistribution"
  | AttachCertificateToDistribution -> `String "AttachCertificateToDistribution"
  | ResetDistributionCache -> `String "ResetDistributionCache"
  | DeleteDistribution -> `String "DeleteDistribution"
  | UpdateDistribution -> `String "UpdateDistribution"
  | CreateDistribution -> `String "CreateDistribution"
  | DeleteContactMethod -> `String "DeleteContactMethod"
  | SendContactMethodVerification -> `String "SendContactMethodVerification"
  | GetContactMethods -> `String "GetContactMethods"
  | CreateContactMethod -> `String "CreateContactMethod"
  | TestAlarm -> `String "TestAlarm"
  | DeleteAlarm -> `String "DeleteAlarm"
  | GetAlarms -> `String "GetAlarms"
  | PutAlarm -> `String "PutAlarm"
  | DisableAddOn -> `String "DisableAddOn"
  | EnableAddOn -> `String "EnableAddOn"
  | StopRelationalDatabase -> `String "StopRelationalDatabase"
  | RebootRelationalDatabase -> `String "RebootRelationalDatabase"
  | StartRelationalDatabase -> `String "StartRelationalDatabase"
  | UpdateRelationalDatabaseParameters -> `String "UpdateRelationalDatabaseParameters"
  | DeleteRelationalDatabaseSnapshot -> `String "DeleteRelationalDatabaseSnapshot"
  | CreateRelationalDatabaseSnapshot -> `String "CreateRelationalDatabaseSnapshot"
  | CreateRelationalDatabaseFromSnapshot -> `String "CreateRelationalDatabaseFromSnapshot"
  | DeleteRelationalDatabase -> `String "DeleteRelationalDatabase"
  | UpdateRelationalDatabase -> `String "UpdateRelationalDatabase"
  | CreateRelationalDatabase -> `String "CreateRelationalDatabase"
  | CreateDiskFromSnapshot -> `String "CreateDiskFromSnapshot"
  | DeleteDiskSnapshot -> `String "DeleteDiskSnapshot"
  | CreateDiskSnapshot -> `String "CreateDiskSnapshot"
  | DetachDisk -> `String "DetachDisk"
  | AttachDisk -> `String "AttachDisk"
  | DeleteDisk -> `String "DeleteDisk"
  | CreateDisk -> `String "CreateDisk"
  | AttachLoadBalancerTlsCertificate -> `String "AttachLoadBalancerTlsCertificate"
  | DeleteLoadBalancerTlsCertificate -> `String "DeleteLoadBalancerTlsCertificate"
  | CreateLoadBalancerTlsCertificate -> `String "CreateLoadBalancerTlsCertificate"
  | UpdateLoadBalancerAttribute -> `String "UpdateLoadBalancerAttribute"
  | DetachInstancesFromLoadBalancer -> `String "DetachInstancesFromLoadBalancer"
  | AttachInstancesToLoadBalancer -> `String "AttachInstancesToLoadBalancer"
  | DeleteLoadBalancer -> `String "DeleteLoadBalancer"
  | CreateLoadBalancer -> `String "CreateLoadBalancer"
  | CreateInstancesFromSnapshot -> `String "CreateInstancesFromSnapshot"
  | DeleteInstanceSnapshot -> `String "DeleteInstanceSnapshot"
  | CreateInstanceSnapshot -> `String "CreateInstanceSnapshot"
  | DeleteDomain -> `String "DeleteDomain"
  | CreateDomain -> `String "CreateDomain"
  | DeleteDomainEntry -> `String "DeleteDomainEntry"
  | UpdateDomainEntry -> `String "UpdateDomainEntry"
  | DetachStaticIp -> `String "DetachStaticIp"
  | AttachStaticIp -> `String "AttachStaticIp"
  | ReleaseStaticIp -> `String "ReleaseStaticIp"
  | AllocateStaticIp -> `String "AllocateStaticIp"
  | CloseInstancePublicPorts -> `String "CloseInstancePublicPorts"
  | PutInstancePublicPorts -> `String "PutInstancePublicPorts"
  | OpenInstancePublicPorts -> `String "OpenInstancePublicPorts"
  | RebootInstance -> `String "RebootInstance"
  | StartInstance -> `String "StartInstance"
  | StopInstance -> `String "StopInstance"
  | CreateInstance -> `String "CreateInstance"
  | DeleteInstance -> `String "DeleteInstance"
  | DeleteKnownHostKeys -> `String "DeleteKnownHostKeys"
   

let operation_status_to_yojson = 
  fun (x: operation_status) -> match x with 
 
| Succeeded -> `String "Succeeded"
  | Completed -> `String "Completed"
  | Failed -> `String "Failed"
  | Started -> `String "Started"
  | NotStarted -> `String "NotStarted"
   

let operation_to_yojson = 
  fun (x: operation) -> assoc_to_yojson(
    [(
         "errorDetails",
         (option_to_yojson string__to_yojson x.error_details));
       (
         "errorCode",
         (option_to_yojson string__to_yojson x.error_code));
       (
         "statusChangedAt",
         (option_to_yojson iso_date_to_yojson x.status_changed_at));
       (
         "status",
         (option_to_yojson operation_status_to_yojson x.status));
       (
         "operationType",
         (option_to_yojson operation_type_to_yojson x.operation_type));
       (
         "operationDetails",
         (option_to_yojson string__to_yojson x.operation_details));
       (
         "isTerminal",
         (option_to_yojson boolean__to_yojson x.is_terminal));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "resourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       (
         "id",
         (option_to_yojson non_empty_string_to_yojson x.id));
       
  ])

let operation_list_to_yojson = 
  fun tree -> list_to_yojson operation_to_yojson tree

let update_relational_database_result_to_yojson = 
  fun (x: update_relational_database_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let sensitive_string_to_yojson = string_to_yojson

let update_relational_database_request_to_yojson = 
  fun (x: update_relational_database_request) -> assoc_to_yojson(
    [(
         "relationalDatabaseBlueprintId",
         (option_to_yojson string__to_yojson x.relational_database_blueprint_id));
       (
         "caCertificateIdentifier",
         (option_to_yojson string__to_yojson x.ca_certificate_identifier));
       (
         "applyImmediately",
         (option_to_yojson boolean__to_yojson x.apply_immediately));
       (
         "publiclyAccessible",
         (option_to_yojson boolean__to_yojson x.publicly_accessible));
       (
         "disableBackupRetention",
         (option_to_yojson boolean__to_yojson x.disable_backup_retention));
       (
         "enableBackupRetention",
         (option_to_yojson boolean__to_yojson x.enable_backup_retention));
       (
         "preferredMaintenanceWindow",
         (option_to_yojson string__to_yojson x.preferred_maintenance_window));
       (
         "preferredBackupWindow",
         (option_to_yojson string__to_yojson x.preferred_backup_window));
       (
         "rotateMasterUserPassword",
         (option_to_yojson boolean__to_yojson x.rotate_master_user_password));
       (
         "masterUserPassword",
         (option_to_yojson sensitive_string_to_yojson x.master_user_password));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let update_relational_database_parameters_result_to_yojson = 
  fun (x: update_relational_database_parameters_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let relational_database_parameter_to_yojson = 
  fun (x: relational_database_parameter) -> assoc_to_yojson(
    [(
         "parameterValue",
         (option_to_yojson string__to_yojson x.parameter_value));
       (
         "parameterName",
         (option_to_yojson string__to_yojson x.parameter_name));
       (
         "isModifiable",
         (option_to_yojson boolean__to_yojson x.is_modifiable));
       (
         "description",
         (option_to_yojson string__to_yojson x.description));
       (
         "dataType",
         (option_to_yojson string__to_yojson x.data_type));
       (
         "applyType",
         (option_to_yojson string__to_yojson x.apply_type));
       (
         "applyMethod",
         (option_to_yojson string__to_yojson x.apply_method));
       (
         "allowedValues",
         (option_to_yojson string__to_yojson x.allowed_values));
       
  ])

let relational_database_parameter_list_to_yojson = 
  fun tree -> list_to_yojson relational_database_parameter_to_yojson tree

let update_relational_database_parameters_request_to_yojson = 
  fun (x: update_relational_database_parameters_request) -> assoc_to_yojson(
    [(
         "parameters",
         (Some (relational_database_parameter_list_to_yojson x.parameters)));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let unauthenticated_exception_to_yojson = 
  fun (x: unauthenticated_exception) -> assoc_to_yojson(
    [(
         "tip",
         (option_to_yojson string__to_yojson x.tip));
       (
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "docs",
         (option_to_yojson string__to_yojson x.docs));
       (
         "code",
         (option_to_yojson string__to_yojson x.code));
       
  ])

let service_exception_to_yojson = 
  fun (x: service_exception) -> assoc_to_yojson(
    [(
         "tip",
         (option_to_yojson string__to_yojson x.tip));
       (
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "docs",
         (option_to_yojson string__to_yojson x.docs));
       (
         "code",
         (option_to_yojson string__to_yojson x.code));
       
  ])

let operation_failure_exception_to_yojson = 
  fun (x: operation_failure_exception) -> assoc_to_yojson(
    [(
         "tip",
         (option_to_yojson string__to_yojson x.tip));
       (
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "docs",
         (option_to_yojson string__to_yojson x.docs));
       (
         "code",
         (option_to_yojson string__to_yojson x.code));
       
  ])

let not_found_exception_to_yojson = 
  fun (x: not_found_exception) -> assoc_to_yojson(
    [(
         "tip",
         (option_to_yojson string__to_yojson x.tip));
       (
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "docs",
         (option_to_yojson string__to_yojson x.docs));
       (
         "code",
         (option_to_yojson string__to_yojson x.code));
       
  ])

let invalid_input_exception_to_yojson = 
  fun (x: invalid_input_exception) -> assoc_to_yojson(
    [(
         "tip",
         (option_to_yojson string__to_yojson x.tip));
       (
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "docs",
         (option_to_yojson string__to_yojson x.docs));
       (
         "code",
         (option_to_yojson string__to_yojson x.code));
       
  ])

let account_setup_in_progress_exception_to_yojson = 
  fun (x: account_setup_in_progress_exception) -> assoc_to_yojson(
    [(
         "tip",
         (option_to_yojson string__to_yojson x.tip));
       (
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "docs",
         (option_to_yojson string__to_yojson x.docs));
       (
         "code",
         (option_to_yojson string__to_yojson x.code));
       
  ])

let access_denied_exception_to_yojson = 
  fun (x: access_denied_exception) -> assoc_to_yojson(
    [(
         "tip",
         (option_to_yojson string__to_yojson x.tip));
       (
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "docs",
         (option_to_yojson string__to_yojson x.docs));
       (
         "code",
         (option_to_yojson string__to_yojson x.code));
       
  ])

let update_load_balancer_attribute_result_to_yojson = 
  fun (x: update_load_balancer_attribute_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let load_balancer_attribute_name_to_yojson = 
  fun (x: load_balancer_attribute_name) -> match x with 
 
| TlsPolicyName -> `String "TlsPolicyName"
  | HttpsRedirectionEnabled -> `String "HttpsRedirectionEnabled"
  | SessionStickiness_LB_CookieDurationSeconds -> `String "SessionStickiness_LB_CookieDurationSeconds"
  | SessionStickinessEnabled -> `String "SessionStickinessEnabled"
  | HealthCheckPath -> `String "HealthCheckPath"
   

let string_max256_to_yojson = string_to_yojson

let update_load_balancer_attribute_request_to_yojson = 
  fun (x: update_load_balancer_attribute_request) -> assoc_to_yojson(
    [(
         "attributeValue",
         (Some (string_max256_to_yojson x.attribute_value)));
       (
         "attributeName",
         (Some (load_balancer_attribute_name_to_yojson x.attribute_name)));
       (
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let update_instance_metadata_options_result_to_yojson = 
  fun (x: update_instance_metadata_options_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let http_tokens_to_yojson = 
  fun (x: http_tokens) -> match x with 
  | Required -> `String "required"
    | Optional -> `String "optional"
     

let http_endpoint_to_yojson = 
  fun (x: http_endpoint) -> match x with 
  | Enabled -> `String "enabled"
    | Disabled -> `String "disabled"
     

let http_protocol_ipv6_to_yojson = 
  fun (x: http_protocol_ipv6) -> match x with 
  | Enabled -> `String "enabled"
    | Disabled -> `String "disabled"
     

let update_instance_metadata_options_request_to_yojson = 
  fun (x: update_instance_metadata_options_request) -> assoc_to_yojson(
    [(
         "httpProtocolIpv6",
         (option_to_yojson http_protocol_ipv6_to_yojson x.http_protocol_ipv6));
       (
         "httpPutResponseHopLimit",
         (option_to_yojson integer__to_yojson x.http_put_response_hop_limit));
       (
         "httpEndpoint",
         (option_to_yojson http_endpoint_to_yojson x.http_endpoint));
       (
         "httpTokens",
         (option_to_yojson http_tokens_to_yojson x.http_tokens));
       (
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let update_domain_entry_result_to_yojson = 
  fun (x: update_domain_entry_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let domain_name_to_yojson = string_to_yojson

let domain_entry_type_to_yojson = string_to_yojson

let domain_entry_options_keys_to_yojson = string_to_yojson

let domain_entry_options_to_yojson = 
  fun tree -> map_to_yojson string__to_yojson tree

let domain_entry_to_yojson = 
  fun (x: domain_entry) -> assoc_to_yojson(
    [(
         "options",
         (option_to_yojson domain_entry_options_to_yojson x.options));
       (
         "type",
         (option_to_yojson domain_entry_type_to_yojson x.type_));
       (
         "isAlias",
         (option_to_yojson boolean__to_yojson x.is_alias));
       (
         "target",
         (option_to_yojson string__to_yojson x.target));
       (
         "name",
         (option_to_yojson domain_name_to_yojson x.name));
       (
         "id",
         (option_to_yojson non_empty_string_to_yojson x.id));
       
  ])

let update_domain_entry_request_to_yojson = 
  fun (x: update_domain_entry_request) -> assoc_to_yojson(
    [(
         "domainEntry",
         (Some (domain_entry_to_yojson x.domain_entry)));
       (
         "domainName",
         (Some (domain_name_to_yojson x.domain_name)));
       
  ])

let update_distribution_result_to_yojson = 
  fun (x: update_distribution_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let origin_protocol_policy_enum_to_yojson = 
  fun (x: origin_protocol_policy_enum) -> match x with 
  | HTTPSOnly -> `String "https-only"
    | HTTPOnly -> `String "http-only"
     

let input_origin_to_yojson = 
  fun (x: input_origin) -> assoc_to_yojson(
    [(
         "responseTimeout",
         (option_to_yojson integer__to_yojson x.response_timeout));
       (
         "protocolPolicy",
         (option_to_yojson origin_protocol_policy_enum_to_yojson x.protocol_policy));
       (
         "regionName",
         (option_to_yojson region_name_to_yojson x.region_name));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let behavior_enum_to_yojson = 
  fun (x: behavior_enum) -> match x with 
 
| CacheSetting -> `String "cache"
  | DontCacheSetting -> `String "dont-cache"
   

let cache_behavior_to_yojson = 
  fun (x: cache_behavior) -> assoc_to_yojson(
    [(
         "behavior",
         (option_to_yojson behavior_enum_to_yojson x.behavior));
       
  ])

let forward_values_to_yojson = 
  fun (x: forward_values) -> match x with 
 
| All -> `String "all"
  | AllowList -> `String "allow-list"
  | None -> `String "none"
   

let string_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let cookie_object_to_yojson = 
  fun (x: cookie_object) -> assoc_to_yojson(
    [(
         "cookiesAllowList",
         (option_to_yojson string_list_to_yojson x.cookies_allow_list));
       (
         "option",
         (option_to_yojson forward_values_to_yojson x.option_));
       
  ])

let header_enum_to_yojson = 
  fun (x: header_enum) -> match x with 
 
| Referer -> `String "Referer"
  | Origin -> `String "Origin"
  | Host -> `String "Host"
  | CloudFrontViewerCountry -> `String "CloudFront-Viewer-Country"
  | CloudFrontIsTabletViewer -> `String "CloudFront-Is-Tablet-Viewer"
  | CloudFrontIsSmartTVViewer -> `String "CloudFront-Is-SmartTV-Viewer"
  | CloudFrontIsMobileViewer -> `String "CloudFront-Is-Mobile-Viewer"
  | CloudFrontIsDesktopViewer -> `String "CloudFront-Is-Desktop-Viewer"
  | CloudFrontForwardedProto -> `String "CloudFront-Forwarded-Proto"
  | Authorization -> `String "Authorization"
  | AcceptLanguage -> `String "Accept-Language"
  | AcceptEncoding -> `String "Accept-Encoding"
  | AcceptDatetime -> `String "Accept-Datetime"
  | AcceptCharset -> `String "Accept-Charset"
  | Accept -> `String "Accept"
   

let header_forward_list_to_yojson = 
  fun tree -> list_to_yojson header_enum_to_yojson tree

let header_object_to_yojson = 
  fun (x: header_object) -> assoc_to_yojson(
    [(
         "headersAllowList",
         (option_to_yojson header_forward_list_to_yojson x.headers_allow_list));
       (
         "option",
         (option_to_yojson forward_values_to_yojson x.option_));
       
  ])

let query_string_object_to_yojson = 
  fun (x: query_string_object) -> assoc_to_yojson(
    [(
         "queryStringsAllowList",
         (option_to_yojson string_list_to_yojson x.query_strings_allow_list));
       (
         "option",
         (option_to_yojson boolean__to_yojson x.option_));
       
  ])

let cache_settings_to_yojson = 
  fun (x: cache_settings) -> assoc_to_yojson(
    [(
         "forwardedQueryStrings",
         (option_to_yojson query_string_object_to_yojson x.forwarded_query_strings));
       (
         "forwardedHeaders",
         (option_to_yojson header_object_to_yojson x.forwarded_headers));
       (
         "forwardedCookies",
         (option_to_yojson cookie_object_to_yojson x.forwarded_cookies));
       (
         "cachedHTTPMethods",
         (option_to_yojson non_empty_string_to_yojson x.cached_http_methods));
       (
         "allowedHTTPMethods",
         (option_to_yojson non_empty_string_to_yojson x.allowed_http_methods));
       (
         "maximumTTL",
         (option_to_yojson long_to_yojson x.maximum_tt_l));
       (
         "minimumTTL",
         (option_to_yojson long_to_yojson x.minimum_tt_l));
       (
         "defaultTTL",
         (option_to_yojson long_to_yojson x.default_tt_l));
       
  ])

let cache_behavior_per_path_to_yojson = 
  fun (x: cache_behavior_per_path) -> assoc_to_yojson(
    [(
         "behavior",
         (option_to_yojson behavior_enum_to_yojson x.behavior));
       (
         "path",
         (option_to_yojson string__to_yojson x.path));
       
  ])

let cache_behavior_list_to_yojson = 
  fun tree -> list_to_yojson cache_behavior_per_path_to_yojson tree

let update_distribution_request_to_yojson = 
  fun (x: update_distribution_request) -> assoc_to_yojson(
    [(
         "useDefaultCertificate",
         (option_to_yojson boolean__to_yojson x.use_default_certificate));
       (
         "certificateName",
         (option_to_yojson resource_name_to_yojson x.certificate_name));
       (
         "viewerMinimumTlsProtocolVersion",
         (option_to_yojson viewer_minimum_tls_protocol_version_enum_to_yojson x.viewer_minimum_tls_protocol_version));
       (
         "isEnabled",
         (option_to_yojson boolean__to_yojson x.is_enabled));
       (
         "cacheBehaviors",
         (option_to_yojson cache_behavior_list_to_yojson x.cache_behaviors));
       (
         "cacheBehaviorSettings",
         (option_to_yojson cache_settings_to_yojson x.cache_behavior_settings));
       (
         "defaultCacheBehavior",
         (option_to_yojson cache_behavior_to_yojson x.default_cache_behavior));
       (
         "origin",
         (option_to_yojson input_origin_to_yojson x.origin));
       (
         "distributionName",
         (Some (resource_name_to_yojson x.distribution_name)));
       
  ])

let update_distribution_bundle_result_to_yojson = 
  fun (x: update_distribution_bundle_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let update_distribution_bundle_request_to_yojson = 
  fun (x: update_distribution_bundle_request) -> assoc_to_yojson(
    [(
         "bundleId",
         (option_to_yojson string__to_yojson x.bundle_id));
       (
         "distributionName",
         (option_to_yojson resource_name_to_yojson x.distribution_name));
       
  ])

let container_service_name_to_yojson = string_to_yojson

let tag_key_to_yojson = string_to_yojson

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson = 
  fun (x: tag) -> assoc_to_yojson(
    [(
         "value",
         (option_to_yojson tag_value_to_yojson x.value));
       (
         "key",
         (option_to_yojson tag_key_to_yojson x.key));
       
  ])

let tag_list_to_yojson = fun tree -> list_to_yojson tag_to_yojson tree

let container_service_power_name_to_yojson = 
  fun (x: container_service_power_name) -> match x with 
 
| Xlarge -> `String "xlarge"
  | Large -> `String "large"
  | Medium -> `String "medium"
  | Small -> `String "small"
  | Micro -> `String "micro"
  | Nano -> `String "nano"
   

let container_service_state_to_yojson = 
  fun (x: container_service_state) -> match x with 
 
| DEPLOYING -> `String "DEPLOYING"
  | DISABLED -> `String "DISABLED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | RUNNING -> `String "RUNNING"
  | READY -> `String "READY"
  | PENDING -> `String "PENDING"
   

let container_service_state_detail_code_to_yojson = 
  fun (x: container_service_state_detail_code) -> match x with 
 
| UNKNOWN_ERROR -> `String "UNKNOWN_ERROR"
  | CERTIFICATE_LIMIT_EXCEEDED -> `String "CERTIFICATE_LIMIT_EXCEEDED"
  | ACTIVATING_DEPLOYMENT -> `String "ACTIVATING_DEPLOYMENT"
  | EVALUATING_HEALTH_CHECK -> `String "EVALUATING_HEALTH_CHECK"
  | CREATING_DEPLOYMENT -> `String "CREATING_DEPLOYMENT"
  | PROVISIONING_SERVICE -> `String "PROVISIONING_SERVICE"
  | PROVISIONING_CERTIFICATE -> `String "PROVISIONING_CERTIFICATE"
  | CREATING_NETWORK_INFRASTRUCTURE -> `String "CREATING_NETWORK_INFRASTRUCTURE"
  | CREATING_SYSTEM_RESOURCES -> `String "CREATING_SYSTEM_RESOURCES"
   

let container_service_state_detail_to_yojson = 
  fun (x: container_service_state_detail) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "code",
         (option_to_yojson container_service_state_detail_code_to_yojson x.code));
       
  ])

let container_service_scale_to_yojson = int_to_yojson

let container_service_deployment_state_to_yojson = 
  fun (x: container_service_deployment_state) -> match x with 
 
| FAILED -> `String "FAILED"
  | INACTIVE -> `String "INACTIVE"
  | ACTIVE -> `String "ACTIVE"
  | ACTIVATING -> `String "ACTIVATING"
   

let environment_to_yojson = 
  fun tree -> map_to_yojson string__to_yojson tree

let container_service_protocol_to_yojson = 
  fun (x: container_service_protocol) -> match x with 
 
| UDP -> `String "UDP"
  | TCP -> `String "TCP"
  | HTTPS -> `String "HTTPS"
  | HTTP -> `String "HTTP"
   

let port_map_to_yojson = 
  fun tree -> map_to_yojson container_service_protocol_to_yojson tree

let container_to_yojson = 
  fun (x: container) -> assoc_to_yojson(
    [(
         "ports",
         (option_to_yojson port_map_to_yojson x.ports));
       (
         "environment",
         (option_to_yojson environment_to_yojson x.environment));
       (
         "command",
         (option_to_yojson string_list_to_yojson x.command));
       (
         "image",
         (option_to_yojson string__to_yojson x.image));
       
  ])

let container_name_to_yojson = string_to_yojson

let container_map_to_yojson = 
  fun tree -> map_to_yojson container_to_yojson tree

let container_service_health_check_config_to_yojson = 
  fun (x: container_service_health_check_config) -> assoc_to_yojson(
    [(
         "successCodes",
         (option_to_yojson string__to_yojson x.success_codes));
       (
         "path",
         (option_to_yojson string__to_yojson x.path));
       (
         "intervalSeconds",
         (option_to_yojson integer__to_yojson x.interval_seconds));
       (
         "timeoutSeconds",
         (option_to_yojson integer__to_yojson x.timeout_seconds));
       (
         "unhealthyThreshold",
         (option_to_yojson integer__to_yojson x.unhealthy_threshold));
       (
         "healthyThreshold",
         (option_to_yojson integer__to_yojson x.healthy_threshold));
       
  ])

let container_service_endpoint_to_yojson = 
  fun (x: container_service_endpoint) -> assoc_to_yojson(
    [(
         "healthCheck",
         (option_to_yojson container_service_health_check_config_to_yojson x.health_check));
       (
         "containerPort",
         (option_to_yojson integer__to_yojson x.container_port));
       (
         "containerName",
         (option_to_yojson string__to_yojson x.container_name));
       
  ])

let container_service_deployment_to_yojson = 
  fun (x: container_service_deployment) -> assoc_to_yojson(
    [(
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "publicEndpoint",
         (option_to_yojson container_service_endpoint_to_yojson x.public_endpoint));
       (
         "containers",
         (option_to_yojson container_map_to_yojson x.containers));
       (
         "state",
         (option_to_yojson container_service_deployment_state_to_yojson x.state));
       (
         "version",
         (option_to_yojson integer__to_yojson x.version));
       
  ])

let container_service_public_domains_list_to_yojson = 
  fun tree -> list_to_yojson string__to_yojson tree

let container_service_public_domains_to_yojson = 
  fun tree -> map_to_yojson container_service_public_domains_list_to_yojson tree

let container_service_ecr_image_puller_role_to_yojson = 
  fun (x: container_service_ecr_image_puller_role) -> assoc_to_yojson(
    [(
         "principalArn",
         (option_to_yojson string__to_yojson x.principal_arn));
       (
         "isActive",
         (option_to_yojson boolean__to_yojson x.is_active));
       
  ])

let private_registry_access_to_yojson = 
  fun (x: private_registry_access) -> assoc_to_yojson(
    [(
         "ecrImagePullerRole",
         (option_to_yojson container_service_ecr_image_puller_role_to_yojson x.ecr_image_puller_role));
       
  ])

let container_service_to_yojson = 
  fun (x: container_service) -> assoc_to_yojson(
    [(
         "privateRegistryAccess",
         (option_to_yojson private_registry_access_to_yojson x.private_registry_access));
       (
         "url",
         (option_to_yojson string__to_yojson x.url));
       (
         "publicDomainNames",
         (option_to_yojson container_service_public_domains_to_yojson x.public_domain_names));
       (
         "privateDomainName",
         (option_to_yojson string__to_yojson x.private_domain_name));
       (
         "principalArn",
         (option_to_yojson string__to_yojson x.principal_arn));
       (
         "isDisabled",
         (option_to_yojson boolean__to_yojson x.is_disabled));
       (
         "nextDeployment",
         (option_to_yojson container_service_deployment_to_yojson x.next_deployment));
       (
         "currentDeployment",
         (option_to_yojson container_service_deployment_to_yojson x.current_deployment));
       (
         "scale",
         (option_to_yojson container_service_scale_to_yojson x.scale));
       (
         "stateDetail",
         (option_to_yojson container_service_state_detail_to_yojson x.state_detail));
       (
         "state",
         (option_to_yojson container_service_state_to_yojson x.state));
       (
         "powerId",
         (option_to_yojson string__to_yojson x.power_id));
       (
         "power",
         (option_to_yojson container_service_power_name_to_yojson x.power));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "containerServiceName",
         (option_to_yojson container_service_name_to_yojson x.container_service_name));
       
  ])

let update_container_service_result_to_yojson = 
  fun (x: update_container_service_result) -> assoc_to_yojson(
    [(
         "containerService",
         (option_to_yojson container_service_to_yojson x.container_service));
       
  ])

let container_service_ecr_image_puller_role_request_to_yojson = 
  fun (x: container_service_ecr_image_puller_role_request) -> assoc_to_yojson(
    [(
         "isActive",
         (option_to_yojson boolean__to_yojson x.is_active));
       
  ])

let private_registry_access_request_to_yojson = 
  fun (x: private_registry_access_request) -> assoc_to_yojson(
    [(
         "ecrImagePullerRole",
         (option_to_yojson container_service_ecr_image_puller_role_request_to_yojson x.ecr_image_puller_role));
       
  ])

let update_container_service_request_to_yojson = 
  fun (x: update_container_service_request) -> assoc_to_yojson(
    [(
         "privateRegistryAccess",
         (option_to_yojson private_registry_access_request_to_yojson x.private_registry_access));
       (
         "publicDomainNames",
         (option_to_yojson container_service_public_domains_to_yojson x.public_domain_names));
       (
         "isDisabled",
         (option_to_yojson boolean__to_yojson x.is_disabled));
       (
         "scale",
         (option_to_yojson container_service_scale_to_yojson x.scale));
       (
         "power",
         (option_to_yojson container_service_power_name_to_yojson x.power));
       (
         "serviceName",
         (Some (container_service_name_to_yojson x.service_name)));
       
  ])

let access_type_to_yojson = 
  fun (x: access_type) -> match x with 
  | Private -> `String "private"
    | Public -> `String "public"
     

let access_rules_to_yojson = 
  fun (x: access_rules) -> assoc_to_yojson(
    [(
         "allowPublicOverrides",
         (option_to_yojson boolean__to_yojson x.allow_public_overrides));
       (
         "getObject",
         (option_to_yojson access_type_to_yojson x.get_object));
       
  ])

let bucket_name_to_yojson = string_to_yojson

let partner_id_list_to_yojson = 
  fun tree -> list_to_yojson non_empty_string_to_yojson tree

let resource_receiving_access_to_yojson = 
  fun (x: resource_receiving_access) -> assoc_to_yojson(
    [(
         "resourceType",
         (option_to_yojson non_empty_string_to_yojson x.resource_type));
       (
         "name",
         (option_to_yojson non_empty_string_to_yojson x.name));
       
  ])

let access_receiver_list_to_yojson = 
  fun tree -> list_to_yojson resource_receiving_access_to_yojson tree

let bucket_state_to_yojson = 
  fun (x: bucket_state) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "code",
         (option_to_yojson non_empty_string_to_yojson x.code));
       
  ])

let bucket_access_log_prefix_to_yojson = string_to_yojson

let bucket_access_log_config_to_yojson = 
  fun (x: bucket_access_log_config) -> assoc_to_yojson(
    [(
         "prefix",
         (option_to_yojson bucket_access_log_prefix_to_yojson x.prefix));
       (
         "destination",
         (option_to_yojson bucket_name_to_yojson x.destination));
       (
         "enabled",
         (Some (boolean__to_yojson x.enabled)));
       
  ])

let bucket_to_yojson = 
  fun (x: bucket) -> assoc_to_yojson(
    [(
         "accessLogConfig",
         (option_to_yojson bucket_access_log_config_to_yojson x.access_log_config));
       (
         "state",
         (option_to_yojson bucket_state_to_yojson x.state));
       (
         "resourcesReceivingAccess",
         (option_to_yojson access_receiver_list_to_yojson x.resources_receiving_access));
       (
         "readonlyAccessAccounts",
         (option_to_yojson partner_id_list_to_yojson x.readonly_access_accounts));
       (
         "ableToUpdateBundle",
         (option_to_yojson boolean__to_yojson x.able_to_update_bundle));
       (
         "objectVersioning",
         (option_to_yojson non_empty_string_to_yojson x.object_versioning));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "supportCode",
         (option_to_yojson non_empty_string_to_yojson x.support_code));
       (
         "name",
         (option_to_yojson bucket_name_to_yojson x.name));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "url",
         (option_to_yojson non_empty_string_to_yojson x.url));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "bundleId",
         (option_to_yojson non_empty_string_to_yojson x.bundle_id));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "accessRules",
         (option_to_yojson access_rules_to_yojson x.access_rules));
       (
         "resourceType",
         (option_to_yojson non_empty_string_to_yojson x.resource_type));
       
  ])

let update_bucket_result_to_yojson = 
  fun (x: update_bucket_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       (
         "bucket",
         (option_to_yojson bucket_to_yojson x.bucket));
       
  ])

let update_bucket_request_to_yojson = 
  fun (x: update_bucket_request) -> assoc_to_yojson(
    [(
         "accessLogConfig",
         (option_to_yojson bucket_access_log_config_to_yojson x.access_log_config));
       (
         "readonlyAccessAccounts",
         (option_to_yojson partner_id_list_to_yojson x.readonly_access_accounts));
       (
         "versioning",
         (option_to_yojson non_empty_string_to_yojson x.versioning));
       (
         "accessRules",
         (option_to_yojson access_rules_to_yojson x.access_rules));
       (
         "bucketName",
         (Some (bucket_name_to_yojson x.bucket_name)));
       
  ])

let update_bucket_bundle_result_to_yojson = 
  fun (x: update_bucket_bundle_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let update_bucket_bundle_request_to_yojson = 
  fun (x: update_bucket_bundle_request) -> assoc_to_yojson(
    [(
         "bundleId",
         (Some (non_empty_string_to_yojson x.bundle_id)));
       (
         "bucketName",
         (Some (bucket_name_to_yojson x.bucket_name)));
       
  ])

let untag_resource_result_to_yojson = 
  fun (x: untag_resource_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let resource_arn_to_yojson = string_to_yojson

let tag_key_list_to_yojson = 
  fun tree -> list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson = 
  fun (x: untag_resource_request) -> assoc_to_yojson(
    [(
         "tagKeys",
         (Some (tag_key_list_to_yojson x.tag_keys)));
       (
         "resourceArn",
         (option_to_yojson resource_arn_to_yojson x.resource_arn));
       (
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let unpeer_vpc_result_to_yojson = 
  fun (x: unpeer_vpc_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let unpeer_vpc_request_to_yojson = 
  fun (x: unpeer_vpc_request) -> assoc_to_yojson(
    [
  ])

let treat_missing_data_to_yojson = 
  fun (x: treat_missing_data) -> match x with 
 
| Missing -> `String "missing"
  | Ignore -> `String "ignore"
  | NotBreaching -> `String "notBreaching"
  | Breaching -> `String "breaching"
   

let time_period_to_yojson = 
  fun (x: time_period) -> assoc_to_yojson(
    [(
         "end",
         (option_to_yojson iso_date_to_yojson x.end_));
       (
         "start",
         (option_to_yojson iso_date_to_yojson x.start));
       
  ])

let time_of_day_to_yojson = string_to_yojson

let test_alarm_result_to_yojson = 
  fun (x: test_alarm_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let alarm_state_to_yojson = 
  fun (x: alarm_state) -> match x with 
 
| INSUFFICIENT_DATA -> `String "INSUFFICIENT_DATA"
  | ALARM -> `String "ALARM"
  | OK -> `String "OK"
   

let test_alarm_request_to_yojson = 
  fun (x: test_alarm_request) -> assoc_to_yojson(
    [(
         "state",
         (Some (alarm_state_to_yojson x.state)));
       (
         "alarmName",
         (Some (resource_name_to_yojson x.alarm_name)));
       
  ])

let tag_resource_result_to_yojson = 
  fun (x: tag_resource_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let tag_resource_request_to_yojson = 
  fun (x: tag_resource_request) -> assoc_to_yojson(
    [(
         "tags",
         (Some (tag_list_to_yojson x.tags)));
       (
         "resourceArn",
         (option_to_yojson resource_arn_to_yojson x.resource_arn));
       (
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let subject_alternative_name_list_to_yojson = 
  fun tree -> list_to_yojson domain_name_to_yojson tree

let stop_relational_database_result_to_yojson = 
  fun (x: stop_relational_database_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let stop_relational_database_request_to_yojson = 
  fun (x: stop_relational_database_request) -> assoc_to_yojson(
    [(
         "relationalDatabaseSnapshotName",
         (option_to_yojson resource_name_to_yojson x.relational_database_snapshot_name));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let stop_instance_result_to_yojson = 
  fun (x: stop_instance_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let stop_instance_request_to_yojson = 
  fun (x: stop_instance_request) -> assoc_to_yojson(
    [(
         "force",
         (option_to_yojson boolean__to_yojson x.force));
       (
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let stop_instance_on_idle_request_to_yojson = 
  fun (x: stop_instance_on_idle_request) -> assoc_to_yojson(
    [(
         "duration",
         (option_to_yojson string__to_yojson x.duration));
       (
         "threshold",
         (option_to_yojson string__to_yojson x.threshold));
       
  ])

let stop_gui_session_result_to_yojson = 
  fun (x: stop_gui_session_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let stop_gui_session_request_to_yojson = 
  fun (x: stop_gui_session_request) -> assoc_to_yojson(
    [(
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let status_type_to_yojson = 
  fun (x: status_type) -> match x with 
  | Inactive -> `String "Inactive"
    | Active -> `String "Active"
     

let status_to_yojson = 
  fun (x: status) -> match x with 
 
| FailedStoppingGUISession -> `String "failedStoppingGUISession"
  | FailedStartingGUISession -> `String "failedStartingGUISession"
  | FailedInstanceCreation -> `String "failedInstanceCreation"
  | SettingUpInstance -> `String "settingUpInstance"
  | Stopping -> `String "stopping"
  | Stopped -> `String "stopped"
  | Starting -> `String "starting"
  | Started -> `String "started"
  | NotStarted -> `String "notStarted"
  | StartExpired -> `String "startExpired"
   

let ip_address_to_yojson = string_to_yojson

let static_ip_to_yojson = 
  fun (x: static_ip) -> assoc_to_yojson(
    [(
         "isAttached",
         (option_to_yojson boolean__to_yojson x.is_attached));
       (
         "attachedTo",
         (option_to_yojson resource_name_to_yojson x.attached_to));
       (
         "ipAddress",
         (option_to_yojson ip_address_to_yojson x.ip_address));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let static_ip_list_to_yojson = 
  fun tree -> list_to_yojson static_ip_to_yojson tree

let start_relational_database_result_to_yojson = 
  fun (x: start_relational_database_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let start_relational_database_request_to_yojson = 
  fun (x: start_relational_database_request) -> assoc_to_yojson(
    [(
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let start_instance_result_to_yojson = 
  fun (x: start_instance_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let start_instance_request_to_yojson = 
  fun (x: start_instance_request) -> assoc_to_yojson(
    [(
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let start_gui_session_result_to_yojson = 
  fun (x: start_gui_session_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let start_gui_session_request_to_yojson = 
  fun (x: start_gui_session_request) -> assoc_to_yojson(
    [(
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let setup_instance_https_result_to_yojson = 
  fun (x: setup_instance_https_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let email_address_to_yojson = string_to_yojson

let setup_instance_https_request_to_yojson = 
  fun (x: setup_instance_https_request) -> assoc_to_yojson(
    [(
         "certificateProvider",
         (Some (certificate_provider_to_yojson x.certificate_provider)));
       (
         "domainNames",
         (Some (setup_domain_name_list_to_yojson x.domain_names)));
       (
         "emailAddress",
         (Some (email_address_to_yojson x.email_address)));
       (
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let setup_history_page_token_to_yojson = string_to_yojson

let set_resource_access_for_bucket_result_to_yojson = 
  fun (x: set_resource_access_for_bucket_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let resource_bucket_access_to_yojson = 
  fun (x: resource_bucket_access) -> match x with 
  | Deny -> `String "deny"
    | Allow -> `String "allow"
     

let set_resource_access_for_bucket_request_to_yojson = 
  fun (x: set_resource_access_for_bucket_request) -> assoc_to_yojson(
    [(
         "access",
         (Some (resource_bucket_access_to_yojson x.access)));
       (
         "bucketName",
         (Some (bucket_name_to_yojson x.bucket_name)));
       (
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let set_ip_address_type_result_to_yojson = 
  fun (x: set_ip_address_type_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let ip_address_type_to_yojson = 
  fun (x: ip_address_type) -> match x with 
 
| IPV6 -> `String "ipv6"
  | IPV4 -> `String "ipv4"
  | DUALSTACK -> `String "dualstack"
   

let set_ip_address_type_request_to_yojson = 
  fun (x: set_ip_address_type_request) -> assoc_to_yojson(
    [(
         "acceptBundleUpdate",
         (option_to_yojson boolean__to_yojson x.accept_bundle_update));
       (
         "ipAddressType",
         (Some (ip_address_type_to_yojson x.ip_address_type)));
       (
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       (
         "resourceType",
         (Some (resource_type_to_yojson x.resource_type)));
       
  ])

let sensitive_non_empty_string_to_yojson = string_to_yojson

let session_to_yojson = 
  fun (x: session) -> assoc_to_yojson(
    [(
         "isPrimary",
         (option_to_yojson boolean__to_yojson x.is_primary));
       (
         "url",
         (option_to_yojson sensitive_non_empty_string_to_yojson x.url));
       (
         "name",
         (option_to_yojson non_empty_string_to_yojson x.name));
       
  ])

let sessions_to_yojson = fun tree -> list_to_yojson session_to_yojson tree

let serial_number_to_yojson = string_to_yojson

let send_contact_method_verification_result_to_yojson = 
  fun (x: send_contact_method_verification_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let contact_method_verification_protocol_to_yojson = 
  fun (x: contact_method_verification_protocol) -> match x with 
  | Email -> `String "Email"
     

let send_contact_method_verification_request_to_yojson = 
  fun (x: send_contact_method_verification_request) -> assoc_to_yojson(
    [(
         "protocol",
         (Some (contact_method_verification_protocol_to_yojson x.protocol)));
       
  ])

let revocation_reason_to_yojson = string_to_yojson

let pricing_unit_to_yojson = 
  fun (x: pricing_unit) -> match x with 
 
| Queries -> `String "Queries"
  | Bundles -> `String "Bundles"
  | GBMo -> `String "GB-Mo"
  | Hrs -> `String "Hrs"
  | GB -> `String "GB"
   

let currency_to_yojson = 
  fun (x: currency) -> match x with 
  | USD -> `String "USD"
     

let estimate_by_time_to_yojson = 
  fun (x: estimate_by_time) -> assoc_to_yojson(
    [(
         "timePeriod",
         (option_to_yojson time_period_to_yojson x.time_period));
       (
         "currency",
         (option_to_yojson currency_to_yojson x.currency));
       (
         "unit",
         (option_to_yojson double_to_yojson x.unit_));
       (
         "pricingUnit",
         (option_to_yojson pricing_unit_to_yojson x.pricing_unit));
       (
         "usageCost",
         (option_to_yojson double_to_yojson x.usage_cost));
       
  ])

let estimates_by_time_to_yojson = 
  fun tree -> list_to_yojson estimate_by_time_to_yojson tree

let cost_estimate_to_yojson = 
  fun (x: cost_estimate) -> assoc_to_yojson(
    [(
         "resultsByTime",
         (option_to_yojson estimates_by_time_to_yojson x.results_by_time));
       (
         "usageType",
         (option_to_yojson non_empty_string_to_yojson x.usage_type));
       
  ])

let cost_estimates_to_yojson = 
  fun tree -> list_to_yojson cost_estimate_to_yojson tree

let resource_budget_estimate_to_yojson = 
  fun (x: resource_budget_estimate) -> assoc_to_yojson(
    [(
         "endTime",
         (option_to_yojson iso_date_to_yojson x.end_time));
       (
         "startTime",
         (option_to_yojson iso_date_to_yojson x.start_time));
       (
         "costEstimates",
         (option_to_yojson cost_estimates_to_yojson x.cost_estimates));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "resourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       
  ])

let resources_budget_estimate_to_yojson = 
  fun tree -> list_to_yojson resource_budget_estimate_to_yojson tree

let resource_record_to_yojson = 
  fun (x: resource_record) -> assoc_to_yojson(
    [(
         "value",
         (option_to_yojson string__to_yojson x.value));
       (
         "type",
         (option_to_yojson string__to_yojson x.type_));
       (
         "name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let resource_name_list_to_yojson = 
  fun tree -> list_to_yojson resource_name_to_yojson tree

let reset_distribution_cache_result_to_yojson = 
  fun (x: reset_distribution_cache_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       (
         "createTime",
         (option_to_yojson iso_date_to_yojson x.create_time));
       (
         "status",
         (option_to_yojson string__to_yojson x.status));
       
  ])

let reset_distribution_cache_request_to_yojson = 
  fun (x: reset_distribution_cache_request) -> assoc_to_yojson(
    [(
         "distributionName",
         (option_to_yojson resource_name_to_yojson x.distribution_name));
       
  ])

let request_failure_reason_to_yojson = string_to_yojson

let dns_record_creation_state_code_to_yojson = 
  fun (x: dns_record_creation_state_code) -> match x with 
 
| Failed -> `String "FAILED"
  | Started -> `String "STARTED"
  | Succeeded -> `String "SUCCEEDED"
   

let dns_record_creation_state_to_yojson = 
  fun (x: dns_record_creation_state) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "code",
         (option_to_yojson dns_record_creation_state_code_to_yojson x.code));
       
  ])

let certificate_domain_validation_status_to_yojson = 
  fun (x: certificate_domain_validation_status) -> match x with 
 
| Success -> `String "SUCCESS"
  | Failed -> `String "FAILED"
  | PendingValidation -> `String "PENDING_VALIDATION"
   

let domain_validation_record_to_yojson = 
  fun (x: domain_validation_record) -> assoc_to_yojson(
    [(
         "validationStatus",
         (option_to_yojson certificate_domain_validation_status_to_yojson x.validation_status));
       (
         "dnsRecordCreationState",
         (option_to_yojson dns_record_creation_state_to_yojson x.dns_record_creation_state));
       (
         "resourceRecord",
         (option_to_yojson resource_record_to_yojson x.resource_record));
       (
         "domainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       
  ])

let domain_validation_record_list_to_yojson = 
  fun tree -> list_to_yojson domain_validation_record_to_yojson tree

let renewal_status_to_yojson = 
  fun (x: renewal_status) -> match x with 
 
| Failed -> `String "Failed"
  | Success -> `String "Success"
  | PendingValidation -> `String "PendingValidation"
  | PendingAutoRenewal -> `String "PendingAutoRenewal"
   

let renewal_status_reason_to_yojson = string_to_yojson

let renewal_summary_to_yojson = 
  fun (x: renewal_summary) -> assoc_to_yojson(
    [(
         "updatedAt",
         (option_to_yojson iso_date_to_yojson x.updated_at));
       (
         "renewalStatusReason",
         (option_to_yojson renewal_status_reason_to_yojson x.renewal_status_reason));
       (
         "renewalStatus",
         (option_to_yojson renewal_status_to_yojson x.renewal_status));
       (
         "domainValidationRecords",
         (option_to_yojson domain_validation_record_list_to_yojson x.domain_validation_records));
       
  ])

let release_static_ip_result_to_yojson = 
  fun (x: release_static_ip_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let release_static_ip_request_to_yojson = 
  fun (x: release_static_ip_request) -> assoc_to_yojson(
    [(
         "staticIpName",
         (Some (resource_name_to_yojson x.static_ip_name)));
       
  ])

let relational_database_snapshot_to_yojson = 
  fun (x: relational_database_snapshot) -> assoc_to_yojson(
    [(
         "fromRelationalDatabaseBlueprintId",
         (option_to_yojson string__to_yojson x.from_relational_database_blueprint_id));
       (
         "fromRelationalDatabaseBundleId",
         (option_to_yojson string__to_yojson x.from_relational_database_bundle_id));
       (
         "fromRelationalDatabaseArn",
         (option_to_yojson non_empty_string_to_yojson x.from_relational_database_arn));
       (
         "fromRelationalDatabaseName",
         (option_to_yojson non_empty_string_to_yojson x.from_relational_database_name));
       (
         "state",
         (option_to_yojson non_empty_string_to_yojson x.state));
       (
         "sizeInGb",
         (option_to_yojson integer__to_yojson x.size_in_gb));
       (
         "engineVersion",
         (option_to_yojson non_empty_string_to_yojson x.engine_version));
       (
         "engine",
         (option_to_yojson non_empty_string_to_yojson x.engine));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let relational_database_snapshot_list_to_yojson = 
  fun tree -> list_to_yojson relational_database_snapshot_to_yojson tree

let relational_database_password_version_to_yojson = 
  fun (x: relational_database_password_version) -> match x with 
 
| PENDING -> `String "PENDING"
  | PREVIOUS -> `String "PREVIOUS"
  | CURRENT -> `String "CURRENT"
   

let relational_database_metric_name_to_yojson = 
  fun (x: relational_database_metric_name) -> match x with 
 
| NetworkTransmitThroughput -> `String "NetworkTransmitThroughput"
  | NetworkReceiveThroughput -> `String "NetworkReceiveThroughput"
  | FreeStorageSpace -> `String "FreeStorageSpace"
  | DiskQueueDepth -> `String "DiskQueueDepth"
  | DatabaseConnections -> `String "DatabaseConnections"
  | CPUUtilization -> `String "CPUUtilization"
   

let relational_database_hardware_to_yojson = 
  fun (x: relational_database_hardware) -> assoc_to_yojson(
    [(
         "ramSizeInGb",
         (option_to_yojson float__to_yojson x.ram_size_in_gb));
       (
         "diskSizeInGb",
         (option_to_yojson integer__to_yojson x.disk_size_in_gb));
       (
         "cpuCount",
         (option_to_yojson integer__to_yojson x.cpu_count));
       
  ])

let pending_modified_relational_database_values_to_yojson = 
  fun (x: pending_modified_relational_database_values) -> assoc_to_yojson(
    [(
         "backupRetentionEnabled",
         (option_to_yojson boolean__to_yojson x.backup_retention_enabled));
       (
         "engineVersion",
         (option_to_yojson string__to_yojson x.engine_version));
       (
         "masterUserPassword",
         (option_to_yojson string__to_yojson x.master_user_password));
       
  ])

let relational_database_endpoint_to_yojson = 
  fun (x: relational_database_endpoint) -> assoc_to_yojson(
    [(
         "address",
         (option_to_yojson non_empty_string_to_yojson x.address));
       (
         "port",
         (option_to_yojson integer__to_yojson x.port));
       
  ])

let pending_maintenance_action_to_yojson = 
  fun (x: pending_maintenance_action) -> assoc_to_yojson(
    [(
         "currentApplyDate",
         (option_to_yojson iso_date_to_yojson x.current_apply_date));
       (
         "description",
         (option_to_yojson non_empty_string_to_yojson x.description));
       (
         "action",
         (option_to_yojson non_empty_string_to_yojson x.action));
       
  ])

let pending_maintenance_action_list_to_yojson = 
  fun tree -> list_to_yojson pending_maintenance_action_to_yojson tree

let relational_database_to_yojson = 
  fun (x: relational_database) -> assoc_to_yojson(
    [(
         "caCertificateIdentifier",
         (option_to_yojson string__to_yojson x.ca_certificate_identifier));
       (
         "pendingMaintenanceActions",
         (option_to_yojson pending_maintenance_action_list_to_yojson x.pending_maintenance_actions));
       (
         "masterEndpoint",
         (option_to_yojson relational_database_endpoint_to_yojson x.master_endpoint));
       (
         "publiclyAccessible",
         (option_to_yojson boolean__to_yojson x.publicly_accessible));
       (
         "preferredMaintenanceWindow",
         (option_to_yojson non_empty_string_to_yojson x.preferred_maintenance_window));
       (
         "preferredBackupWindow",
         (option_to_yojson non_empty_string_to_yojson x.preferred_backup_window));
       (
         "parameterApplyStatus",
         (option_to_yojson non_empty_string_to_yojson x.parameter_apply_status));
       (
         "masterUsername",
         (option_to_yojson non_empty_string_to_yojson x.master_username));
       (
         "latestRestorableTime",
         (option_to_yojson iso_date_to_yojson x.latest_restorable_time));
       (
         "engineVersion",
         (option_to_yojson non_empty_string_to_yojson x.engine_version));
       (
         "engine",
         (option_to_yojson non_empty_string_to_yojson x.engine));
       (
         "pendingModifiedValues",
         (option_to_yojson pending_modified_relational_database_values_to_yojson x.pending_modified_values));
       (
         "backupRetentionEnabled",
         (option_to_yojson boolean__to_yojson x.backup_retention_enabled));
       (
         "secondaryAvailabilityZone",
         (option_to_yojson string__to_yojson x.secondary_availability_zone));
       (
         "state",
         (option_to_yojson non_empty_string_to_yojson x.state));
       (
         "hardware",
         (option_to_yojson relational_database_hardware_to_yojson x.hardware));
       (
         "masterDatabaseName",
         (option_to_yojson string__to_yojson x.master_database_name));
       (
         "relationalDatabaseBundleId",
         (option_to_yojson non_empty_string_to_yojson x.relational_database_bundle_id));
       (
         "relationalDatabaseBlueprintId",
         (option_to_yojson non_empty_string_to_yojson x.relational_database_blueprint_id));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let relational_database_list_to_yojson = 
  fun tree -> list_to_yojson relational_database_to_yojson tree

let relational_database_event_to_yojson = 
  fun (x: relational_database_event) -> assoc_to_yojson(
    [(
         "eventCategories",
         (option_to_yojson string_list_to_yojson x.event_categories));
       (
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "resource",
         (option_to_yojson resource_name_to_yojson x.resource));
       
  ])

let relational_database_event_list_to_yojson = 
  fun tree -> list_to_yojson relational_database_event_to_yojson tree

let relational_database_engine_to_yojson = 
  fun (x: relational_database_engine) -> match x with 
  | MYSQL -> `String "mysql"
     

let relational_database_bundle_to_yojson = 
  fun (x: relational_database_bundle) -> assoc_to_yojson(
    [(
         "isActive",
         (option_to_yojson boolean__to_yojson x.is_active));
       (
         "isEncrypted",
         (option_to_yojson boolean__to_yojson x.is_encrypted));
       (
         "cpuCount",
         (option_to_yojson integer__to_yojson x.cpu_count));
       (
         "transferPerMonthInGb",
         (option_to_yojson integer__to_yojson x.transfer_per_month_in_gb));
       (
         "diskSizeInGb",
         (option_to_yojson integer__to_yojson x.disk_size_in_gb));
       (
         "ramSizeInGb",
         (option_to_yojson float__to_yojson x.ram_size_in_gb));
       (
         "price",
         (option_to_yojson float__to_yojson x.price));
       (
         "name",
         (option_to_yojson string__to_yojson x.name));
       (
         "bundleId",
         (option_to_yojson string__to_yojson x.bundle_id));
       
  ])

let relational_database_bundle_list_to_yojson = 
  fun tree -> list_to_yojson relational_database_bundle_to_yojson tree

let relational_database_blueprint_to_yojson = 
  fun (x: relational_database_blueprint) -> assoc_to_yojson(
    [(
         "isEngineDefault",
         (option_to_yojson boolean__to_yojson x.is_engine_default));
       (
         "engineVersionDescription",
         (option_to_yojson string__to_yojson x.engine_version_description));
       (
         "engineDescription",
         (option_to_yojson string__to_yojson x.engine_description));
       (
         "engineVersion",
         (option_to_yojson string__to_yojson x.engine_version));
       (
         "engine",
         (option_to_yojson relational_database_engine_to_yojson x.engine));
       (
         "blueprintId",
         (option_to_yojson string__to_yojson x.blueprint_id));
       
  ])

let relational_database_blueprint_list_to_yojson = 
  fun tree -> list_to_yojson relational_database_blueprint_to_yojson tree

let name_servers_update_state_code_to_yojson = 
  fun (x: name_servers_update_state_code) -> match x with 
 
| Started -> `String "STARTED"
  | Failed -> `String "FAILED"
  | Pending -> `String "PENDING"
  | Succeeded -> `String "SUCCEEDED"
   

let name_servers_update_state_to_yojson = 
  fun (x: name_servers_update_state) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "code",
         (option_to_yojson name_servers_update_state_code_to_yojson x.code));
       
  ])

let r53_hosted_zone_deletion_state_code_to_yojson = 
  fun (x: r53_hosted_zone_deletion_state_code) -> match x with 
 
| Started -> `String "STARTED"
  | Failed -> `String "FAILED"
  | Pending -> `String "PENDING"
  | Succeeded -> `String "SUCCEEDED"
   

let r53_hosted_zone_deletion_state_to_yojson = 
  fun (x: r53_hosted_zone_deletion_state) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "code",
         (option_to_yojson r53_hosted_zone_deletion_state_code_to_yojson x.code));
       
  ])

let registered_domain_delegation_info_to_yojson = 
  fun (x: registered_domain_delegation_info) -> assoc_to_yojson(
    [(
         "r53HostedZoneDeletionState",
         (option_to_yojson r53_hosted_zone_deletion_state_to_yojson x.r53_hosted_zone_deletion_state));
       (
         "nameServersUpdateState",
         (option_to_yojson name_servers_update_state_to_yojson x.name_servers_update_state));
       
  ])

let container_image_to_yojson = 
  fun (x: container_image) -> assoc_to_yojson(
    [(
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "digest",
         (option_to_yojson string__to_yojson x.digest));
       (
         "image",
         (option_to_yojson string__to_yojson x.image));
       
  ])

let register_container_image_result_to_yojson = 
  fun (x: register_container_image_result) -> assoc_to_yojson(
    [(
         "containerImage",
         (option_to_yojson container_image_to_yojson x.container_image));
       
  ])

let container_label_to_yojson = string_to_yojson

let register_container_image_request_to_yojson = 
  fun (x: register_container_image_request) -> assoc_to_yojson(
    [(
         "digest",
         (Some (string__to_yojson x.digest)));
       (
         "label",
         (Some (container_label_to_yojson x.label)));
       (
         "serviceName",
         (Some (container_service_name_to_yojson x.service_name)));
       
  ])

let availability_zone_to_yojson = 
  fun (x: availability_zone) -> assoc_to_yojson(
    [(
         "state",
         (option_to_yojson non_empty_string_to_yojson x.state));
       (
         "zoneName",
         (option_to_yojson non_empty_string_to_yojson x.zone_name));
       
  ])

let availability_zone_list_to_yojson = 
  fun tree -> list_to_yojson availability_zone_to_yojson tree

let region_to_yojson = 
  fun (x: region) -> assoc_to_yojson(
    [(
         "relationalDatabaseAvailabilityZones",
         (option_to_yojson availability_zone_list_to_yojson x.relational_database_availability_zones));
       (
         "availabilityZones",
         (option_to_yojson availability_zone_list_to_yojson x.availability_zones));
       (
         "name",
         (option_to_yojson region_name_to_yojson x.name));
       (
         "displayName",
         (option_to_yojson string__to_yojson x.display_name));
       (
         "description",
         (option_to_yojson string__to_yojson x.description));
       (
         "continentCode",
         (option_to_yojson string__to_yojson x.continent_code));
       
  ])

let region_list_to_yojson = 
  fun tree -> list_to_yojson region_to_yojson tree

let record_state_to_yojson = 
  fun (x: record_state) -> match x with 
 
| Failed -> `String "Failed"
  | Succeeded -> `String "Succeeded"
  | Started -> `String "Started"
   

let reboot_relational_database_result_to_yojson = 
  fun (x: reboot_relational_database_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let reboot_relational_database_request_to_yojson = 
  fun (x: reboot_relational_database_request) -> assoc_to_yojson(
    [(
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let reboot_instance_result_to_yojson = 
  fun (x: reboot_instance_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let reboot_instance_request_to_yojson = 
  fun (x: reboot_instance_request) -> assoc_to_yojson(
    [(
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let put_instance_public_ports_result_to_yojson = 
  fun (x: put_instance_public_ports_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let port_to_yojson = int_to_yojson

let network_protocol_to_yojson = 
  fun (x: network_protocol) -> match x with 
 
| ICMPV6 -> `String "icmpv6"
  | ICMP -> `String "icmp"
  | UDP -> `String "udp"
  | ALL -> `String "all"
  | TCP -> `String "tcp"
   

let port_info_to_yojson = 
  fun (x: port_info) -> assoc_to_yojson(
    [(
         "cidrListAliases",
         (option_to_yojson string_list_to_yojson x.cidr_list_aliases));
       (
         "ipv6Cidrs",
         (option_to_yojson string_list_to_yojson x.ipv6_cidrs));
       (
         "cidrs",
         (option_to_yojson string_list_to_yojson x.cidrs));
       (
         "protocol",
         (option_to_yojson network_protocol_to_yojson x.protocol));
       (
         "toPort",
         (option_to_yojson port_to_yojson x.to_port));
       (
         "fromPort",
         (option_to_yojson port_to_yojson x.from_port));
       
  ])

let port_info_list_to_yojson = 
  fun tree -> list_to_yojson port_info_to_yojson tree

let put_instance_public_ports_request_to_yojson = 
  fun (x: put_instance_public_ports_request) -> assoc_to_yojson(
    [(
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       (
         "portInfos",
         (Some (port_info_list_to_yojson x.port_infos)));
       
  ])

let put_alarm_result_to_yojson = 
  fun (x: put_alarm_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let metric_name_to_yojson = 
  fun (x: metric_name) -> match x with 
 
| BurstCapacityPercentage -> `String "BurstCapacityPercentage"
  | BurstCapacityTime -> `String "BurstCapacityTime"
  | NetworkTransmitThroughput -> `String "NetworkTransmitThroughput"
  | NetworkReceiveThroughput -> `String "NetworkReceiveThroughput"
  | FreeStorageSpace -> `String "FreeStorageSpace"
  | DiskQueueDepth -> `String "DiskQueueDepth"
  | DatabaseConnections -> `String "DatabaseConnections"
  | RequestCount -> `String "RequestCount"
  | RejectedConnectionCount -> `String "RejectedConnectionCount"
  | InstanceResponseTime -> `String "InstanceResponseTime"
  | HTTPCode_Instance_5XX_Count -> `String "HTTPCode_Instance_5XX_Count"
  | HTTPCode_Instance_4XX_Count -> `String "HTTPCode_Instance_4XX_Count"
  | HTTPCode_Instance_3XX_Count -> `String "HTTPCode_Instance_3XX_Count"
  | HTTPCode_Instance_2XX_Count -> `String "HTTPCode_Instance_2XX_Count"
  | HTTPCode_LB_5XX_Count -> `String "HTTPCode_LB_5XX_Count"
  | HTTPCode_LB_4XX_Count -> `String "HTTPCode_LB_4XX_Count"
  | UnhealthyHostCount -> `String "UnhealthyHostCount"
  | HealthyHostCount -> `String "HealthyHostCount"
  | ClientTLSNegotiationErrorCount -> `String "ClientTLSNegotiationErrorCount"
  | StatusCheckFailed_System -> `String "StatusCheckFailed_System"
  | StatusCheckFailed_Instance -> `String "StatusCheckFailed_Instance"
  | StatusCheckFailed -> `String "StatusCheckFailed"
  | NetworkOut -> `String "NetworkOut"
  | NetworkIn -> `String "NetworkIn"
  | CPUUtilization -> `String "CPUUtilization"
   

let comparison_operator_to_yojson = 
  fun (x: comparison_operator) -> match x with 
 
| LessThanOrEqualToThreshold -> `String "LessThanOrEqualToThreshold"
  | LessThanThreshold -> `String "LessThanThreshold"
  | GreaterThanThreshold -> `String "GreaterThanThreshold"
  | GreaterThanOrEqualToThreshold -> `String "GreaterThanOrEqualToThreshold"
   

let contact_protocol_to_yojson = 
  fun (x: contact_protocol) -> match x with 
  | SMS -> `String "SMS"
    | Email -> `String "Email"
     

let contact_protocols_list_to_yojson = 
  fun tree -> list_to_yojson contact_protocol_to_yojson tree

let notification_trigger_list_to_yojson = 
  fun tree -> list_to_yojson alarm_state_to_yojson tree

let put_alarm_request_to_yojson = 
  fun (x: put_alarm_request) -> assoc_to_yojson(
    [(
         "notificationEnabled",
         (option_to_yojson boolean__to_yojson x.notification_enabled));
       (
         "notificationTriggers",
         (option_to_yojson notification_trigger_list_to_yojson x.notification_triggers));
       (
         "contactProtocols",
         (option_to_yojson contact_protocols_list_to_yojson x.contact_protocols));
       (
         "treatMissingData",
         (option_to_yojson treat_missing_data_to_yojson x.treat_missing_data));
       (
         "datapointsToAlarm",
         (option_to_yojson integer__to_yojson x.datapoints_to_alarm));
       (
         "evaluationPeriods",
         (Some (integer__to_yojson x.evaluation_periods)));
       (
         "threshold",
         (Some (double_to_yojson x.threshold)));
       (
         "comparisonOperator",
         (Some (comparison_operator_to_yojson x.comparison_operator)));
       (
         "monitoredResourceName",
         (Some (resource_name_to_yojson x.monitored_resource_name)));
       (
         "metricName",
         (Some (metric_name_to_yojson x.metric_name)));
       (
         "alarmName",
         (Some (resource_name_to_yojson x.alarm_name)));
       
  ])

let port_state_to_yojson = 
  fun (x: port_state) -> match x with 
  | Closed -> `String "closed"
    | Open -> `String "open"
     

let port_list_to_yojson = fun tree -> list_to_yojson port_to_yojson tree

let port_info_source_type_to_yojson = 
  fun (x: port_info_source_type) -> match x with 
 
| Closed -> `String "CLOSED"
  | None -> `String "NONE"
  | Instance -> `String "INSTANCE"
  | Default -> `String "DEFAULT"
   

let port_access_type_to_yojson = 
  fun (x: port_access_type) -> match x with 
  | Private -> `String "Private"
    | Public -> `String "Public"
     

let peer_vpc_result_to_yojson = 
  fun (x: peer_vpc_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let peer_vpc_request_to_yojson = 
  fun (x: peer_vpc_request) -> assoc_to_yojson(
    [
  ])

let password_data_to_yojson = 
  fun (x: password_data) -> assoc_to_yojson(
    [(
         "keyPairName",
         (option_to_yojson resource_name_to_yojson x.key_pair_name));
       (
         "ciphertext",
         (option_to_yojson string__to_yojson x.ciphertext));
       
  ])

let origin_to_yojson = 
  fun (x: origin) -> assoc_to_yojson(
    [(
         "responseTimeout",
         (option_to_yojson integer__to_yojson x.response_timeout));
       (
         "protocolPolicy",
         (option_to_yojson origin_protocol_policy_enum_to_yojson x.protocol_policy));
       (
         "regionName",
         (option_to_yojson region_name_to_yojson x.region_name));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let open_instance_public_ports_result_to_yojson = 
  fun (x: open_instance_public_ports_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let open_instance_public_ports_request_to_yojson = 
  fun (x: open_instance_public_ports_request) -> assoc_to_yojson(
    [(
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       (
         "portInfo",
         (Some (port_info_to_yojson x.port_info)));
       
  ])

let monthly_transfer_to_yojson = 
  fun (x: monthly_transfer) -> assoc_to_yojson(
    [(
         "gbPerMonthAllocated",
         (option_to_yojson integer__to_yojson x.gb_per_month_allocated));
       
  ])

let monitored_resource_info_to_yojson = 
  fun (x: monitored_resource_info) -> assoc_to_yojson(
    [(
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "arn",
         (option_to_yojson resource_arn_to_yojson x.arn));
       
  ])

let metric_unit_to_yojson = 
  fun (x: metric_unit) -> match x with 
 
| None -> `String "None"
  | CountSecond -> `String "Count/Second"
  | TerabitsSecond -> `String "Terabits/Second"
  | GigabitsSecond -> `String "Gigabits/Second"
  | MegabitsSecond -> `String "Megabits/Second"
  | KilobitsSecond -> `String "Kilobits/Second"
  | BitsSecond -> `String "Bits/Second"
  | TerabytesSecond -> `String "Terabytes/Second"
  | GigabytesSecond -> `String "Gigabytes/Second"
  | MegabytesSecond -> `String "Megabytes/Second"
  | KilobytesSecond -> `String "Kilobytes/Second"
  | BytesSecond -> `String "Bytes/Second"
  | Count -> `String "Count"
  | Percent -> `String "Percent"
  | Terabits -> `String "Terabits"
  | Gigabits -> `String "Gigabits"
  | Megabits -> `String "Megabits"
  | Kilobits -> `String "Kilobits"
  | Bits -> `String "Bits"
  | Terabytes -> `String "Terabytes"
  | Gigabytes -> `String "Gigabytes"
  | Megabytes -> `String "Megabytes"
  | Kilobytes -> `String "Kilobytes"
  | Bytes -> `String "Bytes"
  | Milliseconds -> `String "Milliseconds"
  | Microseconds -> `String "Microseconds"
  | Seconds -> `String "Seconds"
   

let metric_statistic_to_yojson = 
  fun (x: metric_statistic) -> match x with 
 
| SampleCount -> `String "SampleCount"
  | Average -> `String "Average"
  | Sum -> `String "Sum"
  | Maximum -> `String "Maximum"
  | Minimum -> `String "Minimum"
   

let metric_statistic_list_to_yojson = 
  fun tree -> list_to_yojson metric_statistic_to_yojson tree

let metric_period_to_yojson = int_to_yojson

let metric_datapoint_to_yojson = 
  fun (x: metric_datapoint) -> assoc_to_yojson(
    [(
         "unit",
         (option_to_yojson metric_unit_to_yojson x.unit_));
       (
         "timestamp",
         (option_to_yojson timestamp__to_yojson x.timestamp_));
       (
         "sum",
         (option_to_yojson double_to_yojson x.sum));
       (
         "sampleCount",
         (option_to_yojson double_to_yojson x.sample_count));
       (
         "minimum",
         (option_to_yojson double_to_yojson x.minimum));
       (
         "maximum",
         (option_to_yojson double_to_yojson x.maximum));
       (
         "average",
         (option_to_yojson double_to_yojson x.average));
       
  ])

let metric_datapoint_list_to_yojson = 
  fun tree -> list_to_yojson metric_datapoint_to_yojson tree

let log_event_to_yojson = 
  fun (x: log_event) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       
  ])

let log_event_list_to_yojson = 
  fun tree -> list_to_yojson log_event_to_yojson tree

let load_balancer_tls_policy_to_yojson = 
  fun (x: load_balancer_tls_policy) -> assoc_to_yojson(
    [(
         "ciphers",
         (option_to_yojson string_list_to_yojson x.ciphers));
       (
         "protocols",
         (option_to_yojson string_list_to_yojson x.protocols));
       (
         "description",
         (option_to_yojson string__to_yojson x.description));
       (
         "isDefault",
         (option_to_yojson boolean__to_yojson x.is_default));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let load_balancer_tls_policy_list_to_yojson = 
  fun tree -> list_to_yojson load_balancer_tls_policy_to_yojson tree

let load_balancer_tls_certificate_summary_to_yojson = 
  fun (x: load_balancer_tls_certificate_summary) -> assoc_to_yojson(
    [(
         "isAttached",
         (option_to_yojson boolean__to_yojson x.is_attached));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let load_balancer_tls_certificate_summary_list_to_yojson = 
  fun tree -> list_to_yojson load_balancer_tls_certificate_summary_to_yojson tree

let load_balancer_tls_certificate_status_to_yojson = 
  fun (x: load_balancer_tls_certificate_status) -> match x with 
 
| Unknown -> `String "UNKNOWN"
  | Failed -> `String "FAILED"
  | Revoked -> `String "REVOKED"
  | ValidationTimedOut -> `String "VALIDATION_TIMED_OUT"
  | Expired -> `String "EXPIRED"
  | Inactive -> `String "INACTIVE"
  | Issued -> `String "ISSUED"
  | PendingValidation -> `String "PENDING_VALIDATION"
   

let load_balancer_tls_certificate_revocation_reason_to_yojson = 
  fun (x: load_balancer_tls_certificate_revocation_reason) -> match x with 
 
| AACompromise -> `String "A_A_COMPROMISE"
  | PrivilegeWithdrawn -> `String "PRIVILEGE_WITHDRAWN"
  | RemoveFromCrl -> `String "REMOVE_FROM_CRL"
  | CertificateHold -> `String "CERTIFICATE_HOLD"
  | CessationOfOperation -> `String "CESSATION_OF_OPERATION"
  | Superceded -> `String "SUPERCEDED"
  | AffiliationChanged -> `String "AFFILIATION_CHANGED"
  | CaCompromise -> `String "CA_COMPROMISE"
  | KeyCompromise -> `String "KEY_COMPROMISE"
  | Unspecified -> `String "UNSPECIFIED"
   

let load_balancer_tls_certificate_renewal_status_to_yojson = 
  fun (x: load_balancer_tls_certificate_renewal_status) -> match x with 
 
| Failed -> `String "FAILED"
  | Success -> `String "SUCCESS"
  | PendingValidation -> `String "PENDING_VALIDATION"
  | PendingAutoRenewal -> `String "PENDING_AUTO_RENEWAL"
   

let load_balancer_tls_certificate_domain_status_to_yojson = 
  fun (x: load_balancer_tls_certificate_domain_status) -> match x with 
 
| Success -> `String "SUCCESS"
  | Failed -> `String "FAILED"
  | PendingValidation -> `String "PENDING_VALIDATION"
   

let load_balancer_tls_certificate_domain_validation_option_to_yojson = 
  fun (x: load_balancer_tls_certificate_domain_validation_option) -> assoc_to_yojson(
    [(
         "validationStatus",
         (option_to_yojson load_balancer_tls_certificate_domain_status_to_yojson x.validation_status));
       (
         "domainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       
  ])

let load_balancer_tls_certificate_domain_validation_option_list_to_yojson = 
  fun tree -> list_to_yojson load_balancer_tls_certificate_domain_validation_option_to_yojson tree

let load_balancer_tls_certificate_renewal_summary_to_yojson = 
  fun (x: load_balancer_tls_certificate_renewal_summary) -> assoc_to_yojson(
    [(
         "domainValidationOptions",
         (option_to_yojson load_balancer_tls_certificate_domain_validation_option_list_to_yojson x.domain_validation_options));
       (
         "renewalStatus",
         (option_to_yojson load_balancer_tls_certificate_renewal_status_to_yojson x.renewal_status));
       
  ])

let load_balancer_tls_certificate_dns_record_creation_state_code_to_yojson = 
  fun (x: load_balancer_tls_certificate_dns_record_creation_state_code) -> match x with 
 
| Failed -> `String "FAILED"
  | Started -> `String "STARTED"
  | Succeeded -> `String "SUCCEEDED"
   

let load_balancer_tls_certificate_dns_record_creation_state_to_yojson = 
  fun (x: load_balancer_tls_certificate_dns_record_creation_state) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "code",
         (option_to_yojson load_balancer_tls_certificate_dns_record_creation_state_code_to_yojson x.code));
       
  ])

let load_balancer_tls_certificate_domain_validation_record_to_yojson = 
  fun (x: load_balancer_tls_certificate_domain_validation_record) -> assoc_to_yojson(
    [(
         "dnsRecordCreationState",
         (option_to_yojson load_balancer_tls_certificate_dns_record_creation_state_to_yojson x.dns_record_creation_state));
       (
         "domainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       (
         "validationStatus",
         (option_to_yojson load_balancer_tls_certificate_domain_status_to_yojson x.validation_status));
       (
         "value",
         (option_to_yojson non_empty_string_to_yojson x.value));
       (
         "type",
         (option_to_yojson non_empty_string_to_yojson x.type_));
       (
         "name",
         (option_to_yojson non_empty_string_to_yojson x.name));
       
  ])

let load_balancer_tls_certificate_domain_validation_record_list_to_yojson = 
  fun tree -> list_to_yojson load_balancer_tls_certificate_domain_validation_record_to_yojson tree

let load_balancer_tls_certificate_failure_reason_to_yojson = 
  fun (x: load_balancer_tls_certificate_failure_reason) -> match x with 
 
| Other -> `String "OTHER"
  | InvalidPublicDomain -> `String "INVALID_PUBLIC_DOMAIN"
  | DomainNotAllowed -> `String "DOMAIN_NOT_ALLOWED"
  | AdditionalVerificationRequired -> `String "ADDITIONAL_VERIFICATION_REQUIRED"
  | NoAvailableContacts -> `String "NO_AVAILABLE_CONTACTS"
   

let load_balancer_tls_certificate_to_yojson = 
  fun (x: load_balancer_tls_certificate) -> assoc_to_yojson(
    [(
         "subjectAlternativeNames",
         (option_to_yojson string_list_to_yojson x.subject_alternative_names));
       (
         "subject",
         (option_to_yojson non_empty_string_to_yojson x.subject));
       (
         "signatureAlgorithm",
         (option_to_yojson non_empty_string_to_yojson x.signature_algorithm));
       (
         "serial",
         (option_to_yojson non_empty_string_to_yojson x.serial));
       (
         "revokedAt",
         (option_to_yojson iso_date_to_yojson x.revoked_at));
       (
         "revocationReason",
         (option_to_yojson load_balancer_tls_certificate_revocation_reason_to_yojson x.revocation_reason));
       (
         "renewalSummary",
         (option_to_yojson load_balancer_tls_certificate_renewal_summary_to_yojson x.renewal_summary));
       (
         "notBefore",
         (option_to_yojson iso_date_to_yojson x.not_before));
       (
         "notAfter",
         (option_to_yojson iso_date_to_yojson x.not_after));
       (
         "keyAlgorithm",
         (option_to_yojson non_empty_string_to_yojson x.key_algorithm));
       (
         "issuer",
         (option_to_yojson non_empty_string_to_yojson x.issuer));
       (
         "issuedAt",
         (option_to_yojson iso_date_to_yojson x.issued_at));
       (
         "failureReason",
         (option_to_yojson load_balancer_tls_certificate_failure_reason_to_yojson x.failure_reason));
       (
         "domainValidationRecords",
         (option_to_yojson load_balancer_tls_certificate_domain_validation_record_list_to_yojson x.domain_validation_records));
       (
         "domainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       (
         "status",
         (option_to_yojson load_balancer_tls_certificate_status_to_yojson x.status));
       (
         "isAttached",
         (option_to_yojson boolean__to_yojson x.is_attached));
       (
         "loadBalancerName",
         (option_to_yojson resource_name_to_yojson x.load_balancer_name));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let load_balancer_tls_certificate_list_to_yojson = 
  fun tree -> list_to_yojson load_balancer_tls_certificate_to_yojson tree

let load_balancer_state_to_yojson = 
  fun (x: load_balancer_state) -> match x with 
 
| Unknown -> `String "unknown"
  | Failed -> `String "failed"
  | ActiveImpaired -> `String "active_impaired"
  | Provisioning -> `String "provisioning"
  | Active -> `String "active"
   

let load_balancer_protocol_to_yojson = 
  fun (x: load_balancer_protocol) -> match x with 
  | HTTP -> `String "HTTP"
    | HTTP_HTTPS -> `String "HTTP_HTTPS"
     

let load_balancer_metric_name_to_yojson = 
  fun (x: load_balancer_metric_name) -> match x with 
 
| RequestCount -> `String "RequestCount"
  | RejectedConnectionCount -> `String "RejectedConnectionCount"
  | InstanceResponseTime -> `String "InstanceResponseTime"
  | HTTPCode_Instance_5XX_Count -> `String "HTTPCode_Instance_5XX_Count"
  | HTTPCode_Instance_4XX_Count -> `String "HTTPCode_Instance_4XX_Count"
  | HTTPCode_Instance_3XX_Count -> `String "HTTPCode_Instance_3XX_Count"
  | HTTPCode_Instance_2XX_Count -> `String "HTTPCode_Instance_2XX_Count"
  | HTTPCode_LB_5XX_Count -> `String "HTTPCode_LB_5XX_Count"
  | HTTPCode_LB_4XX_Count -> `String "HTTPCode_LB_4XX_Count"
  | UnhealthyHostCount -> `String "UnhealthyHostCount"
  | HealthyHostCount -> `String "HealthyHostCount"
  | ClientTLSNegotiationErrorCount -> `String "ClientTLSNegotiationErrorCount"
   

let instance_health_state_to_yojson = 
  fun (x: instance_health_state) -> match x with 
 
| Unavailable -> `String "unavailable"
  | Draining -> `String "draining"
  | Unused -> `String "unused"
  | Unhealthy -> `String "unhealthy"
  | Healthy -> `String "healthy"
  | Initial -> `String "initial"
   

let instance_health_reason_to_yojson = 
  fun (x: instance_health_reason) -> match x with 
 
| InstanceIpUnusable -> `String "Instance.IpUnusable"
  | InstanceInvalidState -> `String "Instance.InvalidState"
  | InstanceDeregistrationInProgress -> `String "Instance.DeregistrationInProgress"
  | InstanceNotInUse -> `String "Instance.NotInUse"
  | InstanceNotRegistered -> `String "Instance.NotRegistered"
  | InstanceFailedHealthChecks -> `String "Instance.FailedHealthChecks"
  | InstanceTimeout -> `String "Instance.Timeout"
  | InstanceResponseCodeMismatch -> `String "Instance.ResponseCodeMismatch"
  | LbInternalError -> `String "Lb.InternalError"
  | LbInitialHealthChecking -> `String "Lb.InitialHealthChecking"
  | LbRegistrationInProgress -> `String "Lb.RegistrationInProgress"
   

let instance_health_summary_to_yojson = 
  fun (x: instance_health_summary) -> assoc_to_yojson(
    [(
         "instanceHealthReason",
         (option_to_yojson instance_health_reason_to_yojson x.instance_health_reason));
       (
         "instanceHealth",
         (option_to_yojson instance_health_state_to_yojson x.instance_health));
       (
         "instanceName",
         (option_to_yojson resource_name_to_yojson x.instance_name));
       
  ])

let instance_health_summary_list_to_yojson = 
  fun tree -> list_to_yojson instance_health_summary_to_yojson tree

let load_balancer_configuration_options_to_yojson = 
  fun tree -> map_to_yojson string__to_yojson tree

let load_balancer_to_yojson = 
  fun (x: load_balancer) -> assoc_to_yojson(
    [(
         "tlsPolicyName",
         (option_to_yojson resource_name_to_yojson x.tls_policy_name));
       (
         "httpsRedirectionEnabled",
         (option_to_yojson boolean__to_yojson x.https_redirection_enabled));
       (
         "ipAddressType",
         (option_to_yojson ip_address_type_to_yojson x.ip_address_type));
       (
         "configurationOptions",
         (option_to_yojson load_balancer_configuration_options_to_yojson x.configuration_options));
       (
         "tlsCertificateSummaries",
         (option_to_yojson load_balancer_tls_certificate_summary_list_to_yojson x.tls_certificate_summaries));
       (
         "instanceHealthSummary",
         (option_to_yojson instance_health_summary_list_to_yojson x.instance_health_summary));
       (
         "instancePort",
         (option_to_yojson integer__to_yojson x.instance_port));
       (
         "healthCheckPath",
         (option_to_yojson non_empty_string_to_yojson x.health_check_path));
       (
         "publicPorts",
         (option_to_yojson port_list_to_yojson x.public_ports));
       (
         "protocol",
         (option_to_yojson load_balancer_protocol_to_yojson x.protocol));
       (
         "state",
         (option_to_yojson load_balancer_state_to_yojson x.state));
       (
         "dnsName",
         (option_to_yojson non_empty_string_to_yojson x.dns_name));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let load_balancer_list_to_yojson = 
  fun tree -> list_to_yojson load_balancer_to_yojson tree

let is_vpc_peered_result_to_yojson = 
  fun (x: is_vpc_peered_result) -> assoc_to_yojson(
    [(
         "isPeered",
         (option_to_yojson boolean__to_yojson x.is_peered));
       
  ])

let is_vpc_peered_request_to_yojson = 
  fun (x: is_vpc_peered_request) -> assoc_to_yojson(
    [
  ])

let import_key_pair_result_to_yojson = 
  fun (x: import_key_pair_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let base64_to_yojson = string_to_yojson

let import_key_pair_request_to_yojson = 
  fun (x: import_key_pair_request) -> assoc_to_yojson(
    [(
         "publicKeyBase64",
         (Some (base64_to_yojson x.public_key_base64)));
       (
         "keyPairName",
         (Some (resource_name_to_yojson x.key_pair_name)));
       
  ])

let get_static_ips_result_to_yojson = 
  fun (x: get_static_ips_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "staticIps",
         (option_to_yojson static_ip_list_to_yojson x.static_ips));
       
  ])

let get_static_ips_request_to_yojson = 
  fun (x: get_static_ips_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_static_ip_result_to_yojson = 
  fun (x: get_static_ip_result) -> assoc_to_yojson(
    [(
         "staticIp",
         (option_to_yojson static_ip_to_yojson x.static_ip));
       
  ])

let get_static_ip_request_to_yojson = 
  fun (x: get_static_ip_request) -> assoc_to_yojson(
    [(
         "staticIpName",
         (Some (resource_name_to_yojson x.static_ip_name)));
       
  ])

let get_setup_history_result_to_yojson = 
  fun (x: get_setup_history_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson setup_history_page_token_to_yojson x.next_page_token));
       (
         "setupHistory",
         (option_to_yojson setup_history_list_to_yojson x.setup_history));
       
  ])

let get_setup_history_request_to_yojson = 
  fun (x: get_setup_history_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson setup_history_page_token_to_yojson x.page_token));
       (
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let get_relational_database_snapshots_result_to_yojson = 
  fun (x: get_relational_database_snapshots_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "relationalDatabaseSnapshots",
         (option_to_yojson relational_database_snapshot_list_to_yojson x.relational_database_snapshots));
       
  ])

let get_relational_database_snapshots_request_to_yojson = 
  fun (x: get_relational_database_snapshots_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_relational_database_snapshot_result_to_yojson = 
  fun (x: get_relational_database_snapshot_result) -> assoc_to_yojson(
    [(
         "relationalDatabaseSnapshot",
         (option_to_yojson relational_database_snapshot_to_yojson x.relational_database_snapshot));
       
  ])

let get_relational_database_snapshot_request_to_yojson = 
  fun (x: get_relational_database_snapshot_request) -> assoc_to_yojson(
    [(
         "relationalDatabaseSnapshotName",
         (Some (resource_name_to_yojson x.relational_database_snapshot_name)));
       
  ])

let get_relational_databases_result_to_yojson = 
  fun (x: get_relational_databases_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "relationalDatabases",
         (option_to_yojson relational_database_list_to_yojson x.relational_databases));
       
  ])

let get_relational_databases_request_to_yojson = 
  fun (x: get_relational_databases_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_relational_database_parameters_result_to_yojson = 
  fun (x: get_relational_database_parameters_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "parameters",
         (option_to_yojson relational_database_parameter_list_to_yojson x.parameters));
       
  ])

let get_relational_database_parameters_request_to_yojson = 
  fun (x: get_relational_database_parameters_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let get_relational_database_metric_data_result_to_yojson = 
  fun (x: get_relational_database_metric_data_result) -> assoc_to_yojson(
    [(
         "metricData",
         (option_to_yojson metric_datapoint_list_to_yojson x.metric_data));
       (
         "metricName",
         (option_to_yojson relational_database_metric_name_to_yojson x.metric_name));
       
  ])

let get_relational_database_metric_data_request_to_yojson = 
  fun (x: get_relational_database_metric_data_request) -> assoc_to_yojson(
    [(
         "statistics",
         (Some (metric_statistic_list_to_yojson x.statistics)));
       (
         "unit",
         (Some (metric_unit_to_yojson x.unit_)));
       (
         "endTime",
         (Some (iso_date_to_yojson x.end_time)));
       (
         "startTime",
         (Some (iso_date_to_yojson x.start_time)));
       (
         "period",
         (Some (metric_period_to_yojson x.period)));
       (
         "metricName",
         (Some (relational_database_metric_name_to_yojson x.metric_name)));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let get_relational_database_master_user_password_result_to_yojson = 
  fun (x: get_relational_database_master_user_password_result) -> assoc_to_yojson(
    [(
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "masterUserPassword",
         (option_to_yojson sensitive_string_to_yojson x.master_user_password));
       
  ])

let get_relational_database_master_user_password_request_to_yojson = 
  fun (x: get_relational_database_master_user_password_request) -> assoc_to_yojson(
    [(
         "passwordVersion",
         (option_to_yojson relational_database_password_version_to_yojson x.password_version));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let get_relational_database_log_streams_result_to_yojson = 
  fun (x: get_relational_database_log_streams_result) -> assoc_to_yojson(
    [(
         "logStreams",
         (option_to_yojson string_list_to_yojson x.log_streams));
       
  ])

let get_relational_database_log_streams_request_to_yojson = 
  fun (x: get_relational_database_log_streams_request) -> assoc_to_yojson(
    [(
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let get_relational_database_log_events_result_to_yojson = 
  fun (x: get_relational_database_log_events_result) -> assoc_to_yojson(
    [(
         "nextForwardToken",
         (option_to_yojson string__to_yojson x.next_forward_token));
       (
         "nextBackwardToken",
         (option_to_yojson string__to_yojson x.next_backward_token));
       (
         "resourceLogEvents",
         (option_to_yojson log_event_list_to_yojson x.resource_log_events));
       
  ])

let get_relational_database_log_events_request_to_yojson = 
  fun (x: get_relational_database_log_events_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "startFromHead",
         (option_to_yojson boolean__to_yojson x.start_from_head));
       (
         "endTime",
         (option_to_yojson iso_date_to_yojson x.end_time));
       (
         "startTime",
         (option_to_yojson iso_date_to_yojson x.start_time));
       (
         "logStreamName",
         (Some (string__to_yojson x.log_stream_name)));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let get_relational_database_events_result_to_yojson = 
  fun (x: get_relational_database_events_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "relationalDatabaseEvents",
         (option_to_yojson relational_database_event_list_to_yojson x.relational_database_events));
       
  ])

let get_relational_database_events_request_to_yojson = 
  fun (x: get_relational_database_events_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "durationInMinutes",
         (option_to_yojson integer__to_yojson x.duration_in_minutes));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let get_relational_database_bundles_result_to_yojson = 
  fun (x: get_relational_database_bundles_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "bundles",
         (option_to_yojson relational_database_bundle_list_to_yojson x.bundles));
       
  ])

let get_relational_database_bundles_request_to_yojson = 
  fun (x: get_relational_database_bundles_request) -> assoc_to_yojson(
    [(
         "includeInactive",
         (option_to_yojson boolean__to_yojson x.include_inactive));
       (
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_relational_database_blueprints_result_to_yojson = 
  fun (x: get_relational_database_blueprints_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "blueprints",
         (option_to_yojson relational_database_blueprint_list_to_yojson x.blueprints));
       
  ])

let get_relational_database_blueprints_request_to_yojson = 
  fun (x: get_relational_database_blueprints_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_relational_database_result_to_yojson = 
  fun (x: get_relational_database_result) -> assoc_to_yojson(
    [(
         "relationalDatabase",
         (option_to_yojson relational_database_to_yojson x.relational_database));
       
  ])

let get_relational_database_request_to_yojson = 
  fun (x: get_relational_database_request) -> assoc_to_yojson(
    [(
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let get_regions_result_to_yojson = 
  fun (x: get_regions_result) -> assoc_to_yojson(
    [(
         "regions",
         (option_to_yojson region_list_to_yojson x.regions));
       
  ])

let get_regions_request_to_yojson = 
  fun (x: get_regions_request) -> assoc_to_yojson(
    [(
         "includeRelationalDatabaseAvailabilityZones",
         (option_to_yojson boolean__to_yojson x.include_relational_database_availability_zones));
       (
         "includeAvailabilityZones",
         (option_to_yojson boolean__to_yojson x.include_availability_zones));
       
  ])

let get_operations_for_resource_result_to_yojson = 
  fun (x: get_operations_for_resource_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "nextPageCount",
         (option_to_yojson string__to_yojson x.next_page_count));
       (
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let get_operations_for_resource_request_to_yojson = 
  fun (x: get_operations_for_resource_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let get_operations_result_to_yojson = 
  fun (x: get_operations_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let get_operations_request_to_yojson = 
  fun (x: get_operations_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_operation_result_to_yojson = 
  fun (x: get_operation_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let get_operation_request_to_yojson = 
  fun (x: get_operation_request) -> assoc_to_yojson(
    [(
         "operationId",
         (Some (non_empty_string_to_yojson x.operation_id)));
       
  ])

let get_load_balancer_tls_policies_result_to_yojson = 
  fun (x: get_load_balancer_tls_policies_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "tlsPolicies",
         (option_to_yojson load_balancer_tls_policy_list_to_yojson x.tls_policies));
       
  ])

let get_load_balancer_tls_policies_request_to_yojson = 
  fun (x: get_load_balancer_tls_policies_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_load_balancer_tls_certificates_result_to_yojson = 
  fun (x: get_load_balancer_tls_certificates_result) -> assoc_to_yojson(
    [(
         "tlsCertificates",
         (option_to_yojson load_balancer_tls_certificate_list_to_yojson x.tls_certificates));
       
  ])

let get_load_balancer_tls_certificates_request_to_yojson = 
  fun (x: get_load_balancer_tls_certificates_request) -> assoc_to_yojson(
    [(
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let get_load_balancers_result_to_yojson = 
  fun (x: get_load_balancers_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "loadBalancers",
         (option_to_yojson load_balancer_list_to_yojson x.load_balancers));
       
  ])

let get_load_balancers_request_to_yojson = 
  fun (x: get_load_balancers_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_load_balancer_metric_data_result_to_yojson = 
  fun (x: get_load_balancer_metric_data_result) -> assoc_to_yojson(
    [(
         "metricData",
         (option_to_yojson metric_datapoint_list_to_yojson x.metric_data));
       (
         "metricName",
         (option_to_yojson load_balancer_metric_name_to_yojson x.metric_name));
       
  ])

let get_load_balancer_metric_data_request_to_yojson = 
  fun (x: get_load_balancer_metric_data_request) -> assoc_to_yojson(
    [(
         "statistics",
         (Some (metric_statistic_list_to_yojson x.statistics)));
       (
         "unit",
         (Some (metric_unit_to_yojson x.unit_)));
       (
         "endTime",
         (Some (timestamp__to_yojson x.end_time)));
       (
         "startTime",
         (Some (timestamp__to_yojson x.start_time)));
       (
         "period",
         (Some (metric_period_to_yojson x.period)));
       (
         "metricName",
         (Some (load_balancer_metric_name_to_yojson x.metric_name)));
       (
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let get_load_balancer_result_to_yojson = 
  fun (x: get_load_balancer_result) -> assoc_to_yojson(
    [(
         "loadBalancer",
         (option_to_yojson load_balancer_to_yojson x.load_balancer));
       
  ])

let get_load_balancer_request_to_yojson = 
  fun (x: get_load_balancer_request) -> assoc_to_yojson(
    [(
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let key_pair_to_yojson = 
  fun (x: key_pair) -> assoc_to_yojson(
    [(
         "fingerprint",
         (option_to_yojson base64_to_yojson x.fingerprint));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let key_pair_list_to_yojson = 
  fun tree -> list_to_yojson key_pair_to_yojson tree

let get_key_pairs_result_to_yojson = 
  fun (x: get_key_pairs_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "keyPairs",
         (option_to_yojson key_pair_list_to_yojson x.key_pairs));
       
  ])

let get_key_pairs_request_to_yojson = 
  fun (x: get_key_pairs_request) -> assoc_to_yojson(
    [(
         "includeDefaultKeyPair",
         (option_to_yojson boolean__to_yojson x.include_default_key_pair));
       (
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_key_pair_result_to_yojson = 
  fun (x: get_key_pair_result) -> assoc_to_yojson(
    [(
         "keyPair",
         (option_to_yojson key_pair_to_yojson x.key_pair));
       
  ])

let get_key_pair_request_to_yojson = 
  fun (x: get_key_pair_request) -> assoc_to_yojson(
    [(
         "keyPairName",
         (Some (resource_name_to_yojson x.key_pair_name)));
       
  ])

let instance_state_to_yojson = 
  fun (x: instance_state) -> assoc_to_yojson(
    [(
         "name",
         (option_to_yojson string__to_yojson x.name));
       (
         "code",
         (option_to_yojson integer__to_yojson x.code));
       
  ])

let get_instance_state_result_to_yojson = 
  fun (x: get_instance_state_result) -> assoc_to_yojson(
    [(
         "state",
         (option_to_yojson instance_state_to_yojson x.state));
       
  ])

let get_instance_state_request_to_yojson = 
  fun (x: get_instance_state_request) -> assoc_to_yojson(
    [(
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let instance_snapshot_state_to_yojson = 
  fun (x: instance_snapshot_state) -> match x with 
 
| Available -> `String "available"
  | Error -> `String "error"
  | Pending -> `String "pending"
   

let add_on_to_yojson = 
  fun (x: add_on) -> assoc_to_yojson(
    [(
         "duration",
         (option_to_yojson string__to_yojson x.duration));
       (
         "threshold",
         (option_to_yojson string__to_yojson x.threshold));
       (
         "nextSnapshotTimeOfDay",
         (option_to_yojson time_of_day_to_yojson x.next_snapshot_time_of_day));
       (
         "snapshotTimeOfDay",
         (option_to_yojson time_of_day_to_yojson x.snapshot_time_of_day));
       (
         "status",
         (option_to_yojson string__to_yojson x.status));
       (
         "name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let add_on_list_to_yojson = 
  fun tree -> list_to_yojson add_on_to_yojson tree

let disk_state_to_yojson = 
  fun (x: disk_state) -> match x with 
 
| Unknown -> `String "unknown"
  | InUse -> `String "in-use"
  | Available -> `String "available"
  | Error -> `String "error"
  | Pending -> `String "pending"
   

let auto_mount_status_to_yojson = 
  fun (x: auto_mount_status) -> match x with 
 
| NotMounted -> `String "NotMounted"
  | Mounted -> `String "Mounted"
  | Pending -> `String "Pending"
  | Failed -> `String "Failed"
   

let disk_to_yojson = 
  fun (x: disk) -> assoc_to_yojson(
    [(
         "autoMountStatus",
         (option_to_yojson auto_mount_status_to_yojson x.auto_mount_status));
       (
         "gbInUse",
         (option_to_yojson integer__to_yojson x.gb_in_use));
       (
         "attachmentState",
         (option_to_yojson string__to_yojson x.attachment_state));
       (
         "isAttached",
         (option_to_yojson boolean__to_yojson x.is_attached));
       (
         "attachedTo",
         (option_to_yojson resource_name_to_yojson x.attached_to));
       (
         "state",
         (option_to_yojson disk_state_to_yojson x.state));
       (
         "path",
         (option_to_yojson string__to_yojson x.path));
       (
         "iops",
         (option_to_yojson integer__to_yojson x.iops));
       (
         "isSystemDisk",
         (option_to_yojson boolean__to_yojson x.is_system_disk));
       (
         "sizeInGb",
         (option_to_yojson integer__to_yojson x.size_in_gb));
       (
         "addOns",
         (option_to_yojson add_on_list_to_yojson x.add_ons));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let disk_list_to_yojson = fun tree -> list_to_yojson disk_to_yojson tree

let instance_snapshot_to_yojson = 
  fun (x: instance_snapshot) -> assoc_to_yojson(
    [(
         "sizeInGb",
         (option_to_yojson integer__to_yojson x.size_in_gb));
       (
         "isFromAutoSnapshot",
         (option_to_yojson boolean__to_yojson x.is_from_auto_snapshot));
       (
         "fromBundleId",
         (option_to_yojson string__to_yojson x.from_bundle_id));
       (
         "fromBlueprintId",
         (option_to_yojson string__to_yojson x.from_blueprint_id));
       (
         "fromInstanceArn",
         (option_to_yojson non_empty_string_to_yojson x.from_instance_arn));
       (
         "fromInstanceName",
         (option_to_yojson resource_name_to_yojson x.from_instance_name));
       (
         "fromAttachedDisks",
         (option_to_yojson disk_list_to_yojson x.from_attached_disks));
       (
         "progress",
         (option_to_yojson string__to_yojson x.progress));
       (
         "state",
         (option_to_yojson instance_snapshot_state_to_yojson x.state));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let instance_snapshot_list_to_yojson = 
  fun tree -> list_to_yojson instance_snapshot_to_yojson tree

let get_instance_snapshots_result_to_yojson = 
  fun (x: get_instance_snapshots_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "instanceSnapshots",
         (option_to_yojson instance_snapshot_list_to_yojson x.instance_snapshots));
       
  ])

let get_instance_snapshots_request_to_yojson = 
  fun (x: get_instance_snapshots_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_instance_snapshot_result_to_yojson = 
  fun (x: get_instance_snapshot_result) -> assoc_to_yojson(
    [(
         "instanceSnapshot",
         (option_to_yojson instance_snapshot_to_yojson x.instance_snapshot));
       
  ])

let get_instance_snapshot_request_to_yojson = 
  fun (x: get_instance_snapshot_request) -> assoc_to_yojson(
    [(
         "instanceSnapshotName",
         (Some (resource_name_to_yojson x.instance_snapshot_name)));
       
  ])

let ipv6_address_to_yojson = string_to_yojson

let ipv6_address_list_to_yojson = 
  fun tree -> list_to_yojson ipv6_address_to_yojson tree

let instance_hardware_to_yojson = 
  fun (x: instance_hardware) -> assoc_to_yojson(
    [(
         "ramSizeInGb",
         (option_to_yojson float__to_yojson x.ram_size_in_gb));
       (
         "disks",
         (option_to_yojson disk_list_to_yojson x.disks));
       (
         "cpuCount",
         (option_to_yojson integer__to_yojson x.cpu_count));
       
  ])

let access_direction_to_yojson = 
  fun (x: access_direction) -> match x with 
  | Outbound -> `String "outbound"
    | Inbound -> `String "inbound"
     

let instance_port_info_to_yojson = 
  fun (x: instance_port_info) -> assoc_to_yojson(
    [(
         "cidrListAliases",
         (option_to_yojson string_list_to_yojson x.cidr_list_aliases));
       (
         "ipv6Cidrs",
         (option_to_yojson string_list_to_yojson x.ipv6_cidrs));
       (
         "cidrs",
         (option_to_yojson string_list_to_yojson x.cidrs));
       (
         "accessDirection",
         (option_to_yojson access_direction_to_yojson x.access_direction));
       (
         "commonName",
         (option_to_yojson string__to_yojson x.common_name));
       (
         "accessType",
         (option_to_yojson port_access_type_to_yojson x.access_type));
       (
         "accessFrom",
         (option_to_yojson string__to_yojson x.access_from));
       (
         "protocol",
         (option_to_yojson network_protocol_to_yojson x.protocol));
       (
         "toPort",
         (option_to_yojson port_to_yojson x.to_port));
       (
         "fromPort",
         (option_to_yojson port_to_yojson x.from_port));
       
  ])

let instance_port_info_list_to_yojson = 
  fun tree -> list_to_yojson instance_port_info_to_yojson tree

let instance_networking_to_yojson = 
  fun (x: instance_networking) -> assoc_to_yojson(
    [(
         "ports",
         (option_to_yojson instance_port_info_list_to_yojson x.ports));
       (
         "monthlyTransfer",
         (option_to_yojson monthly_transfer_to_yojson x.monthly_transfer));
       
  ])

let instance_metadata_state_to_yojson = 
  fun (x: instance_metadata_state) -> match x with 
  | Applied -> `String "applied"
    | Pending -> `String "pending"
     

let instance_metadata_options_to_yojson = 
  fun (x: instance_metadata_options) -> assoc_to_yojson(
    [(
         "httpProtocolIpv6",
         (option_to_yojson http_protocol_ipv6_to_yojson x.http_protocol_ipv6));
       (
         "httpPutResponseHopLimit",
         (option_to_yojson integer__to_yojson x.http_put_response_hop_limit));
       (
         "httpEndpoint",
         (option_to_yojson http_endpoint_to_yojson x.http_endpoint));
       (
         "httpTokens",
         (option_to_yojson http_tokens_to_yojson x.http_tokens));
       (
         "state",
         (option_to_yojson instance_metadata_state_to_yojson x.state));
       
  ])

let instance_to_yojson = 
  fun (x: instance) -> assoc_to_yojson(
    [(
         "metadataOptions",
         (option_to_yojson instance_metadata_options_to_yojson x.metadata_options));
       (
         "sshKeyName",
         (option_to_yojson resource_name_to_yojson x.ssh_key_name));
       (
         "username",
         (option_to_yojson non_empty_string_to_yojson x.username));
       (
         "state",
         (option_to_yojson instance_state_to_yojson x.state));
       (
         "networking",
         (option_to_yojson instance_networking_to_yojson x.networking));
       (
         "hardware",
         (option_to_yojson instance_hardware_to_yojson x.hardware));
       (
         "ipAddressType",
         (option_to_yojson ip_address_type_to_yojson x.ip_address_type));
       (
         "ipv6Addresses",
         (option_to_yojson ipv6_address_list_to_yojson x.ipv6_addresses));
       (
         "publicIpAddress",
         (option_to_yojson ip_address_to_yojson x.public_ip_address));
       (
         "privateIpAddress",
         (option_to_yojson ip_address_to_yojson x.private_ip_address));
       (
         "isStaticIp",
         (option_to_yojson boolean__to_yojson x.is_static_ip));
       (
         "addOns",
         (option_to_yojson add_on_list_to_yojson x.add_ons));
       (
         "bundleId",
         (option_to_yojson non_empty_string_to_yojson x.bundle_id));
       (
         "blueprintName",
         (option_to_yojson non_empty_string_to_yojson x.blueprint_name));
       (
         "blueprintId",
         (option_to_yojson non_empty_string_to_yojson x.blueprint_id));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let instance_list_to_yojson = 
  fun tree -> list_to_yojson instance_to_yojson tree

let get_instances_result_to_yojson = 
  fun (x: get_instances_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "instances",
         (option_to_yojson instance_list_to_yojson x.instances));
       
  ])

let get_instances_request_to_yojson = 
  fun (x: get_instances_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let instance_port_state_to_yojson = 
  fun (x: instance_port_state) -> assoc_to_yojson(
    [(
         "cidrListAliases",
         (option_to_yojson string_list_to_yojson x.cidr_list_aliases));
       (
         "ipv6Cidrs",
         (option_to_yojson string_list_to_yojson x.ipv6_cidrs));
       (
         "cidrs",
         (option_to_yojson string_list_to_yojson x.cidrs));
       (
         "state",
         (option_to_yojson port_state_to_yojson x.state));
       (
         "protocol",
         (option_to_yojson network_protocol_to_yojson x.protocol));
       (
         "toPort",
         (option_to_yojson port_to_yojson x.to_port));
       (
         "fromPort",
         (option_to_yojson port_to_yojson x.from_port));
       
  ])

let instance_port_state_list_to_yojson = 
  fun tree -> list_to_yojson instance_port_state_to_yojson tree

let get_instance_port_states_result_to_yojson = 
  fun (x: get_instance_port_states_result) -> assoc_to_yojson(
    [(
         "portStates",
         (option_to_yojson instance_port_state_list_to_yojson x.port_states));
       
  ])

let get_instance_port_states_request_to_yojson = 
  fun (x: get_instance_port_states_request) -> assoc_to_yojson(
    [(
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let instance_metric_name_to_yojson = 
  fun (x: instance_metric_name) -> match x with 
 
| MetadataNoToken -> `String "MetadataNoToken"
  | BurstCapacityPercentage -> `String "BurstCapacityPercentage"
  | BurstCapacityTime -> `String "BurstCapacityTime"
  | StatusCheckFailed_System -> `String "StatusCheckFailed_System"
  | StatusCheckFailed_Instance -> `String "StatusCheckFailed_Instance"
  | StatusCheckFailed -> `String "StatusCheckFailed"
  | NetworkOut -> `String "NetworkOut"
  | NetworkIn -> `String "NetworkIn"
  | CPUUtilization -> `String "CPUUtilization"
   

let get_instance_metric_data_result_to_yojson = 
  fun (x: get_instance_metric_data_result) -> assoc_to_yojson(
    [(
         "metricData",
         (option_to_yojson metric_datapoint_list_to_yojson x.metric_data));
       (
         "metricName",
         (option_to_yojson instance_metric_name_to_yojson x.metric_name));
       
  ])

let get_instance_metric_data_request_to_yojson = 
  fun (x: get_instance_metric_data_request) -> assoc_to_yojson(
    [(
         "statistics",
         (Some (metric_statistic_list_to_yojson x.statistics)));
       (
         "unit",
         (Some (metric_unit_to_yojson x.unit_)));
       (
         "endTime",
         (Some (timestamp__to_yojson x.end_time)));
       (
         "startTime",
         (Some (timestamp__to_yojson x.start_time)));
       (
         "period",
         (Some (metric_period_to_yojson x.period)));
       (
         "metricName",
         (Some (instance_metric_name_to_yojson x.metric_name)));
       (
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let instance_access_protocol_to_yojson = 
  fun (x: instance_access_protocol) -> match x with 
  | Rdp -> `String "rdp"
    | Ssh -> `String "ssh"
     

let host_key_attributes_to_yojson = 
  fun (x: host_key_attributes) -> assoc_to_yojson(
    [(
         "notValidAfter",
         (option_to_yojson iso_date_to_yojson x.not_valid_after));
       (
         "notValidBefore",
         (option_to_yojson iso_date_to_yojson x.not_valid_before));
       (
         "fingerprintSHA256",
         (option_to_yojson string__to_yojson x.fingerprint_sh_a256));
       (
         "fingerprintSHA1",
         (option_to_yojson string__to_yojson x.fingerprint_sh_a1));
       (
         "witnessedAt",
         (option_to_yojson iso_date_to_yojson x.witnessed_at));
       (
         "publicKey",
         (option_to_yojson string__to_yojson x.public_key));
       (
         "algorithm",
         (option_to_yojson string__to_yojson x.algorithm));
       
  ])

let host_keys_list_to_yojson = 
  fun tree -> list_to_yojson host_key_attributes_to_yojson tree

let instance_access_details_to_yojson = 
  fun (x: instance_access_details) -> assoc_to_yojson(
    [(
         "hostKeys",
         (option_to_yojson host_keys_list_to_yojson x.host_keys));
       (
         "username",
         (option_to_yojson string__to_yojson x.username));
       (
         "instanceName",
         (option_to_yojson resource_name_to_yojson x.instance_name));
       (
         "protocol",
         (option_to_yojson instance_access_protocol_to_yojson x.protocol));
       (
         "privateKey",
         (option_to_yojson string__to_yojson x.private_key));
       (
         "passwordData",
         (option_to_yojson password_data_to_yojson x.password_data));
       (
         "password",
         (option_to_yojson string__to_yojson x.password));
       (
         "ipv6Addresses",
         (option_to_yojson ipv6_address_list_to_yojson x.ipv6_addresses));
       (
         "ipAddress",
         (option_to_yojson ip_address_to_yojson x.ip_address));
       (
         "expiresAt",
         (option_to_yojson iso_date_to_yojson x.expires_at));
       (
         "certKey",
         (option_to_yojson string__to_yojson x.cert_key));
       
  ])

let get_instance_access_details_result_to_yojson = 
  fun (x: get_instance_access_details_result) -> assoc_to_yojson(
    [(
         "accessDetails",
         (option_to_yojson instance_access_details_to_yojson x.access_details));
       
  ])

let get_instance_access_details_request_to_yojson = 
  fun (x: get_instance_access_details_request) -> assoc_to_yojson(
    [(
         "protocol",
         (option_to_yojson instance_access_protocol_to_yojson x.protocol));
       (
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let get_instance_result_to_yojson = 
  fun (x: get_instance_result) -> assoc_to_yojson(
    [(
         "instance",
         (option_to_yojson instance_to_yojson x.instance));
       
  ])

let get_instance_request_to_yojson = 
  fun (x: get_instance_request) -> assoc_to_yojson(
    [(
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let export_snapshot_record_source_type_to_yojson = 
  fun (x: export_snapshot_record_source_type) -> match x with 
 
| DiskSnapshot -> `String "DiskSnapshot"
  | InstanceSnapshot -> `String "InstanceSnapshot"
   

let disk_info_to_yojson = 
  fun (x: disk_info) -> assoc_to_yojson(
    [(
         "isSystemDisk",
         (option_to_yojson boolean__to_yojson x.is_system_disk));
       (
         "sizeInGb",
         (option_to_yojson integer__to_yojson x.size_in_gb));
       (
         "path",
         (option_to_yojson non_empty_string_to_yojson x.path));
       (
         "name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let disk_info_list_to_yojson = 
  fun tree -> list_to_yojson disk_info_to_yojson tree

let instance_snapshot_info_to_yojson = 
  fun (x: instance_snapshot_info) -> assoc_to_yojson(
    [(
         "fromDiskInfo",
         (option_to_yojson disk_info_list_to_yojson x.from_disk_info));
       (
         "fromBlueprintId",
         (option_to_yojson non_empty_string_to_yojson x.from_blueprint_id));
       (
         "fromBundleId",
         (option_to_yojson non_empty_string_to_yojson x.from_bundle_id));
       
  ])

let disk_snapshot_info_to_yojson = 
  fun (x: disk_snapshot_info) -> assoc_to_yojson(
    [(
         "sizeInGb",
         (option_to_yojson integer__to_yojson x.size_in_gb));
       
  ])

let export_snapshot_record_source_info_to_yojson = 
  fun (x: export_snapshot_record_source_info) -> assoc_to_yojson(
    [(
         "diskSnapshotInfo",
         (option_to_yojson disk_snapshot_info_to_yojson x.disk_snapshot_info));
       (
         "instanceSnapshotInfo",
         (option_to_yojson instance_snapshot_info_to_yojson x.instance_snapshot_info));
       (
         "fromResourceArn",
         (option_to_yojson non_empty_string_to_yojson x.from_resource_arn));
       (
         "fromResourceName",
         (option_to_yojson non_empty_string_to_yojson x.from_resource_name));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson non_empty_string_to_yojson x.name));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "resourceType",
         (option_to_yojson export_snapshot_record_source_type_to_yojson x.resource_type));
       
  ])

let destination_info_to_yojson = 
  fun (x: destination_info) -> assoc_to_yojson(
    [(
         "service",
         (option_to_yojson non_empty_string_to_yojson x.service));
       (
         "id",
         (option_to_yojson non_empty_string_to_yojson x.id));
       
  ])

let export_snapshot_record_to_yojson = 
  fun (x: export_snapshot_record) -> assoc_to_yojson(
    [(
         "destinationInfo",
         (option_to_yojson destination_info_to_yojson x.destination_info));
       (
         "sourceInfo",
         (option_to_yojson export_snapshot_record_source_info_to_yojson x.source_info));
       (
         "state",
         (option_to_yojson record_state_to_yojson x.state));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let export_snapshot_record_list_to_yojson = 
  fun tree -> list_to_yojson export_snapshot_record_to_yojson tree

let get_export_snapshot_records_result_to_yojson = 
  fun (x: get_export_snapshot_records_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "exportSnapshotRecords",
         (option_to_yojson export_snapshot_record_list_to_yojson x.export_snapshot_records));
       
  ])

let get_export_snapshot_records_request_to_yojson = 
  fun (x: get_export_snapshot_records_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let domain_entry_list_to_yojson = 
  fun tree -> list_to_yojson domain_entry_to_yojson tree

let domain_to_yojson = 
  fun (x: domain) -> assoc_to_yojson(
    [(
         "registeredDomainDelegationInfo",
         (option_to_yojson registered_domain_delegation_info_to_yojson x.registered_domain_delegation_info));
       (
         "domainEntries",
         (option_to_yojson domain_entry_list_to_yojson x.domain_entries));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let domain_list_to_yojson = 
  fun tree -> list_to_yojson domain_to_yojson tree

let get_domains_result_to_yojson = 
  fun (x: get_domains_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "domains",
         (option_to_yojson domain_list_to_yojson x.domains));
       
  ])

let get_domains_request_to_yojson = 
  fun (x: get_domains_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_domain_result_to_yojson = 
  fun (x: get_domain_result) -> assoc_to_yojson(
    [(
         "domain",
         (option_to_yojson domain_to_yojson x.domain));
       
  ])

let get_domain_request_to_yojson = 
  fun (x: get_domain_request) -> assoc_to_yojson(
    [(
         "domainName",
         (Some (domain_name_to_yojson x.domain_name)));
       
  ])

let lightsail_distribution_to_yojson = 
  fun (x: lightsail_distribution) -> assoc_to_yojson(
    [(
         "viewerMinimumTlsProtocolVersion",
         (option_to_yojson string__to_yojson x.viewer_minimum_tls_protocol_version));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ipAddressType",
         (option_to_yojson ip_address_type_to_yojson x.ip_address_type));
       (
         "ableToUpdateBundle",
         (option_to_yojson boolean__to_yojson x.able_to_update_bundle));
       (
         "cacheBehaviors",
         (option_to_yojson cache_behavior_list_to_yojson x.cache_behaviors));
       (
         "cacheBehaviorSettings",
         (option_to_yojson cache_settings_to_yojson x.cache_behavior_settings));
       (
         "defaultCacheBehavior",
         (option_to_yojson cache_behavior_to_yojson x.default_cache_behavior));
       (
         "originPublicDNS",
         (option_to_yojson string__to_yojson x.origin_public_dn_s));
       (
         "origin",
         (option_to_yojson origin_to_yojson x.origin));
       (
         "certificateName",
         (option_to_yojson resource_name_to_yojson x.certificate_name));
       (
         "bundleId",
         (option_to_yojson string__to_yojson x.bundle_id));
       (
         "domainName",
         (option_to_yojson string__to_yojson x.domain_name));
       (
         "isEnabled",
         (option_to_yojson boolean__to_yojson x.is_enabled));
       (
         "status",
         (option_to_yojson string__to_yojson x.status));
       (
         "alternativeDomainNames",
         (option_to_yojson string_list_to_yojson x.alternative_domain_names));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let distribution_list_to_yojson = 
  fun tree -> list_to_yojson lightsail_distribution_to_yojson tree

let get_distributions_result_to_yojson = 
  fun (x: get_distributions_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "distributions",
         (option_to_yojson distribution_list_to_yojson x.distributions));
       
  ])

let get_distributions_request_to_yojson = 
  fun (x: get_distributions_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "distributionName",
         (option_to_yojson resource_name_to_yojson x.distribution_name));
       
  ])

let distribution_metric_name_to_yojson = 
  fun (x: distribution_metric_name) -> match x with 
 
| Http5xxErrorRate -> `String "Http5xxErrorRate"
  | Http4xxErrorRate -> `String "Http4xxErrorRate"
  | TotalErrorRate -> `String "TotalErrorRate"
  | BytesUploaded -> `String "BytesUploaded"
  | BytesDownloaded -> `String "BytesDownloaded"
  | Requests -> `String "Requests"
   

let get_distribution_metric_data_result_to_yojson = 
  fun (x: get_distribution_metric_data_result) -> assoc_to_yojson(
    [(
         "metricData",
         (option_to_yojson metric_datapoint_list_to_yojson x.metric_data));
       (
         "metricName",
         (option_to_yojson distribution_metric_name_to_yojson x.metric_name));
       
  ])

let get_distribution_metric_data_request_to_yojson = 
  fun (x: get_distribution_metric_data_request) -> assoc_to_yojson(
    [(
         "statistics",
         (Some (metric_statistic_list_to_yojson x.statistics)));
       (
         "unit",
         (Some (metric_unit_to_yojson x.unit_)));
       (
         "period",
         (Some (metric_period_to_yojson x.period)));
       (
         "endTime",
         (Some (timestamp__to_yojson x.end_time)));
       (
         "startTime",
         (Some (timestamp__to_yojson x.start_time)));
       (
         "metricName",
         (Some (distribution_metric_name_to_yojson x.metric_name)));
       (
         "distributionName",
         (Some (resource_name_to_yojson x.distribution_name)));
       
  ])

let get_distribution_latest_cache_reset_result_to_yojson = 
  fun (x: get_distribution_latest_cache_reset_result) -> assoc_to_yojson(
    [(
         "createTime",
         (option_to_yojson iso_date_to_yojson x.create_time));
       (
         "status",
         (option_to_yojson string__to_yojson x.status));
       
  ])

let get_distribution_latest_cache_reset_request_to_yojson = 
  fun (x: get_distribution_latest_cache_reset_request) -> assoc_to_yojson(
    [(
         "distributionName",
         (option_to_yojson resource_name_to_yojson x.distribution_name));
       
  ])

let distribution_bundle_to_yojson = 
  fun (x: distribution_bundle) -> assoc_to_yojson(
    [(
         "isActive",
         (option_to_yojson boolean__to_yojson x.is_active));
       (
         "transferPerMonthInGb",
         (option_to_yojson integer__to_yojson x.transfer_per_month_in_gb));
       (
         "price",
         (option_to_yojson float__to_yojson x.price));
       (
         "name",
         (option_to_yojson string__to_yojson x.name));
       (
         "bundleId",
         (option_to_yojson string__to_yojson x.bundle_id));
       
  ])

let distribution_bundle_list_to_yojson = 
  fun tree -> list_to_yojson distribution_bundle_to_yojson tree

let get_distribution_bundles_result_to_yojson = 
  fun (x: get_distribution_bundles_result) -> assoc_to_yojson(
    [(
         "bundles",
         (option_to_yojson distribution_bundle_list_to_yojson x.bundles));
       
  ])

let get_distribution_bundles_request_to_yojson = 
  fun (x: get_distribution_bundles_request) -> assoc_to_yojson(
    [
  ])

let disk_snapshot_state_to_yojson = 
  fun (x: disk_snapshot_state) -> match x with 
 
| Unknown -> `String "unknown"
  | Error -> `String "error"
  | Completed -> `String "completed"
  | Pending -> `String "pending"
   

let disk_snapshot_to_yojson = 
  fun (x: disk_snapshot) -> assoc_to_yojson(
    [(
         "isFromAutoSnapshot",
         (option_to_yojson boolean__to_yojson x.is_from_auto_snapshot));
       (
         "fromInstanceArn",
         (option_to_yojson non_empty_string_to_yojson x.from_instance_arn));
       (
         "fromInstanceName",
         (option_to_yojson resource_name_to_yojson x.from_instance_name));
       (
         "fromDiskArn",
         (option_to_yojson non_empty_string_to_yojson x.from_disk_arn));
       (
         "fromDiskName",
         (option_to_yojson resource_name_to_yojson x.from_disk_name));
       (
         "progress",
         (option_to_yojson string__to_yojson x.progress));
       (
         "state",
         (option_to_yojson disk_snapshot_state_to_yojson x.state));
       (
         "sizeInGb",
         (option_to_yojson integer__to_yojson x.size_in_gb));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let disk_snapshot_list_to_yojson = 
  fun tree -> list_to_yojson disk_snapshot_to_yojson tree

let get_disk_snapshots_result_to_yojson = 
  fun (x: get_disk_snapshots_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "diskSnapshots",
         (option_to_yojson disk_snapshot_list_to_yojson x.disk_snapshots));
       
  ])

let get_disk_snapshots_request_to_yojson = 
  fun (x: get_disk_snapshots_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_disk_snapshot_result_to_yojson = 
  fun (x: get_disk_snapshot_result) -> assoc_to_yojson(
    [(
         "diskSnapshot",
         (option_to_yojson disk_snapshot_to_yojson x.disk_snapshot));
       
  ])

let get_disk_snapshot_request_to_yojson = 
  fun (x: get_disk_snapshot_request) -> assoc_to_yojson(
    [(
         "diskSnapshotName",
         (Some (resource_name_to_yojson x.disk_snapshot_name)));
       
  ])

let get_disks_result_to_yojson = 
  fun (x: get_disks_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "disks",
         (option_to_yojson disk_list_to_yojson x.disks));
       
  ])

let get_disks_request_to_yojson = 
  fun (x: get_disks_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let get_disk_result_to_yojson = 
  fun (x: get_disk_result) -> assoc_to_yojson(
    [(
         "disk",
         (option_to_yojson disk_to_yojson x.disk));
       
  ])

let get_disk_request_to_yojson = 
  fun (x: get_disk_request) -> assoc_to_yojson(
    [(
         "diskName",
         (Some (resource_name_to_yojson x.disk_name)));
       
  ])

let get_cost_estimate_result_to_yojson = 
  fun (x: get_cost_estimate_result) -> assoc_to_yojson(
    [(
         "resourcesBudgetEstimate",
         (option_to_yojson resources_budget_estimate_to_yojson x.resources_budget_estimate));
       
  ])

let get_cost_estimate_request_to_yojson = 
  fun (x: get_cost_estimate_request) -> assoc_to_yojson(
    [(
         "endTime",
         (Some (iso_date_to_yojson x.end_time)));
       (
         "startTime",
         (Some (iso_date_to_yojson x.start_time)));
       (
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let container_service_list_to_yojson = 
  fun tree -> list_to_yojson container_service_to_yojson tree

let container_services_list_result_to_yojson = 
  fun (x: container_services_list_result) -> assoc_to_yojson(
    [(
         "containerServices",
         (option_to_yojson container_service_list_to_yojson x.container_services));
       
  ])

let get_container_services_request_to_yojson = 
  fun (x: get_container_services_request) -> assoc_to_yojson(
    [(
         "serviceName",
         (option_to_yojson container_service_name_to_yojson x.service_name));
       
  ])

let container_service_power_to_yojson = 
  fun (x: container_service_power) -> assoc_to_yojson(
    [(
         "isActive",
         (option_to_yojson boolean__to_yojson x.is_active));
       (
         "name",
         (option_to_yojson string__to_yojson x.name));
       (
         "ramSizeInGb",
         (option_to_yojson float__to_yojson x.ram_size_in_gb));
       (
         "cpuCount",
         (option_to_yojson float__to_yojson x.cpu_count));
       (
         "price",
         (option_to_yojson float__to_yojson x.price));
       (
         "powerId",
         (option_to_yojson string__to_yojson x.power_id));
       
  ])

let container_service_power_list_to_yojson = 
  fun tree -> list_to_yojson container_service_power_to_yojson tree

let get_container_service_powers_result_to_yojson = 
  fun (x: get_container_service_powers_result) -> assoc_to_yojson(
    [(
         "powers",
         (option_to_yojson container_service_power_list_to_yojson x.powers));
       
  ])

let get_container_service_powers_request_to_yojson = 
  fun (x: get_container_service_powers_request) -> assoc_to_yojson(
    [
  ])

let container_service_metric_name_to_yojson = 
  fun (x: container_service_metric_name) -> match x with 
 
| MemoryUtilization -> `String "MemoryUtilization"
  | CPUUtilization -> `String "CPUUtilization"
   

let get_container_service_metric_data_result_to_yojson = 
  fun (x: get_container_service_metric_data_result) -> assoc_to_yojson(
    [(
         "metricData",
         (option_to_yojson metric_datapoint_list_to_yojson x.metric_data));
       (
         "metricName",
         (option_to_yojson container_service_metric_name_to_yojson x.metric_name));
       
  ])

let get_container_service_metric_data_request_to_yojson = 
  fun (x: get_container_service_metric_data_request) -> assoc_to_yojson(
    [(
         "statistics",
         (Some (metric_statistic_list_to_yojson x.statistics)));
       (
         "period",
         (Some (metric_period_to_yojson x.period)));
       (
         "endTime",
         (Some (iso_date_to_yojson x.end_time)));
       (
         "startTime",
         (Some (iso_date_to_yojson x.start_time)));
       (
         "metricName",
         (Some (container_service_metric_name_to_yojson x.metric_name)));
       (
         "serviceName",
         (Some (container_service_name_to_yojson x.service_name)));
       
  ])

let container_service_deployment_list_to_yojson = 
  fun tree -> list_to_yojson container_service_deployment_to_yojson tree

let get_container_service_deployments_result_to_yojson = 
  fun (x: get_container_service_deployments_result) -> assoc_to_yojson(
    [(
         "deployments",
         (option_to_yojson container_service_deployment_list_to_yojson x.deployments));
       
  ])

let get_container_service_deployments_request_to_yojson = 
  fun (x: get_container_service_deployments_request) -> assoc_to_yojson(
    [(
         "serviceName",
         (Some (container_service_name_to_yojson x.service_name)));
       
  ])

let container_service_log_event_to_yojson = 
  fun (x: container_service_log_event) -> assoc_to_yojson(
    [(
         "message",
         (option_to_yojson string__to_yojson x.message));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       
  ])

let container_service_log_event_list_to_yojson = 
  fun tree -> list_to_yojson container_service_log_event_to_yojson tree

let get_container_log_result_to_yojson = 
  fun (x: get_container_log_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "logEvents",
         (option_to_yojson container_service_log_event_list_to_yojson x.log_events));
       
  ])

let get_container_log_request_to_yojson = 
  fun (x: get_container_log_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "filterPattern",
         (option_to_yojson string__to_yojson x.filter_pattern));
       (
         "endTime",
         (option_to_yojson iso_date_to_yojson x.end_time));
       (
         "startTime",
         (option_to_yojson iso_date_to_yojson x.start_time));
       (
         "containerName",
         (Some (string__to_yojson x.container_name)));
       (
         "serviceName",
         (Some (container_service_name_to_yojson x.service_name)));
       
  ])

let container_image_list_to_yojson = 
  fun tree -> list_to_yojson container_image_to_yojson tree

let get_container_images_result_to_yojson = 
  fun (x: get_container_images_result) -> assoc_to_yojson(
    [(
         "containerImages",
         (option_to_yojson container_image_list_to_yojson x.container_images));
       
  ])

let get_container_images_request_to_yojson = 
  fun (x: get_container_images_request) -> assoc_to_yojson(
    [(
         "serviceName",
         (Some (container_service_name_to_yojson x.service_name)));
       
  ])

let container_service_metadata_entry_to_yojson = 
  fun tree -> map_to_yojson string__to_yojson tree

let container_service_metadata_entry_list_to_yojson = 
  fun tree -> list_to_yojson container_service_metadata_entry_to_yojson tree

let get_container_api_metadata_result_to_yojson = 
  fun (x: get_container_api_metadata_result) -> assoc_to_yojson(
    [(
         "metadata",
         (option_to_yojson container_service_metadata_entry_list_to_yojson x.metadata));
       
  ])

let get_container_api_metadata_request_to_yojson = 
  fun (x: get_container_api_metadata_request) -> assoc_to_yojson(
    [
  ])

let contact_method_status_to_yojson = 
  fun (x: contact_method_status) -> match x with 
 
| Invalid -> `String "Invalid"
  | Valid -> `String "Valid"
  | PendingVerification -> `String "PendingVerification"
   

let contact_method_to_yojson = 
  fun (x: contact_method) -> assoc_to_yojson(
    [(
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "protocol",
         (option_to_yojson contact_protocol_to_yojson x.protocol));
       (
         "status",
         (option_to_yojson contact_method_status_to_yojson x.status));
       (
         "contactEndpoint",
         (option_to_yojson non_empty_string_to_yojson x.contact_endpoint));
       
  ])

let contact_methods_list_to_yojson = 
  fun tree -> list_to_yojson contact_method_to_yojson tree

let get_contact_methods_result_to_yojson = 
  fun (x: get_contact_methods_result) -> assoc_to_yojson(
    [(
         "contactMethods",
         (option_to_yojson contact_methods_list_to_yojson x.contact_methods));
       
  ])

let get_contact_methods_request_to_yojson = 
  fun (x: get_contact_methods_request) -> assoc_to_yojson(
    [(
         "protocols",
         (option_to_yojson contact_protocols_list_to_yojson x.protocols));
       
  ])

let cloud_formation_stack_record_source_type_to_yojson = 
  fun (x: cloud_formation_stack_record_source_type) -> match x with 
  | ExportSnapshotRecord -> `String "ExportSnapshotRecord"
     

let cloud_formation_stack_record_source_info_to_yojson = 
  fun (x: cloud_formation_stack_record_source_info) -> assoc_to_yojson(
    [(
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson non_empty_string_to_yojson x.name));
       (
         "resourceType",
         (option_to_yojson cloud_formation_stack_record_source_type_to_yojson x.resource_type));
       
  ])

let cloud_formation_stack_record_source_info_list_to_yojson = 
  fun tree -> list_to_yojson cloud_formation_stack_record_source_info_to_yojson tree

let cloud_formation_stack_record_to_yojson = 
  fun (x: cloud_formation_stack_record) -> assoc_to_yojson(
    [(
         "destinationInfo",
         (option_to_yojson destination_info_to_yojson x.destination_info));
       (
         "sourceInfo",
         (option_to_yojson cloud_formation_stack_record_source_info_list_to_yojson x.source_info));
       (
         "state",
         (option_to_yojson record_state_to_yojson x.state));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let cloud_formation_stack_record_list_to_yojson = 
  fun tree -> list_to_yojson cloud_formation_stack_record_to_yojson tree

let get_cloud_formation_stack_records_result_to_yojson = 
  fun (x: get_cloud_formation_stack_records_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "cloudFormationStackRecords",
         (option_to_yojson cloud_formation_stack_record_list_to_yojson x.cloud_formation_stack_records));
       
  ])

let get_cloud_formation_stack_records_request_to_yojson = 
  fun (x: get_cloud_formation_stack_records_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let certificate_name_to_yojson = string_to_yojson

let certificate_status_to_yojson = 
  fun (x: certificate_status) -> match x with 
 
| Failed -> `String "FAILED"
  | Revoked -> `String "REVOKED"
  | ValidationTimedOut -> `String "VALIDATION_TIMED_OUT"
  | Expired -> `String "EXPIRED"
  | Inactive -> `String "INACTIVE"
  | Issued -> `String "ISSUED"
  | PendingValidation -> `String "PENDING_VALIDATION"
   

let in_use_resource_count_to_yojson = int_to_yojson

let key_algorithm_to_yojson = string_to_yojson

let issuer_c_a_to_yojson = string_to_yojson

let eligible_to_renew_to_yojson = string_to_yojson

let certificate_to_yojson = 
  fun (x: certificate) -> assoc_to_yojson(
    [(
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "revocationReason",
         (option_to_yojson revocation_reason_to_yojson x.revocation_reason));
       (
         "revokedAt",
         (option_to_yojson iso_date_to_yojson x.revoked_at));
       (
         "renewalSummary",
         (option_to_yojson renewal_summary_to_yojson x.renewal_summary));
       (
         "eligibleToRenew",
         (option_to_yojson eligible_to_renew_to_yojson x.eligible_to_renew));
       (
         "notAfter",
         (option_to_yojson iso_date_to_yojson x.not_after));
       (
         "notBefore",
         (option_to_yojson iso_date_to_yojson x.not_before));
       (
         "issuerCA",
         (option_to_yojson issuer_c_a_to_yojson x.issuer_c_a));
       (
         "issuedAt",
         (option_to_yojson iso_date_to_yojson x.issued_at));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "keyAlgorithm",
         (option_to_yojson key_algorithm_to_yojson x.key_algorithm));
       (
         "inUseResourceCount",
         (option_to_yojson in_use_resource_count_to_yojson x.in_use_resource_count));
       (
         "requestFailureReason",
         (option_to_yojson request_failure_reason_to_yojson x.request_failure_reason));
       (
         "domainValidationRecords",
         (option_to_yojson domain_validation_record_list_to_yojson x.domain_validation_records));
       (
         "subjectAlternativeNames",
         (option_to_yojson subject_alternative_name_list_to_yojson x.subject_alternative_names));
       (
         "serialNumber",
         (option_to_yojson serial_number_to_yojson x.serial_number));
       (
         "status",
         (option_to_yojson certificate_status_to_yojson x.status));
       (
         "domainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       (
         "name",
         (option_to_yojson certificate_name_to_yojson x.name));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       
  ])

let certificate_summary_to_yojson = 
  fun (x: certificate_summary) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "certificateDetail",
         (option_to_yojson certificate_to_yojson x.certificate_detail));
       (
         "domainName",
         (option_to_yojson domain_name_to_yojson x.domain_name));
       (
         "certificateName",
         (option_to_yojson certificate_name_to_yojson x.certificate_name));
       (
         "certificateArn",
         (option_to_yojson non_empty_string_to_yojson x.certificate_arn));
       
  ])

let certificate_summary_list_to_yojson = 
  fun tree -> list_to_yojson certificate_summary_to_yojson tree

let get_certificates_result_to_yojson = 
  fun (x: get_certificates_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "certificates",
         (option_to_yojson certificate_summary_list_to_yojson x.certificates));
       
  ])

let certificate_status_list_to_yojson = 
  fun tree -> list_to_yojson certificate_status_to_yojson tree

let include_certificate_details_to_yojson = bool_to_yojson

let get_certificates_request_to_yojson = 
  fun (x: get_certificates_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "certificateName",
         (option_to_yojson certificate_name_to_yojson x.certificate_name));
       (
         "includeCertificateDetails",
         (option_to_yojson include_certificate_details_to_yojson x.include_certificate_details));
       (
         "certificateStatuses",
         (option_to_yojson certificate_status_list_to_yojson x.certificate_statuses));
       
  ])

let instance_platform_to_yojson = 
  fun (x: instance_platform) -> match x with 
  | Windows -> `String "WINDOWS"
    | LinuxUnix -> `String "LINUX_UNIX"
     

let instance_platform_list_to_yojson = 
  fun tree -> list_to_yojson instance_platform_to_yojson tree

let app_category_to_yojson = 
  fun (x: app_category) -> match x with 
  | LfR -> `String "LfR"
     

let app_category_list_to_yojson = 
  fun tree -> list_to_yojson app_category_to_yojson tree

let bundle_to_yojson = 
  fun (x: bundle) -> assoc_to_yojson(
    [(
         "publicIpv4AddressCount",
         (option_to_yojson integer__to_yojson x.public_ipv4_address_count));
       (
         "supportedAppCategories",
         (option_to_yojson app_category_list_to_yojson x.supported_app_categories));
       (
         "supportedPlatforms",
         (option_to_yojson instance_platform_list_to_yojson x.supported_platforms));
       (
         "transferPerMonthInGb",
         (option_to_yojson integer__to_yojson x.transfer_per_month_in_gb));
       (
         "ramSizeInGb",
         (option_to_yojson float__to_yojson x.ram_size_in_gb));
       (
         "power",
         (option_to_yojson integer__to_yojson x.power));
       (
         "name",
         (option_to_yojson string__to_yojson x.name));
       (
         "isActive",
         (option_to_yojson boolean__to_yojson x.is_active));
       (
         "instanceType",
         (option_to_yojson string__to_yojson x.instance_type));
       (
         "bundleId",
         (option_to_yojson non_empty_string_to_yojson x.bundle_id));
       (
         "diskSizeInGb",
         (option_to_yojson integer__to_yojson x.disk_size_in_gb));
       (
         "cpuCount",
         (option_to_yojson integer__to_yojson x.cpu_count));
       (
         "price",
         (option_to_yojson float__to_yojson x.price));
       
  ])

let bundle_list_to_yojson = 
  fun tree -> list_to_yojson bundle_to_yojson tree

let get_bundles_result_to_yojson = 
  fun (x: get_bundles_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "bundles",
         (option_to_yojson bundle_list_to_yojson x.bundles));
       
  ])

let get_bundles_request_to_yojson = 
  fun (x: get_bundles_request) -> assoc_to_yojson(
    [(
         "appCategory",
         (option_to_yojson app_category_to_yojson x.app_category));
       (
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "includeInactive",
         (option_to_yojson boolean__to_yojson x.include_inactive));
       
  ])

let bucket_list_to_yojson = 
  fun tree -> list_to_yojson bucket_to_yojson tree

let account_level_bpa_sync_status_to_yojson = 
  fun (x: account_level_bpa_sync_status) -> match x with 
 
| Defaulted -> `String "Defaulted"
  | NeverSynced -> `String "NeverSynced"
  | Failed -> `String "Failed"
  | InSync -> `String "InSync"
   

let bpa_status_message_to_yojson = 
  fun (x: bpa_status_message) -> match x with 
 
| Unknown -> `String "Unknown"
  | DEFAULTED_FOR_SLR_MISSING_ON_HOLD -> `String "DEFAULTED_FOR_SLR_MISSING_ON_HOLD"
  | SYNC_ON_HOLD -> `String "SYNC_ON_HOLD"
  | DEFAULTED_FOR_SLR_MISSING -> `String "DEFAULTED_FOR_SLR_MISSING"
   

let account_level_bpa_sync_to_yojson = 
  fun (x: account_level_bpa_sync) -> assoc_to_yojson(
    [(
         "bpaImpactsLightsail",
         (option_to_yojson boolean__to_yojson x.bpa_impacts_lightsail));
       (
         "message",
         (option_to_yojson bpa_status_message_to_yojson x.message));
       (
         "lastSyncedAt",
         (option_to_yojson iso_date_to_yojson x.last_synced_at));
       (
         "status",
         (option_to_yojson account_level_bpa_sync_status_to_yojson x.status));
       
  ])

let get_buckets_result_to_yojson = 
  fun (x: get_buckets_result) -> assoc_to_yojson(
    [(
         "accountLevelBpaSync",
         (option_to_yojson account_level_bpa_sync_to_yojson x.account_level_bpa_sync));
       (
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "buckets",
         (option_to_yojson bucket_list_to_yojson x.buckets));
       
  ])

let get_buckets_request_to_yojson = 
  fun (x: get_buckets_request) -> assoc_to_yojson(
    [(
         "includeConnectedResources",
         (option_to_yojson boolean__to_yojson x.include_connected_resources));
       (
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "bucketName",
         (option_to_yojson bucket_name_to_yojson x.bucket_name));
       
  ])

let bucket_metric_name_to_yojson = 
  fun (x: bucket_metric_name) -> match x with 
 
| NumberOfObjects -> `String "NumberOfObjects"
  | BucketSizeBytes -> `String "BucketSizeBytes"
   

let get_bucket_metric_data_result_to_yojson = 
  fun (x: get_bucket_metric_data_result) -> assoc_to_yojson(
    [(
         "metricData",
         (option_to_yojson metric_datapoint_list_to_yojson x.metric_data));
       (
         "metricName",
         (option_to_yojson bucket_metric_name_to_yojson x.metric_name));
       
  ])

let get_bucket_metric_data_request_to_yojson = 
  fun (x: get_bucket_metric_data_request) -> assoc_to_yojson(
    [(
         "unit",
         (Some (metric_unit_to_yojson x.unit_)));
       (
         "statistics",
         (Some (metric_statistic_list_to_yojson x.statistics)));
       (
         "period",
         (Some (metric_period_to_yojson x.period)));
       (
         "endTime",
         (Some (iso_date_to_yojson x.end_time)));
       (
         "startTime",
         (Some (iso_date_to_yojson x.start_time)));
       (
         "metricName",
         (Some (bucket_metric_name_to_yojson x.metric_name)));
       (
         "bucketName",
         (Some (bucket_name_to_yojson x.bucket_name)));
       
  ])

let bucket_bundle_to_yojson = 
  fun (x: bucket_bundle) -> assoc_to_yojson(
    [(
         "isActive",
         (option_to_yojson boolean__to_yojson x.is_active));
       (
         "transferPerMonthInGb",
         (option_to_yojson integer__to_yojson x.transfer_per_month_in_gb));
       (
         "storagePerMonthInGb",
         (option_to_yojson integer__to_yojson x.storage_per_month_in_gb));
       (
         "price",
         (option_to_yojson float__to_yojson x.price));
       (
         "name",
         (option_to_yojson non_empty_string_to_yojson x.name));
       (
         "bundleId",
         (option_to_yojson non_empty_string_to_yojson x.bundle_id));
       
  ])

let bucket_bundle_list_to_yojson = 
  fun tree -> list_to_yojson bucket_bundle_to_yojson tree

let get_bucket_bundles_result_to_yojson = 
  fun (x: get_bucket_bundles_result) -> assoc_to_yojson(
    [(
         "bundles",
         (option_to_yojson bucket_bundle_list_to_yojson x.bundles));
       
  ])

let get_bucket_bundles_request_to_yojson = 
  fun (x: get_bucket_bundles_request) -> assoc_to_yojson(
    [(
         "includeInactive",
         (option_to_yojson boolean__to_yojson x.include_inactive));
       
  ])

let iam_access_key_id_to_yojson = string_to_yojson

let access_key_last_used_to_yojson = 
  fun (x: access_key_last_used) -> assoc_to_yojson(
    [(
         "serviceName",
         (option_to_yojson string__to_yojson x.service_name));
       (
         "region",
         (option_to_yojson string__to_yojson x.region));
       (
         "lastUsedDate",
         (option_to_yojson iso_date_to_yojson x.last_used_date));
       
  ])

let access_key_to_yojson = 
  fun (x: access_key) -> assoc_to_yojson(
    [(
         "lastUsed",
         (option_to_yojson access_key_last_used_to_yojson x.last_used));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "status",
         (option_to_yojson status_type_to_yojson x.status));
       (
         "secretAccessKey",
         (option_to_yojson non_empty_string_to_yojson x.secret_access_key));
       (
         "accessKeyId",
         (option_to_yojson iam_access_key_id_to_yojson x.access_key_id));
       
  ])

let access_key_list_to_yojson = 
  fun tree -> list_to_yojson access_key_to_yojson tree

let get_bucket_access_keys_result_to_yojson = 
  fun (x: get_bucket_access_keys_result) -> assoc_to_yojson(
    [(
         "accessKeys",
         (option_to_yojson access_key_list_to_yojson x.access_keys));
       
  ])

let get_bucket_access_keys_request_to_yojson = 
  fun (x: get_bucket_access_keys_request) -> assoc_to_yojson(
    [(
         "bucketName",
         (Some (bucket_name_to_yojson x.bucket_name)));
       
  ])

let blueprint_type_to_yojson = 
  fun (x: blueprint_type) -> match x with 
  | App -> `String "app"
    | Os -> `String "os"
     

let blueprint_to_yojson = 
  fun (x: blueprint) -> assoc_to_yojson(
    [(
         "appCategory",
         (option_to_yojson app_category_to_yojson x.app_category));
       (
         "platform",
         (option_to_yojson instance_platform_to_yojson x.platform));
       (
         "licenseUrl",
         (option_to_yojson string__to_yojson x.license_url));
       (
         "productUrl",
         (option_to_yojson string__to_yojson x.product_url));
       (
         "versionCode",
         (option_to_yojson string__to_yojson x.version_code));
       (
         "version",
         (option_to_yojson string__to_yojson x.version));
       (
         "minPower",
         (option_to_yojson integer__to_yojson x.min_power));
       (
         "isActive",
         (option_to_yojson boolean__to_yojson x.is_active));
       (
         "description",
         (option_to_yojson string__to_yojson x.description));
       (
         "type",
         (option_to_yojson blueprint_type_to_yojson x.type_));
       (
         "group",
         (option_to_yojson non_empty_string_to_yojson x.group));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       (
         "blueprintId",
         (option_to_yojson non_empty_string_to_yojson x.blueprint_id));
       
  ])

let blueprint_list_to_yojson = 
  fun tree -> list_to_yojson blueprint_to_yojson tree

let get_blueprints_result_to_yojson = 
  fun (x: get_blueprints_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "blueprints",
         (option_to_yojson blueprint_list_to_yojson x.blueprints));
       
  ])

let get_blueprints_request_to_yojson = 
  fun (x: get_blueprints_request) -> assoc_to_yojson(
    [(
         "appCategory",
         (option_to_yojson app_category_to_yojson x.app_category));
       (
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "includeInactive",
         (option_to_yojson boolean__to_yojson x.include_inactive));
       
  ])

let auto_snapshot_status_to_yojson = 
  fun (x: auto_snapshot_status) -> match x with 
 
| NOT_FOUND -> `String "NotFound"
  | IN_PROGRESS -> `String "InProgress"
  | FAILED -> `String "Failed"
  | SUCCESS -> `String "Success"
   

let attached_disk_to_yojson = 
  fun (x: attached_disk) -> assoc_to_yojson(
    [(
         "sizeInGb",
         (option_to_yojson integer__to_yojson x.size_in_gb));
       (
         "path",
         (option_to_yojson string__to_yojson x.path));
       
  ])

let attached_disk_list_to_yojson = 
  fun tree -> list_to_yojson attached_disk_to_yojson tree

let auto_snapshot_details_to_yojson = 
  fun (x: auto_snapshot_details) -> assoc_to_yojson(
    [(
         "fromAttachedDisks",
         (option_to_yojson attached_disk_list_to_yojson x.from_attached_disks));
       (
         "status",
         (option_to_yojson auto_snapshot_status_to_yojson x.status));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "date",
         (option_to_yojson string__to_yojson x.date));
       
  ])

let auto_snapshot_details_list_to_yojson = 
  fun tree -> list_to_yojson auto_snapshot_details_to_yojson tree

let get_auto_snapshots_result_to_yojson = 
  fun (x: get_auto_snapshots_result) -> assoc_to_yojson(
    [(
         "autoSnapshots",
         (option_to_yojson auto_snapshot_details_list_to_yojson x.auto_snapshots));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "resourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       
  ])

let get_auto_snapshots_request_to_yojson = 
  fun (x: get_auto_snapshots_request) -> assoc_to_yojson(
    [(
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let alarm_to_yojson = 
  fun (x: alarm) -> assoc_to_yojson(
    [(
         "notificationEnabled",
         (option_to_yojson boolean__to_yojson x.notification_enabled));
       (
         "notificationTriggers",
         (option_to_yojson notification_trigger_list_to_yojson x.notification_triggers));
       (
         "contactProtocols",
         (option_to_yojson contact_protocols_list_to_yojson x.contact_protocols));
       (
         "unit",
         (option_to_yojson metric_unit_to_yojson x.unit_));
       (
         "state",
         (option_to_yojson alarm_state_to_yojson x.state));
       (
         "metricName",
         (option_to_yojson metric_name_to_yojson x.metric_name));
       (
         "statistic",
         (option_to_yojson metric_statistic_to_yojson x.statistic));
       (
         "treatMissingData",
         (option_to_yojson treat_missing_data_to_yojson x.treat_missing_data));
       (
         "datapointsToAlarm",
         (option_to_yojson integer__to_yojson x.datapoints_to_alarm));
       (
         "threshold",
         (option_to_yojson double_to_yojson x.threshold));
       (
         "period",
         (option_to_yojson metric_period_to_yojson x.period));
       (
         "evaluationPeriods",
         (option_to_yojson integer__to_yojson x.evaluation_periods));
       (
         "comparisonOperator",
         (option_to_yojson comparison_operator_to_yojson x.comparison_operator));
       (
         "monitoredResourceInfo",
         (option_to_yojson monitored_resource_info_to_yojson x.monitored_resource_info));
       (
         "supportCode",
         (option_to_yojson string__to_yojson x.support_code));
       (
         "resourceType",
         (option_to_yojson resource_type_to_yojson x.resource_type));
       (
         "location",
         (option_to_yojson resource_location_to_yojson x.location));
       (
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "arn",
         (option_to_yojson non_empty_string_to_yojson x.arn));
       (
         "name",
         (option_to_yojson resource_name_to_yojson x.name));
       
  ])

let alarms_list_to_yojson = 
  fun tree -> list_to_yojson alarm_to_yojson tree

let get_alarms_result_to_yojson = 
  fun (x: get_alarms_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "alarms",
         (option_to_yojson alarms_list_to_yojson x.alarms));
       
  ])

let get_alarms_request_to_yojson = 
  fun (x: get_alarms_request) -> assoc_to_yojson(
    [(
         "monitoredResourceName",
         (option_to_yojson resource_name_to_yojson x.monitored_resource_name));
       (
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       (
         "alarmName",
         (option_to_yojson resource_name_to_yojson x.alarm_name));
       
  ])

let get_active_names_result_to_yojson = 
  fun (x: get_active_names_result) -> assoc_to_yojson(
    [(
         "nextPageToken",
         (option_to_yojson string__to_yojson x.next_page_token));
       (
         "activeNames",
         (option_to_yojson string_list_to_yojson x.active_names));
       
  ])

let get_active_names_request_to_yojson = 
  fun (x: get_active_names_request) -> assoc_to_yojson(
    [(
         "pageToken",
         (option_to_yojson string__to_yojson x.page_token));
       
  ])

let export_snapshot_result_to_yojson = 
  fun (x: export_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let export_snapshot_request_to_yojson = 
  fun (x: export_snapshot_request) -> assoc_to_yojson(
    [(
         "sourceSnapshotName",
         (Some (resource_name_to_yojson x.source_snapshot_name)));
       
  ])

let enable_add_on_result_to_yojson = 
  fun (x: enable_add_on_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let add_on_type_to_yojson = 
  fun (x: add_on_type) -> match x with 
 
| StopInstanceOnIdle -> `String "StopInstanceOnIdle"
  | AutoSnapshot -> `String "AutoSnapshot"
   

let auto_snapshot_add_on_request_to_yojson = 
  fun (x: auto_snapshot_add_on_request) -> assoc_to_yojson(
    [(
         "snapshotTimeOfDay",
         (option_to_yojson time_of_day_to_yojson x.snapshot_time_of_day));
       
  ])

let add_on_request_to_yojson = 
  fun (x: add_on_request) -> assoc_to_yojson(
    [(
         "stopInstanceOnIdleRequest",
         (option_to_yojson stop_instance_on_idle_request_to_yojson x.stop_instance_on_idle_request));
       (
         "autoSnapshotAddOnRequest",
         (option_to_yojson auto_snapshot_add_on_request_to_yojson x.auto_snapshot_add_on_request));
       (
         "addOnType",
         (Some (add_on_type_to_yojson x.add_on_type)));
       
  ])

let enable_add_on_request_to_yojson = 
  fun (x: enable_add_on_request) -> assoc_to_yojson(
    [(
         "addOnRequest",
         (Some (add_on_request_to_yojson x.add_on_request)));
       (
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let download_default_key_pair_result_to_yojson = 
  fun (x: download_default_key_pair_result) -> assoc_to_yojson(
    [(
         "createdAt",
         (option_to_yojson iso_date_to_yojson x.created_at));
       (
         "privateKeyBase64",
         (option_to_yojson base64_to_yojson x.private_key_base64));
       (
         "publicKeyBase64",
         (option_to_yojson base64_to_yojson x.public_key_base64));
       
  ])

let download_default_key_pair_request_to_yojson = 
  fun (x: download_default_key_pair_request) -> assoc_to_yojson(
    [
  ])

let disable_add_on_result_to_yojson = 
  fun (x: disable_add_on_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let disable_add_on_request_to_yojson = 
  fun (x: disable_add_on_request) -> assoc_to_yojson(
    [(
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       (
         "addOnType",
         (Some (add_on_type_to_yojson x.add_on_type)));
       
  ])

let detach_static_ip_result_to_yojson = 
  fun (x: detach_static_ip_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let detach_static_ip_request_to_yojson = 
  fun (x: detach_static_ip_request) -> assoc_to_yojson(
    [(
         "staticIpName",
         (Some (resource_name_to_yojson x.static_ip_name)));
       
  ])

let detach_instances_from_load_balancer_result_to_yojson = 
  fun (x: detach_instances_from_load_balancer_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let detach_instances_from_load_balancer_request_to_yojson = 
  fun (x: detach_instances_from_load_balancer_request) -> assoc_to_yojson(
    [(
         "instanceNames",
         (Some (resource_name_list_to_yojson x.instance_names)));
       (
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let detach_disk_result_to_yojson = 
  fun (x: detach_disk_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let detach_disk_request_to_yojson = 
  fun (x: detach_disk_request) -> assoc_to_yojson(
    [(
         "diskName",
         (Some (resource_name_to_yojson x.disk_name)));
       
  ])

let detach_certificate_from_distribution_result_to_yojson = 
  fun (x: detach_certificate_from_distribution_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let detach_certificate_from_distribution_request_to_yojson = 
  fun (x: detach_certificate_from_distribution_request) -> assoc_to_yojson(
    [(
         "distributionName",
         (Some (resource_name_to_yojson x.distribution_name)));
       
  ])

let delete_relational_database_snapshot_result_to_yojson = 
  fun (x: delete_relational_database_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_relational_database_snapshot_request_to_yojson = 
  fun (x: delete_relational_database_snapshot_request) -> assoc_to_yojson(
    [(
         "relationalDatabaseSnapshotName",
         (Some (resource_name_to_yojson x.relational_database_snapshot_name)));
       
  ])

let delete_relational_database_result_to_yojson = 
  fun (x: delete_relational_database_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_relational_database_request_to_yojson = 
  fun (x: delete_relational_database_request) -> assoc_to_yojson(
    [(
         "finalRelationalDatabaseSnapshotName",
         (option_to_yojson resource_name_to_yojson x.final_relational_database_snapshot_name));
       (
         "skipFinalSnapshot",
         (option_to_yojson boolean__to_yojson x.skip_final_snapshot));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let delete_load_balancer_tls_certificate_result_to_yojson = 
  fun (x: delete_load_balancer_tls_certificate_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_load_balancer_tls_certificate_request_to_yojson = 
  fun (x: delete_load_balancer_tls_certificate_request) -> assoc_to_yojson(
    [(
         "force",
         (option_to_yojson boolean__to_yojson x.force));
       (
         "certificateName",
         (Some (resource_name_to_yojson x.certificate_name)));
       (
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let delete_load_balancer_result_to_yojson = 
  fun (x: delete_load_balancer_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_load_balancer_request_to_yojson = 
  fun (x: delete_load_balancer_request) -> assoc_to_yojson(
    [(
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let delete_known_host_keys_result_to_yojson = 
  fun (x: delete_known_host_keys_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_known_host_keys_request_to_yojson = 
  fun (x: delete_known_host_keys_request) -> assoc_to_yojson(
    [(
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let delete_key_pair_result_to_yojson = 
  fun (x: delete_key_pair_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let delete_key_pair_request_to_yojson = 
  fun (x: delete_key_pair_request) -> assoc_to_yojson(
    [(
         "expectedFingerprint",
         (option_to_yojson string__to_yojson x.expected_fingerprint));
       (
         "keyPairName",
         (Some (resource_name_to_yojson x.key_pair_name)));
       
  ])

let delete_instance_snapshot_result_to_yojson = 
  fun (x: delete_instance_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_instance_snapshot_request_to_yojson = 
  fun (x: delete_instance_snapshot_request) -> assoc_to_yojson(
    [(
         "instanceSnapshotName",
         (Some (resource_name_to_yojson x.instance_snapshot_name)));
       
  ])

let delete_instance_result_to_yojson = 
  fun (x: delete_instance_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_instance_request_to_yojson = 
  fun (x: delete_instance_request) -> assoc_to_yojson(
    [(
         "forceDeleteAddOns",
         (option_to_yojson boolean__to_yojson x.force_delete_add_ons));
       (
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       
  ])

let delete_domain_entry_result_to_yojson = 
  fun (x: delete_domain_entry_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let delete_domain_entry_request_to_yojson = 
  fun (x: delete_domain_entry_request) -> assoc_to_yojson(
    [(
         "domainEntry",
         (Some (domain_entry_to_yojson x.domain_entry)));
       (
         "domainName",
         (Some (domain_name_to_yojson x.domain_name)));
       
  ])

let delete_domain_result_to_yojson = 
  fun (x: delete_domain_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let delete_domain_request_to_yojson = 
  fun (x: delete_domain_request) -> assoc_to_yojson(
    [(
         "domainName",
         (Some (domain_name_to_yojson x.domain_name)));
       
  ])

let delete_distribution_result_to_yojson = 
  fun (x: delete_distribution_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let delete_distribution_request_to_yojson = 
  fun (x: delete_distribution_request) -> assoc_to_yojson(
    [(
         "distributionName",
         (option_to_yojson resource_name_to_yojson x.distribution_name));
       
  ])

let delete_disk_snapshot_result_to_yojson = 
  fun (x: delete_disk_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_disk_snapshot_request_to_yojson = 
  fun (x: delete_disk_snapshot_request) -> assoc_to_yojson(
    [(
         "diskSnapshotName",
         (Some (resource_name_to_yojson x.disk_snapshot_name)));
       
  ])

let delete_disk_result_to_yojson = 
  fun (x: delete_disk_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_disk_request_to_yojson = 
  fun (x: delete_disk_request) -> assoc_to_yojson(
    [(
         "forceDeleteAddOns",
         (option_to_yojson boolean__to_yojson x.force_delete_add_ons));
       (
         "diskName",
         (Some (resource_name_to_yojson x.disk_name)));
       
  ])

let delete_container_service_result_to_yojson = 
  fun (x: delete_container_service_result) -> assoc_to_yojson(
    [
  ])

let delete_container_service_request_to_yojson = 
  fun (x: delete_container_service_request) -> assoc_to_yojson(
    [(
         "serviceName",
         (Some (container_service_name_to_yojson x.service_name)));
       
  ])

let delete_container_image_result_to_yojson = 
  fun (x: delete_container_image_result) -> assoc_to_yojson(
    [
  ])

let delete_container_image_request_to_yojson = 
  fun (x: delete_container_image_request) -> assoc_to_yojson(
    [(
         "image",
         (Some (string__to_yojson x.image)));
       (
         "serviceName",
         (Some (container_service_name_to_yojson x.service_name)));
       
  ])

let delete_contact_method_result_to_yojson = 
  fun (x: delete_contact_method_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_contact_method_request_to_yojson = 
  fun (x: delete_contact_method_request) -> assoc_to_yojson(
    [(
         "protocol",
         (Some (contact_protocol_to_yojson x.protocol)));
       
  ])

let delete_certificate_result_to_yojson = 
  fun (x: delete_certificate_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_certificate_request_to_yojson = 
  fun (x: delete_certificate_request) -> assoc_to_yojson(
    [(
         "certificateName",
         (Some (certificate_name_to_yojson x.certificate_name)));
       
  ])

let delete_bucket_access_key_result_to_yojson = 
  fun (x: delete_bucket_access_key_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_bucket_access_key_request_to_yojson = 
  fun (x: delete_bucket_access_key_request) -> assoc_to_yojson(
    [(
         "accessKeyId",
         (Some (non_empty_string_to_yojson x.access_key_id)));
       (
         "bucketName",
         (Some (bucket_name_to_yojson x.bucket_name)));
       
  ])

let delete_bucket_result_to_yojson = 
  fun (x: delete_bucket_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_bucket_request_to_yojson = 
  fun (x: delete_bucket_request) -> assoc_to_yojson(
    [(
         "forceDelete",
         (option_to_yojson boolean__to_yojson x.force_delete));
       (
         "bucketName",
         (Some (bucket_name_to_yojson x.bucket_name)));
       
  ])

let delete_auto_snapshot_result_to_yojson = 
  fun (x: delete_auto_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let auto_snapshot_date_to_yojson = string_to_yojson

let delete_auto_snapshot_request_to_yojson = 
  fun (x: delete_auto_snapshot_request) -> assoc_to_yojson(
    [(
         "date",
         (Some (auto_snapshot_date_to_yojson x.date)));
       (
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let delete_alarm_result_to_yojson = 
  fun (x: delete_alarm_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let delete_alarm_request_to_yojson = 
  fun (x: delete_alarm_request) -> assoc_to_yojson(
    [(
         "alarmName",
         (Some (resource_name_to_yojson x.alarm_name)));
       
  ])

let create_relational_database_snapshot_result_to_yojson = 
  fun (x: create_relational_database_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let create_relational_database_snapshot_request_to_yojson = 
  fun (x: create_relational_database_snapshot_request) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "relationalDatabaseSnapshotName",
         (Some (resource_name_to_yojson x.relational_database_snapshot_name)));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let create_relational_database_from_snapshot_result_to_yojson = 
  fun (x: create_relational_database_from_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let create_relational_database_from_snapshot_request_to_yojson = 
  fun (x: create_relational_database_from_snapshot_request) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "useLatestRestorableTime",
         (option_to_yojson boolean__to_yojson x.use_latest_restorable_time));
       (
         "restoreTime",
         (option_to_yojson iso_date_to_yojson x.restore_time));
       (
         "sourceRelationalDatabaseName",
         (option_to_yojson resource_name_to_yojson x.source_relational_database_name));
       (
         "relationalDatabaseBundleId",
         (option_to_yojson string__to_yojson x.relational_database_bundle_id));
       (
         "relationalDatabaseSnapshotName",
         (option_to_yojson resource_name_to_yojson x.relational_database_snapshot_name));
       (
         "publiclyAccessible",
         (option_to_yojson boolean__to_yojson x.publicly_accessible));
       (
         "availabilityZone",
         (option_to_yojson string__to_yojson x.availability_zone));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let create_relational_database_result_to_yojson = 
  fun (x: create_relational_database_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let create_relational_database_request_to_yojson = 
  fun (x: create_relational_database_request) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "publiclyAccessible",
         (option_to_yojson boolean__to_yojson x.publicly_accessible));
       (
         "preferredMaintenanceWindow",
         (option_to_yojson string__to_yojson x.preferred_maintenance_window));
       (
         "preferredBackupWindow",
         (option_to_yojson string__to_yojson x.preferred_backup_window));
       (
         "masterUserPassword",
         (option_to_yojson sensitive_string_to_yojson x.master_user_password));
       (
         "masterUsername",
         (Some (string__to_yojson x.master_username)));
       (
         "masterDatabaseName",
         (Some (string__to_yojson x.master_database_name)));
       (
         "relationalDatabaseBundleId",
         (Some (string__to_yojson x.relational_database_bundle_id)));
       (
         "relationalDatabaseBlueprintId",
         (Some (string__to_yojson x.relational_database_blueprint_id)));
       (
         "availabilityZone",
         (option_to_yojson string__to_yojson x.availability_zone));
       (
         "relationalDatabaseName",
         (Some (resource_name_to_yojson x.relational_database_name)));
       
  ])

let create_load_balancer_tls_certificate_result_to_yojson = 
  fun (x: create_load_balancer_tls_certificate_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let domain_name_list_to_yojson = 
  fun tree -> list_to_yojson domain_name_to_yojson tree

let create_load_balancer_tls_certificate_request_to_yojson = 
  fun (x: create_load_balancer_tls_certificate_request) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "certificateAlternativeNames",
         (option_to_yojson domain_name_list_to_yojson x.certificate_alternative_names));
       (
         "certificateDomainName",
         (Some (domain_name_to_yojson x.certificate_domain_name)));
       (
         "certificateName",
         (Some (resource_name_to_yojson x.certificate_name)));
       (
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let create_load_balancer_result_to_yojson = 
  fun (x: create_load_balancer_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let create_load_balancer_request_to_yojson = 
  fun (x: create_load_balancer_request) -> assoc_to_yojson(
    [(
         "tlsPolicyName",
         (option_to_yojson string__to_yojson x.tls_policy_name));
       (
         "ipAddressType",
         (option_to_yojson ip_address_type_to_yojson x.ip_address_type));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "certificateAlternativeNames",
         (option_to_yojson domain_name_list_to_yojson x.certificate_alternative_names));
       (
         "certificateDomainName",
         (option_to_yojson domain_name_to_yojson x.certificate_domain_name));
       (
         "certificateName",
         (option_to_yojson resource_name_to_yojson x.certificate_name));
       (
         "healthCheckPath",
         (option_to_yojson string__to_yojson x.health_check_path));
       (
         "instancePort",
         (Some (port_to_yojson x.instance_port)));
       (
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let create_key_pair_result_to_yojson = 
  fun (x: create_key_pair_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       (
         "privateKeyBase64",
         (option_to_yojson base64_to_yojson x.private_key_base64));
       (
         "publicKeyBase64",
         (option_to_yojson base64_to_yojson x.public_key_base64));
       (
         "keyPair",
         (option_to_yojson key_pair_to_yojson x.key_pair));
       
  ])

let create_key_pair_request_to_yojson = 
  fun (x: create_key_pair_request) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "keyPairName",
         (Some (resource_name_to_yojson x.key_pair_name)));
       
  ])

let create_instance_snapshot_result_to_yojson = 
  fun (x: create_instance_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let create_instance_snapshot_request_to_yojson = 
  fun (x: create_instance_snapshot_request) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       (
         "instanceSnapshotName",
         (Some (resource_name_to_yojson x.instance_snapshot_name)));
       
  ])

let create_instances_from_snapshot_result_to_yojson = 
  fun (x: create_instances_from_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let disk_map_to_yojson = 
  fun (x: disk_map) -> assoc_to_yojson(
    [(
         "newDiskName",
         (option_to_yojson resource_name_to_yojson x.new_disk_name));
       (
         "originalDiskPath",
         (option_to_yojson non_empty_string_to_yojson x.original_disk_path));
       
  ])

let disk_map_list_to_yojson = 
  fun tree -> list_to_yojson disk_map_to_yojson tree

let attached_disk_map_to_yojson = 
  fun tree -> map_to_yojson disk_map_list_to_yojson tree

let add_on_request_list_to_yojson = 
  fun tree -> list_to_yojson add_on_request_to_yojson tree

let create_instances_from_snapshot_request_to_yojson = 
  fun (x: create_instances_from_snapshot_request) -> assoc_to_yojson(
    [(
         "useLatestRestorableAutoSnapshot",
         (option_to_yojson boolean__to_yojson x.use_latest_restorable_auto_snapshot));
       (
         "restoreDate",
         (option_to_yojson string__to_yojson x.restore_date));
       (
         "sourceInstanceName",
         (option_to_yojson string__to_yojson x.source_instance_name));
       (
         "ipAddressType",
         (option_to_yojson ip_address_type_to_yojson x.ip_address_type));
       (
         "addOns",
         (option_to_yojson add_on_request_list_to_yojson x.add_ons));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "keyPairName",
         (option_to_yojson resource_name_to_yojson x.key_pair_name));
       (
         "userData",
         (option_to_yojson string__to_yojson x.user_data));
       (
         "bundleId",
         (Some (non_empty_string_to_yojson x.bundle_id)));
       (
         "instanceSnapshotName",
         (option_to_yojson resource_name_to_yojson x.instance_snapshot_name));
       (
         "availabilityZone",
         (Some (string__to_yojson x.availability_zone)));
       (
         "attachedDiskMapping",
         (option_to_yojson attached_disk_map_to_yojson x.attached_disk_mapping));
       (
         "instanceNames",
         (Some (string_list_to_yojson x.instance_names)));
       
  ])

let create_instances_result_to_yojson = 
  fun (x: create_instances_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let create_instances_request_to_yojson = 
  fun (x: create_instances_request) -> assoc_to_yojson(
    [(
         "ipAddressType",
         (option_to_yojson ip_address_type_to_yojson x.ip_address_type));
       (
         "addOns",
         (option_to_yojson add_on_request_list_to_yojson x.add_ons));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "keyPairName",
         (option_to_yojson resource_name_to_yojson x.key_pair_name));
       (
         "userData",
         (option_to_yojson string__to_yojson x.user_data));
       (
         "bundleId",
         (Some (non_empty_string_to_yojson x.bundle_id)));
       (
         "blueprintId",
         (Some (non_empty_string_to_yojson x.blueprint_id)));
       (
         "customImageName",
         (option_to_yojson resource_name_to_yojson x.custom_image_name));
       (
         "availabilityZone",
         (Some (string__to_yojson x.availability_zone)));
       (
         "instanceNames",
         (Some (string_list_to_yojson x.instance_names)));
       
  ])

let create_gui_session_access_details_result_to_yojson = 
  fun (x: create_gui_session_access_details_result) -> assoc_to_yojson(
    [(
         "sessions",
         (option_to_yojson sessions_to_yojson x.sessions));
       (
         "failureReason",
         (option_to_yojson string__to_yojson x.failure_reason));
       (
         "percentageComplete",
         (option_to_yojson integer__to_yojson x.percentage_complete));
       (
         "status",
         (option_to_yojson status_to_yojson x.status));
       (
         "resourceName",
         (option_to_yojson resource_name_to_yojson x.resource_name));
       
  ])

let create_gui_session_access_details_request_to_yojson = 
  fun (x: create_gui_session_access_details_request) -> assoc_to_yojson(
    [(
         "resourceName",
         (Some (resource_name_to_yojson x.resource_name)));
       
  ])

let create_domain_entry_result_to_yojson = 
  fun (x: create_domain_entry_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let create_domain_entry_request_to_yojson = 
  fun (x: create_domain_entry_request) -> assoc_to_yojson(
    [(
         "domainEntry",
         (Some (domain_entry_to_yojson x.domain_entry)));
       (
         "domainName",
         (Some (domain_name_to_yojson x.domain_name)));
       
  ])

let create_domain_result_to_yojson = 
  fun (x: create_domain_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let create_domain_request_to_yojson = 
  fun (x: create_domain_request) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "domainName",
         (Some (domain_name_to_yojson x.domain_name)));
       
  ])

let create_distribution_result_to_yojson = 
  fun (x: create_distribution_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       (
         "distribution",
         (option_to_yojson lightsail_distribution_to_yojson x.distribution));
       
  ])

let create_distribution_request_to_yojson = 
  fun (x: create_distribution_request) -> assoc_to_yojson(
    [(
         "viewerMinimumTlsProtocolVersion",
         (option_to_yojson viewer_minimum_tls_protocol_version_enum_to_yojson x.viewer_minimum_tls_protocol_version));
       (
         "certificateName",
         (option_to_yojson resource_name_to_yojson x.certificate_name));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "ipAddressType",
         (option_to_yojson ip_address_type_to_yojson x.ip_address_type));
       (
         "bundleId",
         (Some (string__to_yojson x.bundle_id)));
       (
         "cacheBehaviors",
         (option_to_yojson cache_behavior_list_to_yojson x.cache_behaviors));
       (
         "cacheBehaviorSettings",
         (option_to_yojson cache_settings_to_yojson x.cache_behavior_settings));
       (
         "defaultCacheBehavior",
         (Some (cache_behavior_to_yojson x.default_cache_behavior)));
       (
         "origin",
         (Some (input_origin_to_yojson x.origin)));
       (
         "distributionName",
         (Some (resource_name_to_yojson x.distribution_name)));
       
  ])

let create_disk_snapshot_result_to_yojson = 
  fun (x: create_disk_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let create_disk_snapshot_request_to_yojson = 
  fun (x: create_disk_snapshot_request) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "instanceName",
         (option_to_yojson resource_name_to_yojson x.instance_name));
       (
         "diskSnapshotName",
         (Some (resource_name_to_yojson x.disk_snapshot_name)));
       (
         "diskName",
         (option_to_yojson resource_name_to_yojson x.disk_name));
       
  ])

let create_disk_from_snapshot_result_to_yojson = 
  fun (x: create_disk_from_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let create_disk_from_snapshot_request_to_yojson = 
  fun (x: create_disk_from_snapshot_request) -> assoc_to_yojson(
    [(
         "useLatestRestorableAutoSnapshot",
         (option_to_yojson boolean__to_yojson x.use_latest_restorable_auto_snapshot));
       (
         "restoreDate",
         (option_to_yojson string__to_yojson x.restore_date));
       (
         "sourceDiskName",
         (option_to_yojson string__to_yojson x.source_disk_name));
       (
         "addOns",
         (option_to_yojson add_on_request_list_to_yojson x.add_ons));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "sizeInGb",
         (Some (integer__to_yojson x.size_in_gb)));
       (
         "availabilityZone",
         (Some (non_empty_string_to_yojson x.availability_zone)));
       (
         "diskSnapshotName",
         (option_to_yojson resource_name_to_yojson x.disk_snapshot_name));
       (
         "diskName",
         (Some (resource_name_to_yojson x.disk_name)));
       
  ])

let create_disk_result_to_yojson = 
  fun (x: create_disk_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let create_disk_request_to_yojson = 
  fun (x: create_disk_request) -> assoc_to_yojson(
    [(
         "addOns",
         (option_to_yojson add_on_request_list_to_yojson x.add_ons));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "sizeInGb",
         (Some (integer__to_yojson x.size_in_gb)));
       (
         "availabilityZone",
         (Some (non_empty_string_to_yojson x.availability_zone)));
       (
         "diskName",
         (Some (resource_name_to_yojson x.disk_name)));
       
  ])

let container_service_registry_login_to_yojson = 
  fun (x: container_service_registry_login) -> assoc_to_yojson(
    [(
         "registry",
         (option_to_yojson string__to_yojson x.registry));
       (
         "expiresAt",
         (option_to_yojson iso_date_to_yojson x.expires_at));
       (
         "password",
         (option_to_yojson string__to_yojson x.password));
       (
         "username",
         (option_to_yojson string__to_yojson x.username));
       
  ])

let create_container_service_registry_login_result_to_yojson = 
  fun (x: create_container_service_registry_login_result) -> assoc_to_yojson(
    [(
         "registryLogin",
         (option_to_yojson container_service_registry_login_to_yojson x.registry_login));
       
  ])

let create_container_service_registry_login_request_to_yojson = 
  fun (x: create_container_service_registry_login_request) -> assoc_to_yojson(
    [
  ])

let create_container_service_deployment_result_to_yojson = 
  fun (x: create_container_service_deployment_result) -> assoc_to_yojson(
    [(
         "containerService",
         (option_to_yojson container_service_to_yojson x.container_service));
       
  ])

let endpoint_request_to_yojson = 
  fun (x: endpoint_request) -> assoc_to_yojson(
    [(
         "healthCheck",
         (option_to_yojson container_service_health_check_config_to_yojson x.health_check));
       (
         "containerPort",
         (Some (integer__to_yojson x.container_port)));
       (
         "containerName",
         (Some (string__to_yojson x.container_name)));
       
  ])

let create_container_service_deployment_request_to_yojson = 
  fun (x: create_container_service_deployment_request) -> assoc_to_yojson(
    [(
         "publicEndpoint",
         (option_to_yojson endpoint_request_to_yojson x.public_endpoint));
       (
         "containers",
         (option_to_yojson container_map_to_yojson x.containers));
       (
         "serviceName",
         (Some (container_service_name_to_yojson x.service_name)));
       
  ])

let create_container_service_result_to_yojson = 
  fun (x: create_container_service_result) -> assoc_to_yojson(
    [(
         "containerService",
         (option_to_yojson container_service_to_yojson x.container_service));
       
  ])

let container_service_deployment_request_to_yojson = 
  fun (x: container_service_deployment_request) -> assoc_to_yojson(
    [(
         "publicEndpoint",
         (option_to_yojson endpoint_request_to_yojson x.public_endpoint));
       (
         "containers",
         (option_to_yojson container_map_to_yojson x.containers));
       
  ])

let create_container_service_request_to_yojson = 
  fun (x: create_container_service_request) -> assoc_to_yojson(
    [(
         "privateRegistryAccess",
         (option_to_yojson private_registry_access_request_to_yojson x.private_registry_access));
       (
         "deployment",
         (option_to_yojson container_service_deployment_request_to_yojson x.deployment));
       (
         "publicDomainNames",
         (option_to_yojson container_service_public_domains_to_yojson x.public_domain_names));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "scale",
         (Some (container_service_scale_to_yojson x.scale)));
       (
         "power",
         (Some (container_service_power_name_to_yojson x.power)));
       (
         "serviceName",
         (Some (container_service_name_to_yojson x.service_name)));
       
  ])

let create_contact_method_result_to_yojson = 
  fun (x: create_contact_method_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let create_contact_method_request_to_yojson = 
  fun (x: create_contact_method_request) -> assoc_to_yojson(
    [(
         "contactEndpoint",
         (Some (string_max256_to_yojson x.contact_endpoint)));
       (
         "protocol",
         (Some (contact_protocol_to_yojson x.protocol)));
       
  ])

let create_cloud_formation_stack_result_to_yojson = 
  fun (x: create_cloud_formation_stack_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let instance_entry_to_yojson = 
  fun (x: instance_entry) -> assoc_to_yojson(
    [(
         "availabilityZone",
         (Some (string__to_yojson x.availability_zone)));
       (
         "userData",
         (option_to_yojson string__to_yojson x.user_data));
       (
         "portInfoSource",
         (Some (port_info_source_type_to_yojson x.port_info_source)));
       (
         "instanceType",
         (Some (non_empty_string_to_yojson x.instance_type)));
       (
         "sourceName",
         (Some (resource_name_to_yojson x.source_name)));
       
  ])

let instance_entry_list_to_yojson = 
  fun tree -> list_to_yojson instance_entry_to_yojson tree

let create_cloud_formation_stack_request_to_yojson = 
  fun (x: create_cloud_formation_stack_request) -> assoc_to_yojson(
    [(
         "instances",
         (Some (instance_entry_list_to_yojson x.instances)));
       
  ])

let create_certificate_result_to_yojson = 
  fun (x: create_certificate_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       (
         "certificate",
         (option_to_yojson certificate_summary_to_yojson x.certificate));
       
  ])

let create_certificate_request_to_yojson = 
  fun (x: create_certificate_request) -> assoc_to_yojson(
    [(
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "subjectAlternativeNames",
         (option_to_yojson subject_alternative_name_list_to_yojson x.subject_alternative_names));
       (
         "domainName",
         (Some (domain_name_to_yojson x.domain_name)));
       (
         "certificateName",
         (Some (certificate_name_to_yojson x.certificate_name)));
       
  ])

let create_bucket_access_key_result_to_yojson = 
  fun (x: create_bucket_access_key_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       (
         "accessKey",
         (option_to_yojson access_key_to_yojson x.access_key));
       
  ])

let create_bucket_access_key_request_to_yojson = 
  fun (x: create_bucket_access_key_request) -> assoc_to_yojson(
    [(
         "bucketName",
         (Some (bucket_name_to_yojson x.bucket_name)));
       
  ])

let create_bucket_result_to_yojson = 
  fun (x: create_bucket_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       (
         "bucket",
         (option_to_yojson bucket_to_yojson x.bucket));
       
  ])

let create_bucket_request_to_yojson = 
  fun (x: create_bucket_request) -> assoc_to_yojson(
    [(
         "enableObjectVersioning",
         (option_to_yojson boolean__to_yojson x.enable_object_versioning));
       (
         "tags",
         (option_to_yojson tag_list_to_yojson x.tags));
       (
         "bundleId",
         (Some (non_empty_string_to_yojson x.bundle_id)));
       (
         "bucketName",
         (Some (bucket_name_to_yojson x.bucket_name)));
       
  ])

let copy_snapshot_result_to_yojson = 
  fun (x: copy_snapshot_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let copy_snapshot_request_to_yojson = 
  fun (x: copy_snapshot_request) -> assoc_to_yojson(
    [(
         "sourceRegion",
         (Some (region_name_to_yojson x.source_region)));
       (
         "targetSnapshotName",
         (Some (resource_name_to_yojson x.target_snapshot_name)));
       (
         "useLatestRestorableAutoSnapshot",
         (option_to_yojson boolean__to_yojson x.use_latest_restorable_auto_snapshot));
       (
         "restoreDate",
         (option_to_yojson string__to_yojson x.restore_date));
       (
         "sourceResourceName",
         (option_to_yojson string__to_yojson x.source_resource_name));
       (
         "sourceSnapshotName",
         (option_to_yojson resource_name_to_yojson x.source_snapshot_name));
       
  ])

let close_instance_public_ports_result_to_yojson = 
  fun (x: close_instance_public_ports_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let close_instance_public_ports_request_to_yojson = 
  fun (x: close_instance_public_ports_request) -> assoc_to_yojson(
    [(
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       (
         "portInfo",
         (Some (port_info_to_yojson x.port_info)));
       
  ])

let attach_static_ip_result_to_yojson = 
  fun (x: attach_static_ip_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let attach_static_ip_request_to_yojson = 
  fun (x: attach_static_ip_request) -> assoc_to_yojson(
    [(
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       (
         "staticIpName",
         (Some (resource_name_to_yojson x.static_ip_name)));
       
  ])

let attach_load_balancer_tls_certificate_result_to_yojson = 
  fun (x: attach_load_balancer_tls_certificate_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let attach_load_balancer_tls_certificate_request_to_yojson = 
  fun (x: attach_load_balancer_tls_certificate_request) -> assoc_to_yojson(
    [(
         "certificateName",
         (Some (resource_name_to_yojson x.certificate_name)));
       (
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let attach_instances_to_load_balancer_result_to_yojson = 
  fun (x: attach_instances_to_load_balancer_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let attach_instances_to_load_balancer_request_to_yojson = 
  fun (x: attach_instances_to_load_balancer_request) -> assoc_to_yojson(
    [(
         "instanceNames",
         (Some (resource_name_list_to_yojson x.instance_names)));
       (
         "loadBalancerName",
         (Some (resource_name_to_yojson x.load_balancer_name)));
       
  ])

let attach_disk_result_to_yojson = 
  fun (x: attach_disk_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let attach_disk_request_to_yojson = 
  fun (x: attach_disk_request) -> assoc_to_yojson(
    [(
         "autoMounting",
         (option_to_yojson boolean__to_yojson x.auto_mounting));
       (
         "diskPath",
         (Some (non_empty_string_to_yojson x.disk_path)));
       (
         "instanceName",
         (Some (resource_name_to_yojson x.instance_name)));
       (
         "diskName",
         (Some (resource_name_to_yojson x.disk_name)));
       
  ])

let attach_certificate_to_distribution_result_to_yojson = 
  fun (x: attach_certificate_to_distribution_result) -> assoc_to_yojson(
    [(
         "operation",
         (option_to_yojson operation_to_yojson x.operation));
       
  ])

let attach_certificate_to_distribution_request_to_yojson = 
  fun (x: attach_certificate_to_distribution_request) -> assoc_to_yojson(
    [(
         "certificateName",
         (Some (resource_name_to_yojson x.certificate_name)));
       (
         "distributionName",
         (Some (resource_name_to_yojson x.distribution_name)));
       
  ])

let allocate_static_ip_result_to_yojson = 
  fun (x: allocate_static_ip_result) -> assoc_to_yojson(
    [(
         "operations",
         (option_to_yojson operation_list_to_yojson x.operations));
       
  ])

let allocate_static_ip_request_to_yojson = 
  fun (x: allocate_static_ip_request) -> assoc_to_yojson(
    [(
         "staticIpName",
         (Some (resource_name_to_yojson x.static_ip_name)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

