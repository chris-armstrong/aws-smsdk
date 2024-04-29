open Parselib

let generate ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes oc =
  if
    Trait.hasTrait service.traits (function
      | Trait.AwsProtocolAwsJson1_1Trait -> true
      | Trait.AwsProtocolAwsJson1_0Trait -> true
      | _ -> false)
  then AwsProtocolJson.generateSerialisers ~structure_shapes oc
(* Fmt.pf fmt "module Client = {@;<0 2>@[<v>"; *)
(* generateClientType ~name oc; *)
(* AwsProtocolJson.generateOperations fmt name ordered; *)
(* Fmt.pf fmt "@]@\n}@\n"; *)
(* Fmt.pf fmt "@\n@\n"); *)
