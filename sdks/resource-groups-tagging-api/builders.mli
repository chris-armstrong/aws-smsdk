open Types
val make_failure_info :
  ?error_message:string -> ?error_code:error_code -> ?status_code:int -> unit
-> failure_info
(** Create a {!type-failure_info} type *)

val make_untag_resources_output :
  ?failed_resources_map:(string * failure_info) list -> unit
-> untag_resources_output
(** Create a {!type-untag_resources_output} type *)

val make_untag_resources_input :
  tag_keys:string list -> resource_arn_list:string list -> unit
-> untag_resources_input
(** Create a {!type-untag_resources_input} type *)

val make_tag_resources_output :
  ?failed_resources_map:(string * failure_info) list -> unit
-> tag_resources_output
(** Create a {!type-tag_resources_output} type *)

val make_tag_resources_input :
  tags:(string * string) list -> resource_arn_list:string list -> unit
-> tag_resources_input
(** Create a {!type-tag_resources_input} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_filter : ?values:string list -> ?key:string -> unit
-> tag_filter
(** Create a {!type-tag_filter} type *)

val make_summary :
  ?non_compliant_resources:int ->
  ?resource_type:string ->
  ?region:string ->
  ?target_id_type:target_id_type ->
  ?target_id:string ->
  ?last_updated:string ->
  unit
-> summary
(** Create a {!type-summary} type *)

val make_start_report_creation_output : unit
-> start_report_creation_output
(** Create a {!type-start_report_creation_output} type *)

val make_start_report_creation_input : s3_bucket:string -> unit
-> start_report_creation_input
(** Create a {!type-start_report_creation_input} type *)

val make_compliance_details :
  ?compliance_status:bool ->
  ?keys_with_noncompliant_values:string list ->
  ?noncompliant_keys:string list ->
  unit
-> compliance_details
(** Create a {!type-compliance_details} type *)

val make_resource_tag_mapping :
  ?compliance_details:compliance_details ->
  ?tags:tag list ->
  ?resource_ar_n:string ->
  unit
-> resource_tag_mapping
(** Create a {!type-resource_tag_mapping} type *)

val make_get_tag_values_output :
  ?tag_values:string list -> ?pagination_token:string -> unit
-> get_tag_values_output
(** Create a {!type-get_tag_values_output} type *)

val make_get_tag_values_input :
  ?pagination_token:string -> key:string -> unit
-> get_tag_values_input
(** Create a {!type-get_tag_values_input} type *)

val make_get_tag_keys_output :
  ?tag_keys:string list -> ?pagination_token:string -> unit
-> get_tag_keys_output
(** Create a {!type-get_tag_keys_output} type *)

val make_get_tag_keys_input : ?pagination_token:string -> unit
-> get_tag_keys_input
(** Create a {!type-get_tag_keys_input} type *)

val make_get_resources_output :
  ?resource_tag_mapping_list:resource_tag_mapping list ->
  ?pagination_token:string ->
  unit
-> get_resources_output
(** Create a {!type-get_resources_output} type *)

val make_get_resources_input :
  ?resource_arn_list:string list ->
  ?exclude_compliant_resources:bool ->
  ?include_compliance_details:bool ->
  ?resource_type_filters:string list ->
  ?tags_per_page:int ->
  ?resources_per_page:int ->
  ?tag_filters:tag_filter list ->
  ?pagination_token:string ->
  unit
-> get_resources_input
(** Create a {!type-get_resources_input} type *)

val make_get_compliance_summary_output :
  ?pagination_token:string -> ?summary_list:summary list -> unit
-> get_compliance_summary_output
(** Create a {!type-get_compliance_summary_output} type *)

val make_get_compliance_summary_input :
  ?pagination_token:string ->
  ?max_results:int ->
  ?group_by:group_by_attribute list ->
  ?tag_key_filters:string list ->
  ?resource_type_filters:string list ->
  ?region_filters:string list ->
  ?target_id_filters:string list ->
  unit
-> get_compliance_summary_input
(** Create a {!type-get_compliance_summary_input} type *)

val make_describe_report_creation_output :
  ?error_message:string ->
  ?start_date:string ->
  ?s3_location:string ->
  ?status:string ->
  unit
-> describe_report_creation_output
(** Create a {!type-describe_report_creation_output} type *)

val make_describe_report_creation_input : unit
-> describe_report_creation_input
(** Create a {!type-describe_report_creation_input} type *)

