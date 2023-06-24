open Base;
open Shape;

[@deriving (show, equal)]
type shapeWithTarget = {
  name: string,
  descriptor: shapeDescriptor,
  targets: list(string),
  recursWith: option(list(shapeWithTarget)),
};

// module ShapeWithTargetComparator = Id.MakeComparable({
//   type t = shapeWithTarget;
//   let cmp = (v1, v2) => String.compare(v1.name, v2.name);
// })

let smithyImplicitShapes = [
  {
    name: "smithy.api#String",
    descriptor: StringShape({traits: None}),
    targets: [],
    recursWith: None,
  },
  {
    name: "smithy.api#Boolean",
    descriptor: BooleanShape({traits: None}),
    targets: [],
    recursWith: None,
  },
  {
    name: "smithy.api#Integer",
    descriptor: IntegerShape({traits: None}),
    targets: [],
    recursWith: None,
  },
  {
    name: "smithy.api#Timestamp",
    descriptor: TimestampShape({traits: None}),
    targets: [],
    recursWith: None,
  },
  {
    name: "smithy.api#Long",
    descriptor: LongShape({traits: None}),
    targets: [],
    recursWith: None,
  },
];

/**
 * Get the targets for each shape type
 */
let getTargets = descriptor =>
  switch (descriptor) {
  | ListShape(listShapeDetails) => [listShapeDetails.target]
  | OperationShape(details) =>
    List.concat([
      Option.value(
        Option.map(details.input, ~f=extracted => [extracted]),
        ~default=[],
      ),
      Option.value(
        Option.map(details.output, ~f=extracted => [extracted]),
        ~default=[],
      ),
      Option.value(
        Option.map(details.errors, ~f=extracted => extracted),
        ~default=[],
      ),
    ])
  | StructureShape({members, _}) =>
    List.map(members, ~f=member => member.target)
  | ServiceShape({operations, _}) => Option.value(operations, ~default=[])
  | MapShape({mapKey, mapValue, _}) => [mapKey.target, mapValue.target]
  | BlobShape(_)
  | BooleanShape(_)
  | IntegerShape(_)
  | StringShape(_)
  | ResourceShape
  | TimestampShape(_)
  | BigIntegerShape(_)
  | BigDecimalShape(_) => []
  | UnionShape({members, _}) => List.map(members, ~f=member => member.target)
  | LongShape(_) => []
  | DoubleShape(_) => []
  | SetShape({target, _}) => [target]
  | FloatShape(_) => []
  };

let getShapeTargets = shapes =>
  List.map(shapes, ~f=(shape: Shape.t) =>
    (shape, getTargets(shape.descriptor))
  );

module ShapeWithTargetGraph = {
  type t = list(shapeWithTarget);
  module V = {
    type t = shapeWithTarget;
    let compare = (x, y) => String.compare(x.name, y.name);
    let hash = x => String.hash(x.name);
    let equal = (x, y) => String.equal(x.name, y.name);
  };

  let iter_vertex = (iterator: V.t => unit, x: t) => {
    List.iter(x, ~f=iterator);
  };

  let iter_succ = (iterator, x, y) => {
    let {targets, _} = y;
    List.iter(
      targets,
      ~f=target_name => {
        let target =
          List.find_exn(x, ~f=iter_target =>
            String.equal(iter_target.name, target_name)
          );
        iterator(target);
      },
    );
  };
};

module ShapeWithTargetComponents =
  Graph.Components.Make(ShapeWithTargetGraph);

let order = shapesWithTargets => {
  let partitions =
    ShapeWithTargetComponents.scc_list(
      shapesWithTargets @ smithyImplicitShapes,
    );
  List.filter_map(partitions, ~f=partition => {
    switch (partition) {
    | [] => None
    | [a] => Some(a)
    | [a, ...x] => Some({...a, recursWith: Some(x)})
    }
  });
};
