open Types 
module UpdateRoutingControlStates : sig
  val request :
    Smaws_Lib.Context.t ->
      update_routing_control_states_request ->
        (update_routing_control_states_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `EndpointTemporarilyUnavailableException of endpoint_temporarily_unavailable_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ServiceLimitExceededException of service_limit_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module UpdateRoutingControlState : sig
  val request :
    Smaws_Lib.Context.t ->
      update_routing_control_state_request ->
        (update_routing_control_state_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ConflictException of conflict_exception
            | `EndpointTemporarilyUnavailableException of endpoint_temporarily_unavailable_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module ListRoutingControls : sig
  val request :
    Smaws_Lib.Context.t ->
      list_routing_controls_request ->
        (list_routing_controls_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `EndpointTemporarilyUnavailableException of endpoint_temporarily_unavailable_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

module GetRoutingControlState : sig
  val request :
    Smaws_Lib.Context.t ->
      get_routing_control_state_request ->
        (get_routing_control_state_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `EndpointTemporarilyUnavailableException of endpoint_temporarily_unavailable_exception
            | `InternalServerException of internal_server_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ThrottlingException of throttling_exception
            | `ValidationException of validation_exception
            
        ]
      ) result
end

