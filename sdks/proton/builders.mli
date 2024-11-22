open Types
val make_template_sync_config :
  ?subdirectory:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  template_type:template_type ->
  template_name:string ->
  unit -> template_sync_config

val make_update_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit
-> update_template_sync_config_output

val make_update_template_sync_config_input :
  ?subdirectory:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  template_type:template_type ->
  template_name:string ->
  unit
-> update_template_sync_config_input

val make_compatible_environment_template :
  major_version:string -> template_name:string -> unit
-> compatible_environment_template

val make_service_template_version :
  ?supported_component_sources:service_template_supported_component_source_type list ->
  ?schema:string ->
  ?description:string ->
  ?status_message:string ->
  ?recommended_minor_version:string ->
  compatible_environment_templates:compatible_environment_template list ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  status:template_version_status ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> service_template_version

val make_update_service_template_version_output :
  service_template_version:service_template_version -> unit
-> update_service_template_version_output

val make_compatible_environment_template_input :
  major_version:string -> template_name:string -> unit
-> compatible_environment_template_input

val make_update_service_template_version_input :
  ?supported_component_sources:service_template_supported_component_source_type list ->
  ?compatible_environment_templates:compatible_environment_template_input list ->
  ?status:template_version_status ->
  ?description:string ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit -> update_service_template_version_input

val make_service_template :
  ?pipeline_provisioning:provisioning ->
  ?encryption_key:string ->
  ?recommended_version:string ->
  ?description:string ->
  ?display_name:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit -> service_template

val make_update_service_template_output :
  service_template:service_template -> unit
-> update_service_template_output

val make_update_service_template_input :
  ?description:string -> ?display_name:string -> name:string -> unit
-> update_service_template_input

val make_service_sync_config :
  file_path:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  service_name:string ->
  unit -> service_sync_config

val make_update_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit
-> update_service_sync_config_output

val make_update_service_sync_config_input :
  file_path:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  service_name:string ->
  unit -> update_service_sync_config_input

val make_sync_blocker_context : value:string -> key:string -> unit
-> sync_blocker_context

val make_sync_blocker :
  ?resolved_at:float ->
  ?resolved_reason:string ->
  ?contexts:sync_blocker_context list ->
  created_at:float ->
  created_reason:string ->
  status:blocker_status ->
  type_:blocker_type ->
  id:string ->
  unit -> sync_blocker

val make_update_service_sync_blocker_output :
  ?service_instance_name:string ->
  service_sync_blocker:sync_blocker ->
  service_name:string ->
  unit
-> update_service_sync_blocker_output

val make_update_service_sync_blocker_input :
  resolved_reason:string -> id:string -> unit
-> update_service_sync_blocker_input

val make_service_pipeline :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?spec:string ->
  ?deployment_status_message:string ->
  deployment_status:deployment_status ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  last_deployment_succeeded_at:float ->
  last_deployment_attempted_at:float ->
  created_at:float ->
  arn:string ->
  unit -> service_pipeline

val make_update_service_pipeline_output : pipeline:service_pipeline -> unit
-> update_service_pipeline_output

val make_update_service_pipeline_input :
  ?template_minor_version:string ->
  ?template_major_version:string ->
  deployment_type:deployment_update_type ->
  spec:string ->
  service_name:string ->
  unit -> update_service_pipeline_input

val make_service :
  ?branch_name:string ->
  ?repository_id:string ->
  ?repository_connection_arn:string ->
  ?pipeline:service_pipeline ->
  ?status_message:string ->
  ?description:string ->
  spec:string ->
  status:service_status ->
  last_modified_at:float ->
  created_at:float ->
  template_name:string ->
  arn:string ->
  name:string ->
  unit -> service

val make_update_service_output : service:service -> unit
-> update_service_output

val make_service_instance :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?last_client_request_token:string ->
  ?spec:string ->
  ?deployment_status_message:string ->
  deployment_status:deployment_status ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  environment_name:string ->
  service_name:string ->
  last_deployment_succeeded_at:float ->
  last_deployment_attempted_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit -> service_instance

val make_update_service_instance_output :
  service_instance:service_instance -> unit
-> update_service_instance_output

