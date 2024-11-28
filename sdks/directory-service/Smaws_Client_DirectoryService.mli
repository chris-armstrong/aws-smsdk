(** 
    Directory Service client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(** 
    Result of a VerifyTrust request.
     *)
type verify_trust_result = {
  trust_id: string option;
  (** 
    The unique Trust ID of the trust relationship that was verified.
     *)

}

(** 
    Initiates the verification of an existing trust relationship between an Managed Microsoft AD directory and an external domain.
     *)
type verify_trust_request = {
  trust_id: string;
  (** 
    The unique Trust ID of the trust relationship to verify.
     *)

}

(** 
    The operation is not supported.
     *)
type unsupported_operation_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    An exception has occurred in Directory Service.
     *)
type service_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    One or more parameters are not valid.
     *)
type invalid_parameter_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The specified entity could not be found.
     *)
type entity_does_not_exist_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    A client exception has occurred.
     *)
type client_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The user provided a username that does not exist in your directory.
     *)
type user_does_not_exist_exception = {
  request_id: string option;
  
  message: string option;
  
}

type os_version = | VERSION_2019
  | VERSION_2012

(** 
    OS version that the directory needs to be updated to.
     *)
type os_update_settings = {
  os_version: os_version option;
  (** 
    OS version that the directory needs to be updated to.
     *)

}

(** 
    The value for a given type of [UpdateSettings].
     *)
type update_value = {
  os_update_settings: os_update_settings option;
  (** 
    The OS update related settings.
     *)

}

type update_type = | OS

type update_trust_result = {
  trust_id: string option;
  (** 
    Identifier of the trust relationship.
     *)

  request_id: string option;
  
}

type selective_auth = | DISABLED
  | ENABLED

type update_trust_request = {
  selective_auth: selective_auth option;
  (** 
    Updates selective authentication for the trust.
     *)

  trust_id: string;
  (** 
    Identifier of the trust relationship.
     *)

}

type update_status = | UPDATE_FAILED
  | UPDATING
  | UPDATED

type update_settings_result = {
  directory_id: string option;
  (** 
    The identifier of the directory.
     *)

}

(** 
    Contains information about the configurable settings for a directory.
     *)
type setting = {
  value: string;
  (** 
    The value of the directory setting for which to retrieve information. For example, for [TLS_1_0], the valid values are: [Enable] and [Disable].
     *)

  name: string;
  (** 
    The name of the directory setting. For example:
    
     [TLS_1_0]
      *)

}

type update_settings_request = {
  settings: setting list;
  (** 
    The list of [Setting] objects.
     *)

  directory_id: string;
  (** 
    The identifier of the directory for which to update settings.
     *)

}

(** 
    The specified directory setting is not supported.
     *)
type unsupported_settings_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The specified directory setting is not compatible with other settings.
     *)
type incompatible_settings_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The specified directory is unavailable or could not be found.
     *)
type directory_unavailable_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The specified directory does not exist in the system.
     *)
type directory_does_not_exist_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    Contains the results of the [UpdateRadius] operation.
     *)
type update_radius_result = unit

type radius_authentication_protocol = | MSCHAPV2
  | MSCHAPV1
  | CHAP
  | PAP

(** 
    Contains information about a Remote Authentication Dial In User Service (RADIUS) server.
     *)
type radius_settings = {
  use_same_username: bool option;
  (** 
    Not currently used.
     *)

  display_label: string option;
  (** 
    Not currently used.
     *)

  authentication_protocol: radius_authentication_protocol option;
  (** 
    The protocol specified for your RADIUS endpoints.
     *)

  shared_secret: string option;
  (** 
    Required for enabling RADIUS on the directory.
     *)

  radius_retries: int option;
  (** 
    The maximum number of times that communication with the RADIUS server is attempted.
     *)

  radius_timeout: int option;
  (** 
    The amount of time, in seconds, to wait for the RADIUS server to respond.
     *)

  radius_port: int option;
  (** 
    The port that your RADIUS server is using for communications. Your self-managed network must allow inbound traffic over this port from the Directory Service servers.
     *)

  radius_servers: string list option;
  (** 
    An array of strings that contains the fully qualified domain name (FQDN) or IP addresses of the RADIUS server endpoints, or the FQDN or IP addresses of your RADIUS server load balancer.
     *)

}

(** 
    Contains the inputs for the [UpdateRadius] operation.
     *)
type update_radius_request = {
  radius_settings: radius_settings;
  (** 
    A [RadiusSettings] object that contains information about the RADIUS server.
     *)

  directory_id: string;
  (** 
    The identifier of the directory for which to update the RADIUS server information.
     *)

}

type update_number_of_domain_controllers_result = unit

type update_number_of_domain_controllers_request = {
  desired_number: int;
  (** 
    The number of domain controllers desired in the directory.
     *)

  directory_id: string;
  (** 
    Identifier of the directory to which the domain controllers will be added or removed.
     *)

}

(** 
    The maximum allowed number of domain controllers per directory was exceeded. The default limit per directory is 20 domain controllers.
     *)
type domain_controller_limit_exceeded_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    An entry of update information related to a requested update type.
     *)
type update_info_entry = {
  last_updated_date_time: float option;
  (** 
    The last updated date and time of a particular directory setting.
     *)

  start_time: float option;
  (** 
    The start time of the [UpdateDirectorySetup] for the particular type.
     *)

  previous_value: update_value option;
  (** 
    The old value of the target setting.
     *)

  new_value: update_value option;
  (** 
    The new value of the target setting.
     *)

  initiated_by: string option;
  (** 
    This specifies if the update was initiated by the customer or by the service team.
     *)

  status_reason: string option;
  (** 
    The reason for the current status of the update type activity.
     *)

  status: update_status option;
  (** 
    The status of the update performed on the directory.
     *)

  region: string option;
  (** 
    The name of the Region.
     *)

}

type update_directory_setup_result = unit

type update_directory_setup_request = {
  create_snapshot_before_update: bool option;
  (** 
    The boolean that specifies if a snapshot for the directory needs to be taken before updating the directory.
     *)

  os_update_settings: os_update_settings option;
  (** 
    The settings for the OS update that needs to be performed on the directory.
     *)

  update_type: update_type;
  (** 
    The type of update that needs to be performed on the directory. For example, OS.
     *)

  directory_id: string;
  (** 
    The identifier of the directory on which you want to perform the update.
     *)

}

(** 
    The maximum number of manual snapshots for the directory has been reached. You can use the [GetSnapshotLimits] operation to determine the snapshot limits for a directory.
     *)
type snapshot_limit_exceeded_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The directory is already updated to desired update type settings.
     *)
type directory_in_desired_state_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    Client authentication is not available in this region at this time.
     *)
type access_denied_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The result of an UpdateConditionalForwarder request.
     *)
type update_conditional_forwarder_result = unit

(** 
    Updates a conditional forwarder.
     *)
type update_conditional_forwarder_request = {
  dns_ip_addrs: string list;
  (** 
    The updated IP addresses of the remote DNS server associated with the conditional forwarder.
     *)

  remote_domain_name: string;
  (** 
    The fully qualified domain name (FQDN) of the remote domain with which you will set up a trust relationship.
     *)

  directory_id: string;
  (** 
    The directory ID of the Amazon Web Services directory for which to update the conditional forwarder.
     *)

}

type target_type = | ACCOUNT

(** 
    Identifier that contains details about the directory consumer account with whom the directory is being unshared.
     *)
type unshare_target = {
  type_: target_type;
  (** 
    Type of identifier to be used in the {i Id} field.
     *)

  id: string;
  (** 
    Identifier of the directory consumer account.
     *)

}

type unshare_directory_result = {
  shared_directory_id: string option;
  (** 
    Identifier of the directory stored in the directory consumer account that is to be unshared from the specified directory ([DirectoryId]).
     *)

}

type unshare_directory_request = {
  unshare_target: unshare_target;
  (** 
    Identifier for the directory consumer account with whom the directory has to be unshared.
     *)

  directory_id: string;
  (** 
    The identifier of the Managed Microsoft AD directory that you want to stop sharing.
     *)

}

(** 
    The specified shared target is not valid.
     *)
type invalid_target_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The specified directory has not been shared with this Amazon Web Services account.
     *)
type directory_not_shared_exception = {
  request_id: string option;
  
  message: string option;
  
}

type trust_type = | EXTERNAL
  | FOREST

type trust_direction = | TWO_WAY
  | ONE_WAY_INCOMING
  | ONE_WAY_OUTGOING

type trust_state = | FAILED
  | DELETED
  | DELETING
  | UPDATED
  | UPDATE_FAILED
  | UPDATING
  | VERIFIED
  | VERIFY_FAILED
  | VERIFYING
  | CREATED
  | CREATING

(** 
    Describes a trust relationship between an Managed Microsoft AD directory and an external domain.
     *)
type trust = {
  selective_auth: selective_auth option;
  (** 
    Current state of selective authentication for the trust.
     *)

  trust_state_reason: string option;
  (** 
    The reason for the TrustState.
     *)

  state_last_updated_date_time: float option;
  (** 
    The date and time that the TrustState was last updated.
     *)

  last_updated_date_time: float option;
  (** 
    The date and time that the trust relationship was last updated.
     *)

  created_date_time: float option;
  (** 
    The date and time that the trust relationship was created.
     *)

  trust_state: trust_state option;
  (** 
    The trust relationship state.
     *)

  trust_direction: trust_direction option;
  (** 
    The trust relationship direction.
     *)

  trust_type: trust_type option;
  (** 
    The trust relationship type. [Forest] is the default.
     *)

  remote_domain_name: string option;
  (** 
    The Fully Qualified Domain Name (FQDN) of the external domain involved in the trust relationship.
     *)

  trust_id: string option;
  (** 
    The unique ID of the trust relationship.
     *)

  directory_id: string option;
  (** 
    The Directory ID of the Amazon Web Services directory involved in the trust relationship.
     *)

}

type topic_status = | DELETED
  | FAILED
  | TOPIC_NOT_FOUND
  | REGISTERED

(** 
    Metadata assigned to a directory consisting of a key-value pair.
     *)
type tag = {
  value: string;
  [@ocaml.doc {| 
    The optional value of the tag. The string value can be Unicode characters. The string can contain only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
     |}]

  key: string;
  [@ocaml.doc {| 
    Required name of the tag. The string value can be Unicode characters and cannot be prefixed with "aws:". The string can contain only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").
     |}]

}

(** 
    The maximum allowed number of tags was exceeded.
     *)
type tag_limit_exceeded_exception = {
  request_id: string option;
  
  message: string option;
  
}

type start_schema_extension_result = {
  schema_extension_id: string option;
  (** 
    The identifier of the schema extension that will be applied.
     *)

}

type start_schema_extension_request = {
  description: string;
  (** 
    A description of the schema extension.
     *)

  ldif_content: string;
  (** 
    The LDIF file represented as a string. To construct the LdifContent string, precede each line as it would be formatted in an ldif file with \n. See the example request below for more details. The file size can be no larger than 1MB.
     *)

  create_snapshot_before_schema_extension: bool;
  (** 
    If true, creates a snapshot of the directory before applying the schema extension.
     *)

  directory_id: string;
  (** 
    The identifier of the directory for which the schema extension will be applied to.
     *)

}

type snapshot_type = | MANUAL
  | AUTO

type snapshot_status = | FAILED
  | COMPLETED
  | CREATING

(** 
    Describes a directory snapshot.
     *)
type snapshot = {
  start_time: float option;
  (** 
    The date and time that the snapshot was taken.
     *)

  status: snapshot_status option;
  (** 
    The snapshot status.
     *)

  name: string option;
  (** 
    The descriptive name of the snapshot.
     *)

  type_: snapshot_type option;
  (** 
    The snapshot type.
     *)

  snapshot_id: string option;
  (** 
    The snapshot identifier.
     *)

  directory_id: string option;
  (** 
    The directory identifier.
     *)

}

(** 
    Contains manual snapshot limit information for a directory.
     *)
type snapshot_limits = {
  manual_snapshots_limit_reached: bool option;
  (** 
    Indicates if the manual snapshot limit has been reached.
     *)

  manual_snapshots_current_count: int option;
  (** 
    The current number of manual snapshots of the directory.
     *)

  manual_snapshots_limit: int option;
  (** 
    The maximum number of manual snapshots allowed.
     *)

}

type share_method = | HANDSHAKE
  | ORGANIZATIONS

type share_status = | DELETING
  | DELETED
  | SHARE_FAILED
  | SHARING
  | REJECT_FAILED
  | REJECTING
  | REJECTED
  | PENDING_ACCEPTANCE
  | SHARED

(** 
    Details about the shared directory in the directory owner account for which the share request in the directory consumer account has been accepted.
     *)
