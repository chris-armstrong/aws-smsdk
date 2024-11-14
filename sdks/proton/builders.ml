[@@@warning "-39"]
open Types
let make_template_sync_config 
  ?(subdirectory : string option)
  ~(branch : string)
  ~(repository_name : string)
  ~(repository_provider : repository_provider)
  ~(template_type : template_type)
  ~(template_name : string)
  () : template_sync_config = {
  subdirectory;
  branch;
  repository_name;
  repository_provider;
  template_type;
  template_name;
   }

let make_update_template_sync_config_output 
  ?(template_sync_config : template_sync_config option) ()
: update_template_sync_config_output = { template_sync_config; 
}

let make_update_template_sync_config_input 
  ?(subdirectory : string option)
  ~(branch : string)
  ~(repository_name : string)
  ~(repository_provider : repository_provider)
  ~(template_type : template_type)
  ~(template_name : string)
  () : update_template_sync_config_input = {
  subdirectory;
  branch;
  repository_name;
  repository_provider;
  template_type;
  template_name;
   }

let make_compatible_environment_template 
  ~(major_version : string) ~(template_name : string) ()
: compatible_environment_template = { major_version; template_name; 
}

let make_service_template_version 
  ?(supported_component_sources : service_template_supported_component_source_type list option)
  ?(schema : string option)
  ?(description : string option)
  ?(status_message : string option)
  ?(recommended_minor_version : string option)
  ~(compatible_environment_templates : compatible_environment_template list)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(arn : string)
  ~(status : template_version_status)
  ~(minor_version : string)
  ~(major_version : string)
  ~(template_name : string)
  () : service_template_version = {
  supported_component_sources;
  schema;
  compatible_environment_templates;
  last_modified_at;
  created_at;
  arn;
  description;
  status_message;
  status;
  recommended_minor_version;
  minor_version;
  major_version;
  template_name;
   }

let make_update_service_template_version_output 
  ~(service_template_version : service_template_version) ()
: update_service_template_version_output = { service_template_version; 
}

let make_compatible_environment_template_input 
  ~(major_version : string) ~(template_name : string) ()
: compatible_environment_template_input = { major_version; template_name; 
}

let make_update_service_template_version_input 
  ?(supported_component_sources : service_template_supported_component_source_type list option)
  ?(compatible_environment_templates : compatible_environment_template_input list option)
  ?(status : template_version_status option)
  ?(description : string option)
  ~(minor_version : string)
  ~(major_version : string)
  ~(template_name : string)
  () : update_service_template_version_input = {
  supported_component_sources;
  compatible_environment_templates;
  status;
  description;
  minor_version;
  major_version;
  template_name;
   }

let make_service_template 
  ?(pipeline_provisioning : provisioning option)
  ?(encryption_key : string option)
  ?(recommended_version : string option)
  ?(description : string option)
  ?(display_name : string option)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(arn : string)
  ~(name : string)
  () : service_template = {
  pipeline_provisioning;
  encryption_key;
  recommended_version;
  description;
  display_name;
  last_modified_at;
  created_at;
  arn;
  name;
   }

let make_update_service_template_output 
  ~(service_template : service_template) () : update_service_template_output
= { service_template;  }

let make_update_service_template_input 
  ?(description : string option)
  ?(display_name : string option)
  ~(name : string)
  () : update_service_template_input = { description; display_name; name; 
}

let make_service_sync_config 
  ~(file_path : string)
  ~(branch : string)
  ~(repository_name : string)
  ~(repository_provider : repository_provider)
  ~(service_name : string)
  () : service_sync_config = {
  file_path; branch; repository_name; repository_provider; service_name; 
}

let make_update_service_sync_config_output 
  ?(service_sync_config : service_sync_config option) ()
: update_service_sync_config_output = { service_sync_config; 
}

let make_update_service_sync_config_input 
  ~(file_path : string)
  ~(branch : string)
  ~(repository_name : string)
  ~(repository_provider : repository_provider)
  ~(service_name : string)
  () : update_service_sync_config_input = {
  file_path; branch; repository_name; repository_provider; service_name; 
}

let make_sync_blocker_context  ~(value : string) ~(key : string) ()
: sync_blocker_context = { value; key;  }

let make_sync_blocker 
  ?(resolved_at : float option)
  ?(resolved_reason : string option)
  ?(contexts : sync_blocker_context list option)
  ~(created_at : float)
  ~(created_reason : string)
  ~(status : blocker_status)
  ~(type_ : blocker_type)
  ~(id : string)
  () : sync_blocker = {
  resolved_at;
  resolved_reason;
  contexts;
  created_at;
  created_reason;
  status;
  type_;
  id;
   }

let make_update_service_sync_blocker_output 
  ?(service_instance_name : string option)
  ~(service_sync_blocker : sync_blocker)
  ~(service_name : string)
  () : update_service_sync_blocker_output = {
  service_sync_blocker; service_instance_name; service_name; 
}

let make_update_service_sync_blocker_input 
  ~(resolved_reason : string) ~(id : string) ()
: update_service_sync_blocker_input = { resolved_reason; id; 
}

let make_service_pipeline 
  ?(last_succeeded_deployment_id : string option)
  ?(last_attempted_deployment_id : string option)
  ?(spec : string option)
  ?(deployment_status_message : string option)
  ~(deployment_status : deployment_status)
  ~(template_minor_version : string)
  ~(template_major_version : string)
  ~(template_name : string)
  ~(last_deployment_succeeded_at : float)
  ~(last_deployment_attempted_at : float)
  ~(created_at : float)
  ~(arn : string)
  () : service_pipeline = {
  last_succeeded_deployment_id;
  last_attempted_deployment_id;
  spec;
  deployment_status_message;
  deployment_status;
  template_minor_version;
  template_major_version;
  template_name;
  last_deployment_succeeded_at;
  last_deployment_attempted_at;
  created_at;
  arn;
   }

let make_update_service_pipeline_output  ~(pipeline : service_pipeline) ()
: update_service_pipeline_output = { pipeline; 
}

let make_update_service_pipeline_input 
  ?(template_minor_version : string option)
  ?(template_major_version : string option)
  ~(deployment_type : deployment_update_type)
  ~(spec : string)
  ~(service_name : string)
  () : update_service_pipeline_input = {
  template_minor_version;
  template_major_version;
  deployment_type;
  spec;
  service_name;
   }

let make_service 
  ?(branch_name : string option)
  ?(repository_id : string option)
  ?(repository_connection_arn : string option)
  ?(pipeline : service_pipeline option)
  ?(status_message : string option)
  ?(description : string option)
  ~(spec : string)
  ~(status : service_status)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(template_name : string)
  ~(arn : string)
  ~(name : string)
  () : service = {
  branch_name;
  repository_id;
  repository_connection_arn;
  pipeline;
  spec;
  status_message;
  status;
  last_modified_at;
  created_at;
  template_name;
  arn;
  description;
  name;
   }