val make_update_service_instance_input :
  ?client_token:string ->
  ?template_minor_version:string ->
  ?template_major_version:string ->
  ?spec:string ->
  deployment_type:deployment_update_type ->
  service_name:string ->
  name:string ->
  unit -> update_service_instance_input

val make_update_service_input :
  ?spec:string -> ?description:string -> name:string -> unit
-> update_service_input

val make_environment_template_version :
  ?schema:string ->
  ?description:string ->
  ?status_message:string ->
  ?recommended_minor_version:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  status:template_version_status ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> environment_template_version

val make_update_environment_template_version_output :
  environment_template_version:environment_template_version -> unit
-> update_environment_template_version_output

val make_update_environment_template_version_input :
  ?status:template_version_status ->
  ?description:string ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> update_environment_template_version_input

val make_environment_template :
  ?provisioning:provisioning ->
  ?encryption_key:string ->
  ?recommended_version:string ->
  ?description:string ->
  ?display_name:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit -> environment_template

val make_update_environment_template_output :
  environment_template:environment_template -> unit
-> update_environment_template_output

val make_update_environment_template_input :
  ?description:string -> ?display_name:string -> name:string -> unit
-> update_environment_template_input

val make_repository_branch :
  branch:string ->
  name:string ->
  provider:repository_provider ->
  arn:string ->
  unit -> repository_branch

val make_environment :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  ?provisioning_repository:repository_branch ->
  ?provisioning:provisioning ->
  ?spec:string ->
  ?environment_account_id:string ->
  ?environment_account_connection_id:string ->
  ?proton_service_role_arn:string ->
  ?deployment_status_message:string ->
  ?description:string ->
  deployment_status:deployment_status ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  arn:string ->
  last_deployment_succeeded_at:float ->
  last_deployment_attempted_at:float ->
  created_at:float ->
  name:string ->
  unit -> environment

val make_update_environment_output : environment:environment -> unit
-> update_environment_output

val make_repository_branch_input :
  branch:string -> name:string -> provider:repository_provider -> unit
-> repository_branch_input

val make_update_environment_input :
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  ?provisioning_repository:repository_branch_input ->
  ?environment_account_connection_id:string ->
  ?proton_service_role_arn:string ->
  ?template_minor_version:string ->
  ?template_major_version:string ->
  ?spec:string ->
  ?description:string ->
  deployment_type:deployment_update_type ->
  name:string ->
  unit -> update_environment_input

val make_environment_account_connection :
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  status:environment_account_connection_status ->
  last_modified_at:float ->
  requested_at:float ->
  environment_name:string ->
  role_arn:string ->
  environment_account_id:string ->
  management_account_id:string ->
  arn:string ->
  id:string ->
  unit
-> environment_account_connection

val make_update_environment_account_connection_output :
  environment_account_connection:environment_account_connection -> unit
-> update_environment_account_connection_output

val make_update_environment_account_connection_input :
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  ?role_arn:string ->
  id:string ->
  unit -> update_environment_account_connection_input

val make_component :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?last_client_request_token:string ->
  ?service_spec:string ->
  ?deployment_status_message:string ->
  ?last_deployment_succeeded_at:float ->
  ?last_deployment_attempted_at:float ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?description:string ->
  deployment_status:deployment_status ->
  last_modified_at:float ->
  created_at:float ->
  environment_name:string ->
  arn:string ->
  name:string ->
  unit -> component

val make_update_component_output : component:component -> unit
-> update_component_output

val make_update_component_input :
  ?client_token:string ->
  ?template_file:string ->
  ?service_spec:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?description:string ->
  deployment_type:component_deployment_update_type ->
  name:string ->
  unit -> update_component_input

val make_account_settings :
  ?pipeline_codebuild_role_arn:string ->
  ?pipeline_provisioning_repository:repository_branch ->
  ?pipeline_service_role_arn:string ->
  unit -> account_settings

val make_update_account_settings_output :
  account_settings:account_settings -> unit
-> update_account_settings_output

val make_update_account_settings_input :
  ?pipeline_codebuild_role_arn:string ->
  ?delete_pipeline_provisioning_repository:bool ->
  ?pipeline_provisioning_repository:repository_branch_input ->
  ?pipeline_service_role_arn:string ->
  unit -> update_account_settings_input

val make_untag_resource_output : unit
-> untag_resource_output

val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_input

val make_s3_object_source : key:string -> bucket:string -> unit
-> s3_object_source

