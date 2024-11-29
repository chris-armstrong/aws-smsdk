open Types 
let (let+) res map = Result.map map res
module AssociateDelegateToResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_delegate_to_resource_request) ->
    let input = Serializers.associate_delegate_to_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.AssociateDelegateToResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_delegate_to_resource_response_of_yojson
      ~error_deserializer
      
end

module AssociateMemberToGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_member_to_group_request) ->
    let input = Serializers.associate_member_to_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.AssociateMemberToGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_member_to_group_response_of_yojson
      ~error_deserializer
      
end

module AssumeImpersonationRole = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: assume_impersonation_role_request) ->
    let input = Serializers.assume_impersonation_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.AssumeImpersonationRole" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.assume_impersonation_role_response_of_yojson
      ~error_deserializer
      
end

module CancelMailboxExportJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_mailbox_export_job_request) ->
    let input = Serializers.cancel_mailbox_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.CancelMailboxExportJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_mailbox_export_job_response_of_yojson
      ~error_deserializer
      
end

module CreateAlias = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EmailAddressInUseException" ->
         (`EmailAddressInUseException (email_address_in_use_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainNotFoundException" ->
         (`MailDomainNotFoundException (mail_domain_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainStateException" ->
         (`MailDomainStateException (mail_domain_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_alias_request) ->
    let input = Serializers.create_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.CreateAlias" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_alias_response_of_yojson
      ~error_deserializer
      
end

module CreateAvailabilityConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "NameAvailabilityException" ->
         (`NameAvailabilityException (name_availability_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_availability_configuration_request) ->
    let input = Serializers.create_availability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.CreateAvailabilityConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_availability_configuration_response_of_yojson
      ~error_deserializer
      
end

module CreateGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "NameAvailabilityException" ->
         (`NameAvailabilityException (name_availability_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ReservedNameException" ->
         (`ReservedNameException (reserved_name_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_group_request) ->
    let input = Serializers.create_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.CreateGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_group_response_of_yojson
      ~error_deserializer
      
end

module CreateImpersonationRole = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_impersonation_role_request) ->
    let input = Serializers.create_impersonation_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.CreateImpersonationRole" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_impersonation_role_response_of_yojson
      ~error_deserializer
      
end

module CreateMobileDeviceAccessRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_mobile_device_access_rule_request) ->
    let input = Serializers.create_mobile_device_access_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.CreateMobileDeviceAccessRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_mobile_device_access_rule_response_of_yojson
      ~error_deserializer
      
end

module CreateOrganization = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryInUseException" ->
         (`DirectoryInUseException (directory_in_use_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "NameAvailabilityException" ->
         (`NameAvailabilityException (name_availability_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_organization_request) ->
    let input = Serializers.create_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.CreateOrganization" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_organization_response_of_yojson
      ~error_deserializer
      
end

module CreateResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "NameAvailabilityException" ->
         (`NameAvailabilityException (name_availability_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ReservedNameException" ->
         (`ReservedNameException (reserved_name_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_resource_request) ->
    let input = Serializers.create_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.CreateResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_resource_response_of_yojson
      ~error_deserializer
      
end

module CreateUser = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidPasswordException" ->
         (`InvalidPasswordException (invalid_password_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "NameAvailabilityException" ->
         (`NameAvailabilityException (name_availability_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ReservedNameException" ->
         (`ReservedNameException (reserved_name_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_user_request) ->
    let input = Serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.CreateUser" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_user_response_of_yojson
      ~error_deserializer
      
end

module DeleteAccessControlRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_access_control_rule_request) ->
    let input = Serializers.delete_access_control_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteAccessControlRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_access_control_rule_response_of_yojson
      ~error_deserializer
      
end

module DeleteAlias = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_alias_request) ->
    let input = Serializers.delete_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteAlias" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_alias_response_of_yojson
      ~error_deserializer
      
end

module DeleteAvailabilityConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_availability_configuration_request) ->
    let input = Serializers.delete_availability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteAvailabilityConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_availability_configuration_response_of_yojson
      ~error_deserializer
      
end

module DeleteEmailMonitoringConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_email_monitoring_configuration_request) ->
    let input = Serializers.delete_email_monitoring_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteEmailMonitoringConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_email_monitoring_configuration_response_of_yojson
      ~error_deserializer
      
end

module DeleteGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_group_request) ->
    let input = Serializers.delete_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_group_response_of_yojson
      ~error_deserializer
      
end

module DeleteImpersonationRole = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_impersonation_role_request) ->
    let input = Serializers.delete_impersonation_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteImpersonationRole" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_impersonation_role_response_of_yojson
      ~error_deserializer
      
end

module DeleteMailboxPermissions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_mailbox_permissions_request) ->
    let input = Serializers.delete_mailbox_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteMailboxPermissions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_mailbox_permissions_response_of_yojson
      ~error_deserializer
      
end

module DeleteMobileDeviceAccessOverride = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_mobile_device_access_override_request) ->
    let input = Serializers.delete_mobile_device_access_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteMobileDeviceAccessOverride" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_mobile_device_access_override_response_of_yojson
      ~error_deserializer
      
end

module DeleteMobileDeviceAccessRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_mobile_device_access_rule_request) ->
    let input = Serializers.delete_mobile_device_access_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteMobileDeviceAccessRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_mobile_device_access_rule_response_of_yojson
      ~error_deserializer
      
end

module DeleteOrganization = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_organization_request) ->
    let input = Serializers.delete_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteOrganization" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_organization_response_of_yojson
      ~error_deserializer
      
end

module DeleteResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_resource_request) ->
    let input = Serializers.delete_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_resource_response_of_yojson
      ~error_deserializer
      
end

module DeleteRetentionPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_retention_policy_request) ->
    let input = Serializers.delete_retention_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteRetentionPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_retention_policy_response_of_yojson
      ~error_deserializer
      
end

module DeleteUser = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_user_request) ->
    let input = Serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeleteUser" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_user_response_of_yojson
      ~error_deserializer
      
end

module DeregisterFromWorkMail = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_from_work_mail_request) ->
    let input = Serializers.deregister_from_work_mail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeregisterFromWorkMail" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deregister_from_work_mail_response_of_yojson
      ~error_deserializer
      
end

module DeregisterMailDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidCustomSesConfigurationException" ->
         (`InvalidCustomSesConfigurationException (invalid_custom_ses_configuration_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainInUseException" ->
         (`MailDomainInUseException (mail_domain_in_use_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deregister_mail_domain_request) ->
    let input = Serializers.deregister_mail_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DeregisterMailDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deregister_mail_domain_response_of_yojson
      ~error_deserializer
      
end

module DescribeEmailMonitoringConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_email_monitoring_configuration_request) ->
    let input = Serializers.describe_email_monitoring_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DescribeEmailMonitoringConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_email_monitoring_configuration_response_of_yojson
      ~error_deserializer
      
end

module DescribeEntity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_entity_request) ->
    let input = Serializers.describe_entity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DescribeEntity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_entity_response_of_yojson
      ~error_deserializer
      
end

module DescribeGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_group_request) ->
    let input = Serializers.describe_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DescribeGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_group_response_of_yojson
      ~error_deserializer
      
end

module DescribeInboundDmarcSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_inbound_dmarc_settings_request) ->
    let input = Serializers.describe_inbound_dmarc_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DescribeInboundDmarcSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_inbound_dmarc_settings_response_of_yojson
      ~error_deserializer
      
end

module DescribeMailboxExportJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_mailbox_export_job_request) ->
    let input = Serializers.describe_mailbox_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DescribeMailboxExportJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_mailbox_export_job_response_of_yojson
      ~error_deserializer
      
end

module DescribeOrganization = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_organization_request) ->
    let input = Serializers.describe_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DescribeOrganization" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_organization_response_of_yojson
      ~error_deserializer
      
end

module DescribeResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_resource_request) ->
    let input = Serializers.describe_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DescribeResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_resource_response_of_yojson
      ~error_deserializer
      
end

module DescribeUser = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_user_request) ->
    let input = Serializers.describe_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DescribeUser" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_user_response_of_yojson
      ~error_deserializer
      
end

module DisassociateDelegateFromResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_delegate_from_resource_request) ->
    let input = Serializers.disassociate_delegate_from_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DisassociateDelegateFromResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_delegate_from_resource_response_of_yojson
      ~error_deserializer
      
end

module DisassociateMemberFromGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_member_from_group_request) ->
    let input = Serializers.disassociate_member_from_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.DisassociateMemberFromGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_member_from_group_response_of_yojson
      ~error_deserializer
      
end

module GetAccessControlEffect = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_access_control_effect_request) ->
    let input = Serializers.get_access_control_effect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.GetAccessControlEffect" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_access_control_effect_response_of_yojson
      ~error_deserializer
      
end

module GetDefaultRetentionPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_default_retention_policy_request) ->
    let input = Serializers.get_default_retention_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.GetDefaultRetentionPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_default_retention_policy_response_of_yojson
      ~error_deserializer
      
end

module GetImpersonationRole = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_impersonation_role_request) ->
    let input = Serializers.get_impersonation_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.GetImpersonationRole" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_impersonation_role_response_of_yojson
      ~error_deserializer
      
end

module GetImpersonationRoleEffect = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_impersonation_role_effect_request) ->
    let input = Serializers.get_impersonation_role_effect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.GetImpersonationRoleEffect" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_impersonation_role_effect_response_of_yojson
      ~error_deserializer
      
end

module GetMailboxDetails = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_mailbox_details_request) ->
    let input = Serializers.get_mailbox_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.GetMailboxDetails" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_mailbox_details_response_of_yojson
      ~error_deserializer
      
end

module GetMailDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainNotFoundException" ->
         (`MailDomainNotFoundException (mail_domain_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_mail_domain_request) ->
    let input = Serializers.get_mail_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.GetMailDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_mail_domain_response_of_yojson
      ~error_deserializer
      
end

module GetMobileDeviceAccessEffect = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_mobile_device_access_effect_request) ->
    let input = Serializers.get_mobile_device_access_effect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.GetMobileDeviceAccessEffect" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_mobile_device_access_effect_response_of_yojson
      ~error_deserializer
      
end

module GetMobileDeviceAccessOverride = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_mobile_device_access_override_request) ->
    let input = Serializers.get_mobile_device_access_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.GetMobileDeviceAccessOverride" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_mobile_device_access_override_response_of_yojson
      ~error_deserializer
      
end

module ListAccessControlRules = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_access_control_rules_request) ->
    let input = Serializers.list_access_control_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListAccessControlRules" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_access_control_rules_response_of_yojson
      ~error_deserializer
      
end

module ListAliases = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_aliases_request) ->
    let input = Serializers.list_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListAliases" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_aliases_response_of_yojson
      ~error_deserializer
      
end

module ListAvailabilityConfigurations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_availability_configurations_request) ->
    let input = Serializers.list_availability_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListAvailabilityConfigurations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_availability_configurations_response_of_yojson
      ~error_deserializer
      
end

module ListGroupMembers = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_group_members_request) ->
    let input = Serializers.list_group_members_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListGroupMembers" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_group_members_response_of_yojson
      ~error_deserializer
      
end

module ListGroups = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_groups_request) ->
    let input = Serializers.list_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListGroups" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_groups_response_of_yojson
      ~error_deserializer
      
end

module ListGroupsForEntity = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_groups_for_entity_request) ->
    let input = Serializers.list_groups_for_entity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListGroupsForEntity" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_groups_for_entity_response_of_yojson
      ~error_deserializer
      
end

module ListImpersonationRoles = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_impersonation_roles_request) ->
    let input = Serializers.list_impersonation_roles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListImpersonationRoles" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_impersonation_roles_response_of_yojson
      ~error_deserializer
      
