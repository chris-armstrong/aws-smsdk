open Types 
let (let+) res map = Result.map map res
module AssociateGatewayToServer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: associate_gateway_to_server_input) ->
    let input = Serializers.associate_gateway_to_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.AssociateGatewayToServer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.associate_gateway_to_server_output_of_yojson
      ~error_deserializer
      
end

module CreateGateway = struct
  let error_deserializer tree path = 
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_gateway_input) ->
    let input = Serializers.create_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.CreateGateway" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_gateway_output_of_yojson
      ~error_deserializer
      
end

module DeleteGateway = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_gateway_input) ->
    let input = Serializers.delete_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.DeleteGateway" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_gateway_output_of_yojson
      ~error_deserializer
      
end

module DeleteHypervisor = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_hypervisor_input) ->
    let input = Serializers.delete_hypervisor_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.DeleteHypervisor" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_hypervisor_output_of_yojson
      ~error_deserializer
      
end

module DisassociateGatewayFromServer = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disassociate_gateway_from_server_input) ->
    let input = Serializers.disassociate_gateway_from_server_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.DisassociateGatewayFromServer" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.disassociate_gateway_from_server_output_of_yojson
      ~error_deserializer
      
end

module GetBandwidthRateLimitSchedule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_bandwidth_rate_limit_schedule_input) ->
    let input = Serializers.get_bandwidth_rate_limit_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.GetBandwidthRateLimitSchedule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_bandwidth_rate_limit_schedule_output_of_yojson
      ~error_deserializer
      
end

module GetGateway = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_gateway_input) ->
    let input = Serializers.get_gateway_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.GetGateway" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_gateway_output_of_yojson
      ~error_deserializer
      
end

module GetHypervisor = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_hypervisor_input) ->
    let input = Serializers.get_hypervisor_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.GetHypervisor" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_hypervisor_output_of_yojson
      ~error_deserializer
      
end

module GetHypervisorPropertyMappings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_hypervisor_property_mappings_input) ->
    let input = Serializers.get_hypervisor_property_mappings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.GetHypervisorPropertyMappings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_hypervisor_property_mappings_output_of_yojson
      ~error_deserializer
      
end

module GetVirtualMachine = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_virtual_machine_input) ->
    let input = Serializers.get_virtual_machine_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.GetVirtualMachine" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_virtual_machine_output_of_yojson
      ~error_deserializer
      
end

module ImportHypervisorConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: import_hypervisor_configuration_input) ->
    let input = Serializers.import_hypervisor_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.ImportHypervisorConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.import_hypervisor_configuration_output_of_yojson
      ~error_deserializer
      
end

module ListGateways = struct
  let error_deserializer tree path = 
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_gateways_input) ->
    let input = Serializers.list_gateways_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.ListGateways" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_gateways_output_of_yojson
      ~error_deserializer
      
end

module ListHypervisors = struct
  let error_deserializer tree path = 
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_hypervisors_input) ->
    let input = Serializers.list_hypervisors_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.ListHypervisors" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_hypervisors_output_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_input) ->
    let input = Serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
      
end

module ListVirtualMachines = struct
  let error_deserializer tree path = 
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_virtual_machines_input) ->
    let input = Serializers.list_virtual_machines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.ListVirtualMachines" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_virtual_machines_output_of_yojson
      ~error_deserializer
      
end

module PutBandwidthRateLimitSchedule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_bandwidth_rate_limit_schedule_input) ->
    let input = Serializers.put_bandwidth_rate_limit_schedule_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.PutBandwidthRateLimitSchedule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_bandwidth_rate_limit_schedule_output_of_yojson
      ~error_deserializer
      
end

module PutHypervisorPropertyMappings = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_hypervisor_property_mappings_input) ->
    let input = Serializers.put_hypervisor_property_mappings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.PutHypervisorPropertyMappings" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_hypervisor_property_mappings_output_of_yojson
      ~error_deserializer
      
end

module PutMaintenanceStartTime = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_maintenance_start_time_input) ->
    let input = Serializers.put_maintenance_start_time_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.PutMaintenanceStartTime" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_maintenance_start_time_output_of_yojson
      ~error_deserializer
      
end

module StartVirtualMachinesMetadataSync = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_virtual_machines_metadata_sync_input) ->
    let input = Serializers.start_virtual_machines_metadata_sync_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.StartVirtualMachinesMetadataSync" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_virtual_machines_metadata_sync_output_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_input) ->
    let input = Serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_output_of_yojson
      ~error_deserializer
      
end

module TestHypervisorConfiguration = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: test_hypervisor_configuration_input) ->
    let input = Serializers.test_hypervisor_configuration_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.TestHypervisorConfiguration" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.test_hypervisor_configuration_output_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_input) ->
    let input = Serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_output_of_yojson
      ~error_deserializer
      
end

module UpdateGatewayInformation = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_gateway_information_input) ->
    let input = Serializers.update_gateway_information_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.UpdateGatewayInformation" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_gateway_information_output_of_yojson
      ~error_deserializer
      
end

module UpdateGatewaySoftwareNow = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_gateway_software_now_input) ->
    let input = Serializers.update_gateway_software_now_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.UpdateGatewaySoftwareNow" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_gateway_software_now_output_of_yojson
      ~error_deserializer
      
end

module UpdateHypervisor = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.backupgateway", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.backupgateway", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_hypervisor_input) ->
    let input = Serializers.update_hypervisor_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"BackupOnPremises_v20210101.UpdateHypervisor" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_hypervisor_output_of_yojson
      ~error_deserializer
      
end