let make_update_service_output  ~(service : service) ()
: update_service_output = { service;  }

let make_service_instance 
  ?(last_succeeded_deployment_id : string option)
  ?(last_attempted_deployment_id : string option)
  ?(last_client_request_token : string option)
  ?(spec : string option)
  ?(deployment_status_message : string option)
  ~(deployment_status : deployment_status)
  ~(template_minor_version : string)
  ~(template_major_version : string)
  ~(template_name : string)
  ~(environment_name : string)
  ~(service_name : string)
  ~(last_deployment_succeeded_at : float)
  ~(last_deployment_attempted_at : float)
  ~(created_at : float)
  ~(arn : string)
  ~(name : string)
  () : service_instance = {
  last_succeeded_deployment_id;
  last_attempted_deployment_id;
  last_client_request_token;
  spec;
  deployment_status_message;
  deployment_status;
  template_minor_version;
  template_major_version;
  template_name;
  environment_name;
  service_name;
  last_deployment_succeeded_at;
  last_deployment_attempted_at;
  created_at;
  arn;
  name;
   }

let make_update_service_instance_output 
  ~(service_instance : service_instance) () : update_service_instance_output
= { service_instance;  }

let make_update_service_instance_input 
  ?(client_token : string option)
  ?(template_minor_version : string option)
  ?(template_major_version : string option)
  ?(spec : string option)
  ~(deployment_type : deployment_update_type)
  ~(service_name : string)
  ~(name : string)
  () : update_service_instance_input = {
  client_token;
  template_minor_version;
  template_major_version;
  spec;
  deployment_type;
  service_name;
  name;
   }

let make_update_service_input 
  ?(spec : string option) ?(description : string option) ~(name : string) ()
: update_service_input = { spec; description; name; 
}

let make_environment_template_version 
  ?(schema : string option)
  ?(description : string option)
  ?(status_message : string option)
  ?(recommended_minor_version : string option)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(arn : string)
  ~(status : template_version_status)
  ~(minor_version : string)
  ~(major_version : string)
  ~(template_name : string)
  () : environment_template_version = {
  schema;
  last_modified_at;
  created_at;
  arn;
  description;
  status_message;
  status;
  recommended_minor_version;
  minor_version;
  major_version;
  template_name;
   }

let make_update_environment_template_version_output 
  ~(environment_template_version : environment_template_version) ()
: update_environment_template_version_output = {
  environment_template_version; 
}

let make_update_environment_template_version_input 
  ?(status : template_version_status option)
  ?(description : string option)
  ~(minor_version : string)
  ~(major_version : string)
  ~(template_name : string)
  () : update_environment_template_version_input = {
  status; description; minor_version; major_version; template_name; 
}

let make_environment_template 
  ?(provisioning : provisioning option)
  ?(encryption_key : string option)
  ?(recommended_version : string option)
  ?(description : string option)
  ?(display_name : string option)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(arn : string)
  ~(name : string)
  () : environment_template = {
  provisioning;
  encryption_key;
  recommended_version;
  description;
  display_name;
  last_modified_at;
  created_at;
  arn;
  name;
   }

let make_update_environment_template_output 
  ~(environment_template : environment_template) ()
: update_environment_template_output = { environment_template; 
}

let make_update_environment_template_input 
  ?(description : string option)
  ?(display_name : string option)
  ~(name : string)
  () : update_environment_template_input = {
  description; display_name; name;  }

let make_repository_branch 
  ~(branch : string)
  ~(name : string)
  ~(provider : repository_provider)
  ~(arn : string)
  () : repository_branch = { branch; name; provider; arn; 
}

let make_environment 
  ?(last_succeeded_deployment_id : string option)
  ?(last_attempted_deployment_id : string option)
  ?(codebuild_role_arn : string option)
  ?(component_role_arn : string option)
  ?(provisioning_repository : repository_branch option)
  ?(provisioning : provisioning option)
  ?(spec : string option)
  ?(environment_account_id : string option)
  ?(environment_account_connection_id : string option)
  ?(proton_service_role_arn : string option)
  ?(deployment_status_message : string option)
  ?(description : string option)
  ~(deployment_status : deployment_status)
  ~(template_minor_version : string)
  ~(template_major_version : string)
  ~(template_name : string)
  ~(arn : string)
  ~(last_deployment_succeeded_at : float)
  ~(last_deployment_attempted_at : float)
  ~(created_at : float)
  ~(name : string)
  () : environment = {
  last_succeeded_deployment_id;
  last_attempted_deployment_id;
  codebuild_role_arn;
  component_role_arn;
  provisioning_repository;
  provisioning;
  spec;
  environment_account_id;
  environment_account_connection_id;
  proton_service_role_arn;
  deployment_status_message;
  deployment_status;
  template_minor_version;
  template_major_version;
  template_name;
  arn;
  last_deployment_succeeded_at;
  last_deployment_attempted_at;
  created_at;
  description;
  name;
   }

let make_update_environment_output  ~(environment : environment) ()
: update_environment_output = { environment; 
}

let make_repository_branch_input 
  ~(branch : string) ~(name : string) ~(provider : repository_provider) ()
: repository_branch_input = { branch; name; provider; 
}

let make_update_environment_input 
  ?(codebuild_role_arn : string option)
  ?(component_role_arn : string option)
  ?(provisioning_repository : repository_branch_input option)
  ?(environment_account_connection_id : string option)
  ?(proton_service_role_arn : string option)
  ?(template_minor_version : string option)
  ?(template_major_version : string option)
  ?(spec : string option)
  ?(description : string option)
  ~(deployment_type : deployment_update_type)
  ~(name : string)
  () : update_environment_input = {
  codebuild_role_arn;
  component_role_arn;
  provisioning_repository;
  environment_account_connection_id;
  deployment_type;
  proton_service_role_arn;
  template_minor_version;
  template_major_version;
  spec;
  description;
  name;
   }

let make_environment_account_connection 
  ?(codebuild_role_arn : string option)
  ?(component_role_arn : string option)
  ~(status : environment_account_connection_status)
  ~(last_modified_at : float)
  ~(requested_at : float)
  ~(environment_name : string)
  ~(role_arn : string)
  ~(environment_account_id : string)
  ~(management_account_id : string)
  ~(arn : string)
  ~(id : string)
  () : environment_account_connection = {
  codebuild_role_arn;
  component_role_arn;
  status;
  last_modified_at;
  requested_at;
  environment_name;
  role_arn;
  environment_account_id;
  management_account_id;
  arn;
  id;
   }

let make_update_environment_account_connection_output 
  ~(environment_account_connection : environment_account_connection) ()
: update_environment_account_connection_output = {
  environment_account_connection; 
}

let make_update_environment_account_connection_input 
  ?(codebuild_role_arn : string option)
  ?(component_role_arn : string option)
  ?(role_arn : string option)
  ~(id : string)
  () : update_environment_account_connection_input = {
  codebuild_role_arn; component_role_arn; role_arn; id;  }

