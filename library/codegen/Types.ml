open Base
open SafeNames
open Ast

let type_name ~is_exception_type name =
  Fmt.str "%s%s" (safeTypeName name) (if is_exception_type then "_exception_details" else "")

let generateType name definition ~is_exception_type =
  Fmt.str "type %s = %s" (type_name ~is_exception_type name) definition

let generateField ?doc fieldName typeName =
  ((Option.value_map doc ~default:"" ~f:(fun x -> x ^ " ") ^ safeMemberName fieldName) ^ ": ")
  ^ typeName

let generateRecordTypeDefinition members =
  if List.is_empty members then "unit" else ("{\n  " ^ String.concat members ~sep:";\n  ") ^ "\n}"

let reBSlashBSlash = Str.regexp "\\\\"
let reBSlashDQuote = Str.regexp "\\\""

let escapeString str =
  (str |> fun __x -> Str.global_replace reBSlashBSlash "\\\\" __x) |> fun __x ->
  Str.global_replace reBSlashDQuote "\\\"" __x

let generateDoc traits =
  let docStrs =
    traits |> Option.value ~default:[]
    |> List.filter_map ~f:(fun trait ->
           match trait with
           | ((Trait.DocumentationTrait str) [@explicit_arity]) -> Some str [@explicit_arity]
           | _ -> None)
  in
  let docs = String.concat docStrs ~sep:"" in
  if not (String.is_empty docs) then ("(** {%html:" ^ docs) ^ " %} *)\n" else ""

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
  let is_error = Trait.hasTrait details.traits Trait.isErrorTrait in
  let record_type_definition =
    generateRecordTypeDefinition
      (List.map details.members ~f:(fun member -> generateMember member ~genDoc ()))
  in
  record_type_definition

let generateUnionShape (details : Shape.structureShapeDetails) ?(genDoc = false) () =
  let tConstructors =
    List.map details.members ~f:(fun member ->
        (safeVariantName member.name ^ " of ") ^ safeTypeName member.target)
  in
  let t = String.concat tConstructors ~sep:" | " in
  t

let generateListShape target = safeTypeName target ^ " list"

let generateMapShape _ (mapValue : Shape.mapKeyValue) =
  let valueType = safeTypeName mapValue.target in
  "(string * " ^ valueType ^ ") list"

exception NoServiceTrait of string
exception UnknownTimestampFormat of string

let generateSetShape (details : Shape.setShapeDetails) = safeTypeName details.target ^ " list"

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
  | UnitShape -> "unit"
  | SetShape details -> generateSetShape details
  | EnumShape details -> generateEnumShape details

let getStructureShape =
  let open Shape in
  function StructureShape details -> Some details | _ -> None

let generateTypeBlock ({ name; descriptor } : Shape.t) ?(genDoc = false) () =
  let docs =
    match genDoc with true -> generateDoc (Shape.getShapeTraits descriptor) | false -> ""
  in
  let result = generateTypeTarget descriptor ~genDoc:false () in
  let is_exception_type =
    match descriptor with
    | StructureShape s when Trait.(hasTrait s.traits isErrorTrait) -> true
    | _ -> false
  in
  let t = if String.equal result "" then "" else generateType name result ~is_exception_type in
  docs ^ t

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
