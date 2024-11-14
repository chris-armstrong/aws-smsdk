open Types
val make_wireless_connection : ?is_wifi_enabled:bool -> unit
-> wireless_connection

val make_update_long_term_pricing_result : unit
-> update_long_term_pricing_result

val make_update_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:bool ->
  ?replacement_job:string ->
  long_term_pricing_id:string ->
  unit
-> update_long_term_pricing_request

val make_update_job_shipment_state_result : unit
-> update_job_shipment_state_result

val make_update_job_shipment_state_request :
  shipment_state:shipment_state -> job_id:string -> unit
-> update_job_shipment_state_request

val make_update_job_result : unit -> update_job_result

val make_notification :
  ?device_pickup_sns_topic_ar_n:string ->
  ?notify_all:bool ->
  ?job_states_to_notify:job_state list ->
  ?sns_topic_ar_n:string ->
  unit -> notification

val make_key_range : ?end_marker:string -> ?begin_marker:string -> unit
-> key_range

val make_target_on_device_service :
  ?transfer_option:transfer_option ->
  ?service_name:device_service_name ->
  unit -> target_on_device_service

val make_s3_resource :
  ?target_on_device_services:target_on_device_service list ->
  ?key_range:key_range ->
  ?bucket_arn:string ->
  unit -> s3_resource

val make_event_trigger_definition : ?event_resource_ar_n:string -> unit
-> event_trigger_definition

val make_lambda_resource :
  ?event_triggers:event_trigger_definition list -> ?lambda_arn:string -> unit
-> lambda_resource

val make_ec2_ami_resource : ?snowball_ami_id:string -> ami_id:string -> unit
-> ec2_ami_resource

val make_job_resource :
  ?ec2_ami_resources:ec2_ami_resource list ->
  ?lambda_resources:lambda_resource list ->
  ?s3_resources:s3_resource list ->
  unit -> job_resource

val make_nfs_on_device_service_configuration :
  ?storage_unit:storage_unit -> ?storage_limit:int -> unit
-> nfs_on_device_service_configuration

val make_tgw_on_device_service_configuration :
  ?storage_unit:storage_unit -> ?storage_limit:int -> unit
-> tgw_on_device_service_configuration

val make_eks_on_device_service_configuration :
  ?eks_anywhere_version:string -> ?kubernetes_version:string -> unit
-> eks_on_device_service_configuration

val make_s3_on_device_service_configuration :
  ?fault_tolerance:int ->
  ?service_size:int ->
  ?storage_unit:storage_unit ->
  ?storage_limit:float ->
  unit
-> s3_on_device_service_configuration

val make_on_device_service_configuration :
  ?s3_on_device_service:s3_on_device_service_configuration ->
  ?eks_on_device_service:eks_on_device_service_configuration ->
  ?tgw_on_device_service:tgw_on_device_service_configuration ->
  ?nfs_on_device_service:nfs_on_device_service_configuration ->
  unit -> on_device_service_configuration

val make_pickup_details :
  ?device_pickup_id:string ->
  ?identification_issuing_org:string ->
  ?identification_expiration_date:float ->
  ?identification_number:string ->
  ?email:string ->
  ?phone_number:string ->
  ?name:string ->
  unit -> pickup_details

val make_update_job_request :
  ?pickup_details:pickup_details ->
  ?forwarding_address_id:string ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?description:string ->
  ?shipping_option:shipping_option ->
  ?address_id:string ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  ?notification:notification ->
  ?role_ar_n:string ->
  job_id:string ->
  unit -> update_job_request

val make_update_cluster_result : unit
-> update_cluster_result

val make_update_cluster_request :
  ?forwarding_address_id:string ->
  ?notification:notification ->
  ?shipping_option:shipping_option ->
  ?address_id:string ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  ?description:string ->
  ?role_ar_n:string ->
  cluster_id:string ->
  unit -> update_cluster_request

val make_ind_tax_documents : ?gsti_n:string -> unit
-> ind_tax_documents

val make_tax_documents : ?in_d:ind_tax_documents -> unit
-> tax_documents

val make_snowcone_device_configuration :
  ?wireless_connection:wireless_connection -> unit
-> snowcone_device_configuration

val make_shipment : ?tracking_number:string -> ?status:string -> unit
-> shipment

val make_shipping_details :
  ?outbound_shipment:shipment ->
  ?inbound_shipment:shipment ->
  ?shipping_option:shipping_option ->
  unit -> shipping_details

val make_service_version : ?version:string -> unit
-> service_version

val make_long_term_pricing_list_entry :
  ?job_ids:string list ->
  ?snowball_type:snowball_type ->
  ?long_term_pricing_status:string ->
  ?is_long_term_pricing_auto_renew:bool ->
  ?replacement_job:string ->
  ?current_active_job:string ->
  ?long_term_pricing_type:long_term_pricing_type ->
  ?long_term_pricing_start_date:float ->
  ?long_term_pricing_end_date:float ->
  ?long_term_pricing_id:string ->
  unit -> long_term_pricing_list_entry

