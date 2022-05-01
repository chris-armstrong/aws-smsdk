open Shape
open Belt

type rec shapeWithTarget = {
  name: string,
  descriptor: Shape.shapeDescriptor,
  targets: array<string>,
  recursWith: option<array<shapeWithTarget>>,
}

module ShapeWithTargetComparator = Id.MakeComparable({
  type t = shapeWithTarget
  let cmp = (v1, v2) => Pervasives.compare(v1.name, v2.name)
})

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
]

/**
 * Get the targets for each shape type
 */
let getTargets = descriptor =>
  switch descriptor {
  | ListShape(listShapeDetails) => [listShapeDetails.target]
  | OperationShape(details) =>
    Array.concatMany([
      Option.getWithDefault(Option.map(details.input, extracted => [extracted]), []),
      Option.getWithDefault(Option.map(details.output, extracted => [extracted]), []),
      Option.getWithDefault(Option.map(details.errors, extracted => extracted), []),
    ])
  | StructureShape({members}) => Js.Array2.map(members, member => member.target)
  | ServiceShape({operations}) => Belt.Option.getWithDefault(operations, [])
  | MapShape({mapKey, mapValue}) => [mapKey.target, mapValue.target]
  | BlobShape(_) => []
  | BooleanShape(_) => []
  | IntegerShape(_) => []
  | StringShape(_) => []
  | ResourceShape => []
  | TimestampShape(_) => []
  | UnionShape({members}) => Js.Array2.map(members, member => member.target)
  | LongShape(_) => []
  | DoubleShape(_) => []
  | SetShape({target}) => [target]
  | FloatShape(_) => []
  }

let getShapeTargets = shapes =>
  Array.map(shapes, (shape: Shape.t) => (shape, getTargets(shape.descriptor)))

exception CycleError(array<string>, array<string>)

let containsAll = (within, targets) => {
  if Array.length(targets) === 0 {
    true
  } else {
    Array.every(targets, target =>
      Array.some(within, item => {
        item.name == target ||
          Option.mapWithDefault(item.recursWith, false, recursiveItems =>
            Array.some(recursiveItems, recursiveItem => recursiveItem.name == target)
          )
      })
    )
  }
}

let hasTarget = (target, candidates) =>
  Array.some(candidates, candidate =>
    Array.some(candidate.targets, candidateTarget => candidateTarget == target)
  )

let filterOut = (l, x) => Array.keep(l, i => i != x)
let getShapeWithTargetNames = s => Array.map(s, ({name}) => name)

type cycleType = array<shapeWithTarget>

let rec findCycle = (chain: array<shapeWithTarget>, remaining: array<shapeWithTarget>): option<
  array<cycleType>,
> => {
  let last = chain[Array.length(chain) - 1]
  switch last {
  | Some(last) => {
      let targetsInChain = Array.keepMap(last.targets, target => {
        Array.getIndexBy(chain, shape => shape.name == target)
      })
      if Array.length(targetsInChain) > 0 {
        // we've found recursion - return the chains
        let cycles = Array.map(targetsInChain, index => {
          Array.sliceToEnd(chain, index)
        })
        // Js.log2("found cycles", cycles)
        Some(cycles)
      } else {
        // follow chain targets in remaining
        let follow = Array.keep(remaining, shape =>
          Array.some(last.targets, target => shape.name == target)
        )
        // Js.log3("following targets", last.name, getShapeWithTargetNames(follow))
        let cycles = Array.keepMap(follow, shape => {
          let chain = Array.concat(chain, [shape])
          let remaining = filterOut(remaining, shape)
          findCycle(chain, remaining)
        })
        Array.length(cycles) > 0 ? Some(Array.concatMany(cycles)) : None
      }
    }
  | None => None
  }
}

let findCycles = shapes => {
  // trace a path from each shape that goes through the remaining shapes back to itself
  shapes
  ->Array.keepMap(shape => {
    let otherShapes = filterOut(shapes, shape)
    findCycle([shape], otherShapes)
  })
  ->Array.concatMany
}

let isSubsetOf = (target, test) => {
  let targetSet = Set.fromArray(target, ~id=module(ShapeWithTargetComparator))
  let testSet = Set.fromArray(test, ~id=module(ShapeWithTargetComparator))
  let diff = Set.diff(testSet, targetSet)
  Set.isEmpty(diff)
}

let rec order_ = (remaining: array<shapeWithTarget>, ordered: array<shapeWithTarget>): array<
  shapeWithTarget,
> => {
  if Array.length(remaining) > 0 {
    let (free, unfree) = Array.partition(remaining, ({targets}) => containsAll(ordered, targets))
    if Array.length(free) === 0 {
      let cycles = findCycles(unfree)
      if Array.length(cycles) == 0 {
        raise(CycleError(getShapeWithTargetNames(free), getShapeWithTargetNames(unfree)))
      }
      // 1. Create recursive object
      let recursive =
        cycles
        ->Array.concatMany
        ->Array.reduce([], (acc, x) => Array.some(acc, y => x == y) ? acc : Array.concat(acc, [x]))
      let firstItem = recursive[0]
      let recursiveItem = Option.mapWithDefault(firstItem, [], item => [
        {...item, recursWith: Some(Array.sliceToEnd(recursive, 1))},
      ])

      // 2. Filter out all recursive from unfree
      let unfree = Array.keep(unfree, unfreeItem =>
        !Array.some(recursive, recursiveItem => recursiveItem === unfreeItem)
      )

      // 3. Add recursive object to ordered
      let ordered = Array.concatMany([ordered, free, recursiveItem])

      // 4. Iterate on new free
      order_(unfree, ordered)
    } else {
      let ordered = Array.concat(ordered, free)
      order_(unfree, ordered)
    }
  } else {
    ordered
  }
}
let order = shapesWithTargets => {
  order_(shapesWithTargets, smithyImplicitShapes)
}