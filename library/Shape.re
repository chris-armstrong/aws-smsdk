open Base;

[@deriving (show, equal)]
type member = {
  name: string,
  target: string,
  traits: option(list(Trait.t)),
};

[@deriving (show, equal)]
type structureShapeDetails = {
  traits: option(list(Trait.t)),
  members: list(member),
};

[@deriving (show, equal)]
type setShapeDetails = {
  traits: option(list(Trait.t)),
  target: string,
};

[@deriving (show, equal)]
type listShapeDetails = {
  target: string,
  traits: option(list(Trait.t)),
};
[@deriving (show, equal)]
type operationShapeDetails = {
  input: option(string),
  output: option(string),
  errors: option(list(string)),
  documentation: option(string),
  traits: option(list(Trait.t)),
};

[@deriving (show, equal)]
type serviceShapeDetails = {
  version: string,
  operations: option(list(string)),
  traits: option(list(Trait.t)),
};

[@deriving (show, equal)]
type primitiveShapeDetails = {traits: option(list(Trait.t))};

[@deriving (show, equal)]
type mapKeyValue = {
  target: string,
  traits: option(list(Trait.t)),
};

[@deriving (show, equal)]
type mapShapeDetails = {
  mapKey: mapKeyValue,
  mapValue: mapKeyValue,
  traits: option(list(Trait.t)),
};

[@deriving (show, equal)]
type timestampShapeDetails = {traits: option(list(Trait.t))};

[@deriving (show, equal)]
type shapeDescriptor =
  | ListShape(listShapeDetails)
  | OperationShape(operationShapeDetails)
  | StructureShape(structureShapeDetails)
  | UnionShape(structureShapeDetails)
  | ServiceShape(serviceShapeDetails)
  | BlobShape(primitiveShapeDetails)
  | BooleanShape(primitiveShapeDetails)
  | IntegerShape(primitiveShapeDetails)
  | StringShape(primitiveShapeDetails)
  | MapShape(mapShapeDetails)
  /* TODO: something useful with resource shapes (if needed)*/
  | ResourceShape
  | TimestampShape(timestampShapeDetails)
  | LongShape(primitiveShapeDetails)
  | FloatShape(primitiveShapeDetails)
  | DoubleShape(primitiveShapeDetails)
  | SetShape(setShapeDetails);

let getShapeTraits = descriptor =>
  switch (descriptor) {
  | ListShape({traits, _})
  | StructureShape({traits, _})
  | OperationShape({traits, _})
  | UnionShape({traits, _})
  | BlobShape({traits})
  | ServiceShape({traits, _})
  | BooleanShape({traits})
  | IntegerShape({traits})
  | StringShape({traits})
  | MapShape({traits, _})
  | TimestampShape({traits})
  | LongShape({traits})
  | FloatShape({traits})
  | DoubleShape({traits})
  | SetShape({traits, _}) => traits
  | ResourceShape => None
  };

[@deriving (show, equal)]
type t = {
  name: string,
  descriptor: shapeDescriptor,
}
;

let isServiceShape = shape =>
  switch (shape) {
  | ServiceShape(_) => true
  | _ => false
  };