type shared_directory = {
  last_updated_date_time: float option;
  (** 
    The date and time that the shared directory was last updated.
     *)

  created_date_time: float option;
  (** 
    The date and time that the shared directory was created.
     *)

  share_notes: string option;
  (** 
    A directory share request that is sent by the directory owner to the directory consumer. The request includes a typed message to help the directory consumer administrator determine whether to approve or reject the share invitation.
     *)

  share_status: share_status option;
  (** 
    Current directory status of the shared Managed Microsoft AD directory.
     *)

  shared_directory_id: string option;
  (** 
    Identifier of the shared directory in the directory consumer account. This identifier is different for each directory owner account.
     *)

  shared_account_id: string option;
  (** 
    Identifier of the directory consumer account that has access to the shared directory ([OwnerDirectoryId]) in the directory owner account.
     *)

  share_method: share_method option;
  (** 
    The method used when sharing a directory to determine whether the directory should be shared within your Amazon Web Services organization ([ORGANIZATIONS]) or with any Amazon Web Services account by sending a shared directory request ([HANDSHAKE]).
     *)

  owner_directory_id: string option;
  (** 
    Identifier of the directory in the directory owner account.
     *)

  owner_account_id: string option;
  (** 
    Identifier of the directory owner account, which contains the directory that has been shared to the consumer account.
     *)

}

(** 
    Identifier that contains details about the directory consumer account.
     *)
type share_target = {
  type_: target_type;
  (** 
    Type of identifier to be used in the [Id] field.
     *)

  id: string;
  (** 
    Identifier of the directory consumer account.
     *)

}

(** 
    The maximum number of Amazon Web Services accounts that you can share with this directory has been reached.
     *)
type share_limit_exceeded_exception = {
  request_id: string option;
  
  message: string option;
  
}

type share_directory_result = {
  shared_directory_id: string option;
  (** 
    Identifier of the directory that is stored in the directory consumer account that is shared from the specified directory ([DirectoryId]).
     *)

}

type share_directory_request = {
  share_method: share_method;
  (** 
    The method used when sharing a directory to determine whether the directory should be shared within your Amazon Web Services organization ([ORGANIZATIONS]) or with any Amazon Web Services account by sending a directory sharing request ([HANDSHAKE]).
     *)

  share_target: share_target;
  (** 
    Identifier for the directory consumer account with whom the directory is to be shared.
     *)

  share_notes: string option;
  (** 
    A directory share request that is sent by the directory owner to the directory consumer. The request includes a typed message to help the directory consumer administrator determine whether to approve or reject the share invitation.
     *)

  directory_id: string;
  (** 
    Identifier of the Managed Microsoft AD directory that you want to share with other Amazon Web Services accounts.
     *)

}

(** 
    Exception encountered while trying to access your Amazon Web Services organization.
     *)
type organizations_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The specified directory has already been shared with this Amazon Web Services account.
     *)
type directory_already_shared_exception = {
  request_id: string option;
  
  message: string option;
  
}

type directory_configuration_status = | DEFAULT
  | FAILED
  | UPDATED
  | UPDATING
  | REQUESTED

(** 
    Contains information about the specified configurable setting for a directory.
     *)
type setting_entry = {
  data_type: string option;
  (** 
    The data type of a directory setting. This is used to define the [AllowedValues] of a setting. For example a data type can be [Boolean], [DurationInSeconds], or [Enum].
     *)

  last_requested_date_time: float option;
  (** 
    The date and time when the request to update a directory setting was last submitted.
     *)

  last_updated_date_time: float option;
  (** 
    The date and time when the directory setting was last updated.
     *)

  request_status_message: string option;
  (** 
    The last status message for the directory status request.
     *)

  request_detailed_status: (string * directory_configuration_status) list option;
  (** 
    Details about the status of the request to update the directory setting. If the directory setting is deployed in more than one region, status is returned for the request in each region where the setting is deployed.
     *)

  request_status: directory_configuration_status option;
  (** 
    The overall status of the request to update the directory setting request. If the directory setting is deployed in more than one region, and the request fails in any region, the overall status is [Failed].
     *)

  requested_value: string option;
  (** 
    The value that was last requested for the directory setting.
     *)

  applied_value: string option;
  (** 
    The value of the directory setting that is applied to the directory.
     *)

  allowed_values: string option;
  (** 
    The valid range of values for the directory setting. These values depend on the [DataType] of your directory.
     *)

  name: string option;
  (** 
    The name of the directory setting. For example:
    
     [TLS_1_0]
      *)

  type_: string option;
  (** 
    The type, or category, of a directory setting. Similar settings have the same type. For example, [Protocol], [Cipher], or [Certificate-Based Authentication].
     *)

}

type schema_extension_status = | COMPLETED
  | FAILED
  | CANCELLED
  | ROLLBACK_IN_PROGRESS
  | CANCEL_IN_PROGRESS
  | REPLICATING
  | UPDATING_SCHEMA
  | CREATING_SNAPSHOT
  | INITIALIZING

(** 
    Information about a schema extension.
     *)
type schema_extension_info = {
  end_date_time: float option;
  (** 
    The date and time that the schema extension was completed.
     *)

  start_date_time: float option;
  (** 
    The date and time that the schema extension started being applied to the directory.
     *)

  schema_extension_status_reason: string option;
  (** 
    The reason for the [SchemaExtensionStatus].
     *)

  schema_extension_status: schema_extension_status option;
  (** 
    The current status of the schema extension.
     *)

  description: string option;
  (** 
    A description of the schema extension.
     *)

  schema_extension_id: string option;
  (** 
    The identifier of the schema extension.
     *)

  directory_id: string option;
  (** 
    The identifier of the directory to which the schema extension is applied.
     *)

}

(** 
    Contains the results of the [RestoreFromSnapshot] operation.
     *)
type restore_from_snapshot_result = unit

(** 
    An object representing the inputs for the [RestoreFromSnapshot] operation.
     *)
type restore_from_snapshot_request = {
  snapshot_id: string;
  (** 
    The identifier of the snapshot to restore from.
     *)

}

type reset_user_password_result = unit

type reset_user_password_request = {
  new_password: string;
  (** 
    The new password that will be reset.
     *)

  user_name: string;
  (** 
    The user name of the user whose password will be reset.
     *)

  directory_id: string;
  (** 
    Identifier of the Managed Microsoft AD or Simple AD directory in which the user resides.
     *)

}

(** 
    The new password provided by the user does not meet the password complexity requirements defined in your directory.
     *)
type invalid_password_exception = {
  request_id: string option;
  
  message: string option;
  
}

type replication_scope = | Domain

type remove_tags_from_resource_result = unit

type remove_tags_from_resource_request = {
  tag_keys: string list;
  (** 
    The tag key (name) of the tag to be removed.
     *)

  resource_id: string;
  (** 
    Identifier (ID) of the directory from which to remove the tag.
     *)

}

type remove_region_result = unit

type remove_region_request = {
  directory_id: string;
  (** 
    The identifier of the directory for which you want to remove Region replication.
     *)

}

type remove_ip_routes_result = unit

type remove_ip_routes_request = {
  cidr_ips: string list;
  (** 
    IP address blocks that you want to remove.
     *)

  directory_id: string;
  (** 
    Identifier (ID) of the directory from which you want to remove the IP addresses.
     *)

}

type reject_shared_directory_result = {
  shared_directory_id: string option;
  (** 
    Identifier of the shared directory in the directory consumer account.
     *)

}

type reject_shared_directory_request = {
  shared_directory_id: string;
  (** 
    Identifier of the shared directory in the directory consumer account. This identifier is different for each directory owner account.
     *)

}

(** 
    The result of a RegisterEventTopic request.
     *)
type register_event_topic_result = unit

(** 
    Registers a new event topic.
     *)
type register_event_topic_request = {
  topic_name: string;
  (** 
    The Amazon SNS topic name to which the directory will publish status messages. This Amazon SNS topic must be in the same region as the specified Directory ID.
     *)

  directory_id: string;
  (** 
    The Directory ID that will publish status messages to the Amazon SNS topic.
     *)

}

type register_certificate_result = {
  certificate_id: string option;
  (** 
    The identifier of the certificate.
     *)

}

type certificate_type = | CLIENT_LDAPS
  | CLIENT_CERT_AUTH

(** 
    Contains information about the client certificate authentication settings for the [RegisterCertificate] and [DescribeCertificate] operations.
     *)
type client_cert_auth_settings = {
  ocsp_url: string option;
  (** 
    Specifies the URL of the default OCSP server used to check for revocation status. A secondary value to any OCSP address found in the AIA extension of the user certificate.
     *)

}

type register_certificate_request = {
  client_cert_auth_settings: client_cert_auth_settings option;
  (** 
    A [ClientCertAuthSettings] object that contains client certificate authentication settings.
     *)

  type_: certificate_type option;
  (** 
    The function that the registered certificate performs. Valid values include [ClientLDAPS] or [ClientCertAuth]. The default value is [ClientLDAPS].
     *)

  certificate_data: string;
  (** 
    The certificate PEM string that needs to be registered.
     *)

  directory_id: string;
  (** 
    The identifier of the directory.
     *)

}

(** 
    The certificate PEM that was provided has incorrect encoding.
     *)
type invalid_certificate_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The certificate could not be added because the certificate limit has been reached.
     *)
type certificate_limit_exceeded_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The certificate has already been registered into the system.
     *)
type certificate_already_exists_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    Provides information about the Regions that are configured for multi-Region replication.
     *)
type regions_info = {
  additional_regions: string list option;
  (** 
    Lists the Regions where the directory has been replicated, excluding the primary Region.
     *)

  primary_region: string option;
  (** 
    The Region where the Managed Microsoft AD directory was originally created.
     *)

}

type region_type = | ADDITIONAL
  | PRIMARY

type directory_stage = | FAILED
  | DELETED
  | DELETING
  | RESTOREFAILED
  | RESTORING
  | IMPAIRED
  | INOPERABLE
  | ACTIVE
  | CREATED
  | CREATING
  | REQUESTED

(** 
    Contains VPC information for the [CreateDirectory] or [CreateMicrosoftAD] operation.
     *)
type directory_vpc_settings = {
  subnet_ids: string list;
  (** 
    The identifiers of the subnets for the directory servers. The two subnets must be in different Availability Zones. Directory Service creates a directory server and a DNS server in each of these subnets.
     *)

  vpc_id: string;
  (** 
    The identifier of the VPC in which to create the directory.
     *)

}

(** 
    The replicated Region information for a directory.
     *)
type region_description = {
  last_updated_date_time: float option;
  (** 
    The date and time that the Region description was last updated.
     *)

  status_last_updated_date_time: float option;
  (** 
    The date and time that the Region status was last updated.
     *)

  launch_time: float option;
  (** 
    Specifies when the Region replication began.
     *)

  desired_number_of_domain_controllers: int option;
  (** 
    The desired number of domain controllers in the specified Region for the specified directory.
     *)

  vpc_settings: directory_vpc_settings option;
  
  status: directory_stage option;
  (** 
    The status of the replication process for the specified Region.
     *)

  region_type: region_type option;
  (** 
    Specifies whether the Region is the primary Region or an additional Region.
     *)

  region_name: string option;
  (** 
    The name of the Region. For example, [us-east-1].
     *)

  directory_id: string option;
  (** 
    The identifier of the directory.
     *)

}

(** 
    You have reached the limit for maximum number of simultaneous Region replications per directory.
     *)
type region_limit_exceeded_exception = {
  request_id: string option;
  
  message: string option;
  
}

type radius_status = | FAILED
  | COMPLETED
  | CREATING

(** 
    Contains information about the directory.
     *)
type directory_vpc_settings_description = {
  availability_zones: string list option;
  (** 
    The list of Availability Zones that the directory is in.
     *)

  security_group_id: string option;
  (** 
    The domain controller security group identifier for the directory.
     *)

  subnet_ids: string list option;
  (** 
    The identifiers of the subnets for the directory servers.
     *)

  vpc_id: string option;
  (** 
    The identifier of the VPC that the directory is in.
     *)

}

(** 
    Describes the directory owner account details that have been shared to the directory consumer account.
     *)
type owner_directory_description = {
  radius_status: radius_status option;
  (** 
    Information about the status of the RADIUS server.
     *)

  radius_settings: radius_settings option;
  (** 
    A [RadiusSettings] object that contains information about the RADIUS server.
     *)

  vpc_settings: directory_vpc_settings_description option;
  (** 
    Information about the VPC settings for the directory.
     *)

  dns_ip_addrs: string list option;
  (** 
    IP address of the directory’s domain controllers.
     *)

  account_id: string option;
  (** 
    Identifier of the directory owner account.
     *)

  directory_id: string option;
  (** 
    Identifier of the Managed Microsoft AD directory in the directory owner account.
     *)

}