let make_component 
  ?(last_succeeded_deployment_id : string option)
  ?(last_attempted_deployment_id : string option)
  ?(last_client_request_token : string option)
  ?(service_spec : string option)
  ?(deployment_status_message : string option)
  ?(last_deployment_succeeded_at : float option)
  ?(last_deployment_attempted_at : float option)
  ?(service_instance_name : string option)
  ?(service_name : string option)
  ?(description : string option)
  ~(deployment_status : deployment_status)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(environment_name : string)
  ~(arn : string)
  ~(name : string)
  () : component = {
  last_succeeded_deployment_id;
  last_attempted_deployment_id;
  last_client_request_token;
  service_spec;
  deployment_status_message;
  deployment_status;
  last_deployment_succeeded_at;
  last_deployment_attempted_at;
  last_modified_at;
  created_at;
  service_instance_name;
  service_name;
  environment_name;
  arn;
  description;
  name;
   }

let make_update_component_output  ~(component : component) ()
: update_component_output = { component;  }

let make_update_component_input 
  ?(client_token : string option)
  ?(template_file : string option)
  ?(service_spec : string option)
  ?(service_instance_name : string option)
  ?(service_name : string option)
  ?(description : string option)
  ~(deployment_type : component_deployment_update_type)
  ~(name : string)
  () : update_component_input = {
  client_token;
  template_file;
  service_spec;
  service_instance_name;
  service_name;
  description;
  deployment_type;
  name;
   }

let make_account_settings 
  ?(pipeline_codebuild_role_arn : string option)
  ?(pipeline_provisioning_repository : repository_branch option)
  ?(pipeline_service_role_arn : string option)
  () : account_settings = {
  pipeline_codebuild_role_arn;
  pipeline_provisioning_repository;
  pipeline_service_role_arn;
   }

let make_update_account_settings_output 
  ~(account_settings : account_settings) () : update_account_settings_output
= { account_settings;  }

let make_update_account_settings_input 
  ?(pipeline_codebuild_role_arn : string option)
  ?(delete_pipeline_provisioning_repository : bool option)
  ?(pipeline_provisioning_repository : repository_branch_input option)
  ?(pipeline_service_role_arn : string option)
  () : update_account_settings_input = {
  pipeline_codebuild_role_arn;
  delete_pipeline_provisioning_repository;
  pipeline_provisioning_repository;
  pipeline_service_role_arn;
   }

let make_untag_resource_output  () : untag_resource_output =
()

let make_untag_resource_input 
  ~(tag_keys : string list) ~(resource_arn : string) ()
: untag_resource_input = { tag_keys; resource_arn; 
}

let make_s3_object_source  ~(key : string) ~(bucket : string) ()
: s3_object_source = { key; bucket;  }

let make_tag_resource_output  () : tag_resource_output = ()

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_resource_input  ~(tags : tag list) ~(resource_arn : string) ()
: tag_resource_input = { tags; resource_arn; 
}

let make_service_template_version_summary 
  ?(description : string option)
  ?(status_message : string option)
  ?(recommended_minor_version : string option)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(arn : string)
  ~(status : template_version_status)
  ~(minor_version : string)
  ~(major_version : string)
  ~(template_name : string)
  () : service_template_version_summary = {
  last_modified_at;
  created_at;
  arn;
  description;
  status_message;
  status;
  recommended_minor_version;
  minor_version;
  major_version;
  template_name;
   }

let make_service_template_summary 
  ?(pipeline_provisioning : provisioning option)
  ?(recommended_version : string option)
  ?(description : string option)
  ?(display_name : string option)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(arn : string)
  ~(name : string)
  () : service_template_summary = {
  pipeline_provisioning;
  recommended_version;
  description;
  display_name;
  last_modified_at;
  created_at;
  arn;
  name;
   }

let make_service_sync_blocker_summary 
  ?(latest_blockers : sync_blocker list option)
  ?(service_instance_name : string option)
  ~(service_name : string)
  () : service_sync_blocker_summary = {
  latest_blockers; service_instance_name; service_name; 
}

let make_service_summary 
  ?(status_message : string option)
  ?(description : string option)
  ~(status : service_status)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(template_name : string)
  ~(arn : string)
  ~(name : string)
  () : service_summary = {
  status_message;
  status;
  last_modified_at;
  created_at;
  template_name;
  arn;
  description;
  name;
   }

let make_service_pipeline_state 
  ?(spec : string option)
  ~(template_minor_version : string)
  ~(template_major_version : string)
  ~(template_name : string)
  () : service_pipeline_state = {
  template_minor_version; template_major_version; template_name; spec; 
}

let make_service_instance_summary 
  ?(last_succeeded_deployment_id : string option)
  ?(last_attempted_deployment_id : string option)
  ?(deployment_status_message : string option)
  ~(deployment_status : deployment_status)
  ~(template_minor_version : string)
  ~(template_major_version : string)
  ~(template_name : string)
  ~(environment_name : string)
  ~(service_name : string)
  ~(last_deployment_succeeded_at : float)
  ~(last_deployment_attempted_at : float)
  ~(created_at : float)
  ~(arn : string)
  ~(name : string)
  () : service_instance_summary = {
  last_succeeded_deployment_id;
  last_attempted_deployment_id;
  deployment_status_message;
  deployment_status;
  template_minor_version;
  template_major_version;
  template_name;
  environment_name;
  service_name;
  last_deployment_succeeded_at;
  last_deployment_attempted_at;
  created_at;
  arn;
  name;
   }

let make_service_instance_state 
  ?(last_successful_service_pipeline_deployment_id : string option)
  ?(last_successful_environment_deployment_id : string option)
  ?(last_successful_component_deployment_ids : string list option)
  ~(template_minor_version : string)
  ~(template_major_version : string)
  ~(template_name : string)
  ~(spec : string)
  () : service_instance_state = {
  last_successful_service_pipeline_deployment_id;
  last_successful_environment_deployment_id;
  last_successful_component_deployment_ids;
  template_minor_version;
  template_major_version;
  template_name;
  spec;
   }

let make_revision 
  ~(branch : string)
  ~(directory : string)
  ~(sha : string)
  ~(repository_provider : repository_provider)
  ~(repository_name : string)
  () : revision = {
  branch; directory; sha; repository_provider; repository_name; 
}

let make_resource_sync_event 
  ?(external_id : string option)
  ~(event : string)
  ~(time : float)
  ~(type_ : string)
  () : resource_sync_event = { event; time; external_id; type_; 
}

let make_resource_sync_attempt 
  ~(events : resource_sync_event list)
  ~(status : resource_sync_status)
  ~(started_at : float)
  ~(target : string)
  ~(target_revision : revision)
  ~(initial_revision : revision)
  () : resource_sync_attempt = {
  events; status; started_at; target; target_revision; initial_revision; 
}