val make_tag_resource_output : unit -> tag_resource_output

val make_tag : value:string -> key:string -> unit
-> tag

val make_tag_resource_input : tags:tag list -> resource_arn:string -> unit
-> tag_resource_input

val make_service_template_version_summary :
  ?description:string ->
  ?status_message:string ->
  ?recommended_minor_version:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  status:template_version_status ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit -> service_template_version_summary

val make_service_template_summary :
  ?pipeline_provisioning:provisioning ->
  ?recommended_version:string ->
  ?description:string ->
  ?display_name:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit -> service_template_summary

val make_service_sync_blocker_summary :
  ?latest_blockers:sync_blocker list ->
  ?service_instance_name:string ->
  service_name:string ->
  unit -> service_sync_blocker_summary

val make_service_summary :
  ?status_message:string ->
  ?description:string ->
  status:service_status ->
  last_modified_at:float ->
  created_at:float ->
  template_name:string ->
  arn:string ->
  name:string ->
  unit -> service_summary

val make_service_pipeline_state :
  ?spec:string ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  unit -> service_pipeline_state

val make_service_instance_summary :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?deployment_status_message:string ->
  deployment_status:deployment_status ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  environment_name:string ->
  service_name:string ->
  last_deployment_succeeded_at:float ->
  last_deployment_attempted_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit -> service_instance_summary

val make_service_instance_state :
  ?last_successful_service_pipeline_deployment_id:string ->
  ?last_successful_environment_deployment_id:string ->
  ?last_successful_component_deployment_ids:string list ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  spec:string ->
  unit -> service_instance_state

val make_revision :
  branch:string ->
  directory:string ->
  sha:string ->
  repository_provider:repository_provider ->
  repository_name:string ->
  unit -> revision

val make_resource_sync_event :
  ?external_id:string -> event:string -> time:float -> type_:string -> unit
-> resource_sync_event

val make_resource_sync_attempt :
  events:resource_sync_event list ->
  status:resource_sync_status ->
  started_at:float ->
  target:string ->
  target_revision:revision ->
  initial_revision:revision ->
  unit -> resource_sync_attempt

val make_resource_counts_summary :
  ?behind_minor:int ->
  ?behind_major:int ->
  ?up_to_date:int ->
  ?failed:int ->
  total:int ->
  unit -> resource_counts_summary

val make_repository_sync_event :
  ?external_id:string -> event:string -> time:float -> type_:string -> unit
-> repository_sync_event

val make_repository_sync_definition :
  directory:string -> branch:string -> parent:string -> target:string -> unit
-> repository_sync_definition

val make_repository_sync_attempt :
  events:repository_sync_event list ->
  status:repository_sync_status ->
  started_at:float ->
  unit -> repository_sync_attempt

val make_repository_summary :
  connection_arn:string ->
  name:string ->
  provider:repository_provider ->
  arn:string ->
  unit -> repository_summary

val make_repository :
  ?encryption_key:string ->
  connection_arn:string ->
  name:string ->
  provider:repository_provider ->
  arn:string ->
  unit -> repository

val make_reject_environment_account_connection_output :
  environment_account_connection:environment_account_connection -> unit
-> reject_environment_account_connection_output

val make_reject_environment_account_connection_input : id:string -> unit
-> reject_environment_account_connection_input

val make_provisioned_resource :
  ?provisioning_engine:provisioned_resource_engine ->
  ?identifier:string ->
  ?name:string ->
  unit -> provisioned_resource

val make_output : ?value_string:string -> ?key:string -> unit
-> output

val make_notify_resource_deployment_status_change_output : unit
-> notify_resource_deployment_status_change_output

val make_notify_resource_deployment_status_change_input :
  ?status_message:string ->
  ?deployment_id:string ->
  ?outputs:output list ->
  ?status:resource_deployment_status ->
  resource_arn:string ->
  unit
-> notify_resource_deployment_status_change_input

val make_list_tags_for_resource_output :
  ?next_token:string -> tags:tag list -> unit
-> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?max_results:int -> ?next_token:string -> resource_arn:string -> unit
-> list_tags_for_resource_input

val make_list_services_output :
  ?next_token:string -> services:service_summary list -> unit
-> list_services_output

