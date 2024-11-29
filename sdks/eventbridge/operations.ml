open Types 
let (let+) res map = Result.map map res
module ActivateEventSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: activate_event_source_request) ->
    let input = Serializers.activate_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ActivateEventSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module CancelReplay = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "IllegalStatusException" ->
         (`IllegalStatusException (illegal_status_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: cancel_replay_request) ->
    let input = Serializers.cancel_replay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.CancelReplay" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.cancel_replay_response_of_yojson
      ~error_deserializer
      
end

module CreateApiDestination = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_api_destination_request) ->
    let input = Serializers.create_api_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.CreateApiDestination" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_api_destination_response_of_yojson
      ~error_deserializer
      
end

module CreateArchive = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InvalidEventPatternException" ->
         (`InvalidEventPatternException (invalid_event_pattern_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_archive_request) ->
    let input = Serializers.create_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.CreateArchive" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_archive_response_of_yojson
      ~error_deserializer
      
end

module CreateConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_connection_request) ->
    let input = Serializers.create_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.CreateConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_connection_response_of_yojson
      ~error_deserializer
      
end

module CreateEndpoint = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_endpoint_request) ->
    let input = Serializers.create_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.CreateEndpoint" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_endpoint_response_of_yojson
      ~error_deserializer
      
end

module CreateEventBus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_event_bus_request) ->
    let input = Serializers.create_event_bus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.CreateEventBus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_event_bus_response_of_yojson
      ~error_deserializer
      
end

module CreatePartnerEventSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: create_partner_event_source_request) ->
    let input = Serializers.create_partner_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.CreatePartnerEventSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.create_partner_event_source_response_of_yojson
      ~error_deserializer
      
end

module DeactivateEventSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InvalidStateException" ->
         (`InvalidStateException (invalid_state_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deactivate_event_source_request) ->
    let input = Serializers.deactivate_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DeactivateEventSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeauthorizeConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deauthorize_connection_request) ->
    let input = Serializers.deauthorize_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DeauthorizeConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.deauthorize_connection_response_of_yojson
      ~error_deserializer
      
end

module DeleteApiDestination = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_api_destination_request) ->
    let input = Serializers.delete_api_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DeleteApiDestination" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_api_destination_response_of_yojson
      ~error_deserializer
      
end

module DeleteArchive = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_archive_request) ->
    let input = Serializers.delete_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DeleteArchive" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_archive_response_of_yojson
      ~error_deserializer
      
end

module DeleteConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_connection_request) ->
    let input = Serializers.delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DeleteConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_connection_response_of_yojson
      ~error_deserializer
      
end

module DeleteEndpoint = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_endpoint_request) ->
    let input = Serializers.delete_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DeleteEndpoint" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.delete_endpoint_response_of_yojson
      ~error_deserializer
      
end

module DeleteEventBus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_event_bus_request) ->
    let input = Serializers.delete_event_bus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DeleteEventBus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeletePartnerEventSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_partner_event_source_request) ->
    let input = Serializers.delete_partner_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DeletePartnerEventSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ManagedRuleException" ->
         (`ManagedRuleException (managed_rule_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_rule_request) ->
    let input = Serializers.delete_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DeleteRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DescribeApiDestination = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_api_destination_request) ->
    let input = Serializers.describe_api_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DescribeApiDestination" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_api_destination_response_of_yojson
      ~error_deserializer
      
end

module DescribeArchive = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_archive_request) ->
    let input = Serializers.describe_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DescribeArchive" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_archive_response_of_yojson
      ~error_deserializer
      
end

module DescribeConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_connection_request) ->
    let input = Serializers.describe_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DescribeConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_connection_response_of_yojson
      ~error_deserializer
      
end

module DescribeEndpoint = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_endpoint_request) ->
    let input = Serializers.describe_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DescribeEndpoint" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_endpoint_response_of_yojson
      ~error_deserializer
      
end

module DescribeEventBus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_event_bus_request) ->
    let input = Serializers.describe_event_bus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DescribeEventBus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_event_bus_response_of_yojson
      ~error_deserializer
      
end

module DescribeEventSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_event_source_request) ->
    let input = Serializers.describe_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DescribeEventSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_event_source_response_of_yojson
      ~error_deserializer
      
end

module DescribePartnerEventSource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_partner_event_source_request) ->
    let input = Serializers.describe_partner_event_source_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DescribePartnerEventSource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_partner_event_source_response_of_yojson
      ~error_deserializer
      
end

module DescribeReplay = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_replay_request) ->
    let input = Serializers.describe_replay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DescribeReplay" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_replay_response_of_yojson
      ~error_deserializer
      
end

module DescribeRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_rule_request) ->
    let input = Serializers.describe_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DescribeRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.describe_rule_response_of_yojson
      ~error_deserializer
      
end

module DisableRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ManagedRuleException" ->
         (`ManagedRuleException (managed_rule_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: disable_rule_request) ->
    let input = Serializers.disable_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.DisableRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module EnableRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ManagedRuleException" ->
         (`ManagedRuleException (managed_rule_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: enable_rule_request) ->
    let input = Serializers.enable_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.EnableRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module ListApiDestinations = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_api_destinations_request) ->
    let input = Serializers.list_api_destinations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListApiDestinations" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_api_destinations_response_of_yojson
      ~error_deserializer
      
end

module ListArchives = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_archives_request) ->
    let input = Serializers.list_archives_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListArchives" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_archives_response_of_yojson
      ~error_deserializer
      
end

module ListConnections = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_connections_request) ->
    let input = Serializers.list_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListConnections" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_connections_response_of_yojson
      ~error_deserializer
      
