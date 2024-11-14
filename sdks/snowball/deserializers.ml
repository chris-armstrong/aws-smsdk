open Smaws_Lib.Json.DeserializeHelpers

open Types

let boolean__of_yojson = bool_of_yojson

let wireless_connection_of_yojson = 
  fun tree path : wireless_connection ->
  let _list = assoc_of_yojson tree path in
  let _res : wireless_connection = {
    is_wifi_enabled = option_of_yojson (value_for_key (boolean__of_yojson) "IsWifiEnabled") _list path;
    
  }
  in _res

let update_long_term_pricing_result_of_yojson = 
  fun tree path : update_long_term_pricing_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_long_term_pricing_result = ()
  in _res

let long_term_pricing_id_of_yojson = string_of_yojson

let job_id_of_yojson = string_of_yojson

let java_boolean_of_yojson = bool_of_yojson

let update_long_term_pricing_request_of_yojson = 
  fun tree path : update_long_term_pricing_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_long_term_pricing_request = {
    is_long_term_pricing_auto_renew = option_of_yojson (value_for_key (java_boolean_of_yojson) "IsLongTermPricingAutoRenew") _list path;
    replacement_job = option_of_yojson (value_for_key (job_id_of_yojson) "ReplacementJob") _list path;
    long_term_pricing_id = value_for_key (long_term_pricing_id_of_yojson) "LongTermPricingId" _list path;
    
  }
  in _res

let string__of_yojson = string_of_yojson

let invalid_resource_exception_of_yojson = 
  fun tree path : invalid_resource_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_resource_exception = {
    resource_type = option_of_yojson (value_for_key (string__of_yojson) "ResourceType") _list path;
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let update_job_shipment_state_result_of_yojson = 
  fun tree path : update_job_shipment_state_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_job_shipment_state_result = ()
  in _res

let base_unit_of_yojson = unit_of_yojson

let shipment_state_of_yojson = 
  fun (tree: t) path : shipment_state -> match tree with 
    | `String "RETURNED" -> RETURNED
    | `String "RECEIVED" -> RECEIVED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShipmentState" value)
    | _ -> raise (deserialize_wrong_type_error path "ShipmentState")

let update_job_shipment_state_request_of_yojson = 
  fun tree path : update_job_shipment_state_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_job_shipment_state_request = {
    shipment_state = value_for_key (shipment_state_of_yojson) "ShipmentState" _list path;
    job_id = value_for_key (job_id_of_yojson) "JobId" _list path;
    
  }
  in _res

let invalid_job_state_exception_of_yojson = 
  fun tree path : invalid_job_state_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_job_state_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let update_job_result_of_yojson = 
  fun tree path : update_job_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_job_result = ()
  in _res

let role_ar_n_of_yojson = string_of_yojson

let sns_topic_ar_n_of_yojson = string_of_yojson

let job_state_of_yojson = 
  fun (tree: t) path : job_state -> match tree with 
    | `String "Pending" -> PENDING
    | `String "Listing" -> LISTING
    | `String "Cancelled" -> CANCELLED
    | `String "Complete" -> COMPLETE
    | `String "InProgress" -> IN_PROGRESS
    | `String "WithAWS" -> WITH_AWS
    | `String "WithAWSSortingFacility" -> WITH_AWS_SORTING_FACILITY
    | `String "InTransitToAWS" -> IN_TRANSIT_TO_AWS
    | `String "WithCustomer" -> WITH_CUSTOMER
    | `String "InTransitToCustomer" -> IN_TRANSIT_TO_CUSTOMER
    | `String "PreparingShipment" -> PREPARING_SHIPMENT
    | `String "PreparingAppliance" -> PREPARING_APPLIANCE
    | `String "New" -> NEW
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobState" value)
    | _ -> raise (deserialize_wrong_type_error path "JobState")

let job_state_list_of_yojson = 
  fun tree path -> list_of_yojson job_state_of_yojson tree path 

let notification_of_yojson = 
  fun tree path : notification ->
  let _list = assoc_of_yojson tree path in
  let _res : notification = {
    device_pickup_sns_topic_ar_n = option_of_yojson (value_for_key (sns_topic_ar_n_of_yojson) "DevicePickupSnsTopicARN") _list path;
    notify_all = option_of_yojson (value_for_key (boolean__of_yojson) "NotifyAll") _list path;
    job_states_to_notify = option_of_yojson (value_for_key (job_state_list_of_yojson) "JobStatesToNotify") _list path;
    sns_topic_ar_n = option_of_yojson (value_for_key (sns_topic_ar_n_of_yojson) "SnsTopicARN") _list path;
    
  }
  in _res

let resource_ar_n_of_yojson = string_of_yojson

let key_range_of_yojson = 
  fun tree path : key_range ->
  let _list = assoc_of_yojson tree path in
  let _res : key_range = {
    end_marker = option_of_yojson (value_for_key (string__of_yojson) "EndMarker") _list path;
    begin_marker = option_of_yojson (value_for_key (string__of_yojson) "BeginMarker") _list path;
    
  }
  in _res

let device_service_name_of_yojson = 
  fun (tree: t) path : device_service_name -> match tree with 
    | `String "S3_ON_DEVICE_SERVICE" -> S3_ON_DEVICE_SERVICE
    | `String "NFS_ON_DEVICE_SERVICE" -> NFS_ON_DEVICE_SERVICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DeviceServiceName" value)
    | _ -> raise (deserialize_wrong_type_error path "DeviceServiceName")

let transfer_option_of_yojson = 
  fun (tree: t) path : transfer_option -> match tree with 
    | `String "LOCAL_USE" -> LOCAL_USE
    | `String "EXPORT" -> EXPORT
    | `String "IMPORT" -> IMPORT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TransferOption" value)
    | _ -> raise (deserialize_wrong_type_error path "TransferOption")

let target_on_device_service_of_yojson = 
  fun tree path : target_on_device_service ->
  let _list = assoc_of_yojson tree path in
  let _res : target_on_device_service = {
    transfer_option = option_of_yojson (value_for_key (transfer_option_of_yojson) "TransferOption") _list path;
    service_name = option_of_yojson (value_for_key (device_service_name_of_yojson) "ServiceName") _list path;
    
  }
  in _res

let target_on_device_service_list_of_yojson = 
  fun tree path -> list_of_yojson target_on_device_service_of_yojson tree path 

let s3_resource_of_yojson = 
  fun tree path : s3_resource ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_resource = {
    target_on_device_services = option_of_yojson (value_for_key (target_on_device_service_list_of_yojson) "TargetOnDeviceServices") _list path;
    key_range = option_of_yojson (value_for_key (key_range_of_yojson) "KeyRange") _list path;
    bucket_arn = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "BucketArn") _list path;
    
  }
  in _res

