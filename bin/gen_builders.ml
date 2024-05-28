open Parselib

let generate ~name ~(service : Ast.Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes
    fmt =
  Codegen.Builders.generate ~name ~structure_shapes fmt

let generate_mli ~name ~service ~operation_shapes ~structure_shapes ?(no_open = false) fmt =
  if not no_open then Fmt.pf fmt "open Types@\n";
  Codegen.Builders.generate_interfaces ~name ~structure_shapes fmt