end

module ListMailboxExportJobs = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_mailbox_export_jobs_request) ->
    let input = Serializers.list_mailbox_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListMailboxExportJobs" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_mailbox_export_jobs_response_of_yojson
      ~error_deserializer
      
end

module ListMailboxPermissions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_mailbox_permissions_request) ->
    let input = Serializers.list_mailbox_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListMailboxPermissions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_mailbox_permissions_response_of_yojson
      ~error_deserializer
      
end

module ListMailDomains = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_mail_domains_request) ->
    let input = Serializers.list_mail_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListMailDomains" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_mail_domains_response_of_yojson
      ~error_deserializer
      
end

module ListMobileDeviceAccessOverrides = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_mobile_device_access_overrides_request) ->
    let input = Serializers.list_mobile_device_access_overrides_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListMobileDeviceAccessOverrides" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_mobile_device_access_overrides_response_of_yojson
      ~error_deserializer
      
end

module ListMobileDeviceAccessRules = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_mobile_device_access_rules_request) ->
    let input = Serializers.list_mobile_device_access_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListMobileDeviceAccessRules" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_mobile_device_access_rules_response_of_yojson
      ~error_deserializer
      
end

module ListOrganizations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_organizations_request) ->
    let input = Serializers.list_organizations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListOrganizations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_organizations_response_of_yojson
      ~error_deserializer
      
