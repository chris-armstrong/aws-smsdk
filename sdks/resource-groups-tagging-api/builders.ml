[@@@warning "-39"]
open Types
let make_failure_info 
  ?(error_message : string option)
  ?(error_code : error_code option)
  ?(status_code : int option)
  () : failure_info = { error_message; error_code; status_code; 
}

let make_untag_resources_output 
  ?(failed_resources_map : (string * failure_info) list option) ()
: untag_resources_output = { failed_resources_map; 
}

let make_untag_resources_input 
  ~(tag_keys : string list) ~(resource_arn_list : string list) ()
: untag_resources_input = { tag_keys; resource_arn_list; 
}

let make_tag_resources_output 
  ?(failed_resources_map : (string * failure_info) list option) ()
: tag_resources_output = { failed_resources_map; 
}

let make_tag_resources_input 
  ~(tags : (string * string) list) ~(resource_arn_list : string list) ()
: tag_resources_input = { tags; resource_arn_list;  }

let make_tag  ~(value : string) ~(key : string) () : tag = { value; key; 
}

let make_tag_filter  ?(values : string list option) ?(key : string option) ()
: tag_filter = { values; key;  }

let make_summary 
  ?(non_compliant_resources : int option)
  ?(resource_type : string option)
  ?(region : string option)
  ?(target_id_type : target_id_type option)
  ?(target_id : string option)
  ?(last_updated : string option)
  () : summary = {
  non_compliant_resources;
  resource_type;
  region;
  target_id_type;
  target_id;
  last_updated;
   }

let make_start_report_creation_output  () : start_report_creation_output =
()

let make_start_report_creation_input  ~(s3_bucket : string) ()
: start_report_creation_input = { s3_bucket;  }

let make_compliance_details 
  ?(compliance_status : bool option)
  ?(keys_with_noncompliant_values : string list option)
  ?(noncompliant_keys : string list option)
  () : compliance_details = {
  compliance_status; keys_with_noncompliant_values; noncompliant_keys; 
}

let make_resource_tag_mapping 
  ?(compliance_details : compliance_details option)
  ?(tags : tag list option)
  ?(resource_ar_n : string option)
  () : resource_tag_mapping = { compliance_details; tags; resource_ar_n; 
}

let make_get_tag_values_output 
  ?(tag_values : string list option) ?(pagination_token : string option) ()
: get_tag_values_output = { tag_values; pagination_token; 
}

let make_get_tag_values_input 
  ?(pagination_token : string option) ~(key : string) ()
: get_tag_values_input = { key; pagination_token; 
}

let make_get_tag_keys_output 
  ?(tag_keys : string list option) ?(pagination_token : string option) ()
: get_tag_keys_output = { tag_keys; pagination_token; 
}

let make_get_tag_keys_input  ?(pagination_token : string option) ()
: get_tag_keys_input = { pagination_token;  }

let make_get_resources_output 
  ?(resource_tag_mapping_list : resource_tag_mapping list option)
  ?(pagination_token : string option)
  () : get_resources_output = { resource_tag_mapping_list; pagination_token; 
}

let make_get_resources_input 
  ?(resource_arn_list : string list option)
  ?(exclude_compliant_resources : bool option)
  ?(include_compliance_details : bool option)
  ?(resource_type_filters : string list option)
  ?(tags_per_page : int option)
  ?(resources_per_page : int option)
  ?(tag_filters : tag_filter list option)
  ?(pagination_token : string option)
  () : get_resources_input = {
  resource_arn_list;
  exclude_compliant_resources;
  include_compliance_details;
  resource_type_filters;
  tags_per_page;
  resources_per_page;
  tag_filters;
  pagination_token;
   }

let make_get_compliance_summary_output 
  ?(pagination_token : string option)
  ?(summary_list : summary list option)
  () : get_compliance_summary_output = { pagination_token; summary_list; 
}

let make_get_compliance_summary_input 
  ?(pagination_token : string option)
  ?(max_results : int option)
  ?(group_by : group_by_attribute list option)
  ?(tag_key_filters : string list option)
  ?(resource_type_filters : string list option)
  ?(region_filters : string list option)
  ?(target_id_filters : string list option)
  () : get_compliance_summary_input = {
  pagination_token;
  max_results;
  group_by;
  tag_key_filters;
  resource_type_filters;
  region_filters;
  target_id_filters;
   }

let make_describe_report_creation_output 
  ?(error_message : string option)
  ?(start_date : string option)
  ?(s3_location : string option)
  ?(status : string option)
  () : describe_report_creation_output = {
  error_message; start_date; s3_location; status; 
}

let make_describe_report_creation_input  () : describe_report_creation_input
=
()