(** 
    Client authentication setup could not be completed because at least one valid certificate must be registered in the system.
     *)
type no_available_certificate_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    Represents a log subscription, which tracks real-time data from a chosen log group to a specified destination.
     *)
type log_subscription = {
  subscription_created_date_time: float option;
  (** 
    The date and time that the log subscription was created.
     *)

  log_group_name: string option;
  (** 
    The name of the log group.
     *)

  directory_id: string option;
  (** 
    Identifier (ID) of the directory that you want to associate with the log subscription.
     *)

}

type list_tags_for_resource_result = {
  next_token: string option;
  (** 
    Reserved for future use.
     *)

  tags: tag list option;
  (** 
    List of tags returned by the ListTagsForResource operation.
     *)

}

type list_tags_for_resource_request = {
  limit: int option;
  (** 
    Reserved for future use.
     *)

  next_token: string option;
  (** 
    Reserved for future use.
     *)

  resource_id: string;
  (** 
    Identifier (ID) of the directory for which you want to retrieve tags.
     *)

}

(** 
    The [NextToken] value is not valid.
     *)
type invalid_next_token_exception = {
  request_id: string option;
  
  message: string option;
  
}

type list_schema_extensions_result = {
  next_token: string option;
  (** 
    If not null, more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [ListSchemaExtensions] to retrieve the next set of items.
     *)

  schema_extensions_info: schema_extension_info list option;
  (** 
    Information about the schema extensions applied to the directory.
     *)

}

type list_schema_extensions_request = {
  limit: int option;
  (** 
    The maximum number of items to return.
     *)

  next_token: string option;
  (** 
    The [ListSchemaExtensions.NextToken] value from a previous call to [ListSchemaExtensions]. Pass null if this is the first call.
     *)

  directory_id: string;
  (** 
    The identifier of the directory from which to retrieve the schema extension information.
     *)

}

type list_log_subscriptions_result = {
  next_token: string option;
  (** 
    The token for the next set of items to return.
     *)

  log_subscriptions: log_subscription list option;
  (** 
    A list of active [LogSubscription] objects for calling the Amazon Web Services account.
     *)

}

type list_log_subscriptions_request = {
  limit: int option;
  (** 
    The maximum number of items returned.
     *)

  next_token: string option;
  (** 
    The token for the next set of items to return.
     *)

  directory_id: string option;
  (** 
    If a {i DirectoryID} is provided, lists only the log subscription associated with that directory. If no {i DirectoryId} is provided, lists all log subscriptions associated with your Amazon Web Services account. If there are no log subscriptions for the Amazon Web Services account or the directory, an empty list will be returned.
     *)

}

type ip_route_status_msg = | REMOVE_FAILED
  | ADD_FAILED
  | REMOVED
  | REMOVING
  | ADDED
  | ADDING

(** 
    Information about one or more IP address blocks.
     *)
type ip_route_info = {
  description: string option;
  (** 
    Description of the [IpRouteInfo].
     *)

  ip_route_status_reason: string option;
  (** 
    The reason for the IpRouteStatusMsg.
     *)

  added_date_time: float option;
  (** 
    The date and time the address block was added to the directory.
     *)

  ip_route_status_msg: ip_route_status_msg option;
  (** 
    The status of the IP address block.
     *)

  cidr_ip: string option;
  (** 
    IP address block in the [IpRoute].
     *)

  directory_id: string option;
  (** 
    Identifier (ID) of the directory associated with the IP addresses.
     *)

}

type list_ip_routes_result = {
  next_token: string option;
  (** 
    If not null, more results are available. Pass this value for the {i NextToken} parameter in a subsequent call to [ListIpRoutes] to retrieve the next set of items.
     *)

  ip_routes_info: ip_route_info list option;
  (** 
    A list of [IpRoute]s.
     *)

}

type list_ip_routes_request = {
  limit: int option;
  (** 
    Maximum number of items to return. If this value is zero, the maximum number of items is specified by the limitations of the operation.
     *)

  next_token: string option;
  (** 
    The {i ListIpRoutes.NextToken} value from a previous call to [ListIpRoutes]. Pass null if this is the first call.
     *)

  directory_id: string;
  (** 
    Identifier (ID) of the directory for which you want to retrieve the IP addresses.
     *)

}

type certificate_state = | DEREGISTER_FAILED
  | DEREGISTERED
  | DEREGISTERING
  | REGISTER_FAILED
  | REGISTERED
  | REGISTERING

(** 
    Contains general information about a certificate.
     *)
type certificate_info = {
  type_: certificate_type option;
  (** 
    The function that the registered certificate performs. Valid values include [ClientLDAPS] or [ClientCertAuth]. The default value is [ClientLDAPS].
     *)

  expiry_date_time: float option;
  (** 
    The date and time when the certificate will expire.
     *)

  state: certificate_state option;
  (** 
    The state of the certificate.
     *)

  common_name: string option;
  (** 
    The common name for the certificate.
     *)

  certificate_id: string option;
  (** 
    The identifier of the certificate.
     *)

}

type list_certificates_result = {
  certificates_info: certificate_info list option;
  (** 
    A list of certificates with basic details including certificate ID, certificate common name, certificate state.
     *)

  next_token: string option;
  (** 
    Indicates whether another page of certificates is available when the number of available certificates exceeds the page limit.
     *)

}

type list_certificates_request = {
  limit: int option;
  (** 
    The number of items that should show up on one page
     *)

  next_token: string option;
  (** 
    A token for requesting another page of certificates if the [NextToken] response element indicates that more certificates are available. Use the value of the returned [NextToken] element in your request until the token comes back as [null]. Pass [null] if this is the first call.
     *)

  directory_id: string;
  (** 
    The identifier of the directory.
     *)

}

type ldaps_type = | CLIENT

type ldaps_status = | DISABLED
  | ENABLE_FAILED
  | ENABLED
  | ENABLING

(** 
    Contains general information about the LDAPS settings.
     *)
type ldaps_setting_info = {
  last_updated_date_time: float option;
  (** 
    The date and time when the LDAPS settings were last updated.
     *)

  ldaps_status_reason: string option;
  (** 
    Describes a state change for LDAPS.
     *)

  ldaps_status: ldaps_status option;
  (** 
    The state of the LDAPS settings.
     *)

}

(** 
    IP address block. This is often the address block of the DNS server used for your self-managed domain.
     *)
type ip_route = {
  description: string option;
  (** 
    Description of the address block.
     *)

  cidr_ip: string option;
  (** 
    IP address block using CIDR format, for example 10.0.0.0/24. This is often the address block of the DNS server used for your self-managed domain. For a single IP address use a CIDR address block with /32. For example 10.0.0.0/32.
     *)

}

(** 
    The maximum allowed number of IP addresses was exceeded. The default limit is 100 IP address blocks.
     *)
type ip_route_limit_exceeded_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The LDAP activities could not be performed because they are limited by the LDAPS status.
     *)
type invalid_ldaps_status_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    Client authentication is already enabled.
     *)
type invalid_client_auth_status_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    The account does not have sufficient permission to perform the operation.
     *)
type insufficient_permissions_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    Contains the results of the [GetSnapshotLimits] operation.
     *)
type get_snapshot_limits_result = {
  snapshot_limits: snapshot_limits option;
  (** 
    A [SnapshotLimits] object that contains the manual snapshot limits for the specified directory.
     *)

}

(** 
    Contains the inputs for the [GetSnapshotLimits] operation.
     *)
type get_snapshot_limits_request = {
  directory_id: string;
  (** 
    Contains the identifier of the directory to obtain the limits for.
     *)

}

(** 
    Contains directory limit information for a Region.
     *)
type directory_limits = {
  connected_directories_limit_reached: bool option;
  (** 
    Indicates if the connected directory limit has been reached.
     *)

  connected_directories_current_count: int option;
  (** 
    The current number of connected directories in the Region.
     *)

  connected_directories_limit: int option;
  (** 
    The maximum number of connected directories allowed in the Region.
     *)

  cloud_only_microsoft_ad_limit_reached: bool option;
  (** 
    Indicates if the Managed Microsoft AD directory limit has been reached.
     *)

  cloud_only_microsoft_ad_current_count: int option;
  (** 
    The current number of Managed Microsoft AD directories in the region.
     *)

  cloud_only_microsoft_ad_limit: int option;
  (** 
    The maximum number of Managed Microsoft AD directories allowed in the region.
     *)

  cloud_only_directories_limit_reached: bool option;
  (** 
    Indicates if the cloud directory limit has been reached.
     *)

  cloud_only_directories_current_count: int option;
  (** 
    The current number of cloud directories in the Region.
     *)

  cloud_only_directories_limit: int option;
  (** 
    The maximum number of cloud directories allowed in the Region.
     *)

}

(** 
    Contains the results of the [GetDirectoryLimits] operation.
     *)
type get_directory_limits_result = {
  directory_limits: directory_limits option;
  (** 
    A [DirectoryLimits] object that contains the directory limits for the current Region.
     *)

}

(** 
    Contains the inputs for the [GetDirectoryLimits] operation.
     *)
type get_directory_limits_request = unit

(** 
    Information about Amazon SNS topic and Directory Service directory associations.
     *)
type event_topic = {
  status: topic_status option;
  (** 
    The topic registration status.
     *)

  created_date_time: float option;
  (** 
    The date and time of when you associated your directory with the Amazon SNS topic.
     *)

  topic_arn: string option;
  (** 
    The Amazon SNS topic ARN (Amazon Resource Name).
     *)

  topic_name: string option;
  (** 
    The name of an Amazon SNS topic the receives status messages from the directory.
     *)

  directory_id: string option;
  (** 
    The Directory ID of an Directory Service directory that will publish status messages to an Amazon SNS topic.
     *)

}

(** 
    The specified entity already exists.
     *)
type entity_already_exists_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    Contains the results of the [EnableSso] operation.
     *)
type enable_sso_result = unit

(** 
    Contains the inputs for the [EnableSso] operation.
     *)
type enable_sso_request = {
  password: string option;
  (** 
    The password of an alternate account to use to enable single-sign on. This is only used for AD Connector directories. For more information, see the {i UserName} parameter.
     *)

  user_name: string option;
  (** 
    The username of an alternate account to use to enable single-sign on. This is only used for AD Connector directories. This account must have privileges to add a service principal name.
    
     If the AD Connector service account does not have privileges to add a service principal name, you can specify an alternate account with the {i UserName} and {i Password} parameters. These credentials are only used to enable single sign-on and are not stored by the service. The AD Connector service account is not changed.
      *)

  directory_id: string;
  (** 
    The identifier of the directory for which to enable single-sign on.
     *)

}

(** 
    An authentication error occurred.
     *)
type authentication_failed_exception = {
  request_id: string option;
  (** 
    The identifier of the request that caused the exception.
     *)

  message: string option;
  (** 
    The textual message for the exception.
     *)

}

(** 
    Contains the results of the [EnableRadius] operation.
     *)
type enable_radius_result = unit

(** 
    Contains the inputs for the [EnableRadius] operation.
     *)
type enable_radius_request = {
  radius_settings: radius_settings;
  (** 
    A [RadiusSettings] object that contains information about the RADIUS server.
     *)

  directory_id: string;
  (** 
    The identifier of the directory for which to enable MFA.
     *)

}

type enable_ldaps_result = unit

type enable_ldaps_request = {
  type_: ldaps_type;
  (** 
    The type of LDAP security to enable. Currently only the value [Client] is supported.
     *)

  directory_id: string;
  (** 
    The identifier of the directory.
     *)

}

type enable_client_authentication_result = unit

type client_authentication_type = | SMART_CARD_OR_PASSWORD
  | SMART_CARD

type enable_client_authentication_request = {
  type_: client_authentication_type;
  (** 
    The type of client authentication to enable. Currently only the value [SmartCard] is supported. Smart card authentication in AD Connector requires that you enable Kerberos Constrained Delegation for the Service User to the LDAP service in your self-managed AD.
     *)

  directory_id: string;
  (** 
    The identifier of the specified directory.
     *)

}

type domain_controller_status = | FAILED
  | DELETED
  | DELETING
  | RESTORING
  | IMPAIRED
  | ACTIVE
  | CREATING

(** 
    Contains information about the domain controllers for a specified directory.
     *)
