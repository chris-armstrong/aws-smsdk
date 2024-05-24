open Parselib
open Ast

let generate ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes oc =
  if
    Trait.hasTrait service.traits (function
      | Trait.AwsProtocolAwsJson1_1Trait -> true
      | Trait.AwsProtocolAwsJson1_0Trait -> true
      | _ -> false)
  then Codegen.AwsProtocolJson.Operations.generate ~name ~operation_shapes oc