val make_list_services_input : ?max_results:int -> ?next_token:string -> unit
-> list_services_input

val make_list_service_templates_output :
  ?next_token:string -> templates:service_template_summary list -> unit
-> list_service_templates_output

val make_list_service_templates_input :
  ?max_results:int -> ?next_token:string -> unit
-> list_service_templates_input

val make_list_service_template_versions_output :
  ?next_token:string ->
  template_versions:service_template_version_summary list ->
  unit
-> list_service_template_versions_output

val make_list_service_template_versions_input :
  ?major_version:string ->
  ?max_results:int ->
  ?next_token:string ->
  template_name:string ->
  unit
-> list_service_template_versions_input

val make_list_service_pipeline_provisioned_resources_output :
  ?next_token:string ->
  provisioned_resources:provisioned_resource list ->
  unit
-> list_service_pipeline_provisioned_resources_output

val make_list_service_pipeline_provisioned_resources_input :
  ?next_token:string -> service_name:string -> unit
-> list_service_pipeline_provisioned_resources_input

val make_list_service_pipeline_outputs_output :
  ?next_token:string -> outputs:output list -> unit
-> list_service_pipeline_outputs_output

val make_list_service_pipeline_outputs_input :
  ?deployment_id:string -> ?next_token:string -> service_name:string -> unit
-> list_service_pipeline_outputs_input

val make_list_service_instances_output :
  ?next_token:string ->
  service_instances:service_instance_summary list ->
  unit
-> list_service_instances_output

val make_list_service_instances_filter :
  ?value:string -> ?key:list_service_instances_filter_by -> unit
-> list_service_instances_filter

val make_list_service_instances_input :
  ?sort_order:sort_order ->
  ?sort_by:list_service_instances_sort_by ->
  ?filters:list_service_instances_filter list ->
  ?max_results:int ->
  ?next_token:string ->
  ?service_name:string ->
  unit
-> list_service_instances_input

val make_list_service_instance_provisioned_resources_output :
  ?next_token:string ->
  provisioned_resources:provisioned_resource list ->
  unit
-> list_service_instance_provisioned_resources_output

val make_list_service_instance_provisioned_resources_input :
  ?next_token:string ->
  service_instance_name:string ->
  service_name:string ->
  unit
-> list_service_instance_provisioned_resources_input

val make_list_service_instance_outputs_output :
  ?next_token:string -> outputs:output list -> unit
-> list_service_instance_outputs_output

val make_list_service_instance_outputs_input :
  ?deployment_id:string ->
  ?next_token:string ->
  service_name:string ->
  service_instance_name:string ->
  unit
-> list_service_instance_outputs_input

val make_list_repository_sync_definitions_output :
  ?next_token:string ->
  sync_definitions:repository_sync_definition list ->
  unit
-> list_repository_sync_definitions_output

val make_list_repository_sync_definitions_input :
  ?next_token:string ->
  sync_type:sync_type ->
  repository_provider:repository_provider ->
  repository_name:string ->
  unit
-> list_repository_sync_definitions_input

val make_list_repositories_output :
  ?next_token:string -> repositories:repository_summary list -> unit
-> list_repositories_output

val make_list_repositories_input :
  ?max_results:int -> ?next_token:string -> unit
-> list_repositories_input

val make_environment_summary :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?component_role_arn:string ->
  ?provisioning:provisioning ->
  ?environment_account_id:string ->
  ?environment_account_connection_id:string ->
  ?proton_service_role_arn:string ->
  ?deployment_status_message:string ->
  ?description:string ->
  deployment_status:deployment_status ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  arn:string ->
  last_deployment_succeeded_at:float ->
  last_deployment_attempted_at:float ->
  created_at:float ->
  name:string ->
  unit -> environment_summary

val make_list_environments_output :
  ?next_token:string -> environments:environment_summary list -> unit
-> list_environments_output

val make_environment_template_filter :
  major_version:string -> template_name:string -> unit
-> environment_template_filter

val make_list_environments_input :
  ?environment_templates:environment_template_filter list ->
  ?max_results:int ->
  ?next_token:string ->
  unit -> list_environments_input

val make_environment_template_summary :
  ?provisioning:provisioning ->
  ?recommended_version:string ->
  ?description:string ->
  ?display_name:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  name:string ->
  unit
-> environment_template_summary

