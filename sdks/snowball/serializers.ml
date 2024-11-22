open Smaws_Lib.Json.SerializeHelpers

open Types

let boolean__to_yojson = bool_to_yojson

let wireless_connection_to_yojson = 
  fun (x: wireless_connection) -> assoc_to_yojson(
    [(
         "IsWifiEnabled",
         (option_to_yojson boolean__to_yojson x.is_wifi_enabled));
       
  ])

let update_long_term_pricing_result_to_yojson = 
  fun (x: update_long_term_pricing_result) -> assoc_to_yojson(
    [
  ])

let long_term_pricing_id_to_yojson = string_to_yojson

let job_id_to_yojson = string_to_yojson

let java_boolean_to_yojson = bool_to_yojson

let update_long_term_pricing_request_to_yojson = 
  fun (x: update_long_term_pricing_request) -> assoc_to_yojson(
    [(
         "IsLongTermPricingAutoRenew",
         (option_to_yojson java_boolean_to_yojson x.is_long_term_pricing_auto_renew));
       (
         "ReplacementJob",
         (option_to_yojson job_id_to_yojson x.replacement_job));
       (
         "LongTermPricingId",
         (Some (long_term_pricing_id_to_yojson x.long_term_pricing_id)));
       
  ])

let string__to_yojson = string_to_yojson