type domain_controller = {
  status_last_updated_date_time: float option;
  (** 
    The date and time that the status was last updated.
     *)

  launch_time: float option;
  (** 
    Specifies when the domain controller was created.
     *)

  status_reason: string option;
  (** 
    A description of the domain controller state.
     *)

  status: domain_controller_status option;
  (** 
    The status of the domain controller.
     *)

  availability_zone: string option;
  (** 
    The Availability Zone where the domain controller is located.
     *)

  subnet_id: string option;
  (** 
    Identifier of the subnet in the VPC that contains the domain controller.
     *)

  vpc_id: string option;
  (** 
    The identifier of the VPC that contains the domain controller.
     *)

  dns_ip_addr: string option;
  (** 
    The IP address of the domain controller.
     *)

  domain_controller_id: string option;
  (** 
    Identifies a specific domain controller in the directory.
     *)

  directory_id: string option;
  (** 
    Identifier of the directory where the domain controller resides.
     *)

}

(** 
    Contains the results of the [DisableSso] operation.
     *)
type disable_sso_result = unit

(** 
    Contains the inputs for the [DisableSso] operation.
     *)
type disable_sso_request = {
  password: string option;
  (** 
    The password of an alternate account to use to disable single-sign on. This is only used for AD Connector directories. For more information, see the {i UserName} parameter.
     *)

  user_name: string option;
  (** 
    The username of an alternate account to use to disable single-sign on. This is only used for AD Connector directories. This account must have privileges to remove a service principal name.
    
     If the AD Connector service account does not have privileges to remove a service principal name, you can specify an alternate account with the {i UserName} and {i Password} parameters. These credentials are only used to disable single sign-on and are not stored by the service. The AD Connector service account is not changed.
      *)

  directory_id: string;
  (** 
    The identifier of the directory for which to disable single-sign on.
     *)

}

(** 
    Contains the results of the [DisableRadius] operation.
     *)
type disable_radius_result = unit

(** 
    Contains the inputs for the [DisableRadius] operation.
     *)
type disable_radius_request = {
  directory_id: string;
  (** 
    The identifier of the directory for which to disable MFA.
     *)

}

type disable_ldaps_result = unit

type disable_ldaps_request = {
  type_: ldaps_type;
  (** 
    The type of LDAP security to enable. Currently only the value [Client] is supported.
     *)

  directory_id: string;
  (** 
    The identifier of the directory.
     *)

}

type disable_client_authentication_result = unit

type disable_client_authentication_request = {
  type_: client_authentication_type;
  (** 
    The type of client authentication to disable. Currently, only the parameter, [SmartCard] is supported.
     *)

  directory_id: string;
  (** 
    The identifier of the directory
     *)

}

type directory_type = | SHARED_MICROSOFT_AD
  | MICROSOFT_AD
  | AD_CONNECTOR
  | SIMPLE_AD

type directory_size = | LARGE
  | SMALL

type describe_update_directory_result = {
  next_token: string option;
  (** 
    If not null, more results are available. Pass this value for the [NextToken] parameter.
     *)

  update_activities: update_info_entry list option;
  (** 
    The list of update activities on a directory for the requested update type.
     *)

}

type describe_update_directory_request = {
  next_token: string option;
  (** 
    The [DescribeUpdateDirectoryResult]. NextToken value from a previous call to [DescribeUpdateDirectory]. Pass null if this is the first call.
     *)

  region_name: string option;
  (** 
    The name of the Region.
     *)

  update_type: update_type;
  (** 
    The type of updates you want to describe for the directory.
     *)

  directory_id: string;
  (** 
    The unique identifier of the directory.
     *)

}

(** 
    The result of a DescribeTrust request.
     *)
type describe_trusts_result = {
  next_token: string option;
  (** 
    If not null, more results are available. Pass this value for the {i NextToken} parameter in a subsequent call to [DescribeTrusts] to retrieve the next set of items.
     *)

  trusts: trust list option;
  (** 
    The list of Trust objects that were retrieved.
    
     It is possible that this list contains less than the number of items specified in the {i Limit} member of the request. This occurs if there are less than the requested number of items left to retrieve, or if the limitations of the operation have been exceeded.
      *)

}

(** 
    Describes the trust relationships for a particular Managed Microsoft AD directory. If no input parameters are provided, such as directory ID or trust ID, this request describes all the trust relationships.
     *)
type describe_trusts_request = {
  limit: int option;
  (** 
    The maximum number of objects to return.
     *)

  next_token: string option;
  (** 
    The {i DescribeTrustsResult.NextToken} value from a previous call to [DescribeTrusts]. Pass null if this is the first call.
     *)

  trust_ids: string list option;
  (** 
    A list of identifiers of the trust relationships for which to obtain the information. If this member is null, all trust relationships that belong to the current account are returned.
    
     An empty list results in an [InvalidParameterException] being thrown.
      *)

  directory_id: string option;
  (** 
    The Directory ID of the Amazon Web Services directory that is a part of the requested trust relationship.
     *)

}

(** 
    Contains the results of the [DescribeSnapshots] operation.
     *)
type describe_snapshots_result = {
  next_token: string option;
  (** 
    If not null, more results are available. Pass this value in the {i NextToken} member of a subsequent call to [DescribeSnapshots].
     *)

  snapshots: snapshot list option;
  (** 
    The list of [Snapshot] objects that were retrieved.
    
     It is possible that this list contains less than the number of items specified in the {i Limit} member of the request. This occurs if there are less than the requested number of items left to retrieve, or if the limitations of the operation have been exceeded.
      *)

}

(** 
    Contains the inputs for the [DescribeSnapshots] operation.
     *)
type describe_snapshots_request = {
  limit: int option;
  (** 
    The maximum number of objects to return.
     *)

  next_token: string option;
  (** 
    The {i DescribeSnapshotsResult.NextToken} value from a previous call to [DescribeSnapshots]. Pass null if this is the first call.
     *)

  snapshot_ids: string list option;
  (** 
    A list of identifiers of the snapshots to obtain the information for. If this member is null or empty, all snapshots are returned using the {i Limit} and {i NextToken} members.
     *)

  directory_id: string option;
  (** 
    The identifier of the directory for which to retrieve snapshot information.
     *)

}

type describe_shared_directories_result = {
  next_token: string option;
  (** 
    If not null, token that indicates that more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [DescribeSharedDirectories] to retrieve the next set of items.
     *)

  shared_directories: shared_directory list option;
  (** 
    A list of all shared directories in your account.
     *)

}

type describe_shared_directories_request = {
  limit: int option;
  (** 
    The number of shared directories to return in the response object.
     *)

  next_token: string option;
  (** 
    The [DescribeSharedDirectoriesResult.NextToken] value from a previous call to [DescribeSharedDirectories]. Pass null if this is the first call.
     *)

  shared_directory_ids: string list option;
  (** 
    A list of identifiers of all shared directories in your account.
     *)

  owner_directory_id: string;
  (** 
    Returns the identifier of the directory in the directory owner account.
     *)

}

type describe_settings_result = {
  next_token: string option;
  (** 
    If not null, token that indicates that more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [DescribeSettings] to retrieve the next set of items.
     *)

  setting_entries: setting_entry list option;
  (** 
    The list of [SettingEntry] objects that were retrieved.
    
     It is possible that this list contains less than the number of items specified in the [Limit] member of the request. This occurs if there are less than the requested number of items left to retrieve, or if the limitations of the operation have been exceeded.
      *)

  directory_id: string option;
  (** 
    The identifier of the directory.
     *)

}

type describe_settings_request = {
  next_token: string option;
  (** 
    The [DescribeSettingsResult.NextToken] value from a previous call to [DescribeSettings]. Pass null if this is the first call.
     *)

  status: directory_configuration_status option;
  (** 
    The status of the directory settings for which to retrieve information.
     *)

  directory_id: string;
  (** 
    The identifier of the directory for which to retrieve information.
     *)

}

type describe_regions_result = {
  next_token: string option;
  (** 
    If not null, more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [DescribeRegions] to retrieve the next set of items.
     *)

  regions_description: region_description list option;
  (** 
    List of Region information related to the directory for each replicated Region.
     *)

}

type describe_regions_request = {
  next_token: string option;
  (** 
    The [DescribeRegionsResult.NextToken] value from a previous call to [DescribeRegions]. Pass null if this is the first call.
     *)

  region_name: string option;
  (** 
    The name of the Region. For example, [us-east-1].
     *)

  directory_id: string;
  (** 
    The identifier of the directory.
     *)

}

type describe_ldaps_settings_result = {
  next_token: string option;
  (** 
    The next token used to retrieve the LDAPS settings if the number of setting types exceeds page limit and there is another page.
     *)

  ldaps_settings_info: ldaps_setting_info list option;
  (** 
    Information about LDAP security for the specified directory, including status of enablement, state last updated date time, and the reason for the state.
     *)

}

type describe_ldaps_settings_request = {
  limit: int option;
  (** 
    Specifies the number of items that should be displayed on one page.
     *)

  next_token: string option;
  (** 
    The type of next token used for pagination.
     *)

  type_: ldaps_type option;
  (** 
    The type of LDAP security to enable. Currently only the value [Client] is supported.
     *)

  directory_id: string;
  (** 
    The identifier of the directory.
     *)

}

(** 
    The result of a DescribeEventTopic request.
     *)
type describe_event_topics_result = {
  event_topics: event_topic list option;
  (** 
    A list of Amazon SNS topic names that receive status messages from the specified Directory ID.
     *)

}

(** 
    Describes event topics.
     *)
type describe_event_topics_request = {
  topic_names: string list option;
  (** 
    A list of Amazon SNS topic names for which to obtain the information. If this member is null, all associations for the specified Directory ID are returned.
    
     An empty list results in an [InvalidParameterException] being thrown.
      *)

  directory_id: string option;
  (** 
    The Directory ID for which to get the list of associated Amazon SNS topics. If this member is null, associations for all Directory IDs are returned.
     *)

}

type describe_domain_controllers_result = {
  next_token: string option;
  (** 
    If not null, more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [DescribeDomainControllers] retrieve the next set of items.
     *)

  domain_controllers: domain_controller list option;
  (** 
    List of the [DomainController] objects that were retrieved.
     *)

}

type describe_domain_controllers_request = {
  limit: int option;
  (** 
    The maximum number of items to return.
     *)

  next_token: string option;
  (** 
    The {i DescribeDomainControllers.NextToken} value from a previous call to [DescribeDomainControllers]. Pass null if this is the first call.
     *)

  domain_controller_ids: string list option;
  (** 
    A list of identifiers for the domain controllers whose information will be provided.
     *)

  directory_id: string;
  (** 
    Identifier of the directory for which to retrieve the domain controller information.
     *)

}

type directory_edition = | STANDARD
  | ENTERPRISE

(** 
    Contains information about an AD Connector directory.
     *)
type directory_connect_settings_description = {
  connect_ips: string list option;
  (** 
    The IP addresses of the AD Connector servers.
     *)

  availability_zones: string list option;
  (** 
    A list of the Availability Zones that the directory is in.
     *)

  security_group_id: string option;
  (** 
    The security group identifier for the AD Connector directory.
     *)

  customer_user_name: string option;
  (** 
    The user name of the service account in your self-managed directory.
     *)

  subnet_ids: string list option;
  (** 
    A list of subnet identifiers in the VPC that the AD Connector is in.
     *)

  vpc_id: string option;
  (** 
    The identifier of the VPC that the AD Connector is in.
     *)

}

(** 
    Contains information about an Directory Service directory.
     *)
