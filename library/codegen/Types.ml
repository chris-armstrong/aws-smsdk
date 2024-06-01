open Base
open SafeNames
open Ast

type t = (string, string) Hashtbl.t

let resolve ctx target =
  Fmt.pr "Resolving %s\n" target;
  Hashtbl.find ctx target |> Option.value_or_thunk ~default:(fun () -> safeTypeName target)

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
           match trait with Trait.DocumentationTrait str -> Some str | _ -> None)
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
   | Some (EnumTrait pairs) ->
       "\n"
       ^ (List.map pairs ~f:(fun { name; value } ->
              "  | " ^ safeConstructorName (Option.value name ~default:value))
         |> String.concat ~sep:"\n")
   | _ -> "string")
  [@ns.braces]

let generateMember ctx (m : Shape.member) ?(genDoc = false) () =
  (let safeName = safeMemberName m.name in
   let required = Trait.hasTrait m.traits Trait.isRequiredTrait in
   let resolved_target = m.target |> resolve ctx in
   let valueType =
     (if required then resolved_target else resolved_target ^ " option") [@ns.ternary]
   in
   let doc = match genDoc with true -> Some (generateDoc m.traits) | false -> None in
   generateField safeName valueType ?doc)
  [@ns.braces]

let indentString indent =
  (let is = [||] in
   Array.fill is ~len:(indent [@ns.namedArgLoc]) ~pos:(0 [@ns.namedArgLoc]) " ";
   String.concat_array is)
  [@ns.braces]

let generateStructureShape ctx (details : Shape.structureShapeDetails) ?(genDoc = false) () =
  let is_error = Trait.hasTrait details.traits Trait.isErrorTrait in
  let record_type_definition =
    generateRecordTypeDefinition
      (List.map details.members ~f:(fun member -> generateMember ctx member ~genDoc ()))
  in
  record_type_definition

let generateUnionShape ctx (details : Shape.structureShapeDetails) ?(genDoc = false) () =
  let tConstructors =
    List.map details.members ~f:(fun member ->
        let resolved = member.target |> resolve ctx in

        (safeVariantName member.name ^ " of ") ^ resolved)
  in
  let t = String.concat tConstructors ~sep:" | " in
  t

let generateListShape ctx target =
  let resolved = target |> resolve ctx in
  resolved ^ " list"

let generateMapShape ctx _ (mapValue : Shape.mapKeyValue) =
  let valueType = mapValue.target |> resolve ctx in
  "(string * " ^ valueType ^ ") list"

exception NoServiceTrait of string
exception UnknownTimestampFormat of string

let generateSetShape ctx (details : Shape.setShapeDetails) =
  let valueType = details.target |> resolve ctx in
  valueType ^ " list"

let generateTimestampShape ({ traits } : Shape.timestampShapeDetails) =
  (let timestampFormat =
     Trait.findTrait (Option.value traits ~default:[]) Trait.isTimestampFormatTrait
   in
   match timestampFormat with
   | Some (TimestampFormatTrait "date-time") -> {js|float|js}
   | Some (TimestampFormatTrait "epoch-seconds") -> {js|float;|js}
   | _ -> {js|float|js})
  [@ns.braces]

let generateEnumShape (details : Shape.enumShapeDetails) =
  details.members
  |> List.map ~f:(fun ({ name; _ } : Shape.member) -> "| " ^ (name |> safeConstructorName))
  |> String.concat ~sep:"\n  "

(** Generate the type declaration for descriptor (minus the {%type =%}) *)
let generateTypeTarget ctx descriptor ?(genDoc = false) () =
  let open Shape in
  match descriptor with
  | StringShape details -> generateStringShape details
  | StructureShape details -> generateStructureShape ctx details ~genDoc ()
  | ListShape { target; _ } -> generateListShape ctx target
  | IntegerShape _ -> generateIntegerShape ()
  | LongShape _ -> generateLongShape ()
  | DoubleShape _ -> generateDoubleShape ()
  | FloatShape _ -> generateFloatShape ()
  | BooleanShape _ -> generateBooleanShape ()
  | BlobShape _ -> generateBinaryShape ()
  | BigIntegerShape _ -> generateBigIntegerShape ()
  | BigDecimalShape _ -> generateBigDecimalShape ()
  | MapShape details -> generateMapShape ctx details.mapKey details.mapValue
  | ServiceShape _ -> ""
  | UnionShape details -> generateUnionShape ctx details ~genDoc ()
  | TimestampShape details -> generateTimestampShape details
  | ResourceShape -> ""
  | OperationShape _ -> ""
  | UnitShape -> "unit"
  | SetShape details -> generateSetShape ctx details
  | EnumShape details -> generateEnumShape details

let getStructureShape =
  let open Shape in
  function StructureShape details -> Some details | _ -> None

let should_generate_type_block descriptor =
  let open Shape in
  match descriptor with
  | UnitShape | ListShape _ | BlobShape _ | BooleanShape _ | IntegerShape _ | StringShape _
  | BigIntegerShape _ | BigDecimalShape _ | MapShape _ | ResourceShape | TimestampShape _
  | LongShape _ | FloatShape _ | DoubleShape _ | SetShape _ ->
      false
  | _ -> true

let generate_type ctx ({ name; descriptor } : Shape.t) ?(genDoc = false) () =
  if should_generate_type_block descriptor then begin
    let docs =
      match genDoc with true -> generateDoc (Shape.getShapeTraits descriptor) | false -> ""
    in
    let result = generateTypeTarget ctx descriptor ~genDoc:false () in
    let is_exception_type =
      match descriptor with
      | StructureShape s when Trait.(hasTrait s.traits isErrorTrait) -> true
      | _ -> false
    in
    let t = if String.equal result "" then "" else generateType name result ~is_exception_type in
    Some (docs ^ t)
  end
  else None

let generate_recursive_types ctx (shapes : Shape.t list) ?(genDoc = false) () =
  let shapeTypes =
    shapes
    |> List.filter ~f:(fun shape -> should_generate_type_block Shape.(shape.descriptor))
    |> List.map ~f:(fun (shape : Shape.t) ->
           (safeTypeName shape.name ^ " = ") ^ generateTypeTarget ctx shape.descriptor ~genDoc ())
  in

  if List.length shapeTypes > 0 then Some ("type " ^ String.concat shapeTypes ~sep:" and ")
  else None

let create_alias_context shapes : t =
  let tbl = Hashtbl.create ~growth_allowed:true ~size:(List.length shapes / 2) (module String) in
  List.iter
    ~f:(fun Ast.Shape.{ name; descriptor; _ } ->
      match descriptor with
      | UnitShape | ListShape _ | BlobShape _ | BooleanShape _ | IntegerShape _ | StringShape _
      | BigIntegerShape _ | BigDecimalShape _ | MapShape _ | ResourceShape | TimestampShape _
      | LongShape _ | FloatShape _ | DoubleShape _ | SetShape _ ->
          let alias = generateTypeTarget tbl descriptor () in
          Fmt.pr "Aliasing %s -> %s\n" name alias;
          ignore (Hashtbl.add ~key:name ~data:alias tbl)
      | _ -> ())
    shapes;
  tbl