let invalid_resource_exception_to_yojson = 
  fun (x: invalid_resource_exception) -> assoc_to_yojson(
    [(
         "ResourceType",
         (option_to_yojson string__to_yojson x.resource_type));
       (
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_job_shipment_state_result_to_yojson = 
  fun (x: update_job_shipment_state_result) -> assoc_to_yojson(
    [
  ])

let base_unit_to_yojson = unit_to_yojson

let shipment_state_to_yojson = 
  fun (x: shipment_state) -> match x with 
  | RETURNED -> `String "RETURNED"
    | RECEIVED -> `String "RECEIVED"
     

let update_job_shipment_state_request_to_yojson = 
  fun (x: update_job_shipment_state_request) -> assoc_to_yojson(
    [(
         "ShipmentState",
         (Some (shipment_state_to_yojson x.shipment_state)));
       (
         "JobId",
         (Some (job_id_to_yojson x.job_id)));
       
  ])

let invalid_job_state_exception_to_yojson = 
  fun (x: invalid_job_state_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_job_result_to_yojson = 
  fun (x: update_job_result) -> assoc_to_yojson(
    [
  ])

let role_ar_n_to_yojson = string_to_yojson

let sns_topic_ar_n_to_yojson = string_to_yojson

let job_state_to_yojson = 
  fun (x: job_state) -> match x with 
 
| PENDING -> `String "Pending"
  | LISTING -> `String "Listing"
  | CANCELLED -> `String "Cancelled"
  | COMPLETE -> `String "Complete"
  | IN_PROGRESS -> `String "InProgress"
  | WITH_AWS -> `String "WithAWS"
  | WITH_AWS_SORTING_FACILITY -> `String "WithAWSSortingFacility"
  | IN_TRANSIT_TO_AWS -> `String "InTransitToAWS"
  | WITH_CUSTOMER -> `String "WithCustomer"
  | IN_TRANSIT_TO_CUSTOMER -> `String "InTransitToCustomer"
  | PREPARING_SHIPMENT -> `String "PreparingShipment"
  | PREPARING_APPLIANCE -> `String "PreparingAppliance"
  | NEW -> `String "New"
   

let job_state_list_to_yojson = 
  fun tree -> list_to_yojson job_state_to_yojson tree

let notification_to_yojson = 
  fun (x: notification) -> assoc_to_yojson(
    [(
         "DevicePickupSnsTopicARN",
         (option_to_yojson sns_topic_ar_n_to_yojson x.device_pickup_sns_topic_ar_n));
       (
         "NotifyAll",
         (option_to_yojson boolean__to_yojson x.notify_all));
       (
         "JobStatesToNotify",
         (option_to_yojson job_state_list_to_yojson x.job_states_to_notify));
       (
         "SnsTopicARN",
         (option_to_yojson sns_topic_ar_n_to_yojson x.sns_topic_ar_n));
       
  ])

let resource_ar_n_to_yojson = string_to_yojson

let key_range_to_yojson = 
  fun (x: key_range) -> assoc_to_yojson(
    [(
         "EndMarker",
         (option_to_yojson string__to_yojson x.end_marker));
       (
         "BeginMarker",
         (option_to_yojson string__to_yojson x.begin_marker));
       
  ])

let device_service_name_to_yojson = 
  fun (x: device_service_name) -> match x with 
 
| S3_ON_DEVICE_SERVICE -> `String "S3_ON_DEVICE_SERVICE"
  | NFS_ON_DEVICE_SERVICE -> `String "NFS_ON_DEVICE_SERVICE"
   

let transfer_option_to_yojson = 
  fun (x: transfer_option) -> match x with 
 
| LOCAL_USE -> `String "LOCAL_USE"
  | EXPORT -> `String "EXPORT"
  | IMPORT -> `String "IMPORT"
   

let target_on_device_service_to_yojson = 
  fun (x: target_on_device_service) -> assoc_to_yojson(
    [(
         "TransferOption",
         (option_to_yojson transfer_option_to_yojson x.transfer_option));
       (
         "ServiceName",
         (option_to_yojson device_service_name_to_yojson x.service_name));
       
  ])

let target_on_device_service_list_to_yojson = 
  fun tree -> list_to_yojson target_on_device_service_to_yojson tree

let s3_resource_to_yojson = 
  fun (x: s3_resource) -> assoc_to_yojson(
    [(
         "TargetOnDeviceServices",
         (option_to_yojson target_on_device_service_list_to_yojson x.target_on_device_services));
       (
         "KeyRange",
         (option_to_yojson key_range_to_yojson x.key_range));
       (
         "BucketArn",
         (option_to_yojson resource_ar_n_to_yojson x.bucket_arn));
       
  ])

let s3_resource_list_to_yojson = 
  fun tree -> list_to_yojson s3_resource_to_yojson tree

let event_trigger_definition_to_yojson = 
  fun (x: event_trigger_definition) -> assoc_to_yojson(
    [(
         "EventResourceARN",
         (option_to_yojson resource_ar_n_to_yojson x.event_resource_ar_n));
       
  ])

let event_trigger_definition_list_to_yojson = 
  fun tree -> list_to_yojson event_trigger_definition_to_yojson tree

let lambda_resource_to_yojson = 
  fun (x: lambda_resource) -> assoc_to_yojson(
    [(
         "EventTriggers",
         (option_to_yojson event_trigger_definition_list_to_yojson x.event_triggers));
       (
         "LambdaArn",
         (option_to_yojson resource_ar_n_to_yojson x.lambda_arn));
       
  ])

let lambda_resource_list_to_yojson = 
  fun tree -> list_to_yojson lambda_resource_to_yojson tree

let ami_id_to_yojson = string_to_yojson

let ec2_ami_resource_to_yojson = 
  fun (x: ec2_ami_resource) -> assoc_to_yojson(
    [(
         "SnowballAmiId",
         (option_to_yojson string__to_yojson x.snowball_ami_id));
       (
         "AmiId",
         (Some (ami_id_to_yojson x.ami_id)));
       
  ])

let ec2_ami_resource_list_to_yojson = 
  fun tree -> list_to_yojson ec2_ami_resource_to_yojson tree

let job_resource_to_yojson = 
  fun (x: job_resource) -> assoc_to_yojson(
    [(
         "Ec2AmiResources",
         (option_to_yojson ec2_ami_resource_list_to_yojson x.ec2_ami_resources));
       (
         "LambdaResources",
         (option_to_yojson lambda_resource_list_to_yojson x.lambda_resources));
       (
         "S3Resources",
         (option_to_yojson s3_resource_list_to_yojson x.s3_resources));
       
  ])

let storage_limit_to_yojson = int_to_yojson

let storage_unit_to_yojson = 
  fun (x: storage_unit) -> match x with 
  | TB -> `String "TB"
     

let nfs_on_device_service_configuration_to_yojson = 
  fun (x: nfs_on_device_service_configuration) -> assoc_to_yojson(
    [(
         "StorageUnit",
         (option_to_yojson storage_unit_to_yojson x.storage_unit));
       (
         "StorageLimit",
         (option_to_yojson storage_limit_to_yojson x.storage_limit));
       
  ])

let tgw_on_device_service_configuration_to_yojson = 
  fun (x: tgw_on_device_service_configuration) -> assoc_to_yojson(
    [(
         "StorageUnit",
         (option_to_yojson storage_unit_to_yojson x.storage_unit));
       (
         "StorageLimit",
         (option_to_yojson storage_limit_to_yojson x.storage_limit));
       
  ])

let eks_on_device_service_configuration_to_yojson = 
  fun (x: eks_on_device_service_configuration) -> assoc_to_yojson(
    [(
         "EKSAnywhereVersion",
         (option_to_yojson string__to_yojson x.eks_anywhere_version));
       (
         "KubernetesVersion",
         (option_to_yojson string__to_yojson x.kubernetes_version));
       
  ])

let s3_storage_limit_to_yojson = double_to_yojson

let service_size_to_yojson = int_to_yojson

let node_fault_tolerance_to_yojson = int_to_yojson

let s3_on_device_service_configuration_to_yojson = 
  fun (x: s3_on_device_service_configuration) -> assoc_to_yojson(
    [(
         "FaultTolerance",
         (option_to_yojson node_fault_tolerance_to_yojson x.fault_tolerance));
       (
         "ServiceSize",
         (option_to_yojson service_size_to_yojson x.service_size));
       (
         "StorageUnit",
         (option_to_yojson storage_unit_to_yojson x.storage_unit));
       (
         "StorageLimit",
         (option_to_yojson s3_storage_limit_to_yojson x.storage_limit));
       
  ])

let on_device_service_configuration_to_yojson = 
  fun (x: on_device_service_configuration) -> assoc_to_yojson(
    [(
         "S3OnDeviceService",
         (option_to_yojson s3_on_device_service_configuration_to_yojson x.s3_on_device_service));
       (
         "EKSOnDeviceService",
         (option_to_yojson eks_on_device_service_configuration_to_yojson x.eks_on_device_service));
       (
         "TGWOnDeviceService",
         (option_to_yojson tgw_on_device_service_configuration_to_yojson x.tgw_on_device_service));
       (
         "NFSOnDeviceService",
         (option_to_yojson nfs_on_device_service_configuration_to_yojson x.nfs_on_device_service));
       
  ])

let address_id_to_yojson = string_to_yojson

let shipping_option_to_yojson = 
  fun (x: shipping_option) -> match x with 
 
| STANDARD -> `String "STANDARD"
  | EXPRESS -> `String "EXPRESS"
  | NEXT_DAY -> `String "NEXT_DAY"
  | SECOND_DAY -> `String "SECOND_DAY"
   

let snowball_capacity_to_yojson = 
  fun (x: snowball_capacity) -> match x with 
 
| T13 -> `String "T13"
  | T240 -> `String "T240"
  | NO_PREFERENCE -> `String "NoPreference"
  | T32 -> `String "T32"
  | T14 -> `String "T14"
  | T8 -> `String "T8"
  | T98 -> `String "T98"
  | T42 -> `String "T42"
  | T100 -> `String "T100"
  | T80 -> `String "T80"
  | T50 -> `String "T50"
   

let phone_number_to_yojson = string_to_yojson

let email_to_yojson = string_to_yojson

let timestamp__to_yojson = timestamp_to_yojson

let device_pickup_id_to_yojson = string_to_yojson

let pickup_details_to_yojson = 
  fun (x: pickup_details) -> assoc_to_yojson(
    [(
         "DevicePickupId",
         (option_to_yojson device_pickup_id_to_yojson x.device_pickup_id));
       (
         "IdentificationIssuingOrg",
         (option_to_yojson string__to_yojson x.identification_issuing_org));
       (
         "IdentificationExpirationDate",
         (option_to_yojson timestamp__to_yojson x.identification_expiration_date));
       (
         "IdentificationNumber",
         (option_to_yojson string__to_yojson x.identification_number));
       (
         "Email",
         (option_to_yojson email_to_yojson x.email));
       (
         "PhoneNumber",
         (option_to_yojson phone_number_to_yojson x.phone_number));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       
  ])

let update_job_request_to_yojson = 
  fun (x: update_job_request) -> assoc_to_yojson(
    [(
         "PickupDetails",
         (option_to_yojson pickup_details_to_yojson x.pickup_details));
       (
         "ForwardingAddressId",
         (option_to_yojson address_id_to_yojson x.forwarding_address_id));
       (
         "SnowballCapacityPreference",
         (option_to_yojson snowball_capacity_to_yojson x.snowball_capacity_preference));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "ShippingOption",
         (option_to_yojson shipping_option_to_yojson x.shipping_option));
       (
         "AddressId",
         (option_to_yojson address_id_to_yojson x.address_id));
       (
         "OnDeviceServiceConfiguration",
         (option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration));
       (
         "Resources",
         (option_to_yojson job_resource_to_yojson x.resources));
       (
         "Notification",
         (option_to_yojson notification_to_yojson x.notification));
       (
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "JobId",
         (Some (job_id_to_yojson x.job_id)));
       
  ])

let kms_request_failed_exception_to_yojson = 
  fun (x: kms_request_failed_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let invalid_input_combination_exception_to_yojson = 
  fun (x: invalid_input_combination_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let ec2_request_failed_exception_to_yojson = 
  fun (x: ec2_request_failed_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let cluster_limit_exceeded_exception_to_yojson = 
  fun (x: cluster_limit_exceeded_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let update_cluster_result_to_yojson = 
  fun (x: update_cluster_result) -> assoc_to_yojson(
    [
  ])

let cluster_id_to_yojson = string_to_yojson

let update_cluster_request_to_yojson = 
  fun (x: update_cluster_request) -> assoc_to_yojson(
    [(
         "ForwardingAddressId",
         (option_to_yojson address_id_to_yojson x.forwarding_address_id));
       (
         "Notification",
         (option_to_yojson notification_to_yojson x.notification));
       (
         "ShippingOption",
         (option_to_yojson shipping_option_to_yojson x.shipping_option));
       (
         "AddressId",
         (option_to_yojson address_id_to_yojson x.address_id));
       (
         "OnDeviceServiceConfiguration",
         (option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration));
       (
         "Resources",
         (option_to_yojson job_resource_to_yojson x.resources));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "ClusterId",
         (Some (cluster_id_to_yojson x.cluster_id)));
       
  ])

let unsupported_address_exception_to_yojson = 
  fun (x: unsupported_address_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let gsti_n_to_yojson = string_to_yojson

let ind_tax_documents_to_yojson = 
  fun (x: ind_tax_documents) -> assoc_to_yojson(
    [(
         "GSTIN",
         (option_to_yojson gsti_n_to_yojson x.gsti_n));
       
  ])

let tax_documents_to_yojson = 
  fun (x: tax_documents) -> assoc_to_yojson(
    [(
         "IND",
         (option_to_yojson ind_tax_documents_to_yojson x.in_d));
       
  ])

let snowcone_device_configuration_to_yojson = 
  fun (x: snowcone_device_configuration) -> assoc_to_yojson(
    [(
         "WirelessConnection",
         (option_to_yojson wireless_connection_to_yojson x.wireless_connection));
       
  ])

let snowball_type_to_yojson = 
  fun (x: snowball_type) -> match x with 
 
| RACK_5U_C -> `String "RACK_5U_C"
  | V3_5S -> `String "V3_5S"
  | V3_5C -> `String "V3_5C"
  | SNC1_SSD -> `String "SNC1_SSD"
  | SNC1_HDD -> `String "SNC1_HDD"
  | EDGE_S -> `String "EDGE_S"
  | EDGE_CG -> `String "EDGE_CG"
  | EDGE_C -> `String "EDGE_C"
  | EDGE -> `String "EDGE"
  | STANDARD -> `String "STANDARD"
   

let shipping_label_status_to_yojson = 
  fun (x: shipping_label_status) -> match x with 
 
| FAILED -> `String "Failed"
  | SUCCEEDED -> `String "Succeeded"
  | TIMED_OUT -> `String "TimedOut"
  | IN_PROGRESS -> `String "InProgress"
   

let shipment_to_yojson = 
  fun (x: shipment) -> assoc_to_yojson(
    [(
         "TrackingNumber",
         (option_to_yojson string__to_yojson x.tracking_number));
       (
         "Status",
         (option_to_yojson string__to_yojson x.status));
       
  ])

let shipping_details_to_yojson = 
  fun (x: shipping_details) -> assoc_to_yojson(
    [(
         "OutboundShipment",
         (option_to_yojson shipment_to_yojson x.outbound_shipment));
       (
         "InboundShipment",
         (option_to_yojson shipment_to_yojson x.inbound_shipment));
       (
         "ShippingOption",
         (option_to_yojson shipping_option_to_yojson x.shipping_option));
       
  ])

let service_version_to_yojson = 
  fun (x: service_version) -> assoc_to_yojson(
    [(
         "Version",
         (option_to_yojson string__to_yojson x.version));
       
  ])

let service_version_list_to_yojson = 
  fun tree -> list_to_yojson service_version_to_yojson tree

let service_name_to_yojson = 
  fun (x: service_name) -> match x with 
 
| EKS_ANYWHERE -> `String "EKS_ANYWHERE"
  | KUBERNETES -> `String "KUBERNETES"
   

let return_shipping_label_already_exists_exception_to_yojson = 
  fun (x: return_shipping_label_already_exists_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let remote_management_to_yojson = 
  fun (x: remote_management) -> match x with 
 
| NOT_INSTALLED -> `String "NOT_INSTALLED"
  | INSTALLED_AUTOSTART -> `String "INSTALLED_AUTOSTART"
  | INSTALLED_ONLY -> `String "INSTALLED_ONLY"
   

let long_term_pricing_type_to_yojson = 
  fun (x: long_term_pricing_type) -> match x with 
 
| ONE_MONTH -> `String "OneMonth"
  | THREE_YEAR -> `String "ThreeYear"
  | ONE_YEAR -> `String "OneYear"
   

let long_term_pricing_associated_job_id_list_to_yojson = 
  fun tree -> list_to_yojson job_id_to_yojson tree

let long_term_pricing_list_entry_to_yojson = 
  fun (x: long_term_pricing_list_entry) -> assoc_to_yojson(
    [(
         "JobIds",
         (option_to_yojson long_term_pricing_associated_job_id_list_to_yojson x.job_ids));
       (
         "SnowballType",
         (option_to_yojson snowball_type_to_yojson x.snowball_type));
       (
         "LongTermPricingStatus",
         (option_to_yojson string__to_yojson x.long_term_pricing_status));
       (
         "IsLongTermPricingAutoRenew",
         (option_to_yojson java_boolean_to_yojson x.is_long_term_pricing_auto_renew));
       (
         "ReplacementJob",
         (option_to_yojson job_id_to_yojson x.replacement_job));
       (
         "CurrentActiveJob",
         (option_to_yojson job_id_to_yojson x.current_active_job));
       (
         "LongTermPricingType",
         (option_to_yojson long_term_pricing_type_to_yojson x.long_term_pricing_type));
       (
         "LongTermPricingStartDate",
         (option_to_yojson timestamp__to_yojson x.long_term_pricing_start_date));
       (
         "LongTermPricingEndDate",
         (option_to_yojson timestamp__to_yojson x.long_term_pricing_end_date));
       (
         "LongTermPricingId",
         (option_to_yojson long_term_pricing_id_to_yojson x.long_term_pricing_id));
       
  ])

let long_term_pricing_id_list_to_yojson = 
  fun tree -> list_to_yojson long_term_pricing_id_to_yojson tree

let long_term_pricing_entry_list_to_yojson = 
  fun tree -> list_to_yojson long_term_pricing_list_entry_to_yojson tree

let long_to_yojson = long_to_yojson

let dependent_service_to_yojson = 
  fun (x: dependent_service) -> assoc_to_yojson(
    [(
         "ServiceVersion",
         (option_to_yojson service_version_to_yojson x.service_version));
       (
         "ServiceName",
         (option_to_yojson service_name_to_yojson x.service_name));
       
  ])

let dependent_service_list_to_yojson = 
  fun tree -> list_to_yojson dependent_service_to_yojson tree

let list_service_versions_result_to_yojson = 
  fun (x: list_service_versions_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "DependentServices",
         (option_to_yojson dependent_service_list_to_yojson x.dependent_services));
       (
         "ServiceName",
         (Some (service_name_to_yojson x.service_name)));
       (
         "ServiceVersions",
         (Some (service_version_list_to_yojson x.service_versions)));
       
  ])

let list_limit_to_yojson = int_to_yojson

let list_service_versions_request_to_yojson = 
  fun (x: list_service_versions_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_limit_to_yojson x.max_results));
       (
         "DependentServices",
         (option_to_yojson dependent_service_list_to_yojson x.dependent_services));
       (
         "ServiceName",
         (Some (service_name_to_yojson x.service_name)));
       
  ])

let invalid_next_token_exception_to_yojson = 
  fun (x: invalid_next_token_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let address_type_to_yojson = 
  fun (x: address_type) -> match x with 
  | AWS_SHIP -> `String "AWS_SHIP"
    | CUST_PICKUP -> `String "CUST_PICKUP"
     

let address_to_yojson = 
  fun (x: address) -> assoc_to_yojson(
    [(
         "Type",
         (option_to_yojson address_type_to_yojson x.type_));
       (
         "IsRestricted",
         (option_to_yojson boolean__to_yojson x.is_restricted));
       (
         "PhoneNumber",
         (option_to_yojson string__to_yojson x.phone_number));
       (
         "PostalCode",
         (option_to_yojson string__to_yojson x.postal_code));
       (
         "Country",
         (option_to_yojson string__to_yojson x.country));
       (
         "Landmark",
         (option_to_yojson string__to_yojson x.landmark));
       (
         "PrefectureOrDistrict",
         (option_to_yojson string__to_yojson x.prefecture_or_district));
       (
         "StateOrProvince",
         (option_to_yojson string__to_yojson x.state_or_province));
       (
         "City",
         (option_to_yojson string__to_yojson x.city));
       (
         "Street3",
         (option_to_yojson string__to_yojson x.street3));
       (
         "Street2",
         (option_to_yojson string__to_yojson x.street2));
       (
         "Street1",
         (option_to_yojson string__to_yojson x.street1));
       (
         "Company",
         (option_to_yojson string__to_yojson x.company));
       (
         "Name",
         (option_to_yojson string__to_yojson x.name));
       (
         "AddressId",
         (option_to_yojson address_id_to_yojson x.address_id));
       
  ])

let address_list_to_yojson = 
  fun tree -> list_to_yojson address_to_yojson tree

let list_pickup_locations_result_to_yojson = 
  fun (x: list_pickup_locations_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Addresses",
         (option_to_yojson address_list_to_yojson x.addresses));
       
  ])

let list_pickup_locations_request_to_yojson = 
  fun (x: list_pickup_locations_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_limit_to_yojson x.max_results));
       
  ])

