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
  operationShapes: list((string, shapeDescriptor, list(string))),
  exceptionShapes: list((string, shapeDescriptor, list(string))),
  unionShapes: list((string, shapeDescriptor, list(string))),
  structureShapes: list((string, shapeDescriptor, list(string))),
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
         unionShapes := [(name, descriptor, targets), ...unionShapes^]

       | StructureShape(x) when Trait.hasTrait(x.traits, Trait.isErrorTrait) =>
         exceptionShapes :=
           [(name, descriptor, targets), ...exceptionShapes^]
       | StructureShape(x) =>
         structureShapes :=
           [(name, descriptor, targets), ...structureShapes^]
       | OperationShape(x) =>
         operationShapes :=
           [(name, descriptor, targets), ...operationShapes^]
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

let partitionOperationShapes = shapesWithTargets => {
  let (service, remaining) =
    List.partition_map(
      shapesWithTargets, ~f=({descriptor, name, targets, recursWith}) => {
      switch (descriptor) {
      | ServiceShape(x) => Base.Either.First((name, x))
      | _ => Base.Either.Second({name, descriptor, targets, recursWith})
      }
    });
  let (operations, structured) =
    List.partition_map(
      shapesWithTargets, ~f=({descriptor, name, targets, recursWith}) =>
      switch (descriptor) {
      | OperationShape(x) => Base.Either.First((name, x, targets))
      | _ => Base.Either.Second({name, descriptor, targets, recursWith})
      }
    );
  (List.hd_exn(service), operations, structured);
};

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
