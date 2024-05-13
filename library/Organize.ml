open Base
open Shape
open Dependencies

type operationTriple = string * Shape.operationShapeDetails * string list

let shapesWithTargets shapes =
  List.map shapes ~f:(fun Shape.{ name; descriptor } ->
      let open Dependencies in
      { name; descriptor; targets = Dependencies.getTargets descriptor; recursWith = None })

(* type shapesWithTargetsByCodegenType = *)
(*   { *)
(*   operationShapes: (string * shapeDescriptor * string list) list ; *)
(*   exceptionShapes: (string * shapeDescriptor * string list) list ; *)
(*   unionShapes: (string * shapeDescriptor * string list) list ; *)
(*   structureShapes: (string * shapeDescriptor * string list) list ; *)
(*   basicShapes: (string * shapeDescriptor * string list) list } *)
(* let partitionShapesWithTargetsByCodegenType shapesWithTargets = *)
(*   let operationShapes = ref [] in *)
(*   let exceptionShapes = ref [] in *)
(*   let unionShapes = ref [] in *)
(*   let structureShapes = ref [] in *)
(*   let basicShapes = ref [] in *)
(*   shapesWithTargets |> *)
(*     (List.iter *)
(*        ~f:(fun ({ descriptor; name; targets;_} as x) -> *)
(*              match descriptor with *)
(*              | ((UnionShape (x))[@explicit_arity ]) -> *)
(*                  unionShapes := ((name, descriptor, targets) :: *)
(*                    (!unionShapes)) *)
(*              | ((StructureShape (x))[@explicit_arity ]) when *)
(*                  Trait.hasTrait x.traits Trait.isErrorTrait -> *)
(*                  exceptionShapes := ((name, descriptor, targets) :: *)
(*                    (!exceptionShapes)) *)
(*              | ((StructureShape (x))[@explicit_arity ]) -> *)
(*                  structureShapes := ((name, descriptor, targets) :: *)
(*                    (!structureShapes)) *)
(*              | ((OperationShape (x))[@explicit_arity ]) -> *)
(*                  operationShapes := ((name, descriptor, targets) :: *)
(*                    (!operationShapes)) *)
(*              | _ -> *)
(*                  basicShapes := ((name, descriptor, targets) :: *)
(*                    (!basicShapes)))); *)
(*   { *)
(*     operationShapes = (!operationShapes); *)
(*     exceptionShapes = (!exceptionShapes); *)
(*     unionShapes = (!unionShapes); *)
(*     structureShapes = (!structureShapes); *)
(*     basicShapes = (!basicShapes) *)
(*   } *)
let partitionOperationShapes shapesWithTargets =
  let service, remaining =
    List.partition_map shapesWithTargets ~f:(fun { descriptor; name; targets; recursWith } ->
        match descriptor with
        | ((ServiceShape x) [@explicit_arity]) -> Base.Either.First (name, x)
        | _ -> Base.Either.Second { name; descriptor; targets; recursWith } [@explicit_arity])
  in
  let operations, structured =
    List.partition_map shapesWithTargets ~f:(fun { descriptor; name; targets; recursWith } ->
        match descriptor with
        | ((OperationShape x) [@explicit_arity]) -> Base.Either.First (name, x, targets)
        | _ -> Base.Either.Second { name; descriptor; targets; recursWith } [@explicit_arity])
  in
  (List.hd_exn service, operations, structured)

let operationDependencies (operationDetailsList : operationTriple list) =
  operationDetailsList |> List.map ~f:(fun (_, _, targets) -> targets) |> List.concat

let partitionDependentStructures allStructures allDependencies =
  allStructures
  |> List.partition_tf ~f:(function
       | Shape.{ name; descriptor = StructureShape _ } ->
           List.exists allDependencies ~f:(fun dependency -> String.equal name dependency)
       | _ -> false)