let s3_resource_list_of_yojson = 
  fun tree path -> list_of_yojson s3_resource_of_yojson tree path 

let event_trigger_definition_of_yojson = 
  fun tree path : event_trigger_definition ->
  let _list = assoc_of_yojson tree path in
  let _res : event_trigger_definition = {
    event_resource_ar_n = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "EventResourceARN") _list path;
    
  }
  in _res

let event_trigger_definition_list_of_yojson = 
  fun tree path -> list_of_yojson event_trigger_definition_of_yojson tree path 

let lambda_resource_of_yojson = 
  fun tree path : lambda_resource ->
  let _list = assoc_of_yojson tree path in
  let _res : lambda_resource = {
    event_triggers = option_of_yojson (value_for_key (event_trigger_definition_list_of_yojson) "EventTriggers") _list path;
    lambda_arn = option_of_yojson (value_for_key (resource_ar_n_of_yojson) "LambdaArn") _list path;
    
  }
  in _res

let lambda_resource_list_of_yojson = 
  fun tree path -> list_of_yojson lambda_resource_of_yojson tree path 

let ami_id_of_yojson = string_of_yojson

let ec2_ami_resource_of_yojson = 
  fun tree path : ec2_ami_resource ->
  let _list = assoc_of_yojson tree path in
  let _res : ec2_ami_resource = {
    snowball_ami_id = option_of_yojson (value_for_key (string__of_yojson) "SnowballAmiId") _list path;
    ami_id = value_for_key (ami_id_of_yojson) "AmiId" _list path;
    
  }
  in _res

let ec2_ami_resource_list_of_yojson = 
  fun tree path -> list_of_yojson ec2_ami_resource_of_yojson tree path 

let job_resource_of_yojson = 
  fun tree path : job_resource ->
  let _list = assoc_of_yojson tree path in
  let _res : job_resource = {
    ec2_ami_resources = option_of_yojson (value_for_key (ec2_ami_resource_list_of_yojson) "Ec2AmiResources") _list path;
    lambda_resources = option_of_yojson (value_for_key (lambda_resource_list_of_yojson) "LambdaResources") _list path;
    s3_resources = option_of_yojson (value_for_key (s3_resource_list_of_yojson) "S3Resources") _list path;
    
  }
  in _res

let storage_limit_of_yojson = int_of_yojson

let storage_unit_of_yojson = 
  fun (tree: t) path : storage_unit -> match tree with 
    | `String "TB" -> TB
    | `String value -> raise (deserialize_unknown_enum_value_error path "StorageUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageUnit")

let nfs_on_device_service_configuration_of_yojson = 
  fun tree path : nfs_on_device_service_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : nfs_on_device_service_configuration = {
    storage_unit = option_of_yojson (value_for_key (storage_unit_of_yojson) "StorageUnit") _list path;
    storage_limit = option_of_yojson (value_for_key (storage_limit_of_yojson) "StorageLimit") _list path;
    
  }
  in _res

let tgw_on_device_service_configuration_of_yojson = 
  fun tree path : tgw_on_device_service_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : tgw_on_device_service_configuration = {
    storage_unit = option_of_yojson (value_for_key (storage_unit_of_yojson) "StorageUnit") _list path;
    storage_limit = option_of_yojson (value_for_key (storage_limit_of_yojson) "StorageLimit") _list path;
    
  }
  in _res

let eks_on_device_service_configuration_of_yojson = 
  fun tree path : eks_on_device_service_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : eks_on_device_service_configuration = {
    eks_anywhere_version = option_of_yojson (value_for_key (string__of_yojson) "EKSAnywhereVersion") _list path;
    kubernetes_version = option_of_yojson (value_for_key (string__of_yojson) "KubernetesVersion") _list path;
    
  }
  in _res

let s3_storage_limit_of_yojson = double_of_yojson

let service_size_of_yojson = int_of_yojson

let node_fault_tolerance_of_yojson = int_of_yojson

let s3_on_device_service_configuration_of_yojson = 
  fun tree path : s3_on_device_service_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : s3_on_device_service_configuration = {
    fault_tolerance = option_of_yojson (value_for_key (node_fault_tolerance_of_yojson) "FaultTolerance") _list path;
    service_size = option_of_yojson (value_for_key (service_size_of_yojson) "ServiceSize") _list path;
    storage_unit = option_of_yojson (value_for_key (storage_unit_of_yojson) "StorageUnit") _list path;
    storage_limit = option_of_yojson (value_for_key (s3_storage_limit_of_yojson) "StorageLimit") _list path;
    
  }
  in _res

let on_device_service_configuration_of_yojson = 
  fun tree path : on_device_service_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : on_device_service_configuration = {
    s3_on_device_service = option_of_yojson (value_for_key (s3_on_device_service_configuration_of_yojson) "S3OnDeviceService") _list path;
    eks_on_device_service = option_of_yojson (value_for_key (eks_on_device_service_configuration_of_yojson) "EKSOnDeviceService") _list path;
    tgw_on_device_service = option_of_yojson (value_for_key (tgw_on_device_service_configuration_of_yojson) "TGWOnDeviceService") _list path;
    nfs_on_device_service = option_of_yojson (value_for_key (nfs_on_device_service_configuration_of_yojson) "NFSOnDeviceService") _list path;
    
  }
  in _res

let address_id_of_yojson = string_of_yojson

let shipping_option_of_yojson = 
  fun (tree: t) path : shipping_option -> match tree with 
    | `String "STANDARD" -> STANDARD
    | `String "EXPRESS" -> EXPRESS
    | `String "NEXT_DAY" -> NEXT_DAY
    | `String "SECOND_DAY" -> SECOND_DAY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShippingOption" value)
    | _ -> raise (deserialize_wrong_type_error path "ShippingOption")

