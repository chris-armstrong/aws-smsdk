open Types 
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
  (** 
    Get the state for a routing control. A routing control is a simple on/off switch that you can use to route traffic to cells. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow.
    
     Before you can create a routing control, you must first create a cluster, and then host the control in a control panel on the cluster. For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.create.html}Create routing control structures} in the Amazon Route 53 Application Recovery Controller Developer Guide. You access one of the endpoints for the cluster to get or update the routing control state to redirect traffic for your application.
     
      {i You must specify Regional endpoints when you work with API cluster operations to get or update routing control states in Route 53 ARC.}
      
       To see a code example for getting a routing control state, including accessing Regional cluster endpoints in sequence, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/service_code_examples_actions.html}API examples} in the Amazon Route 53 Application Recovery Controller Developer Guide.
       
        Learn more about working with routing controls in the following topics in the Amazon Route 53 Application Recovery Controller Developer Guide:
        
         {ul
              {- {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html}Viewing and updating routing control states}
                 
                 }
               {- {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html}Working with routing controls in Route 53 ARC}
                  
                  }
              
      }
       *)

  
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
  (** 
    List routing control names and Amazon Resource Names (ARNs), as well as the routing control state for each routing control, along with the control panel name and control panel ARN for the routing controls. If you specify a control panel ARN, this call lists the routing controls in the control panel. Otherwise, it lists all the routing controls in the cluster.
    
     A routing control is a simple on/off switch in Route 53 ARC that you can use to route traffic to cells. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow.
     
      Before you can create a routing control, you must first create a cluster, and then host the control in a control panel on the cluster. For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.create.html}Create routing control structures} in the Amazon Route 53 Application Recovery Controller Developer Guide. You access one of the endpoints for the cluster to get or update the routing control state to redirect traffic for your application.
      
       {i You must specify Regional endpoints when you work with API cluster operations to use this API operation to list routing controls in Route 53 ARC.}
       
        Learn more about working with routing controls in the following topics in the Amazon Route 53 Application Recovery Controller Developer Guide:
        
         {ul
              {- {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html}Viewing and updating routing control states}
                 
                 }
               {- {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html}Working with routing controls in Route 53 ARC}
                  
                  }
              
      }
       *)

  
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
  [@@ocaml.doc {| 
    Set the state of the routing control to reroute traffic. You can set the value to ON or OFF. When the state is ON, traffic flows to a cell. When the state is OFF, traffic does not flow.
    
     With Route 53 ARC, you can add safety rules for routing controls, which are safeguards for routing control state updates that help prevent unexpected outcomes, like fail open traffic routing. However, there are scenarios when you might want to bypass the routing control safeguards that are enforced with safety rules that you've configured. For example, you might want to fail over quickly for disaster recovery, and one or more safety rules might be unexpectedly preventing you from updating a routing control state to reroute traffic. In a "break glass" scenario like this, you can override one or more safety rules to change a routing control state and fail over your application.
     
      The [SafetyRulesToOverride] property enables you override one or more safety rules and update routing control states. For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html}Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery Controller Developer Guide.
      
       {i You must specify Regional endpoints when you work with API cluster operations to get or update routing control states in Route 53 ARC.}
       
        To see a code example for getting a routing control state, including accessing Regional cluster endpoints in sequence, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/service_code_examples_actions.html}API examples} in the Amazon Route 53 Application Recovery Controller Developer Guide.
        
         {ul
              {- {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html}Viewing and updating routing control states}
                 
                 }
               {- {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html}Working with routing controls overall}
                  
                  }
              
      }
       |}]

  
end

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
  [@@ocaml.doc {| 
    Set multiple routing control states. You can set the value for each state to be ON or OFF. When the state is ON, traffic flows to a cell. When it's OFF, traffic does not flow.
    
     With Route 53 ARC, you can add safety rules for routing controls, which are safeguards for routing control state updates that help prevent unexpected outcomes, like fail open traffic routing. However, there are scenarios when you might want to bypass the routing control safeguards that are enforced with safety rules that you've configured. For example, you might want to fail over quickly for disaster recovery, and one or more safety rules might be unexpectedly preventing you from updating a routing control state to reroute traffic. In a "break glass" scenario like this, you can override one or more safety rules to change a routing control state and fail over your application.
     
      The [SafetyRulesToOverride] property enables you override one or more safety rules and update routing control states. For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html}Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery Controller Developer Guide.
      
       {i You must specify Regional endpoints when you work with API cluster operations to get or update routing control states in Route 53 ARC.}
       
        To see a code example for getting a routing control state, including accessing Regional cluster endpoints in sequence, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/service_code_examples_actions.html}API examples} in the Amazon Route 53 Application Recovery Controller Developer Guide.
        
         {ul
              {- {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.html}Viewing and updating routing control states}
                 
                 }
               {- {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.html}Working with routing controls overall}
                  
                  }
              
      }
       |}]

  
end