val make_list_environment_templates_output :
  ?next_token:string -> templates:environment_template_summary list -> unit
-> list_environment_templates_output

val make_list_environment_templates_input :
  ?max_results:int -> ?next_token:string -> unit
-> list_environment_templates_input

val make_environment_template_version_summary :
  ?description:string ->
  ?status_message:string ->
  ?recommended_minor_version:string ->
  last_modified_at:float ->
  created_at:float ->
  arn:string ->
  status:template_version_status ->
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> environment_template_version_summary

val make_list_environment_template_versions_output :
  ?next_token:string ->
  template_versions:environment_template_version_summary list ->
  unit
-> list_environment_template_versions_output

val make_list_environment_template_versions_input :
  ?major_version:string ->
  ?max_results:int ->
  ?next_token:string ->
  template_name:string ->
  unit
-> list_environment_template_versions_input

val make_list_environment_provisioned_resources_output :
  ?next_token:string ->
  provisioned_resources:provisioned_resource list ->
  unit
-> list_environment_provisioned_resources_output

val make_list_environment_provisioned_resources_input :
  ?next_token:string -> environment_name:string -> unit
-> list_environment_provisioned_resources_input

val make_list_environment_outputs_output :
  ?next_token:string -> outputs:output list -> unit
-> list_environment_outputs_output

val make_list_environment_outputs_input :
  ?deployment_id:string ->
  ?next_token:string ->
  environment_name:string ->
  unit
-> list_environment_outputs_input

val make_environment_account_connection_summary :
  ?component_role_arn:string ->
  status:environment_account_connection_status ->
  last_modified_at:float ->
  requested_at:float ->
  environment_name:string ->
  role_arn:string ->
  environment_account_id:string ->
  management_account_id:string ->
  arn:string ->
  id:string ->
  unit
-> environment_account_connection_summary

val make_list_environment_account_connections_output :
  ?next_token:string ->
  environment_account_connections:environment_account_connection_summary list ->
  unit
-> list_environment_account_connections_output

val make_list_environment_account_connections_input :
  ?max_results:int ->
  ?next_token:string ->
  ?statuses:environment_account_connection_status list ->
  ?environment_name:string ->
  requested_by:environment_account_connection_requester_account_type ->
  unit
-> list_environment_account_connections_input

val make_deployment_summary :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?component_name:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?completed_at:float ->
  deployment_status:deployment_status ->
  environment_name:string ->
  last_modified_at:float ->
  created_at:float ->
  target_resource_type:deployment_target_resource_type ->
  target_resource_created_at:float ->
  target_arn:string ->
  arn:string ->
  id:string ->
  unit -> deployment_summary

val make_list_deployments_output :
  ?next_token:string -> deployments:deployment_summary list -> unit
-> list_deployments_output

val make_list_deployments_input :
  ?max_results:int ->
  ?component_name:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?environment_name:string ->
  ?next_token:string ->
  unit -> list_deployments_input

val make_component_summary :
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?deployment_status_message:string ->
  ?last_deployment_succeeded_at:float ->
  ?last_deployment_attempted_at:float ->
  ?service_instance_name:string ->
  ?service_name:string ->
  deployment_status:deployment_status ->
  last_modified_at:float ->
  created_at:float ->
  environment_name:string ->
  arn:string ->
  name:string ->
  unit -> component_summary

val make_list_components_output :
  ?next_token:string -> components:component_summary list -> unit
-> list_components_output

val make_list_components_input :
  ?max_results:int ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?environment_name:string ->
  ?next_token:string ->
  unit
-> list_components_input

val make_list_component_provisioned_resources_output :
  ?next_token:string ->
  provisioned_resources:provisioned_resource list ->
  unit
-> list_component_provisioned_resources_output

val make_list_component_provisioned_resources_input :
  ?next_token:string -> component_name:string -> unit
-> list_component_provisioned_resources_input

val make_list_component_outputs_output :
  ?next_token:string -> outputs:output list -> unit
-> list_component_outputs_output

val make_list_component_outputs_input :
  ?deployment_id:string ->
  ?next_token:string ->
  component_name:string ->
  unit
-> list_component_outputs_input

val make_get_template_sync_status_output :
  ?desired_state:revision ->
  ?latest_successful_sync:resource_sync_attempt ->
  ?latest_sync:resource_sync_attempt ->
  unit