let snowball_capacity_of_yojson = 
  fun (tree: t) path : snowball_capacity -> match tree with 
    | `String "T13" -> T13
    | `String "T240" -> T240
    | `String "NoPreference" -> NO_PREFERENCE
    | `String "T32" -> T32
    | `String "T14" -> T14
    | `String "T8" -> T8
    | `String "T98" -> T98
    | `String "T42" -> T42
    | `String "T100" -> T100
    | `String "T80" -> T80
    | `String "T50" -> T50
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnowballCapacity" value)
    | _ -> raise (deserialize_wrong_type_error path "SnowballCapacity")

let phone_number_of_yojson = string_of_yojson

let email_of_yojson = string_of_yojson

let timestamp__of_yojson = timestamp_of_yojson

let device_pickup_id_of_yojson = string_of_yojson

let pickup_details_of_yojson = 
  fun tree path : pickup_details ->
  let _list = assoc_of_yojson tree path in
  let _res : pickup_details = {
    device_pickup_id = option_of_yojson (value_for_key (device_pickup_id_of_yojson) "DevicePickupId") _list path;
    identification_issuing_org = option_of_yojson (value_for_key (string__of_yojson) "IdentificationIssuingOrg") _list path;
    identification_expiration_date = option_of_yojson (value_for_key (timestamp__of_yojson) "IdentificationExpirationDate") _list path;
    identification_number = option_of_yojson (value_for_key (string__of_yojson) "IdentificationNumber") _list path;
    email = option_of_yojson (value_for_key (email_of_yojson) "Email") _list path;
    phone_number = option_of_yojson (value_for_key (phone_number_of_yojson) "PhoneNumber") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    
  }
  in _res

let update_job_request_of_yojson = 
  fun tree path : update_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_job_request = {
    pickup_details = option_of_yojson (value_for_key (pickup_details_of_yojson) "PickupDetails") _list path;
    forwarding_address_id = option_of_yojson (value_for_key (address_id_of_yojson) "ForwardingAddressId") _list path;
    snowball_capacity_preference = option_of_yojson (value_for_key (snowball_capacity_of_yojson) "SnowballCapacityPreference") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    shipping_option = option_of_yojson (value_for_key (shipping_option_of_yojson) "ShippingOption") _list path;
    address_id = option_of_yojson (value_for_key (address_id_of_yojson) "AddressId") _list path;
    on_device_service_configuration = option_of_yojson (value_for_key (on_device_service_configuration_of_yojson) "OnDeviceServiceConfiguration") _list path;
    resources = option_of_yojson (value_for_key (job_resource_of_yojson) "Resources") _list path;
    notification = option_of_yojson (value_for_key (notification_of_yojson) "Notification") _list path;
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    job_id = value_for_key (job_id_of_yojson) "JobId" _list path;
    
  }
  in _res

let kms_request_failed_exception_of_yojson = 
  fun tree path : kms_request_failed_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : kms_request_failed_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let invalid_input_combination_exception_of_yojson = 
  fun tree path : invalid_input_combination_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_input_combination_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let ec2_request_failed_exception_of_yojson = 
  fun tree path : ec2_request_failed_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : ec2_request_failed_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let cluster_limit_exceeded_exception_of_yojson = 
  fun tree path : cluster_limit_exceeded_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : cluster_limit_exceeded_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let update_cluster_result_of_yojson = 
  fun tree path : update_cluster_result ->
  let _list = assoc_of_yojson tree path in
  let _res : update_cluster_result = ()
  in _res

let cluster_id_of_yojson = string_of_yojson

let update_cluster_request_of_yojson = 
  fun tree path : update_cluster_request ->
  let _list = assoc_of_yojson tree path in
  let _res : update_cluster_request = {
    forwarding_address_id = option_of_yojson (value_for_key (address_id_of_yojson) "ForwardingAddressId") _list path;
    notification = option_of_yojson (value_for_key (notification_of_yojson) "Notification") _list path;
    shipping_option = option_of_yojson (value_for_key (shipping_option_of_yojson) "ShippingOption") _list path;
    address_id = option_of_yojson (value_for_key (address_id_of_yojson) "AddressId") _list path;
    on_device_service_configuration = option_of_yojson (value_for_key (on_device_service_configuration_of_yojson) "OnDeviceServiceConfiguration") _list path;
    resources = option_of_yojson (value_for_key (job_resource_of_yojson) "Resources") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    cluster_id = value_for_key (cluster_id_of_yojson) "ClusterId" _list path;
    
  }
  in _res

let unsupported_address_exception_of_yojson = 
  fun tree path : unsupported_address_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : unsupported_address_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let gsti_n_of_yojson = string_of_yojson

let ind_tax_documents_of_yojson = 
  fun tree path : ind_tax_documents ->
  let _list = assoc_of_yojson tree path in
  let _res : ind_tax_documents = {
    gsti_n = option_of_yojson (value_for_key (gsti_n_of_yojson) "GSTIN") _list path;
    
  }
  in _res

let tax_documents_of_yojson = 
  fun tree path : tax_documents ->
  let _list = assoc_of_yojson tree path in
  let _res : tax_documents = {
    in_d = option_of_yojson (value_for_key (ind_tax_documents_of_yojson) "IND") _list path;
    
  }
  in _res

let snowcone_device_configuration_of_yojson = 
  fun tree path : snowcone_device_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : snowcone_device_configuration = {
    wireless_connection = option_of_yojson (value_for_key (wireless_connection_of_yojson) "WirelessConnection") _list path;
    
  }
  in _res

let snowball_type_of_yojson = 
  fun (tree: t) path : snowball_type -> match tree with 
    | `String "RACK_5U_C" -> RACK_5U_C
    | `String "V3_5S" -> V3_5S
    | `String "V3_5C" -> V3_5C
    | `String "SNC1_SSD" -> SNC1_SSD
    | `String "SNC1_HDD" -> SNC1_HDD
    | `String "EDGE_S" -> EDGE_S
    | `String "EDGE_CG" -> EDGE_CG
    | `String "EDGE_C" -> EDGE_C
    | `String "EDGE" -> EDGE
    | `String "STANDARD" -> STANDARD
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnowballType" value)
    | _ -> raise (deserialize_wrong_type_error path "SnowballType")

let shipping_label_status_of_yojson = 
  fun (tree: t) path : shipping_label_status -> match tree with 
    | `String "Failed" -> FAILED
    | `String "Succeeded" -> SUCCEEDED
    | `String "TimedOut" -> TIMED_OUT
    | `String "InProgress" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShippingLabelStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ShippingLabelStatus")

let shipment_of_yojson = 
  fun tree path : shipment ->
  let _list = assoc_of_yojson tree path in
  let _res : shipment = {
    tracking_number = option_of_yojson (value_for_key (string__of_yojson) "TrackingNumber") _list path;
    status = option_of_yojson (value_for_key (string__of_yojson) "Status") _list path;
    
  }
  in _res

let shipping_details_of_yojson = 
  fun tree path : shipping_details ->
  let _list = assoc_of_yojson tree path in
  let _res : shipping_details = {
    outbound_shipment = option_of_yojson (value_for_key (shipment_of_yojson) "OutboundShipment") _list path;
    inbound_shipment = option_of_yojson (value_for_key (shipment_of_yojson) "InboundShipment") _list path;
    shipping_option = option_of_yojson (value_for_key (shipping_option_of_yojson) "ShippingOption") _list path;
    
  }
  in _res

let service_version_of_yojson = 
  fun tree path : service_version ->
  let _list = assoc_of_yojson tree path in
  let _res : service_version = {
    version = option_of_yojson (value_for_key (string__of_yojson) "Version") _list path;
    
  }
  in _res

let service_version_list_of_yojson = 
  fun tree path -> list_of_yojson service_version_of_yojson tree path 

let service_name_of_yojson = 
  fun (tree: t) path : service_name -> match tree with 
    | `String "EKS_ANYWHERE" -> EKS_ANYWHERE
    | `String "KUBERNETES" -> KUBERNETES
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceName" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceName")

let return_shipping_label_already_exists_exception_of_yojson = 
  fun tree path : return_shipping_label_already_exists_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : return_shipping_label_already_exists_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let remote_management_of_yojson = 
  fun (tree: t) path : remote_management -> match tree with 
    | `String "NOT_INSTALLED" -> NOT_INSTALLED
    | `String "INSTALLED_AUTOSTART" -> INSTALLED_AUTOSTART
    | `String "INSTALLED_ONLY" -> INSTALLED_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "RemoteManagement" value)
    | _ -> raise (deserialize_wrong_type_error path "RemoteManagement")

