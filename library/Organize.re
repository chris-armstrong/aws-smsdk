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

type shapesWithTargetsByCodegenType = {
  operationShapes: list((string, operationShapeDetails, list(string))),
  exceptionShapes: list((string, structureShapeDetails, list(string))),
  unionShapes: list((string, structureShapeDetails, list(string))),
  structureShapes: list((string, structureShapeDetails, list(string))),
  basicShapes: list((string, shapeDescriptor, list(string))),
};

let partitionShapesWithTargetsByCodegenType = shapesWithTargets => {
  let operationShapes = ref([]);
  let exceptionShapes = ref([]);
  let unionShapes = ref([]);
  let structureShapes = ref([]);
  let basicShapes = ref([]);
  shapesWithTargets
  |> List.iter(~f=({descriptor, name, targets, _} as x) => {
       switch (descriptor) {
       | UnionShape(x) =>
         unionShapes := [(name, x, targets), ...unionShapes^]

       | StructureShape(x) when Trait.hasTrait(x.traits, Trait.isErrorTrait) =>
         exceptionShapes := [(name, x, targets), ...exceptionShapes^]
       | StructureShape(x) =>
         structureShapes := [(name, x, targets), ...structureShapes^]
       | OperationShape(x) =>
         operationShapes := [(name, x, targets), ...operationShapes^]
       | _ => basicShapes := [(name, descriptor, targets), ...basicShapes^]
       }
     });
  {
    operationShapes: operationShapes^,
    exceptionShapes: exceptionShapes^,
    unionShapes: unionShapes^,
    structureShapes: structureShapes^,
    basicShapes: basicShapes^,
  };
};

let partitionOperationShapes = shapesWithTargets =>
  List.partition_map(
    shapesWithTargets, ~f=({descriptor, name, targets, recursWith}) =>
    switch (descriptor) {
    | OperationShape(x) => Base.Either.First((name, x, targets))
    | _ => Base.Either.Second({name, descriptor, targets, recursWith})
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
