open Base

type member = { name : string; target : string; traits : Trait.t list option }
[@@deriving show, equal]

type structureShapeDetails = { traits : Trait.t list option; members : member list }
[@@deriving show, equal]

type setShapeDetails = { traits : Trait.t list option; target : string } [@@deriving show, equal]
type listShapeDetails = { target : string; traits : Trait.t list option } [@@deriving show, equal]

type operationShapeDetails = {
  input : string option;
  output : string option;
  errors : string list option;
  documentation : string option;
  traits : Trait.t list option;
}
[@@deriving show, equal]

type serviceShapeDetails = {
  version : string;
  operations : string list option;
  traits : Trait.t list option;
}
[@@deriving show, equal]

type primitiveShapeDetails = { traits : Trait.t list option } [@@deriving show, equal]
type mapKeyValue = { target : string; traits : Trait.t list option } [@@deriving show, equal]

type mapShapeDetails = {
  mapKey : mapKeyValue;
  mapValue : mapKeyValue;
  traits : Trait.t list option;
}
[@@deriving show, equal]

type enumShapeDetails = { members : member list; traits : Trait.t list option }
[@@deriving show, equal]

type timestampShapeDetails = { traits : Trait.t list option } [@@deriving show, equal]

type shapeDescriptor =
  | UnitShape
  | ListShape of listShapeDetails
  | OperationShape of operationShapeDetails
  | StructureShape of structureShapeDetails
  | UnionShape of structureShapeDetails
  | ServiceShape of serviceShapeDetails
  | BlobShape of primitiveShapeDetails
  | BooleanShape of primitiveShapeDetails
  | IntegerShape of primitiveShapeDetails
  | StringShape of primitiveShapeDetails
  | BigIntegerShape of primitiveShapeDetails
  | BigDecimalShape of primitiveShapeDetails
  | MapShape of mapShapeDetails
  | ResourceShape
  | TimestampShape of timestampShapeDetails
  | LongShape of primitiveShapeDetails
  | FloatShape of primitiveShapeDetails
  | DoubleShape of primitiveShapeDetails
  | SetShape of setShapeDetails
  | EnumShape of enumShapeDetails
[@@deriving show, equal]

let getShapeTraits descriptor =
  match descriptor with
  | ((ListShape { traits; _ }) [@explicit_arity])
  | ((StructureShape { traits; _ }) [@explicit_arity])
  | ((OperationShape { traits; _ }) [@explicit_arity])
  | ((UnionShape { traits; _ }) [@explicit_arity])
  | ((BlobShape { traits }) [@explicit_arity])
  | ((ServiceShape { traits; _ }) [@explicit_arity])
  | ((BooleanShape { traits }) [@explicit_arity])
  | ((IntegerShape { traits }) [@explicit_arity])
  | ((StringShape { traits }) [@explicit_arity])
  | ((MapShape { traits; _ }) [@explicit_arity])
  | ((TimestampShape { traits }) [@explicit_arity])
  | ((LongShape { traits }) [@explicit_arity])
  | ((FloatShape { traits }) [@explicit_arity])
  | ((DoubleShape { traits }) [@explicit_arity])
  | ((BigIntegerShape { traits }) [@explicit_arity])
  | ((BigDecimalShape { traits }) [@explicit_arity])
  | ((SetShape { traits; _ }) [@explicit_arity]) ->
      traits
  | EnumShape { traits; _ } -> traits
  | UnitShape -> None
  | ResourceShape -> None

type t = { name : string; descriptor : shapeDescriptor } [@@deriving show, equal]

let isServiceShape shape = match shape with ServiceShape _ -> true | _ -> false