type directory_description = {
  os_version: os_version option;
  (** 
    The operating system (OS) version of the directory.
     *)

  regions_info: regions_info option;
  (** 
    Lists the Regions where the directory has replicated.
     *)

  owner_directory_description: owner_directory_description option;
  (** 
    Describes the Managed Microsoft AD directory in the directory owner account.
     *)

  desired_number_of_domain_controllers: int option;
  (** 
    The desired number of domain controllers in the directory if the directory is Microsoft AD.
     *)

  sso_enabled: bool option;
  (** 
    Indicates if single sign-on is enabled for the directory. For more information, see [EnableSso] and [DisableSso].
     *)

  stage_reason: string option;
  (** 
    Additional information about the directory stage.
     *)

  radius_status: radius_status option;
  (** 
    The status of the RADIUS MFA server connection.
     *)

  radius_settings: radius_settings option;
  (** 
    A [RadiusSettings] object that contains information about the RADIUS server configured for this directory.
     *)

  connect_settings: directory_connect_settings_description option;
  (** 
    A [DirectoryConnectSettingsDescription] object that contains additional information about an AD Connector directory. This member is only present if the directory is an AD Connector directory.
     *)

  vpc_settings: directory_vpc_settings_description option;
  (** 
    A [DirectoryVpcSettingsDescription] object that contains additional information about a directory. This member is only present if the directory is a Simple AD or Managed Microsoft AD directory.
     *)

  type_: directory_type option;
  (** 
    The directory size.
     *)

  stage_last_updated_date_time: float option;
  (** 
    The date and time that the stage was last updated.
     *)

  launch_time: float option;
  (** 
    Specifies when the directory was created.
     *)

  share_notes: string option;
  (** 
    A directory share request that is sent by the directory owner to the directory consumer. The request includes a typed message to help the directory consumer administrator determine whether to approve or reject the share invitation.
     *)

  share_method: share_method option;
  (** 
    The method used when sharing a directory to determine whether the directory should be shared within your Amazon Web Services organization ([ORGANIZATIONS]) or with any Amazon Web Services account by sending a shared directory request ([HANDSHAKE]).
     *)

  share_status: share_status option;
  (** 
    Current directory status of the shared Managed Microsoft AD directory.
     *)

  stage: directory_stage option;
  (** 
    The current stage of the directory.
     *)

  dns_ip_addrs: string list option;
  (** 
    The IP addresses of the DNS servers for the directory. For a Simple AD or Microsoft AD directory, these are the IP addresses of the Simple AD or Microsoft AD directory servers. For an AD Connector directory, these are the IP addresses of the DNS servers or domain controllers in your self-managed directory to which the AD Connector is connected.
     *)

  description: string option;
  (** 
    The description for the directory.
     *)

  access_url: string option;
  (** 
    The access URL for the directory, such as [http://.awsapps.com]. If no alias has been created for the directory, [] is the directory identifier, such as [d-XXXXXXXXXX].
     *)

  alias: string option;
  (** 
    The alias for the directory. If no alias has been created for the directory, the alias is the directory identifier, such as [d-XXXXXXXXXX].
     *)

  edition: directory_edition option;
  (** 
    The edition associated with this directory.
     *)

  size: directory_size option;
  (** 
    The directory size.
     *)

  short_name: string option;
  (** 
    The short name of the directory.
     *)

  name: string option;
  (** 
    The fully qualified name of the directory.
     *)

  directory_id: string option;
  (** 
    The directory identifier.
     *)

}

(** 
    Contains the results of the [DescribeDirectories] operation.
     *)
type describe_directories_result = {
  next_token: string option;
  (** 
    If not null, more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [DescribeDirectories] to retrieve the next set of items.
     *)

  directory_descriptions: directory_description list option;
  (** 
    The list of [DirectoryDescription] objects that were retrieved.
    
     It is possible that this list contains less than the number of items specified in the [Limit] member of the request. This occurs if there are less than the requested number of items left to retrieve, or if the limitations of the operation have been exceeded.
      *)

}

(** 
    Contains the inputs for the [DescribeDirectories] operation.
     *)
type describe_directories_request = {
  limit: int option;
  (** 
    The maximum number of items to return. If this value is zero, the maximum number of items is specified by the limitations of the operation.
     *)

  next_token: string option;
  (** 
    The [DescribeDirectoriesResult.NextToken] value from a previous call to [DescribeDirectories]. Pass null if this is the first call.
     *)

  directory_ids: string list option;
  (** 
    A list of identifiers of the directories for which to obtain the information. If this member is null, all directories that belong to the current account are returned.
    
     An empty list results in an [InvalidParameterException] being thrown.
      *)

}

(** 
    Points to a remote domain with which you are setting up a trust relationship. Conditional forwarders are required in order to set up a trust relationship with another domain.
     *)
type conditional_forwarder = {
  replication_scope: replication_scope option;
  (** 
    The replication scope of the conditional forwarder. The only allowed value is [Domain], which will replicate the conditional forwarder to all of the domain controllers for your Amazon Web Services directory.
     *)

  dns_ip_addrs: string list option;
  (** 
    The IP addresses of the remote DNS server associated with RemoteDomainName. This is the IP address of the DNS server that your conditional forwarder points to.
     *)

  remote_domain_name: string option;
  (** 
    The fully qualified domain name (FQDN) of the remote domains pointed to by the conditional forwarder.
     *)

}

(** 
    The result of a DescribeConditionalForwarder request.
     *)
type describe_conditional_forwarders_result = {
  conditional_forwarders: conditional_forwarder list option;
  (** 
    The list of conditional forwarders that have been created.
     *)

}

(** 
    Describes a conditional forwarder.
     *)
type describe_conditional_forwarders_request = {
  remote_domain_names: string list option;
  (** 
    The fully qualified domain names (FQDN) of the remote domains for which to get the list of associated conditional forwarders. If this member is null, all conditional forwarders are returned.
     *)

  directory_id: string;
  (** 
    The directory ID for which to get the list of associated conditional forwarders.
     *)

}

type client_authentication_status = | DISABLED
  | ENABLED

(** 
    Contains information about a client authentication method for a directory.
     *)
type client_authentication_setting_info = {
  last_updated_date_time: float option;
  (** 
    The date and time when the status of the client authentication type was last updated.
     *)

  status: client_authentication_status option;
  (** 
    Whether the client authentication type is enabled or disabled for the specified directory.
     *)

  type_: client_authentication_type option;
  (** 
    The type of client authentication for the specified directory. If no type is specified, a list of all client authentication types that are supported for the directory is retrieved.
     *)

}

type describe_client_authentication_settings_result = {
  next_token: string option;
  (** 
    The next token used to retrieve the client authentication settings if the number of setting types exceeds page limit and there is another page.
     *)

  client_authentication_settings_info: client_authentication_setting_info list option;
  (** 
    Information about the type of client authentication for the specified directory. The following information is retrieved: The date and time when the status of the client authentication type was last updated, whether the client authentication type is enabled or disabled, and the type of client authentication.
     *)

}

type describe_client_authentication_settings_request = {
  limit: int option;
  (** 
    The maximum number of items to return. If this value is zero, the maximum number of items is specified by the limitations of the operation.
     *)

  next_token: string option;
  (** 
    The {i DescribeClientAuthenticationSettingsResult.NextToken} value from a previous call to [DescribeClientAuthenticationSettings]. Pass null if this is the first call.
     *)

  type_: client_authentication_type option;
  (** 
    The type of client authentication for which to retrieve information. If no type is specified, a list of all client authentication types that are supported for the specified directory is retrieved.
     *)

  directory_id: string;
  (** 
    The identifier of the directory for which to retrieve information.
     *)

}

(** 
    The certificate is not present in the system for describe or deregister activities.
     *)
type certificate_does_not_exist_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    Information about the certificate.
     *)
type certificate = {
  client_cert_auth_settings: client_cert_auth_settings option;
  (** 
    A [ClientCertAuthSettings] object that contains client certificate authentication settings.
     *)

  type_: certificate_type option;
  (** 
    The function that the registered certificate performs. Valid values include [ClientLDAPS] or [ClientCertAuth]. The default value is [ClientLDAPS].
     *)

  expiry_date_time: float option;
  (** 
    The date and time when the certificate will expire.
     *)

  registered_date_time: float option;
  (** 
    The date and time that the certificate was registered.
     *)

  common_name: string option;
  (** 
    The common name for the certificate.
     *)

  state_reason: string option;
  (** 
    Describes a state change for the certificate.
     *)

  state: certificate_state option;
  (** 
    The state of the certificate.
     *)

  certificate_id: string option;
  (** 
    The identifier of the certificate.
     *)

}

type describe_certificate_result = {
  certificate: certificate option;
  (** 
    Information about the certificate, including registered date time, certificate state, the reason for the state, expiration date time, and certificate common name.
     *)

}

type describe_certificate_request = {
  certificate_id: string;
  (** 
    The identifier of the certificate.
     *)

  directory_id: string;
  (** 
    The identifier of the directory.
     *)

}

(** 
    The result of a DeregisterEventTopic request.
     *)
type deregister_event_topic_result = unit

(** 
    Removes the specified directory as a publisher to the specified Amazon SNS topic.
     *)
type deregister_event_topic_request = {
  topic_name: string;
  (** 
    The name of the Amazon SNS topic from which to remove the directory as a publisher.
     *)

  directory_id: string;
  (** 
    The Directory ID to remove as a publisher. This directory will no longer send messages to the specified Amazon SNS topic.
     *)

}

(** 
    The certificate is being used for the LDAP security connection and cannot be removed without disabling LDAP security.
     *)
type certificate_in_use_exception = {
  request_id: string option;
  
  message: string option;
  
}

type deregister_certificate_result = unit

type deregister_certificate_request = {
  certificate_id: string;
  (** 
    The identifier of the certificate.
     *)

  directory_id: string;
  (** 
    The identifier of the directory.
     *)

}

(** 
    The result of a DeleteTrust request.
     *)
type delete_trust_result = {
  trust_id: string option;
  (** 
    The Trust ID of the trust relationship that was deleted.
     *)

}

(** 
    Deletes the local side of an existing trust relationship between the Managed Microsoft AD directory and the external domain.
     *)
type delete_trust_request = {
  delete_associated_conditional_forwarder: bool option;
  (** 
    Delete a conditional forwarder as part of a DeleteTrustRequest.
     *)

  trust_id: string;
  (** 
    The Trust ID of the trust relationship to be deleted.
     *)

}

(** 
    Contains the results of the [DeleteSnapshot] operation.
     *)
type delete_snapshot_result = {
  snapshot_id: string option;
  (** 
    The identifier of the directory snapshot that was deleted.
     *)

}

(** 
    Contains the inputs for the [DeleteSnapshot] operation.
     *)
type delete_snapshot_request = {
  snapshot_id: string;
  (** 
    The identifier of the directory snapshot to be deleted.
     *)

}

type delete_log_subscription_result = unit

type delete_log_subscription_request = {
  directory_id: string;
  (** 
    Identifier of the directory whose log subscription you want to delete.
     *)

}

(** 
    Contains the results of the [DeleteDirectory] operation.
     *)
type delete_directory_result = {
  directory_id: string option;
  (** 
    The directory identifier.
     *)

}

(** 
    Contains the inputs for the [DeleteDirectory] operation.
     *)
type delete_directory_request = {
  directory_id: string;
  (** 
    The identifier of the directory to delete.
     *)

}

(** 
    The result of a DeleteConditionalForwarder request.
     *)
type delete_conditional_forwarder_result = unit

(** 
    Deletes a conditional forwarder.
     *)
type delete_conditional_forwarder_request = {
  remote_domain_name: string;
  (** 
    The fully qualified domain name (FQDN) of the remote domain with which you are deleting the conditional forwarder.
     *)

  directory_id: string;
  (** 
    The directory ID for which you are deleting the conditional forwarder.
     *)

}

(** 
    The result of a CreateTrust request.
     *)
type create_trust_result = {
  trust_id: string option;
  (** 
    A unique identifier for the trust relationship that was created.
     *)

}

(** 
    Directory Service for Microsoft Active Directory allows you to configure trust relationships. For example, you can establish a trust between your Managed Microsoft AD directory, and your existing self-managed Microsoft Active Directory. This would allow you to provide users and groups access to resources in either domain, with a single set of credentials.
    
     This action initiates the creation of the Amazon Web Services side of a trust relationship between an Managed Microsoft AD directory and an external domain.
      *)
type create_trust_request = {
  selective_auth: selective_auth option;
  (** 
    Optional parameter to enable selective authentication for the trust.
     *)

  conditional_forwarder_ip_addrs: string list option;
  (** 
    The IP addresses of the remote DNS server associated with RemoteDomainName.
     *)

  trust_type: trust_type option;
  (** 
    The trust relationship type. [Forest] is the default.
     *)

  trust_direction: trust_direction;
  (** 
    The direction of the trust relationship.
     *)

  trust_password: string;
  (** 
    The trust password. The must be the same password that was used when creating the trust relationship on the external domain.
     *)

  remote_domain_name: string;
  (** 
    The Fully Qualified Domain Name (FQDN) of the external domain for which to create the trust relationship.
     *)

  directory_id: string;
  (** 
    The Directory ID of the Managed Microsoft AD directory for which to establish the trust relationship.
     *)

}

(** 
    Contains the results of the [CreateSnapshot] operation.
     *)
type create_snapshot_result = {
  snapshot_id: string option;
  (** 
    The identifier of the snapshot that was created.
     *)

}

(** 
    Contains the inputs for the [CreateSnapshot] operation.
     *)
type create_snapshot_request = {
  name: string option;
  (** 
    The descriptive name to apply to the snapshot.
     *)

  directory_id: string;
  (** 
    The identifier of the directory of which to take a snapshot.
     *)

}

(** 
    The maximum number of directories in the region has been reached. You can use the [GetDirectoryLimits] operation to determine your directory limits in the region.
     *)
type directory_limit_exceeded_exception = {
  request_id: string option;
  
  message: string option;
  
}

(** 
    Result of a CreateMicrosoftAD request.
     *)
