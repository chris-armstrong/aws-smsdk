open Base;
open Util;
open SafeNames;

let generateType = (name, definition) =>
  (("type " ++ safeTypeName(name)) ++ " = ") ++ definition;

let generateField = (~doc=?, fieldName, typeName) =>
  (
    (
      Option.value_map(doc, ~default="", ~f=x => x ++ " ")
      ++ safeMemberName(fieldName)
    )
    ++ ": "
  )
  ++ typeName;

let generateRecordTypeDefinition = members =>
  [@ns.ternary]
  (
    if (List.is_empty(members)) {
      "{.}";
    } else {
      ("{\n  " ++ String.concat(members, ~sep=",\n  ")) ++ "\n}";
    }
  );

let reBSlashBSlash = Str.regexp("\\\\");
let reBSlashDQuote = Str.regexp("\\\"");
let escapeString = str =>
  str
  |> Str.global_replace(reBSlashBSlash, "\\\\", _)
  |> Str.global_replace(reBSlashDQuote, "\\\"", _);

let generateDoc = traits =>
  [@ns.braces]
  {
    let docStrs =
      traits
      |> Option.value(~default=[])
      |> List.filter_map(~f=trait =>
           switch (trait) {
           | Trait.DocumentationTrait(str) => Some(str)
           | _ => None
           }
         );
    let docs = String.concat(docStrs, ~sep="");
    if (!String.is_empty(docs)) {
      ("@ocaml.doc(\"" ++ escapeString(docs)) ++ "\")";
    } else {
      "";
    };
  };

/* OCaml ints aren't quite 32bit like Smithy int's, but this is more convenient */
let generateIntegerShape = () => "int";
let generateLongShape = () => "int";
let generateDoubleShape = () => "float";
let generateFloatShape = () => "float";
let generateBooleanShape = () => "bool";
let generateBinaryShape = () => "bytes";

// Not seen one in the wild yet
let generateBigIntegerShape = () => "Big_int.big_int";

// Not seen one in the wild yet
let generateBigDecimalShape = () => "Bigdecimal.t";

let generateStringShape = (details: Shape.primitiveShapeDetails) =>
  [@ns.braces]
  {
    let enumTrait =
      Option.(details.traits >>= List.find(~f=Trait.isEnumTrait));
    switch (enumTrait) {
    | Some(EnumTrait(pairs)) =>
      "\n"
      ++ (
        List.map(pairs, ~f=({name, value}) =>
          "  | " ++ safeConstructorName(Option.value(name, ~default=value))
        )
        |> String.concat(~sep="\n")
      )
    | _ => "string"
    };
  };
let generateMember = (m: Shape.member, ~genDoc=false, ()) =>
  [@ns.braces]
  {
    let safeName = safeMemberName(m.name);
    let required = Trait.hasTrait(m.traits, Trait.isRequiredTrait);
    let valueType =
      [@ns.ternary]
      (
        if (required) {
          safeTypeName(m.target);
        } else {
          ("option(" ++ safeTypeName(m.target)) ++ ")";
        }
      );
    let doc = genDoc ? Some(generateDoc(m.traits)) : None;
    generateField(safeName, valueType, ~doc?);
  };

let indentString = indent =>
  [@ns.braces]
  {
    let is = [||];
    Array.fill(
      is,
      ~len=[@ns.namedArgLoc] indent,
      ~pos=[@ns.namedArgLoc] 0,
      " ",
    );
    String.concat_array(is);
  };

let generateStructureShape =
    (details: Shape.structureShapeDetails, ~genDoc=false, ()) =>
  [@ns.braces]
  {
    generateRecordTypeDefinition(
      List.map(details.members, ~f=member =>
        generateMember(member, ~genDoc, ())
      ),
    );
  };