end

module ListResourceDelegates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_resource_delegates_request) ->
    let input = Serializers.list_resource_delegates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListResourceDelegates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_resource_delegates_response_of_yojson
      ~error_deserializer
      
end

module ListResources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_resources_request) ->
    let input = Serializers.list_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListResources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_resources_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListUsers = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_users_request) ->
    let input = Serializers.list_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ListUsers" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_users_response_of_yojson
      ~error_deserializer
      
end

module PutAccessControlRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_access_control_rule_request) ->
    let input = Serializers.put_access_control_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.PutAccessControlRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_access_control_rule_response_of_yojson
      ~error_deserializer
      
end

module PutEmailMonitoringConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_email_monitoring_configuration_request) ->
    let input = Serializers.put_email_monitoring_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.PutEmailMonitoringConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_email_monitoring_configuration_response_of_yojson
      ~error_deserializer
      
end

module PutInboundDmarcSettings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_inbound_dmarc_settings_request) ->
    let input = Serializers.put_inbound_dmarc_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.PutInboundDmarcSettings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_inbound_dmarc_settings_response_of_yojson
      ~error_deserializer
      
end

module PutMailboxPermissions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_mailbox_permissions_request) ->
    let input = Serializers.put_mailbox_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.PutMailboxPermissions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_mailbox_permissions_response_of_yojson
      ~error_deserializer
      
