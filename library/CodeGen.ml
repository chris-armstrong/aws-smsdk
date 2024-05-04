open Base
open Util
open SafeNames

let generateType name definition = (("type " ^ safeTypeName name) ^ " = ") ^ definition

let generateField ?doc fieldName typeName =
  ((Option.value_map doc ~default:"" ~f:(fun x -> x ^ " ") ^ safeMemberName fieldName) ^ ": ")
  ^ typeName

let generateRecordTypeDefinition members =
  (if List.is_empty members then "{.}" else ("{\n  " ^ String.concat members ~sep:";\n  ") ^ "\n}")
  [@ns.ternary]

let reBSlashBSlash = Str.regexp "\\\\"
let reBSlashDQuote = Str.regexp "\\\""

let escapeString str =
  (str |> fun __x -> Str.global_replace reBSlashBSlash "\\\\" __x) |> fun __x ->
  Str.global_replace reBSlashDQuote "\\\"" __x

let generateDoc traits =
  (let docStrs =
     traits |> Option.value ~default:[]
     |> List.filter_map ~f:(fun trait ->
            match trait with
            | ((Trait.DocumentationTrait str) [@explicit_arity]) -> Some str [@explicit_arity]
            | _ -> None)
   in
   let docs = String.concat docStrs ~sep:"" in
   if not (String.is_empty docs) then ("@ocaml.doc(\"" ^ escapeString docs) ^ "\")" else "")
  [@ns.braces]

let generateIntegerShape () = "int"
let generateLongShape () = "int"
let generateDoubleShape () = "float"
let generateFloatShape () = "float"
let generateBooleanShape () = "bool"
let generateBinaryShape () = "bytes"
let generateBigIntegerShape () = "Big_int.big_int"
let generateBigDecimalShape () = "Bigdecimal.t"

let generateStringShape (details : Shape.primitiveShapeDetails) =
  (let enumTrait =
     let open Option in
     details.traits >>= List.find ~f:Trait.isEnumTrait
   in
   match enumTrait with
   | ((Some ((EnumTrait pairs) [@explicit_arity])) [@explicit_arity]) ->
       "\n"
       ^ (List.map pairs ~f:(fun { name; value } ->
              "  | " ^ safeConstructorName (Option.value name ~default:value))
         |> String.concat ~sep:"\n")
   | _ -> "string")
  [@ns.braces]

let generateMember (m : Shape.member) ?(genDoc = false) () =
  (let safeName = safeMemberName m.name in
   let required = Trait.hasTrait m.traits Trait.isRequiredTrait in
   let valueType =
     (if required then safeTypeName m.target else safeTypeName m.target ^ " option") [@ns.ternary]
   in
   let doc =
     match genDoc with true -> Some (generateDoc m.traits) [@explicit_arity] | false -> None
   in
   generateField safeName valueType ?doc)
  [@ns.braces]

let indentString indent =
  (let is = [||] in
   Array.fill is ~len:(indent [@ns.namedArgLoc]) ~pos:(0 [@ns.namedArgLoc]) " ";
   String.concat_array is)
  [@ns.braces]

let generateStructureShape (details : Shape.structureShapeDetails) ?(genDoc = false) () =
  (generateRecordTypeDefinition
     (List.map details.members ~f:(fun member -> generateMember member ~genDoc ())) [@ns.braces])

let generateUnionShape (details : Shape.structureShapeDetails) ?(genDoc = false) () =
  let tConstructors =
    List.map details.members ~f:(fun member ->
        ((safeVariantName member.name ^ "(") ^ safeTypeName member.target) ^ ")")
  in
  let t = String.concat tConstructors ~sep:" | " in
  t

let generateListShape target = safeTypeName target ^ " list"

let generateMapShape _ (mapValue : Shape.mapKeyValue) =
  let valueType = safeTypeName mapValue.target in
  "(string * " ^ valueType ^ ") list"

exception NoServiceTrait of string
exception UnknownTimestampFormat of string

let generateSetShape (details : Shape.setShapeDetails) = "list(" ^ safeTypeName details.target ^ ")"

let generateTimestampShape ({ traits } : Shape.timestampShapeDetails) =
  (let timestampFormat =
     Trait.findTrait (Option.value traits ~default:[]) Trait.isTimestampFormatTrait
   in
   match timestampFormat with
   | ((Some ((TimestampFormatTrait "date-time") [@explicit_arity])) [@explicit_arity]) ->
       {js|float|js}
   | ((Some ((TimestampFormatTrait "epoch-seconds") [@explicit_arity])) [@explicit_arity]) ->
       {js|float;|js}
   | _ -> {js|float|js})
  [@ns.braces]

type operationStructure =
  | OperationStructure of Shape.structureShapeDetails
  | OperationStructureRef of string
  | OperationStructureNone

