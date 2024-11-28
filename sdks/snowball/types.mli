open Smaws_Lib
val service : Service.descriptor

(** 
    Configures the wireless connection on an Snowcone device.
     *)
type wireless_connection = {
  is_wifi_enabled: bool option;
  (** 
    Enables the Wi-Fi adapter on an Snowcone device.
     *)

}

type update_long_term_pricing_result = unit

type update_long_term_pricing_request = {
  is_long_term_pricing_auto_renew: bool option;
  (** 
    If set to [true], specifies that the current long-term pricing type for the device should be automatically renewed before the long-term pricing contract expires.
     *)

  replacement_job: string option;
  (** 
    Specifies that a device that is ordered with long-term pricing should be replaced with a new device.
     *)

  long_term_pricing_id: string;
  (** 
    The ID of the long-term pricing type for the device.
     *)

}

(** 
    The specified resource can't be found. Check the information you provided in your last request, and try again.
     *)
type invalid_resource_exception = {
  resource_type: string option;
  (** 
    The provided resource value is invalid.
     *)

  message: string option;
  
}

type update_job_shipment_state_result = unit

type shipment_state = | RETURNED
  | RECEIVED

type update_job_shipment_state_request = {
  shipment_state: shipment_state;
  (** 
    The state of a device when it is being shipped.
    
     Set to [RECEIVED] when the device arrives at your location.
     
      Set to [RETURNED] when you have returned the device to Amazon Web Services.
       *)

  job_id: string;
  (** 
    The job ID of the job whose shipment date you want to update, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

(** 
    The action can't be performed because the job's current state doesn't allow that action to be performed.
     *)
type invalid_job_state_exception = {
  message: string option;
  
}

type update_job_result = unit

type job_state = | PENDING
  | LISTING
  | CANCELLED
  | COMPLETE
  | IN_PROGRESS
  | WITH_AWS
  | WITH_AWS_SORTING_FACILITY
  | IN_TRANSIT_TO_AWS
  | WITH_CUSTOMER
  | IN_TRANSIT_TO_CUSTOMER
  | PREPARING_SHIPMENT
  | PREPARING_APPLIANCE
  | NEW

(** 
    The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific job. The [Notification] object is returned as a part of the response syntax of the [DescribeJob] action in the [JobMetadata] data type.
    
     When the notification settings are defined during job creation, you can choose to notify based on a specific set of job states using the [JobStatesToNotify] array of strings, or you can specify that you want to have Amazon SNS notifications sent out for all job states with [NotifyAll] set to true.
      *)
type notification = {
  device_pickup_sns_topic_ar_n: string option;
  (** 
    Used to send SNS notifications for the person picking up the device (identified during job creation).
     *)

  notify_all: bool option;
  (** 
    Any change in job state will trigger a notification for this job.
     *)

  job_states_to_notify: job_state list option;
  (** 
    The list of job states that will trigger a notification for this job.
     *)

  sns_topic_ar_n: string option;
  (** 
    The new SNS [TopicArn] that you want to associate with this job. You can create Amazon Resource Names (ARNs) for topics by using the {{:https://docs.aws.amazon.com/sns/latest/api/API_CreateTopic.html}CreateTopic} Amazon SNS API action.
    
     You can subscribe email addresses to an Amazon SNS topic through the Amazon Web Services Management Console, or by using the {{:https://docs.aws.amazon.com/sns/latest/api/API_Subscribe.html}Subscribe} Amazon Simple Notification Service (Amazon SNS) API action.
      *)

}

(** 
    Contains a key range. For export jobs, a [S3Resource] object can have an optional [KeyRange] value. The length of the range is defined at job creation, and has either an inclusive [BeginMarker], an inclusive [EndMarker], or both. Ranges are UTF-8 binary sorted.
     *)
type key_range = {
  end_marker: string option;
  (** 
    The key that ends an optional key range for an export job. Ranges are inclusive and UTF-8 binary sorted.
     *)

  begin_marker: string option;
  (** 
    The key that starts an optional key range for an export job. Ranges are inclusive and UTF-8 binary sorted.
     *)

}

type device_service_name = | S3_ON_DEVICE_SERVICE
  | NFS_ON_DEVICE_SERVICE

type transfer_option = | LOCAL_USE
  | EXPORT
  | IMPORT

(** 
    An object that represents the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network File System).
     *)
type target_on_device_service = {
  transfer_option: transfer_option option;
  (** 
    Specifies whether the data is being imported or exported. You can import or export the data, or use it locally on the device.
     *)

  service_name: device_service_name option;
  (** 
    Specifies the name of the service on the Snow Family device that your transferred data will be exported from or imported into.
     *)

}

(** 
    Each [S3Resource] object represents an Amazon S3 bucket that your transferred data will be exported from or imported into. For export jobs, this object can have an optional [KeyRange] value. The length of the range is defined at job creation, and has either an inclusive [BeginMarker], an inclusive [EndMarker], or both. Ranges are UTF-8 binary sorted.
     *)
type s3_resource = {
  target_on_device_services: target_on_device_service list option;
  (** 
    Specifies the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network File System).
     *)

  key_range: key_range option;
  (** 
    For export jobs, you can provide an optional [KeyRange] within a specific Amazon S3 bucket. The length of the range is defined at job creation, and has either an inclusive [BeginMarker], an inclusive [EndMarker], or both. Ranges are UTF-8 binary sorted.
     *)

  bucket_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of an Amazon S3 bucket.
     *)

}

(** 
    The container for the [EventTriggerDefinition$EventResourceARN].
     *)
type event_trigger_definition = {
  event_resource_ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) for any local Amazon S3 resource that is an Lambda function's event trigger associated with this job.
     *)

}

(** 
    Identifies
     *)
type lambda_resource = {
  event_triggers: event_trigger_definition list option;
  (** 
    The array of ARNs for [S3Resource] objects to trigger the [LambdaResource] objects associated with this job.
     *)

  lambda_arn: string option;
  (** 
    An Amazon Resource Name (ARN) that represents an Lambda function to be triggered by PUT object actions on the associated local Amazon S3 resource.
     *)

}

(** 
    A JSON-formatted object that contains the IDs for an Amazon Machine Image (AMI), including the Amazon EC2-compatible AMI ID and the Snow device AMI ID. Each AMI has these two IDs to simplify identifying the AMI in both the Amazon Web Services Cloud and on the device.
     *)
type ec2_ami_resource = {
  snowball_ami_id: string option;
  (** 
    The ID of the AMI on the Snow device.
     *)

  ami_id: string;
  (** 
    The ID of the AMI in Amazon EC2.
     *)

}

(** 
    Contains an array of Amazon Web Services resource objects. Each object represents an Amazon S3 bucket, an Lambda function, or an Amazon Machine Image (AMI) based on Amazon EC2 that is associated with a particular job.
     *)
type job_resource = {
  ec2_ami_resources: ec2_ami_resource list option;
  (** 
    The Amazon Machine Images (AMIs) associated with this job.
     *)

  lambda_resources: lambda_resource list option;
  (** 
    The Python-language Lambda functions for this job.
     *)

  s3_resources: s3_resource list option;
  (** 
    An array of [S3Resource] objects.
     *)

}

type storage_unit = | TB

(** 
    An object that represents the metadata and configuration settings for the NFS (Network File System) service on an Amazon Web Services Snow Family device.
     *)
type nfs_on_device_service_configuration = {
  storage_unit: storage_unit option;
  (** 
    The scale unit of the NFS storage on the device.
    
     Valid values: TB.
      *)

  storage_limit: int option;
  (** 
    The maximum NFS storage for one Snow Family device.
     *)

}

(** 
    An object that represents the metadata and configuration settings for the Storage Gateway service Tape Gateway type on an Amazon Web Services Snow Family device.
     *)
type tgw_on_device_service_configuration = {
  storage_unit: storage_unit option;
  (** 
    The scale unit of the virtual tapes on the device.
     *)

  storage_limit: int option;
  (** 
    The maximum number of virtual tapes to store on one Snow Family device. Due to physical resource limitations, this value must be set to 80 for Snowball Edge.
     *)

}

(** 
    An object representing the metadata and configuration settings of EKS Anywhere on the Snow Family device.
     *)
type eks_on_device_service_configuration = {
  eks_anywhere_version: string option;
  (** 
    The optional version of EKS Anywhere on the Snow Family device.
     *)

  kubernetes_version: string option;
  (** 
    The Kubernetes version for EKS Anywhere on the Snow Family device.
     *)

}

(** 
    Amazon S3 compatible storage on Snow family devices configuration items.
     *)
type s3_on_device_service_configuration = {
  fault_tolerance: int option;
  (** 
    >Fault tolerance level of the cluster. This indicates the number of nodes that can go down without degrading the performance of the cluster. This additional input helps when the specified [StorageLimit] matches more than one Amazon S3 compatible storage on Snow family devices service configuration.
     *)

  service_size: int option;
  (** 
    Applicable when creating a cluster. Specifies how many nodes are needed for Amazon S3 compatible storage on Snow family devices. If specified, the other input can be omitted.
     *)

  storage_unit: storage_unit option;
  (** 
    Storage unit. Currently the only supported unit is TB.
     *)

  storage_limit: float option;
  (** 
    If the specified storage limit value matches storage limit of one of the defined configurations, that configuration will be used. If the specified storage limit value does not match any defined configuration, the request will fail. If more than one configuration has the same storage limit as specified, the other input need to be provided.
     *)

}

(** 
    An object that represents the metadata and configuration settings for services on an Amazon Web Services Snow Family device.
     *)
type on_device_service_configuration = {
  s3_on_device_service: s3_on_device_service_configuration option;
  (** 
    Configuration for Amazon S3 compatible storage on Snow family devices.
     *)

  eks_on_device_service: eks_on_device_service_configuration option;
  (** 
    The configuration of EKS Anywhere on the Snow Family device.
     *)

  tgw_on_device_service: tgw_on_device_service_configuration option;
  (** 
    Represents the Storage Gateway service Tape Gateway type on a Snow Family device.
     *)

  nfs_on_device_service: nfs_on_device_service_configuration option;
  (** 
    Represents the NFS (Network File System) service on a Snow Family device.
     *)

}

type shipping_option = | STANDARD
  | EXPRESS
  | NEXT_DAY
  | SECOND_DAY

type snowball_capacity = | T13
  | T240
  | NO_PREFERENCE
  | T32
  | T14
  | T8
  | T98
  | T42
  | T100
  | T80
  | T50

(** 
    Information identifying the person picking up the device.
     *)
type pickup_details = {
  device_pickup_id: string option;
  (** 
    The unique ID for a device that will be picked up.
     *)

  identification_issuing_org: string option;
  (** 
    Organization that issued the credential identifying the person picking up the device.
     *)

  identification_expiration_date: float option;
  (** 
    Expiration date of the credential identifying the person picking up the device.
     *)

  identification_number: string option;
  (** 
    The number on the credential identifying the person picking up the device.
     *)

  email: string option;
  (** 
    The email address of the person picking up the device.
     *)

  phone_number: string option;
  (** 
    The phone number of the person picking up the device.
     *)

  name: string option;
  (** 
    The name of the person picking up the device.
     *)

}

type update_job_request = {
  pickup_details: pickup_details option;
  
  forwarding_address_id: string option;
  (** 
    The updated ID for the forwarding address for a job. This field is not supported in most regions.
     *)

  snowball_capacity_preference: snowball_capacity option;
  [@ocaml.doc {| 
    The updated [SnowballCapacityPreference] of this job's [JobMetadata] object. The 50 TB Snowballs are only available in the US regions.
    
     For more information, see "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.
      |}]

  description: string option;
  (** 
    The updated description of this job's [JobMetadata] object.
     *)

  shipping_option: shipping_option option;
  (** 
    The updated shipping option value of this job's [ShippingDetails] object.
     *)

  address_id: string option;
  (** 
    The ID of the updated [Address] object.
     *)

  on_device_service_configuration: on_device_service_configuration option;
  (** 
    Specifies the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network File System) and the Amazon Web Services Storage Gateway service Tape Gateway type.
     *)

  resources: job_resource option;
  (** 
    The updated [JobResource] object, or the updated [JobResource] object.
     *)

  notification: notification option;
  (** 
    The new or updated [Notification] object.
     *)

  role_ar_n: string option;
  (** 
    The new role Amazon Resource Name (ARN) that you want to associate with this job. To create a role ARN, use the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole}Identity and Access Management (IAM) API action.
     *)

  job_id: string;
  (** 
    The job ID of the job that you want to update, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

(** 
    The provided Key Management Service key lacks the permissions to perform the specified [CreateJob] or [UpdateJob] action.
     *)
type kms_request_failed_exception = {
  message: string option;
  
}

(** 
    Job or cluster creation failed. One or more inputs were invalid. Confirm that the [CreateClusterRequest$SnowballType] value supports your [CreateJobRequest$JobType], and try again.
     *)
type invalid_input_combination_exception = {
  message: string option;
  
}

(** 
    Your user lacks the necessary Amazon EC2 permissions to perform the attempted action.
     *)
type ec2_request_failed_exception = {
  message: string option;
  
}

(** 
    Job creation failed. Currently, clusters support five nodes. If you have fewer than five nodes for your cluster and you have more nodes to create for this cluster, try again and create jobs until your cluster has exactly five nodes.
     *)
type cluster_limit_exceeded_exception = {
  message: string option;
  
}

type update_cluster_result = unit

type update_cluster_request = {
  forwarding_address_id: string option;
  (** 
    The updated ID for the forwarding address for a cluster. This field is not supported in most regions.
     *)

  notification: notification option;
  (** 
    The new or updated [Notification] object.
     *)

  shipping_option: shipping_option option;
  (** 
    The updated shipping option value of this cluster's [ShippingDetails] object.
     *)

  address_id: string option;
  (** 
    The ID of the updated [Address] object.
     *)

  on_device_service_configuration: on_device_service_configuration option;
  (** 
    Specifies the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family device clusters support Amazon S3 and NFS (Network File System).
     *)

  resources: job_resource option;
  (** 
    The updated arrays of [JobResource] objects that can include updated [S3Resource] objects or [LambdaResource] objects.
     *)

  description: string option;
  (** 
    The updated description of this cluster.
     *)

  role_ar_n: string option;
  (** 
    The new role Amazon Resource Name (ARN) that you want to associate with this cluster. To create a role ARN, use the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} API action in Identity and Access Management (IAM).
     *)

  cluster_id: string;
  (** 
    The cluster ID of the cluster that you want to update, for example [CID123e4567-e89b-12d3-a456-426655440000].
     *)

}

