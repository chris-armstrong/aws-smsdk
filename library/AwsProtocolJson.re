open Base;
open SafeNames;
open Shape;

exception UnexpectedType(string);

let generateSerialiserFuncName = name =>
  SafeNames.safeFunctionName(name ++ "_to_yojson");

let rec generateStructureSerialiserFuncBody =
        (fmt, name, descriptor: structureShapeDetails) => {
  Fmt.pf(
    fmt,
    "(x:@,%s)@,=>@,assoc_to_yojson@,([@,@[<2>",
    SafeNames.safeTypeName(name),
  );
  List.iter(
    descriptor.members,
    ~f=({name, target, traits}) => {
      let isRequired = Trait.hasTrait(traits, Trait.isRequiredTrait);
      let extractedValue =
        if (isRequired) {
          "Some("
          ++ generateSerialiserFuncName(target)
          ++ "(x."
          ++ SafeNames.safeMemberName(name)
          ++ "))";
        } else {
          "option_to_yojson("
          ++ generateSerialiserFuncName(target)
          ++ ")(x."
          ++ SafeNames.safeMemberName(name)
          ++ ")";
        };
      Fmt.pf(fmt, "(@;\"%s\"@,,@;%s@;),@\n", name, extractedValue);
    },
  );
  Fmt.pf(fmt, "@,@]])@,");
}
and generateUnionSerialiserFuncBody = (fmt, name, descriptor) =>
  Fmt.pf(fmt, "")

and generateStringSerialiserFuncBody =
    (fmt, name, stringDescriptor: Shape.primitiveShapeDetails) =>
  if (Trait.hasTrait(stringDescriptor.traits, Trait.isEnumTrait)) {
    let enumValue =
      stringDescriptor.traits
      |> Option.value(~default=[])
      |> List.filter_map(
           ~f=
             fun
             | Trait.EnumTrait(x) => Some(x)
             | _ => None,
         )
      |> List.hd_exn;
    let entries =
      enumValue
      |> List.map(~f=(Trait.{name, value}) =>
           "| "
           ++ safeVariantName(Option.value(name, ~default=value))
           ++ " => \""
           ++ value
           ++ "\""
         )
      |> String.concat(~sep="\n");
    Fmt.pf(fmt, "fun@\n%s@\n", entries);
  } else {
    Fmt.pf(fmt, "string_to_yojson");
  }

and generateSerialiserFuncBody = (fmt, name, shapeDescriptor) => {
  switch (shapeDescriptor) {
  | StructureShape(x) => generateStructureSerialiserFuncBody(fmt, name, x)
  | StringShape(x) => generateStringSerialiserFuncBody(fmt, name, x)
  | IntegerShape(x) => Fmt.pf(fmt, "int_to_yojson")
  | BooleanShape(x) => Fmt.pf(fmt, "bool_to_yojson")
  | BigIntegerShape(x) => Fmt.pf(fmt, "big_int_to_yojson")
  | BigDecimalShape(x) => Fmt.pf(fmt, "big_decimal_to_yojson")
  | TimestampShape(x) => Fmt.pf(fmt, "timestamp_to_yojson")
  | BlobShape(x) => Fmt.pf(fmt, "blob_to_yojson")
  | MapShape(x) => Fmt.pf(fmt, "map_to_yojson")
  | UnionShape(x) => generateUnionSerialiserFuncBody(fmt, name, x)
  | SetShape(x) =>
    Fmt.pf(
      fmt,
      "list_to_yojson(@;%s@;)",
      generateSerialiserFuncName(x.target),
    )
  | LongShape(x) => Fmt.pf(fmt, "int_to_yojson")
  | ListShape(x) =>
    Fmt.pf(
      fmt,
      "list_to_yojson(@;%s@;)",
      generateSerialiserFuncName(x.target),
    )
  | FloatShape(x) => Fmt.pf(fmt, "float_to_yojson")
  | DoubleShape(x) => Fmt.pf(fmt, "double_to_yojson")
  | ServiceShape(x) => ()
  | _ => raise(UnexpectedType(name))
  };
};

let descriptorHasBody =
  fun
  | StructureShape(_)
  | StringShape(_)
  | IntegerShape(_)
  | BooleanShape(_)
  | BigIntegerShape(_)
  | BigDecimalShape(_)
  | TimestampShape(_)
  | BlobShape(_)
  | MapShape(_)
  | UnionShape(_)
  | SetShape(_)
  | LongShape(_)
  | ListShape(_)
  | FloatShape(_)
  | DoubleShape(_) => true
  | ResourceShape
  | OperationShape(_)
  | ServiceShape(_) => false;

let generateSerialisers =
    (fmt, structureShapes: list(Dependencies.shapeWithTarget)) => {
  Fmt.pf(fmt, "module Serialize = {@\n@[<2>@\n");
  Fmt.pf(fmt, "open AwsSdkLib.Json.SerializeHelpers@\n");
  structureShapes
  |> List.iter(~f=(Dependencies.{name, descriptor, _}) => {
       let to_func = generateSerialiserFuncName(name);
       if (descriptorHasBody(descriptor)) {
         Fmt.pf(fmt, "let@ %s@ =@ @[<2>@,", to_func);
         generateSerialiserFuncBody(fmt, name, descriptor);
         Fmt.pf(fmt, ";@]@\n@\n");
       };
     });
  Fmt.pf(fmt, "@]@\n}@\n");
};
