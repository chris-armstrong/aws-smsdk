open Ast

let generate_builder fmt name ({ members; _ } : Shape.structureShapeDetails) =
  let open Shape in
  Fmt.pf fmt "make_%s @;<1 2>@[<hv>" (Types.type_name ~is_exception_type:false name);
  let required, optional =
    List.partition (fun (mem : member) -> Trait.(hasTrait mem.traits isRequiredTrait)) members
  in
  List.iter
    (fun (mem : member) ->
      Fmt.pf fmt "?(%s : %s option)@ "
        (SafeNames.safeMemberName mem.name)
        (SafeNames.safeTypeName mem.target))
    optional;
  List.iter
    (fun (mem : member) ->
      Fmt.pf fmt "~(%s : %s)@ "
        (SafeNames.safeMemberName mem.name)
        (SafeNames.safeTypeName mem.target))
    required;

  Fmt.pf fmt "()@]@;: %s@ =@ " (SafeNames.safeTypeName name);
  if List.length members > 0 then begin
    Fmt.pf fmt "{@;<1 2>@[<hv>";

    List.iter (fun (mem : member) -> Fmt.pf fmt "%s;@ " (SafeNames.safeMemberName mem.name)) members;
    Fmt.pf fmt "@]@;}"
  end
  else Fmt.pf fmt "()"

let generate_builder_interface fmt name ({ members; _ } : Shape.structureShapeDetails) =
  let open Shape in
  Fmt.pf fmt "make_%s :@;<1 2>@[<hv>" (Types.type_name ~is_exception_type:false name);
  let required, optional =
    List.partition (fun (mem : member) -> Trait.(hasTrait mem.traits isRequiredTrait)) members
  in
  List.iter
    (fun (mem : member) ->
      (* unlike the implementation, optional arguments don't need an option type if we use (?) *)
      Fmt.pf fmt "?%s:%s ->@ "
        (SafeNames.safeMemberName mem.name)
        (SafeNames.safeTypeName mem.target))
    optional;
  List.iter
    (fun (mem : member) ->
      Fmt.pf fmt "%s:%s ->@ "
        (SafeNames.safeMemberName mem.name)
        (SafeNames.safeTypeName mem.target))
    required;

  Fmt.pf fmt "unit@]@;-> %s@\n" (SafeNames.safeTypeName name)

(** isolate the structure shapes that are not exceptions *)
let structure_shapes_without_exceptions shapeWithTarget =
  let open Dependencies in
  shapeWithTarget :: Option.value ~default:[] shapeWithTarget.recursWith
  |> List.filter_map (fun { name; descriptor; _ } ->
         match descriptor with
         | StructureShape structureShapeDetails
           when not Trait.(hasTrait structureShapeDetails.traits isErrorTrait) ->
             Some (name, structureShapeDetails)
         | _ -> None)

let generate ~name ~structure_shapes fmt =
  Fmt.pf fmt "open Types@\n";
  structure_shapes
  |> List.iter (fun shapeWithTarget ->
         let shapes = structure_shapes_without_exceptions shapeWithTarget in
         match shapes with
         | [] -> ()
         | (name, descriptor) :: [] ->
             Fmt.pf fmt "let ";
             generate_builder fmt name descriptor;
             Fmt.pf fmt "@\n@\n"
         | (name, descriptor) :: remainder ->
             Fmt.pf fmt "let rec ";
             generate_builder fmt name descriptor;
             remainder
             |> List.iter (fun (name, descriptor) ->
                    Fmt.pf fmt "@;and ";
                    generate_builder fmt name descriptor);
             Fmt.pf fmt "@\n@\n")

let generate_interfaces ~name ~structure_shapes fmt =
  structure_shapes
  |> List.iter (fun shapeWithTarget ->
         let shapes = structure_shapes_without_exceptions shapeWithTarget in
         match shapes with
         | [] -> ()
         | (name, descriptor) :: [] ->
             Fmt.pf fmt "val ";
             generate_builder_interface fmt name descriptor;
             Fmt.pf fmt "@\n@\n"
         | (name, descriptor) :: remainder ->
             Fmt.pf fmt "val rec ";
             generate_builder_interface fmt name descriptor;
             remainder
             |> List.iter (fun (name, descriptor) ->
                    Fmt.pf fmt "@;and ";
                    generate_builder_interface fmt name descriptor);
             Fmt.pf fmt "@\n@\n")