val make_dependent_service :
  ?service_version:service_version -> ?service_name:service_name -> unit
-> dependent_service

val make_list_service_versions_result :
  ?next_token:string ->
  ?dependent_services:dependent_service list ->
  service_name:service_name ->
  service_versions:service_version list ->
  unit
-> list_service_versions_result

val make_list_service_versions_request :
  ?next_token:string ->
  ?max_results:int ->
  ?dependent_services:dependent_service list ->
  service_name:service_name ->
  unit -> list_service_versions_request

val make_address :
  ?type_:address_type ->
  ?is_restricted:bool ->
  ?phone_number:string ->
  ?postal_code:string ->
  ?country:string ->
  ?landmark:string ->
  ?prefecture_or_district:string ->
  ?state_or_province:string ->
  ?city:string ->
  ?street3:string ->
  ?street2:string ->
  ?street1:string ->
  ?company:string ->
  ?name:string ->
  ?address_id:string ->
  unit -> address

val make_list_pickup_locations_result :
  ?next_token:string -> ?addresses:address list -> unit
-> list_pickup_locations_result

val make_list_pickup_locations_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_pickup_locations_request

val make_list_long_term_pricing_result :
  ?next_token:string ->
  ?long_term_pricing_entries:long_term_pricing_list_entry list ->
  unit
-> list_long_term_pricing_result

val make_list_long_term_pricing_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_long_term_pricing_request

val make_job_list_entry :
  ?description:string ->
  ?creation_date:float ->
  ?snowball_type:snowball_type ->
  ?job_type:job_type ->
  ?is_master:bool ->
  ?job_state:job_state ->
  ?job_id:string ->
  unit -> job_list_entry

val make_list_jobs_result :
  ?next_token:string -> ?job_list_entries:job_list_entry list -> unit
-> list_jobs_result

val make_list_jobs_request : ?next_token:string -> ?max_results:int -> unit
-> list_jobs_request

val make_compatible_image : ?name:string -> ?ami_id:string -> unit
-> compatible_image

val make_list_compatible_images_result :
  ?next_token:string -> ?compatible_images:compatible_image list -> unit
-> list_compatible_images_result

val make_list_compatible_images_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_compatible_images_request

val make_cluster_list_entry :
  ?description:string ->
  ?creation_date:float ->
  ?cluster_state:cluster_state ->
  ?cluster_id:string ->
  unit -> cluster_list_entry

val make_list_clusters_result :
  ?next_token:string -> ?cluster_list_entries:cluster_list_entry list -> unit
-> list_clusters_result

val make_list_clusters_request :
  ?next_token:string -> ?max_results:int -> unit
-> list_clusters_request

val make_list_cluster_jobs_result :
  ?next_token:string -> ?job_list_entries:job_list_entry list -> unit
-> list_cluster_jobs_result

val make_list_cluster_jobs_request :
  ?next_token:string -> ?max_results:int -> cluster_id:string -> unit
-> list_cluster_jobs_request

val make_data_transfer :
  ?total_objects:int ->
  ?total_bytes:int ->
  ?objects_transferred:int ->
  ?bytes_transferred:int ->
  unit -> data_transfer

val make_job_logs :
  ?job_failure_log_ur_i:string ->
  ?job_success_log_ur_i:string ->
  ?job_completion_report_ur_i:string ->
  unit -> job_logs

val make_device_configuration :
  ?snowcone_device_configuration:snowcone_device_configuration -> unit
-> device_configuration

val make_job_metadata :
  ?snowball_id:string ->
  ?pickup_details:pickup_details ->
  ?impact_level:impact_level ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?long_term_pricing_id:string ->
  ?remote_management:remote_management ->
  ?device_configuration:device_configuration ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:string ->
  ?cluster_id:string ->
  ?job_log_info:job_logs ->
  ?data_transfer_progress:data_transfer ->
  ?notification:notification ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?shipping_details:shipping_details ->
  ?address_id:string ->
  ?role_ar_n:string ->
  ?kms_key_ar_n:string ->
  ?description:string ->
  ?resources:job_resource ->
  ?creation_date:float ->
  ?snowball_type:snowball_type ->
  ?job_type:job_type ->
  ?job_state:job_state ->
  ?job_id:string ->
  unit -> job_metadata

val make_get_software_updates_result : ?updates_ur_i:string -> unit
-> get_software_updates_result

val make_get_software_updates_request : job_id:string -> unit
-> get_software_updates_request

val make_get_snowball_usage_result :
  ?snowballs_in_use:int -> ?snowball_limit:int -> unit
