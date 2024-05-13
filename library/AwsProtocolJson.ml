open Base
open SafeNames
open Shape

exception UnexpectedType of string

let has_func_body = function
  | StructureShape x -> true
  | StringShape _ | IntegerShape _ | BooleanShape _ | BigIntegerShape _ | BigDecimalShape _
  | TimestampShape _ | BlobShape _ | MapShape _ | UnionShape _ | SetShape _ | LongShape _
  | ListShape _ | FloatShape _ | DoubleShape _ | EnumShape _ | UnitShape ->
      true
  | ResourceShape | OperationShape _ | ServiceShape _ -> false

let print_shape_func ~printer ~func_name ~fmt Dependencies.{ name; descriptor; recursWith; _ } =
  let to_func = func_name name in
  match recursWith with
  | Some others ->
      Fmt.pf fmt "let rec@ %s@ =@ @;<0 2>@[<v 0>" to_func;
      printer fmt name descriptor;
      List.iter others ~f:(fun other ->
          if has_func_body other.descriptor then (
            Fmt.pf fmt "@]@\n@\nand %s@ =@ @;<0 2>@[<v 0>" (func_name other.name);
            printer fmt other.name other.descriptor));
      Fmt.pf fmt "@]@\n@\n"
  | None ->
      if has_func_body descriptor then (
        Fmt.pf fmt "let@ %s@ =@ @;<0 2>@[<v 0>" to_func;
        printer fmt name descriptor;
        Fmt.pf fmt "@]@\n@\n")

module Serialiser = struct
  let func_name name = SafeNames.safeFunctionName (name ^ "_to_yojson")

  let rec structure_func_body fmt name (descriptor : structureShapeDetails) =
    Fmt.pf fmt "fun (x: %s) -> assoc_to_yojson(@;<0 2>[@[<v 2>" (SafeNames.safeTypeName name);
    List.iter descriptor.members ~f:(fun { name; target; traits } ->
        let isRequired = Trait.hasTrait traits Trait.isRequiredTrait in
        let extractedValue =
          if isRequired then
            "(Some (" ^ func_name target ^ " x." ^ SafeNames.safeMemberName name ^ "))"
          else "(option_to_yojson " ^ func_name target ^ " x." ^ SafeNames.safeMemberName name ^ ")"
        in
        Fmt.pf fmt "(@;<0 2>\"%s\",@;<0 2>%s);@;" name extractedValue);
    Fmt.pf fmt "@]@;])"

  and union_func_body fmt name (descriptor : Shape.structureShapeDetails) =
    Fmt.pf fmt "fun (x: %s) -> @\n@[<v 2>" (SafeNames.safeTypeName name);
    Fmt.pf fmt "match x with @\n@[<v 2>";
    List.iter descriptor.members ~f:(fun member ->
        Fmt.pf fmt "| %s(arg) -> assoc_to_yojson [(\"%s\", Some (%s arg)]@\n"
          (SafeNames.safeConstructorName member.name)
          member.name (func_name member.target));
    Fmt.pf fmt "@\n@]";
    Fmt.pf fmt "@\n@]"

  and string_func_body fmt name (stringDescriptor : Shape.primitiveShapeDetails) =
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

  and func_body fmt name shapeDescriptor =
    match shapeDescriptor with
    | ((StructureShape x) [@explicit_arity]) -> structure_func_body fmt name x
    | ((StringShape x) [@explicit_arity]) -> string_func_body fmt name x
    | ((IntegerShape x) [@explicit_arity]) -> Fmt.pf fmt "int_to_yojson"
    | ((BooleanShape x) [@explicit_arity]) -> Fmt.pf fmt "bool_to_yojson"
    | ((BigIntegerShape x) [@explicit_arity]) -> Fmt.pf fmt "big_int_to_yojson"
    | ((BigDecimalShape x) [@explicit_arity]) -> Fmt.pf fmt "big_decimal_to_yojson"
    | ((TimestampShape x) [@explicit_arity]) -> Fmt.pf fmt "timestamp_to_yojson"
    | ((BlobShape x) [@explicit_arity]) -> Fmt.pf fmt "blob_to_yojson"
    | ((MapShape x) [@explicit_arity]) ->
        Fmt.pf fmt "(map_to_yojson %s)" (func_name x.mapValue.target)
    | EnumShape s ->
        Fmt.pf fmt "fun (x: %s) -> match x with @.@;@;@[<v 2>" (safeTypeName name);
        List.iter
          ~f:(fun { name; traits; _ } ->
            let value =
              List.find_map_exn
                ~f:(fun (t : Trait.t) ->
                  match t with Trait.EnumValueTrait e -> Some e | _ -> None)
                (traits |> Option.value ~default:[])
            in
            Fmt.pf fmt "| %s -> `String \"%s\"@;" (safeConstructorName name) value)
          s.members;
        Fmt.pf fmt "@]@;"
    | UnionShape x -> union_func_body fmt name x
    | SetShape x -> Fmt.pf fmt "(list_to_yojson %s)" (func_name x.target)
    | LongShape x -> Fmt.pf fmt "long_to_yojson"
    | ListShape x -> Fmt.pf fmt "(list_to_yojson %s)" (func_name x.target)
    | FloatShape x -> Fmt.pf fmt "float_to_yojson"
    | DoubleShape x -> Fmt.pf fmt "double_to_yojson"
    | ServiceShape x -> ()
    | UnitShape -> Fmt.pf fmt "unit_to_yojson"
    | _ -> raise (UnexpectedType name)

  let generate ~(structure_shapes : Dependencies.shapeWithTarget list) fmt =
    (* Fmt.pf fmt "module Serialize = {@\n@[<2>"; *)
    Fmt.pf fmt "open Aws_SmSdk_Lib.Json.SerializeHelpers@\n@\n";
    Fmt.pf fmt "open Types@\n@\n";
    structure_shapes
    |> List.iter ~f:(fun shapeWithTarget ->
           print_shape_func ~printer:func_body ~func_name ~fmt shapeWithTarget)