let make_resource_counts_summary 
  ?(behind_minor : int option)
  ?(behind_major : int option)
  ?(up_to_date : int option)
  ?(failed : int option)
  ~(total : int)
  () : resource_counts_summary = {
  behind_minor; behind_major; up_to_date; failed; total; 
}

let make_repository_sync_event 
  ?(external_id : string option)
  ~(event : string)
  ~(time : float)
  ~(type_ : string)
  () : repository_sync_event = { event; time; external_id; type_; 
}

let make_repository_sync_definition 
  ~(directory : string)
  ~(branch : string)
  ~(parent : string)
  ~(target : string)
  () : repository_sync_definition = { directory; branch; parent; target; 
}

let make_repository_sync_attempt 
  ~(events : repository_sync_event list)
  ~(status : repository_sync_status)
  ~(started_at : float)
  () : repository_sync_attempt = { events; status; started_at; 
}

let make_repository_summary 
  ~(connection_arn : string)
  ~(name : string)
  ~(provider : repository_provider)
  ~(arn : string)
  () : repository_summary = { connection_arn; name; provider; arn; 
}

let make_repository 
  ?(encryption_key : string option)
  ~(connection_arn : string)
  ~(name : string)
  ~(provider : repository_provider)
  ~(arn : string)
  () : repository = { encryption_key; connection_arn; name; provider; arn; 
}

let make_reject_environment_account_connection_output 
  ~(environment_account_connection : environment_account_connection) ()
: reject_environment_account_connection_output = {
  environment_account_connection; 
}

let make_reject_environment_account_connection_input  ~(id : string) ()
: reject_environment_account_connection_input = { id; 
}

let make_provisioned_resource 
  ?(provisioning_engine : provisioned_resource_engine option)
  ?(identifier : string option)
  ?(name : string option)
  () : provisioned_resource = { provisioning_engine; identifier; name; 
}

let make_output  ?(value_string : string option) ?(key : string option) ()
: output = { value_string; key; 
}

let make_notify_resource_deployment_status_change_output  ()
: notify_resource_deployment_status_change_output =
()

let make_notify_resource_deployment_status_change_input 
  ?(status_message : string option)
  ?(deployment_id : string option)
  ?(outputs : output list option)
  ?(status : resource_deployment_status option)
  ~(resource_arn : string)
  () : notify_resource_deployment_status_change_input = {
  status_message; deployment_id; outputs; status; resource_arn; 
}

let make_list_tags_for_resource_output 
  ?(next_token : string option) ~(tags : tag list) ()
: list_tags_for_resource_output = { next_token; tags; 
}

let make_list_tags_for_resource_input 
  ?(max_results : int option)
  ?(next_token : string option)
  ~(resource_arn : string)
  () : list_tags_for_resource_input = {
  max_results; next_token; resource_arn;  }

let make_list_services_output 
  ?(next_token : string option) ~(services : service_summary list) ()
: list_services_output = { services; next_token; 
}

let make_list_services_input 
  ?(max_results : int option) ?(next_token : string option) ()
: list_services_input = { max_results; next_token; 
}

let make_list_service_templates_output 
  ?(next_token : string option)
  ~(templates : service_template_summary list)
  () : list_service_templates_output = { templates; next_token; 
}

let make_list_service_templates_input 
  ?(max_results : int option) ?(next_token : string option) ()
: list_service_templates_input = { max_results; next_token; 
}

let make_list_service_template_versions_output 
  ?(next_token : string option)
  ~(template_versions : service_template_version_summary list)
  () : list_service_template_versions_output = {
  template_versions; next_token; 
}

let make_list_service_template_versions_input 
  ?(major_version : string option)
  ?(max_results : int option)
  ?(next_token : string option)
  ~(template_name : string)
  () : list_service_template_versions_input = {
  major_version; template_name; max_results; next_token; 
}

let make_list_service_pipeline_provisioned_resources_output 
  ?(next_token : string option)
  ~(provisioned_resources : provisioned_resource list)
  () : list_service_pipeline_provisioned_resources_output = {
  provisioned_resources; next_token; 
}

let make_list_service_pipeline_provisioned_resources_input 
  ?(next_token : string option) ~(service_name : string) ()
: list_service_pipeline_provisioned_resources_input = {
  next_token; service_name;  }

let make_list_service_pipeline_outputs_output 
  ?(next_token : string option) ~(outputs : output list) ()
: list_service_pipeline_outputs_output = { outputs; next_token; 
}

let make_list_service_pipeline_outputs_input 
  ?(deployment_id : string option)
  ?(next_token : string option)
  ~(service_name : string)
  () : list_service_pipeline_outputs_input = {
  deployment_id; next_token; service_name; 
}

let make_list_service_instances_output 
  ?(next_token : string option)
  ~(service_instances : service_instance_summary list)
  () : list_service_instances_output = { service_instances; next_token; 
}

let make_list_service_instances_filter 
  ?(value : string option)
  ?(key : list_service_instances_filter_by option)
  () : list_service_instances_filter = { value; key; 
}

let make_list_service_instances_input 
  ?(sort_order : sort_order option)
  ?(sort_by : list_service_instances_sort_by option)
  ?(filters : list_service_instances_filter list option)
  ?(max_results : int option)
  ?(next_token : string option)
  ?(service_name : string option)
  () : list_service_instances_input = {
  sort_order; sort_by; filters; max_results; next_token; service_name; 
}

let make_list_service_instance_provisioned_resources_output 
  ?(next_token : string option)
  ~(provisioned_resources : provisioned_resource list)
  () : list_service_instance_provisioned_resources_output = {
  provisioned_resources; next_token; 
}

let make_list_service_instance_provisioned_resources_input 
  ?(next_token : string option)
  ~(service_instance_name : string)
  ~(service_name : string)
  () : list_service_instance_provisioned_resources_input = {
  next_token; service_instance_name; service_name; 
}

let make_list_service_instance_outputs_output 
  ?(next_token : string option) ~(outputs : output list) ()
: list_service_instance_outputs_output = { outputs; next_token; 
}

let make_list_service_instance_outputs_input 
  ?(deployment_id : string option)
  ?(next_token : string option)
  ~(service_name : string)
  ~(service_instance_name : string)
  () : list_service_instance_outputs_input = {
  deployment_id; next_token; service_name; service_instance_name; 
}

let make_list_repository_sync_definitions_output 
  ?(next_token : string option)
  ~(sync_definitions : repository_sync_definition list)
  () : list_repository_sync_definitions_output = {
  sync_definitions; next_token; 
}

let make_list_repository_sync_definitions_input 
  ?(next_token : string option)
  ~(sync_type : sync_type)
  ~(repository_provider : repository_provider)
  ~(repository_name : string)
  () : list_repository_sync_definitions_input = {
  next_token; sync_type; repository_provider; repository_name; 
}

