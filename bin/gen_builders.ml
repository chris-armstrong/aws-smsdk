open Parselib

let generate ~name ~(service : Ast.Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes
    fmt =
  Codegen.Builders.generate ~name ~structure_shapes fmt