end

module Deserialiser = struct
  let func_name ?(is_exception_type = false) name =
    SafeNames.safeFunctionName name
    ^ (if is_exception_type then "_exception_details" else "")
    ^ "_of_yojson"

  let rec structure_func_body fmt name (x : structureShapeDetails) =
    let open Shape in
    Fmt.pf fmt "fun tree path ->@;let _list = assoc_of_yojson tree path in@;";
    Fmt.pf fmt "let _res : %s = {@ @[<v 2>@;" (SafeNames.safeTypeName name);

    List.iter x.members ~f:(fun { name; target; traits } ->
        let isRequired = Trait.hasTrait traits Trait.isRequiredTrait in
        let converter_name = func_name ~is_exception_type:false target in
        let key_name = SafeNames.safeMemberName name in

        Fmt.pf fmt "%s" key_name;
        Fmt.pf fmt " = ";
        if not isRequired then Fmt.pf fmt "option_of_yojson (";

        Fmt.pf fmt "value_for_key (%s) \"%s\"" converter_name name;
        if not isRequired then Fmt.pf fmt ")";
        Fmt.pf fmt " _list path";
        Fmt.pf fmt ";@;");

    Fmt.pf fmt "@]@;} in _res"

  and string_func_body fmt name x = Fmt.pf fmt "string_of_yojson"
  and union_func_body fmt name x = ()

  and enum_func_body fmt name s =
    Fmt.pf fmt "fun (tree: t) path -> match tree with @;@[<v 2>@;";
    List.iter
      ~f:(fun { name; traits; _ } ->
        let value =
          List.find_map_exn
            ~f:(fun (t : Trait.t) -> match t with Trait.EnumValueTrait e -> Some e | _ -> None)
            (traits |> Option.value ~default:[])
        in
        Fmt.pf fmt "| `String \"%s\" -> %s@;" value (safeConstructorName name))
      s.members;

    Fmt.pf fmt "| `String value -> raise (deserialize_unknown_enum_value_error path \"%s\" value)@;"
      (SafeNames.safeTypeName name);
    Fmt.pf fmt "| _ -> raise (deserialize_wrong_type_error path \"%s\")@]"
      (SafeNames.safeTypeName name)

  and func_body fmt name shapeDescriptor =
    match shapeDescriptor with
    | StructureShape x -> structure_func_body fmt name x
    | StringShape x -> string_func_body fmt name x
    | IntegerShape x -> Fmt.pf fmt "int_of_yojson"
    | BooleanShape x -> Fmt.pf fmt "bool_of_yojson"
    | BigIntegerShape x -> Fmt.pf fmt "big_int_of_yojson"
    | BigDecimalShape x -> Fmt.pf fmt "big_decimal_of_yojson"
    | TimestampShape x -> Fmt.pf fmt "timestamp_of_yojson"
    | BlobShape x -> Fmt.pf fmt "blob_of_yojson"
    | MapShape x -> Fmt.pf fmt "(map_of_yojson %s)" (func_name x.mapValue.target)
    | EnumShape s -> enum_func_body fmt name s
    | UnionShape x -> union_func_body fmt name x
    | SetShape x -> Fmt.pf fmt "(list_of_yojson %s)" (func_name x.target)
    | LongShape x -> Fmt.pf fmt "long_of_yojson"
    | ListShape x -> Fmt.pf fmt "(list_of_yojson %s)" (func_name x.target)
    | FloatShape x -> Fmt.pf fmt "float_of_yojson"
    | DoubleShape x -> Fmt.pf fmt "double_of_yojson"
    | UnitShape -> Fmt.pf fmt "unit_of_yojson"
    | ServiceShape x -> ()
    | _ -> raise (UnexpectedType name)

  let generate ~name ~structure_shapes fmt =
    Fmt.pf fmt "open Aws_SmSdk_Lib.Json.DeserializeHelpers@\n@\n";
    Fmt.pf fmt "open Types@\n@\n";
    structure_shapes
    |> List.iter ~f:(fun shapeWithTarget ->
           print_shape_func ~printer:func_body
             ~func_name:(fun s ->
               let is_exception_type =
                 match Dependencies.(shapeWithTarget.descriptor) with
                 | StructureShape s when Trait.(hasTrait s.traits isErrorTrait) -> true
                 | _ -> false
               in
               func_name ~is_exception_type s)
             ~fmt shapeWithTarget)