(** 
    The address is either outside the serviceable area for your region, or an error occurred. Check the address with your region's carrier and try again. If the issue persists, contact Amazon Web Services Support.
     *)
type unsupported_address_exception = {
  message: string option;
  
}

(** 
    The tax documents required in Amazon Web Services Region in India.
     *)
type ind_tax_documents = {
  gsti_n: string option;
  (** 
    The Goods and Services Tax (GST) documents required in Amazon Web Services Region in India.
     *)

}

(** 
    The tax documents required in your Amazon Web Services Region.
     *)
type tax_documents = {
  in_d: ind_tax_documents option;
  
}

(** 
    Specifies the device configuration for an Snowcone job.
     *)
type snowcone_device_configuration = {
  wireless_connection: wireless_connection option;
  (** 
    Configures the wireless connection for the Snowcone device.
     *)

}

type snowball_type = | RACK_5U_C
  | V3_5S
  | V3_5C
  | SNC1_SSD
  | SNC1_HDD
  | EDGE_S
  | EDGE_CG
  | EDGE_C
  | EDGE
  | STANDARD

type shipping_label_status = | FAILED
  | SUCCEEDED
  | TIMED_OUT
  | IN_PROGRESS

(** 
    The [Status] and [TrackingNumber] information for an inbound or outbound shipment.
     *)
