(** 
    Route53 Recovery Cluster client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(** 
    Reason the request failed validation *)
type validation_exception_reason = | OTHER
  | FIELD_VALIDATION_FAILED
  | CANNOT_PARSE
  | UNKNOWN_OPERATION

(** 
    There was a validation error on the request.
     *)
type validation_exception_field = {
  message: string;
  (** 
    Information about the validation exception.
     *)

  name: string;
  (** 
    The field that had the validation exception.
     *)

}

(** 
    There was a validation error on the request.
     *)
type validation_exception = {
  fields: validation_exception_field list option;
  
  reason: validation_exception_reason option;
  
  message: string;
  
}

type update_routing_control_states_response = unit

type routing_control_state = | Off
  | On

(** 
    A routing control state entry.
     *)
type update_routing_control_state_entry = {
  routing_control_state: routing_control_state;
  (** 
    The routing control state in a set of routing control state entries.
     *)

  routing_control_arn: string;
  (** 
    The Amazon Resource Name (ARN) for a routing control state entry.
     *)

}

type update_routing_control_states_request = {
  safety_rules_to_override: string list option;
  (** 
    The Amazon Resource Names (ARNs) for the safety rules that you want to override when you're updating routing control states. You can override one safety rule or multiple safety rules by including one or more ARNs, separated by commas.
    
     For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html}Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery Controller Developer Guide.
      *)

  update_routing_control_state_entries: update_routing_control_state_entry list;
  (** 
    A set of routing control entries that you want to update.
     *)

}

(** 
    The request was denied because of request throttling.
     *)
type throttling_exception = {
  retry_after_seconds: int option;
  
  message: string;
  
}

(** 
    The request can't update that many routing control states at the same time. Try again with fewer routing control states.
     *)
type service_limit_exceeded_exception = {
  service_code: string;
  (** 
    The service code of the limit that was exceeded.
     *)

  limit_code: string;
  (** 
    The code of the limit that was exceeded.
     *)

  resource_type: string option;
  (** 
    The resource type of the limit that was exceeded.
     *)

  resource_id: string option;
  (** 
    The resource identifier of the limit that was exceeded.
     *)

  message: string;
  
}

(** 
    The request references a routing control or control panel that was not found.
     *)
type resource_not_found_exception = {
  resource_type: string;
  (** 
    Hypothetical resource type that was not found *)

  resource_id: string;
  (** 
    Hypothetical resource identifier that was not found *)

  message: string;
  
}

(** 
    There was an unexpected error during processing of the request.
     *)
type internal_server_exception = {
  retry_after_seconds: int option;
  
  message: string;
  
}

(** 
    The cluster endpoint isn't available. Try another cluster endpoint.
     *)
type endpoint_temporarily_unavailable_exception = {
  message: string;
  
}

(** 
    There was a conflict with this request. Try again.
     *)
type conflict_exception = {
  resource_type: string;
  (** 
    Type of the resource in use *)

  resource_id: string;
  (** 
    Identifier of the resource in use *)

  message: string;
  (** 
    Description of the ConflictException error *)

}

(** 
    You don't have sufficient permissions to perform this action.
     *)
type access_denied_exception = {
  message: string;
  
}

type update_routing_control_state_response = unit

type update_routing_control_state_request = {
  safety_rules_to_override: string list option;
  (** 
    The Amazon Resource Names (ARNs) for the safety rules that you want to override when you're updating the state of a routing control. You can override one safety rule or multiple safety rules by including one or more ARNs, separated by commas.
    
     For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.override-safety-rule.html}Override safety rules to reroute traffic} in the Amazon Route 53 Application Recovery Controller Developer Guide.
      *)

  routing_control_state: routing_control_state;
  (** 
    The state of the routing control. You can set the value to ON or OFF.
     *)

  routing_control_arn: string;
  (** 
    The Amazon Resource Name (ARN) for the routing control that you want to update the state for.
     *)

}

(** 
    A routing control, which is a simple on/off switch that you can use to route traffic to cells. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow.
     *)
type routing_control = {
  owner: string option;
  (** 
    The Amazon Web Services account ID of the routing control owner.
     *)

  routing_control_state: routing_control_state option;
  (** 
    The current state of the routing control. When a routing control state is set to ON, traffic flows to a cell. When the state is set to OFF, traffic does not flow.
     *)

  routing_control_name: string option;
  (** 
    The name of the routing control.
     *)

  routing_control_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the routing control.
     *)

  control_panel_name: string option;
  (** 
    The name of the control panel where the routing control is located. Only ASCII characters are supported for control panel names.
     *)

  control_panel_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the control panel where the routing control is located.
     *)

}

type list_routing_controls_response = {
  next_token: string option;
  (** 
    The token for the next set of results. You receive this token from a previous call.
     *)

  routing_controls: routing_control list;
  (** 
    The list of routing controls.
     *)

}

type list_routing_controls_request = {
  max_results: int option;
  (** 
    The number of routing controls objects that you want to return with this call. The default value is 500.
     *)

  next_token: string option;
  (** 
    The token for the next set of results. You receive this token from a previous call.
     *)

  control_panel_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the control panel of the routing controls to list.
     *)

}

