open Base
open SafeNames
open Ast.Shape
open Ast.Trait
open Ast.Dependencies

exception UnexpectedType of string

let has_func_body = function
  | StructureShape x -> true
  | StringShape _ | IntegerShape _ | BooleanShape _ | BigIntegerShape _ | BigDecimalShape _
  | TimestampShape _ | BlobShape _ | MapShape _ | UnionShape _ | SetShape _ | LongShape _
  | ListShape _ | FloatShape _ | DoubleShape _ | EnumShape _ | UnitShape ->
      true
  | ResourceShape | OperationShape _ | ServiceShape _ -> false

let print_shape_func ~printer ~func_name ~fmt { name; descriptor; recursWith; _ } =
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
  let func_name ?(is_exception_type = false) name =
    let exception_extension = if is_exception_type then "_exception_details" else "" in
    Fmt.str "%s%s_to_yojson" (SafeNames.safeFunctionName name) exception_extension

  let rec structure_func_body fmt name (descriptor : structureShapeDetails) =
    let is_exception_type = hasTrait descriptor.traits isErrorTrait in
    Fmt.pf fmt "fun (x: %s) -> assoc_to_yojson(@;<0 2>[@[<v 2>"
      (Types.type_name ~is_exception_type name);
    List.iter descriptor.members ~f:(fun { name; target; traits } ->
        let isRequired = hasTrait traits isRequiredTrait in
        let extractedValue =
          if isRequired then
            "(Some (" ^ func_name target ^ " x." ^ SafeNames.safeMemberName name ^ "))"
          else "(option_to_yojson " ^ func_name target ^ " x." ^ SafeNames.safeMemberName name ^ ")"
        in
        Fmt.pf fmt "(@;<0 2>\"%s\",@;<0 2>%s);@;" name extractedValue);
    Fmt.pf fmt "@]@;])"

  and union_func_body fmt name (descriptor : structureShapeDetails) =
    Fmt.pf fmt "fun (x: %s) -> @\n@[<v 2>" (SafeNames.safeTypeName name);
    Fmt.pf fmt "match x with @\n@[<v 2>";
    List.iter descriptor.members ~f:(fun member ->
        Fmt.pf fmt "| %s(arg) -> assoc_to_yojson [\"%s\", Some (%s arg)]@\n"
          (SafeNames.safeConstructorName member.name)
          member.name (func_name member.target));
    Fmt.pf fmt "@\n@]";
    Fmt.pf fmt "@\n@]"

  and string_func_body fmt name (stringDescriptor : primitiveShapeDetails) =
    Fmt.pf fmt "string_to_yojson"

  and enum_func_body fmt name (s : enumShapeDetails) =
    Fmt.pf fmt "fun (x: %s) -> match x with @.@;@;@[<v 2>" (safeTypeName name);
    List.iter
      ~f:(fun { name; traits; _ } ->
        let value =
          List.find_map_exn
            ~f:(fun (t : Ast.Trait.t) -> match t with EnumValueTrait e -> Some e | _ -> None)
            (traits |> Option.value ~default:[])
        in
        Fmt.pf fmt "| %s -> `String \"%s\"@;" (safeConstructorName name) value)
      s.members;
    Fmt.pf fmt "@]@;"

  and func_body fmt name shapeDescriptor =
    match shapeDescriptor with
    | StructureShape x -> structure_func_body fmt name x
    | StringShape x -> string_func_body fmt name x
    | IntegerShape x -> Fmt.pf fmt "int_to_yojson"
    | BooleanShape x -> Fmt.pf fmt "bool_to_yojson"
    | BigIntegerShape x -> Fmt.pf fmt "big_int_to_yojson"
    | BigDecimalShape x -> Fmt.pf fmt "big_decimal_to_yojson"
    | TimestampShape x -> Fmt.pf fmt "timestamp_to_yojson"
    | BlobShape x -> Fmt.pf fmt "blob_to_yojson"
    | MapShape x -> Fmt.pf fmt "fun tree -> map_to_yojson %s tree" (func_name x.mapValue.target)
    | EnumShape s -> enum_func_body fmt name s
    | UnionShape x -> union_func_body fmt name x
    | SetShape x -> Fmt.pf fmt "fun tree -> list_to_yojson %s tree" (func_name x.target)
    | LongShape x -> Fmt.pf fmt "long_to_yojson"
    | ListShape x -> Fmt.pf fmt "fun tree -> list_to_yojson %s tree" (func_name x.target)
    | FloatShape x -> Fmt.pf fmt "float_to_yojson"
    | DoubleShape x -> Fmt.pf fmt "double_to_yojson"
    | ServiceShape x -> ()
    | UnitShape -> Fmt.pf fmt "unit_to_yojson"
    | _ -> raise (UnexpectedType name)

  let generate ~(structure_shapes : shapeWithTarget list) fmt =
    Fmt.pf fmt "open %s@\n@\n" Modules.jsonSerializeHelpers;
    Fmt.pf fmt "open Types@\n@\n";
    structure_shapes
    |> List.iter ~f:(fun shapeWithTarget ->
           let func_name str =
             let is_exception_type =
               match shapeWithTarget.descriptor with
               | StructureShape s when hasTrait s.traits isErrorTrait -> true
               | _ -> false
             in
             func_name ~is_exception_type str
           in
           print_shape_func ~printer:func_body ~func_name ~fmt shapeWithTarget)
