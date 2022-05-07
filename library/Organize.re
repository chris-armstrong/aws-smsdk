open Base;
open Shape;
open Dependencies;

type operationTriple = (string, Shape.operationShapeDetails, list(string));

let shapesWithTargets = shapes =>
  List.map(shapes, ~f=(Shape.{name, descriptor}) =>
    Dependencies.{
      name,
      descriptor,
      targets: Dependencies.getTargets(descriptor),
      recursWith: None,
    }
  );

let partitionOperationShapes = shapesWithTargets =>
  List.partition_map(shapesWithTargets, ~f=({descriptor, name, targets, _}) =>
    switch (descriptor) {
    | OperationShape(x) => Base.Either.First((name, x, targets))
    | other => Base.Either.Second(other)
    }
  );

let operationDependencies = (operationDetailsList: list(operationTriple)) =>
  operationDetailsList
  |> List.map(~f=((_, _, targets)) => targets)
  |> List.concat;

/*
 * Given a list of structure shapes, split into a list that appear
 * in allDependencies and the remaining structures
 */
let partitionDependentStructures = (allStructures, allDependencies) => {
  allStructures
  |> List.partition_tf(
       ~f=
         fun
         | Shape.{name, descriptor: StructureShape(_)} =>
           List.exists(allDependencies, ~f=dependency =>
             String.equal(name, dependency)
           )
         | _ => false,
     );
};