let generateUnionShape =
    (details: Shape.structureShapeDetails, ~genDoc=false, ()) => {
  let tConstructors =
    List.map(details.members, ~f=member =>
      ((safeVariantName(member.name) ++ "(") ++ safeTypeName(member.target))
      ++ ")"
    );
  let t = String.concat(tConstructors, ~sep=" | ");
  t;
};

let generateListShape = target => ("list(" ++ safeTypeName(target)) ++ ")";

let generateMapShape = (_, mapValue: Shape.mapKeyValue) => {
  let valueType = safeTypeName(mapValue.target);
  "list((string, " ++ valueType ++ "))";
};
exception NoServiceTrait(string) /* * thrown for unknown timestamp format trait */;

exception UnknownTimestampFormat(string);

let generateSetShape = (details: Shape.setShapeDetails) => {
  "list(" ++ safeTypeName(details.target) ++ ")";
};

let generateTimestampShape = ({traits}: Shape.timestampShapeDetails) =>
  [@ns.braces]
  {
    let timestampFormat =
      Trait.findTrait(
        Option.value(traits, ~default=[]),
        Trait.isTimestampFormatTrait,
      );
    switch (timestampFormat) {
    | Some(TimestampFormatTrait("date-time")) => {js|float|js}
    | Some(TimestampFormatTrait("epoch-seconds")) => {js|float;|js}
    | _ => {js|float|js}
    };
  };

type operationStructure =
  | OperationStructure(Shape.structureShapeDetails)
  | OperationStructureRef(string)
  | OperationStructureNone;

