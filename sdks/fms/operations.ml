open Types 
let (let+) res map = Result.map map res
module AssociateAdminAccount = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_admin_account_request) ->
    let input = Serializers.associate_admin_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.AssociateAdminAccount" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module AssociateThirdPartyFirewall = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_third_party_firewall_request) ->
    let input = Serializers.associate_third_party_firewall_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.AssociateThirdPartyFirewall" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_third_party_firewall_response_of_yojson
      ~error_deserializer
      
end

module BatchAssociateResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_associate_resource_request) ->
    let input = Serializers.batch_associate_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.BatchAssociateResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_associate_resource_response_of_yojson
      ~error_deserializer
      
end

module BatchDisassociateResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: batch_disassociate_resource_request) ->
    let input = Serializers.batch_disassociate_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.BatchDisassociateResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.batch_disassociate_resource_response_of_yojson
      ~error_deserializer
      
end

module DeleteAppsList = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_apps_list_request) ->
    let input = Serializers.delete_apps_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.DeleteAppsList" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteNotificationChannel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_notification_channel_request) ->
    let input = Serializers.delete_notification_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.DeleteNotificationChannel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeletePolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_policy_request) ->
    let input = Serializers.delete_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.DeletePolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteProtocolsList = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_protocols_list_request) ->
    let input = Serializers.delete_protocols_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.DeleteProtocolsList" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteResourceSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_resource_set_request) ->
    let input = Serializers.delete_resource_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.DeleteResourceSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DisassociateAdminAccount = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_admin_account_request) ->
    let input = Serializers.disassociate_admin_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.DisassociateAdminAccount" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DisassociateThirdPartyFirewall = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_third_party_firewall_request) ->
    let input = Serializers.disassociate_third_party_firewall_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.DisassociateThirdPartyFirewall" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_third_party_firewall_response_of_yojson
      ~error_deserializer
      
end

module GetAdminAccount = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_admin_account_request) ->
    let input = Serializers.get_admin_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetAdminAccount" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_admin_account_response_of_yojson
      ~error_deserializer
      
end

module GetAdminScope = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_admin_scope_request) ->
    let input = Serializers.get_admin_scope_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetAdminScope" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_admin_scope_response_of_yojson
      ~error_deserializer
      
end

module GetAppsList = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_apps_list_request) ->
    let input = Serializers.get_apps_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetAppsList" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_apps_list_response_of_yojson
      ~error_deserializer
      
end

module GetComplianceDetail = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_compliance_detail_request) ->
    let input = Serializers.get_compliance_detail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetComplianceDetail" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_compliance_detail_response_of_yojson
      ~error_deserializer
      
end

module GetNotificationChannel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_notification_channel_request) ->
    let input = Serializers.get_notification_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetNotificationChannel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_notification_channel_response_of_yojson
      ~error_deserializer
      
end

module GetPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidTypeException" ->
         (`InvalidTypeException (invalid_type_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_policy_request) ->
    let input = Serializers.get_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_policy_response_of_yojson
      ~error_deserializer
      
end

module GetProtectionStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_protection_status_request) ->
    let input = Serializers.get_protection_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetProtectionStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_protection_status_response_of_yojson
      ~error_deserializer
      
end

module GetProtocolsList = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_protocols_list_request) ->
    let input = Serializers.get_protocols_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetProtocolsList" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_protocols_list_response_of_yojson
      ~error_deserializer
      
end

module GetResourceSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_resource_set_request) ->
    let input = Serializers.get_resource_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetResourceSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_resource_set_response_of_yojson
      ~error_deserializer
      
end

module GetThirdPartyFirewallAssociationStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_third_party_firewall_association_status_request) ->
    let input = Serializers.get_third_party_firewall_association_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetThirdPartyFirewallAssociationStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_third_party_firewall_association_status_response_of_yojson
      ~error_deserializer
      
end

module GetViolationDetails = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_violation_details_request) ->
    let input = Serializers.get_violation_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.GetViolationDetails" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_violation_details_response_of_yojson
      ~error_deserializer
      
end

module ListAdminAccountsForOrganization = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_admin_accounts_for_organization_request) ->
    let input = Serializers.list_admin_accounts_for_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListAdminAccountsForOrganization" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_admin_accounts_for_organization_response_of_yojson
      ~error_deserializer
      
end

module ListAdminsManagingAccount = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_admins_managing_account_request) ->
    let input = Serializers.list_admins_managing_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListAdminsManagingAccount" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_admins_managing_account_response_of_yojson
      ~error_deserializer
      
end

module ListAppsLists = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_apps_lists_request) ->
    let input = Serializers.list_apps_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListAppsLists" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_apps_lists_response_of_yojson
      ~error_deserializer
      
end

module ListComplianceStatus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_compliance_status_request) ->
    let input = Serializers.list_compliance_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListComplianceStatus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_compliance_status_response_of_yojson
      ~error_deserializer
      
end

module ListDiscoveredResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_discovered_resources_request) ->
    let input = Serializers.list_discovered_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListDiscoveredResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_discovered_resources_response_of_yojson
      ~error_deserializer
      
end

module ListMemberAccounts = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_member_accounts_request) ->
    let input = Serializers.list_member_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListMemberAccounts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_member_accounts_response_of_yojson
      ~error_deserializer
      
end

module ListPolicies = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_policies_request) ->
    let input = Serializers.list_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListPolicies" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_policies_response_of_yojson
      ~error_deserializer
      
end

module ListProtocolsLists = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_protocols_lists_request) ->
    let input = Serializers.list_protocols_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListProtocolsLists" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_protocols_lists_response_of_yojson
      ~error_deserializer
      
end

module ListResourceSetResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_resource_set_resources_request) ->
    let input = Serializers.list_resource_set_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListResourceSetResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_resource_set_resources_response_of_yojson
      ~error_deserializer
      
end

module ListResourceSets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_resource_sets_request) ->
    let input = Serializers.list_resource_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListResourceSets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_resource_sets_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListThirdPartyFirewallFirewallPolicies = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_third_party_firewall_firewall_policies_request) ->
    let input = Serializers.list_third_party_firewall_firewall_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.ListThirdPartyFirewallFirewallPolicies" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_third_party_firewall_firewall_policies_response_of_yojson
      ~error_deserializer
      
end

module PutAdminAccount = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_admin_account_request) ->
    let input = Serializers.put_admin_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.PutAdminAccount" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module PutAppsList = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_apps_list_request) ->
    let input = Serializers.put_apps_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.PutAppsList" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_apps_list_response_of_yojson
      ~error_deserializer
      
end

module PutNotificationChannel = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_notification_channel_request) ->
    let input = Serializers.put_notification_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.PutNotificationChannel" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module PutPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidTypeException" ->
         (`InvalidTypeException (invalid_type_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_policy_request) ->
    let input = Serializers.put_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.PutPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_policy_response_of_yojson
      ~error_deserializer
      
end

module PutProtocolsList = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_protocols_list_request) ->
    let input = Serializers.put_protocols_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.PutProtocolsList" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_protocols_list_response_of_yojson
      ~error_deserializer
      
end

module PutResourceSet = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_resource_set_request) ->
    let input = Serializers.put_resource_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.PutResourceSet" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_resource_set_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.fms", "InternalErrorException" ->
         (`InternalErrorException (internal_error_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidInputException" ->
         (`InvalidInputException (invalid_input_exception_of_yojson tree path))
      | "com.amazonaws.fms", "InvalidOperationException" ->
         (`InvalidOperationException (invalid_operation_exception_of_yojson tree path))
      | "com.amazonaws.fms", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSFMS_20180101.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

