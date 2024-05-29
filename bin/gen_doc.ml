open Parselib.Ast.Shape
open Parselib.Ast.Trait

let module_doc ~name ~(service : serviceShapeDetails) ~operation_shapes ~structure_shapes o =
  let serviceShapeDetails = extractServiceTrait service.traits in
  Fmt.pf o "(**@;<1 2>@[<v>@;";
  Fmt.pf o "%s client library built on EIO.@;" serviceShapeDetails.sdkId;
  Fmt.pf o "@]@;*)@\n@\n"
