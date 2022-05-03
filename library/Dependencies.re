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
  {name: "smithy.api#Long", descriptor: LongShape({traits: None}), targets: [], recursWith: None},
];

/**
 * Get the targets for each shape type
 */
let getTargets = descriptor =>
  switch descriptor {
  | ListShape(listShapeDetails) => [listShapeDetails.target]
  | OperationShape(details) =>
    List.concat([
      Option.value(Option.map( details.input, ~f=extracted => [extracted]), ~default=[]),
      Option.value(Option.map(details.output, ~f=extracted => [extracted]), ~default=[]),
      Option.value(Option.map(details.errors, ~f=extracted => extracted), ~default=[]),
    ])
  | StructureShape({members, _ }) => List.map(members, ~f=member => member.target)
  | ServiceShape({operations, _ }) => Option.value(operations, ~default=[])
  | MapShape({mapKey, mapValue, _}) => [mapKey.target, mapValue.target]
  | BlobShape(_) => []
  | BooleanShape(_) => []
  | IntegerShape(_) => []
  | StringShape(_) => []
  | ResourceShape => []
  | TimestampShape(_) => []
  | UnionShape({members, _}) => List.map(members, ~f=member => member.target)
  | LongShape(_) => []
  | DoubleShape(_) => []
  | SetShape({target, _}) => [target]
  | FloatShape(_) => []
  };

let getShapeTargets = shapes =>
  List.map(shapes, ~f=(shape: Shape.t) => (shape, getTargets(shape.descriptor)));

exception CycleError(list(string), list(string));

let containsAll = (within, targets) => {
  if (List.length(targets) == 0) {
    true
  } else {
    List.for_all(~f=target =>
      List.exists(~f=item => {
        String.equal(item.name , target )||
          Option.value_map(item.recursWith, ~default=false, ~f=recursiveItems =>
            List.exists(recursiveItems, ~f=recursiveItem => String.equal(recursiveItem.name , target))
          )
      }, within), targets
    )
  }
};

let hasTarget = (target, candidates) =>
  List.exists(~f=candidate =>
    List.exists(~f=candidateTarget => String.equal(candidateTarget , target), candidate.targets),
  candidates);

let filterOut = (l: list(shapeWithTarget), x: shapeWithTarget) => List.filter(l, ~f=i => equal_shapeWithTarget(i, x));
let getShapeWithTargetNames = s => List.map(s, ~f=({name, _}) => name);

type cycleType = list(shapeWithTarget);

let rec findCycle = (chain: list(shapeWithTarget), remaining: list(shapeWithTarget)): option<
  list(cycleType),
> => {
  let first = List.hd(chain)
  switch (first) {
  | Some(last) => {
      let targetsInChain = List.filter_map(last.targets, ~f=target => {
        let tail = List.drop_while(chain, ~f=(shape => !String.equal(shape.name, target)));
        List.is_empty(tail) ? None : Some(tail);
      });
      if (!List.is_empty(targetsInChain)) {
        // we've found recursion - return the chains
        Some(targetsInChain);
      } else {
        // follow chain targets in remaining
        let follow = List.filter(remaining, ~f=shape =>
          List.exists(last.targets, ~f=target => String.equal(shape.name, target))
        );
        // Js.log3("following targets", last.name, getShapeWithTargetNames(follow))
        let cycles = List.filter_map(follow, ~f=shape => {
          let chain = List.concat([chain, [shape]])
          let remaining = filterOut(remaining, shape)
          findCycle(chain, remaining)
        });
        !List.is_empty(cycles) ? Some(List.concat(cycles)) : None
      }
    }
  | None => None
  }
};

let findCycles = shapes => {
  // trace a path from each shape that goes through the remaining shapes back to itself
  shapes
  |>List.filter_map(~f=shape => {
    let otherShapes = filterOut(shapes, shape)
    findCycle([shape], otherShapes)
  })
  |>List.concat
};

// let isSubsetOf = (target, test) => {
//   let targetSet = Set.fromList(target, ~id = module(ShapeWithTargetComparator))
//   let testSet = Set.fromArray(test, ~id=module(ShapeWithTargetComparator))
//   let diff = Set.diff(testSet, targetSet)
//   Set.isEmpty(diff)
// };

let rec order_ = (remaining: list(shapeWithTarget), ordered: list(shapeWithTarget)): list(
  shapeWithTarget,
) => {
  if (!List.is_empty(remaining)) {
    let (free, unfree) = List.partition_tf(remaining, ~f=({targets, _}) => containsAll(ordered, targets))
    if (List.is_empty(free)) {
      let cycles = findCycles(unfree)
      if (List.is_empty(cycles)) {
        raise(CycleError(getShapeWithTargetNames(free), getShapeWithTargetNames(unfree)))
      }
      // 1. Create recursive object
      let recursive =
        cycles
        |>List.concat
        |>List.fold(~init=[], ~f=(acc, x) => List.exists(acc, ~f=y => equal_shapeWithTarget(x, y)) ? acc : List.concat([acc, [x]]));
      let firstItem = List.hd(recursive);
      let recursiveItem = Option.value_map(firstItem, ~default=[], ~f=item => [
        {...item, recursWith: List.tl(recursive)},
      ])

      // 2. Filter out all recursive from unfree
      let unfree = List.filter(unfree, ~f=unfreeItem =>
        !List.exists(recursive, ~f=recursiveItem => equal_shapeWithTarget(recursiveItem, unfreeItem))
      )

      // 3. Add recursive object to ordered
      let ordered = List.concat([ordered, free, recursiveItem])

      // 4. Iterate on new free
      order_(unfree, ordered)
    } else {
      let ordered = List.concat([ordered, free])
      order_(unfree, ordered)
    }
  } else {
    ordered
  }
}
let order = shapesWithTargets => {
  order_(shapesWithTargets, smithyImplicitShapes)
}