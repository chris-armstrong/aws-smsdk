open Base
open Parselib

type command =
  | TypesCommand
  | ServiceCommand
  | OperationsCommand
  | SerialisersCommand
  | DeserialisersCommand
  | BuildersCommand
  | ModuleCommand

let readCommandLine () =
  try
    let usage =
      "AwsGenerator  -input <definition> -output <output_dir> -targets \
       [types|builders|service|operations|serialisers|deserialisers|module]"
    in
    let command = ref None in
    let filename = ref None in
    let output_dir = ref None in
    let targets = ref None in
    let setCommand cmd = command := Some cmd in
    let argumentTypes =
      [
        ("-input", Stdlib.Arg.String (fun s -> filename := Some s), "Input definition file");
        ("-output", Stdlib.Arg.String (fun s -> output_dir := Some s), "Output directory");
        ("-targets", Stdlib.Arg.Rest_all (fun args -> targets := Some args), "Targets");
      ]
    in
    Stdlib.Arg.parse argumentTypes (fun _ -> ()) usage;
    match (!filename, !output_dir, !targets) with
    | None, _, _ ->
        Stdio.eprintf "no definition filename specified!@.";
        Stdlib.exit 1
    | _, None, _ ->
        Stdio.eprintf "no output directory specified!@.";
        Stdlib.exit 1
    | _, _, None ->
        Stdio.eprintf "no targets specified!@.";
        Stdlib.exit 1
    | Some input, Some output, Some targets ->
        let targets =
          List.map
            ~f:(function
              | "types" -> TypesCommand
              | "service" -> ServiceCommand
              | "operations" -> OperationsCommand
              | "serializers" -> SerialisersCommand
              | "deserializers" -> DeserialisersCommand
              | "builders" -> BuildersCommand
              | "module" -> ModuleCommand
              | _ ->
                  Stdio.eprintf "You must specify a -run <command>\n";
                  Stdlib.exit 1)
            targets
        in
        (input, output, targets)
  with Invalid_argument x ->
    Stdio.eprintf "You must supply a model file as the first parameter: %s\n" x;
    Stdlib.exit 1

let shapeWithTarget Ast.Shape.{ name; descriptor } =
  let open Ast.Dependencies in
  { name; descriptor; targets = getTargets descriptor; recursWith = None }

let ( let* ) = Stdlib.Result.bind

let _ =
  let input_filename, output_dir, targets = readCommandLine () in
  match Parse.Json.Decode.parseJsonFile input_filename Parse.Smithy.parseModel with
  | Ok shapes -> begin
      let ordered = shapes |> List.map ~f:shapeWithTarget |> Ast.Dependencies.order in
      let (name, service), operation_shapes, structure_shapes =
        Ast.Organize.partitionOperationShapes ordered
      in
      let alias_context =
        Codegen.Types.create_alias_context
          (structure_shapes
          |> List.concat_map ~f:(fun Ast.Dependencies.{ name; descriptor; recursWith; _ } ->
                 Ast.Shape.{ name; descriptor }
                 :: Option.value_map recursWith ~default:[] ~f:(fun recurs ->
                        List.map recurs ~f:(fun Ast.Dependencies.{ name; descriptor; _ } ->
                            Ast.Shape.{ name; descriptor }))))
      in
      let serviceDetails = SmithyHelpers.extractServiceTrait service.traits in
      List.iter
        ~f:(fun command ->
          let sdkId = serviceDetails.sdkId |> Str.global_replace (Str.regexp "[ ]") "" in
          let write_output filename generate =
            let output = Stdlib.Filename.concat output_dir filename in
            let output_channel = Out_channel.open_text output in
            let output_fmt = output_channel |> Stdlib.Format.formatter_of_out_channel in
            generate output_fmt;
            Stdlib.Format.pp_print_flush output_fmt ();
            Out_channel.flush output_channel
          in

          match command with
          | TypesCommand ->
              write_output "types.ml" (fun output_fmt ->
                  Gen_types.generate ~name ~service ~operation_shapes ~structure_shapes
                    ~alias_context output_fmt);
              write_output "types.mli" (fun output_fmt ->
                  Gen_types.generate_mli ~name ~service ~operation_shapes ~structure_shapes
                    ~alias_context output_fmt)
          | BuildersCommand ->
              write_output "builders.ml" (fun output_fmt ->
                  Gen_builders.generate ~name ~service ~operation_shapes ~structure_shapes
                    ~alias_context output_fmt);
              write_output "builders.mli" (fun output_fmt ->
                  Gen_builders.generate_mli ~name ~service ~operation_shapes ~structure_shapes
                    ~alias_context output_fmt)
          | ServiceCommand ->
              write_output "service.ml" (fun output_fmt -> SmithyHelpers.printServiceDetails shapes)
          | OperationsCommand ->
              write_output "operations.ml" (fun output_fmt ->
                  Gen_operations.generate ~name ~service ~operation_shapes ~structure_shapes
                    ~alias_context output_fmt);
              write_output "operations.mli" (fun output_fmt ->
                  Gen_operations.generate_mli ~name ~service ~operation_shapes ~structure_shapes
                    ~alias_context output_fmt)
          | SerialisersCommand ->
              write_output "serializers.ml" (fun output_fmt ->
                  Gen_serialisers.generate ~name ~service ~operation_shapes ~structure_shapes
                    output_fmt)
          | DeserialisersCommand ->
              write_output "deserializers.ml" (fun output_fmt ->
                  Gen_deserialisers.generate ~name ~service ~operation_shapes ~structure_shapes
                    output_fmt)
          | ModuleCommand ->
              write_output (Fmt.str "Aws_SmSdk_Client_%s.ml" sdkId) (fun output_fmt ->
                  Fmt.pf output_fmt "include Types@\n";
                  Fmt.pf output_fmt "include Builders@\n";
                  Fmt.pf output_fmt "include Operations@\n");
              write_output (Fmt.str "Aws_SmSdk_Client_%s.mli" sdkId) (fun output_fmt ->
                  Fmt.pf output_fmt "open Aws_SmSdk_Lib@\n";
                  Gen_types.generate_mli ~name ~service ~operation_shapes ~structure_shapes
                    ~alias_context ~no_open:true output_fmt;
                  Gen_builders.generate_mli ~name ~service ~operation_shapes ~structure_shapes
                    ~alias_context ~no_open:true output_fmt;
                  Gen_operations.generate_mli ~name ~service ~operation_shapes ~structure_shapes
                    ~alias_context ~no_open:true output_fmt))
        targets
    end
  | Error error ->
      Stdio.eprintf "Error parsing model: %s\n" (Parse.Json.Decode.jsonParseErrorToString error);
      Stdlib.exit 1