type shipment = {
  tracking_number: string option;
  (** 
    The tracking number for this job. Using this tracking number with your region's carrier's website, you can track a Snow device as the carrier transports it.
    
     For India, the carrier is Amazon Logistics. For all other regions, UPS is the carrier.
      *)

  status: string option;
  (** 
    Status information for a shipment.
     *)

}

(** 
    A job's shipping information, including inbound and outbound tracking numbers and shipping speed options.
     *)
type shipping_details = {
  outbound_shipment: shipment option;
  (** 
    The [Status] and [TrackingNumber] values for a Snow device being delivered to the address that you specified for a particular job.
     *)

  inbound_shipment: shipment option;
  (** 
    The [Status] and [TrackingNumber] values for a Snow device being returned to Amazon Web Services for a particular job.
     *)

  shipping_option: shipping_option option;
  (** 
    The shipping speed for a particular job. This speed doesn't dictate how soon you'll get the Snow device from the job's creation date. This speed represents how quickly it moves to its destination while in transit. Regional shipping speeds are as follows:
    
     {ul
          {- In Australia, you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day.
             
             }
           {- In the European Union (EU), you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.
              
              }
           {- In India, Snow devices are delivered in one to seven days.
              
              }
           {- In the United States of America (US), you have access to one-day shipping and two-day shipping.
              
              }
          
      }
       *)

}

(** 
    The version of the requested service.
     *)
type service_version = {
  version: string option;
  (** 
    The version number of the requested service.
     *)

}

type service_name = | EKS_ANYWHERE
  | KUBERNETES

(** 
    You get this exception if you call [CreateReturnShippingLabel] and a valid return shipping label already exists. In this case, use [DescribeReturnShippingLabel] to get the URL.
     *)
type return_shipping_label_already_exists_exception = {
  message: string option;
  
}

type remote_management = | NOT_INSTALLED
  | INSTALLED_AUTOSTART
  | INSTALLED_ONLY

type long_term_pricing_type = | ONE_MONTH
  | THREE_YEAR
  | ONE_YEAR

(** 
    Each [LongTermPricingListEntry] object contains information about a long-term pricing type.
     *)
type long_term_pricing_list_entry = {
  job_ids: string list option;
  (** 
    The IDs of the jobs that are associated with a long-term pricing type.
     *)

  snowball_type: snowball_type option;
  (** 
    The type of Snow Family devices associated with this long-term pricing job.
     *)

  long_term_pricing_status: string option;
  (** 
    The status of the long-term pricing type.
     *)

  is_long_term_pricing_auto_renew: bool option;
  (** 
    If set to [true], specifies that the current long-term pricing type for the device should be automatically renewed before the long-term pricing contract expires.
     *)

  replacement_job: string option;
  (** 
    A new device that replaces a device that is ordered with long-term pricing.
     *)

  current_active_job: string option;
  (** 
    The current active jobs on the device the long-term pricing type.
     *)

  long_term_pricing_type: long_term_pricing_type option;
  (** 
    The type of long-term pricing that was selected for the device.
     *)

  long_term_pricing_start_date: float option;
  (** 
    The start date of the long-term pricing contract.
     *)

  long_term_pricing_end_date: float option;
  (** 
    The end date the long-term pricing contract.
     *)

  long_term_pricing_id: string option;
  (** 
    The ID of the long-term pricing type for the device.
     *)

}

(** 
    The name and version of the service dependant on the requested service.
     *)
type dependent_service = {
  service_version: service_version option;
  (** 
    The version of the dependent service.
     *)

  service_name: service_name option;
  (** 
    The name of the dependent service.
     *)

}

type list_service_versions_result = {
  next_token: string option;
  (** 
    Because HTTP requests are stateless, this is the starting point of the next list of returned [ListServiceVersionsResult] results.
     *)

  dependent_services: dependent_service list option;
  (** 
    A list of names and versions of dependant services of the service for which the system provided supported versions.
     *)

  service_name: service_name;
  (** 
    The name of the service for which the system provided supported versions.
     *)

  service_versions: service_version list;
  (** 
    A list of supported versions.
     *)

}