let list_long_term_pricing_result_to_yojson = 
  fun (x: list_long_term_pricing_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "LongTermPricingEntries",
         (option_to_yojson long_term_pricing_entry_list_to_yojson x.long_term_pricing_entries));
       
  ])

let list_long_term_pricing_request_to_yojson = 
  fun (x: list_long_term_pricing_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_limit_to_yojson x.max_results));
       
  ])

let job_type_to_yojson = 
  fun (x: job_type) -> match x with 
 
| LOCAL_USE -> `String "LOCAL_USE"
  | EXPORT -> `String "EXPORT"
  | IMPORT -> `String "IMPORT"
   

let job_list_entry_to_yojson = 
  fun (x: job_list_entry) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "CreationDate",
         (option_to_yojson timestamp__to_yojson x.creation_date));
       (
         "SnowballType",
         (option_to_yojson snowball_type_to_yojson x.snowball_type));
       (
         "JobType",
         (option_to_yojson job_type_to_yojson x.job_type));
       (
         "IsMaster",
         (option_to_yojson boolean__to_yojson x.is_master));
       (
         "JobState",
         (option_to_yojson job_state_to_yojson x.job_state));
       (
         "JobId",
         (option_to_yojson string__to_yojson x.job_id));
       
  ])

let job_list_entry_list_to_yojson = 
  fun tree -> list_to_yojson job_list_entry_to_yojson tree

let list_jobs_result_to_yojson = 
  fun (x: list_jobs_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "JobListEntries",
         (option_to_yojson job_list_entry_list_to_yojson x.job_list_entries));
       
  ])

let list_jobs_request_to_yojson = 
  fun (x: list_jobs_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_limit_to_yojson x.max_results));
       
  ])

let compatible_image_to_yojson = 
  fun (x: compatible_image) -> assoc_to_yojson(
    [(
         "Name",
         (option_to_yojson string__to_yojson x.name));
       (
         "AmiId",
         (option_to_yojson string__to_yojson x.ami_id));
       
  ])

let compatible_image_list_to_yojson = 
  fun tree -> list_to_yojson compatible_image_to_yojson tree

let list_compatible_images_result_to_yojson = 
  fun (x: list_compatible_images_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "CompatibleImages",
         (option_to_yojson compatible_image_list_to_yojson x.compatible_images));
       
  ])

let list_compatible_images_request_to_yojson = 
  fun (x: list_compatible_images_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_limit_to_yojson x.max_results));
       
  ])

let cluster_state_to_yojson = 
  fun (x: cluster_state) -> match x with 
 
| CANCELLED -> `String "Cancelled"
  | COMPLETE -> `String "Complete"
  | IN_USE -> `String "InUse"
  | PENDING -> `String "Pending"
  | AWAITING_QUORUM -> `String "AwaitingQuorum"
   

