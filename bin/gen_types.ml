open Base
open Parselib

let generateServiceMetadata (service : Shape.serviceShapeDetails) fmt =
  Fmt.pf fmt "let service =@;<0 2>@[<v 0>";
  Fmt.pf fmt "Aws.Service.{@;<0 2>@[<v 0>";
  let serviceDetails =
    List.find_map_exn (Option.value service.traits ~default:[]) ~f:(function
      | ((Trait.ServiceTrait x) [@explicit_arity]) -> Some x [@explicit_arity]
      | _ -> None)
  in
  Fmt.pf fmt "namespace = \"%s\";@;endpointPrefix = \"%s\";@;version = \"%s\""
    serviceDetails.arnNamespace
    (Option.value serviceDetails.endpointPrefix ~default:"")
    service.version;
  Fmt.pf fmt "@]@\n};@]@\n"

let generateClientType fmt name =
  Fmt.pf fmt "type t = {config: Aws.config};@\n";
  Fmt.pf fmt "let make (config: Aws.config) = {@;<0 2>config@;}@\n"

let generate ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes fmt =
  Fmt.pf fmt "open Aws_SmSdk_Lib@\n";
  generateServiceMetadata service fmt;
  structure_shapes
  |> List.map ~f:(function
       | Dependencies.{ recursWith = ((Some recursItems) [@explicit_arity]); name; descriptor; _ }
         ->
           CodeGen.generateRecursiveTypeBlock
             ((let open Shape in
               { name; descriptor })
             :: List.map recursItems ~f:(fun item ->
                    let open Shape in
                    { name = item.name; descriptor = item.descriptor }))
             ~genDoc:false ()
       | Dependencies.{ name; descriptor; _ } ->
           CodeGen.generateTypeBlock
             (let open Shape in
              { name; descriptor })
             ~genDoc:false ())
  |> String.concat ~sep:"\n\n"
  |> fun __x -> Fmt.pf fmt "%s\n\n" __x