end

module PutMobileDeviceAccessOverride = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_mobile_device_access_override_request) ->
    let input = Serializers.put_mobile_device_access_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.PutMobileDeviceAccessOverride" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_mobile_device_access_override_response_of_yojson
      ~error_deserializer
      
end

module PutRetentionPolicy = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_retention_policy_request) ->
    let input = Serializers.put_retention_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.PutRetentionPolicy" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_retention_policy_response_of_yojson
      ~error_deserializer
      
end

module RegisterMailDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainInUseException" ->
         (`MailDomainInUseException (mail_domain_in_use_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_mail_domain_request) ->
    let input = Serializers.register_mail_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.RegisterMailDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_mail_domain_response_of_yojson
      ~error_deserializer
      
end

module RegisterToWorkMail = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EmailAddressInUseException" ->
         (`EmailAddressInUseException (email_address_in_use_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityAlreadyRegisteredException" ->
         (`EntityAlreadyRegisteredException (entity_already_registered_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainNotFoundException" ->
         (`MailDomainNotFoundException (mail_domain_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainStateException" ->
         (`MailDomainStateException (mail_domain_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_to_work_mail_request) ->
    let input = Serializers.register_to_work_mail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.RegisterToWorkMail" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.register_to_work_mail_response_of_yojson
      ~error_deserializer
      
end

module ResetPassword = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidPasswordException" ->
         (`InvalidPasswordException (invalid_password_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: reset_password_request) ->
    let input = Serializers.reset_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.ResetPassword" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.reset_password_response_of_yojson
      ~error_deserializer
      
end

module StartMailboxExportJob = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_mailbox_export_job_request) ->
    let input = Serializers.start_mailbox_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.StartMailboxExportJob" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_mailbox_export_job_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "TooManyTagsException" ->
         (`TooManyTagsException (too_many_tags_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module TestAvailabilityConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: test_availability_configuration_request) ->
    let input = Serializers.test_availability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.TestAvailabilityConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.test_availability_configuration_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module UpdateAvailabilityConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_availability_configuration_request) ->
    let input = Serializers.update_availability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.UpdateAvailabilityConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_availability_configuration_response_of_yojson
      ~error_deserializer
      
end

module UpdateDefaultMailDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainNotFoundException" ->
         (`MailDomainNotFoundException (mail_domain_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainStateException" ->
         (`MailDomainStateException (mail_domain_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_default_mail_domain_request) ->
    let input = Serializers.update_default_mail_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.UpdateDefaultMailDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_default_mail_domain_response_of_yojson
      ~error_deserializer
      
end

module UpdateGroup = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_group_request) ->
    let input = Serializers.update_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.UpdateGroup" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_group_response_of_yojson
      ~error_deserializer
      
end

module UpdateImpersonationRole = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_impersonation_role_request) ->
    let input = Serializers.update_impersonation_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.UpdateImpersonationRole" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_impersonation_role_response_of_yojson
      ~error_deserializer
      
end

module UpdateMailboxQuota = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_mailbox_quota_request) ->
    let input = Serializers.update_mailbox_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.UpdateMailboxQuota" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_mailbox_quota_response_of_yojson
      ~error_deserializer
      
end

module UpdateMobileDeviceAccessRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_mobile_device_access_rule_request) ->
    let input = Serializers.update_mobile_device_access_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.UpdateMobileDeviceAccessRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_mobile_device_access_rule_response_of_yojson
      ~error_deserializer
      
end

module UpdatePrimaryEmailAddress = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EmailAddressInUseException" ->
         (`EmailAddressInUseException (email_address_in_use_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainNotFoundException" ->
         (`MailDomainNotFoundException (mail_domain_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainStateException" ->
         (`MailDomainStateException (mail_domain_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_primary_email_address_request) ->
    let input = Serializers.update_primary_email_address_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.UpdatePrimaryEmailAddress" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_primary_email_address_response_of_yojson
      ~error_deserializer
      
end

module UpdateResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EmailAddressInUseException" ->
         (`EmailAddressInUseException (email_address_in_use_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidConfigurationException" ->
         (`InvalidConfigurationException (invalid_configuration_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainNotFoundException" ->
         (`MailDomainNotFoundException (mail_domain_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "MailDomainStateException" ->
         (`MailDomainStateException (mail_domain_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "NameAvailabilityException" ->
         (`NameAvailabilityException (name_availability_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_resource_request) ->
    let input = Serializers.update_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.UpdateResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_resource_response_of_yojson
      ~error_deserializer
      
end

module UpdateUser = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.workmail", "DirectoryServiceAuthenticationFailedException" ->
         (`DirectoryServiceAuthenticationFailedException (directory_service_authentication_failed_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "DirectoryUnavailableException" ->
         (`DirectoryUnavailableException (directory_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityNotFoundException" ->
         (`EntityNotFoundException (entity_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "EntityStateException" ->
         (`EntityStateException (entity_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "InvalidParameterException" ->
         (`InvalidParameterException (invalid_parameter_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationNotFoundException" ->
         (`OrganizationNotFoundException (organization_not_found_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "OrganizationStateException" ->
         (`OrganizationStateException (organization_state_exception_of_yojson tree path))
      | "com.amazonaws.workmail", "UnsupportedOperationException" ->
         (`UnsupportedOperationException (unsupported_operation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_user_request) ->
    let input = Serializers.update_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"WorkMailService.UpdateUser" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_user_response_of_yojson
      ~error_deserializer
      
end

