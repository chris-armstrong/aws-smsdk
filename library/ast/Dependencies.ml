open Base
open Shape

type shapeWithTarget = {
  name : string;
  descriptor : shapeDescriptor;
  targets : string list;
  recursWith : shapeWithTarget list option;
}
[@@deriving show, equal]

(** Builtin Smithy shapes which are implied to be present in every context *)
let smithyImplicitShapes =
  [
    { name = "smithy.api#Unit"; descriptor = UnitShape; targets = []; recursWith = None };
    {
      name = "smithy.api#String";
      descriptor = StringShape { traits = None };
      targets = [];
      recursWith = None;
    };
    {
      name = "smithy.api#Boolean";
      descriptor = BooleanShape { traits = None };
      targets = [];
      recursWith = None;
    };
    {
      name = "smithy.api#Integer";
      descriptor = IntegerShape { traits = None };
      targets = [];
      recursWith = None;
    };
    {
      name = "smithy.api#Timestamp";
      descriptor = TimestampShape { traits = None };
      targets = [];
      recursWith = None;
    };
    {
      name = "smithy.api#Long";
      descriptor = LongShape { traits = None };
      targets = [];
      recursWith = None;
    };
    { name = "smithy.api#Document"; descriptor = DocumentShape; targets = []; recursWith = None };
  ]

(** resolve the target shape names referenced by the specified shape descriptor *)
let getTargets descriptor =
  match descriptor with
  | ListShape listShapeDetails -> [ listShapeDetails.target ]
  | OperationShape details ->
      List.concat
        [
          Option.value (Option.map details.input ~f:(fun extracted -> [ extracted ])) ~default:[];
          Option.value (Option.map details.output ~f:(fun extracted -> [ extracted ])) ~default:[];
          Option.value (Option.map details.errors ~f:(fun extracted -> extracted)) ~default:[];
        ]
  | StructureShape { members; _ } -> List.map members ~f:(fun member -> member.target)
  | ServiceShape { operations; _ } -> Option.value operations ~default:[]
  | MapShape { mapKey; mapValue; _ } -> [ mapKey.target; mapValue.target ]
  | BlobShape _ | BooleanShape _ | IntegerShape _ | StringShape _ | ResourceShape | TimestampShape _
  | BigIntegerShape _ | BigDecimalShape _ ->
      []
  | UnionShape { members; _ } -> List.map members ~f:(fun member -> member.target)
  | LongShape _ -> []
  | DoubleShape _ -> []
  | SetShape { target; _ } -> [ target ]
  | EnumShape { members; _ } -> List.map members ~f:(fun member -> member.target)
  | FloatShape _ -> []
  | UnitShape -> []
  | DocumentShape -> []
[@@ocaml.doc "\n * Get the targets for each shape type\n "]

let getShapeTargets shapes =
  List.map shapes ~f:(fun (shape : Shape.t) -> (shape, getTargets shape.descriptor))

module ShapeWithTargetGraph = struct
  type t = shapeWithTarget list

  module V = struct
    type t = shapeWithTarget

    let compare x y = String.compare x.name y.name
    let hash x = String.hash x.name
    let equal x y = String.equal x.name y.name
  end

  let iter_vertex (iterator : V.t -> unit) (x : t) = List.iter x ~f:iterator

  let iter_succ iterator x y =
    let { targets; _ } = y in
    List.iter targets ~f:(fun target_name ->
        try
          let target =
            List.find_exn x ~f:(fun iter_target -> String.equal iter_target.name target_name)
          in
          iterator target
        with Not_found_s _ -> Fmt.pr "Could not find dependency target %s\n" y.name)
end

module ShapeWithTargetComponents = Graph.Components.Make (ShapeWithTargetGraph)

let order shapesWithTargets =
  let partitions = ShapeWithTargetComponents.scc_list (shapesWithTargets @ smithyImplicitShapes) in
  List.filter_map partitions ~f:(fun partition ->
      match partition with
      | [] -> None
      | a :: [] -> Some a
      | a :: x -> Some { a with recursWith = Some x })