type list_service_versions_request = {
  next_token: string option;
  (** 
    Because HTTP requests are stateless, this is the starting point for the next list of returned [ListServiceVersionsRequest] versions.
     *)

  max_results: int option;
  (** 
    The maximum number of [ListServiceVersions] objects to return.
     *)

  dependent_services: dependent_service list option;
  (** 
    A list of names and versions of dependant services of the requested service.
     *)

  service_name: service_name;
  (** 
    The name of the service for which you're requesting supported versions.
     *)

}

(** 
    The [NextToken] string was altered unexpectedly, and the operation has stopped. Run the operation without changing the [NextToken] string, and try again.
     *)
type invalid_next_token_exception = {
  message: string option;
  
}

type address_type = | AWS_SHIP
  | CUST_PICKUP

(** 
    The address that you want the Snow device(s) associated with a specific job to be shipped to. Addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. Although no individual elements of the [Address] are required, if the address is invalid or unsupported, then an exception is thrown.
     *)
type address = {
  type_: address_type option;
  (** 
    Differentiates between delivery address and pickup address in the customer account. Provided at job creation.
     *)

  is_restricted: bool option;
  (** 
    If the address you are creating is a primary address, then set this option to true. This field is not supported in most regions.
     *)

  phone_number: string option;
  (** 
    The phone number associated with an address that a Snow device is to be delivered to.
     *)

  postal_code: string option;
  (** 
    The postal code in an address that a Snow device is to be delivered to.
     *)

  country: string option;
  (** 
    The country in an address that a Snow device is to be delivered to.
     *)

  landmark: string option;
  (** 
    This field is no longer used and the value is ignored.
     *)

  prefecture_or_district: string option;
  (** 
    This field is no longer used and the value is ignored.
     *)

  state_or_province: string option;
  (** 
    The state or province in an address that a Snow device is to be delivered to.
     *)

  city: string option;
  (** 
    The city in an address that a Snow device is to be delivered to.
     *)

  street3: string option;
  (** 
    The third line in a street address that a Snow device is to be delivered to.
     *)

  street2: string option;
  (** 
    The second line in a street address that a Snow device is to be delivered to.
     *)

  street1: string option;
  (** 
    The first line in a street address that a Snow device is to be delivered to.
     *)

  company: string option;
  (** 
    The name of the company to receive a Snow device at an address.
     *)

  name: string option;
  (** 
    The name of a person to receive a Snow device at an address.
     *)

  address_id: string option;
  (** 
    The unique ID for an address.
     *)

}

type list_pickup_locations_result = {
  next_token: string option;
  [@ocaml.doc {| 
    HTTP requests are stateless. To identify what object comes "next" in the list of [ListPickupLocationsResult] objects, you have the option of specifying [NextToken] as the starting point for your returned list.
     |}]

  addresses: address list option;
  (** 
    Information about the address of pickup locations.
     *)

}

type list_pickup_locations_request = {
  next_token: string option;
  [@ocaml.doc {| 
    HTTP requests are stateless. To identify what object comes "next" in the list of [ListPickupLocationsRequest] objects, you have the option of specifying [NextToken] as the starting point for your returned list.
     |}]

  max_results: int option;
  (** 
    The maximum number of locations to list per page.
     *)

}

type list_long_term_pricing_result = {
  next_token: string option;
  (** 
    Because HTTP requests are stateless, this is the starting point for your next list of returned [ListLongTermPricing] list.
     *)

  long_term_pricing_entries: long_term_pricing_list_entry list option;
  (** 
    Each [LongTermPricingEntry] object contains a status, ID, and other information about the [LongTermPricing] type.
     *)

}

type list_long_term_pricing_request = {
  next_token: string option;
  (** 
    Because HTTP requests are stateless, this is the starting point for your next list of [ListLongTermPricing] to return.
     *)

  max_results: int option;
  (** 
    The maximum number of [ListLongTermPricing] objects to return.
     *)

}

type job_type = | LOCAL_USE
  | EXPORT
  | IMPORT

(** 
    Each [JobListEntry] object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of an export job.
     *)