end

module Operations = struct
  let generate ~name ~operation_shapes fmt =
    Fmt.pf fmt "open Aws_SmSdk_Lib @\n";
    Fmt.pf fmt "open Types @\n";
    Fmt.pf fmt "let (let+) res map = Result.map map res@\n";
    operation_shapes
    (* |> List.filter_map ~f:(function *)
    (*      | Dependencies.{ name; descriptor = OperationShape os; _ } -> Some (name, os) *)
    (*      | _ -> None) *)
    |> List.iter ~f:(fun (operation_name, os, dependencies) ->
           Fmt.pf fmt "module %s = struct@;<0 2>@[<v>"
             (SafeNames.safeConstructorName operation_name);
           let request_shape =
             os.input
             |> Option.map ~f:(fun input -> Fmt.str "(request: %s)" (SafeNames.safeTypeName input))
             |> Option.value ~default:""
           in
           Fmt.pf fmt "let error_deserializer tree path = @[<v 2>@;";
           Fmt.pf fmt "let _obj = Json.DeserializeHelpers.assoc_of_yojson tree path in@;";
           Fmt.pf fmt
             "let _type = Json.DeserializeHelpers.value_for_key \
              Json.DeserializeHelpers.string_of_yojson \"__type\" _obj in@;";
           Fmt.pf fmt "Result.map (function @[<v 2>@;";
           List.iter
             ~f:(fun exc ->
               let exc_name = exc in
               let constructor_name = SafeNames.safeConstructorName exc in
               let deserializer_func_name = Deserialiser.func_name exc ~is_exception_type:true in
               Fmt.pf fmt "| \"%s\" -> (`%s (Deserializers.%s _obj))@;" exc_name constructor_name
                 deserializer_func_name)
             (os.errors |> Option.value ~default:[]);
           Fmt.pf fmt "@]) _type@]@\n";
           let response_shape_deserialiser =
             os.output
             |> Option.map ~f:(fun output -> Deserialiser.func_name output)
             |> Option.value ~default:"base_unit_of_yojson"
           in
           Fmt.pf fmt "let request = fun context %s ->@;<0 2>@[<v>" request_shape;
           Fmt.pf fmt "let input = %s in@\n"
             (os.input
             |> Option.map ~f:(fun input ->
                    Fmt.str "Serializers.%s_to_yojson request" (SafeNames.safeTypeName input))
             |> Option.value ~default:"`Assoc([])");
           let serviceShape =
             Fmt.str "%s.%s" (Util.symbolName name) (Util.symbolName operation_name)
           in
           Fmt.pf fmt "AwsJson.make_request @;<0 2>@[<v>~shape_name:\"%s\" @;" serviceShape;
           Fmt.pf fmt "~service @;~context @;~input@\n";
           Fmt.pf fmt "~output_deserializer:Deserializers.%s@\n" response_shape_deserialiser;
           Fmt.pf fmt "~error_deserializer@\n";
           Fmt.pf fmt "@]@]@]@\nend@\n@\n")
end