let cluster_list_entry_to_yojson = 
  fun (x: cluster_list_entry) -> assoc_to_yojson(
    [(
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "CreationDate",
         (option_to_yojson timestamp__to_yojson x.creation_date));
       (
         "ClusterState",
         (option_to_yojson cluster_state_to_yojson x.cluster_state));
       (
         "ClusterId",
         (option_to_yojson string__to_yojson x.cluster_id));
       
  ])

let cluster_list_entry_list_to_yojson = 
  fun tree -> list_to_yojson cluster_list_entry_to_yojson tree

let list_clusters_result_to_yojson = 
  fun (x: list_clusters_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "ClusterListEntries",
         (option_to_yojson cluster_list_entry_list_to_yojson x.cluster_list_entries));
       
  ])

let list_clusters_request_to_yojson = 
  fun (x: list_clusters_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_limit_to_yojson x.max_results));
       
  ])

let list_cluster_jobs_result_to_yojson = 
  fun (x: list_cluster_jobs_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "JobListEntries",
         (option_to_yojson job_list_entry_list_to_yojson x.job_list_entries));
       
  ])

let list_cluster_jobs_request_to_yojson = 
  fun (x: list_cluster_jobs_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_limit_to_yojson x.max_results));
       (
         "ClusterId",
         (Some (cluster_id_to_yojson x.cluster_id)));
       
  ])