-> get_template_sync_status_output

val make_get_template_sync_status_input :
  template_version:string ->
  template_type:template_type ->
  template_name:string ->
  unit
-> get_template_sync_status_input

val make_get_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit
-> get_template_sync_config_output

val make_get_template_sync_config_input :
  template_type:template_type -> template_name:string -> unit
-> get_template_sync_config_input

val make_get_service_template_version_output :
  service_template_version:service_template_version -> unit
-> get_service_template_version_output

val make_get_service_template_version_input :
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> get_service_template_version_input

val make_get_service_template_output :
  service_template:service_template -> unit
-> get_service_template_output

val make_get_service_template_input : name:string -> unit
-> get_service_template_input

val make_get_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit
-> get_service_sync_config_output

val make_get_service_sync_config_input : service_name:string -> unit
-> get_service_sync_config_input

val make_get_service_sync_blocker_summary_output :
  ?service_sync_blocker_summary:service_sync_blocker_summary -> unit
-> get_service_sync_blocker_summary_output

val make_get_service_sync_blocker_summary_input :
  ?service_instance_name:string -> service_name:string -> unit
-> get_service_sync_blocker_summary_input

val make_get_service_output : ?service:service -> unit
-> get_service_output

val make_get_service_instance_sync_status_output :
  ?desired_state:revision ->
  ?latest_successful_sync:resource_sync_attempt ->
  ?latest_sync:resource_sync_attempt ->
  unit
-> get_service_instance_sync_status_output

val make_get_service_instance_sync_status_input :
  service_instance_name:string -> service_name:string -> unit
-> get_service_instance_sync_status_input

val make_get_service_instance_output :
  service_instance:service_instance -> unit
-> get_service_instance_output

val make_get_service_instance_input :
  service_name:string -> name:string -> unit
-> get_service_instance_input

val make_get_service_input : name:string -> unit
-> get_service_input

val make_counts_summary :
  ?pipelines:resource_counts_summary ->
  ?service_templates:resource_counts_summary ->
  ?services:resource_counts_summary ->
  ?service_instances:resource_counts_summary ->
  ?environment_templates:resource_counts_summary ->
  ?environments:resource_counts_summary ->
  ?components:resource_counts_summary ->
  unit -> counts_summary

val make_get_resources_summary_output : counts:counts_summary -> unit
-> get_resources_summary_output

val make_get_resources_summary_input : unit
-> get_resources_summary_input

val make_get_repository_sync_status_output :
  ?latest_sync:repository_sync_attempt -> unit
-> get_repository_sync_status_output

val make_get_repository_sync_status_input :
  sync_type:sync_type ->
  branch:string ->
  repository_provider:repository_provider ->
  repository_name:string ->
  unit -> get_repository_sync_status_input

val make_get_repository_output : repository:repository -> unit
-> get_repository_output

val make_get_repository_input :
  name:string -> provider:repository_provider -> unit
-> get_repository_input

val make_get_environment_template_version_output :
  environment_template_version:environment_template_version -> unit
-> get_environment_template_version_output

val make_get_environment_template_version_input :
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> get_environment_template_version_input

val make_get_environment_template_output :
  environment_template:environment_template -> unit
-> get_environment_template_output

val make_get_environment_template_input : name:string -> unit
-> get_environment_template_input

val make_get_environment_output : environment:environment -> unit
-> get_environment_output

val make_get_environment_input : name:string -> unit
-> get_environment_input

val make_get_environment_account_connection_output :
  environment_account_connection:environment_account_connection -> unit
-> get_environment_account_connection_output

val make_get_environment_account_connection_input : id:string -> unit
-> get_environment_account_connection_input

val make_environment_state :
  ?spec:string ->
  template_minor_version:string ->
  template_major_version:string ->
  template_name:string ->
  unit -> environment_state

val make_component_state :
  ?template_file:string ->
  ?service_spec:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  unit -> component_state

val make_deployment :
  ?target_state:deployment_state ->
  ?initial_state:deployment_state ->
  ?last_succeeded_deployment_id:string ->
  ?last_attempted_deployment_id:string ->
  ?completed_at:float ->
  ?deployment_status_message:string ->
  ?component_name:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  last_modified_at:float ->
  created_at:float ->
  deployment_status:deployment_status ->
  environment_name:string ->
  target_resource_type:deployment_target_resource_type ->
  target_resource_created_at:float ->
  target_arn:string ->
  arn:string ->
  id:string ->
  unit -> deployment