type get_routing_control_state_response = {
  routing_control_name: string option;
  (** 
    The routing control name.
     *)

  routing_control_state: routing_control_state;
  (** 
    The state of the routing control.
     *)

  routing_control_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the response.
     *)

}

type get_routing_control_state_request = {
  routing_control_arn: string;
  (** 
    The Amazon Resource Name (ARN) for the routing control that you want to get the state for.
     *)

}

(** 
    Welcome to the Routing Control (Recovery Cluster) API Reference Guide for Amazon Route 53 Application Recovery Controller.
    
     With Route 53 ARC, you can use routing control with extreme reliability to recover applications by rerouting traffic across Availability Zones or Amazon Web Services Regions. Routing controls are simple on/off switches hosted on a highly available cluster in Route 53 ARC. A cluster provides a set of five redundant Regional endpoints against which you can run API calls to get or update the state of routing controls. To implement failover, you set one routing control to ON and another one to OFF, to reroute traffic from one Availability Zone or Amazon Web Services Region to another.
     
      {i Be aware that you must specify a Regional endpoint for a cluster when you work with API cluster operations to get or update routing control states in Route 53 ARC.} In addition, you must specify the US West (Oregon) Region for Route 53 ARC API calls. For example, use the parameter [--region us-west-2] with AWS CLI commands. For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/routing-control.update.api.html}Get and update routing control states using the API} in the Amazon Route 53 Application Recovery Controller Developer Guide.
      
       This API guide includes information about the API operations for how to get and update routing control states in Route 53 ARC. To work with routing control in Route 53 ARC, you must first create the required components (clusters, control panels, and routing controls) using the recovery cluster configuration API.
       
        For more information about working with routing control in Route 53 ARC, see the following:
        
         {ul
              {- Create clusters, control panels, and routing controls by using API operations. For more information, see the {{:https://docs.aws.amazon.com/recovery-cluster/latest/api/}Recovery Control Configuration API Reference Guide for Amazon Route 53 Application Recovery Controller}.
                 
                 }
               {- Learn about the components in recovery control, including clusters, routing controls, and control panels, and how to work with Route 53 ARC in the Amazon Web Services console. For more information, see {{:https://docs.aws.amazon.com/r53recovery/latest/dg/introduction-components.html#introduction-components-routing}Recovery control components} in the Amazon Route 53 Application Recovery Controller Developer Guide.
                  
                  }
               {- Route 53 ARC also provides readiness checks that continually audit resources to help make sure that your applications are scaled and ready to handle failover traffic. For more information about the related API operations, see the {{:https://docs.aws.amazon.com/recovery-readiness/latest/api/}Recovery Readiness API Reference Guide for Amazon Route 53 Application Recovery Controller}.
                  
                  }
               {- For more information about creating resilient applications and preparing for recovery readiness with Route 53 ARC, see the {{:https://docs.aws.amazon.com/r53recovery/latest/dg/}Amazon Route 53 Application Recovery Controller Developer Guide}.
                  
                  }
              
      }
       *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_validation_exception_field : message:string -> name:string -> unit
-> validation_exception_field
(** Create a {!type-validation_exception_field} type *)

val make_update_routing_control_states_response : unit
-> update_routing_control_states_response
(** Create a {!type-update_routing_control_states_response} type *)

val make_update_routing_control_state_entry :
  routing_control_state:routing_control_state ->
  routing_control_arn:string ->
  unit
-> update_routing_control_state_entry
(** Create a {!type-update_routing_control_state_entry} type *)

val make_update_routing_control_states_request :
  ?safety_rules_to_override:string list ->
  update_routing_control_state_entries:update_routing_control_state_entry list ->
  unit
-> update_routing_control_states_request
(** Create a {!type-update_routing_control_states_request} type *)

val make_update_routing_control_state_response : unit
-> update_routing_control_state_response
(** Create a {!type-update_routing_control_state_response} type *)

val make_update_routing_control_state_request :
  ?safety_rules_to_override:string list ->
  routing_control_state:routing_control_state ->
  routing_control_arn:string ->
  unit
-> update_routing_control_state_request
(** Create a {!type-update_routing_control_state_request} type *)

val make_routing_control :
  ?owner:string ->
  ?routing_control_state:routing_control_state ->
  ?routing_control_name:string ->
  ?routing_control_arn:string ->
  ?control_panel_name:string ->
  ?control_panel_arn:string ->
  unit
-> routing_control
(** Create a {!type-routing_control} type *)

val make_list_routing_controls_response :
  ?next_token:string -> routing_controls:routing_control list -> unit
-> list_routing_controls_response
(** Create a {!type-list_routing_controls_response} type *)

val make_list_routing_controls_request :
  ?max_results:int -> ?next_token:string -> ?control_panel_arn:string -> unit
-> list_routing_controls_request
(** Create a {!type-list_routing_controls_request} type *)

val make_get_routing_control_state_response :
  ?routing_control_name:string ->
  routing_control_state:routing_control_state ->
  routing_control_arn:string ->
  unit
-> get_routing_control_state_response
(** Create a {!type-get_routing_control_state_response} type *)

val make_get_routing_control_state_request :
  routing_control_arn:string -> unit
-> get_routing_control_state_request
(** Create a {!type-get_routing_control_state_request} type *)

(** {1:operations Operations} *)

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

