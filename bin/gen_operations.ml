open Parselib
open Ast

let generate ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes ~alias_context oc =
  if
    Trait.hasTrait service.traits (function
      | Trait.AwsProtocolAwsJson1_1Trait -> true
      | Trait.AwsProtocolAwsJson1_0Trait -> true
      | _ -> false)
  then Codegen.AwsProtocolJson.Operations.generate ~name ~operation_shapes ~alias_context oc

let generate_mli ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes ~alias_context
    ?(no_open = false) oc =
  if
    Trait.hasTrait service.traits (function
      | Trait.AwsProtocolAwsJson1_1Trait -> true
      | Trait.AwsProtocolAwsJson1_0Trait -> true
      | _ -> false)
  then Codegen.AwsProtocolJson.Operations.generate_mli ~name ~operation_shapes ~alias_context ~no_open oc
