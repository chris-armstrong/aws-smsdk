open Base
open SafeNames
open Shape

exception UnexpectedType of string

let generateSerialiserFuncName name = SafeNames.safeFunctionName (name ^ "_to_yojson")

let rec generateStructureSerialiserFuncBody fmt name (descriptor : structureShapeDetails) =
  Fmt.pf fmt "fun (x: %s) -> assoc_to_yojson(@;<0 2>[@[<v 2>" (SafeNames.safeTypeName name);
  List.iter descriptor.members ~f:(fun { name; target; traits } ->
      let isRequired = Trait.hasTrait traits Trait.isRequiredTrait in
      let extractedValue =
        if isRequired then
          "(Some (" ^ generateSerialiserFuncName target ^ " x." ^ SafeNames.safeMemberName name
          ^ "))"
        else
          "(option_to_yojson " ^ generateSerialiserFuncName target ^ " x."
          ^ SafeNames.safeMemberName name ^ ")"
      in
      Fmt.pf fmt "(@;<0 2>\"%s\",@;<0 2>%s);@;" name extractedValue);
  Fmt.pf fmt "@]@;])"

and generateUnionSerialiserFuncBody fmt name (descriptor : Shape.structureShapeDetails) =
  Fmt.pf fmt "fun (x: %s) -> @\n@[<v 2>" (SafeNames.safeTypeName name);
  Fmt.pf fmt "match x with @\n@[<v 2>";
  List.iter descriptor.members ~f:(fun member ->
      Fmt.pf fmt "| %s(arg) -> assoc_to_yojson [(\"%s\", Some (%s arg)]@\n"
        (SafeNames.safeConstructorName member.name)
        member.name
        (generateSerialiserFuncName member.target));
  Fmt.pf fmt "@\n@]";
  Fmt.pf fmt "@\n@]"

and generateStringSerialiserFuncBody fmt name (stringDescriptor : Shape.primitiveShapeDetails) =
  if Trait.hasTrait stringDescriptor.traits Trait.isEnumTrait then (
    let enumValue =
      stringDescriptor.traits |> Option.value ~default:[]
      |> List.filter_map ~f:(function
           | ((Trait.EnumTrait x) [@explicit_arity]) -> Some x [@explicit_arity]
           | _ -> None)
      |> List.hd_exn
    in
    Fmt.pf fmt "(x: %s) => @,@[<v 2>switch (x) {@,@[<v 2>" (SafeNames.safeTypeName name);
    enumValue
    |> List.iter ~f:(fun Trait.{ name; value } ->
           Fmt.pf fmt "| %s => `String(\"%s\")@;"
             (safeVariantName (Option.value name ~default:value))
             value);
    Fmt.pf fmt "@\n@]}@]")
  else Fmt.pf fmt "string_to_yojson"

and generateSerialiserFuncBody fmt name shapeDescriptor =
  match shapeDescriptor with
  | ((StructureShape x) [@explicit_arity]) -> generateStructureSerialiserFuncBody fmt name x
  | ((StringShape x) [@explicit_arity]) -> generateStringSerialiserFuncBody fmt name x
  | ((IntegerShape x) [@explicit_arity]) -> Fmt.pf fmt "int_to_yojson"
  | ((BooleanShape x) [@explicit_arity]) -> Fmt.pf fmt "bool_to_yojson"
  | ((BigIntegerShape x) [@explicit_arity]) -> Fmt.pf fmt "big_int_to_yojson"
  | ((BigDecimalShape x) [@explicit_arity]) -> Fmt.pf fmt "big_decimal_to_yojson"
  | ((TimestampShape x) [@explicit_arity]) -> Fmt.pf fmt "timestamp_to_yojson"
  | ((BlobShape x) [@explicit_arity]) -> Fmt.pf fmt "blob_to_yojson"
  | ((MapShape x) [@explicit_arity]) ->
      Fmt.pf fmt "(map_to_yojson %s)" (generateSerialiserFuncName x.mapValue.target)
  | EnumShape s ->
      Fmt.pf fmt "fun (x: %s) -> match x with @.@;@;@[<v 2>" (safeTypeName name);
      List.iter
        ~f:(fun { name; traits; _ } ->
          let value =
            List.find_map_exn
              ~f:(fun (t : Trait.t) -> match t with Trait.EnumValueTrait e -> Some e | _ -> None)
              (traits |> Option.value ~default:[])
          in
          Fmt.pf fmt "| %s -> `String \"%s\"@;" (safeConstructorName name) value)
        s.members;
      Fmt.pf fmt "@]@;"
  | UnionShape x -> generateUnionSerialiserFuncBody fmt name x
  | SetShape x -> Fmt.pf fmt "(list_to_yojson %s)" (generateSerialiserFuncName x.target)
  | LongShape x -> Fmt.pf fmt "long_to_yojson"
  | ListShape x -> Fmt.pf fmt "(list_to_yojson %s)" (generateSerialiserFuncName x.target)
  | FloatShape x -> Fmt.pf fmt "float_to_yojson"
  | DoubleShape x -> Fmt.pf fmt "double_to_yojson"
  | ServiceShape x -> ()
  | _ -> raise (UnexpectedType name)