let make_list_repositories_output 
  ?(next_token : string option) ~(repositories : repository_summary list) ()
: list_repositories_output = { repositories; next_token; 
}

let make_list_repositories_input 
  ?(max_results : int option) ?(next_token : string option) ()
: list_repositories_input = { max_results; next_token; 
}

let make_environment_summary 
  ?(last_succeeded_deployment_id : string option)
  ?(last_attempted_deployment_id : string option)
  ?(component_role_arn : string option)
  ?(provisioning : provisioning option)
  ?(environment_account_id : string option)
  ?(environment_account_connection_id : string option)
  ?(proton_service_role_arn : string option)
  ?(deployment_status_message : string option)
  ?(description : string option)
  ~(deployment_status : deployment_status)
  ~(template_minor_version : string)
  ~(template_major_version : string)
  ~(template_name : string)
  ~(arn : string)
  ~(last_deployment_succeeded_at : float)
  ~(last_deployment_attempted_at : float)
  ~(created_at : float)
  ~(name : string)
  () : environment_summary = {
  last_succeeded_deployment_id;
  last_attempted_deployment_id;
  component_role_arn;
  provisioning;
  environment_account_id;
  environment_account_connection_id;
  proton_service_role_arn;
  deployment_status_message;
  deployment_status;
  template_minor_version;
  template_major_version;
  template_name;
  arn;
  last_deployment_succeeded_at;
  last_deployment_attempted_at;
  created_at;
  description;
  name;
   }

let make_list_environments_output 
  ?(next_token : string option) ~(environments : environment_summary list) ()
: list_environments_output = { environments; next_token; 
}

let make_environment_template_filter 
  ~(major_version : string) ~(template_name : string) ()
: environment_template_filter = { major_version; template_name; 
}

let make_list_environments_input 
  ?(environment_templates : environment_template_filter list option)
  ?(max_results : int option)
  ?(next_token : string option)
  () : list_environments_input = {
  environment_templates; max_results; next_token; 
}

let make_environment_template_summary 
  ?(provisioning : provisioning option)
  ?(recommended_version : string option)
  ?(description : string option)
  ?(display_name : string option)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(arn : string)
  ~(name : string)
  () : environment_template_summary = {
  provisioning;
  recommended_version;
  description;
  display_name;
  last_modified_at;
  created_at;
  arn;
  name;
   }

let make_list_environment_templates_output 
  ?(next_token : string option)
  ~(templates : environment_template_summary list)
  () : list_environment_templates_output = { templates; next_token; 
}

let make_list_environment_templates_input 
  ?(max_results : int option) ?(next_token : string option) ()
: list_environment_templates_input = { max_results; next_token; 
}

let make_environment_template_version_summary 
  ?(description : string option)
  ?(status_message : string option)
  ?(recommended_minor_version : string option)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(arn : string)
  ~(status : template_version_status)
  ~(minor_version : string)
  ~(major_version : string)
  ~(template_name : string)
  () : environment_template_version_summary = {
  last_modified_at;
  created_at;
  arn;
  description;
  status_message;
  status;
  recommended_minor_version;
  minor_version;
  major_version;
  template_name;
   }

let make_list_environment_template_versions_output 
  ?(next_token : string option)
  ~(template_versions : environment_template_version_summary list)
  () : list_environment_template_versions_output = {
  template_versions; next_token; 
}

let make_list_environment_template_versions_input 
  ?(major_version : string option)
  ?(max_results : int option)
  ?(next_token : string option)
  ~(template_name : string)
  () : list_environment_template_versions_input = {
  major_version; template_name; max_results; next_token; 
}

let make_list_environment_provisioned_resources_output 
  ?(next_token : string option)
  ~(provisioned_resources : provisioned_resource list)
  () : list_environment_provisioned_resources_output = {
  provisioned_resources; next_token; 
}

let make_list_environment_provisioned_resources_input 
  ?(next_token : string option) ~(environment_name : string) ()
: list_environment_provisioned_resources_input = {
  next_token; environment_name;  }

let make_list_environment_outputs_output 
  ?(next_token : string option) ~(outputs : output list) ()
: list_environment_outputs_output = { outputs; next_token; 
}

let make_list_environment_outputs_input 
  ?(deployment_id : string option)
  ?(next_token : string option)
  ~(environment_name : string)
  () : list_environment_outputs_input = {
  deployment_id; next_token; environment_name; 
}

let make_environment_account_connection_summary 
  ?(component_role_arn : string option)
  ~(status : environment_account_connection_status)
  ~(last_modified_at : float)
  ~(requested_at : float)
  ~(environment_name : string)
  ~(role_arn : string)
  ~(environment_account_id : string)
  ~(management_account_id : string)
  ~(arn : string)
  ~(id : string)
  () : environment_account_connection_summary = {
  component_role_arn;
  status;
  last_modified_at;
  requested_at;
  environment_name;
  role_arn;
  environment_account_id;
  management_account_id;
  arn;
  id;
   }

let make_list_environment_account_connections_output 
  ?(next_token : string option)
  ~(environment_account_connections : environment_account_connection_summary list)
  () : list_environment_account_connections_output = {
  next_token; environment_account_connections; 
}

let make_list_environment_account_connections_input 
  ?(max_results : int option)
  ?(next_token : string option)
  ?(statuses : environment_account_connection_status list option)
  ?(environment_name : string option)
  ~(requested_by : environment_account_connection_requester_account_type)
  () : list_environment_account_connections_input = {
  max_results; next_token; statuses; environment_name; requested_by; 
}

let make_deployment_summary 
  ?(last_succeeded_deployment_id : string option)
  ?(last_attempted_deployment_id : string option)
  ?(component_name : string option)
  ?(service_instance_name : string option)
  ?(service_name : string option)
  ?(completed_at : float option)
  ~(deployment_status : deployment_status)
  ~(environment_name : string)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(target_resource_type : deployment_target_resource_type)
  ~(target_resource_created_at : float)
  ~(target_arn : string)
  ~(arn : string)
  ~(id : string)
  () : deployment_summary = {
  deployment_status;
  last_succeeded_deployment_id;
  last_attempted_deployment_id;
  component_name;
  service_instance_name;
  service_name;
  environment_name;
  completed_at;
  last_modified_at;
  created_at;
  target_resource_type;
  target_resource_created_at;
  target_arn;
  arn;
  id;
   }

let make_list_deployments_output 
  ?(next_token : string option) ~(deployments : deployment_summary list) ()
: list_deployments_output = { deployments; next_token; 
}

let make_list_deployments_input 
  ?(max_results : int option)
  ?(component_name : string option)
  ?(service_instance_name : string option)
  ?(service_name : string option)
  ?(environment_name : string option)
  ?(next_token : string option)
  () : list_deployments_input = {
  max_results;
  component_name;
  service_instance_name;
  service_name;
  environment_name;
  next_token;
   }