-> get_snowball_usage_result

val make_get_snowball_usage_request : unit
-> get_snowball_usage_request

val make_get_job_unlock_code_result : ?unlock_code:string -> unit
-> get_job_unlock_code_result

val make_get_job_unlock_code_request : job_id:string -> unit
-> get_job_unlock_code_request

val make_get_job_manifest_result : ?manifest_ur_i:string -> unit
-> get_job_manifest_result

val make_get_job_manifest_request : job_id:string -> unit
-> get_job_manifest_request

val make_describe_return_shipping_label_result :
  ?return_shipping_label_ur_i:string ->
  ?expiration_date:float ->
  ?status:shipping_label_status ->
  unit
-> describe_return_shipping_label_result

val make_describe_return_shipping_label_request : job_id:string -> unit
-> describe_return_shipping_label_request

val make_describe_job_result :
  ?sub_job_metadata:job_metadata list -> ?job_metadata:job_metadata -> unit
-> describe_job_result

val make_describe_job_request : job_id:string -> unit
-> describe_job_request

val make_cluster_metadata :
  ?on_device_service_configuration:on_device_service_configuration ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:string ->
  ?notification:notification ->
  ?shipping_option:shipping_option ->
  ?address_id:string ->
  ?resources:job_resource ->
  ?creation_date:float ->
  ?snowball_type:snowball_type ->
  ?job_type:job_type ->
  ?cluster_state:cluster_state ->
  ?role_ar_n:string ->
  ?kms_key_ar_n:string ->
  ?description:string ->
  ?cluster_id:string ->
  unit -> cluster_metadata

val make_describe_cluster_result : ?cluster_metadata:cluster_metadata -> unit
-> describe_cluster_result

val make_describe_cluster_request : cluster_id:string -> unit
-> describe_cluster_request

val make_describe_addresses_result :
  ?next_token:string -> ?addresses:address list -> unit
-> describe_addresses_result

val make_describe_addresses_request :
  ?next_token:string -> ?max_results:int -> unit
-> describe_addresses_request

val make_describe_address_result : ?address:address -> unit
-> describe_address_result

val make_describe_address_request : address_id:string -> unit
-> describe_address_request

val make_create_return_shipping_label_result :
  ?status:shipping_label_status -> unit
-> create_return_shipping_label_result

val make_create_return_shipping_label_request :
  ?shipping_option:shipping_option -> job_id:string -> unit
-> create_return_shipping_label_request

val make_create_long_term_pricing_result :
  ?long_term_pricing_id:string -> unit
-> create_long_term_pricing_result

val make_create_long_term_pricing_request :
  ?is_long_term_pricing_auto_renew:bool ->
  snowball_type:snowball_type ->
  long_term_pricing_type:long_term_pricing_type ->
  unit -> create_long_term_pricing_request

val make_create_job_result : ?job_id:string -> unit
-> create_job_result

val make_create_job_request :
  ?pickup_details:pickup_details ->
  ?impact_level:impact_level ->
  ?long_term_pricing_id:string ->
  ?remote_management:remote_management ->
  ?device_configuration:device_configuration ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:string ->
  ?snowball_type:snowball_type ->
  ?cluster_id:string ->
  ?notification:notification ->
  ?shipping_option:shipping_option ->
  ?snowball_capacity_preference:snowball_capacity ->
  ?role_ar_n:string ->
  ?kms_key_ar_n:string ->
  ?address_id:string ->
  ?description:string ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  ?job_type:job_type ->
  unit -> create_job_request

val make_create_cluster_result :
  ?job_list_entries:job_list_entry list -> ?cluster_id:string -> unit
-> create_cluster_result

val make_create_cluster_request :
  ?snowball_capacity_preference:snowball_capacity ->
  ?long_term_pricing_ids:string list ->
  ?force_create_jobs:bool ->
  ?initial_cluster_size:int ->
  ?remote_management:remote_management ->
  ?tax_documents:tax_documents ->
  ?forwarding_address_id:string ->
  ?notification:notification ->
  ?role_ar_n:string ->
  ?kms_key_ar_n:string ->
  ?description:string ->
  ?on_device_service_configuration:on_device_service_configuration ->
  ?resources:job_resource ->
  shipping_option:shipping_option ->
  snowball_type:snowball_type ->
  address_id:string ->
  job_type:job_type ->
  unit -> create_cluster_request

val make_create_address_result : ?address_id:string -> unit
-> create_address_result

val make_create_address_request : address:address -> unit
-> create_address_request

val make_cancel_job_result : unit
-> cancel_job_result

val make_cancel_job_request : job_id:string -> unit
-> cancel_job_request

val make_cancel_cluster_result : unit
-> cancel_cluster_result

val make_cancel_cluster_request : cluster_id:string -> unit
-> cancel_cluster_request

