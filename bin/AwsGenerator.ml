open Base
open Parselib

let shapeWithTarget Shape.{ name; descriptor } =
  let open Dependencies in
  { name; descriptor; targets = Dependencies.getTargets descriptor; recursWith = None }

let generateServiceMetadata fmt (service : Shape.serviceShapeDetails) =
  Fmt.pf fmt "let service =@;<0 2>@[<v 0>";
  Fmt.pf fmt "Aws.Service.{@;<0 2>@[<v 0>";
  let serviceDetails =
    List.find_map_exn (Option.value service.traits ~default:[]) ~f:(function
      | ((Trait.ServiceTrait x) [@explicit_arity]) -> Some x [@explicit_arity]
      | _ -> None)
  in
  Fmt.pf fmt "namespace: \"%s\",@;endpointPrefix: \"%s\",@;version: \"%s\""
    serviceDetails.arnNamespace
    (Option.value serviceDetails.endpointPrefix ~default:"")
    service.version;
  Fmt.pf fmt "@]@\n};@]@\n"

let generateClientType fmt name =
  Fmt.pf fmt "type t = {config: Aws.config};@\n";
  Fmt.pf fmt "let make = (config: Aws.config) => {@;<0 2>config@;};@\n"

let render fmt shapes =
  let ordered = shapes |> List.map ~f:shapeWithTarget |> Dependencies.order in
  let (name, service), operationShapes, structureShapes =
    Organize.partitionOperationShapes ordered
  in
  Fmt.pf fmt "open AwsSdkLib;@\n";
  generateServiceMetadata fmt service;
  ( structureShapes
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
  |> fun __x -> Fmt.pf fmt "%s\n\n" __x );
  if
    Trait.hasTrait service.traits (function
      | Trait.AwsProtocolAwsJson1_1Trait -> true
      | Trait.AwsProtocolAwsJson1_0Trait -> true
      | _ -> false)
  then (
    AwsProtocolJson.generateSerialisers fmt structureShapes;
    Fmt.pf fmt "module Client = {@;<0 2>@[<v>";
    generateClientType fmt name;
    AwsProtocolJson.generateOperations fmt name ordered;
    Fmt.pf fmt "@]@\n}@\n";
    Fmt.pf fmt "@\n@\n");
  ()

type command = TypesCommand | ServiceCommand | OperationsCommand

let readCommandLine () =
  try
    let usage = "AwsGenerator -run [types|service|operations] <definition> <output>" in
    let command = ref None in
    let filename = ref None in
    let output = ref None in
    let setCommand cmd = command := (Some cmd [@explicit_arity]) in
    let argumentTypes =
      [
        ( "-run",
          (Stdlib.Arg.Symbol ([ "types"; "service"; "operations" ], setCommand) [@explicit_arity]),
          "command to execute" );
        ("-input", Stdlib.Arg.String (fun s -> filename := Some s), "Input definition file");
        ("-output", Stdlib.Arg.String (fun s -> output := Some s), "Output filename");
      ]
    in
    Stdlib.Arg.parse argumentTypes (fun _ -> ()) usage;
    match (!filename, !output) with
    | None, _ ->
        Stdio.eprintf "no definition filename specified!@.";
        Stdlib.exit 1
    | _, None ->
        Stdio.eprintf "no output filename specified!@.";
        Stdlib.exit 1
    | Some input, Some output ->
        ( input,
          (match !command with
          | ((Some "types") [@explicit_arity]) -> TypesCommand
          | ((Some "service") [@explicit_arity]) -> ServiceCommand
          | ((Some "operations") [@explicit_arity]) -> OperationsCommand
          | _ ->
              Stdio.eprintf "You must specify a -run <command>\n";
              Stdlib.exit 1),
          output )
  with ((Invalid_argument x) [@explicit_arity]) ->
    Stdio.eprintf "You must supply a model file as the first parameter: %s\n" x;
    Stdlib.exit 1

let _ =
  let open Result.Let_syntax in
  let input_filename, command, output = readCommandLine () in
  Json.Decode.parseJsonFile input_filename Parse.parseModel
  >>| (fun shapes ->
        match command with
        | TypesCommand ->
            render (Out_channel.open_text output |> Stdlib.Format.formatter_of_out_channel) shapes
        | ServiceCommand -> SmithyHelpers.printServiceDetails shapes
        | OperationsCommand -> SmithyHelpers.printOperations shapes)
  |> Result.iter_error ~f:(fun error ->
         Stdio.eprintf "Error parsing model: %s\n" (Json.Decode.jsonParseErrorToString error);
         Stdlib.exit 1);
  ()
