open Base;
open Parselib;
open! SQSClientProto;

let shapeWithTarget = (Shape.{name, descriptor}) =>
  Dependencies.{
    name,
    descriptor,
    targets: Dependencies.getTargets(descriptor),
    recursWith: None,
  };

let render = shapes => {
  let ordered = shapes |> List.map(~f=shapeWithTarget) |> Dependencies.order;
  let (operrationShapes, structureShapes) =
    Organize.partitionOperationShapes(ordered);
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
  |> Stdio.printf("%s", _);
};

let printProtocol = (traits: option(list(Trait.t))) => {
  traits
  |> Option.value(~default=[])
  |> List.find_map(
       ~f=
         fun
         | Trait.AwsProtocolAwsJson1_0Trait => Some("AWS JSON 1.0")
         | Trait.AwsProtocolAwsJson1_1Trait => Some("AWS JSON 1.1")
         | Trait.AwsProtocolRestJson1Trait => Some("AWS REST JSON 1")
         | Trait.AwsProtocolRestXmlTrait => Some("AWS REST XML")
         | Trait.AwsProtocolAwsQueryTrait => Some("AWS Query")
         | Trait.AwsProtocolEc2QueryTrait => Some("EC2 Query")
         | _ => None,
     )
  |> Option.value(~default="<unknown>");
};

let printServiceTrait = traits => {
  traits
  |> Option.value(~default=[])
  |> List.find_map(
       ~f=
         fun
         | Trait.ServiceTrait({sdkId, arnNamespace, endpointPrefix, _}) =>
           Some(
             Fmt.str(
               "{ Sdk %s Namespace %s endpointPrefix %s }",
               sdkId,
               arnNamespace,
               Option.value(endpointPrefix, ~default="<>"),
             ),
           )
         | _ => None,
     )
  |> Option.value(~default="<unknown>");
};

let printOperations = operations => {
  operations
  |> List.filter_map(
       ~f=
         fun
         | Shape.{name, descriptor: Shape.OperationShape({input, output, _})} => {
             Some(
               Printf.sprintf(
                 "operation %s = %s => %s",
                 name,
                 Option.value(input, ~default="()"),
                 Option.value(output, ~default="void"),
               ),
             );
           }
         | _ => None,
     )
  |> List.iter(~f=str => Stdio.print_endline(str));
};

let printServiceDetails = shapes => {
  List.iter(shapes, ~f=(Shape.{descriptor, _}) =>
    switch (descriptor) {
    | Shape.ServiceShape(details) =>
      Stdio.printf(
        "Service: version=%s\n, protocol=%s, %s",
        details.version,
        printProtocol(details.traits),
        printServiceTrait(details.traits),
      )
    | _ => ()
    }
  );
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
      | TypesCommand => render(shapes)
      | ServiceCommand => printServiceDetails(shapes)
      | OperationsCommand => printOperations(shapes)
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