let make_component_summary 
  ?(last_succeeded_deployment_id : string option)
  ?(last_attempted_deployment_id : string option)
  ?(deployment_status_message : string option)
  ?(last_deployment_succeeded_at : float option)
  ?(last_deployment_attempted_at : float option)
  ?(service_instance_name : string option)
  ?(service_name : string option)
  ~(deployment_status : deployment_status)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(environment_name : string)
  ~(arn : string)
  ~(name : string)
  () : component_summary = {
  last_succeeded_deployment_id;
  last_attempted_deployment_id;
  deployment_status_message;
  deployment_status;
  last_deployment_succeeded_at;
  last_deployment_attempted_at;
  last_modified_at;
  created_at;
  service_instance_name;
  service_name;
  environment_name;
  arn;
  name;
   }

let make_list_components_output 
  ?(next_token : string option) ~(components : component_summary list) ()
: list_components_output = { components; next_token; 
}

let make_list_components_input 
  ?(max_results : int option)
  ?(service_instance_name : string option)
  ?(service_name : string option)
  ?(environment_name : string option)
  ?(next_token : string option)
  () : list_components_input = {
  max_results;
  service_instance_name;
  service_name;
  environment_name;
  next_token;
   }

let make_list_component_provisioned_resources_output 
  ?(next_token : string option)
  ~(provisioned_resources : provisioned_resource list)
  () : list_component_provisioned_resources_output = {
  provisioned_resources; next_token; 
}

let make_list_component_provisioned_resources_input 
  ?(next_token : string option) ~(component_name : string) ()
: list_component_provisioned_resources_input = { next_token; component_name; 
}

let make_list_component_outputs_output 
  ?(next_token : string option) ~(outputs : output list) ()
: list_component_outputs_output = { outputs; next_token; 
}

let make_list_component_outputs_input 
  ?(deployment_id : string option)
  ?(next_token : string option)
  ~(component_name : string)
  () : list_component_outputs_input = {
  deployment_id; next_token; component_name; 
}

let make_get_template_sync_status_output 
  ?(desired_state : revision option)
  ?(latest_successful_sync : resource_sync_attempt option)
  ?(latest_sync : resource_sync_attempt option)
  () : get_template_sync_status_output = {
  desired_state; latest_successful_sync; latest_sync; 
}

let make_get_template_sync_status_input 
  ~(template_version : string)
  ~(template_type : template_type)
  ~(template_name : string)
  () : get_template_sync_status_input = {
  template_version; template_type; template_name; 
}

let make_get_template_sync_config_output 
  ?(template_sync_config : template_sync_config option) ()
: get_template_sync_config_output = { template_sync_config; 
}

let make_get_template_sync_config_input 
  ~(template_type : template_type) ~(template_name : string) ()
: get_template_sync_config_input = { template_type; template_name; 
}

let make_get_service_template_version_output 
  ~(service_template_version : service_template_version) ()
: get_service_template_version_output = { service_template_version; 
}

let make_get_service_template_version_input 
  ~(minor_version : string)
  ~(major_version : string)
  ~(template_name : string)
  () : get_service_template_version_input = {
  minor_version; major_version; template_name; 
}

let make_get_service_template_output 
  ~(service_template : service_template) () : get_service_template_output = {
  service_template;  }

let make_get_service_template_input  ~(name : string) ()
: get_service_template_input = { name; 
}

let make_get_service_sync_config_output 
  ?(service_sync_config : service_sync_config option) ()
: get_service_sync_config_output = { service_sync_config; 
}

let make_get_service_sync_config_input  ~(service_name : string) ()
: get_service_sync_config_input = { service_name; 
}

let make_get_service_sync_blocker_summary_output 
  ?(service_sync_blocker_summary : service_sync_blocker_summary option) ()
: get_service_sync_blocker_summary_output = { service_sync_blocker_summary; 
}

let make_get_service_sync_blocker_summary_input 
  ?(service_instance_name : string option) ~(service_name : string) ()
: get_service_sync_blocker_summary_input = {
  service_instance_name; service_name;  }

let make_get_service_output  ?(service : service option) ()
: get_service_output = { service; 
}

let make_get_service_instance_sync_status_output 
  ?(desired_state : revision option)
  ?(latest_successful_sync : resource_sync_attempt option)
  ?(latest_sync : resource_sync_attempt option)
  () : get_service_instance_sync_status_output = {
  desired_state; latest_successful_sync; latest_sync; 
}

let make_get_service_instance_sync_status_input 
  ~(service_instance_name : string) ~(service_name : string) ()
: get_service_instance_sync_status_input = {
  service_instance_name; service_name; 
}

let make_get_service_instance_output 
  ~(service_instance : service_instance) () : get_service_instance_output = {
  service_instance;  }

let make_get_service_instance_input 
  ~(service_name : string) ~(name : string) () : get_service_instance_input =
{ service_name; name;  }

let make_get_service_input  ~(name : string) () : get_service_input = {
  name;  }

let make_counts_summary 
  ?(pipelines : resource_counts_summary option)
  ?(service_templates : resource_counts_summary option)
  ?(services : resource_counts_summary option)
  ?(service_instances : resource_counts_summary option)
  ?(environment_templates : resource_counts_summary option)
  ?(environments : resource_counts_summary option)
  ?(components : resource_counts_summary option)
  () : counts_summary = {
  pipelines;
  service_templates;
  services;
  service_instances;
  environment_templates;
  environments;
  components;
   }

let make_get_resources_summary_output  ~(counts : counts_summary) ()
: get_resources_summary_output = { counts; 
}

let make_get_resources_summary_input  () : get_resources_summary_input =
()

let make_get_repository_sync_status_output 
  ?(latest_sync : repository_sync_attempt option) ()
: get_repository_sync_status_output = { latest_sync; 
}

let make_get_repository_sync_status_input 
  ~(sync_type : sync_type)
  ~(branch : string)
  ~(repository_provider : repository_provider)
  ~(repository_name : string)
  () : get_repository_sync_status_input = {
  sync_type; branch; repository_provider; repository_name; 
}

let make_get_repository_output  ~(repository : repository) ()
: get_repository_output = { repository;  }

let make_get_repository_input 
  ~(name : string) ~(provider : repository_provider) ()
: get_repository_input = { name; provider; 
}

let make_get_environment_template_version_output 
  ~(environment_template_version : environment_template_version) ()
: get_environment_template_version_output = { environment_template_version; 
}

let make_get_environment_template_version_input 
  ~(minor_version : string)
  ~(major_version : string)
  ~(template_name : string)
  () : get_environment_template_version_input = {
  minor_version; major_version; template_name; 
}

let make_get_environment_template_output 
  ~(environment_template : environment_template) ()
: get_environment_template_output = { environment_template; 
}

let make_get_environment_template_input  ~(name : string) ()
: get_environment_template_input = { name;  }

let make_get_environment_output  ~(environment : environment) ()
: get_environment_output = { environment;  }