let descriptorHasBody = function
  | StructureShape x -> not (Trait.hasTrait x.traits Trait.isErrorTrait)
  | StringShape _ | IntegerShape _ | BooleanShape _ | BigIntegerShape _ | BigDecimalShape _
  | TimestampShape _ | BlobShape _ | MapShape _ | UnionShape _ | SetShape _ | LongShape _
  | ListShape _ | FloatShape _ | DoubleShape _ | EnumShape _ ->
      true
  | UnitShape | ResourceShape | OperationShape _ | ServiceShape _ -> false

let generateSerialisers ~(structure_shapes : Dependencies.shapeWithTarget list) fmt =
  (* Fmt.pf fmt "module Serialize = {@\n@[<2>"; *)
  Fmt.pf fmt "open Aws_SmSdk_Lib.Json.SerializeHelpers@\n@\n";
  Fmt.pf fmt "open Types@\n@\n";
  structure_shapes
  |> List.iter ~f:(fun Dependencies.{ name; descriptor; recursWith; _ } ->
         let to_func = generateSerialiserFuncName name in
         match recursWith with
         | Some others ->
             Fmt.pf fmt "let rec@ %s@ =@ @;<0 2>@[<v 0>" to_func;
             generateSerialiserFuncBody fmt name descriptor;
             List.iter others ~f:(fun other ->
                 if descriptorHasBody other.descriptor then (
                   Fmt.pf fmt "@]@\n@\nand %s =@ @;<0 2>@[<v 0>"
                     (generateSerialiserFuncName other.name);
                   generateSerialiserFuncBody fmt other.name other.descriptor));
             Fmt.pf fmt "@]@\n@\n"
         | None ->
             if descriptorHasBody descriptor then (
               Fmt.pf fmt "let@ %s@ =@ @;<0 2>@[<v 0>" to_func;
               generateSerialiserFuncBody fmt name descriptor;
               Fmt.pf fmt "@]@\n@\n"))

(* Fmt.pf fmt "@]@\n}@\n" *)
let generateOperations fmt serviceName operationShapes =
  operationShapes
  |> List.filter_map ~f:(function
       | Dependencies.{ name; descriptor = OperationShape os; _ } -> Some (name, os)
       | _ -> None)
  |> List.iter ~f:(fun (name, os) ->
         Fmt.pf fmt "module %s = struct@;<0 2>@[<v>" (SafeNames.safeConstructorName name);
         let requestShape =
           os.input
           |> Option.map ~f:(fun input -> Fmt.str "request: %s" (SafeNames.safeTypeName input))
           |> Option.value ~default:""
         in
         Fmt.pf fmt "let request = (client, %s) => {@;<0 2>@[<v>" requestShape;
         Fmt.pf fmt "open Lwt.Syntax;@\n";
         Fmt.pf fmt "let input = %s;@\n"
           (os.input
           |> Option.map ~f:(fun input ->
                  Fmt.str "Serialize.%s_to_yojson(request)" (SafeNames.safeTypeName input))
           |> Option.value ~default:"`Assoc([])");
         let serviceShape = Fmt.str "%s.%s" (Util.symbolName serviceName) (Util.symbolName name) in
         Fmt.pf fmt "AwsJson.make_request(@;<0 2>@[<v>~shapeName=\"%s\",@;" serviceShape;
         Fmt.pf fmt "~service,@;~config=client.config,@;~input,@]@;);@\n";
         Fmt.pf fmt "@]@;}@\n";
         Fmt.pf fmt "@]@\nend@\n@\n")
