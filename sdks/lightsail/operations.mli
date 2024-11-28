open Types 
module AllocateStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      allocate_static_ip_request ->
        (allocate_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Allocates a static IP address.
     *)

  
end

module AttachCertificateToDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_certificate_to_distribution_request ->
        (attach_certificate_to_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Attaches an SSL/TLS certificate to your Amazon Lightsail content delivery network (CDN) distribution.
    
     After the certificate is attached, your distribution accepts HTTPS traffic for all of the domains that are associated with the certificate.
     
      Use the [CreateCertificate] action to create a certificate that you can attach to your distribution.
      
       Only certificates created in the [us-east-1] Amazon Web Services Region can be attached to Lightsail distributions. Lightsail distributions are global resources that can reference an origin in any Amazon Web Services Region, and distribute its content globally. However, all distributions are located in the [us-east-1] Region.
       
        *)

  
end

module AttachDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_disk_request ->
        (attach_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Attaches a block storage disk to a running or stopped Lightsail instance and exposes it to the instance with the specified disk name.
    
     The [attach disk] operation supports tag-based access control via resource tags applied to the resource identified by [disk name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module AttachInstancesToLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_instances_to_load_balancer_request ->
        (attach_instances_to_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Attaches one or more Lightsail instances to a load balancer.
    
     After some time, the instances are attached to the load balancer and the health check status is available.
     
      The [attach instances to load balancer] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Lightsail Developer Guide}.
       *)

  
end

module AttachLoadBalancerTlsCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_load_balancer_tls_certificate_request ->
        (attach_load_balancer_tls_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Attaches a Transport Layer Security (TLS) certificate to your load balancer. TLS is just an updated, more secure version of Secure Socket Layer (SSL).
    
     Once you create and validate your certificate, you can attach it to your load balancer. You can also use this API to rotate the certificates on your account. Use the [AttachLoadBalancerTlsCertificate] action with the non-attached certificate, and it will replace the existing one and become the attached certificate.
     
      The [AttachLoadBalancerTlsCertificate] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module AttachStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_static_ip_request ->
        (attach_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Attaches a static IP address to a specific Amazon Lightsail instance.
     *)

  
end

module CloseInstancePublicPorts : sig
  val request :
    Smaws_Lib.Context.t ->
      close_instance_public_ports_request ->
        (close_instance_public_ports_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Closes ports for a specific Amazon Lightsail instance.
    
     The [CloseInstancePublicPorts] action supports tag-based access control via resource tags applied to the resource identified by [instanceName]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CopySnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      copy_snapshot_request ->
        (copy_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Copies a manual snapshot of an instance or disk as another manual snapshot, or copies an automatic snapshot of an instance or disk as a manual snapshot. This operation can also be used to copy a manual or automatic snapshot of an instance or a disk from one Amazon Web Services Region to another in Amazon Lightsail.
    
     When copying a {i manual snapshot}, be sure to define the [source
        region], [source snapshot name], and [target snapshot name] parameters.
     
      When copying an {i automatic snapshot}, be sure to define the [source region], [source resource name], [target snapshot
        name], and either the [restore date] or the [use latest restorable
        auto snapshot] parameters.
       *)

  
end

module CreateBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      create_bucket_request ->
        (create_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an Amazon Lightsail bucket.
    
     A bucket is a cloud storage resource available in the Lightsail object storage service. Use buckets to store objects such as data and its descriptive metadata. For more information about buckets, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/buckets-in-amazon-lightsail}Buckets in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateBucketAccessKey : sig
  val request :
    Smaws_Lib.Context.t ->
      create_bucket_access_key_request ->
        (create_bucket_access_key_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a new access key for the specified Amazon Lightsail bucket. Access keys consist of an access key ID and corresponding secret access key.
    
     Access keys grant full programmatic access to the specified bucket and its objects. You can have a maximum of two access keys per bucket. Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketAccessKeys.html}GetBucketAccessKeys} action to get a list of current access keys for a specific bucket. For more information about access keys, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys}Creating access keys for a bucket in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.
     
      The [secretAccessKey] value is returned only in response to the [CreateBucketAccessKey] action. You can get a secret access key only when you first create an access key; you cannot get the secret access key later. If you lose the secret access key, you must create a new access key.
      
       *)

  
end

module CreateCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      create_certificate_request ->
        (create_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an SSL/TLS certificate for an Amazon Lightsail content delivery network (CDN) distribution and a container service.
    
     After the certificate is valid, use the [AttachCertificateToDistribution] action to use the certificate and its domains with your distribution. Or use the [UpdateContainerService] action to use the certificate and its domains with your container service.
     
      Only certificates created in the [us-east-1] Amazon Web Services Region can be attached to Lightsail distributions. Lightsail distributions are global resources that can reference an origin in any Amazon Web Services Region, and distribute its content globally. However, all distributions are located in the [us-east-1] Region.
      
       *)

  
end

module CreateCloudFormationStack : sig
  val request :
    Smaws_Lib.Context.t ->
      create_cloud_formation_stack_request ->
        (create_cloud_formation_stack_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an AWS CloudFormation stack, which creates a new Amazon EC2 instance from an exported Amazon Lightsail snapshot. This operation results in a CloudFormation stack record that can be used to track the AWS CloudFormation stack created. Use the [get cloud formation stack
        records] operation to get a list of the CloudFormation stacks created.
    
     Wait until after your new Amazon EC2 instance is created before running the [create
          cloud formation stack] operation again with the same export snapshot record.
     
      *)

  
end

module CreateContactMethod : sig
  val request :
    Smaws_Lib.Context.t ->
      create_contact_method_request ->
        (create_contact_method_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an email or SMS text message contact method.
    
     A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.
      *)

  