end

module ListEndpoints = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_endpoints_request) ->
    let input = Serializers.list_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListEndpoints" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_endpoints_response_of_yojson
      ~error_deserializer
      
end

module ListEventBuses = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_event_buses_request) ->
    let input = Serializers.list_event_buses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListEventBuses" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_event_buses_response_of_yojson
      ~error_deserializer
      
end

module ListEventSources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_event_sources_request) ->
    let input = Serializers.list_event_sources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListEventSources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_event_sources_response_of_yojson
      ~error_deserializer
      
end

module ListPartnerEventSourceAccounts = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_partner_event_source_accounts_request) ->
    let input = Serializers.list_partner_event_source_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListPartnerEventSourceAccounts" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_partner_event_source_accounts_response_of_yojson
      ~error_deserializer
      
end

module ListPartnerEventSources = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_partner_event_sources_request) ->
    let input = Serializers.list_partner_event_sources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListPartnerEventSources" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_partner_event_sources_response_of_yojson
      ~error_deserializer
      
end

module ListReplays = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_replays_request) ->
    let input = Serializers.list_replays_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListReplays" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_replays_response_of_yojson
      ~error_deserializer
      
end

module ListRuleNamesByTarget = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_rule_names_by_target_request) ->
    let input = Serializers.list_rule_names_by_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListRuleNamesByTarget" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_rule_names_by_target_response_of_yojson
      ~error_deserializer
      
end

module ListRules = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_rules_request) ->
    let input = Serializers.list_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListRules" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_rules_response_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_request) ->
    let input = Serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
      
end

module ListTargetsByRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_targets_by_rule_request) ->
    let input = Serializers.list_targets_by_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.ListTargetsByRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_targets_by_rule_response_of_yojson
      ~error_deserializer
      
end

module PutEvents = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_events_request) ->
    let input = Serializers.put_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.PutEvents" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_events_response_of_yojson
      ~error_deserializer
      
end

module PutPartnerEvents = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_partner_events_request) ->
    let input = Serializers.put_partner_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.PutPartnerEvents" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_partner_events_response_of_yojson
      ~error_deserializer
      
end

module PutPermission = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "PolicyLengthExceededException" ->
         (`PolicyLengthExceededException (policy_length_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_permission_request) ->
    let input = Serializers.put_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.PutPermission" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module PutRule = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InvalidEventPatternException" ->
         (`InvalidEventPatternException (invalid_event_pattern_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ManagedRuleException" ->
         (`ManagedRuleException (managed_rule_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_rule_request) ->
    let input = Serializers.put_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.PutRule" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_rule_response_of_yojson
      ~error_deserializer
      
end

module PutTargets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ManagedRuleException" ->
         (`ManagedRuleException (managed_rule_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: put_targets_request) ->
    let input = Serializers.put_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.PutTargets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.put_targets_response_of_yojson
      ~error_deserializer
      
end

module RemovePermission = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: remove_permission_request) ->
    let input = Serializers.remove_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.RemovePermission" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RemoveTargets = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ManagedRuleException" ->
         (`ManagedRuleException (managed_rule_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: remove_targets_request) ->
    let input = Serializers.remove_targets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.RemoveTargets" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.remove_targets_response_of_yojson
      ~error_deserializer
      
end

module StartReplay = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InvalidEventPatternException" ->
         (`InvalidEventPatternException (invalid_event_pattern_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceAlreadyExistsException" ->
         (`ResourceAlreadyExistsException (resource_already_exists_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_replay_request) ->
    let input = Serializers.start_replay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.StartReplay" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.start_replay_response_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ManagedRuleException" ->
         (`ManagedRuleException (managed_rule_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_request) ->
    let input = Serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.tag_resource_response_of_yojson
      ~error_deserializer
      
end

module TestEventPattern = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InvalidEventPatternException" ->
         (`InvalidEventPatternException (invalid_event_pattern_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: test_event_pattern_request) ->
    let input = Serializers.test_event_pattern_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.TestEventPattern" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.test_event_pattern_response_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ManagedRuleException" ->
         (`ManagedRuleException (managed_rule_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_request) ->
    let input = Serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.untag_resource_response_of_yojson
      ~error_deserializer
      
end

module UpdateApiDestination = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_api_destination_request) ->
    let input = Serializers.update_api_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.UpdateApiDestination" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_api_destination_response_of_yojson
      ~error_deserializer
      
end

module UpdateArchive = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InvalidEventPatternException" ->
         (`InvalidEventPatternException (invalid_event_pattern_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_archive_request) ->
    let input = Serializers.update_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.UpdateArchive" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_archive_response_of_yojson
      ~error_deserializer
      
end

module UpdateConnection = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "LimitExceededException" ->
         (`LimitExceededException (limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_connection_request) ->
    let input = Serializers.update_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.UpdateConnection" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_connection_response_of_yojson
      ~error_deserializer
      
end

module UpdateEndpoint = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_endpoint_request) ->
    let input = Serializers.update_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.UpdateEndpoint" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_endpoint_response_of_yojson
      ~error_deserializer
      
end

module UpdateEventBus = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.eventbridge", "ConcurrentModificationException" ->
         (`ConcurrentModificationException (concurrent_modification_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "InternalException" ->
         (`InternalException (internal_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "OperationDisabledException" ->
         (`OperationDisabledException (operation_disabled_exception_of_yojson tree path))
      | "com.amazonaws.eventbridge", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_event_bus_request) ->
    let input = Serializers.update_event_bus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"AWSEvents.UpdateEventBus" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_event_bus_response_of_yojson
      ~error_deserializer
      
end

