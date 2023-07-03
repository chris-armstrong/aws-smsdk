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
    "(x: %s) => assoc_to_yojson(@;<0 2>[@[<v 2>",
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
      Fmt.pf(fmt, "(@;<0 2>\"%s\",@;<0 2>%s),@;", name, extractedValue);
    },
  );
  Fmt.pf(fmt, "@]@;])");
}
and generateUnionSerialiserFuncBody = (fmt, name, descriptor) => {
  Fmt.pf(fmt, "(x: %s) => {@\n@[<v 2>", SafeNames.safeTypeName(name));
  Fmt.pf(fmt, "switch (x) {@\n@[<v 2>");
  List.iter(descriptor.members, ~f=member => {
    Fmt.pf(
      fmt,
      "| %s(arg) => assoc_to_yojson([(\"%s\", Some(%s(arg)))]);@\n",
      SafeNames.safeConstructorName(member.name),
      member.name,
      generateSerialiserFuncName(member.target),
    )
  });
  Fmt.pf(fmt, "@\n@]}");
  Fmt.pf(fmt, "@\n@]}");
}

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
    Fmt.pf(
      fmt,
      "(x: %s) => @,@[<v 2>switch (x) {@,@[<v 2>",
      SafeNames.safeTypeName(name),
    );
    enumValue
    |> List.iter(~f=(Trait.{name, value}) =>
         Fmt.pf(
           fmt,
           "| %s => `String(\"%s\")@;",
           safeVariantName(Option.value(name, ~default=value)),
           value,
         )
       );

    Fmt.pf(fmt, "@\n@]}@]");
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
  | MapShape(x) =>
    Fmt.pf(
      fmt,
      "(x) => map_to_yojson(%s, x)",
      generateSerialiserFuncName(x.mapValue.target),
    )
  | UnionShape(x) => generateUnionSerialiserFuncBody(fmt, name, x)
  | SetShape(x) =>
    Fmt.pf(
      fmt,
      "(x) => list_to_yojson(@;<0 2>%s@;,x@;)",
      generateSerialiserFuncName(x.target),
    )
  | LongShape(x) => Fmt.pf(fmt, "long_to_yojson")
  | ListShape(x) =>
    Fmt.pf(
      fmt,
      "(x) => list_to_yojson(@;<0 2>%s@;,x@;)",
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
  | StructureShape(x) => !Trait.hasTrait(x.traits, Trait.isErrorTrait)
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
  Fmt.pf(fmt, "module Serialize = {@\n@[<2>");
  Fmt.pf(fmt, "open AwsSdkLib.Json.SerializeHelpers;@\n@\n");
  structureShapes
  |> List.iter(~f=(Dependencies.{name, descriptor, recursWith, _}) => {
       let to_func = generateSerialiserFuncName(name);
       switch (recursWith) {
       | Some(others) =>
         Fmt.pf(fmt, "let rec@ %s@ =@ @;<0 2>@[<v 0>", to_func);
         generateSerialiserFuncBody(fmt, name, descriptor);
         List.iter(others, ~f=other =>
           if (descriptorHasBody(other.descriptor)) {
             Fmt.pf(
               fmt,
               "@]@\n@\nand %s =@ @;<0 2>@[<v 0>",
               generateSerialiserFuncName(other.name),
             );
             generateSerialiserFuncBody(fmt, other.name, other.descriptor);
           }
         );
         Fmt.pf(fmt, ";@]@\n@\n");
       | None =>
         if (descriptorHasBody(descriptor)) {
           Fmt.pf(fmt, "let@ %s@ =@ @;<0 2>@[<v 0>", to_func);
           generateSerialiserFuncBody(fmt, name, descriptor);
           Fmt.pf(fmt, ";@]@\n@\n");
         }
       };
     });
  Fmt.pf(fmt, "@]@\n}@\n");
};

let generateOperations = (fmt, operationShapes) => {
  operationShapes
  |> List.filter_map(
       ~f=
         fun
         | Dependencies.{name, descriptor: OperationShape(os), _} =>
           Some((name, os))
         | _ => None,
     )
  |> List.iter(~f=((name, os)) => {
       Fmt.pf(
         fmt,
         "module %s {@\n@[<v 2>",
         SafeNames.safeConstructorName(name),
       );

       Fmt.pf(fmt, "@]@\n}@\n@\n");
     });
};