type create_microsoft_ad_result = {
  directory_id: string option;
  (** 
    The identifier of the directory that was created.
     *)

}

(** 
    Creates an Managed Microsoft AD directory.
     *)
type create_microsoft_ad_request = {
  tags: tag list option;
  (** 
    The tags to be assigned to the Managed Microsoft AD directory.
     *)

  edition: directory_edition option;
  (** 
    Managed Microsoft AD is available in two editions: [Standard] and [Enterprise]. [Enterprise] is the default.
     *)

  vpc_settings: directory_vpc_settings;
  (** 
    Contains VPC information for the [CreateDirectory] or [CreateMicrosoftAD] operation.
     *)

  description: string option;
  (** 
    A description for the directory. This label will appear on the Amazon Web Services console [Directory Details] page after the directory is created.
     *)

  password: string;
  (** 
    The password for the default administrative user named [Admin].
    
     If you need to change the password for the administrator account, you can use the [ResetUserPassword] API call.
      *)

  short_name: string option;
  (** 
    The NetBIOS name for your domain, such as [CORP]. If you don't specify a NetBIOS name, it will default to the first part of your directory DNS. For example, [CORP] for the directory DNS [corp.example.com].
     *)

  name: string;
  (** 
    The fully qualified domain name for the Managed Microsoft AD directory, such as [corp.example.com]. This name will resolve inside your VPC only. It does not need to be publicly resolvable.
     *)

}

type create_log_subscription_result = unit

type create_log_subscription_request = {
  log_group_name: string;
  (** 
    The name of the CloudWatch log group where the real-time domain controller logs are forwarded.
     *)

  directory_id: string;
  (** 
    Identifier of the directory to which you want to subscribe and receive real-time logs to your specified CloudWatch log group.
     *)

}

(** 
    Contains the results of the [CreateDirectory] operation.
     *)
type create_directory_result = {
  directory_id: string option;
  (** 
    The identifier of the directory that was created.
     *)

}

(** 
    Contains the inputs for the [CreateDirectory] operation.
     *)
type create_directory_request = {
  tags: tag list option;
  (** 
    The tags to be assigned to the Simple AD directory.
     *)

  vpc_settings: directory_vpc_settings option;
  (** 
    A [DirectoryVpcSettings] object that contains additional information for the operation.
     *)

  size: directory_size;
  (** 
    The size of the directory.
     *)

  description: string option;
  (** 
    A description for the directory.
     *)

  password: string;
  (** 
    The password for the directory administrator. The directory creation process creates a directory administrator account with the user name [Administrator] and this password.
    
     If you need to change the password for the administrator account, you can use the [ResetUserPassword] API call.
     
      The regex pattern for this string is made up of the following conditions:
      
       {ul
            {- Length (?=^.{8,64}$) – Must be between 8 and 64 characters
               
               }
            
      }
       AND any 3 of the following password complexity rules required by Active Directory:
       
        {ul
             {- Numbers and upper case and lowercase (?=.*\d)(?=.*[A-Z])(?=.*[a-z])
                
                }
              {- Numbers and special characters and lower case (?=.*\d)(?=.*[^A-Za-z0-9\s])(?=.*[a-z])
                 
                 }
              {- Special characters and upper case and lower case (?=.*[^A-Za-z0-9\s])(?=.*[A-Z])(?=.*[a-z])
                 
                 }
              {- Numbers and upper case and special characters (?=.*\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9\s])
                 
                 }
             
      }
       For additional information about how Active Directory passwords are enforced, see {{:https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/password-must-meet-complexity-requirements}Password must meet complexity requirements} on the Microsoft website.
        *)

  short_name: string option;
  (** 
    The NetBIOS name of the directory, such as [CORP].
     *)

  name: string;
  (** 
    The fully qualified name for the directory, such as [corp.example.com].
     *)

}

(** 
    The result of a CreateConditinalForwarder request.
     *)
type create_conditional_forwarder_result = unit

(** 
    Initiates the creation of a conditional forwarder for your Directory Service for Microsoft Active Directory. Conditional forwarders are required in order to set up a trust relationship with another domain.
     *)
type create_conditional_forwarder_request = {
  dns_ip_addrs: string list;
  (** 
    The IP addresses of the remote DNS server associated with RemoteDomainName.
     *)

  remote_domain_name: string;
  (** 
    The fully qualified domain name (FQDN) of the remote domain with which you will set up a trust relationship.
     *)

  directory_id: string;
  (** 
    The directory ID of the Amazon Web Services directory for which you are creating the conditional forwarder.
     *)

}

(** 
    Represents a named directory attribute.
     *)
type attribute = {
  value: string option;
  (** 
    The value of the attribute.
     *)

  name: string option;
  (** 
    The name of the attribute.
     *)

}

(** 
    Contains information about a computer account in a directory.
     *)
type computer = {
  computer_attributes: attribute list option;
  (** 
    An array of [Attribute] objects containing the LDAP attributes that belong to the computer account.
     *)

  computer_name: string option;
  (** 
    The computer name.
     *)

  computer_id: string option;
  (** 
    The identifier of the computer.
     *)

}

(** 
    Contains the results for the [CreateComputer] operation.
     *)
type create_computer_result = {
  computer: computer option;
  (** 
    A [Computer] object that represents the computer account.
     *)

}

(** 
    Contains the inputs for the [CreateComputer] operation.
     *)
type create_computer_request = {
  computer_attributes: attribute list option;
  (** 
    An array of [Attribute] objects that contain any LDAP attributes to apply to the computer account.
     *)

  organizational_unit_distinguished_name: string option;
  (** 
    The fully-qualified distinguished name of the organizational unit to place the computer account in.
     *)

  password: string;
  (** 
    A one-time password that is used to join the computer to the directory. You should generate a random, strong password to use for this parameter.
     *)

  computer_name: string;
  (** 
    The name of the computer account.
     *)

  directory_id: string;
  (** 
    The identifier of the directory in which to create the computer account.
     *)

}

(** 
    Contains the results of the [CreateAlias] operation.
     *)
type create_alias_result = {
  alias: string option;
  (** 
    The alias for the directory.
     *)

  directory_id: string option;
  (** 
    The identifier of the directory.
     *)

}

(** 
    Contains the inputs for the [CreateAlias] operation.
     *)
type create_alias_request = {
  alias: string;
  (** 
    The requested alias.
    
     The alias must be unique amongst all aliases in Amazon Web Services. This operation throws an [EntityAlreadyExistsException] error if the alias already exists.
      *)

  directory_id: string;
  (** 
    The identifier of the directory for which to create the alias.
     *)

}

(** 
    Contains the results of the [ConnectDirectory] operation.
     *)
type connect_directory_result = {
  directory_id: string option;
  (** 
    The identifier of the new directory.
     *)

}

(** 
    Contains information for the [ConnectDirectory] operation when an AD Connector directory is being created.
     *)
type directory_connect_settings = {
  customer_user_name: string;
  (** 
    The user name of an account in your self-managed directory that is used to connect to the directory. This account must have the following permissions:
    
     {ul
          {- Read users and groups
             
             }
           {- Create computer objects
              
              }
           {- Join computers to the domain
              
              }
          
      }
       *)

  customer_dns_ips: string list;
  (** 
    A list of one or more IP addresses of DNS servers or domain controllers in your self-managed directory.
     *)

  subnet_ids: string list;
  (** 
    A list of subnet identifiers in the VPC in which the AD Connector is created.
     *)

  vpc_id: string;
  (** 
    The identifier of the VPC in which the AD Connector is created.
     *)

}

(** 
    Contains the inputs for the [ConnectDirectory] operation.
     *)
type connect_directory_request = {
  tags: tag list option;
  (** 
    The tags to be assigned to AD Connector.
     *)

  connect_settings: directory_connect_settings;
  (** 
    A [DirectoryConnectSettings] object that contains additional information for the operation.
     *)

  size: directory_size;
  (** 
    The size of the directory.
     *)

  description: string option;
  (** 
    A description for the directory.
     *)

  password: string;
  (** 
    The password for your self-managed user account.
     *)

  short_name: string option;
  (** 
    The NetBIOS name of your self-managed directory, such as [CORP].
     *)

  name: string;
  (** 
    The fully qualified name of your self-managed directory, such as [corp.example.com].
     *)

}

type cancel_schema_extension_result = unit

type cancel_schema_extension_request = {
  schema_extension_id: string;
  (** 
    The identifier of the schema extension that will be canceled.
     *)

  directory_id: string;
  (** 
    The identifier of the directory whose schema extension will be canceled.
     *)

}

type add_tags_to_resource_result = unit

type add_tags_to_resource_request = {
  tags: tag list;
  (** 
    The tags to be assigned to the directory.
     *)

  resource_id: string;
  (** 
    Identifier (ID) for the directory to which to add the tag.
     *)

}

(** 
    The Region you specified is the same Region where the Managed Microsoft AD directory was created. Specify a different Region and try again.
     *)
type directory_already_in_region_exception = {
  request_id: string option;
  
  message: string option;
  
}

type add_region_result = unit

type add_region_request = {
  vpc_settings: directory_vpc_settings;
  
  region_name: string;
  (** 
    The name of the Region where you want to add domain controllers for replication. For example, [us-east-1].
     *)

  directory_id: string;
  (** 
    The identifier of the directory to which you want to add Region replication.
     *)

}

type add_ip_routes_result = unit

type add_ip_routes_request = {
  update_security_group_for_directory_controllers: bool option;
  [@ocaml.doc {| 
    If set to true, updates the inbound and outbound rules of the security group that has the description: "Amazon Web Services created security group for {i directory ID} directory controllers." Following are the new rules:
    
     Inbound:
     
      {ul
           {- Type: Custom UDP Rule, Protocol: UDP, Range: 88, Source: 0.0.0.0/0
              
              }
            {- Type: Custom UDP Rule, Protocol: UDP, Range: 123, Source: 0.0.0.0/0
               
               }
            {- Type: Custom UDP Rule, Protocol: UDP, Range: 138, Source: 0.0.0.0/0
               
               }
            {- Type: Custom UDP Rule, Protocol: UDP, Range: 389, Source: 0.0.0.0/0
               
               }
            {- Type: Custom UDP Rule, Protocol: UDP, Range: 464, Source: 0.0.0.0/0
               
               }
            {- Type: Custom UDP Rule, Protocol: UDP, Range: 445, Source: 0.0.0.0/0
               
               }
            {- Type: Custom TCP Rule, Protocol: TCP, Range: 88, Source: 0.0.0.0/0
               
               }
            {- Type: Custom TCP Rule, Protocol: TCP, Range: 135, Source: 0.0.0.0/0
               
               }
            {- Type: Custom TCP Rule, Protocol: TCP, Range: 445, Source: 0.0.0.0/0
               
               }
            {- Type: Custom TCP Rule, Protocol: TCP, Range: 464, Source: 0.0.0.0/0
               
               }
            {- Type: Custom TCP Rule, Protocol: TCP, Range: 636, Source: 0.0.0.0/0
               
               }
            {- Type: Custom TCP Rule, Protocol: TCP, Range: 1024-65535, Source: 0.0.0.0/0
               
               }
            {- Type: Custom TCP Rule, Protocol: TCP, Range: 3268-33269, Source: 0.0.0.0/0
               
               }
            {- Type: DNS (UDP), Protocol: UDP, Range: 53, Source: 0.0.0.0/0
               
               }
            {- Type: DNS (TCP), Protocol: TCP, Range: 53, Source: 0.0.0.0/0
               
               }
            {- Type: LDAP, Protocol: TCP, Range: 389, Source: 0.0.0.0/0
               
               }
            {- Type: All ICMP, Protocol: All, Range: N/A, Source: 0.0.0.0/0
               
               }
           
      }
       
       
        Outbound:
        
         {ul
              {- Type: All traffic, Protocol: All, Range: All, Destination: 0.0.0.0/0
                 
                 }
              
      }
       These security rules impact an internal network interface that is not exposed publicly.
        |}]

  ip_routes: ip_route list;
  (** 
    IP address blocks, using CIDR format, of the traffic to route. This is often the IP address block of the DNS server used for your self-managed domain.
     *)

  directory_id: string;
  (** 
    Identifier (ID) of the directory to which to add the address block.
     *)

}

type accept_shared_directory_result = {
  shared_directory: shared_directory option;
  (** 
    The shared directory in the directory consumer account.
     *)

}

type accept_shared_directory_request = {
  shared_directory_id: string;
  (** 
    Identifier of the shared directory in the directory consumer account. This identifier is different for each directory owner account.
     *)

}

