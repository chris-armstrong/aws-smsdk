open Base
open Parselib

type command = TypesCommand | ServiceCommand | OperationsCommand | SerialisersCommand

let readCommandLine () =
  try
    let usage = "AwsGenerator -run [types|service|operations|serialisers] <definition> <output>" in
    let command = ref None in
    let filename = ref None in
    let output = ref None in
    let setCommand cmd = command := (Some cmd [@explicit_arity]) in
    let argumentTypes =
      [
        ( "-run",
          (Stdlib.Arg.Symbol ([ "types"; "service"; "operations"; "serialisers" ], setCommand)
          [@explicit_arity]),
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
          | Some "types" -> TypesCommand
          | Some "service" -> ServiceCommand
          | Some "operations" -> OperationsCommand
          | Some "serialisers" -> SerialisersCommand
          | _ ->
              Stdio.eprintf "You must specify a -run <command>\n";
              Stdlib.exit 1),
          output )
  with Invalid_argument x ->
    Stdio.eprintf "You must supply a model file as the first parameter: %s\n" x;
    Stdlib.exit 1

let shapeWithTarget Shape.{ name; descriptor } =
  let open Dependencies in
  { name; descriptor; targets = Dependencies.getTargets descriptor; recursWith = None }

let ( let* ) = Stdlib.Result.bind

let _ =
  let input_filename, command, output = readCommandLine () in
  let output_channel = Out_channel.open_text output in
  let output_fmt = output_channel |> Stdlib.Format.formatter_of_out_channel in
  match Json.Decode.parseJsonFile input_filename Parse.parseModel with
  | Ok shapes -> begin
      let ordered = shapes |> List.map ~f:shapeWithTarget |> Dependencies.order in
      let (name, service), operation_shapes, structure_shapes =
        Organize.partitionOperationShapes ordered
      in
      (match command with
      | TypesCommand ->
          Gen_types.generate ~name ~service ~operation_shapes ~structure_shapes output_fmt
      | ServiceCommand -> SmithyHelpers.printServiceDetails shapes
      | OperationsCommand -> SmithyHelpers.printOperations shapes
      | SerialisersCommand ->
          Gen_serialisers.generate ~name ~service ~operation_shapes ~structure_shapes output_fmt);

      Stdlib.Format.pp_print_flush output_fmt ();
      Out_channel.flush output_channel
    end
  | Error error ->
      Stdio.eprintf "Error parsing model: %s\n" (Json.Decode.jsonParseErrorToString error);
      Stdlib.exit 1