let long_term_pricing_type_of_yojson = 
  fun (tree: t) path : long_term_pricing_type -> match tree with 
    | `String "OneMonth" -> ONE_MONTH
    | `String "ThreeYear" -> THREE_YEAR
    | `String "OneYear" -> ONE_YEAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "LongTermPricingType" value)
    | _ -> raise (deserialize_wrong_type_error path "LongTermPricingType")

let long_term_pricing_associated_job_id_list_of_yojson = 
  fun tree path -> list_of_yojson job_id_of_yojson tree path 

let long_term_pricing_list_entry_of_yojson = 
  fun tree path : long_term_pricing_list_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : long_term_pricing_list_entry = {
    job_ids = option_of_yojson (value_for_key (long_term_pricing_associated_job_id_list_of_yojson) "JobIds") _list path;
    snowball_type = option_of_yojson (value_for_key (snowball_type_of_yojson) "SnowballType") _list path;
    long_term_pricing_status = option_of_yojson (value_for_key (string__of_yojson) "LongTermPricingStatus") _list path;
    is_long_term_pricing_auto_renew = option_of_yojson (value_for_key (java_boolean_of_yojson) "IsLongTermPricingAutoRenew") _list path;
    replacement_job = option_of_yojson (value_for_key (job_id_of_yojson) "ReplacementJob") _list path;
    current_active_job = option_of_yojson (value_for_key (job_id_of_yojson) "CurrentActiveJob") _list path;
    long_term_pricing_type = option_of_yojson (value_for_key (long_term_pricing_type_of_yojson) "LongTermPricingType") _list path;
    long_term_pricing_start_date = option_of_yojson (value_for_key (timestamp__of_yojson) "LongTermPricingStartDate") _list path;
    long_term_pricing_end_date = option_of_yojson (value_for_key (timestamp__of_yojson) "LongTermPricingEndDate") _list path;
    long_term_pricing_id = option_of_yojson (value_for_key (long_term_pricing_id_of_yojson) "LongTermPricingId") _list path;
    
  }
  in _res

let long_term_pricing_id_list_of_yojson = 
  fun tree path -> list_of_yojson long_term_pricing_id_of_yojson tree path 

let long_term_pricing_entry_list_of_yojson = 
  fun tree path -> list_of_yojson long_term_pricing_list_entry_of_yojson tree path 

let long_of_yojson = long_of_yojson

let dependent_service_of_yojson = 
  fun tree path : dependent_service ->
  let _list = assoc_of_yojson tree path in
  let _res : dependent_service = {
    service_version = option_of_yojson (value_for_key (service_version_of_yojson) "ServiceVersion") _list path;
    service_name = option_of_yojson (value_for_key (service_name_of_yojson) "ServiceName") _list path;
    
  }
  in _res

let dependent_service_list_of_yojson = 
  fun tree path -> list_of_yojson dependent_service_of_yojson tree path 

let list_service_versions_result_of_yojson = 
  fun tree path : list_service_versions_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_versions_result = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    dependent_services = option_of_yojson (value_for_key (dependent_service_list_of_yojson) "DependentServices") _list path;
    service_name = value_for_key (service_name_of_yojson) "ServiceName" _list path;
    service_versions = value_for_key (service_version_list_of_yojson) "ServiceVersions" _list path;
    
  }
  in _res

let list_limit_of_yojson = int_of_yojson

let list_service_versions_request_of_yojson = 
  fun tree path : list_service_versions_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_service_versions_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_limit_of_yojson) "MaxResults") _list path;
    dependent_services = option_of_yojson (value_for_key (dependent_service_list_of_yojson) "DependentServices") _list path;
    service_name = value_for_key (service_name_of_yojson) "ServiceName" _list path;
    
  }
  in _res

let invalid_next_token_exception_of_yojson = 
  fun tree path : invalid_next_token_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_next_token_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let address_type_of_yojson = 
  fun (tree: t) path : address_type -> match tree with 
    | `String "AWS_SHIP" -> AWS_SHIP
    | `String "CUST_PICKUP" -> CUST_PICKUP
    | `String value -> raise (deserialize_unknown_enum_value_error path "AddressType" value)
    | _ -> raise (deserialize_wrong_type_error path "AddressType")

