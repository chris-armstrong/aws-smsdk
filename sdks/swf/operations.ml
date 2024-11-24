open Types 
let (let+) res map = Result.map map res
module CountClosedWorkflowExecutions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: count_closed_workflow_executions_input) ->
    let input = Serializers.count_closed_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.CountClosedWorkflowExecutions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.workflow_execution_count_of_yojson
      ~error_deserializer
      
end

module CountOpenWorkflowExecutions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: count_open_workflow_executions_input) ->
    let input = Serializers.count_open_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.CountOpenWorkflowExecutions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.workflow_execution_count_of_yojson
      ~error_deserializer
      
end

module CountPendingActivityTasks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: count_pending_activity_tasks_input) ->
    let input = Serializers.count_pending_activity_tasks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.CountPendingActivityTasks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.pending_task_count_of_yojson
      ~error_deserializer
      
end

module CountPendingDecisionTasks = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: count_pending_decision_tasks_input) ->
    let input = Serializers.count_pending_decision_tasks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.CountPendingDecisionTasks" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.pending_task_count_of_yojson
      ~error_deserializer
      
end

module DeleteActivityType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TypeNotDeprecatedFault" ->
         (`TypeNotDeprecatedFault (type_not_deprecated_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_activity_type_input) ->
    let input = Serializers.delete_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.DeleteActivityType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeleteWorkflowType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TypeNotDeprecatedFault" ->
         (`TypeNotDeprecatedFault (type_not_deprecated_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: delete_workflow_type_input) ->
    let input = Serializers.delete_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.DeleteWorkflowType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeprecateActivityType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TypeDeprecatedFault" ->
         (`TypeDeprecatedFault (type_deprecated_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deprecate_activity_type_input) ->
    let input = Serializers.deprecate_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.DeprecateActivityType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeprecateDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "DomainDeprecatedFault" ->
         (`DomainDeprecatedFault (domain_deprecated_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deprecate_domain_input) ->
    let input = Serializers.deprecate_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.DeprecateDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DeprecateWorkflowType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TypeDeprecatedFault" ->
         (`TypeDeprecatedFault (type_deprecated_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: deprecate_workflow_type_input) ->
    let input = Serializers.deprecate_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.DeprecateWorkflowType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module DescribeActivityType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_activity_type_input) ->
    let input = Serializers.describe_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.DescribeActivityType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.activity_type_detail_of_yojson
      ~error_deserializer
      
end

module DescribeDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_domain_input) ->
    let input = Serializers.describe_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.DescribeDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.domain_detail_of_yojson
      ~error_deserializer
      
end

module DescribeWorkflowExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_workflow_execution_input) ->
    let input = Serializers.describe_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.DescribeWorkflowExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.workflow_execution_detail_of_yojson
      ~error_deserializer
      
end

module DescribeWorkflowType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: describe_workflow_type_input) ->
    let input = Serializers.describe_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.DescribeWorkflowType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.workflow_type_detail_of_yojson
      ~error_deserializer
      
end

module GetWorkflowExecutionHistory = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: get_workflow_execution_history_input) ->
    let input = Serializers.get_workflow_execution_history_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.GetWorkflowExecutionHistory" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.history_of_yojson
      ~error_deserializer
      
end

module ListActivityTypes = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_activity_types_input) ->
    let input = Serializers.list_activity_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.ListActivityTypes" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.activity_type_infos_of_yojson
      ~error_deserializer
      
end

module ListClosedWorkflowExecutions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_closed_workflow_executions_input) ->
    let input = Serializers.list_closed_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.ListClosedWorkflowExecutions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.workflow_execution_infos_of_yojson
      ~error_deserializer
      
end

module ListDomains = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_domains_input) ->
    let input = Serializers.list_domains_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.ListDomains" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.domain_infos_of_yojson
      ~error_deserializer
      
end

module ListOpenWorkflowExecutions = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_open_workflow_executions_input) ->
    let input = Serializers.list_open_workflow_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.ListOpenWorkflowExecutions" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.workflow_execution_infos_of_yojson
      ~error_deserializer
      
end

module ListTagsForResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "LimitExceededFault" ->
         (`LimitExceededFault (limit_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_tags_for_resource_input) ->
    let input = Serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.ListTagsForResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
      
end

module ListWorkflowTypes = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: list_workflow_types_input) ->
    let input = Serializers.list_workflow_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.ListWorkflowTypes" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.workflow_type_infos_of_yojson
      ~error_deserializer
      
end

module PollForActivityTask = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "LimitExceededFault" ->
         (`LimitExceededFault (limit_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: poll_for_activity_task_input) ->
    let input = Serializers.poll_for_activity_task_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.PollForActivityTask" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.activity_task_of_yojson
      ~error_deserializer
      
end

module PollForDecisionTask = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "LimitExceededFault" ->
         (`LimitExceededFault (limit_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: poll_for_decision_task_input) ->
    let input = Serializers.poll_for_decision_task_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.PollForDecisionTask" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.decision_task_of_yojson
      ~error_deserializer
      
end

module RecordActivityTaskHeartbeat = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: record_activity_task_heartbeat_input) ->
    let input = Serializers.record_activity_task_heartbeat_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.RecordActivityTaskHeartbeat" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.activity_task_status_of_yojson
      ~error_deserializer
      
end

module RegisterActivityType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "LimitExceededFault" ->
         (`LimitExceededFault (limit_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TypeAlreadyExistsFault" ->
         (`TypeAlreadyExistsFault (type_already_exists_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_activity_type_input) ->
    let input = Serializers.register_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.RegisterActivityType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RegisterDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "DomainAlreadyExistsFault" ->
         (`DomainAlreadyExistsFault (domain_already_exists_fault_of_yojson tree path))
      | "com.amazonaws.swf", "LimitExceededFault" ->
         (`LimitExceededFault (limit_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TooManyTagsFault" ->
         (`TooManyTagsFault (too_many_tags_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_domain_input) ->
    let input = Serializers.register_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.RegisterDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RegisterWorkflowType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "LimitExceededFault" ->
         (`LimitExceededFault (limit_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TypeAlreadyExistsFault" ->
         (`TypeAlreadyExistsFault (type_already_exists_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: register_workflow_type_input) ->
    let input = Serializers.register_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.RegisterWorkflowType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RequestCancelWorkflowExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: request_cancel_workflow_execution_input) ->
    let input = Serializers.request_cancel_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.RequestCancelWorkflowExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RespondActivityTaskCanceled = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: respond_activity_task_canceled_input) ->
    let input = Serializers.respond_activity_task_canceled_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.RespondActivityTaskCanceled" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RespondActivityTaskCompleted = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: respond_activity_task_completed_input) ->
    let input = Serializers.respond_activity_task_completed_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.RespondActivityTaskCompleted" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RespondActivityTaskFailed = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: respond_activity_task_failed_input) ->
    let input = Serializers.respond_activity_task_failed_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.RespondActivityTaskFailed" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module RespondDecisionTaskCompleted = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: respond_decision_task_completed_input) ->
    let input = Serializers.respond_decision_task_completed_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.RespondDecisionTaskCompleted" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module SignalWorkflowExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: signal_workflow_execution_input) ->
    let input = Serializers.signal_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.SignalWorkflowExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module StartWorkflowExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "DefaultUndefinedFault" ->
         (`DefaultUndefinedFault (default_undefined_fault_of_yojson tree path))
      | "com.amazonaws.swf", "LimitExceededFault" ->
         (`LimitExceededFault (limit_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TypeDeprecatedFault" ->
         (`TypeDeprecatedFault (type_deprecated_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | "com.amazonaws.swf", "WorkflowExecutionAlreadyStartedFault" ->
         (`WorkflowExecutionAlreadyStartedFault (workflow_execution_already_started_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: start_workflow_execution_input) ->
    let input = Serializers.start_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.StartWorkflowExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.run_of_yojson
      ~error_deserializer
      
end

module TagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "LimitExceededFault" ->
         (`LimitExceededFault (limit_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TooManyTagsFault" ->
         (`TooManyTagsFault (too_many_tags_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: tag_resource_input) ->
    let input = Serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.TagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module TerminateWorkflowExecution = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: terminate_workflow_execution_input) ->
    let input = Serializers.terminate_workflow_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.TerminateWorkflowExecution" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UndeprecateActivityType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TypeAlreadyExistsFault" ->
         (`TypeAlreadyExistsFault (type_already_exists_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: undeprecate_activity_type_input) ->
    let input = Serializers.undeprecate_activity_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.UndeprecateActivityType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UndeprecateDomain = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "DomainAlreadyExistsFault" ->
         (`DomainAlreadyExistsFault (domain_already_exists_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: undeprecate_domain_input) ->
    let input = Serializers.undeprecate_domain_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.UndeprecateDomain" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UndeprecateWorkflowType = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "TypeAlreadyExistsFault" ->
         (`TypeAlreadyExistsFault (type_already_exists_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: undeprecate_workflow_type_input) ->
    let input = Serializers.undeprecate_workflow_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.UndeprecateWorkflowType" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

module UntagResource = struct
  let error_deserializer tree path = 
    let open Deserializers in
    let handler = fun handler tree path -> function
      | "com.amazonaws.swf", "LimitExceededFault" ->
         (`LimitExceededFault (limit_exceeded_fault_of_yojson tree path))
      | "com.amazonaws.swf", "OperationNotPermittedFault" ->
         (`OperationNotPermittedFault (operation_not_permitted_fault_of_yojson tree path))
      | "com.amazonaws.swf", "UnknownResourceFault" ->
         (`UnknownResourceFault (unknown_resource_fault_of_yojson tree path))
      | _type -> handler tree path _type
      
    in
    Smaws_Lib.Protocols.AwsJson.(error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)
    
  let request = fun context (request: untag_resource_input) ->
    let input = Serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request 
      ~shape_name:"SimpleWorkflowService.UntagResource" 
      ~service 
      ~config:Smaws_Lib.Context.(context.config) 
      ~http:Smaws_Lib.Context.(context.http) 
      ~input
      ~output_deserializer:Deserializers.base_unit_of_yojson
      ~error_deserializer
      
end