let kms_key_ar_n_to_yojson = string_to_yojson

let data_transfer_to_yojson = 
  fun (x: data_transfer) -> assoc_to_yojson(
    [(
         "TotalObjects",
         (option_to_yojson long_to_yojson x.total_objects));
       (
         "TotalBytes",
         (option_to_yojson long_to_yojson x.total_bytes));
       (
         "ObjectsTransferred",
         (option_to_yojson long_to_yojson x.objects_transferred));
       (
         "BytesTransferred",
         (option_to_yojson long_to_yojson x.bytes_transferred));
       
  ])

let job_logs_to_yojson = 
  fun (x: job_logs) -> assoc_to_yojson(
    [(
         "JobFailureLogURI",
         (option_to_yojson string__to_yojson x.job_failure_log_ur_i));
       (
         "JobSuccessLogURI",
         (option_to_yojson string__to_yojson x.job_success_log_ur_i));
       (
         "JobCompletionReportURI",
         (option_to_yojson string__to_yojson x.job_completion_report_ur_i));
       
  ])

let device_configuration_to_yojson = 
  fun (x: device_configuration) -> assoc_to_yojson(
    [(
         "SnowconeDeviceConfiguration",
         (option_to_yojson snowcone_device_configuration_to_yojson x.snowcone_device_configuration));
       
  ])