let generateOperationStructureType varName opStruct ?(genDoc = false) () =
  match opStruct with
  | ((OperationStructure details) [@explicit_arity]) ->
      (let docs = generateDoc details.traits in
       docs ^ generateType ({js|#|js} ^ varName) (generateStructureShape details ~genDoc ()))
      [@ns.braces]
  | ((OperationStructureRef name) [@explicit_arity]) ->
      generateType ({js|#|js} ^ varName) (safeTypeName name)
  | OperationStructureNone ->
      generateType ({js|#|js} ^ varName)
        (generateStructureShape { traits = None; members = [] } ~genDoc ()) [@ns.braces]

let isOperationStructureNone opStruct =
  match opStruct with OperationStructureNone -> true | _ -> false

let generateMake input =
  match input with
  | ((OperationStructure { members; _ }) [@explicit_arity]) ->
      (let requiredMembers, optionalMembers =
         List.partition_tf members ~f:(fun x -> Trait.hasTrait x.traits Trait.isRequiredTrait)
       in
       let requiredArguments =
         List.map requiredMembers ~f:(fun member -> {js|~|js} ^ safeMemberName member.name)
       in
       let optionalArguments =
         List.map optionalMembers ~f:(fun member ->
             ({js|~|js} ^ safeMemberName member.name) ^ {js|=?|js})
       in
       let arguments =
         List.concat [ requiredArguments; optionalArguments ] |> String.concat ~sep:", "
       in
       let fields =
         List.map members ~f:(fun member ->
             safeMemberName member.name ^ ": " ^ safeMemberName member.name)
         |> String.concat ~sep:", "
       in
       ((({js|let make = (|js} ^ arguments) ^ {js|, ()) => new({ |js}) ^ fields) ^ {js| })|js})
      [@ns.braces]
  | OperationStructureNone -> ({js|let make = () => new(Js.Obj.empty())|js} [@ns.braces])
  | OperationStructureRef _ -> ""

let generateOperationModule moduleName
    ((name, input, output) : string * operationStructure * operationStructure) ?(genDoc = false) ()
    =
  (let commandName = symbolName name ^ {js|Command|js} in
   let request = generateOperationStructureType "request" input ~genDoc () in
   let response = generateOperationStructureType "response" output ~genDoc () in
   let inputType = "request" in
   let outputType =
     (if isOperationStructureNone output then "Js.Promise.t<unit>" else "Js.Promise.t<response>")
     [@ns.ternary]
   in
   let make = generateMake input in
   ((("module " ^ symbolName name ^ " = {\\n" ^ "  type t;\\n" ^ ("  " ^ request) ^ "\\n"
    ^ ("  " ^ response) ^ "\\n"
     ^ (((("  @module(\"@aws-sdk/client" ^ moduleName) ^ "\" @new external new: (") ^ inputType)
       ^ ") => t = \"")
     ^ commandName)
    ^ "\";\\n")
   ^ ("  " ^ make) ^ {js|\\n|js})
   ^ ({js|  @send external send: (awsServiceClient, t) => |js} ^ outputType)
   ^ {js| = "send";\\n|js} ^ {js|}\\n|js})
  [@ns.braces]

let generateEnumShape (details : Shape.enumShapeDetails) =
  details.members
  |> List.map ~f:(fun ({ name; _ } : Shape.member) -> "| " ^ (name |> safeConstructorName))
  |> String.concat ~sep:"\n  "

let generateTypeTarget descriptor ?(genDoc = false) () =
  let open Shape in
  match descriptor with
  | StringShape details -> generateStringShape details
  | StructureShape details -> generateStructureShape details ~genDoc ()
  | ListShape { target; _ } -> generateListShape target
  | IntegerShape _ -> generateIntegerShape ()
  | LongShape _ -> generateLongShape ()
  | DoubleShape _ -> generateDoubleShape ()
  | FloatShape _ -> generateFloatShape ()
  | BooleanShape _ -> generateBooleanShape ()
  | BlobShape _ -> generateBinaryShape ()
  | BigIntegerShape _ -> generateBigIntegerShape ()
  | BigDecimalShape _ -> generateBigDecimalShape ()
  | MapShape details -> generateMapShape details.mapKey details.mapValue
  | ServiceShape _ -> ""
  | UnionShape details -> generateUnionShape details ~genDoc ()
  | TimestampShape details -> generateTimestampShape details
  | ResourceShape -> ""
  | OperationShape _ -> ""
  | UnitShape -> ""
  | SetShape details -> generateSetShape details
  | EnumShape details -> generateEnumShape details

let getStructureShape =
  let open Shape in
  function
  | ((StructureShape details) [@explicit_arity]) -> Some details [@explicit_arity] | _ -> None

let generateExceptionBlock name _ =
  "exception " ^ safeConstructorName name ^ " of Aws.emptyErrorDetails Aws.apiError"

let generateTypeBlock ({ name; descriptor } : Shape.t) ?(genDoc = false) () =
  let docs =
    match genDoc with true -> generateDoc (Shape.getShapeTraits descriptor) | false -> ""
  in
  let result = generateTypeTarget descriptor ~genDoc:false () in
  let t = (if String.equal result "" then "" else generateType name result) [@ns.ternary] in
  match descriptor with
  | ((StructureShape details)
  [@explicit_arity])
    when Trait.hasTrait details.traits Trait.isErrorTrait ->
      docs ^ generateExceptionBlock name details
  | _ -> docs ^ t

let generateRecursiveTypeBlock (shapes : Shape.t list) ?(genDoc = false) () =
  let shapeTypes =
    List.map shapes ~f:(fun shape ->
        (safeTypeName shape.name ^ " = ") ^ generateTypeTarget shape.descriptor ~genDoc ())
  in
  let shapeModules =
    shapes
    |> List.filter_map ~f:(fun Shape.{ name; descriptor } -> match descriptor with _ -> None)
    |> String.concat ~sep:"\n"
  in
  "type " ^ String.concat shapeTypes ~sep:" and " ^ shapeModules
