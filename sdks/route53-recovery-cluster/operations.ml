open Types 
let (let+) res map = Result.map map res
module UpdateRoutingControlStates = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.route53recoverycluster", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "EndpointTemporarilyUnavailableException" ->
         (`EndpointTemporarilyUnavailableException (endpoint_temporarily_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ServiceLimitExceededException" ->
         (`ServiceLimitExceededException (service_limit_exceeded_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_routing_control_states_request) ->
    let input = Serializers.update_routing_control_states_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ToggleCustomerAPI.UpdateRoutingControlStates" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_routing_control_states_response_of_yojson
      ~error_deserializer
      
end

module UpdateRoutingControlState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.route53recoverycluster", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ConflictException" ->
         (`ConflictException (conflict_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "EndpointTemporarilyUnavailableException" ->
         (`EndpointTemporarilyUnavailableException (endpoint_temporarily_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: update_routing_control_state_request) ->
    let input = Serializers.update_routing_control_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ToggleCustomerAPI.UpdateRoutingControlState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.update_routing_control_state_response_of_yojson
      ~error_deserializer
      
end

module ListRoutingControls = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.route53recoverycluster", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "EndpointTemporarilyUnavailableException" ->
         (`EndpointTemporarilyUnavailableException (endpoint_temporarily_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_routing_controls_request) ->
    let input = Serializers.list_routing_controls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ToggleCustomerAPI.ListRoutingControls" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_routing_controls_response_of_yojson
      ~error_deserializer
      
end

module GetRoutingControlState = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.route53recoverycluster", "AccessDeniedException" ->
         (`AccessDeniedException (access_denied_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "EndpointTemporarilyUnavailableException" ->
         (`EndpointTemporarilyUnavailableException (endpoint_temporarily_unavailable_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "InternalServerException" ->
         (`InternalServerException (internal_server_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ResourceNotFoundException" ->
         (`ResourceNotFoundException (resource_not_found_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ThrottlingException" ->
         (`ThrottlingException (throttling_exception_of_yojson tree path))
      | "com.amazonaws.route53recoverycluster", "ValidationException" ->
         (`ValidationException (validation_exception_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_routing_control_state_request) ->
    let input = Serializers.get_routing_control_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"ToggleCustomerAPI.GetRoutingControlState" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.get_routing_control_state_response_of_yojson
      ~error_deserializer
      
end