let address_of_yojson = 
  fun tree path : address ->
  let _list = assoc_of_yojson tree path in
  let _res : address = {
    type_ = option_of_yojson (value_for_key (address_type_of_yojson) "Type") _list path;
    is_restricted = option_of_yojson (value_for_key (boolean__of_yojson) "IsRestricted") _list path;
    phone_number = option_of_yojson (value_for_key (string__of_yojson) "PhoneNumber") _list path;
    postal_code = option_of_yojson (value_for_key (string__of_yojson) "PostalCode") _list path;
    country = option_of_yojson (value_for_key (string__of_yojson) "Country") _list path;
    landmark = option_of_yojson (value_for_key (string__of_yojson) "Landmark") _list path;
    prefecture_or_district = option_of_yojson (value_for_key (string__of_yojson) "PrefectureOrDistrict") _list path;
    state_or_province = option_of_yojson (value_for_key (string__of_yojson) "StateOrProvince") _list path;
    city = option_of_yojson (value_for_key (string__of_yojson) "City") _list path;
    street3 = option_of_yojson (value_for_key (string__of_yojson) "Street3") _list path;
    street2 = option_of_yojson (value_for_key (string__of_yojson) "Street2") _list path;
    street1 = option_of_yojson (value_for_key (string__of_yojson) "Street1") _list path;
    company = option_of_yojson (value_for_key (string__of_yojson) "Company") _list path;
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    address_id = option_of_yojson (value_for_key (address_id_of_yojson) "AddressId") _list path;
    
  }
  in _res

let address_list_of_yojson = 
  fun tree path -> list_of_yojson address_of_yojson tree path 

let list_pickup_locations_result_of_yojson = 
  fun tree path : list_pickup_locations_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_pickup_locations_result = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    addresses = option_of_yojson (value_for_key (address_list_of_yojson) "Addresses") _list path;
    
  }
  in _res

let list_pickup_locations_request_of_yojson = 
  fun tree path : list_pickup_locations_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_pickup_locations_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_limit_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let list_long_term_pricing_result_of_yojson = 
  fun tree path : list_long_term_pricing_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_long_term_pricing_result = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    long_term_pricing_entries = option_of_yojson (value_for_key (long_term_pricing_entry_list_of_yojson) "LongTermPricingEntries") _list path;
    
  }
  in _res

let list_long_term_pricing_request_of_yojson = 
  fun tree path : list_long_term_pricing_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_long_term_pricing_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_limit_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let job_type_of_yojson = 
  fun (tree: t) path : job_type -> match tree with 
    | `String "LOCAL_USE" -> LOCAL_USE
    | `String "EXPORT" -> EXPORT
    | `String "IMPORT" -> IMPORT
    | `String value -> raise (deserialize_unknown_enum_value_error path "JobType" value)
    | _ -> raise (deserialize_wrong_type_error path "JobType")

let job_list_entry_of_yojson = 
  fun tree path : job_list_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : job_list_entry = {
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    creation_date = option_of_yojson (value_for_key (timestamp__of_yojson) "CreationDate") _list path;
    snowball_type = option_of_yojson (value_for_key (snowball_type_of_yojson) "SnowballType") _list path;
    job_type = option_of_yojson (value_for_key (job_type_of_yojson) "JobType") _list path;
    is_master = option_of_yojson (value_for_key (boolean__of_yojson) "IsMaster") _list path;
    job_state = option_of_yojson (value_for_key (job_state_of_yojson) "JobState") _list path;
    job_id = option_of_yojson (value_for_key (string__of_yojson) "JobId") _list path;
    
  }
  in _res

let job_list_entry_list_of_yojson = 
  fun tree path -> list_of_yojson job_list_entry_of_yojson tree path 

let list_jobs_result_of_yojson = 
  fun tree path : list_jobs_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_jobs_result = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    job_list_entries = option_of_yojson (value_for_key (job_list_entry_list_of_yojson) "JobListEntries") _list path;
    
  }
  in _res

let list_jobs_request_of_yojson = 
  fun tree path : list_jobs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_jobs_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_limit_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let compatible_image_of_yojson = 
  fun tree path : compatible_image ->
  let _list = assoc_of_yojson tree path in
  let _res : compatible_image = {
    name = option_of_yojson (value_for_key (string__of_yojson) "Name") _list path;
    ami_id = option_of_yojson (value_for_key (string__of_yojson) "AmiId") _list path;
    
  }
  in _res

let compatible_image_list_of_yojson = 
  fun tree path -> list_of_yojson compatible_image_of_yojson tree path 

let list_compatible_images_result_of_yojson = 
  fun tree path : list_compatible_images_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_compatible_images_result = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    compatible_images = option_of_yojson (value_for_key (compatible_image_list_of_yojson) "CompatibleImages") _list path;
    
  }
  in _res

let list_compatible_images_request_of_yojson = 
  fun tree path : list_compatible_images_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_compatible_images_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_limit_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let cluster_state_of_yojson = 
  fun (tree: t) path : cluster_state -> match tree with 
    | `String "Cancelled" -> CANCELLED
    | `String "Complete" -> COMPLETE
    | `String "InUse" -> IN_USE
    | `String "Pending" -> PENDING
    | `String "AwaitingQuorum" -> AWAITING_QUORUM
    | `String value -> raise (deserialize_unknown_enum_value_error path "ClusterState" value)
    | _ -> raise (deserialize_wrong_type_error path "ClusterState")

let cluster_list_entry_of_yojson = 
  fun tree path : cluster_list_entry ->
  let _list = assoc_of_yojson tree path in
  let _res : cluster_list_entry = {
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    creation_date = option_of_yojson (value_for_key (timestamp__of_yojson) "CreationDate") _list path;
    cluster_state = option_of_yojson (value_for_key (cluster_state_of_yojson) "ClusterState") _list path;
    cluster_id = option_of_yojson (value_for_key (string__of_yojson) "ClusterId") _list path;
    
  }
  in _res

let cluster_list_entry_list_of_yojson = 
  fun tree path -> list_of_yojson cluster_list_entry_of_yojson tree path 

let list_clusters_result_of_yojson = 
  fun tree path : list_clusters_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_clusters_result = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    cluster_list_entries = option_of_yojson (value_for_key (cluster_list_entry_list_of_yojson) "ClusterListEntries") _list path;
    
  }
  in _res

let list_clusters_request_of_yojson = 
  fun tree path : list_clusters_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_clusters_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_limit_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let list_cluster_jobs_result_of_yojson = 
  fun tree path : list_cluster_jobs_result ->
  let _list = assoc_of_yojson tree path in
  let _res : list_cluster_jobs_result = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    job_list_entries = option_of_yojson (value_for_key (job_list_entry_list_of_yojson) "JobListEntries") _list path;
    
  }
  in _res

let list_cluster_jobs_request_of_yojson = 
  fun tree path : list_cluster_jobs_request ->
  let _list = assoc_of_yojson tree path in
  let _res : list_cluster_jobs_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_limit_of_yojson) "MaxResults") _list path;
    cluster_id = value_for_key (cluster_id_of_yojson) "ClusterId" _list path;
    
  }
  in _res

let kms_key_ar_n_of_yojson = string_of_yojson