(** 
    Directory Service Directory Service is a web service that makes it easy for you to setup and run directories in the Amazon Web Services cloud, or connect your Amazon Web Services resources with an existing self-managed Microsoft Active Directory. This guide provides detailed information about Directory Service operations, data types, parameters, and errors. For information about Directory Services features, see {{:https://aws.amazon.com/directoryservice/}Directory Service} and the {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/what_is.html}Directory Service Administration Guide}.
                      
                       Amazon Web Services provides SDKs that consist of libraries and sample code for various programming languages and platforms (Java, Ruby, .Net, iOS, Android, etc.). The SDKs provide a convenient way to create programmatic access to Directory Service and other Amazon Web Services services. For more information about the Amazon Web Services SDKs, including how to download and install them, see {{:http://aws.amazon.com/tools/}Tools for Amazon Web Services}.
                       
                        *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_verify_trust_request : trust_id:string -> unit
-> verify_trust_request

val make_os_update_settings : ?os_version:os_version -> unit
-> os_update_settings

val make_update_value : ?os_update_settings:os_update_settings -> unit
-> update_value

val make_update_trust_request :
  ?selective_auth:selective_auth -> trust_id:string -> unit
-> update_trust_request

val make_setting : value:string -> name:string -> unit
-> setting

val make_update_settings_request :
  settings:setting list -> directory_id:string -> unit
-> update_settings_request

val make_radius_settings :
  ?use_same_username:bool ->
  ?display_label:string ->
  ?authentication_protocol:radius_authentication_protocol ->
  ?shared_secret:string ->
  ?radius_retries:int ->
  ?radius_timeout:int ->
  ?radius_port:int ->
  ?radius_servers:string list ->
  unit -> radius_settings

val make_update_radius_request :
  radius_settings:radius_settings -> directory_id:string -> unit
-> update_radius_request

val make_update_number_of_domain_controllers_request :
  desired_number:int -> directory_id:string -> unit
-> update_number_of_domain_controllers_request

val make_update_info_entry :
  ?last_updated_date_time:float ->
  ?start_time:float ->
  ?previous_value:update_value ->
  ?new_value:update_value ->
  ?initiated_by:string ->
  ?status_reason:string ->
  ?status:update_status ->
  ?region:string ->
  unit -> update_info_entry

val make_update_directory_setup_request :
  ?create_snapshot_before_update:bool ->
  ?os_update_settings:os_update_settings ->
  update_type:update_type ->
  directory_id:string ->
  unit
-> update_directory_setup_request

val make_update_conditional_forwarder_request :
  dns_ip_addrs:string list ->
  remote_domain_name:string ->
  directory_id:string ->
  unit -> update_conditional_forwarder_request

val make_unshare_target : type_:target_type -> id:string -> unit
-> unshare_target

val make_unshare_directory_request :
  unshare_target:unshare_target -> directory_id:string -> unit
-> unshare_directory_request

val make_trust :
  ?selective_auth:selective_auth ->
  ?trust_state_reason:string ->
  ?state_last_updated_date_time:float ->
  ?last_updated_date_time:float ->
  ?created_date_time:float ->
  ?trust_state:trust_state ->
  ?trust_direction:trust_direction ->
  ?trust_type:trust_type ->
  ?remote_domain_name:string ->
  ?trust_id:string ->
  ?directory_id:string ->
  unit -> trust

val make_tag : value:string -> key:string -> unit
-> tag

val make_start_schema_extension_request :
  description:string ->
  ldif_content:string ->
  create_snapshot_before_schema_extension:bool ->
  directory_id:string ->
  unit -> start_schema_extension_request

val make_snapshot :
  ?start_time:float ->
  ?status:snapshot_status ->
  ?name:string ->
  ?type_:snapshot_type ->
  ?snapshot_id:string ->
  ?directory_id:string ->
  unit -> snapshot

val make_snapshot_limits :
  ?manual_snapshots_limit_reached:bool ->
  ?manual_snapshots_current_count:int ->
  ?manual_snapshots_limit:int ->
  unit -> snapshot_limits

val make_shared_directory :
  ?last_updated_date_time:float ->
  ?created_date_time:float ->
  ?share_notes:string ->
  ?share_status:share_status ->
  ?shared_directory_id:string ->
  ?shared_account_id:string ->
  ?share_method:share_method ->
  ?owner_directory_id:string ->
  ?owner_account_id:string ->
  unit -> shared_directory

val make_share_target : type_:target_type -> id:string -> unit
-> share_target

val make_share_directory_request :
  ?share_notes:string ->
  share_method:share_method ->
  share_target:share_target ->
  directory_id:string ->
  unit -> share_directory_request

val make_setting_entry :
  ?data_type:string ->
  ?last_requested_date_time:float ->
  ?last_updated_date_time:float ->
  ?request_status_message:string ->
  ?request_detailed_status:(string * directory_configuration_status) list ->
  ?request_status:directory_configuration_status ->
  ?requested_value:string ->
  ?applied_value:string ->
  ?allowed_values:string ->
  ?name:string ->
  ?type_:string ->
  unit -> setting_entry

val make_schema_extension_info :
  ?end_date_time:float ->
  ?start_date_time:float ->
  ?schema_extension_status_reason:string ->
  ?schema_extension_status:schema_extension_status ->
  ?description:string ->
  ?schema_extension_id:string ->
  ?directory_id:string ->
  unit -> schema_extension_info

val make_restore_from_snapshot_request : snapshot_id:string -> unit
-> restore_from_snapshot_request

val make_reset_user_password_request :
  new_password:string -> user_name:string -> directory_id:string -> unit
-> reset_user_password_request

val make_remove_tags_from_resource_request :
  tag_keys:string list -> resource_id:string -> unit
-> remove_tags_from_resource_request

val make_remove_region_request : directory_id:string -> unit
-> remove_region_request

val make_remove_ip_routes_request :
  cidr_ips:string list -> directory_id:string -> unit
-> remove_ip_routes_request

val make_reject_shared_directory_request : shared_directory_id:string -> unit
-> reject_shared_directory_request

val make_register_event_topic_request :
  topic_name:string -> directory_id:string -> unit
-> register_event_topic_request

val make_client_cert_auth_settings : ?ocsp_url:string -> unit
-> client_cert_auth_settings

val make_register_certificate_request :
  ?client_cert_auth_settings:client_cert_auth_settings ->
  ?type_:certificate_type ->
  certificate_data:string ->
  directory_id:string ->
  unit -> register_certificate_request

val make_regions_info :
  ?additional_regions:string list -> ?primary_region:string -> unit
-> regions_info

val make_directory_vpc_settings :
  subnet_ids:string list -> vpc_id:string -> unit
-> directory_vpc_settings

val make_region_description :
  ?last_updated_date_time:float ->
  ?status_last_updated_date_time:float ->
  ?launch_time:float ->
  ?desired_number_of_domain_controllers:int ->
  ?vpc_settings:directory_vpc_settings ->
  ?status:directory_stage ->
  ?region_type:region_type ->
  ?region_name:string ->
  ?directory_id:string ->
  unit -> region_description

val make_directory_vpc_settings_description :
  ?availability_zones:string list ->
  ?security_group_id:string ->
  ?subnet_ids:string list ->
  ?vpc_id:string ->
  unit
-> directory_vpc_settings_description

val make_owner_directory_description :
  ?radius_status:radius_status ->
  ?radius_settings:radius_settings ->
  ?vpc_settings:directory_vpc_settings_description ->
  ?dns_ip_addrs:string list ->
  ?account_id:string ->
  ?directory_id:string ->
  unit -> owner_directory_description

val make_log_subscription :
  ?subscription_created_date_time:float ->
  ?log_group_name:string ->
  ?directory_id:string ->
  unit -> log_subscription

val make_list_tags_for_resource_request :
  ?limit:int -> ?next_token:string -> resource_id:string -> unit
-> list_tags_for_resource_request

val make_list_schema_extensions_request :
  ?limit:int -> ?next_token:string -> directory_id:string -> unit
-> list_schema_extensions_request

val make_list_log_subscriptions_request :
  ?limit:int -> ?next_token:string -> ?directory_id:string -> unit
-> list_log_subscriptions_request

val make_ip_route_info :
  ?description:string ->
  ?ip_route_status_reason:string ->
  ?added_date_time:float ->
  ?ip_route_status_msg:ip_route_status_msg ->
  ?cidr_ip:string ->
  ?directory_id:string ->
  unit -> ip_route_info

val make_list_ip_routes_request :
  ?limit:int -> ?next_token:string -> directory_id:string -> unit
-> list_ip_routes_request

val make_certificate_info :
  ?type_:certificate_type ->
  ?expiry_date_time:float ->
  ?state:certificate_state ->
  ?common_name:string ->
  ?certificate_id:string ->
  unit -> certificate_info

val make_list_certificates_request :
  ?limit:int -> ?next_token:string -> directory_id:string -> unit
-> list_certificates_request

val make_ldaps_setting_info :
  ?last_updated_date_time:float ->
  ?ldaps_status_reason:string ->
  ?ldaps_status:ldaps_status ->
  unit -> ldaps_setting_info

val make_ip_route : ?description:string -> ?cidr_ip:string -> unit
-> ip_route

val make_get_snapshot_limits_request : directory_id:string -> unit
-> get_snapshot_limits_request

val make_directory_limits :
  ?connected_directories_limit_reached:bool ->
  ?connected_directories_current_count:int ->
  ?connected_directories_limit:int ->
  ?cloud_only_microsoft_ad_limit_reached:bool ->
  ?cloud_only_microsoft_ad_current_count:int ->
  ?cloud_only_microsoft_ad_limit:int ->
  ?cloud_only_directories_limit_reached:bool ->
  ?cloud_only_directories_current_count:int ->
  ?cloud_only_directories_limit:int ->
  unit -> directory_limits

val make_get_directory_limits_request : unit
-> get_directory_limits_request

val make_event_topic :
  ?status:topic_status ->
  ?created_date_time:float ->
  ?topic_arn:string ->
  ?topic_name:string ->
  ?directory_id:string ->
  unit -> event_topic

val make_enable_sso_request :
  ?password:string -> ?user_name:string -> directory_id:string -> unit
-> enable_sso_request

val make_enable_radius_request :
  radius_settings:radius_settings -> directory_id:string -> unit
-> enable_radius_request

val make_enable_ldaps_request :
  type_:ldaps_type -> directory_id:string -> unit
-> enable_ldaps_request

val make_enable_client_authentication_request :
  type_:client_authentication_type -> directory_id:string -> unit
-> enable_client_authentication_request

val make_domain_controller :
  ?status_last_updated_date_time:float ->
  ?launch_time:float ->
  ?status_reason:string ->
  ?status:domain_controller_status ->
  ?availability_zone:string ->
  ?subnet_id:string ->
  ?vpc_id:string ->
  ?dns_ip_addr:string ->
  ?domain_controller_id:string ->
  ?directory_id:string ->
  unit -> domain_controller

val make_disable_sso_request :
  ?password:string -> ?user_name:string -> directory_id:string -> unit
-> disable_sso_request

val make_disable_radius_request : directory_id:string -> unit
-> disable_radius_request

val make_disable_ldaps_request :
  type_:ldaps_type -> directory_id:string -> unit
-> disable_ldaps_request

val make_disable_client_authentication_request :
  type_:client_authentication_type -> directory_id:string -> unit
-> disable_client_authentication_request

val make_describe_update_directory_request :
  ?next_token:string ->
  ?region_name:string ->
  update_type:update_type ->
  directory_id:string ->
  unit -> describe_update_directory_request

val make_describe_trusts_request :
  ?limit:int ->
  ?next_token:string ->
  ?trust_ids:string list ->
  ?directory_id:string ->
  unit -> describe_trusts_request

val make_describe_snapshots_request :
  ?limit:int ->
  ?next_token:string ->
  ?snapshot_ids:string list ->
  ?directory_id:string ->
  unit
-> describe_snapshots_request

val make_describe_shared_directories_request :
  ?limit:int ->
  ?next_token:string ->
  ?shared_directory_ids:string list ->
  owner_directory_id:string ->
  unit
-> describe_shared_directories_request

val make_describe_settings_request :
  ?next_token:string ->
  ?status:directory_configuration_status ->
  directory_id:string ->
  unit -> describe_settings_request

val make_describe_regions_request :
  ?next_token:string -> ?region_name:string -> directory_id:string -> unit
-> describe_regions_request

val make_describe_ldaps_settings_request :
  ?limit:int ->
  ?next_token:string ->
  ?type_:ldaps_type ->
  directory_id:string ->
  unit
-> describe_ldaps_settings_request

val make_describe_event_topics_request :
  ?topic_names:string list -> ?directory_id:string -> unit
-> describe_event_topics_request

val make_describe_domain_controllers_request :
  ?limit:int ->
  ?next_token:string ->
  ?domain_controller_ids:string list ->
  directory_id:string ->
  unit
-> describe_domain_controllers_request

val make_directory_connect_settings_description :
  ?connect_ips:string list ->
  ?availability_zones:string list ->
  ?security_group_id:string ->
  ?customer_user_name:string ->
  ?subnet_ids:string list ->
  ?vpc_id:string ->
  unit
-> directory_connect_settings_description

val make_directory_description :
  ?os_version:os_version ->
  ?regions_info:regions_info ->
  ?owner_directory_description:owner_directory_description ->
  ?desired_number_of_domain_controllers:int ->
  ?sso_enabled:bool ->
  ?stage_reason:string ->
  ?radius_status:radius_status ->
  ?radius_settings:radius_settings ->
  ?connect_settings:directory_connect_settings_description ->
  ?vpc_settings:directory_vpc_settings_description ->
  ?type_:directory_type ->
  ?stage_last_updated_date_time:float ->
  ?launch_time:float ->
  ?share_notes:string ->
  ?share_method:share_method ->
  ?share_status:share_status ->
  ?stage:directory_stage ->
  ?dns_ip_addrs:string list ->
  ?description:string ->
  ?access_url:string ->
  ?alias:string ->
  ?edition:directory_edition ->
  ?size:directory_size ->
  ?short_name:string ->
  ?name:string ->
  ?directory_id:string ->
  unit -> directory_description

val make_describe_directories_request :
  ?limit:int -> ?next_token:string -> ?directory_ids:string list -> unit
-> describe_directories_request

val make_conditional_forwarder :
  ?replication_scope:replication_scope ->
  ?dns_ip_addrs:string list ->
  ?remote_domain_name:string ->
  unit
-> conditional_forwarder

val make_describe_conditional_forwarders_request :
  ?remote_domain_names:string list -> directory_id:string -> unit
-> describe_conditional_forwarders_request

val make_client_authentication_setting_info :
  ?last_updated_date_time:float ->
  ?status:client_authentication_status ->
  ?type_:client_authentication_type ->
  unit
-> client_authentication_setting_info

val make_describe_client_authentication_settings_request :
  ?limit:int ->
  ?next_token:string ->
  ?type_:client_authentication_type ->
  directory_id:string ->
  unit
-> describe_client_authentication_settings_request

val make_certificate :
  ?client_cert_auth_settings:client_cert_auth_settings ->
  ?type_:certificate_type ->
  ?expiry_date_time:float ->
  ?registered_date_time:float ->
  ?common_name:string ->
  ?state_reason:string ->
  ?state:certificate_state ->
  ?certificate_id:string ->
  unit -> certificate

val make_describe_certificate_request :
  certificate_id:string -> directory_id:string -> unit
-> describe_certificate_request

val make_deregister_event_topic_request :
  topic_name:string -> directory_id:string -> unit
-> deregister_event_topic_request

val make_deregister_certificate_request :
  certificate_id:string -> directory_id:string -> unit
-> deregister_certificate_request

val make_delete_trust_request :
  ?delete_associated_conditional_forwarder:bool -> trust_id:string -> unit
-> delete_trust_request

val make_delete_snapshot_request : snapshot_id:string -> unit
-> delete_snapshot_request

val make_delete_log_subscription_request : directory_id:string -> unit
-> delete_log_subscription_request

val make_delete_directory_request : directory_id:string -> unit
-> delete_directory_request

val make_delete_conditional_forwarder_request :
  remote_domain_name:string -> directory_id:string -> unit
-> delete_conditional_forwarder_request

val make_create_trust_request :
  ?selective_auth:selective_auth ->
  ?conditional_forwarder_ip_addrs:string list ->
  ?trust_type:trust_type ->
  trust_direction:trust_direction ->
  trust_password:string ->
  remote_domain_name:string ->
  directory_id:string ->
  unit -> create_trust_request

val make_create_snapshot_request :
  ?name:string -> directory_id:string -> unit
-> create_snapshot_request

val make_create_microsoft_ad_request :
  ?tags:tag list ->
  ?edition:directory_edition ->
  ?description:string ->
  ?short_name:string ->
  vpc_settings:directory_vpc_settings ->
  password:string ->
  name:string ->
  unit
-> create_microsoft_ad_request

val make_create_log_subscription_request :
  log_group_name:string -> directory_id:string -> unit
-> create_log_subscription_request

val make_create_directory_request :
  ?tags:tag list ->
  ?vpc_settings:directory_vpc_settings ->
  ?description:string ->
  ?short_name:string ->
  size:directory_size ->
  password:string ->
  name:string ->
  unit
-> create_directory_request

val make_create_conditional_forwarder_request :
  dns_ip_addrs:string list ->
  remote_domain_name:string ->
  directory_id:string ->
  unit -> create_conditional_forwarder_request

val make_attribute : ?value:string -> ?name:string -> unit
-> attribute

val make_computer :
  ?computer_attributes:attribute list ->
  ?computer_name:string ->
  ?computer_id:string ->
  unit -> computer

val make_create_computer_request :
  ?computer_attributes:attribute list ->
  ?organizational_unit_distinguished_name:string ->
  password:string ->
  computer_name:string ->
  directory_id:string ->
  unit -> create_computer_request

val make_create_alias_request : alias:string -> directory_id:string -> unit
-> create_alias_request

val make_directory_connect_settings :
  customer_user_name:string ->
  customer_dns_ips:string list ->
  subnet_ids:string list ->
  vpc_id:string ->
  unit -> directory_connect_settings

val make_connect_directory_request :
  ?tags:tag list ->
  ?description:string ->
  ?short_name:string ->
  connect_settings:directory_connect_settings ->
  size:directory_size ->
  password:string ->
  name:string ->
  unit -> connect_directory_request

val make_cancel_schema_extension_request :
  schema_extension_id:string -> directory_id:string -> unit
-> cancel_schema_extension_request

val make_add_tags_to_resource_request :
  tags:tag list -> resource_id:string -> unit
-> add_tags_to_resource_request

val make_add_region_request :
  vpc_settings:directory_vpc_settings ->
  region_name:string ->
  directory_id:string ->
  unit -> add_region_request

val make_add_ip_routes_request :
  ?update_security_group_for_directory_controllers:bool ->
  ip_routes:ip_route list ->
  directory_id:string ->
  unit -> add_ip_routes_request

val make_accept_shared_directory_request : shared_directory_id:string -> unit
-> accept_shared_directory_request

(** {1:operations Operations} *)

module AcceptSharedDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      accept_shared_directory_request ->
        (accept_shared_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module AddIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      add_ip_routes_request ->
        (add_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `IpRouteLimitExceededException of ip_route_limit_exceeded_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module AddRegion : sig
  val request :
    Smaws_Lib.Context.t ->
      add_region_request ->
        (add_region_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryAlreadyInRegionException of directory_already_in_region_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `RegionLimitExceededException of region_limit_exceeded_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module AddTagsToResource : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_resource_request ->
        (add_tags_to_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `TagLimitExceededException of tag_limit_exceeded_exception
            
        ]
      ) result
end

module CancelSchemaExtension : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_schema_extension_request ->
        (cancel_schema_extension_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ConnectDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      connect_directory_request ->
        (connect_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module CreateAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_alias_request ->
        (create_alias_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module CreateComputer : sig
  val request :
    Smaws_Lib.Context.t ->
      create_computer_request ->
        (create_computer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      create_conditional_forwarder_request ->
        (create_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      create_directory_request ->
        (create_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module CreateLogSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      create_log_subscription_request ->
        (create_log_subscription_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateMicrosoftAD : sig
  val request :
    Smaws_Lib.Context.t ->
      create_microsoft_ad_request ->
        (create_microsoft_ad_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module CreateSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_snapshot_request ->
        (create_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            
        ]
      ) result
end

module CreateTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      create_trust_request ->
        (create_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_conditional_forwarder_request ->
        (delete_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_directory_request ->
        (delete_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DeleteLogSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_log_subscription_request ->
        (delete_log_subscription_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeleteSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_snapshot_request ->
        (delete_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DeleteTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_trust_request ->
        (delete_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeregisterCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_certificate_request ->
        (deregister_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateDoesNotExistException of certificate_does_not_exist_exception
            | `CertificateInUseException of certificate_in_use_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DeregisterEventTopic : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_event_topic_request ->
        (deregister_event_topic_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_certificate_request ->
        (describe_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateDoesNotExistException of certificate_does_not_exist_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeClientAuthenticationSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_client_authentication_settings_request ->
        (describe_client_authentication_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeConditionalForwarders : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conditional_forwarders_request ->
        (describe_conditional_forwarders_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeDirectories : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_directories_request ->
        (describe_directories_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeDomainControllers : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_domain_controllers_request ->
        (describe_domain_controllers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeEventTopics : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_topics_request ->
        (describe_event_topics_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeLDAPSSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_ldaps_settings_request ->
        (describe_ldaps_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeRegions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_regions_request ->
        (describe_regions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_settings_request ->
        (describe_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeSharedDirectories : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_shared_directories_request ->
        (describe_shared_directories_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_snapshots_request ->
        (describe_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DescribeTrusts : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_trusts_request ->
        (describe_trusts_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DescribeUpdateDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_update_directory_request ->
        (describe_update_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DisableClientAuthentication : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_client_authentication_request ->
        (disable_client_authentication_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DisableLDAPS : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_ldaps_request ->
        (disable_ldaps_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module DisableRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_radius_request ->
        (disable_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module DisableSso : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_sso_request ->
        (disable_sso_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module EnableClientAuthentication : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_client_authentication_request ->
        (enable_client_authentication_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
            | `NoAvailableCertificateException of no_available_certificate_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module EnableLDAPS : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_ldaps_request ->
        (enable_ldaps_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoAvailableCertificateException of no_available_certificate_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module EnableRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_radius_request ->
        (enable_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module EnableSso : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_sso_request ->
        (enable_sso_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module GetDirectoryLimits : sig
  val request :
    Smaws_Lib.Context.t ->
      get_directory_limits_request ->
        (get_directory_limits_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module GetSnapshotLimits : sig
  val request :
    Smaws_Lib.Context.t ->
      get_snapshot_limits_request ->
        (get_snapshot_limits_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_certificates_request ->
        (list_certificates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module ListIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ip_routes_request ->
        (list_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListLogSubscriptions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_log_subscriptions_request ->
        (list_log_subscriptions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListSchemaExtensions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_schema_extensions_request ->
        (list_schema_extensions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RegisterCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      register_certificate_request ->
        (register_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateAlreadyExistsException of certificate_already_exists_exception
            | `CertificateLimitExceededException of certificate_limit_exceeded_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidCertificateException of invalid_certificate_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module RegisterEventTopic : sig
  val request :
    Smaws_Lib.Context.t ->
      register_event_topic_request ->
        (register_event_topic_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RejectSharedDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      reject_shared_directory_request ->
        (reject_shared_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RemoveIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_ip_routes_request ->
        (remove_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module RemoveRegion : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_region_request ->
        (remove_region_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module RemoveTagsFromResource : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_resource_request ->
        (remove_tags_from_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ResetUserPassword : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_user_password_request ->
        (reset_user_password_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidPasswordException of invalid_password_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            | `UserDoesNotExistException of user_does_not_exist_exception
            
        ]
      ) result
end

module RestoreFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_from_snapshot_request ->
        (restore_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module ShareDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      share_directory_request ->
        (share_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTargetException of invalid_target_exception
            | `OrganizationsException of organizations_exception
            | `ServiceException of service_exception
            | `ShareLimitExceededException of share_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module StartSchemaExtension : sig
  val request :
    Smaws_Lib.Context.t ->
      start_schema_extension_request ->
        (start_schema_extension_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            
        ]
      ) result
end

module UnshareDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      unshare_directory_request ->
        (unshare_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryNotSharedException of directory_not_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidTargetException of invalid_target_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module UpdateConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      update_conditional_forwarder_request ->
        (update_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateDirectorySetup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_directory_setup_request ->
        (update_directory_setup_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryInDesiredStateException of directory_in_desired_state_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateNumberOfDomainControllers : sig
  val request :
    Smaws_Lib.Context.t ->
      update_number_of_domain_controllers_request ->
        (update_number_of_domain_controllers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `DomainControllerLimitExceededException of domain_controller_limit_exceeded_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

module UpdateRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      update_radius_request ->
        (update_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module UpdateSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_settings_request ->
        (update_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `IncompatibleSettingsException of incompatible_settings_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            | `UnsupportedSettingsException of unsupported_settings_exception
            
        ]
      ) result
end

module UpdateTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      update_trust_request ->
        (update_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
end

module VerifyTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      verify_trust_request ->
        (verify_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
end

