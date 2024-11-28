open Ast

let generate_builder fmt ctx name ({ members; _ } : Shape.structureShapeDetails) =
  let open Shape in
  Fmt.pf fmt "make_%s @;<1 2>@[<hv>" (Types.type_name ~is_exception_type:false name);
  let required, optional =
    List.partition (fun (mem : member) -> Trait.(hasTrait mem.traits isRequiredTrait)) members
  in
  List.iter
    (fun (mem : member) ->
      Fmt.pf fmt "?(%s : %s option)@ "
        (SafeNames.safeMemberName mem.name)
        (Types.resolve ctx mem.target))
    optional;
  List.iter
    (fun (mem : member) ->
      Fmt.pf fmt "~(%s : %s)@ " (SafeNames.safeMemberName mem.name) (Types.resolve ctx mem.target))
    required;

  Fmt.pf fmt "()@]@;: %s@ =@ " (SafeNames.safeTypeName name);
  if List.length members > 0 then begin
    Fmt.pf fmt "{@;<1 2>@[<hv>";

    List.iter (fun (mem : member) -> Fmt.pf fmt "%s;@ " (SafeNames.safeMemberName mem.name)) members;
    Fmt.pf fmt "@]@;}"
  end
  else Fmt.pf fmt "()"

let generate_builder_interface fmt ctx name ({ members; _ } : Shape.structureShapeDetails) =
  let open Shape in
  Fmt.pf fmt "make_%s :@;<1 2>@[<hv>" (Types.type_name ~is_exception_type:false name);
  let required, optional =
    List.partition (fun (mem : member) -> Trait.(hasTrait mem.traits isRequiredTrait)) members
  in
  List.iter
    (fun (mem : member) ->
      (* unlike the implementation, optional arguments don't need an option type if we use (?) *)
      Fmt.pf fmt "?%s:%s ->@ " (SafeNames.safeMemberName mem.name) (Types.resolve ctx mem.target))
    optional;
  List.iter
    (fun (mem : member) ->
      Fmt.pf fmt "%s:%s ->@ " (SafeNames.safeMemberName mem.name) (Types.resolve ctx mem.target))
    required;

  Fmt.pf fmt "unit@]@;-> %s@\n" (Types.resolve ctx name)

(** isolate the structure shapes that are not exceptions *)
let structure_shapes_without_exceptions shapeWithTarget =
  let open Dependencies in
  shapeWithTarget :: Option.value ~default:[] shapeWithTarget.recursWith
  |> List.filter_map (fun { name; descriptor; _ } ->
         match descriptor with
         | StructureShape structureShapeDetails
           when (not Trait.(hasTrait structureShapeDetails.traits isErrorTrait))
                && not (String.ends_with ~suffix:"Result" name) ->
             Some (name, structureShapeDetails)
         | _ -> None)

let generate ~name ~structure_shapes ~alias_context fmt =
  Fmt.pf fmt "[@@@@@@warning \"-39\"]@\n";
  Fmt.pf fmt "open Types@\n";
  structure_shapes
  |> List.iter (fun shapeWithTarget ->
         let shapes = structure_shapes_without_exceptions shapeWithTarget in
         match shapes with
         | [] -> ()
         | (name, descriptor) :: [] ->
             Fmt.pf fmt "let ";
             generate_builder fmt alias_context name descriptor;
             Fmt.pf fmt "@\n@\n"
         | (name, descriptor) :: remainder ->
             Fmt.pf fmt "let rec@;<1 2>@[";
             generate_builder fmt alias_context name descriptor;
             remainder
             |> List.iter (fun (name, descriptor) ->
                    Fmt.pf fmt "@]@\nand@;<1 2>@[";
                    generate_builder fmt alias_context name descriptor);
             Fmt.pf fmt "@]@\n@\n")

let generate_interfaces ~name ~structure_shapes ~alias_context fmt =
  structure_shapes
  |> List.iter (fun shapeWithTarget ->
         let shapes = structure_shapes_without_exceptions shapeWithTarget in
         match shapes with
         | [] -> ()
         | (name, descriptor) :: [] ->
             Fmt.pf fmt "val ";
             generate_builder_interface fmt alias_context name descriptor;
             Fmt.pf fmt "@\n"
         | (name, descriptor) :: remainder ->
             Fmt.pf fmt "val ";
             generate_builder_interface fmt alias_context name descriptor;
             Fmt.pf fmt "@\n";
             remainder
             |> List.iter (fun (name, descriptor) ->
                    Fmt.pf fmt "val ";
                    generate_builder_interface fmt alias_context name descriptor;
                    Fmt.pf fmt "@\n"))