end

module Deserialiser = struct
  let func_name ?(is_exception_type = false) name =
    SafeNames.safeFunctionName name
    ^ (if is_exception_type then "_exception_details" else "")
    ^ "_of_yojson"

  let rec structure_func_body fmt name (x : structureShapeDetails) =
    let is_exception_type = hasTrait x.traits isErrorTrait in
    let type_name = Types.type_name ~is_exception_type name in
    Fmt.pf fmt "fun tree path : %s ->@;let _list = assoc_of_yojson tree path in@;" type_name;
    Fmt.pf fmt "let _res : %s = " type_name;

    if List.length x.members > 0 then begin
      Fmt.pf fmt "{@;<1 2>@[<v>";
      List.iter x.members ~f:(fun { name; target; traits } ->
          let isRequired = hasTrait traits isRequiredTrait in
          let converter_name = func_name ~is_exception_type:false target in
          let key_name = SafeNames.safeMemberName name in

          Fmt.pf fmt "%s" key_name;
          Fmt.pf fmt " = ";
          if not isRequired then Fmt.pf fmt "option_of_yojson (";

          Fmt.pf fmt "value_for_key (%s) \"%s\"" converter_name name;
          if not isRequired then Fmt.pf fmt ")";
          Fmt.pf fmt " _list path";
          Fmt.pf fmt ";@;");
      Fmt.pf fmt "@]@;}"
    end
    else Fmt.pf fmt "()";

    Fmt.pf fmt "@ in _res"

  and string_func_body fmt name x = Fmt.pf fmt "string_of_yojson"

  and union_func_body fmt name (x : structureShapeDetails) =
    let is_exception_type = hasTrait x.traits isErrorTrait in
    let type_name = Types.type_name ~is_exception_type name in
    Fmt.pf fmt "fun (tree: t) path : %s ->@;" type_name;
    Fmt.pf fmt "let _list = assoc_of_yojson tree path in@;";
    Fmt.pf fmt "let key, value_ = match _list with@;<1 2>@[<v 0>";
    Fmt.pf fmt "| (key, value_) :: _ -> key, value_ @;";
    Fmt.pf fmt "| _ -> raise (deserialize_wrong_type_error path \"union\")@]@;in@;";
    Fmt.pf fmt "match key with@;<1 2>@[";
    List.iter
      ~f:(fun { name; target; traits } ->
        Fmt.pf fmt "| \"%s\" -> %s (%s value_ (path))@;" name
          (SafeNames.safeConstructorName name)
          (func_name target))
      x.members;
    Fmt.pf fmt
      "| _ as unknown -> raise@[(deserialize_unknown_enum_value_error@ path@ \"%s\"@ unknown)@]"
      (name |> Util.symbolName);
    Fmt.pf fmt "@]@;"

  and enum_func_body fmt name s =
    let _type = SafeNames.safeTypeName name in
    Fmt.pf fmt "fun (tree: t) path : %s -> match tree with @;<1 2>@[<v>" _type;
    List.iter
      ~f:(fun { name; traits; _ } ->
        let value =
          List.find_map_exn
            ~f:(fun (t : Ast.Trait.t) -> match t with EnumValueTrait e -> Some e | _ -> None)
            (traits |> Option.value ~default:[])
        in
        Fmt.pf fmt "| `String \"%s\" -> %s@;" value (safeConstructorName name))
      s.members;

    Fmt.pf fmt "| `String value -> raise (deserialize_unknown_enum_value_error path \"%s\" value)@;"
      (Util.symbolName name);
    Fmt.pf fmt "| _ -> raise (deserialize_wrong_type_error path \"%s\")@]" (Util.symbolName name)

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
    | MapShape x ->
        Fmt.pf fmt "fun tree path -> map_of_yojson %s tree path" (func_name x.mapValue.target)
    | EnumShape s -> enum_func_body fmt name s
    | UnionShape x -> union_func_body fmt name x
    | SetShape x -> Fmt.pf fmt "fun tree path -> list_of_yojson %s tree path" (func_name x.target)
    | LongShape x -> Fmt.pf fmt "long_of_yojson"
    | ListShape x -> Fmt.pf fmt "fun tree path -> list_of_yojson %s tree path " (func_name x.target)
    | FloatShape x -> Fmt.pf fmt "float_of_yojson"
    | DoubleShape x -> Fmt.pf fmt "double_of_yojson"
    | UnitShape -> Fmt.pf fmt "unit_of_yojson"
    | ServiceShape x -> ()
    | _ -> raise (UnexpectedType name)

  let generate ~name ~structure_shapes fmt =
    Fmt.pf fmt "open %s@\n@\n" Modules.jsonDeserializeHelpers;
    Fmt.pf fmt "open Types@\n@\n";
    structure_shapes
    |> List.iter ~f:(fun shapeWithTarget ->
           print_shape_func ~printer:func_body
             ~func_name:(fun s ->
               let is_exception_type =
                 match shapeWithTarget.descriptor with
                 | StructureShape s when hasTrait s.traits isErrorTrait -> true
                 | _ -> false
               in
               func_name ~is_exception_type s)
             ~fmt shapeWithTarget)