val make_get_deployment_output : ?deployment:deployment -> unit
-> get_deployment_output

val make_get_deployment_input :
  ?component_name:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?environment_name:string ->
  id:string ->
  unit -> get_deployment_input

val make_get_component_output : ?component:component -> unit
-> get_component_output

val make_get_component_input : name:string -> unit
-> get_component_input

val make_get_account_settings_output :
  ?account_settings:account_settings -> unit
-> get_account_settings_output

val make_get_account_settings_input : unit
-> get_account_settings_input

val make_delete_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit
-> delete_template_sync_config_output

val make_delete_template_sync_config_input :
  template_type:template_type -> template_name:string -> unit
-> delete_template_sync_config_input

val make_delete_service_template_version_output :
  ?service_template_version:service_template_version -> unit
-> delete_service_template_version_output

val make_delete_service_template_version_input :
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> delete_service_template_version_input

val make_delete_service_template_output :
  ?service_template:service_template -> unit
-> delete_service_template_output

val make_delete_service_template_input : name:string -> unit
-> delete_service_template_input

val make_delete_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit
-> delete_service_sync_config_output

val make_delete_service_sync_config_input : service_name:string -> unit
-> delete_service_sync_config_input

val make_delete_service_output : ?service:service -> unit
-> delete_service_output

val make_delete_service_input : name:string -> unit
-> delete_service_input

val make_delete_repository_output : ?repository:repository -> unit
-> delete_repository_output

val make_delete_repository_input :
  name:string -> provider:repository_provider -> unit
-> delete_repository_input

val make_delete_environment_template_version_output :
  ?environment_template_version:environment_template_version -> unit
-> delete_environment_template_version_output

val make_delete_environment_template_version_input :
  minor_version:string ->
  major_version:string ->
  template_name:string ->
  unit
-> delete_environment_template_version_input

val make_delete_environment_template_output :
  ?environment_template:environment_template -> unit
-> delete_environment_template_output

val make_delete_environment_template_input : name:string -> unit
-> delete_environment_template_input

val make_delete_environment_output : ?environment:environment -> unit
-> delete_environment_output

val make_delete_environment_input : name:string -> unit
-> delete_environment_input

val make_delete_environment_account_connection_output :
  ?environment_account_connection:environment_account_connection -> unit
-> delete_environment_account_connection_output

val make_delete_environment_account_connection_input : id:string -> unit
-> delete_environment_account_connection_input

val make_delete_deployment_output : ?deployment:deployment -> unit
-> delete_deployment_output

val make_delete_deployment_input : id:string -> unit
-> delete_deployment_input

val make_delete_component_output : ?component:component -> unit
-> delete_component_output

val make_delete_component_input : name:string -> unit
-> delete_component_input

val make_create_template_sync_config_output :
  ?template_sync_config:template_sync_config -> unit
-> create_template_sync_config_output

val make_create_template_sync_config_input :
  ?subdirectory:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  template_type:template_type ->
  template_name:string ->
  unit
-> create_template_sync_config_input

val make_create_service_template_version_output :
  service_template_version:service_template_version -> unit
-> create_service_template_version_output

val make_create_service_template_version_input :
  ?supported_component_sources:service_template_supported_component_source_type list ->
  ?tags:tag list ->
  ?major_version:string ->
  ?description:string ->
  ?client_token:string ->
  compatible_environment_templates:compatible_environment_template_input list ->
  source:template_version_source_input ->
  template_name:string ->
  unit
-> create_service_template_version_input

val make_create_service_template_output :
  service_template:service_template -> unit
-> create_service_template_output

val make_create_service_template_input :
  ?tags:tag list ->
  ?pipeline_provisioning:provisioning ->
  ?encryption_key:string ->
  ?description:string ->
  ?display_name:string ->
  name:string ->
  unit
-> create_service_template_input

val make_create_service_sync_config_output :
  ?service_sync_config:service_sync_config -> unit
-> create_service_sync_config_output