let data_transfer_of_yojson = 
  fun tree path : data_transfer ->
  let _list = assoc_of_yojson tree path in
  let _res : data_transfer = {
    total_objects = option_of_yojson (value_for_key (long_of_yojson) "TotalObjects") _list path;
    total_bytes = option_of_yojson (value_for_key (long_of_yojson) "TotalBytes") _list path;
    objects_transferred = option_of_yojson (value_for_key (long_of_yojson) "ObjectsTransferred") _list path;
    bytes_transferred = option_of_yojson (value_for_key (long_of_yojson) "BytesTransferred") _list path;
    
  }
  in _res

let job_logs_of_yojson = 
  fun tree path : job_logs ->
  let _list = assoc_of_yojson tree path in
  let _res : job_logs = {
    job_failure_log_ur_i = option_of_yojson (value_for_key (string__of_yojson) "JobFailureLogURI") _list path;
    job_success_log_ur_i = option_of_yojson (value_for_key (string__of_yojson) "JobSuccessLogURI") _list path;
    job_completion_report_ur_i = option_of_yojson (value_for_key (string__of_yojson) "JobCompletionReportURI") _list path;
    
  }
  in _res

let device_configuration_of_yojson = 
  fun tree path : device_configuration ->
  let _list = assoc_of_yojson tree path in
  let _res : device_configuration = {
    snowcone_device_configuration = option_of_yojson (value_for_key (snowcone_device_configuration_of_yojson) "SnowconeDeviceConfiguration") _list path;
    
  }
  in _res

