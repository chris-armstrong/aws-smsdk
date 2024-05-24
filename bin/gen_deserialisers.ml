open Parselib

let generate ~name ~(service : Ast.Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes oc
    =
  if
    Ast.Trait.hasTrait service.traits (function
      | Ast.Trait.AwsProtocolAwsJson1_1Trait -> true
      | Ast.Trait.AwsProtocolAwsJson1_0Trait -> true
      | _ -> false)
  then Codegen.AwsProtocolJson.Deserialiser.generate ~name ~structure_shapes oc
