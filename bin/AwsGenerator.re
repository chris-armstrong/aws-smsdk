open Core;
open Parselib;
open! SQSClientProto;

let order = shapes =>
  shapes
  |> List.map(~f=(Shape.{name, descriptor, _}) =>
       Dependencies.{
         name,
         descriptor,
         targets: Dependencies.getTargets(descriptor),
         recursWith: None,
       }
     )
  |> Dependencies.order;
let render = shapes => {
  let ordered = shapes |> order;
  let (_, allStructures) = Organize.partitionOperationShapes(ordered);

  allStructures
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

let _ = {
  Base.Result.(
    try({
      let usage = "AwsGenerator -run [types|service|operations] <filename>";
      let command = ref(None);
      let filename = ref("");
      let setFilename = f => filename := f;
      let setCommand = cmd => command := Some(cmd);

      let argumentTypes = [
        (
          "-run",
          Arg.Symbol(["types", "service", "operations"], setCommand),
          "command to execute",
        ),
      ];
      Arg.parse(argumentTypes, setFilename, usage);
      Stdio.printf(
        "command %s",
        Option.value(command.contents, ~default="<notset>"),
      );
      switch (filename.contents) {
      | "" =>
        Stdio.eprintf("no filename specified!");
        exit(1);
      | input_filename =>
        let res = Json.Decode.parseJsonFile(input_filename, Parse.parseModel);
        let _ =
          res
          >>| (
            shapes =>
              Option.iter(
                command^,
                ~f=
                  fun
                  | "types" => render(shapes)
                  | "service" => printServiceDetails(shapes)
                  | "operations" => printOperations(shapes)
                  | x => {
                      Stdio.eprintf("Unknown command %s", x);
                      exit(1);
                    },
              )
          );

        let _ =
          res
          |> iter_error(~f=error => {
               Stdio.eprintf(
                 "Error parsing model: %s\n",
                 Json.Decode.jsonParseErrorToString(error),
               );
               exit(1);
             });
        ();
      };
    }) {
    // let _ =
    //   res
    //   >>| List.iter(~f=model => {Stdio.printf("%s\n", Shape.show(model))});

    // let _ = res >>| render;
    // let _ = res >>| printServiceDetails;
    // let _ = res >>| printOperations;

    // let _ =
    //   res
    //   >>| order
    //   >>| Fmt.pr("%a", Fmt.Dump.list(Dependencies.pp_shapeWithTarget), _);
    // let _ =
    //   map_error(res, ~f=error =>
    //     Stdio.eprintf(
    //       "Error parsing model: %s\n",
    //       Json.Decode.jsonParseErrorToString(error),
    //     )
    //   );

    | Invalid_argument(_) =>
      Stdio.eprintf("You must supply a model file as the first parameter\n")
    | _ => Stdio.eprintf("An unknown error occurred\n")
    }
  );
};