end

module CreateContainerService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_request ->
        (create_container_service_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an Amazon Lightsail container service.
    
     A Lightsail container service is a compute resource to which you can deploy containers. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-services}Container services in Amazon Lightsail} in the {i Lightsail Dev Guide}.
      *)

  
end

module CreateContainerServiceDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_deployment_request ->
        (create_container_service_deployment_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a deployment for your Amazon Lightsail container service.
    
     A deployment specifies the containers that will be launched on the container service and their settings, such as the ports to open, the environment variables to apply, and the launch command to run. It also specifies the container that will serve as the public endpoint of the deployment and its settings, such as the HTTP or HTTPS port to use, and the health check configuration.
     
      You can deploy containers to your container service using container images from a public registry such as Amazon ECR Public, or from your local machine. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-container-images}Creating container images for your Amazon Lightsail container services} in the {i Amazon Lightsail Developer Guide}.
       *)

  
end

module CreateContainerServiceRegistryLogin : sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_registry_login_request ->
        (create_container_service_registry_login_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a temporary set of log in credentials that you can use to log in to the Docker process on your local machine. After you're logged in, you can use the native Docker commands to push your local container images to the container image registry of your Amazon Lightsail account so that you can use them with your Lightsail container service. The log in credentials expire 12 hours after they are created, at which point you will need to create a new set of log in credentials.
    
     You can only push container images to the container service registry of your Lightsail account. You cannot pull container images or perform any other container image management actions on the container service registry.
     
      After you push your container images to the container image registry of your Lightsail account, use the [RegisterContainerImage] action to register the pushed images to a specific Lightsail container service.
      
       This action is not required if you install and use the Lightsail Control (lightsailctl) plugin to push container images to your Lightsail container service. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-pushing-container-images}Pushing and managing container images on your Amazon Lightsail container services} in the {i Amazon Lightsail Developer Guide}.
       
        *)

  
end

module CreateDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_request ->
        (create_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a block storage disk that can be attached to an Amazon Lightsail instance in the same Availability Zone ([us-east-2a]).
    
     The [create disk] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateDiskFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_from_snapshot_request ->
        (create_disk_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a block storage disk from a manual or automatic snapshot of a disk. The resulting disk can be attached to an Amazon Lightsail instance in the same Availability Zone ([us-east-2a]).
    
     The [create disk from snapshot] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [disk snapshot
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateDiskSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_snapshot_request ->
        (create_disk_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a snapshot of a block storage disk. You can use snapshots for backups, to make copies of disks, and to save data before shutting down a Lightsail instance.
    
     You can take a snapshot of an attached disk that is in use; however, snapshots only capture data that has been written to your disk at the time the snapshot command is issued. This may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the disk long enough to take a snapshot, your snapshot should be complete. Nevertheless, if you cannot pause all file writes to the disk, you should unmount the disk from within the Lightsail instance, issue the create disk snapshot command, and then remount the disk to ensure a consistent and complete snapshot. You may remount and use your disk while the snapshot status is pending.
     
      You can also use this operation to create a snapshot of an instance's system volume. You might want to do this, for example, to recover data from the system volume of a botched instance or to create a backup of the system volume like you would for a block storage disk. To create a snapshot of a system volume, just define the [instance name] parameter when issuing the snapshot command, and a snapshot of the defined instance's system volume will be created. After the snapshot is available, you can create a block storage disk from the snapshot and attach it to a running instance to access the data on the disk.
      
       The [create disk snapshot] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
        *)

  
end

module CreateDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      create_distribution_request ->
        (create_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an Amazon Lightsail content delivery network (CDN) distribution.
    
     A distribution is a globally distributed network of caching servers that improve the performance of your website or web application hosted on a Lightsail instance. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-content-delivery-network-distributions}Content delivery networks in Amazon Lightsail}.
      *)

  
end

module CreateDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      create_domain_request ->
        (create_domain_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a domain resource for the specified domain (example.com).
    
     The [create domain] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateDomainEntry : sig
  val request :
    Smaws_Lib.Context.t ->
      create_domain_entry_request ->
        (create_domain_entry_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates one of the following domain name system (DNS) records in a domain DNS zone: Address (A), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT).
    
     The [create domain entry] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateGUISessionAccessDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      create_gui_session_access_details_request ->
        (create_gui_session_access_details_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates two URLs that are used to access a virtual computer’s graphical user interface (GUI) session. The primary URL initiates a web-based NICE DCV session to the virtual computer's application. The secondary URL initiates a web-based NICE DCV session to the virtual computer's operating session.
    
     Use [StartGUISession] to open the session.
      *)

  
end

module CreateInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      create_instances_request ->
        (create_instances_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates one or more Amazon Lightsail instances.
    
     The [create instances] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Lightsail Developer Guide}.
      *)

  
end

module CreateInstancesFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_instances_from_snapshot_request ->
        (create_instances_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates one or more new instances from a manual or automatic snapshot of an instance.
    
     The [create instances from snapshot] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [instance snapshot name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateInstanceSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_instance_snapshot_request ->
        (create_instance_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a snapshot of a specific virtual private server, or {i instance}. You can use a snapshot to create a new instance that is based on that snapshot.
    
     The [create instance snapshot] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      create_key_pair_request ->
        (create_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a custom SSH key pair that you can use with an Amazon Lightsail instance.
    
     Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_DownloadDefaultKeyPair.html}DownloadDefaultKeyPair} action to create a Lightsail default key pair in an Amazon Web Services Region where a default key pair does not currently exist.
     
      The [create key pair] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module CreateLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      create_load_balancer_request ->
        (create_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a Lightsail load balancer. To learn more about deciding whether to load balance your application, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/configure-lightsail-instances-for-load-balancing}Configure your Lightsail instances for load balancing}. You can create up to 5 load balancers per AWS Region in your account.
    
     When you create a load balancer, you can specify a unique name and port settings. To change additional load balancer settings, use the [UpdateLoadBalancerAttribute] operation.
     
      The [create load balancer] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module CreateLoadBalancerTlsCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      create_load_balancer_tls_certificate_request ->
        (create_load_balancer_tls_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an SSL/TLS certificate for an Amazon Lightsail load balancer.
    
     TLS is just an updated, more secure version of Secure Socket Layer (SSL).
     
      The [CreateLoadBalancerTlsCertificate] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module CreateRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_request ->
        (create_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a new database in Amazon Lightsail.
    
     The [create relational database] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateRelationalDatabaseFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_from_snapshot_request ->
        (create_relational_database_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a new database from an existing database snapshot in Amazon Lightsail.
    
     You can create a new database from a snapshot in if something goes wrong with your original database, or to change it to a different plan, such as a high availability or standard plan.
     
      The [create relational database from snapshot] operation supports tag-based access control via request tags and resource tags applied to the resource identified by relationalDatabaseSnapshotName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module CreateRelationalDatabaseSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_snapshot_request ->
        (create_relational_database_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a snapshot of your database in Amazon Lightsail. You can use snapshots for backups, to make copies of a database, and to save data before deleting a database.
    
     The [create relational database snapshot] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteAlarm : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_alarm_request ->
        (delete_alarm_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an alarm.
    
     An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.
      *)

  
end

module DeleteAutoSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_auto_snapshot_request ->
        (delete_auto_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an automatic snapshot of an instance or disk. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.
     *)

  
end

module DeleteBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_bucket_request ->
        (delete_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a Amazon Lightsail bucket.
    
     When you delete your bucket, the bucket name is released and can be reused for a new bucket in your account or another Amazon Web Services account.
     
      *)

  
end

module DeleteBucketAccessKey : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_bucket_access_key_request ->
        (delete_bucket_access_key_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an access key for the specified Amazon Lightsail bucket.
    
     We recommend that you delete an access key if the secret access key is compromised.
     
      For more information about access keys, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys}Creating access keys for a bucket in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.
       *)

  
end

module DeleteCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_certificate_request ->
        (delete_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an SSL/TLS certificate for your Amazon Lightsail content delivery network (CDN) distribution.
    
     Certificates that are currently attached to a distribution cannot be deleted. Use the [DetachCertificateFromDistribution] action to detach a certificate from a distribution.
      *)

  
end

module DeleteContactMethod : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_contact_method_request ->
        (delete_contact_method_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a contact method.
    
     A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.
      *)

  
end

module DeleteContainerImage : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_container_image_request ->
        (delete_container_image_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a container image that is registered to your Amazon Lightsail container service.
     *)

  
end

module DeleteContainerService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_container_service_request ->
        (delete_container_service_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes your Amazon Lightsail container service.
     *)

  
end

module DeleteDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_disk_request ->
        (delete_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the specified block storage disk. The disk must be in the [available] state (not attached to a Lightsail instance).
    
     The disk may remain in the [deleting] state for several minutes.
     
      The [delete disk] operation supports tag-based access control via resource tags applied to the resource identified by [disk name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module DeleteDiskSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_disk_snapshot_request ->
        (delete_disk_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the specified disk snapshot.
    
     When you make periodic snapshots of a disk, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the disk.
     
      The [delete disk snapshot] operation supports tag-based access control via resource tags applied to the resource identified by [disk snapshot name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module DeleteDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_distribution_request ->
        (delete_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes your Amazon Lightsail content delivery network (CDN) distribution.
     *)

  
end

module DeleteDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_domain_request ->
        (delete_domain_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the specified domain recordset and all of its domain records.
    
     The [delete domain] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteDomainEntry : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_domain_entry_request ->
        (delete_domain_entry_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a specific domain entry.
    
     The [delete domain entry] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_instance_request ->
        (delete_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an Amazon Lightsail instance.
    
     The [delete instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteInstanceSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_instance_snapshot_request ->
        (delete_instance_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a specific snapshot of a virtual private server (or {i instance}).
    
     The [delete instance snapshot] operation supports tag-based access control via resource tags applied to the resource identified by [instance snapshot name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_key_pair_request ->
        (delete_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the specified key pair by removing the public key from Amazon Lightsail.
    
     You can delete key pairs that were created using the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_ImportKeyPair.html}ImportKeyPair} and {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateKeyPair.html}CreateKeyPair} actions, as well as the Lightsail default key pair. A new default key pair will not be created unless you launch an instance without specifying a custom key pair, or you call the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_DownloadDefaultKeyPair.html}DownloadDefaultKeyPair} API.
     
      The [delete key pair] operation supports tag-based access control via resource tags applied to the resource identified by [key pair name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module DeleteKnownHostKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_known_host_keys_request ->
        (delete_known_host_keys_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the known host key or certificate used by the Amazon Lightsail browser-based SSH or RDP clients to authenticate an instance. This operation enables the Lightsail browser-based SSH or RDP clients to connect to the instance after a host key mismatch.
    
     Perform this operation only if you were expecting the host key or certificate mismatch or if you are familiar with the new host key or certificate on the instance. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection}Troubleshooting connection issues when using the Amazon Lightsail browser-based SSH or RDP client}.
     
      *)

  
end

module DeleteLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_load_balancer_request ->
        (delete_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a Lightsail load balancer and all its associated SSL/TLS certificates. Once the load balancer is deleted, you will need to create a new load balancer, create a new certificate, and verify domain ownership again.
    
     The [delete load balancer] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteLoadBalancerTlsCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_load_balancer_tls_certificate_request ->
        (delete_load_balancer_tls_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an SSL/TLS certificate associated with a Lightsail load balancer.
    
     The [DeleteLoadBalancerTlsCertificate] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_relational_database_request ->
        (delete_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a database in Amazon Lightsail.
    
     The [delete relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteRelationalDatabaseSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_relational_database_snapshot_request ->
        (delete_relational_database_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a database snapshot in Amazon Lightsail.
    
     The [delete relational database snapshot] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DetachCertificateFromDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_certificate_from_distribution_request ->
        (detach_certificate_from_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Detaches an SSL/TLS certificate from your Amazon Lightsail content delivery network (CDN) distribution.
    
     After the certificate is detached, your distribution stops accepting traffic for all of the domains that are associated with the certificate.
      *)

  
end

module DetachDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_disk_request ->
        (detach_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Detaches a stopped block storage disk from a Lightsail instance. Make sure to unmount any file systems on the device within your operating system before stopping the instance and detaching the disk.
    
     The [detach disk] operation supports tag-based access control via resource tags applied to the resource identified by [disk name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DetachInstancesFromLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_instances_from_load_balancer_request ->
        (detach_instances_from_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Detaches the specified instances from a Lightsail load balancer.
    
     This operation waits until the instances are no longer needed before they are detached from the load balancer.
     
      The [detach instances from load balancer] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module DetachStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_static_ip_request ->
        (detach_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Detaches a static IP from the Amazon Lightsail instance to which it is attached.
     *)

  
end

module DisableAddOn : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_add_on_request ->
        (disable_add_on_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Disables an add-on for an Amazon Lightsail resource. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.
     *)

  
end

module DownloadDefaultKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      download_default_key_pair_request ->
        (download_default_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Downloads the regional Amazon Lightsail default key pair.
    
     This action also creates a Lightsail default key pair if a default key pair does not currently exist in the Amazon Web Services Region.
      *)

  
end

module EnableAddOn : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_add_on_request ->
        (enable_add_on_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Enables or modifies an add-on for an Amazon Lightsail resource. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.
     *)

  
end

module ExportSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      export_snapshot_request ->
        (export_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Exports an Amazon Lightsail instance or block storage disk snapshot to Amazon Elastic Compute Cloud (Amazon EC2). This operation results in an export snapshot record that can be used with the [create
        cloud formation stack] operation to create new Amazon EC2 instances.
    
     Exported instance snapshots appear in Amazon EC2 as Amazon Machine Images (AMIs), and the instance system disk appears as an Amazon Elastic Block Store (Amazon EBS) volume. Exported disk snapshots appear in Amazon EC2 as Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services Region in Amazon EC2 as the source Lightsail snapshot.
     
      
      
       The [export snapshot] operation supports tag-based access control via resource tags applied to the resource identified by [source snapshot name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       
        Use the [get instance snapshots] or [get disk snapshots] operations to get a list of snapshots that you can export to Amazon EC2.
        
         *)

  
end

module GetActiveNames : sig
  val request :
    Smaws_Lib.Context.t ->
      get_active_names_request ->
        (get_active_names_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the names of all active (not deleted) resources.
     *)

  
end

module GetAlarms : sig
  val request :
    Smaws_Lib.Context.t ->
      get_alarms_request ->
        (get_alarms_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about the configured alarms. Specify an alarm name in your request to return information about a specific alarm, or specify a monitored resource name to return information about all alarms for a specific resource.
    
     An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.
      *)

  
end

module GetAutoSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_auto_snapshots_request ->
        (get_auto_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the available automatic snapshots for an instance or disk. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.
     *)

  
end

module GetBlueprints : sig
  val request :
    Smaws_Lib.Context.t ->
      get_blueprints_request ->
        (get_blueprints_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the list of available instance images, or {i blueprints}. You can use a blueprint to create a new instance already running a specific operating system, as well as a preinstalled app or development stack. The software each instance is running depends on the blueprint image you choose.
    
     Use active blueprints when creating new instances. Inactive blueprints are listed to support customers with existing instances and are not necessarily available to create new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.
     
      *)

  
end

module GetBucketAccessKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_access_keys_request ->
        (get_bucket_access_keys_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the existing access key IDs for the specified Amazon Lightsail bucket.
    
     This action does not return the secret access key value of an access key. You can get a secret access key only when you create it from the response of the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html}CreateBucketAccessKey} action. If you lose the secret access key, you must create a new access key.
     
      *)

  
end

module GetBucketBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_bundles_request ->
        (get_bucket_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the bundles that you can apply to a Amazon Lightsail bucket.
    
     The bucket bundle specifies the monthly cost, storage quota, and data transfer quota for a bucket.
     
      Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html}UpdateBucketBundle} action to update the bundle for a bucket.
       *)

  
end

module GetBucketMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_metric_data_request ->
        (get_bucket_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the data points of a specific metric for an Amazon Lightsail bucket.
    
     Metrics report the utilization of a bucket. View and collect metric data regularly to monitor the number of objects stored in a bucket (including object versions) and the storage space used by those objects.
      *)

  
end

module GetBuckets : sig
  val request :
    Smaws_Lib.Context.t ->
      get_buckets_request ->
        (get_buckets_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about one or more Amazon Lightsail buckets. The information returned includes the synchronization status of the Amazon Simple Storage Service (Amazon S3) account-level block public access feature for your Lightsail buckets.
    
     For more information about buckets, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/buckets-in-amazon-lightsail}Buckets in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.
      *)

  
end

module GetBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bundles_request ->
        (get_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the bundles that you can apply to an Amazon Lightsail instance when you create it.
    
     A bundle describes the specifications of an instance, such as the monthly cost, amount of memory, the number of vCPUs, amount of storage space, and monthly network data transfer quota.
     
      Bundles are referred to as {i instance plans} in the Lightsail console.
      
       *)

  
end

module GetCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_certificates_request ->
        (get_certificates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about one or more Amazon Lightsail SSL/TLS certificates.
    
     To get a summary of a certificate, omit [includeCertificateDetails] from your request. The response will include only the certificate Amazon Resource Name (ARN), certificate name, domain name, and tags.
     
      *)

  
end

module GetCloudFormationStackRecords : sig
  val request :
    Smaws_Lib.Context.t ->
      get_cloud_formation_stack_records_request ->
        (get_cloud_formation_stack_records_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the CloudFormation stack record created as a result of the [create cloud
        formation stack] operation.
    
     An AWS CloudFormation stack is used to create a new Amazon EC2 instance from an exported Lightsail snapshot.
      *)

  
end

module GetContactMethods : sig
  val request :
    Smaws_Lib.Context.t ->
      get_contact_methods_request ->
        (get_contact_methods_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about the configured contact methods. Specify a protocol in your request to return information about a specific contact method.
    
     A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.
      *)

  
end

module GetContainerAPIMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_api_metadata_request ->
        (get_container_api_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about Amazon Lightsail containers, such as the current version of the Lightsail Control (lightsailctl) plugin.
     *)

  
end

module GetContainerImages : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_images_request ->
        (get_container_images_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the container images that are registered to your Amazon Lightsail container service.
    
     If you created a deployment on your Lightsail container service that uses container images from a public registry like Docker Hub, those images are not returned as part of this action. Those images are not registered to your Lightsail container service.
     
      *)

  
end

module GetContainerLog : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_log_request ->
        (get_container_log_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the log events of a container of your Amazon Lightsail container service.
    
     If your container service has more than one node (i.e., a scale greater than 1), then the log events that are returned for the specified container are merged from all nodes on your container service.
     
      Container logs are retained for a certain amount of time. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/lightsail.html}Amazon Lightsail endpoints and quotas} in the {i Amazon Web Services General Reference}.
      
       *)

  
end

module GetContainerServiceDeployments : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_deployments_request ->
        (get_container_service_deployments_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the deployments for your Amazon Lightsail container service
    
     A deployment specifies the settings, such as the ports and launch command, of containers that are deployed to your container service.
     
      The deployments are ordered by version in ascending order. The newest version is listed at the top of the response.
      
       A set number of deployments are kept before the oldest one is replaced with the newest one. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/lightsail.html}Amazon Lightsail endpoints and quotas} in the {i Amazon Web Services General Reference}.
       
        *)

  
end

module GetContainerServiceMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_metric_data_request ->
        (get_container_service_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the data points of a specific metric of your Amazon Lightsail container service.
    
     Metrics report the utilization of your resources. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
      *)

  
end

module GetContainerServicePowers : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_powers_request ->
        (get_container_service_powers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the list of powers that can be specified for your Amazon Lightsail container services.
    
     The power specifies the amount of memory, the number of vCPUs, and the base price of the container service.
      *)

  
end

module GetContainerServices : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_services_request ->
        (container_services_list_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about one or more of your Amazon Lightsail container services.
     *)

  
end

module GetCostEstimate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_cost_estimate_request ->
        (get_cost_estimate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Retrieves information about the cost estimate for a specified resource. A cost estimate will not generate for a resource that has been deleted.
     *)

  
end

module GetDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_request ->
        (get_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific block storage disk.
     *)

  
end

module GetDisks : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disks_request ->
        (get_disks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all block storage disks in your AWS account and region.
     *)

  
end

module GetDiskSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_snapshot_request ->
        (get_disk_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific block storage disk snapshot.
     *)

  
end

module GetDiskSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_snapshots_request ->
        (get_disk_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all block storage disk snapshots in your AWS account and region.
     *)

  
end

module GetDistributionBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_bundles_request ->
        (get_distribution_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the bundles that can be applied to your Amazon Lightsail content delivery network (CDN) distributions.
    
     A distribution bundle specifies the monthly network transfer quota and monthly cost of your distribution.
      *)

  
end

module GetDistributionLatestCacheReset : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_latest_cache_reset_request ->
        (get_distribution_latest_cache_reset_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the timestamp and status of the last cache reset of a specific Amazon Lightsail content delivery network (CDN) distribution.
     *)

  
end

module GetDistributionMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_metric_data_request ->
        (get_distribution_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the data points of a specific metric for an Amazon Lightsail content delivery network (CDN) distribution.
    
     Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
      *)

  
end

module GetDistributions : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distributions_request ->
        (get_distributions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about one or more of your Amazon Lightsail content delivery network (CDN) distributions.
     *)

  
end

module GetDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      get_domain_request ->
        (get_domain_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific domain recordset.
     *)

  
end

module GetDomains : sig
  val request :
    Smaws_Lib.Context.t ->
      get_domains_request ->
        (get_domains_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of all domains in the user's account.
     *)

  
end

module GetExportSnapshotRecords : sig
  val request :
    Smaws_Lib.Context.t ->
      get_export_snapshot_records_request ->
        (get_export_snapshot_records_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns all export snapshot records created as a result of the [export
        snapshot] operation.
    
     An export snapshot record can be used to create a new Amazon EC2 instance and its related resources with the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateCloudFormationStack.html}CreateCloudFormationStack} action.
      *)

  
end

module GetInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_request ->
        (get_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific Amazon Lightsail instance, which is a virtual private server.
     *)

  
end

module GetInstanceAccessDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_access_details_request ->
        (get_instance_access_details_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns temporary SSH keys you can use to connect to a specific virtual private server, or {i instance}.
    
     The [get instance access details] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module GetInstanceMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_metric_data_request ->
        (get_instance_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the data points for the specified Amazon Lightsail instance metric, given an instance name.
    
     Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
      *)

  
end

module GetInstancePortStates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_port_states_request ->
        (get_instance_port_states_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the firewall port states for a specific Amazon Lightsail instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.
     *)

  
end

module GetInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instances_request ->
        (get_instances_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all Amazon Lightsail virtual private servers, or {i instances}.
     *)

  
end

module GetInstanceSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_snapshot_request ->
        (get_instance_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific instance snapshot.
     *)

  
end

module GetInstanceSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_snapshots_request ->
        (get_instance_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns all instance snapshots for the user's account.
     *)

  
end

module GetInstanceState : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_state_request ->
        (get_instance_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the state of a specific instance. Works on one instance at a time.
     *)

  
end

module GetKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_pair_request ->
        (get_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific key pair.
     *)

  
end

module GetKeyPairs : sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_pairs_request ->
        (get_key_pairs_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all key pairs in the user's account.
     *)

  
end

module GetLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_request ->
        (get_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about the specified Lightsail load balancer.
     *)

  
end

module GetLoadBalancerMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_metric_data_request ->
        (get_load_balancer_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about health metrics for your Lightsail load balancer.
    
     Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
      *)

  
end

module GetLoadBalancers : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancers_request ->
        (get_load_balancers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all load balancers in an account.
     *)

  
end

module GetLoadBalancerTlsCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_tls_certificates_request ->
        (get_load_balancer_tls_certificates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about the TLS certificates that are associated with the specified Lightsail load balancer.
    
     TLS is just an updated, more secure version of Secure Socket Layer (SSL).
     
      You can have a maximum of 2 certificates associated with a Lightsail load balancer. One is active and the other is inactive.
       *)

  
end

module GetLoadBalancerTlsPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_tls_policies_request ->
        (get_load_balancer_tls_policies_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of TLS security policies that you can apply to Lightsail load balancers.
    
     For more information about load balancer TLS security policies, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configure-load-balancer-tls-security-policy}Configuring TLS security policies on your Amazon Lightsail load balancers} in the {i Amazon Lightsail Developer Guide}.
      *)

  
end

module GetOperation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operation_request ->
        (get_operation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific operation. Operations include events such as when you create an instance, allocate a static IP, attach a static IP, and so on.
     *)

  
end

module GetOperations : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operations_request ->
        (get_operations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all operations.
    
     Results are returned from oldest to newest, up to a maximum of 200. Results can be paged by making each subsequent call to [GetOperations] use the maximum (last) [statusChangedAt] value from the previous request.
      *)

  
end

module GetOperationsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operations_for_resource_request ->
        (get_operations_for_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Gets operations for a specific resource (an instance or a static IP).
     *)

  
end

module GetRegions : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regions_request ->
        (get_regions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of all valid regions for Amazon Lightsail. Use the [include
        availability zones] parameter to also return the Availability Zones in a region.
     *)

  
end

module GetRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_request ->
        (get_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific database in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseBlueprints : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_blueprints_request ->
        (get_relational_database_blueprints_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of available database blueprints in Amazon Lightsail. A blueprint describes the major engine version of a database.
    
     You can use a blueprint ID to create a new database that runs a specific database engine.
      *)

  
end

module GetRelationalDatabaseBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_bundles_request ->
        (get_relational_database_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the list of bundles that are available in Amazon Lightsail. A bundle describes the performance specifications for a database.
    
     You can use a bundle ID to create a new database with explicit performance specifications.
      *)

  
end

module GetRelationalDatabaseEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_events_request ->
        (get_relational_database_events_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of events for a specific database in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseLogEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_log_events_request ->
        (get_relational_database_log_events_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of log events for a database in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseLogStreams : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_log_streams_request ->
        (get_relational_database_log_streams_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of available log streams for a specific database in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseMasterUserPassword : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_master_user_password_request ->
        (get_relational_database_master_user_password_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the current, previous, or pending versions of the master user password for a Lightsail database.
    
     The [GetRelationalDatabaseMasterUserPassword] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName.
      *)

  
end

module GetRelationalDatabaseMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_metric_data_request ->
        (get_relational_database_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the data points of the specified metric for a database in Amazon Lightsail.
    
     Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
      *)

  
end

module GetRelationalDatabaseParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_parameters_request ->
        (get_relational_database_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns all of the runtime parameters offered by the underlying database software, or engine, for a specific database in Amazon Lightsail.
    
     In addition to the parameter names and values, this operation returns other information about each parameter. This information includes whether changes require a reboot, whether the parameter is modifiable, the allowed values, and the data types.
      *)

  
end

module GetRelationalDatabases : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_databases_request ->
        (get_relational_databases_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all of your databases in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_snapshot_request ->
        (get_relational_database_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific database snapshot in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_snapshots_request ->
        (get_relational_database_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all of your database snapshots in Amazon Lightsail.
     *)

  
end

module GetSetupHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_setup_history_request ->
        (get_setup_history_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns detailed information for five of the most recent [SetupInstanceHttps] requests that were ran on the target instance.
     *)

  
end

module GetStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      get_static_ip_request ->
        (get_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about an Amazon Lightsail static IP.
     *)

  
end

module GetStaticIps : sig
  val request :
    Smaws_Lib.Context.t ->
      get_static_ips_request ->
        (get_static_ips_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all static IPs in the user's account.
     *)

  
end

module ImportKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      import_key_pair_request ->
        (import_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Imports a public SSH key from a specific key pair.
     *)

  
end

module IsVpcPeered : sig
  val request :
    Smaws_Lib.Context.t ->
      is_vpc_peered_request ->
        (is_vpc_peered_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a Boolean value indicating whether your Lightsail VPC is peered.
     *)

  
end

module OpenInstancePublicPorts : sig
  val request :
    Smaws_Lib.Context.t ->
      open_instance_public_ports_request ->
        (open_instance_public_ports_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol.
    
     The [OpenInstancePublicPorts] action supports tag-based access control via resource tags applied to the resource identified by [instanceName]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module PeerVpc : sig
  val request :
    Smaws_Lib.Context.t ->
      peer_vpc_request ->
        (peer_vpc_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Peers the Lightsail VPC with the user's default VPC.
     *)

  
end

module PutAlarm : sig
  val request :
    Smaws_Lib.Context.t ->
      put_alarm_request ->
        (put_alarm_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates or updates an alarm, and associates it with the specified metric.
    
     An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.
     
      When this action creates an alarm, the alarm state is immediately set to [INSUFFICIENT_DATA]. The alarm is then evaluated and its state is set appropriately. Any actions associated with the new state are then executed.
      
       When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm. The alarm is then evaluated with the updated configuration.
        *)

  
end

module PutInstancePublicPorts : sig
  val request :
    Smaws_Lib.Context.t ->
      put_instance_public_ports_request ->
        (put_instance_public_ports_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol. This action also closes all currently open ports that are not included in the request. Include all of the ports and the protocols you want to open in your [PutInstancePublicPorts]request. Or use the [OpenInstancePublicPorts] action to open ports without closing currently open ports.
    
     The [PutInstancePublicPorts] action supports tag-based access control via resource tags applied to the resource identified by [instanceName]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module RebootInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      reboot_instance_request ->
        (reboot_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Restarts a specific instance.
    
     The [reboot instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module RebootRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      reboot_relational_database_request ->
        (reboot_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Restarts a specific database in Amazon Lightsail.
    
     The [reboot relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module RegisterContainerImage : sig
  val request :
    Smaws_Lib.Context.t ->
      register_container_image_request ->
        (register_container_image_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Registers a container image to your Amazon Lightsail container service.
    
     This action is not required if you install and use the Lightsail Control (lightsailctl) plugin to push container images to your Lightsail container service. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-pushing-container-images}Pushing and managing container images on your Amazon Lightsail container services} in the {i Amazon Lightsail Developer Guide}.
     
      *)

  
end

module ReleaseStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      release_static_ip_request ->
        (release_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a specific static IP from your account.
     *)

  
end

module ResetDistributionCache : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_distribution_cache_request ->
        (reset_distribution_cache_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes currently cached content from your Amazon Lightsail content delivery network (CDN) distribution.
    
     After resetting the cache, the next time a content request is made, your distribution pulls, serves, and caches it from the origin.
      *)

  
end

module SendContactMethodVerification : sig
  val request :
    Smaws_Lib.Context.t ->
      send_contact_method_verification_request ->
        (send_contact_method_verification_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Sends a verification request to an email contact method to ensure it's owned by the requester. SMS contact methods don't need to be verified.
    
     A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.
     
      A verification request is sent to the contact method when you initially create it. Use this action to send another verification request if a previous verification request was deleted, or has expired.
      
       Notifications are not sent to an email contact method until after it is verified, and confirmed as valid.
       
        *)

  
end

module SetIpAddressType : sig
  val request :
    Smaws_Lib.Context.t ->
      set_ip_address_type_request ->
        (set_ip_address_type_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Sets the IP address type for an Amazon Lightsail resource.
    
     Use this action to enable dual-stack for a resource, which enables IPv4 and IPv6 for the specified resource. Alternately, you can use this action to disable dual-stack, and enable IPv4 only.
      *)

  
end

module SetResourceAccessForBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      set_resource_access_for_bucket_request ->
        (set_resource_access_for_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Sets the Amazon Lightsail resources that can access the specified Lightsail bucket.
    
     Lightsail buckets currently support setting access for Lightsail instances in the same Amazon Web Services Region.
      *)

  
end

module SetupInstanceHttps : sig
  val request :
    Smaws_Lib.Context.t ->
      setup_instance_https_request ->
        (setup_instance_https_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an SSL/TLS certificate that secures traffic for your website. After the certificate is created, it is installed on the specified Lightsail instance.
    
     If you provide more than one domain name in the request, at least one name must be less than or equal to 63 characters in length.
      *)

  
end

module StartGUISession : sig
  val request :
    Smaws_Lib.Context.t ->
      start_gui_session_request ->
        (start_gui_session_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Initiates a graphical user interface (GUI) session that’s used to access a virtual computer’s operating system and application. The session will be active for 1 hour. Use this action to resume the session after it expires.
     *)

  
end

module StartInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      start_instance_request ->
        (start_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Starts a specific Amazon Lightsail instance from a stopped state. To restart an instance, use the [reboot instance] operation.
    
     When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-create-static-ip}Amazon Lightsail Developer Guide}.
     
      The [start instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module StartRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      start_relational_database_request ->
        (start_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Starts a specific database from a stopped state in Amazon Lightsail. To restart a database, use the [reboot relational database] operation.
    
     The [start relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module StopGUISession : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_gui_session_request ->
        (stop_gui_session_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Terminates a web-based NICE DCV session that’s used to access a virtual computer’s operating system or application. The session will close and any unsaved data will be lost.
     *)

  
end

module StopInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_instance_request ->
        (stop_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Stops a specific Amazon Lightsail instance that is currently running.
    
     When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-create-static-ip}Amazon Lightsail Developer Guide}.
     
      The [stop instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module StopRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_relational_database_request ->
        (stop_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Stops a specific database that is currently running in Amazon Lightsail.
    
     The [stop relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Adds one or more tags to the specified Amazon Lightsail resource. Each resource can have a maximum of 50 tags. Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.
    
     The [tag resource] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [resource name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module TestAlarm : sig
  val request :
    Smaws_Lib.Context.t ->
      test_alarm_request ->
        (test_alarm_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Tests an alarm by displaying a banner on the Amazon Lightsail console. If a notification trigger is configured for the specified alarm, the test also sends a notification to the notification protocol ([Email] and/or [SMS]) configured for the alarm.
    
     An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.
      *)

  
end

module UnpeerVpc : sig
  val request :
    Smaws_Lib.Context.t ->
      unpeer_vpc_request ->
        (unpeer_vpc_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Unpeers the Lightsail VPC from the user's default VPC.
     *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the specified set of tag keys and their values from the specified Amazon Lightsail resource.
    
     The [untag resource] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [resource name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module UpdateBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      update_bucket_request ->
        (update_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates an existing Amazon Lightsail bucket.
    
     Use this action to update the configuration of an existing bucket, such as versioning, public accessibility, and the Amazon Web Services accounts that can access the bucket.
      *)

  
end

module UpdateBucketBundle : sig
  val request :
    Smaws_Lib.Context.t ->
      update_bucket_bundle_request ->
        (update_bucket_bundle_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates the bundle, or storage plan, of an existing Amazon Lightsail bucket.
    
     A bucket bundle specifies the monthly cost, storage space, and data transfer quota for a bucket. You can update a bucket's bundle only one time within a monthly Amazon Web Services billing cycle. To determine if you can update a bucket's bundle, use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBuckets.html}GetBuckets} action. The [ableToUpdateBundle] parameter in the response will indicate whether you can currently update a bucket's bundle.
     
      Update a bucket's bundle if it's consistently going over its storage space or data transfer quota, or if a bucket's usage is consistently in the lower range of its storage space or data transfer quota. Due to the unpredictable usage fluctuations that a bucket might experience, we strongly recommend that you update a bucket's bundle only as a long-term strategy, instead of as a short-term, monthly cost-cutting measure. Choose a bucket bundle that will provide the bucket with ample storage space and data transfer for a long time to come.
       *)

  
end

module UpdateContainerService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_container_service_request ->
        (update_container_service_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates the configuration of your Amazon Lightsail container service, such as its power, scale, and public domain names.
     *)

  
end

module UpdateDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      update_distribution_request ->
        (update_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates an existing Amazon Lightsail content delivery network (CDN) distribution.
    
     Use this action to update the configuration of your existing distribution.
      *)

  
end

module UpdateDistributionBundle : sig
  val request :
    Smaws_Lib.Context.t ->
      update_distribution_bundle_request ->
        (update_distribution_bundle_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates the bundle of your Amazon Lightsail content delivery network (CDN) distribution.
    
     A distribution bundle specifies the monthly network transfer quota and monthly cost of your distribution.
     
      Update your distribution's bundle if your distribution is going over its monthly network transfer quota and is incurring an overage fee.
      
       You can update your distribution's bundle only one time within your monthly Amazon Web Services billing cycle. To determine if you can update your distribution's bundle, use the [GetDistributions] action. The [ableToUpdateBundle] parameter in the result will indicate whether you can currently update your distribution's bundle.
        *)

  
end

module UpdateDomainEntry : sig
  val request :
    Smaws_Lib.Context.t ->
      update_domain_entry_request ->
        (update_domain_entry_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates a domain recordset after it is created.
    
     The [update domain entry] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module UpdateInstanceMetadataOptions : sig
  val request :
    Smaws_Lib.Context.t ->
      update_instance_metadata_options_request ->
        (update_instance_metadata_options_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Modifies the Amazon Lightsail instance metadata parameters on a running or stopped instance. When you modify the parameters on a running instance, the [GetInstance] or [GetInstances] API operation initially responds with a state of [pending]. After the parameter modifications are successfully applied, the state changes to [applied] in subsequent [GetInstance] or [GetInstances] API calls. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-instance-metadata-service}Use IMDSv2 with an Amazon Lightsail instance} in the {i Amazon Lightsail Developer Guide}.
     *)

  
end

module UpdateLoadBalancerAttribute : sig
  val request :
    Smaws_Lib.Context.t ->
      update_load_balancer_attribute_request ->
        (update_load_balancer_attribute_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates the specified attribute for a load balancer. You can only update one attribute at a time.
    
     The [update load balancer attribute] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module UpdateRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      update_relational_database_request ->
        (update_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Allows the update of one or more attributes of a database in Amazon Lightsail.
    
     Updates are applied immediately, or in cases where the updates could result in an outage, are applied during the database's predefined maintenance window.
     
      The [update relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module UpdateRelationalDatabaseParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      update_relational_database_parameters_request ->
        (update_relational_database_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Allows the update of one or more parameters of a database in Amazon Lightsail.
    
     Parameter updates don't cause outages; therefore, their application is not subject to the preferred maintenance window. However, there are two ways in which parameter updates are applied: [dynamic] or [pending-reboot]. Parameters marked with a [dynamic] apply type are applied immediately. Parameters marked with a [pending-reboot] apply type are applied only after the database is rebooted using the [reboot relational database] operation.
     
      The [update relational database parameters] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