let impact_level_to_yojson = 
  fun (x: impact_level) -> match x with 
 
| IL99 -> `String "IL99"
  | IL6 -> `String "IL6"
  | IL5 -> `String "IL5"
  | IL4 -> `String "IL4"
  | IL2 -> `String "IL2"
   

let job_metadata_to_yojson = 
  fun (x: job_metadata) -> assoc_to_yojson(
    [(
         "SnowballId",
         (option_to_yojson string__to_yojson x.snowball_id));
       (
         "PickupDetails",
         (option_to_yojson pickup_details_to_yojson x.pickup_details));
       (
         "ImpactLevel",
         (option_to_yojson impact_level_to_yojson x.impact_level));
       (
         "OnDeviceServiceConfiguration",
         (option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration));
       (
         "LongTermPricingId",
         (option_to_yojson long_term_pricing_id_to_yojson x.long_term_pricing_id));
       (
         "RemoteManagement",
         (option_to_yojson remote_management_to_yojson x.remote_management));
       (
         "DeviceConfiguration",
         (option_to_yojson device_configuration_to_yojson x.device_configuration));
       (
         "TaxDocuments",
         (option_to_yojson tax_documents_to_yojson x.tax_documents));
       (
         "ForwardingAddressId",
         (option_to_yojson address_id_to_yojson x.forwarding_address_id));
       (
         "ClusterId",
         (option_to_yojson string__to_yojson x.cluster_id));
       (
         "JobLogInfo",
         (option_to_yojson job_logs_to_yojson x.job_log_info));
       (
         "DataTransferProgress",
         (option_to_yojson data_transfer_to_yojson x.data_transfer_progress));
       (
         "Notification",
         (option_to_yojson notification_to_yojson x.notification));
       (
         "SnowballCapacityPreference",
         (option_to_yojson snowball_capacity_to_yojson x.snowball_capacity_preference));
       (
         "ShippingDetails",
         (option_to_yojson shipping_details_to_yojson x.shipping_details));
       (
         "AddressId",
         (option_to_yojson address_id_to_yojson x.address_id));
       (
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "KmsKeyARN",
         (option_to_yojson kms_key_ar_n_to_yojson x.kms_key_ar_n));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "Resources",
         (option_to_yojson job_resource_to_yojson x.resources));
       (
         "CreationDate",
         (option_to_yojson timestamp__to_yojson x.creation_date));
       (
         "SnowballType",
         (option_to_yojson snowball_type_to_yojson x.snowball_type));
       (
         "JobType",
         (option_to_yojson job_type_to_yojson x.job_type));
       (
         "JobState",
         (option_to_yojson job_state_to_yojson x.job_state));
       (
         "JobId",
         (option_to_yojson string__to_yojson x.job_id));
       
  ])

let job_metadata_list_to_yojson = 
  fun tree -> list_to_yojson job_metadata_to_yojson tree

let invalid_address_exception_to_yojson = 
  fun (x: invalid_address_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       
  ])

let integer__to_yojson = int_to_yojson

let initial_cluster_size_to_yojson = int_to_yojson

let get_software_updates_result_to_yojson = 
  fun (x: get_software_updates_result) -> assoc_to_yojson(
    [(
         "UpdatesURI",
         (option_to_yojson string__to_yojson x.updates_ur_i));
       
  ])

let get_software_updates_request_to_yojson = 
  fun (x: get_software_updates_request) -> assoc_to_yojson(
    [(
         "JobId",
         (Some (job_id_to_yojson x.job_id)));
       
  ])

let get_snowball_usage_result_to_yojson = 
  fun (x: get_snowball_usage_result) -> assoc_to_yojson(
    [(
         "SnowballsInUse",
         (option_to_yojson integer__to_yojson x.snowballs_in_use));
       (
         "SnowballLimit",
         (option_to_yojson integer__to_yojson x.snowball_limit));
       
  ])

let get_snowball_usage_request_to_yojson = 
  fun (x: get_snowball_usage_request) -> assoc_to_yojson(
    [
  ])

let get_job_unlock_code_result_to_yojson = 
  fun (x: get_job_unlock_code_result) -> assoc_to_yojson(
    [(
         "UnlockCode",
         (option_to_yojson string__to_yojson x.unlock_code));
       
  ])

let get_job_unlock_code_request_to_yojson = 
  fun (x: get_job_unlock_code_request) -> assoc_to_yojson(
    [(
         "JobId",
         (Some (job_id_to_yojson x.job_id)));
       
  ])

let get_job_manifest_result_to_yojson = 
  fun (x: get_job_manifest_result) -> assoc_to_yojson(
    [(
         "ManifestURI",
         (option_to_yojson string__to_yojson x.manifest_ur_i));
       
  ])

let get_job_manifest_request_to_yojson = 
  fun (x: get_job_manifest_request) -> assoc_to_yojson(
    [(
         "JobId",
         (Some (job_id_to_yojson x.job_id)));
       
  ])

let describe_return_shipping_label_result_to_yojson = 
  fun (x: describe_return_shipping_label_result) -> assoc_to_yojson(
    [(
         "ReturnShippingLabelURI",
         (option_to_yojson string__to_yojson x.return_shipping_label_ur_i));
       (
         "ExpirationDate",
         (option_to_yojson timestamp__to_yojson x.expiration_date));
       (
         "Status",
         (option_to_yojson shipping_label_status_to_yojson x.status));
       
  ])

let describe_return_shipping_label_request_to_yojson = 
  fun (x: describe_return_shipping_label_request) -> assoc_to_yojson(
    [(
         "JobId",
         (Some (job_id_to_yojson x.job_id)));
       
  ])

let conflict_exception_to_yojson = 
  fun (x: conflict_exception) -> assoc_to_yojson(
    [(
         "Message",
         (option_to_yojson string__to_yojson x.message));
       (
         "ConflictResource",
         (option_to_yojson string__to_yojson x.conflict_resource));
       
  ])

let describe_job_result_to_yojson = 
  fun (x: describe_job_result) -> assoc_to_yojson(
    [(
         "SubJobMetadata",
         (option_to_yojson job_metadata_list_to_yojson x.sub_job_metadata));
       (
         "JobMetadata",
         (option_to_yojson job_metadata_to_yojson x.job_metadata));
       
  ])

let describe_job_request_to_yojson = 
  fun (x: describe_job_request) -> assoc_to_yojson(
    [(
         "JobId",
         (Some (job_id_to_yojson x.job_id)));
       
  ])

let cluster_metadata_to_yojson = 
  fun (x: cluster_metadata) -> assoc_to_yojson(
    [(
         "OnDeviceServiceConfiguration",
         (option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration));
       (
         "TaxDocuments",
         (option_to_yojson tax_documents_to_yojson x.tax_documents));
       (
         "ForwardingAddressId",
         (option_to_yojson address_id_to_yojson x.forwarding_address_id));
       (
         "Notification",
         (option_to_yojson notification_to_yojson x.notification));
       (
         "ShippingOption",
         (option_to_yojson shipping_option_to_yojson x.shipping_option));
       (
         "AddressId",
         (option_to_yojson address_id_to_yojson x.address_id));
       (
         "Resources",
         (option_to_yojson job_resource_to_yojson x.resources));
       (
         "CreationDate",
         (option_to_yojson timestamp__to_yojson x.creation_date));
       (
         "SnowballType",
         (option_to_yojson snowball_type_to_yojson x.snowball_type));
       (
         "JobType",
         (option_to_yojson job_type_to_yojson x.job_type));
       (
         "ClusterState",
         (option_to_yojson cluster_state_to_yojson x.cluster_state));
       (
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "KmsKeyARN",
         (option_to_yojson kms_key_ar_n_to_yojson x.kms_key_ar_n));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "ClusterId",
         (option_to_yojson string__to_yojson x.cluster_id));
       
  ])

let describe_cluster_result_to_yojson = 
  fun (x: describe_cluster_result) -> assoc_to_yojson(
    [(
         "ClusterMetadata",
         (option_to_yojson cluster_metadata_to_yojson x.cluster_metadata));
       
  ])

let describe_cluster_request_to_yojson = 
  fun (x: describe_cluster_request) -> assoc_to_yojson(
    [(
         "ClusterId",
         (Some (cluster_id_to_yojson x.cluster_id)));
       
  ])

let describe_addresses_result_to_yojson = 
  fun (x: describe_addresses_result) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "Addresses",
         (option_to_yojson address_list_to_yojson x.addresses));
       
  ])

let describe_addresses_request_to_yojson = 
  fun (x: describe_addresses_request) -> assoc_to_yojson(
    [(
         "NextToken",
         (option_to_yojson string__to_yojson x.next_token));
       (
         "MaxResults",
         (option_to_yojson list_limit_to_yojson x.max_results));
       
  ])

let describe_address_result_to_yojson = 
  fun (x: describe_address_result) -> assoc_to_yojson(
    [(
         "Address",
         (option_to_yojson address_to_yojson x.address));
       
  ])

let describe_address_request_to_yojson = 
  fun (x: describe_address_request) -> assoc_to_yojson(
    [(
         "AddressId",
         (Some (address_id_to_yojson x.address_id)));
       
  ])

let create_return_shipping_label_result_to_yojson = 
  fun (x: create_return_shipping_label_result) -> assoc_to_yojson(
    [(
         "Status",
         (option_to_yojson shipping_label_status_to_yojson x.status));
       
  ])

let create_return_shipping_label_request_to_yojson = 
  fun (x: create_return_shipping_label_request) -> assoc_to_yojson(
    [(
         "ShippingOption",
         (option_to_yojson shipping_option_to_yojson x.shipping_option));
       (
         "JobId",
         (Some (job_id_to_yojson x.job_id)));
       
  ])

let create_long_term_pricing_result_to_yojson = 
  fun (x: create_long_term_pricing_result) -> assoc_to_yojson(
    [(
         "LongTermPricingId",
         (option_to_yojson long_term_pricing_id_to_yojson x.long_term_pricing_id));
       
  ])

let create_long_term_pricing_request_to_yojson = 
  fun (x: create_long_term_pricing_request) -> assoc_to_yojson(
    [(
         "SnowballType",
         (Some (snowball_type_to_yojson x.snowball_type)));
       (
         "IsLongTermPricingAutoRenew",
         (option_to_yojson java_boolean_to_yojson x.is_long_term_pricing_auto_renew));
       (
         "LongTermPricingType",
         (Some (long_term_pricing_type_to_yojson x.long_term_pricing_type)));
       
  ])

let create_job_result_to_yojson = 
  fun (x: create_job_result) -> assoc_to_yojson(
    [(
         "JobId",
         (option_to_yojson job_id_to_yojson x.job_id));
       
  ])

let create_job_request_to_yojson = 
  fun (x: create_job_request) -> assoc_to_yojson(
    [(
         "PickupDetails",
         (option_to_yojson pickup_details_to_yojson x.pickup_details));
       (
         "ImpactLevel",
         (option_to_yojson impact_level_to_yojson x.impact_level));
       (
         "LongTermPricingId",
         (option_to_yojson long_term_pricing_id_to_yojson x.long_term_pricing_id));
       (
         "RemoteManagement",
         (option_to_yojson remote_management_to_yojson x.remote_management));
       (
         "DeviceConfiguration",
         (option_to_yojson device_configuration_to_yojson x.device_configuration));
       (
         "TaxDocuments",
         (option_to_yojson tax_documents_to_yojson x.tax_documents));
       (
         "ForwardingAddressId",
         (option_to_yojson address_id_to_yojson x.forwarding_address_id));
       (
         "SnowballType",
         (option_to_yojson snowball_type_to_yojson x.snowball_type));
       (
         "ClusterId",
         (option_to_yojson cluster_id_to_yojson x.cluster_id));
       (
         "Notification",
         (option_to_yojson notification_to_yojson x.notification));
       (
         "ShippingOption",
         (option_to_yojson shipping_option_to_yojson x.shipping_option));
       (
         "SnowballCapacityPreference",
         (option_to_yojson snowball_capacity_to_yojson x.snowball_capacity_preference));
       (
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "KmsKeyARN",
         (option_to_yojson kms_key_ar_n_to_yojson x.kms_key_ar_n));
       (
         "AddressId",
         (option_to_yojson address_id_to_yojson x.address_id));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "OnDeviceServiceConfiguration",
         (option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration));
       (
         "Resources",
         (option_to_yojson job_resource_to_yojson x.resources));
       (
         "JobType",
         (option_to_yojson job_type_to_yojson x.job_type));
       
  ])

let create_cluster_result_to_yojson = 
  fun (x: create_cluster_result) -> assoc_to_yojson(
    [(
         "JobListEntries",
         (option_to_yojson job_list_entry_list_to_yojson x.job_list_entries));
       (
         "ClusterId",
         (option_to_yojson cluster_id_to_yojson x.cluster_id));
       
  ])

let create_cluster_request_to_yojson = 
  fun (x: create_cluster_request) -> assoc_to_yojson(
    [(
         "SnowballCapacityPreference",
         (option_to_yojson snowball_capacity_to_yojson x.snowball_capacity_preference));
       (
         "LongTermPricingIds",
         (option_to_yojson long_term_pricing_id_list_to_yojson x.long_term_pricing_ids));
       (
         "ForceCreateJobs",
         (option_to_yojson boolean__to_yojson x.force_create_jobs));
       (
         "InitialClusterSize",
         (option_to_yojson initial_cluster_size_to_yojson x.initial_cluster_size));
       (
         "RemoteManagement",
         (option_to_yojson remote_management_to_yojson x.remote_management));
       (
         "TaxDocuments",
         (option_to_yojson tax_documents_to_yojson x.tax_documents));
       (
         "ForwardingAddressId",
         (option_to_yojson address_id_to_yojson x.forwarding_address_id));
       (
         "Notification",
         (option_to_yojson notification_to_yojson x.notification));
       (
         "ShippingOption",
         (Some (shipping_option_to_yojson x.shipping_option)));
       (
         "SnowballType",
         (Some (snowball_type_to_yojson x.snowball_type)));
       (
         "RoleARN",
         (option_to_yojson role_ar_n_to_yojson x.role_ar_n));
       (
         "KmsKeyARN",
         (option_to_yojson kms_key_ar_n_to_yojson x.kms_key_ar_n));
       (
         "AddressId",
         (Some (address_id_to_yojson x.address_id)));
       (
         "Description",
         (option_to_yojson string__to_yojson x.description));
       (
         "OnDeviceServiceConfiguration",
         (option_to_yojson on_device_service_configuration_to_yojson x.on_device_service_configuration));
       (
         "Resources",
         (option_to_yojson job_resource_to_yojson x.resources));
       (
         "JobType",
         (Some (job_type_to_yojson x.job_type)));
       
  ])

let create_address_result_to_yojson = 
  fun (x: create_address_result) -> assoc_to_yojson(
    [(
         "AddressId",
         (option_to_yojson string__to_yojson x.address_id));
       
  ])

let create_address_request_to_yojson = 
  fun (x: create_address_request) -> assoc_to_yojson(
    [(
         "Address",
         (Some (address_to_yojson x.address)));
       
  ])

let cancel_job_result_to_yojson = 
  fun (x: cancel_job_result) -> assoc_to_yojson(
    [
  ])

let cancel_job_request_to_yojson = 
  fun (x: cancel_job_request) -> assoc_to_yojson(
    [(
         "JobId",
         (Some (job_id_to_yojson x.job_id)));
       
  ])

let cancel_cluster_result_to_yojson = 
  fun (x: cancel_cluster_result) -> assoc_to_yojson(
    [
  ])

let cancel_cluster_request_to_yojson = 
  fun (x: cancel_cluster_request) -> assoc_to_yojson(
    [(
         "ClusterId",
         (Some (cluster_id_to_yojson x.cluster_id)));
       
  ])

let base_string_to_yojson = string_to_yojson

let base_boolean_to_yojson = bool_to_yojson

let base_integer_to_yojson = int_to_yojson

let base_timestamp_to_yojson = timestamp_to_yojson

let base_long_to_yojson = long_to_yojson

let base_document_to_yojson = 
  json_to_yojson

