open Base
open SafeNames
open Ast

module Log =
  (val Logs.src_log (Logs.Src.create "parselib.codegen.types" ~doc:"AWS Smithy Codegen - Types")
      : Logs.LOG)

type t = (string, string) Hashtbl.t

let resolve ctx target =
  let resolution =
    Hashtbl.find ctx target |> Option.value_or_thunk ~default:(fun () -> safeTypeName target)
  in
  Logs.debug (fun m -> m "Resolving %s -> %s\n" target resolution);
  resolution

let type_name ~is_exception_type name =
  Fmt.str "%s%s" (safeTypeName name) (if is_exception_type then "" else "")

let generateType name definition ~is_exception_type =
  Fmt.str "type %s = %s" (type_name ~is_exception_type name) definition

let generateField fieldName typeName = (safeMemberName fieldName ^ ": ") ^ typeName
let reBSlashBSlash = Str.regexp "\\\\"
let reBSlashDQuote = Str.regexp "\\\""

let escapeString str =
  (str |> fun __x -> Str.global_replace reBSlashBSlash "\\\\" __x) |> fun __x ->
  Str.global_replace reBSlashDQuote "\\\"" __x

let generateRecordTypeDefinition ~genDoc members =
  if List.is_empty members then "unit"
  else begin
    let b = Buffer.create (if genDoc then 2048 else 500) in
    Buffer.add_string b "{\n";
    List.iter members ~f:(fun ((member, field_string) : Shape.member * string) ->
        Buffer.add_string b "  ";
        Buffer.add_string b field_string;
        Buffer.add_string b ";";
        if genDoc then (
          Buffer.add_string b "\n  ";
          let doc_string = Docs.(generate FloatingComment member.traits) in
          Option.iter doc_string ~f:(fun doc_string ->
              (* Buffer.add_string b " "; *)
              Buffer.add_string b doc_string));
        Buffer.add_string b "\n");

    Buffer.add_string b "}";
    Buffer.contents b
  end

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

let generateMember ctx (m : Shape.member) () =
  let safeName = safeMemberName m.name in
  let required = Trait.hasTrait m.traits Trait.isRequiredTrait in
  let resolved_target = m.target |> resolve ctx in
  let valueType =
    (if required then resolved_target else resolved_target ^ " option") [@ns.ternary]
  in
  generateField safeName valueType

let indentString indent =
  (let is = [||] in
   Array.fill is ~len:(indent [@ns.namedArgLoc]) ~pos:(0 [@ns.namedArgLoc]) " ";
   String.concat_array is)
  [@ns.braces]

let generateStructureShape ctx (details : Shape.structureShapeDetails) ?(genDoc = false) () =
  let is_error = Trait.hasTrait details.traits Trait.isErrorTrait in
  let record_type_definition =
    generateRecordTypeDefinition ~genDoc
      (List.map details.members ~f:(fun member -> (member, generateMember ctx member ())))
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
  | DocumentShape -> "Json.t"

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
      match genDoc with
      | true -> Docs.(generate ItemComment (Shape.getShapeTraits descriptor))
      | false -> None
    in
    let result = generateTypeTarget ctx descriptor ~genDoc () in
    let is_exception_type =
      match descriptor with
      | StructureShape s when Trait.(hasTrait s.traits isErrorTrait) -> true
      | _ -> false
    in
    let t = if String.equal result "" then "" else generateType name result ~is_exception_type in
    match docs with Some docs -> Some (docs ^ t) | None -> Some t
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
          Log.debug (fun m -> m "Aliasing %s -> %s\n" name alias);
          ignore (Hashtbl.add ~key:name ~data:alias tbl)
      | _ -> ())
    shapes;
  tbl