type job_list_entry = {
  description: string option;
  (** 
    The optional description of this specific job, for example [Important Photos
        2016-08-11].
     *)

  creation_date: float option;
  (** 
    The creation date for this job.
     *)

  snowball_type: snowball_type option;
  (** 
    The type of device used with this job.
     *)

  job_type: job_type option;
  (** 
    The type of job.
     *)

  is_master: bool option;
  (** 
    A value that indicates that this job is a main job. A main job represents a successful request to create an export job. Main jobs aren't associated with any Snowballs. Instead, each main job will have at least one job part, and each job part is associated with a Snowball. It might take some time before the job parts associated with a particular main job are listed, because they are created after the main job is created.
     *)

  job_state: job_state option;
  (** 
    The current state of this job.
     *)

  job_id: string option;
  (** 
    The automatically generated ID for a job, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

type list_jobs_result = {
  next_token: string option;
  (** 
    HTTP requests are stateless. If you use this automatically generated [NextToken] value in your next [ListJobs] call, your returned [JobListEntry] objects will start from this point in the array.
     *)

  job_list_entries: job_list_entry list option;
  (** 
    Each [JobListEntry] object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs.
     *)

}

type list_jobs_request = {
  next_token: string option;
  [@ocaml.doc {| 
    HTTP requests are stateless. To identify what object comes "next" in the list of [JobListEntry] objects, you have the option of specifying [NextToken] as the starting point for your returned list.
     |}]

  max_results: int option;
  (** 
    The number of [JobListEntry] objects to return.
     *)

}

(** 
    A JSON-formatted object that describes a compatible Amazon Machine Image (AMI), including the ID and name for a Snow device AMI. This AMI is compatible with the device's physical hardware requirements, and it should be able to be run in an SBE1 instance on the device.
     *)
type compatible_image = {
  name: string option;
  (** 
    The optional name of a compatible image.
     *)

  ami_id: string option;
  (** 
    The unique identifier for an individual Snow device AMI.
     *)

}

type list_compatible_images_result = {
  next_token: string option;
  (** 
    Because HTTP requests are stateless, this is the starting point for your next list of returned images.
     *)

  compatible_images: compatible_image list option;
  (** 
    A JSON-formatted object that describes a compatible AMI, including the ID and name for a Snow device AMI.
     *)

}

type list_compatible_images_request = {
  next_token: string option;
  [@ocaml.doc {| 
    HTTP requests are stateless. To identify what object comes "next" in the list of compatible images, you can specify a value for [NextToken] as the starting point for your list of returned images.
     |}]

  max_results: int option;
  (** 
    The maximum number of results for the list of compatible images. Currently, a Snowball Edge device can store 10 AMIs.
     *)

}

type cluster_state = | CANCELLED
  | COMPLETE
  | IN_USE
  | PENDING
  | AWAITING_QUORUM

(** 
    Contains a cluster's state, a cluster's ID, and other important information.
     *)
type cluster_list_entry = {
  description: string option;
  (** 
    Defines an optional description of the cluster, for example [Environmental Data
        Cluster-01].
     *)

  creation_date: float option;
  (** 
    The creation date for this cluster.
     *)

  cluster_state: cluster_state option;
  (** 
    The current state of this cluster. For information about the state of a specific node, see [JobListEntry$JobState].
     *)

  cluster_id: string option;
  (** 
    The 39-character ID for the cluster that you want to list, for example [CID123e4567-e89b-12d3-a456-426655440000].
     *)

}

type list_clusters_result = {
  next_token: string option;
  (** 
    HTTP requests are stateless. If you use the automatically generated [NextToken] value in your next [ClusterListEntry] call, your list of returned clusters will start from this point in the array.
     *)

  cluster_list_entries: cluster_list_entry list option;
  (** 
    Each [ClusterListEntry] object contains a cluster's state, a cluster's ID, and other important status information.
     *)

}

type list_clusters_request = {
  next_token: string option;
  [@ocaml.doc {| 
    HTTP requests are stateless. To identify what object comes "next" in the list of [ClusterListEntry] objects, you have the option of specifying [NextToken] as the starting point for your returned list.
     |}]

  max_results: int option;
  (** 
    The number of [ClusterListEntry] objects to return.
     *)

}

type list_cluster_jobs_result = {
  next_token: string option;
  (** 
    HTTP requests are stateless. If you use the automatically generated [NextToken] value in your next [ListClusterJobsResult] call, your list of returned jobs will start from this point in the array.
     *)

  job_list_entries: job_list_entry list option;
  (** 
    Each [JobListEntry] object contains a job's state, a job's ID, and a value that indicates whether the job is a job part, in the case of export jobs.
     *)

}

type list_cluster_jobs_request = {
  next_token: string option;
  [@ocaml.doc {| 
    HTTP requests are stateless. To identify what object comes "next" in the list of [JobListEntry] objects, you have the option of specifying [NextToken] as the starting point for your returned list.
     |}]

  max_results: int option;
  (** 
    The number of [JobListEntry] objects to return.
     *)

  cluster_id: string;
  (** 
    The 39-character ID for the cluster that you want to list, for example [CID123e4567-e89b-12d3-a456-426655440000].
     *)

}

(** 
    Defines the real-time status of a Snow device's data transfer while the device is at Amazon Web Services. This data is only available while a job has a [JobState] value of [InProgress], for both import and export jobs.
     *)
type data_transfer = {
  total_objects: int option;
  (** 
    The total number of objects for a transfer between a Snow device and Amazon S3. This value is set to 0 (zero) until all the keys that will be transferred have been listed.
     *)

  total_bytes: int option;
  (** 
    The total bytes of data for a transfer between a Snow device and Amazon S3. This value is set to 0 (zero) until all the keys that will be transferred have been listed.
     *)

  objects_transferred: int option;
  (** 
    The number of objects transferred between a Snow device and Amazon S3.
     *)

  bytes_transferred: int option;
  (** 
    The number of bytes transferred between a Snow device and Amazon S3.
     *)

}

(** 
    Contains job logs. Whenever a Snow device is used to import data into or export data out of Amazon S3, you'll have the option of downloading a PDF job report. Job logs are returned as a part of the response syntax of the [DescribeJob] action in the [JobMetadata] data type. The job logs can be accessed for up to 60 minutes after this request has been made. To access any of the job logs after 60 minutes have passed, you'll have to make another call to the [DescribeJob] action.
    
     For import jobs, the PDF job report becomes available at the end of the import process. For export jobs, your job report typically becomes available while the Snow device for your job part is being delivered to you.
     
      The job report provides you insight into the state of your Amazon S3 data transfer. The report includes details about your job or job part for your records.
      
       For deeper visibility into the status of your transferred objects, you can look at the two associated logs: a success log and a failure log. The logs are saved in comma-separated value (CSV) format, and the name of each log includes the ID of the job or job part that the log describes.
        *)
type job_logs = {
  job_failure_log_ur_i: string option;
  (** 
    A link to an Amazon S3 presigned URL where the job failure log is located.
     *)

  job_success_log_ur_i: string option;
  (** 
    A link to an Amazon S3 presigned URL where the job success log is located.
     *)

  job_completion_report_ur_i: string option;
  (** 
    A link to an Amazon S3 presigned URL where the job completion report is located.
     *)

}

(** 
    The container for [SnowconeDeviceConfiguration].
     *)
type device_configuration = {
  snowcone_device_configuration: snowcone_device_configuration option;
  (** 
    Returns information about the device configuration for an Snowcone job.
     *)

}

type impact_level = | IL99
  | IL6
  | IL5
  | IL4
  | IL2

(** 
    Contains information about a specific job including shipping information, job status, and other important metadata. This information is returned as a part of the response syntax of the [DescribeJob] action.
     *)
type job_metadata = {
  snowball_id: string option;
  (** 
    Unique ID associated with a device.
     *)

  pickup_details: pickup_details option;
  (** 
    Information identifying the person picking up the device.
     *)

  impact_level: impact_level option;
  (** 
    The highest impact level of data that will be stored or processed on the device, provided at job creation.
     *)

  on_device_service_configuration: on_device_service_configuration option;
  (** 
    Represents metadata and configuration settings for services on an Amazon Web Services Snow Family device.
     *)

  long_term_pricing_id: string option;
  (** 
    The ID of the long-term pricing type for the device.
     *)

  remote_management: remote_management option;
  (** 
    Allows you to securely operate and manage Snowcone devices remotely from outside of your internal network. When set to [INSTALLED_AUTOSTART], remote management will automatically be available when the device arrives at your location. Otherwise, you need to use the Snowball Client to manage the device.
     *)

  device_configuration: device_configuration option;
  
  tax_documents: tax_documents option;
  (** 
    The metadata associated with the tax documents required in your Amazon Web Services Region.
     *)

  forwarding_address_id: string option;
  (** 
    The ID of the address that you want a job shipped to, after it will be shipped to its primary address. This field is not supported in most regions.
     *)

  cluster_id: string option;
  (** 
    The 39-character ID for the cluster, for example [CID123e4567-e89b-12d3-a456-426655440000].
     *)

  job_log_info: job_logs option;
  (** 
    Links to Amazon S3 presigned URLs for the job report and logs. For import jobs, the PDF job report becomes available at the end of the import process. For export jobs, your job report typically becomes available while the Snow device for your job part is being delivered to you.
     *)

  data_transfer_progress: data_transfer option;
  (** 
    A value that defines the real-time status of a Snow device's data transfer while the device is at Amazon Web Services. This data is only available while a job has a [JobState] value of [InProgress], for both import and export jobs.
     *)

  notification: notification option;
  (** 
    The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific job. The [Notification] object is returned as a part of the response syntax of the [DescribeJob] action in the [JobMetadata] data type.
     *)

  snowball_capacity_preference: snowball_capacity option;
  [@ocaml.doc {| 
    The Snow device capacity preference for this job, specified at job creation. In US regions, you can choose between 50 TB and 80 TB Snowballs. All other regions use 80 TB capacity Snowballs.
    
     For more information, see "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.
      |}]

  shipping_details: shipping_details option;
  (** 
    A job's shipping information, including inbound and outbound tracking numbers and shipping speed options.
     *)

  address_id: string option;
  (** 
    The ID for the address that you want the Snow device shipped to.
     *)

  role_ar_n: string option;
  (** 
    The role ARN associated with this job. This ARN was created using the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} API action in Identity and Access Management.
     *)

  kms_key_ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) for the Key Management Service (KMS) key associated with this job. This ARN was created using the {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html}CreateKey} API action in KMS.
     *)

  description: string option;
  (** 
    The description of the job, provided at job creation.
     *)

  resources: job_resource option;
  (** 
    An array of [S3Resource] objects. Each [S3Resource] object represents an Amazon S3 bucket that your transferred data will be exported from or imported into.
     *)

  creation_date: float option;
  (** 
    The creation date for this job.
     *)

  snowball_type: snowball_type option;
  (** 
    The type of device used with this job.
     *)

  job_type: job_type option;
  (** 
    The type of job.
     *)

  job_state: job_state option;
  (** 
    The current status of the jobs.
     *)

  job_id: string option;
  (** 
    The automatically generated ID for a job, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

(** 
    The address provided was invalid. Check the address with your region's carrier, and try again.
     *)
type invalid_address_exception = {
  message: string option;
  
}

type get_software_updates_result = {
  updates_ur_i: string option;
  (** 
    The Amazon S3 presigned URL for the update file associated with the specified [JobId] value. The software update will be available for 2 days after this request is made. To access an update after the 2 days have passed, you'll have to make another call to [GetSoftwareUpdates].
     *)

}

type get_software_updates_request = {
  job_id: string;
  (** 
    The ID for a job that you want to get the software update file for, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

type get_snowball_usage_result = {
  snowballs_in_use: int option;
  (** 
    The number of Snow devices that this account is currently using.
     *)

  snowball_limit: int option;
  (** 
    The service limit for number of Snow devices this account can have at once. The default service limit is 1 (one).
     *)

}

type get_snowball_usage_request = unit

type get_job_unlock_code_result = {
  unlock_code: string option;
  (** 
    The [UnlockCode] value for the specified job. The [UnlockCode] value can be accessed for up to 360 days after the job has been created.
     *)

}

type get_job_unlock_code_request = {
  job_id: string;
  (** 
    The ID for the job that you want to get the [UnlockCode] value for, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

type get_job_manifest_result = {
  manifest_ur_i: string option;
  (** 
    The Amazon S3 presigned URL for the manifest file associated with the specified [JobId] value.
     *)

}

type get_job_manifest_request = {
  job_id: string;
  (** 
    The ID for a job that you want to get the manifest file for, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

type describe_return_shipping_label_result = {
  return_shipping_label_ur_i: string option;
  (** 
    The pre-signed Amazon S3 URI used to download the return shipping label.
     *)

  expiration_date: float option;
  (** 
    The expiration date of the current return shipping label.
     *)

  status: shipping_label_status option;
  (** 
    The status information of the task on a Snow device that is being returned to Amazon Web Services.
     *)

}

type describe_return_shipping_label_request = {
  job_id: string;
  (** 
    The automatically generated ID for a job, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

(** 
    You get this exception when you call [CreateReturnShippingLabel] more than once when other requests are not completed.
     *)
type conflict_exception = {
  message: string option;
  
  conflict_resource: string option;
  (** 
    You get this resource when you call [CreateReturnShippingLabel] more than once when other requests are not completed. .
     *)

}

type describe_job_result = {
  sub_job_metadata: job_metadata list option;
  (** 
    Information about a specific job part (in the case of an export job), including shipping information, job status, and other important metadata.
     *)

  job_metadata: job_metadata option;
  (** 
    Information about a specific job, including shipping information, job status, and other important metadata.
     *)

}

type describe_job_request = {
  job_id: string;
  (** 
    The automatically generated ID for a job, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

(** 
    Contains metadata about a specific cluster.
     *)
type cluster_metadata = {
  on_device_service_configuration: on_device_service_configuration option;
  (** 
    Represents metadata and configuration settings for services on an Amazon Web Services Snow Family device.
     *)

  tax_documents: tax_documents option;
  (** 
    The tax documents required in your Amazon Web Services Region.
     *)

  forwarding_address_id: string option;
  (** 
    The ID of the address that you want a cluster shipped to, after it will be shipped to its primary address. This field is not supported in most regions.
     *)

  notification: notification option;
  (** 
    The Amazon Simple Notification Service (Amazon SNS) notification settings for this cluster.
     *)

  shipping_option: shipping_option option;
  (** 
    The shipping speed for each node in this cluster. This speed doesn't dictate how soon you'll get each device, rather it represents how quickly each device moves to its destination while in transit. Regional shipping speeds are as follows:
    
     {ul
          {- In Australia, you have access to express shipping. Typically, devices shipped express are delivered in about a day.
             
             }
           {- In the European Union (EU), you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.
              
              }
           {- In India, Snow devices are delivered in one to seven days.
              
              }
           {- In the US, you have access to one-day shipping and two-day shipping.
              
              }
          
      }
       *)

  address_id: string option;
  (** 
    The automatically generated ID for a specific address.
     *)

  resources: job_resource option;
  (** 
    The arrays of [JobResource] objects that can include updated [S3Resource] objects or [LambdaResource] objects.
     *)

  creation_date: float option;
  (** 
    The creation date for this cluster.
     *)

  snowball_type: snowball_type option;
  (** 
    The type of Snowcone device to use for this cluster.
    
     For cluster jobs, Amazon Web Services Snow Family currently supports only the [EDGE] device type.
     
      *)

  job_type: job_type option;
  (** 
    The type of job for this cluster. Currently, the only job type supported for clusters is [LOCAL_USE].
     *)

  cluster_state: cluster_state option;
  (** 
    The current status of the cluster.
     *)

  role_ar_n: string option;
  (** 
    The role ARN associated with this cluster. This ARN was created using the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} API action in Identity and Access Management (IAM).
     *)

  kms_key_ar_n: string option;
  (** 
    The [KmsKeyARN] Amazon Resource Name (ARN) associated with this cluster. This ARN was created using the {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html}CreateKey} API action in Key Management Service (KMS.
     *)

  description: string option;
  (** 
    The optional description of the cluster.
     *)

  cluster_id: string option;
  (** 
    The automatically generated ID for a cluster.
     *)

}

type describe_cluster_result = {
  cluster_metadata: cluster_metadata option;
  (** 
    Information about a specific cluster, including shipping information, cluster status, and other important metadata.
     *)

}

type describe_cluster_request = {
  cluster_id: string;
  (** 
    The automatically generated ID for a cluster.
     *)

}

type describe_addresses_result = {
  next_token: string option;
  (** 
    HTTP requests are stateless. If you use the automatically generated [NextToken] value in your next [DescribeAddresses] call, your list of returned addresses will start from this point in the array.
     *)

  addresses: address list option;
  (** 
    The Snow device shipping addresses that were created for this account.
     *)

}

type describe_addresses_request = {
  next_token: string option;
  [@ocaml.doc {| 
    HTTP requests are stateless. To identify what object comes "next" in the list of [ADDRESS] objects, you have the option of specifying a value for [NextToken] as the starting point for your list of returned addresses.
     |}]

  max_results: int option;
  (** 
    The number of [ADDRESS] objects to return.
     *)

}

type describe_address_result = {
  address: address option;
  (** 
    The address that you want the Snow device(s) associated with a specific job to be shipped to.
     *)

}

type describe_address_request = {
  address_id: string;
  (** 
    The automatically generated ID for a specific address.
     *)

}

type create_return_shipping_label_result = {
  status: shipping_label_status option;
  (** 
    The status information of the task on a Snow device that is being returned to Amazon Web Services.
     *)

}

type create_return_shipping_label_request = {
  shipping_option: shipping_option option;
  (** 
    The shipping speed for a particular job. This speed doesn't dictate how soon the device is returned to Amazon Web Services. This speed represents how quickly it moves to its destination while in transit. Regional shipping speeds are as follows:
     *)

  job_id: string;
  (** 
    The ID for a job that you want to create the return shipping label for; for example, [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

type create_long_term_pricing_result = {
  long_term_pricing_id: string option;
  (** 
    The ID of the long-term pricing type for the device.
     *)

}

type create_long_term_pricing_request = {
  snowball_type: snowball_type;
  (** 
    The type of Snow Family devices to use for the long-term pricing job.
     *)

  is_long_term_pricing_auto_renew: bool option;
  (** 
    Specifies whether the current long-term pricing type for the device should be renewed.
     *)

  long_term_pricing_type: long_term_pricing_type;
  (** 
    The type of long-term pricing option you want for the device, either 1-year or 3-year long-term pricing.
     *)

}

type create_job_result = {
  job_id: string option;
  (** 
    The automatically generated ID for a job, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

type create_job_request = {
  pickup_details: pickup_details option;
  (** 
    Information identifying the person picking up the device.
     *)

  impact_level: impact_level option;
  (** 
    The highest impact level of data that will be stored or processed on the device, provided at job creation.
     *)

  long_term_pricing_id: string option;
  (** 
    The ID of the long-term pricing type for the device.
     *)

  remote_management: remote_management option;
  (** 
    Allows you to securely operate and manage Snowcone devices remotely from outside of your internal network. When set to [INSTALLED_AUTOSTART], remote management will automatically be available when the device arrives at your location. Otherwise, you need to use the Snowball Edge client to manage the device. When set to [NOT_INSTALLED], remote management will not be available on the device.
     *)

  device_configuration: device_configuration option;
  [@ocaml.doc {| 
    Defines the device configuration for an Snowcone job.
    
     For more information, see "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.
      |}]

  tax_documents: tax_documents option;
  (** 
    The tax documents required in your Amazon Web Services Region.
     *)

  forwarding_address_id: string option;
  (** 
    The forwarding address ID for a job. This field is not supported in most Regions.
     *)

  snowball_type: snowball_type option;
  [@ocaml.doc {| 
    The type of Snow Family devices to use for this job.
    
     For cluster jobs, Amazon Web Services Snow Family currently supports only the [EDGE] device type.
     
      The type of Amazon Web Services Snow device to use for this job. Currently, the only supported device type for cluster jobs is [EDGE].
      
       For more information, see {{:https://docs.aws.amazon.com/snowball/latest/developer-guide/device-differences.html}Snowball Edge Device Options} in the Snowball Edge Developer Guide.
       
        For more information, see "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.
         |}]

  cluster_id: string option;
  (** 
    The ID of a cluster. If you're creating a job for a node in a cluster, you need to provide only this [clusterId] value. The other job attributes are inherited from the cluster.
     *)

  notification: notification option;
  (** 
    Defines the Amazon Simple Notification Service (Amazon SNS) notification settings for this job.
     *)

  shipping_option: shipping_option option;
  (** 
    The shipping speed for this job. This speed doesn't dictate how soon you'll get the Snow device, rather it represents how quickly the Snow device moves to its destination while in transit. Regional shipping speeds are as follows:
    
     {ul
          {- In Australia, you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day.
             
             }
           {- In the European Union (EU), you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.
              
              }
           {- In India, Snow devices are delivered in one to seven days.
              
              }
           {- In the US, you have access to one-day shipping and two-day shipping.
              
              }
          
      }
       *)

  snowball_capacity_preference: snowball_capacity option;
  [@ocaml.doc {| 
    If your job is being created in one of the US regions, you have the option of specifying what size Snow device you'd like for this job. In all other regions, Snowballs come with 80 TB in storage capacity.
    
     For more information, see "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.
      |}]

  role_ar_n: string option;
  (** 
    The [RoleARN] that you want to associate with this job. [RoleArn]s are created using the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} Identity and Access Management (IAM) API action.
     *)

  kms_key_ar_n: string option;
  (** 
    The [KmsKeyARN] that you want to associate with this job. [KmsKeyARN]s are created using the {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html}CreateKey} Key Management Service (KMS) API action.
     *)

  address_id: string option;
  (** 
    The ID for the address that you want the Snow device shipped to.
     *)

  description: string option;
  (** 
    Defines an optional description of this specific job, for example [Important
        Photos 2016-08-11].
     *)

  on_device_service_configuration: on_device_service_configuration option;
  (** 
    Specifies the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network File System) and the Amazon Web Services Storage Gateway service Tape Gateway type.
     *)

  resources: job_resource option;
  (** 
    Defines the Amazon S3 buckets associated with this job.
    
     With [IMPORT] jobs, you specify the bucket or buckets that your transferred data will be imported into.
     
      With [EXPORT] jobs, you specify the bucket or buckets that your transferred data will be exported from. Optionally, you can also specify a [KeyRange] value. If you choose to export a range, you define the length of the range by providing either an inclusive [BeginMarker] value, an inclusive [EndMarker] value, or both. Ranges are UTF-8 binary sorted.
       *)

  job_type: job_type option;
  (** 
    Defines the type of job that you're creating.
     *)

}

type create_cluster_result = {
  job_list_entries: job_list_entry list option;
  (** 
    List of jobs created for this cluster. For syntax, see {{:http://amazonaws.com/snowball/latest/api-reference/API_ListJobs.html#API_ListJobs_ResponseSyntax}ListJobsResult$JobListEntries} in this guide.
     *)

  cluster_id: string option;
  (** 
    The automatically generated ID for a cluster.
     *)

}

type create_cluster_request = {
  snowball_capacity_preference: snowball_capacity option;
  [@ocaml.doc {| 
    If your job is being created in one of the US regions, you have the option of specifying what size Snow device you'd like for this job. In all other regions, Snowballs come with 80 TB in storage capacity.
    
     For more information, see "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.
      |}]

  long_term_pricing_ids: string list option;
  (** 
    Lists long-term pricing id that will be used to associate with jobs automatically created for the new cluster.
     *)

  force_create_jobs: bool option;
  (** 
    Force to create cluster when user attempts to overprovision or underprovision a cluster. A cluster is overprovisioned or underprovisioned if the initial size of the cluster is more (overprovisioned) or less (underprovisioned) than what needed to meet capacity requirement specified with [OnDeviceServiceConfiguration].
     *)

  initial_cluster_size: int option;
  (** 
    If provided, each job will be automatically created and associated with the new cluster. If not provided, will be treated as 0.
     *)

  remote_management: remote_management option;
  (** 
    Allows you to securely operate and manage Snow devices in a cluster remotely from outside of your internal network. When set to [INSTALLED_AUTOSTART], remote management will automatically be available when the device arrives at your location. Otherwise, you need to use the Snowball Client to manage the device.
     *)

  tax_documents: tax_documents option;
  (** 
    The tax documents required in your Amazon Web Services Region.
     *)

  forwarding_address_id: string option;
  (** 
    The forwarding address ID for a cluster. This field is not supported in most regions.
     *)

  notification: notification option;
  (** 
    The Amazon Simple Notification Service (Amazon SNS) notification settings for this cluster.
     *)

  shipping_option: shipping_option;
  (** 
    The shipping speed for each node in this cluster. This speed doesn't dictate how soon you'll get each Snowball Edge device, rather it represents how quickly each device moves to its destination while in transit. Regional shipping speeds are as follows:
    
     {ul
          {- In Australia, you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day.
             
             }
           {- In the European Union (EU), you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.
              
              }
           {- In India, Snow devices are delivered in one to seven days.
              
              }
           {- In the United States of America (US), you have access to one-day shipping and two-day shipping.
              
              }
          
      }
       {ul
            {- In Australia, you have access to express shipping. Typically, devices shipped express are delivered in about a day.
               
               }
             {- In the European Union (EU), you have access to express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in the EU have access to standard shipping, which typically takes less than a week, one way.
                
                }
             {- In India, Snow devices are delivered in one to seven days.
                
                }
             {- In the US, you have access to one-day shipping and two-day shipping.
                
                }
            
      }
       *)

  snowball_type: snowball_type;
  [@ocaml.doc {| 
    The type of Snow Family devices to use for this cluster.
    
     For cluster jobs, Amazon Web Services Snow Family currently supports only the [EDGE] device type.
     
      For more information, see "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.
       |}]

  role_ar_n: string option;
  (** 
    The [RoleARN] that you want to associate with this cluster. [RoleArn] values are created by using the {{:https://docs.aws.amazon.com/IAM/latest/APIReference/API_CreateRole.html}CreateRole} API action in Identity and Access Management (IAM).
     *)

  kms_key_ar_n: string option;
  (** 
    The [KmsKeyARN] value that you want to associate with this cluster. [KmsKeyARN] values are created by using the {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateKey.html}CreateKey} API action in Key Management Service (KMS).
     *)

  address_id: string;
  (** 
    The ID for the address that you want the cluster shipped to.
     *)

  description: string option;
  (** 
    An optional description of this specific cluster, for example [Environmental Data
        Cluster-01].
     *)

  on_device_service_configuration: on_device_service_configuration option;
  (** 
    Specifies the service or services on the Snow Family device that your transferred data will be exported from or imported into. Amazon Web Services Snow Family device clusters support Amazon S3 and NFS (Network File System).
     *)

  resources: job_resource option;
  (** 
    The resources associated with the cluster job. These resources include Amazon S3 buckets and optional Lambda functions written in the Python language.
     *)

  job_type: job_type;
  [@ocaml.doc {| 
    The type of job for this cluster. Currently, the only job type supported for clusters is [LOCAL_USE].
    
     For more information, see "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide} or "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family Devices and Capacity) in the {i Snowcone User Guide}.
      |}]

}

type create_address_result = {
  address_id: string option;
  (** 
    The automatically generated ID for a specific address. You'll use this ID when you create a job to specify which address you want the Snow device for that job shipped to.
     *)

}

type create_address_request = {
  address: address;
  (** 
    The address that you want the Snow device shipped to.
     *)

}

type cancel_job_result = unit

type cancel_job_request = {
  job_id: string;
  (** 
    The 39-character job ID for the job that you want to cancel, for example [JID123e4567-e89b-12d3-a456-426655440000].
     *)

}

type cancel_cluster_result = unit

type cancel_cluster_request = {
  cluster_id: string;
  (** 
    The 39-character ID for the cluster that you want to cancel, for example [CID123e4567-e89b-12d3-a456-426655440000].
     *)

}

(** 
    The Amazon Web Services Snow Family provides a petabyte-scale data transport solution that uses secure devices to transfer large amounts of data between your on-premises data centers and Amazon Simple Storage Service (Amazon S3). The Snow Family commands described here provide access to the same functionality that is available in the Amazon Web Services Snow Family Management Console, which enables you to create and manage jobs for a Snow Family device. To transfer data locally with a Snow Family device, you'll need to use the Snowball Edge client or the Amazon S3 API Interface for Snowball or OpsHub for Snow Family. For more information, see the {{:https://docs.aws.amazon.com/AWSImportExport/latest/ug/api-reference.html}User Guide}.
     *)


type base_document = Json.t