let impact_level_of_yojson = 
  fun (tree: t) path : impact_level -> match tree with 
    | `String "IL99" -> IL99
    | `String "IL6" -> IL6
    | `String "IL5" -> IL5
    | `String "IL4" -> IL4
    | `String "IL2" -> IL2
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImpactLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "ImpactLevel")

let job_metadata_of_yojson = 
  fun tree path : job_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : job_metadata = {
    snowball_id = option_of_yojson (value_for_key (string__of_yojson) "SnowballId") _list path;
    pickup_details = option_of_yojson (value_for_key (pickup_details_of_yojson) "PickupDetails") _list path;
    impact_level = option_of_yojson (value_for_key (impact_level_of_yojson) "ImpactLevel") _list path;
    on_device_service_configuration = option_of_yojson (value_for_key (on_device_service_configuration_of_yojson) "OnDeviceServiceConfiguration") _list path;
    long_term_pricing_id = option_of_yojson (value_for_key (long_term_pricing_id_of_yojson) "LongTermPricingId") _list path;
    remote_management = option_of_yojson (value_for_key (remote_management_of_yojson) "RemoteManagement") _list path;
    device_configuration = option_of_yojson (value_for_key (device_configuration_of_yojson) "DeviceConfiguration") _list path;
    tax_documents = option_of_yojson (value_for_key (tax_documents_of_yojson) "TaxDocuments") _list path;
    forwarding_address_id = option_of_yojson (value_for_key (address_id_of_yojson) "ForwardingAddressId") _list path;
    cluster_id = option_of_yojson (value_for_key (string__of_yojson) "ClusterId") _list path;
    job_log_info = option_of_yojson (value_for_key (job_logs_of_yojson) "JobLogInfo") _list path;
    data_transfer_progress = option_of_yojson (value_for_key (data_transfer_of_yojson) "DataTransferProgress") _list path;
    notification = option_of_yojson (value_for_key (notification_of_yojson) "Notification") _list path;
    snowball_capacity_preference = option_of_yojson (value_for_key (snowball_capacity_of_yojson) "SnowballCapacityPreference") _list path;
    shipping_details = option_of_yojson (value_for_key (shipping_details_of_yojson) "ShippingDetails") _list path;
    address_id = option_of_yojson (value_for_key (address_id_of_yojson) "AddressId") _list path;
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    kms_key_ar_n = option_of_yojson (value_for_key (kms_key_ar_n_of_yojson) "KmsKeyARN") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    resources = option_of_yojson (value_for_key (job_resource_of_yojson) "Resources") _list path;
    creation_date = option_of_yojson (value_for_key (timestamp__of_yojson) "CreationDate") _list path;
    snowball_type = option_of_yojson (value_for_key (snowball_type_of_yojson) "SnowballType") _list path;
    job_type = option_of_yojson (value_for_key (job_type_of_yojson) "JobType") _list path;
    job_state = option_of_yojson (value_for_key (job_state_of_yojson) "JobState") _list path;
    job_id = option_of_yojson (value_for_key (string__of_yojson) "JobId") _list path;
    
  }
  in _res

let job_metadata_list_of_yojson = 
  fun tree path -> list_of_yojson job_metadata_of_yojson tree path 

let invalid_address_exception_of_yojson = 
  fun tree path : invalid_address_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : invalid_address_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    
  }
  in _res

let integer__of_yojson = int_of_yojson

let initial_cluster_size_of_yojson = int_of_yojson

let get_software_updates_result_of_yojson = 
  fun tree path : get_software_updates_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_software_updates_result = {
    updates_ur_i = option_of_yojson (value_for_key (string__of_yojson) "UpdatesURI") _list path;
    
  }
  in _res

let get_software_updates_request_of_yojson = 
  fun tree path : get_software_updates_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_software_updates_request = {
    job_id = value_for_key (job_id_of_yojson) "JobId" _list path;
    
  }
  in _res

let get_snowball_usage_result_of_yojson = 
  fun tree path : get_snowball_usage_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_snowball_usage_result = {
    snowballs_in_use = option_of_yojson (value_for_key (integer__of_yojson) "SnowballsInUse") _list path;
    snowball_limit = option_of_yojson (value_for_key (integer__of_yojson) "SnowballLimit") _list path;
    
  }
  in _res

let get_snowball_usage_request_of_yojson = 
  fun tree path : get_snowball_usage_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_snowball_usage_request = ()
  in _res

let get_job_unlock_code_result_of_yojson = 
  fun tree path : get_job_unlock_code_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_job_unlock_code_result = {
    unlock_code = option_of_yojson (value_for_key (string__of_yojson) "UnlockCode") _list path;
    
  }
  in _res

let get_job_unlock_code_request_of_yojson = 
  fun tree path : get_job_unlock_code_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_job_unlock_code_request = {
    job_id = value_for_key (job_id_of_yojson) "JobId" _list path;
    
  }
  in _res

let get_job_manifest_result_of_yojson = 
  fun tree path : get_job_manifest_result ->
  let _list = assoc_of_yojson tree path in
  let _res : get_job_manifest_result = {
    manifest_ur_i = option_of_yojson (value_for_key (string__of_yojson) "ManifestURI") _list path;
    
  }
  in _res

let get_job_manifest_request_of_yojson = 
  fun tree path : get_job_manifest_request ->
  let _list = assoc_of_yojson tree path in
  let _res : get_job_manifest_request = {
    job_id = value_for_key (job_id_of_yojson) "JobId" _list path;
    
  }
  in _res

let describe_return_shipping_label_result_of_yojson = 
  fun tree path : describe_return_shipping_label_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_return_shipping_label_result = {
    return_shipping_label_ur_i = option_of_yojson (value_for_key (string__of_yojson) "ReturnShippingLabelURI") _list path;
    expiration_date = option_of_yojson (value_for_key (timestamp__of_yojson) "ExpirationDate") _list path;
    status = option_of_yojson (value_for_key (shipping_label_status_of_yojson) "Status") _list path;
    
  }
  in _res

let describe_return_shipping_label_request_of_yojson = 
  fun tree path : describe_return_shipping_label_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_return_shipping_label_request = {
    job_id = value_for_key (job_id_of_yojson) "JobId" _list path;
    
  }
  in _res

let conflict_exception_of_yojson = 
  fun tree path : conflict_exception ->
  let _list = assoc_of_yojson tree path in
  let _res : conflict_exception = {
    message = option_of_yojson (value_for_key (string__of_yojson) "Message") _list path;
    conflict_resource = option_of_yojson (value_for_key (string__of_yojson) "ConflictResource") _list path;
    
  }
  in _res

let describe_job_result_of_yojson = 
  fun tree path : describe_job_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_job_result = {
    sub_job_metadata = option_of_yojson (value_for_key (job_metadata_list_of_yojson) "SubJobMetadata") _list path;
    job_metadata = option_of_yojson (value_for_key (job_metadata_of_yojson) "JobMetadata") _list path;
    
  }
  in _res

let describe_job_request_of_yojson = 
  fun tree path : describe_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_job_request = {
    job_id = value_for_key (job_id_of_yojson) "JobId" _list path;
    
  }
  in _res

let cluster_metadata_of_yojson = 
  fun tree path : cluster_metadata ->
  let _list = assoc_of_yojson tree path in
  let _res : cluster_metadata = {
    on_device_service_configuration = option_of_yojson (value_for_key (on_device_service_configuration_of_yojson) "OnDeviceServiceConfiguration") _list path;
    tax_documents = option_of_yojson (value_for_key (tax_documents_of_yojson) "TaxDocuments") _list path;
    forwarding_address_id = option_of_yojson (value_for_key (address_id_of_yojson) "ForwardingAddressId") _list path;
    notification = option_of_yojson (value_for_key (notification_of_yojson) "Notification") _list path;
    shipping_option = option_of_yojson (value_for_key (shipping_option_of_yojson) "ShippingOption") _list path;
    address_id = option_of_yojson (value_for_key (address_id_of_yojson) "AddressId") _list path;
    resources = option_of_yojson (value_for_key (job_resource_of_yojson) "Resources") _list path;
    creation_date = option_of_yojson (value_for_key (timestamp__of_yojson) "CreationDate") _list path;
    snowball_type = option_of_yojson (value_for_key (snowball_type_of_yojson) "SnowballType") _list path;
    job_type = option_of_yojson (value_for_key (job_type_of_yojson) "JobType") _list path;
    cluster_state = option_of_yojson (value_for_key (cluster_state_of_yojson) "ClusterState") _list path;
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    kms_key_ar_n = option_of_yojson (value_for_key (kms_key_ar_n_of_yojson) "KmsKeyARN") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    cluster_id = option_of_yojson (value_for_key (string__of_yojson) "ClusterId") _list path;
    
  }
  in _res

let describe_cluster_result_of_yojson = 
  fun tree path : describe_cluster_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_cluster_result = {
    cluster_metadata = option_of_yojson (value_for_key (cluster_metadata_of_yojson) "ClusterMetadata") _list path;
    
  }
  in _res

let describe_cluster_request_of_yojson = 
  fun tree path : describe_cluster_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_cluster_request = {
    cluster_id = value_for_key (cluster_id_of_yojson) "ClusterId" _list path;
    
  }
  in _res

let describe_addresses_result_of_yojson = 
  fun tree path : describe_addresses_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_addresses_result = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    addresses = option_of_yojson (value_for_key (address_list_of_yojson) "Addresses") _list path;
    
  }
  in _res

let describe_addresses_request_of_yojson = 
  fun tree path : describe_addresses_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_addresses_request = {
    next_token = option_of_yojson (value_for_key (string__of_yojson) "NextToken") _list path;
    max_results = option_of_yojson (value_for_key (list_limit_of_yojson) "MaxResults") _list path;
    
  }
  in _res

let describe_address_result_of_yojson = 
  fun tree path : describe_address_result ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_address_result = {
    address = option_of_yojson (value_for_key (address_of_yojson) "Address") _list path;
    
  }
  in _res

let describe_address_request_of_yojson = 
  fun tree path : describe_address_request ->
  let _list = assoc_of_yojson tree path in
  let _res : describe_address_request = {
    address_id = value_for_key (address_id_of_yojson) "AddressId" _list path;
    
  }
  in _res

let create_return_shipping_label_result_of_yojson = 
  fun tree path : create_return_shipping_label_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_return_shipping_label_result = {
    status = option_of_yojson (value_for_key (shipping_label_status_of_yojson) "Status") _list path;
    
  }
  in _res

let create_return_shipping_label_request_of_yojson = 
  fun tree path : create_return_shipping_label_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_return_shipping_label_request = {
    shipping_option = option_of_yojson (value_for_key (shipping_option_of_yojson) "ShippingOption") _list path;
    job_id = value_for_key (job_id_of_yojson) "JobId" _list path;
    
  }
  in _res

let create_long_term_pricing_result_of_yojson = 
  fun tree path : create_long_term_pricing_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_long_term_pricing_result = {
    long_term_pricing_id = option_of_yojson (value_for_key (long_term_pricing_id_of_yojson) "LongTermPricingId") _list path;
    
  }
  in _res

let create_long_term_pricing_request_of_yojson = 
  fun tree path : create_long_term_pricing_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_long_term_pricing_request = {
    snowball_type = value_for_key (snowball_type_of_yojson) "SnowballType" _list path;
    is_long_term_pricing_auto_renew = option_of_yojson (value_for_key (java_boolean_of_yojson) "IsLongTermPricingAutoRenew") _list path;
    long_term_pricing_type = value_for_key (long_term_pricing_type_of_yojson) "LongTermPricingType" _list path;
    
  }
  in _res

let create_job_result_of_yojson = 
  fun tree path : create_job_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_job_result = {
    job_id = option_of_yojson (value_for_key (job_id_of_yojson) "JobId") _list path;
    
  }
  in _res

let create_job_request_of_yojson = 
  fun tree path : create_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_job_request = {
    pickup_details = option_of_yojson (value_for_key (pickup_details_of_yojson) "PickupDetails") _list path;
    impact_level = option_of_yojson (value_for_key (impact_level_of_yojson) "ImpactLevel") _list path;
    long_term_pricing_id = option_of_yojson (value_for_key (long_term_pricing_id_of_yojson) "LongTermPricingId") _list path;
    remote_management = option_of_yojson (value_for_key (remote_management_of_yojson) "RemoteManagement") _list path;
    device_configuration = option_of_yojson (value_for_key (device_configuration_of_yojson) "DeviceConfiguration") _list path;
    tax_documents = option_of_yojson (value_for_key (tax_documents_of_yojson) "TaxDocuments") _list path;
    forwarding_address_id = option_of_yojson (value_for_key (address_id_of_yojson) "ForwardingAddressId") _list path;
    snowball_type = option_of_yojson (value_for_key (snowball_type_of_yojson) "SnowballType") _list path;
    cluster_id = option_of_yojson (value_for_key (cluster_id_of_yojson) "ClusterId") _list path;
    notification = option_of_yojson (value_for_key (notification_of_yojson) "Notification") _list path;
    shipping_option = option_of_yojson (value_for_key (shipping_option_of_yojson) "ShippingOption") _list path;
    snowball_capacity_preference = option_of_yojson (value_for_key (snowball_capacity_of_yojson) "SnowballCapacityPreference") _list path;
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    kms_key_ar_n = option_of_yojson (value_for_key (kms_key_ar_n_of_yojson) "KmsKeyARN") _list path;
    address_id = option_of_yojson (value_for_key (address_id_of_yojson) "AddressId") _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    on_device_service_configuration = option_of_yojson (value_for_key (on_device_service_configuration_of_yojson) "OnDeviceServiceConfiguration") _list path;
    resources = option_of_yojson (value_for_key (job_resource_of_yojson) "Resources") _list path;
    job_type = option_of_yojson (value_for_key (job_type_of_yojson) "JobType") _list path;
    
  }
  in _res

let create_cluster_result_of_yojson = 
  fun tree path : create_cluster_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_cluster_result = {
    job_list_entries = option_of_yojson (value_for_key (job_list_entry_list_of_yojson) "JobListEntries") _list path;
    cluster_id = option_of_yojson (value_for_key (cluster_id_of_yojson) "ClusterId") _list path;
    
  }
  in _res

let create_cluster_request_of_yojson = 
  fun tree path : create_cluster_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_cluster_request = {
    snowball_capacity_preference = option_of_yojson (value_for_key (snowball_capacity_of_yojson) "SnowballCapacityPreference") _list path;
    long_term_pricing_ids = option_of_yojson (value_for_key (long_term_pricing_id_list_of_yojson) "LongTermPricingIds") _list path;
    force_create_jobs = option_of_yojson (value_for_key (boolean__of_yojson) "ForceCreateJobs") _list path;
    initial_cluster_size = option_of_yojson (value_for_key (initial_cluster_size_of_yojson) "InitialClusterSize") _list path;
    remote_management = option_of_yojson (value_for_key (remote_management_of_yojson) "RemoteManagement") _list path;
    tax_documents = option_of_yojson (value_for_key (tax_documents_of_yojson) "TaxDocuments") _list path;
    forwarding_address_id = option_of_yojson (value_for_key (address_id_of_yojson) "ForwardingAddressId") _list path;
    notification = option_of_yojson (value_for_key (notification_of_yojson) "Notification") _list path;
    shipping_option = value_for_key (shipping_option_of_yojson) "ShippingOption" _list path;
    snowball_type = value_for_key (snowball_type_of_yojson) "SnowballType" _list path;
    role_ar_n = option_of_yojson (value_for_key (role_ar_n_of_yojson) "RoleARN") _list path;
    kms_key_ar_n = option_of_yojson (value_for_key (kms_key_ar_n_of_yojson) "KmsKeyARN") _list path;
    address_id = value_for_key (address_id_of_yojson) "AddressId" _list path;
    description = option_of_yojson (value_for_key (string__of_yojson) "Description") _list path;
    on_device_service_configuration = option_of_yojson (value_for_key (on_device_service_configuration_of_yojson) "OnDeviceServiceConfiguration") _list path;
    resources = option_of_yojson (value_for_key (job_resource_of_yojson) "Resources") _list path;
    job_type = value_for_key (job_type_of_yojson) "JobType" _list path;
    
  }
  in _res

let create_address_result_of_yojson = 
  fun tree path : create_address_result ->
  let _list = assoc_of_yojson tree path in
  let _res : create_address_result = {
    address_id = option_of_yojson (value_for_key (string__of_yojson) "AddressId") _list path;
    
  }
  in _res

let create_address_request_of_yojson = 
  fun tree path : create_address_request ->
  let _list = assoc_of_yojson tree path in
  let _res : create_address_request = {
    address = value_for_key (address_of_yojson) "Address" _list path;
    
  }
  in _res

let cancel_job_result_of_yojson = 
  fun tree path : cancel_job_result ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_job_result = ()
  in _res

let cancel_job_request_of_yojson = 
  fun tree path : cancel_job_request ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_job_request = {
    job_id = value_for_key (job_id_of_yojson) "JobId" _list path;
    
  }
  in _res

let cancel_cluster_result_of_yojson = 
  fun tree path : cancel_cluster_result ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_cluster_result = ()
  in _res

let cancel_cluster_request_of_yojson = 
  fun tree path : cancel_cluster_request ->
  let _list = assoc_of_yojson tree path in
  let _res : cancel_cluster_request = {
    cluster_id = value_for_key (cluster_id_of_yojson) "ClusterId" _list path;
    
  }
  in _res

let base_string_of_yojson = string_of_yojson

let base_boolean_of_yojson = bool_of_yojson

let base_integer_of_yojson = int_of_yojson

let base_timestamp_of_yojson = timestamp_of_yojson

let base_long_of_yojson = long_of_yojson

let base_document_of_yojson = 
  json_of_yojson