let generateOperationStructureType = (varName, opStruct, ~genDoc=false, ()) =>
  switch (opStruct) {
  | OperationStructure(details) =>
    [@ns.braces]
    {
      let docs = generateDoc(details.traits);
      docs
      ++ generateType(
           {js|#|js} ++ varName,
           generateStructureShape(details, ~genDoc, ()),
         );
    }

  | OperationStructureRef(name) =>
    generateType({js|#|js} ++ varName, safeTypeName(name))
  | OperationStructureNone =>
    [@ns.braces]
    generateType(
      {js|#|js} ++ varName,
      generateStructureShape({traits: None, members: []}, ~genDoc, ()),
    )
  };

let isOperationStructureNone = opStruct =>
  switch (opStruct) {
  | OperationStructureNone => true
  | _ => false
  };

let generateMake = input =>
  switch (input) {
  | OperationStructure({members, _}) =>
    [@ns.braces]
    {
      let (requiredMembers, optionalMembers) =
        List.partition_tf(members, ~f=x =>
          Trait.hasTrait(x.traits, Trait.isRequiredTrait)
        );
      let requiredArguments =
        List.map(requiredMembers, ~f=member =>
          {js|~|js} ++ safeMemberName(member.name)
        );
      let optionalArguments =
        List.map(optionalMembers, ~f=member =>
          ({js|~|js} ++ safeMemberName(member.name)) ++ {js|=?|js}
        );
      let arguments =
        List.concat([requiredArguments, optionalArguments])
        |> String.concat(~sep=", ");
      let fields =
        List.map(members, ~f=member =>
          safeMemberName(member.name) ++ ": " ++ safeMemberName(member.name)
        )
        |> String.concat(~sep=", ");
      (
        (({js|let make = (|js} ++ arguments) ++ {js|, ()) => new({ |js})
        ++ fields
      )
      ++ {js| })|js};
    }

  | OperationStructureNone =>
    [@ns.braces] {js|let make = () => new(Js.Obj.empty())|js}
  | OperationStructureRef(_) => ""
  };

let generateOperationModule =
    (
      moduleName,
      (name, input, output): (
        string,
        operationStructure,
        operationStructure,
      ),
      ~genDoc=false,
      (),
    ) =>
  [@ns.braces]
  {
    let commandName = symbolName(name) ++ {js|Command|js};
    let request =
      generateOperationStructureType("request", input, ~genDoc, ());
    let response =
      generateOperationStructureType("response", output, ~genDoc, ());
    let inputType = "request";
    let outputType =
      [@ns.ternary]
      (
        if (isOperationStructureNone(output)) {
          "Js.Promise.t<unit>";
        } else {
          "Js.Promise.t<response>";
        }
      );
    let make = generateMake(input);
    (
      (
        (
          "module "
          ++ symbolName(name)
          ++ " = {\\n"
          ++ "  type t;\\n"
          ++ ("  " ++ request)
          ++ "\\n"
          ++ ("  " ++ response)
          ++ "\\n"
          ++ (
            (
              (
                ("  @module(\"@aws-sdk/client" ++ moduleName)
                ++ "\" @new external new: ("
              )
              ++ inputType
            )
            ++ ") => t = \""
          )
          ++ commandName
        )
        ++ "\";\\n"
      )
      ++ ("  " ++ make)
      ++ {js|\\n|js}
    )
    ++ (
      {js|  @send external send: (awsServiceClient, t) => |js} ++ outputType
    )
    ++ {js| = "send";\\n|js}
    ++ {js|}\\n|js};
  };

let generateTypeTarget = (descriptor, ~genDoc=false, ()) =>
  [@ns.braces]
  Shape.(
    switch (descriptor) {
    | StringShape(details) => generateStringShape(details)
    | StructureShape(details) => generateStructureShape(details, ~genDoc, ())
    | ListShape({target, _}) => generateListShape(target)
    | IntegerShape(_) => generateIntegerShape()
    | LongShape(_) => generateLongShape()
    | DoubleShape(_) => generateDoubleShape()
    | FloatShape(_) => generateFloatShape()
    | BooleanShape(_) => generateBooleanShape()
    | BlobShape(_) => generateBinaryShape()
    | BigIntegerShape(_) => generateBigIntegerShape()
    | BigDecimalShape(_) => generateBigDecimalShape()
    | MapShape(details) => generateMapShape(details.mapKey, details.mapValue)

    | ServiceShape(_) => ""
    | UnionShape(details) => generateUnionShape(details, ~genDoc, ())
    | TimestampShape(details) => generateTimestampShape(details)
    | ResourceShape => ""
    | OperationShape(_) => ""
    | SetShape(details) => generateSetShape(details)
    }
  );

let getStructureShape =
  Shape.(
    fun
    | StructureShape(details) => Some(details)
    | _ => None
  );

let generateExceptionBlock = (name, _) => {
  // TODO: take into account exceptions which have structure
  "exception "
  ++ safeConstructorName(name)
  ++ "(Aws.apiError(Aws.emptyErrorDetails))";
};

let generateTypeBlock = ({name, descriptor}: Shape.t, ~genDoc=false, ()) => {
  let docs = genDoc ? generateDoc(Shape.getShapeTraits(descriptor)) : "";
  let result = generateTypeTarget(descriptor, ~genDoc=false, ());
  let t =
    [@ns.ternary]
    (
      if (String.equal(result, "")) {
        "";
      } else {
        generateType(name, result);
      }
    );
  switch (descriptor) {
  | StructureShape(details)
      when Trait.hasTrait(details.traits, Trait.isErrorTrait) =>
    docs ++ generateExceptionBlock(name, details)
  | _ => docs ++ t
  };
};

let generateRecursiveTypeBlock = (shapes: list(Shape.t), ~genDoc=false, ()) => {
  let shapeTypes =
    List.map(shapes, ~f=shape =>
      (safeTypeName(shape.name) ++ " = ")
      ++ generateTypeTarget(shape.descriptor, ~genDoc, ())
    );
  let shapeModules =
    shapes
    |> List.filter_map(~f=(Shape.{name, descriptor}) =>
         switch (descriptor) {
         // TODO: Insert any complex shapes here (i.e. those that require their own module)
         | _ => None
         }
       )
    |> String.concat(~sep="\n");

  "type " ++ String.concat(shapeTypes, ~sep=" and ") ++ shapeModules;
};