end

module Operations = struct
  let generate_error_handler fmt os =
    Fmt.pf fmt "let error_deserializer tree path = @;<1 2>@[<v>";
    let errors = os.errors |> Option.value ~default:[] in
    if List.length errors > 0 then begin
      Fmt.pf fmt "let open Deserializers in@;";
      Fmt.pf fmt "let handler = fun handler tree path -> function@;<1 2>@[<v>";
      List.iter
        ~f:(fun exc ->
          let exc_namespace, exc_name = Util.symbolPair exc in
          let constructor_name = SafeNames.safeConstructorName exc in
          let deserializer_func_name = Deserialiser.func_name exc ~is_exception_type:true in
          Fmt.pf fmt "| \"%s\", \"%s\" ->@;<1 2> (`%s (%s tree path))@;" exc_namespace exc_name
            constructor_name deserializer_func_name)
        errors;
      Fmt.pf fmt "| _type -> handler tree path _type@;";
      Fmt.pf fmt "@]@ in@\n"
    end
    else Fmt.pf fmt "let handler a = a in@;";
    Fmt.pf fmt "%s.(error_deserializer (handler %s.Errors.default_handler) tree path)@\n@]@;"
      Modules.protocolAwsJson Modules.protocolAwsJson

  let generate ~name ~operation_shapes ~alias_context fmt =
    Fmt.pf fmt "open Types @\n";
    Fmt.pf fmt "let (let+) res map = Result.map map res@\n";
    operation_shapes
    |> List.iter ~f:(fun (operation_name, os, dependencies) ->
           Fmt.pf fmt "module %s = struct@;<0 2>@[<v>"
             (SafeNames.safeConstructorName operation_name);
           let request_shape =
             os.input
             |> Option.map ~f:(fun input ->
                    Fmt.str "(request: %s)" (Types.resolve alias_context input))
             |> Option.value ~default:""
           in
           generate_error_handler fmt os;
           let response_shape_deserialiser =
             os.output
             |> Option.map ~f:(fun output -> Deserialiser.func_name output)
             |> Option.value ~default:"base_unit_of_yojson"
           in
           Fmt.pf fmt "let request = fun context %s ->@;<0 2>@[<v>" request_shape;
           Fmt.pf fmt "let input = %s in@\n"
             (os.input
             |> Option.map ~f:(fun input ->
                    Fmt.str "Serializers.%s_to_yojson request" (Types.resolve alias_context input))
             |> Option.value ~default:"`Assoc([])");
           let serviceShape =
             Fmt.str "%s.%s" (Util.symbolName name) (Util.symbolName operation_name)
           in
           Fmt.pf fmt "%s.request @;<0 2>@[<v>~shape_name:\"%s\" @;" Modules.protocolAwsJson
             serviceShape;
           Fmt.pf fmt "~service @;~config:%s.(context.config) @;~http:%s.(context.http) @;~input@\n"
             Modules.context Modules.context;
           Fmt.pf fmt "~output_deserializer:Deserializers.%s@\n" response_shape_deserialiser;
           Fmt.pf fmt "~error_deserializer@\n";
           Fmt.pf fmt "@]@]@]@\nend@\n@\n")

  let generate_mli ~name ~operation_shapes ~alias_context ?(no_open = false) fmt =
    if not no_open then begin
      Fmt.pf fmt "open Types @\n"
    end;
    operation_shapes
    |> List.iter ~f:(fun (operation_name, os, dependencies) ->
           Fmt.pf fmt "module %s : sig@;<0 2>@[<v>" (SafeNames.safeConstructorName operation_name);
           let request_shape =
             os.input
             |> Option.map ~f:(fun input -> Types.resolve alias_context input)
             |> Option.value ~default:"unit"
           in
           let result_shape =
             os.output
             |> Option.map ~f:(fun out -> Types.resolve alias_context out)
             |> Option.value ~default:"unit"
           in
           Fmt.pf fmt "val request :@;<1 2>@[<hv 2>%s.t ->@;%s ->@;<0 2>@[<v>" Modules.context
             request_shape;
           Fmt.pf fmt "(%s,@ " result_shape;
           Fmt.pf fmt "[>@[<v 2>@;| %s.error " Modules.protocolAwsJson;
           os.errors |> Option.value ~default:[]
           |> List.iter ~f:(fun constructor ->
                  Fmt.pf fmt "| `%s of %s@;"
                    (SafeNames.safeConstructorName constructor)
                    (Types.type_name ~is_exception_type:true constructor));
           Fmt.pf fmt "@]@;]";
           Fmt.pf fmt "@]@;) result";
           Fmt.pf fmt "@]@]@]@\nend@\n@\n")
end
