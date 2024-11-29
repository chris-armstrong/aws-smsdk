open Base
open Shape
open Dependencies

type operationTriple = string * operationShapeDetails * string list

let shapesWithTargets shapes =
  List.map shapes ~f:(fun Shape.{ name; descriptor } ->
      let open Dependencies in
      { name; descriptor; targets = Dependencies.getTargets descriptor; recursWith = None })

let partitionOperationShapes shapesWithTargets =
  let service, remaining =
    List.partition_map shapesWithTargets ~f:(fun { descriptor; name; targets; recursWith } ->
        match descriptor with
        | ServiceShape x -> Base.Either.First (name, x)
        | _ -> Base.Either.Second { name; descriptor; targets; recursWith })
  in
  let operations, structured =
    List.partition_map shapesWithTargets ~f:(fun { descriptor; name; targets; recursWith } ->
        match descriptor with
        | OperationShape x -> Base.Either.First (name, x, targets)
        | _ -> Base.Either.Second { name; descriptor; targets; recursWith })
  in
  (List.hd_exn service, operations |> List.rev, structured)

let operationDependencies (operationDetailsList : operationTriple list) =
  operationDetailsList |> List.map ~f:(fun (_, _, targets) -> targets) |> List.concat

let partitionDependentStructures allStructures allDependencies =
  allStructures
  |> List.partition_tf ~f:(function
       | Shape.{ name; descriptor = StructureShape _ } ->
           List.exists allDependencies ~f:(fun dependency -> String.equal name dependency)
       | _ -> false)