let make_get_environment_input  ~(name : string) () : get_environment_input =
{ name;  }

let make_get_environment_account_connection_output 
  ~(environment_account_connection : environment_account_connection) ()
: get_environment_account_connection_output = {
  environment_account_connection; 
}

let make_get_environment_account_connection_input  ~(id : string) ()
: get_environment_account_connection_input = { id; 
}

let make_environment_state 
  ?(spec : string option)
  ~(template_minor_version : string)
  ~(template_major_version : string)
  ~(template_name : string)
  () : environment_state = {
  template_minor_version; template_major_version; template_name; spec; 
}

let make_component_state 
  ?(template_file : string option)
  ?(service_spec : string option)
  ?(service_instance_name : string option)
  ?(service_name : string option)
  () : component_state = {
  template_file; service_spec; service_instance_name; service_name; 
}

let make_deployment 
  ?(target_state : deployment_state option)
  ?(initial_state : deployment_state option)
  ?(last_succeeded_deployment_id : string option)
  ?(last_attempted_deployment_id : string option)
  ?(completed_at : float option)
  ?(deployment_status_message : string option)
  ?(component_name : string option)
  ?(service_instance_name : string option)
  ?(service_name : string option)
  ~(last_modified_at : float)
  ~(created_at : float)
  ~(deployment_status : deployment_status)
  ~(environment_name : string)
  ~(target_resource_type : deployment_target_resource_type)
  ~(target_resource_created_at : float)
  ~(target_arn : string)
  ~(arn : string)
  ~(id : string)
  () : deployment = {
  target_state;
  initial_state;
  last_succeeded_deployment_id;
  last_attempted_deployment_id;
  completed_at;
  last_modified_at;
  created_at;
  deployment_status_message;
  deployment_status;
  component_name;
  service_instance_name;
  service_name;
  environment_name;
  target_resource_type;
  target_resource_created_at;
  target_arn;
  arn;
  id;
   }

let make_get_deployment_output  ?(deployment : deployment option) ()
: get_deployment_output = { deployment;  }

let make_get_deployment_input 
  ?(component_name : string option)
  ?(service_instance_name : string option)
  ?(service_name : string option)
  ?(environment_name : string option)
  ~(id : string)
  () : get_deployment_input = {
  component_name; service_instance_name; service_name; environment_name; id; 
}

let make_get_component_output  ?(component : component option) ()
: get_component_output = { component;  }

let make_get_component_input  ~(name : string) () : get_component_input = {
  name;  }

let make_get_account_settings_output 
  ?(account_settings : account_settings option) ()
: get_account_settings_output = { account_settings; 
}

let make_get_account_settings_input  () : get_account_settings_input =
()

let make_delete_template_sync_config_output 
  ?(template_sync_config : template_sync_config option) ()
: delete_template_sync_config_output = { template_sync_config; 
}

let make_delete_template_sync_config_input 
  ~(template_type : template_type) ~(template_name : string) ()
: delete_template_sync_config_input = { template_type; template_name; 
}

let make_delete_service_template_version_output 
  ?(service_template_version : service_template_version option) ()
: delete_service_template_version_output = { service_template_version; 
}

let make_delete_service_template_version_input 
  ~(minor_version : string)
  ~(major_version : string)
  ~(template_name : string)
  () : delete_service_template_version_input = {
  minor_version; major_version; template_name; 
}

let make_delete_service_template_output 
  ?(service_template : service_template option) ()
: delete_service_template_output = { service_template; 
}

let make_delete_service_template_input  ~(name : string) ()
: delete_service_template_input = { name; 
}

let make_delete_service_sync_config_output 
  ?(service_sync_config : service_sync_config option) ()
: delete_service_sync_config_output = { service_sync_config; 
}

let make_delete_service_sync_config_input  ~(service_name : string) ()
: delete_service_sync_config_input = { service_name; 
}

let make_delete_service_output  ?(service : service option) ()
: delete_service_output = { service;  }

let make_delete_service_input  ~(name : string) () : delete_service_input = {
  name;  }

let make_delete_repository_output  ?(repository : repository option) ()
: delete_repository_output = { repository; 
}

let make_delete_repository_input 
  ~(name : string) ~(provider : repository_provider) ()
: delete_repository_input = { name; provider; 
}

let make_delete_environment_template_version_output 
  ?(environment_template_version : environment_template_version option) ()
: delete_environment_template_version_output = {
  environment_template_version; 
}

let make_delete_environment_template_version_input 
  ~(minor_version : string)
  ~(major_version : string)
  ~(template_name : string)
  () : delete_environment_template_version_input = {
  minor_version; major_version; template_name; 
}

let make_delete_environment_template_output 
  ?(environment_template : environment_template option) ()
: delete_environment_template_output = { environment_template; 
}

let make_delete_environment_template_input  ~(name : string) ()
: delete_environment_template_input = { name; 
}

let make_delete_environment_output  ?(environment : environment option) ()
: delete_environment_output = { environment; 
}

let make_delete_environment_input  ~(name : string) ()
: delete_environment_input = { name; 
}

let make_delete_environment_account_connection_output 
  ?(environment_account_connection : environment_account_connection option)
  () : delete_environment_account_connection_output = {
  environment_account_connection; 
}

let make_delete_environment_account_connection_input  ~(id : string) ()
: delete_environment_account_connection_input = { id; 
}

let make_delete_deployment_output  ?(deployment : deployment option) ()
: delete_deployment_output = { deployment; 
}

let make_delete_deployment_input  ~(id : string) () : delete_deployment_input
= { id;  }

let make_delete_component_output  ?(component : component option) ()
: delete_component_output = { component;  }

let make_delete_component_input  ~(name : string) () : delete_component_input
= { name;  }

let make_create_template_sync_config_output 
  ?(template_sync_config : template_sync_config option) ()
: create_template_sync_config_output = { template_sync_config; 
}

let make_create_template_sync_config_input 
  ?(subdirectory : string option)
  ~(branch : string)
  ~(repository_name : string)
  ~(repository_provider : repository_provider)
  ~(template_type : template_type)
  ~(template_name : string)
  () : create_template_sync_config_input = {
  subdirectory;
  branch;
  repository_name;
  repository_provider;
  template_type;
  template_name;
   }

let make_create_service_template_version_output 
  ~(service_template_version : service_template_version) ()
: create_service_template_version_output = { service_template_version; 
}

let make_create_service_template_version_input 
  ?(supported_component_sources : service_template_supported_component_source_type list option)
  ?(tags : tag list option)
  ?(major_version : string option)
  ?(description : string option)
  ?(client_token : string option)
  ~(compatible_environment_templates : compatible_environment_template_input list)
  ~(source : template_version_source_input)
  ~(template_name : string)
  () : create_service_template_version_input = {
  supported_component_sources;
  tags;
  compatible_environment_templates;
  source;
  major_version;
  description;
  template_name;
  client_token;
   }

