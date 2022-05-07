open Base;
open Util;
open SafeNames;

let generateType = (name, definition) =>
  (("type " ++ safeTypeName(name)) ++ " = ") ++ definition;

let generateField = (~asName=?, ~doc=?, fieldName, typeName) =>
  (
    (
      (
        Option.value_map(doc, ~default="", ~f=x => x ++ {js| |js})
        ++ Option.value_map(asName, ~default="", ~f=x =>
             ("@as(\"" ++ x) ++ "\") "
           )
      )
      ++ safeMemberName(fieldName)
    )
    ++ {js|: |js}
  )
  ++ typeName;

let generateRecordTypeDefinition = members =>
  [@ns.ternary]
  (
    if (List.is_empty(members)) {
      "{.}";
    } else {
      ({js|{\\n|js} ++ String.concat(members, ~sep=",\n  ")) ++ {js|\\n}|js};
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

let generateIntegerShape = () => "int";
let generateLongShape = () => "float";
let generateDoubleShape = () => "float";
let generateFloatShape = () => "float";
let generateBooleanShape = () => "bool";
let generateBinaryShape = () => "NodeJs.Buffer.t";

let generateStringShape = (details: Shape.primitiveShapeDetails) =>
  [@ns.braces]
  {
    let enumTrait =
      Option.(details.traits >>= List.find(~f=Trait.isEnumTrait));
    switch (enumTrait) {
    | Some(EnumTrait(pairs)) =>
      let enum =
        List.map(pairs, ~f=pair =>
          ((("@as(\"" ++ pair.value) ++ "\")") ++ " #")
          ++ safeVariantName(pair.value)
        );
      ("[" ++ String.concat(enum, ~sep=" | ")) ++ "]";

    | _ => "string"
    };
  };
let generateMember = (m: Shape.member) =>
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
    let asName =
      [@ns.ternary]
      (
        if (String.equal(safeName, m.name)) {
          Some(m.name);
        } else {
          None;
        }
      );
    let doc = generateDoc(m.traits);
    generateField(~asName?, safeName, valueType, ~doc);
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

let generateStructureShape = (details: Shape.structureShapeDetails) =>
  [@ns.braces]
  {
    // let isError = Trait.hasTrait(details.traits, Trait.isErrorTrait);
    // if (isError) {
    //   generateExceptionType(List.map(details.members, generateMember));
    // } else {
    generateRecordTypeDefinition(
      List.map(details.members, ~f=generateMember),
      // };
    );
  };
let generateUnionShape = (details: Shape.structureShapeDetails) =>
  [@ns.braces] generateStructureShape(details);

let safeUnionValue = (members: list(Shape.member), member: Shape.member) =>
  [@ns.braces]
  {
    let nones =
      List.filter_map(members, ~f=candidate =>
        [@ns.ternary]
        (
          if (!Shape.equal_member(candidate, member)) {
            Some(safeTypeName(candidate.name) ++ ": None");
          } else {
            None;
          }
        )
      );
    (
      (("{ " ++ safeTypeName(member.name)) ++ ": Some(x), ")
      ++ String.concat(nones, ~sep=",")
    )
    ++ " }";
  };

let generateUnionHelperModule =
    (name: string, details: Shape.structureShapeDetails) =>
  [@ns.braces]
  {
    let tConstructors =
      List.map(details.members, ~f=member =>
        (
          (safeVariantName(member.name) ++ "(") ++ safeTypeName(member.target)
        )
        ++ ")"
      );
    let t =
      ("type t = " ++ String.concat(tConstructors, ~sep=" | ")) ++ {js|;|js};
    let classifyLines =
      List.map(details.members, ~f=member =>
        (
          (("  | { " ++ safeMemberName(member.name)) ++ ": Some(x) } => ")
          ++ safeConstructorName(member.name)
        )
        ++ {js|(x);|js}
      );
    let exceptionName =
      safeConstructorName(symbolName(name)) ++ {js|Unspecified|js};
    let classify =
      (
        (
          (
            "let classify = value => switch value {\n"
            ++ String.concat(classifyLines, ~sep="\\n")
          )
          ++ "\n| _ => raise("
        )
        ++ exceptionName
      )
      ++ ")\n};\n";

    let makeLines =
      List.map(details.members, ~f=member =>
        (({js|| |js} ++ safeConstructorName(member.name)) ++ {js|(x) => |js})
        ++ safeUnionValue(details.members, member)
      );
    let make =
      (
        {js|let make = value => switch value {
    |js}
        ++ String.concat(makeLines, ~sep="\\n")
      )
      ++ {js|
  };
  |js};
    let exc = ({js|exception |js} ++ exceptionName) ++ {js|;|js};
    (
      (
        (
          (
            (
              (
                (
                  (
                    ({js|
  module |js} ++ symbolName(name))
                    ++ {js| = {
    |js}
                  )
                  ++ t
                )
                ++ {js|
    |js}
              )
              ++ exc
            )
            ++ {js|
    |js}
          )
          ++ classify
        )
        ++ {js|
    |js}
      )
      ++ make
    )
    ++ {js|
  }|js};
  };

let generateListShape = target =>
  ({js|array<|js} ++ safeTypeName(target)) ++ {js|>|js};

let generateMapShape = (_, mapValue: Shape.mapKeyValue) =>
  [@ns.braces]
  {
    let valueType = safeTypeName(mapValue.target);
    ({js|Js.Dict.t<|js} ++ valueType) ++ {js|>|js};
  } /*
     * thrown when the ServiceTrait is missing
     */;

exception NoServiceTrait(string) /* * thrown for unknown timestamp format trait */;

exception UnknownTimestampFormat(string);

let generateServiceShape = (serviceName, cloudFormationName) =>
  [@ns.braces]
  (
    (
      (
        (
          {js|type awsServiceClient;\\n@module("@aws-sdk/client-|js}
          ++ serviceName
        )
        ++ {js|") @new external createClient: unit => awsServiceClient = "|js}
      )
      ++ cloudFormationName
    )
    ++ {js|Client";|js}
  );

let generateSetShape = (details: Shape.setShapeDetails) =>
  [@ns.braces]
  (({js|array<|js} ++ safeTypeName(details.target)) ++ {js|>|js});

let generateTimestampShape = ({traits}: Shape.timestampShapeDetails) =>
  [@ns.braces]
  {
    let timestampFormat =
      Trait.findTrait(
        Option.value(traits, ~default=[]),
        Trait.isTimestampFormatTrait,
      );
    switch (timestampFormat) {
    | Some(TimestampFormatTrait("date-time")) => {js|Js.Date.t;|js}
    | Some(TimestampFormatTrait("epoch-seconds")) => {js|int;|js}
    | _ => {js|Js.Date.t;|js}
    };
  };

type nonrec operationStructure =
  | OperationStructure(Shape.structureShapeDetails)
  | OperationStructureRef(string)
  | OperationStructureNone;

let generateOperationStructureType = (varName, opStruct) =>
  switch (opStruct) {
  | OperationStructure(details) =>
    [@ns.braces]
    {
      let docs = generateDoc(details.traits);
      docs
      ++ generateType({js|#|js} ++ varName, generateStructureShape(details));
    }

  | OperationStructureRef(name) =>
    generateType({js|#|js} ++ varName, safeTypeName(name))
  | OperationStructureNone =>
    [@ns.braces]
    generateType(
      {js|#|js} ++ varName,
      generateStructureShape({traits: None, members: []}),
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
    ) =>
  [@ns.braces]
  {
    let commandName = symbolName(name) ++ {js|Command|js};
    let request = generateOperationStructureType("request", input);
    let response = generateOperationStructureType("response", output);
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
          (
            (
              (
                (({js|module |js} ++ symbolName(name)) ++ {js| = {\\n|js})
                ++ {js|  type t;\\n|js}
              )
              ++ ({js|  |js} ++ request)
              ++ {js|\\n|js}
            )
            ++ ({js|  |js} ++ response)
            ++ {js|\\n|js}
          )
          ++ (
            (
              (
                (
                  ({js|  @module("@aws-sdk/client-|js} ++ moduleName)
                  ++ {js|") @new external new: (|js}
                )
                ++ inputType
              )
              ++ {js|) => t = "|js}
            )
            ++ commandName
          )
          ++ {js|";\\n|js}
        )
        ++ ({js|  |js} ++ make)
        ++ {js|\\n|js}
      )
      ++ (
        {js|  @send external send: (awsServiceClient, t) => |js} ++ outputType
      )
      ++ {js| = "send";\\n|js}
    )
    ++ {js|}\\n|js};
  };

let generateTypeTarget = descriptor =>
  [@ns.braces]
  Shape.(
    switch (descriptor) {
    | StringShape(details) => generateStringShape(details)
    | StructureShape(details) => generateStructureShape(details)
    | ListShape({target, _}) => generateListShape(target)
    | IntegerShape(_) => generateIntegerShape()
    | LongShape(_) => generateLongShape()
    | DoubleShape(_) => generateDoubleShape()
    | FloatShape(_) => generateFloatShape()
    | BooleanShape(_) => generateBooleanShape()
    | BlobShape(_) => generateBinaryShape()
    | MapShape(details) => generateMapShape(details.mapKey, details.mapValue)

    | ServiceShape(_) => ""
    | UnionShape(details) => generateUnionShape(details)
    | TimestampShape(details) => generateTimestampShape(details)
    | ResourceShape => ""
    | OperationShape(_) => ""
    | SetShape(details) => generateSetShape(details)
    }
  );

let generateTypeBlock = ({name, descriptor}: Shape.t) =>
  [@ns.braces]
  {
    let result = generateTypeTarget(descriptor);
    let t =
      [@ns.ternary]
      (
        if (String.equal(result, "")) {
          "";
        } else {
          generateType(name, result);
        }
      );
    let docs = generateDoc(Shape.getShapeTraits(descriptor));
    docs
    ++ (
      switch (descriptor) {
      | UnionShape(details) =>
        [@ns.braces]
        {
          let shapeModule = generateUnionHelperModule(name, details);
          t ++ shapeModule;
        }

      | _ => t
      }
    );
  };

let generateRecursiveTypeBlock = (shapes: list(Shape.t)) =>
  [@ns.braces]
  {
    let shapeTypes =
      List.map(shapes, ~f=shape =>
        (safeTypeName(shape.name) ++ {js| = |js})
        ++ generateTypeTarget(shape.descriptor)
      );
    "type rec " ++ String.concat(shapeTypes, ~sep=" and ");
  };
