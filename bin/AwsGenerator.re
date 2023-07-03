open Base;
open Parselib;

let shapeWithTarget = (Shape.{name, descriptor}) =>
  Dependencies.{
    name,
    descriptor,
    targets: Dependencies.getTargets(descriptor),
    recursWith: None,
  };

let generateServiceMetadata = (fmt, service: Shape.serviceShapeDetails) => {
  Fmt.pf(fmt, "let service =@;<0 2>@[<v 0>");
  Fmt.pf(fmt, "Aws.Service.{@;<0 2>@[<v 0>");
  let serviceDetails =
    List.find_map_exn(
      Option.value(service.traits, ~default=[]),
      ~f=
        fun
        | Trait.ServiceTrait(x) => Some(x)
        | _ => None,
    );
  Fmt.pf(
    fmt,
    "namespace: \"%s\",@;endpointPrefix: \"%s\",@;version: \"%s\"",
    serviceDetails.arnNamespace,
    Option.value(serviceDetails.endpointPrefix, ~default=""),
    service.version,
  );
  Fmt.pf(fmt, "@]@\n};@]@\n");
};

let render = (fmt, shapes) => {
  let ordered = shapes |> List.map(~f=shapeWithTarget) |> Dependencies.order;
  let ((name, service), operationShapes, structureShapes) =
    Organize.partitionOperationShapes(ordered);

  Fmt.pf(fmt, "open AwsSdkLib;@\n");

  generateServiceMetadata(fmt, service);

  structureShapes
  |> List.map(
       ~f=
         fun
         | Dependencies.{recursWith: Some(recursItems), name, descriptor, _} =>
           CodeGen.generateRecursiveTypeBlock(
             [
               Shape.{name, descriptor},
               ...List.map(recursItems, ~f=item =>
                    Shape.{name: item.name, descriptor: item.descriptor}
                  ),
             ],
             ~genDoc=false,
             (),
           )
         | Dependencies.{name, descriptor, _} =>
           CodeGen.generateTypeBlock(
             Shape.{name, descriptor},
             ~genDoc=false,
             (),
           ),
     )
  |> String.concat(~sep="\n\n")
  |> Fmt.pf(fmt, "%s\n\n", _);

  if (Trait.hasTrait(
        service.traits,
        fun
        | Trait.AwsProtocolAwsJson1_1Trait => true
        | Trait.AwsProtocolAwsJson1_0Trait => true
        | _ => false,
      )) {
    AwsProtocolJson.generateSerialisers(fmt, structureShapes);

    AwsProtocolJson.generateOperations(fmt, ordered);
    Fmt.pf(fmt, "@\n@\n");
  };
  ();
};

type command =
  | TypesCommand
  | ServiceCommand
  | OperationsCommand;

let readCommandLine = () =>
  try({
    let usage = "AwsGenerator -run [types|service|operations] <filename>";
    let command = ref(None);
    let filename = ref("");
    let setFilename = f => filename := f;
    let setCommand = cmd => command := Some(cmd);

    let argumentTypes = [
      (
        "-run",
        Stdlib.Arg.Symbol(["types", "service", "operations"], setCommand),
        "command to execute",
      ),
    ];
    Stdlib.Arg.parse(argumentTypes, setFilename, usage);
    switch (filename.contents, command.contents) {
    | ("", _) =>
      Stdio.eprintf("no filename specified!");
      Stdlib.exit(1);
    | (filename, Some("types")) => (filename, TypesCommand)
    | (filename, Some("service")) => (filename, ServiceCommand)
    | (filename, Some("operations")) => (filename, OperationsCommand)
    | (filename, _) =>
      Stdio.eprintf("You must specify a -run <command>\n");
      Stdlib.exit(1);
    };
  }) {
  | Invalid_argument(x) =>
    Stdio.eprintf(
      "You must supply a model file as the first parameter: %s\n",
      x,
    );
    Stdlib.exit(1);
  };

let _ = {
  open Result.Let_syntax;
  let (input_filename, command) = readCommandLine();
  Json.Decode.parseJsonFile(input_filename, Parse.parseModel)
  >>| (
    shapes => {
      switch (command) {
      | TypesCommand => render(Fmt.stdout, shapes)
      | ServiceCommand => SmithyHelpers.printServiceDetails(shapes)
      | OperationsCommand => SmithyHelpers.printOperations(shapes)
      };
    }
  )
  |> Result.iter_error(~f=error => {
       Stdio.eprintf(
         "Error parsing model: %s\n",
         Json.Decode.jsonParseErrorToString(error),
       );
       Stdlib.exit(1);
     });
  ();
};
