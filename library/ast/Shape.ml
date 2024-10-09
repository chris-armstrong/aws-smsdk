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
  | DocumentShape
[@@deriving show, equal]

let getShapeTraits descriptor =
  match descriptor with
  | ListShape { traits; _ }
  | StructureShape { traits; _ }
  | OperationShape { traits; _ }
  | UnionShape { traits; _ }
  | BlobShape { traits }
  | ServiceShape { traits; _ }
  | BooleanShape { traits }
  | IntegerShape { traits }
  | StringShape { traits }
  | MapShape { traits; _ }
  | TimestampShape { traits }
  | LongShape { traits }
  | FloatShape { traits }
  | DoubleShape { traits }
  | BigIntegerShape { traits }
  | BigDecimalShape { traits }
  | SetShape { traits; _ } ->
      traits
  | EnumShape { traits; _ } -> traits
  | UnitShape -> None
  | ResourceShape -> None
  | DocumentShape -> None

type t = { name : string; descriptor : shapeDescriptor } [@@deriving show, equal]

let isServiceShape shape = match shape with ServiceShape _ -> true | _ -> false