let make_create_service_template_output 
  ~(service_template : service_template) () : create_service_template_output
= { service_template;  }

let make_create_service_template_input 
  ?(tags : tag list option)
  ?(pipeline_provisioning : provisioning option)
  ?(encryption_key : string option)
  ?(description : string option)
  ?(display_name : string option)
  ~(name : string)
  () : create_service_template_input = {
  tags;
  pipeline_provisioning;
  encryption_key;
  description;
  display_name;
  name;
   }

let make_create_service_sync_config_output 
  ?(service_sync_config : service_sync_config option) ()
: create_service_sync_config_output = { service_sync_config; 
}

let make_create_service_sync_config_input 
  ~(file_path : string)
  ~(branch : string)
  ~(repository_name : string)
  ~(repository_provider : repository_provider)
  ~(service_name : string)
  () : create_service_sync_config_input = {
  file_path; branch; repository_name; repository_provider; service_name; 
}

let make_create_service_output  ~(service : service) ()
: create_service_output = { service; 
}

let make_create_service_instance_output 
  ~(service_instance : service_instance) () : create_service_instance_output
= { service_instance;  }

let make_create_service_instance_input 
  ?(client_token : string option)
  ?(tags : tag list option)
  ?(template_minor_version : string option)
  ?(template_major_version : string option)
  ~(spec : string)
  ~(service_name : string)
  ~(name : string)
  () : create_service_instance_input = {
  client_token;
  tags;
  template_minor_version;
  template_major_version;
  spec;
  service_name;
  name;
   }

let make_create_service_input 
  ?(tags : tag list option)
  ?(branch_name : string option)
  ?(repository_id : string option)
  ?(repository_connection_arn : string option)
  ?(template_minor_version : string option)
  ?(description : string option)
  ~(spec : string)
  ~(template_major_version : string)
  ~(template_name : string)
  ~(name : string)
  () : create_service_input = {
  tags;
  branch_name;
  repository_id;
  repository_connection_arn;
  spec;
  template_minor_version;
  template_major_version;
  template_name;
  description;
  name;
   }

let make_create_repository_output  ~(repository : repository) ()
: create_repository_output = { repository; 
}

let make_create_repository_input 
  ?(tags : tag list option)
  ?(encryption_key : string option)
  ~(connection_arn : string)
  ~(name : string)
  ~(provider : repository_provider)
  () : create_repository_input = {
  tags; encryption_key; connection_arn; name; provider; 
}

let make_create_environment_template_version_output 
  ~(environment_template_version : environment_template_version) ()
: create_environment_template_version_output = {
  environment_template_version; 
}

let make_create_environment_template_version_input 
  ?(tags : tag list option)
  ?(major_version : string option)
  ?(description : string option)
  ?(client_token : string option)
  ~(source : template_version_source_input)
  ~(template_name : string)
  () : create_environment_template_version_input = {
  tags; source; major_version; description; template_name; client_token; 
}

let make_create_environment_template_output 
  ~(environment_template : environment_template) ()
: create_environment_template_output = { environment_template; 
}

let make_create_environment_template_input 
  ?(tags : tag list option)
  ?(provisioning : provisioning option)
  ?(encryption_key : string option)
  ?(description : string option)
  ?(display_name : string option)
  ~(name : string)
  () : create_environment_template_input = {
  tags; provisioning; encryption_key; description; display_name; name; 
}

let make_create_environment_output  ~(environment : environment) ()
: create_environment_output = { environment; 
}

let make_create_environment_input 
  ?(codebuild_role_arn : string option)
  ?(component_role_arn : string option)
  ?(provisioning_repository : repository_branch_input option)
  ?(tags : tag list option)
  ?(environment_account_connection_id : string option)
  ?(proton_service_role_arn : string option)
  ?(description : string option)
  ?(template_minor_version : string option)
  ~(spec : string)
  ~(template_major_version : string)
  ~(template_name : string)
  ~(name : string)
  () : create_environment_input = {
  codebuild_role_arn;
  component_role_arn;
  provisioning_repository;
  tags;
  environment_account_connection_id;
  proton_service_role_arn;
  spec;
  description;
  template_minor_version;
  template_major_version;
  template_name;
  name;
   }

let make_create_environment_account_connection_output 
  ~(environment_account_connection : environment_account_connection) ()
: create_environment_account_connection_output = {
  environment_account_connection; 
}

let make_create_environment_account_connection_input 
  ?(codebuild_role_arn : string option)
  ?(component_role_arn : string option)
  ?(tags : tag list option)
  ?(role_arn : string option)
  ?(client_token : string option)
  ~(environment_name : string)
  ~(management_account_id : string)
  () : create_environment_account_connection_input = {
  codebuild_role_arn;
  component_role_arn;
  tags;
  environment_name;
  role_arn;
  management_account_id;
  client_token;
   }

let make_create_component_output  ~(component : component) ()
: create_component_output = { component;  }

let make_create_component_input 
  ?(client_token : string option)
  ?(tags : tag list option)
  ?(service_spec : string option)
  ?(environment_name : string option)
  ?(service_instance_name : string option)
  ?(service_name : string option)
  ?(description : string option)
  ~(manifest : string)
  ~(template_file : string)
  ~(name : string)
  () : create_component_input = {
  client_token;
  tags;
  service_spec;
  manifest;
  template_file;
  environment_name;
  service_instance_name;
  service_name;
  description;
  name;
   }

let make_cancel_service_pipeline_deployment_output 
  ~(pipeline : service_pipeline) ()
: cancel_service_pipeline_deployment_output = { pipeline; 
}

let make_cancel_service_pipeline_deployment_input 
  ~(service_name : string) () : cancel_service_pipeline_deployment_input = {
  service_name;  }

let make_cancel_service_instance_deployment_output 
  ~(service_instance : service_instance) ()
: cancel_service_instance_deployment_output = { service_instance; 
}

let make_cancel_service_instance_deployment_input 
  ~(service_name : string) ~(service_instance_name : string) ()
: cancel_service_instance_deployment_input = {
  service_name; service_instance_name; 
}

let make_cancel_environment_deployment_output 
  ~(environment : environment) () : cancel_environment_deployment_output = {
  environment;  }

let make_cancel_environment_deployment_input  ~(environment_name : string) ()
: cancel_environment_deployment_input = { environment_name; 
}

let make_cancel_component_deployment_output  ~(component : component) ()
: cancel_component_deployment_output = { component; 
}

let make_cancel_component_deployment_input  ~(component_name : string) ()
: cancel_component_deployment_input = { component_name; 
}

let make_accept_environment_account_connection_output 
  ~(environment_account_connection : environment_account_connection) ()
: accept_environment_account_connection_output = {
  environment_account_connection; 
}

let make_accept_environment_account_connection_input  ~(id : string) ()
: accept_environment_account_connection_input = { id; 
}