val make_create_service_sync_config_input :
  file_path:string ->
  branch:string ->
  repository_name:string ->
  repository_provider:repository_provider ->
  service_name:string ->
  unit -> create_service_sync_config_input

val make_create_service_output : service:service -> unit
-> create_service_output

val make_create_service_instance_output :
  service_instance:service_instance -> unit
-> create_service_instance_output

val make_create_service_instance_input :
  ?client_token:string ->
  ?tags:tag list ->
  ?template_minor_version:string ->
  ?template_major_version:string ->
  spec:string ->
  service_name:string ->
  name:string ->
  unit -> create_service_instance_input

val make_create_service_input :
  ?tags:tag list ->
  ?branch_name:string ->
  ?repository_id:string ->
  ?repository_connection_arn:string ->
  ?template_minor_version:string ->
  ?description:string ->
  spec:string ->
  template_major_version:string ->
  template_name:string ->
  name:string ->
  unit -> create_service_input

val make_create_repository_output : repository:repository -> unit
-> create_repository_output

val make_create_repository_input :
  ?tags:tag list ->
  ?encryption_key:string ->
  connection_arn:string ->
  name:string ->
  provider:repository_provider ->
  unit
-> create_repository_input

val make_create_environment_template_version_output :
  environment_template_version:environment_template_version -> unit
-> create_environment_template_version_output

val make_create_environment_template_version_input :
  ?tags:tag list ->
  ?major_version:string ->
  ?description:string ->
  ?client_token:string ->
  source:template_version_source_input ->
  template_name:string ->
  unit
-> create_environment_template_version_input

val make_create_environment_template_output :
  environment_template:environment_template -> unit
-> create_environment_template_output

val make_create_environment_template_input :
  ?tags:tag list ->
  ?provisioning:provisioning ->
  ?encryption_key:string ->
  ?description:string ->
  ?display_name:string ->
  name:string ->
  unit
-> create_environment_template_input

val make_create_environment_output : environment:environment -> unit
-> create_environment_output

val make_create_environment_input :
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  ?provisioning_repository:repository_branch_input ->
  ?tags:tag list ->
  ?environment_account_connection_id:string ->
  ?proton_service_role_arn:string ->
  ?description:string ->
  ?template_minor_version:string ->
  spec:string ->
  template_major_version:string ->
  template_name:string ->
  name:string ->
  unit
-> create_environment_input

val make_create_environment_account_connection_output :
  environment_account_connection:environment_account_connection -> unit
-> create_environment_account_connection_output

val make_create_environment_account_connection_input :
  ?codebuild_role_arn:string ->
  ?component_role_arn:string ->
  ?tags:tag list ->
  ?role_arn:string ->
  ?client_token:string ->
  environment_name:string ->
  management_account_id:string ->
  unit
-> create_environment_account_connection_input

val make_create_component_output : component:component -> unit
-> create_component_output

val make_create_component_input :
  ?client_token:string ->
  ?tags:tag list ->
  ?service_spec:string ->
  ?environment_name:string ->
  ?service_instance_name:string ->
  ?service_name:string ->
  ?description:string ->
  manifest:string ->
  template_file:string ->
  name:string ->
  unit
-> create_component_input

val make_cancel_service_pipeline_deployment_output :
  pipeline:service_pipeline -> unit
-> cancel_service_pipeline_deployment_output

val make_cancel_service_pipeline_deployment_input :
  service_name:string -> unit
-> cancel_service_pipeline_deployment_input

val make_cancel_service_instance_deployment_output :
  service_instance:service_instance -> unit
-> cancel_service_instance_deployment_output

val make_cancel_service_instance_deployment_input :
  service_name:string -> service_instance_name:string -> unit
-> cancel_service_instance_deployment_input

val make_cancel_environment_deployment_output :
  environment:environment -> unit
-> cancel_environment_deployment_output

val make_cancel_environment_deployment_input :
  environment_name:string -> unit
-> cancel_environment_deployment_input

val make_cancel_component_deployment_output : component:component -> unit
-> cancel_component_deployment_output

val make_cancel_component_deployment_input : component_name:string -> unit
-> cancel_component_deployment_input

val make_accept_environment_account_connection_output :
  environment_account_connection:environment_account_connection -> unit
-> accept_environment_account_connection_output

val make_accept_environment_account_connection_input : id:string -> unit
-> accept_environment_account_connection_input

