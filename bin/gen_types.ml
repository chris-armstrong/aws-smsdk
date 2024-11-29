open Base
open Parselib

let generateServiceMetadata (service : Ast.Shape.serviceShapeDetails) fmt =
  Fmt.pf fmt "let service =@;<0 2>@[<v 0>";
  Fmt.pf fmt "Service.{@;<0 2>@[<v 0>";
  let traits = Option.value service.traits ~default:[] in
  let serviceDetails =
    List.find_map_exn traits ~f:(function Ast.Trait.ServiceTrait x -> Some x | _ -> None)
  in

  let protocol =
    List.find_map_exn traits ~f:(function
      | Ast.Trait.AwsProtocolAwsJson1_0Trait -> Some "AwsJson_1_0"
      | Ast.Trait.AwsProtocolAwsJson1_1Trait -> Some "AwsJson_1_1"
      | _ -> None)
  in
  Fmt.pf fmt "namespace = \"%s\";@;endpointPrefix = \"%s\";@;version = \"%s\";@;protocol = %s"
    (Option.value serviceDetails.arnNamespace ~default:"<blank>")
    (Option.value serviceDetails.endpointPrefix ~default:"<blank>")
    service.version protocol;
  Fmt.pf fmt "@]@\n};@]@\n"

let generateServiceInterface service fmt = Fmt.pf fmt "val service : Service.descriptor@\n@\n"

let generateStructureShapes ctx structure_shapes fmt =
  structure_shapes
  |> List.filter_map ~f:(function
       | Ast.Dependencies.{ recursWith = Some recursItems; name; descriptor; _ } ->
           Codegen.Types.generate_recursive_types ctx
             ((let open Ast.Shape in
               { name; descriptor })
             :: List.map recursItems ~f:(fun item ->
                    let open Ast.Shape in
                    { name = item.name; descriptor = item.descriptor }))
             ~genDoc:true ()
       | Ast.Dependencies.{ name; descriptor; _ } ->
           Codegen.Types.generate_type ctx
             (let open Ast.Shape in
              { name; descriptor })
             ~genDoc:true ())
  |> String.concat ~sep:"\n\n"
  |> fun __x -> Fmt.pf fmt "%s\n\n" __x

let generate ~name ~(service : Ast.Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes
    ~alias_context fmt =
  Fmt.pf fmt "open Smaws_Lib@\n";
  generateServiceMetadata service fmt;
  Fmt.pf fmt "@\n";
  generateStructureShapes alias_context structure_shapes fmt

let generate_mli ~name ~service ~operation_shapes ~structure_shapes ~alias_context
    ?(no_open = false) fmt =
  if not no_open then Fmt.pf fmt "open Smaws_Lib@\n";

  generateServiceInterface service fmt;
  generateStructureShapes alias_context structure_shapes fmt
