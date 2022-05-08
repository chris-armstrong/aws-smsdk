open Base;
open Parselib;

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
           CodeGen.generateRecursiveTypeBlock([
             Shape.{name, descriptor},
             ...List.map(recursItems, ~f=item =>
                  Shape.{name: item.name, descriptor: item.descriptor}
                ),
           ], ~genDoc=false, ())
         | Dependencies.{name, descriptor, _} => CodeGen.generateTypeBlock(Shape.{ name: name, descriptor: descriptor }, ~genDoc=false, ())
     )
  |> String.concat(~sep="\n\n")
  |> Stdio.printf("%s", _);
};

let _ = {
  open Base.Result;
  Stdio.Out_channel.printf("We're going to model this\n");
  try({
    let process_file = Sys.get_argv()[1];
    let res = Json.Decode.parseJsonFile(process_file, Parse.parseModel);
    // let _ =
    //   res
    //   >>| List.iter(~f=model => {Stdio.printf("%s\n", Shape.show(model))});

    let _ = res >>| render;

    // let _ =
    //   res
    //   >>| order
    //   >>| Fmt.pr("%a", Fmt.Dump.list(Dependencies.pp_shapeWithTarget), _);
    let _ =
      map_error(res, ~f=error =>
        Stdio.eprintf(
          "Error parsing model: %s\n",
          Json.Decode.jsonParseErrorToString(error),
        )
      );
    ();
  }) {
  | Invalid_argument(_) =>
    Stdio.eprintf("You must supply a model file as the first parameter\n")
  | _ => Stdio.eprintf("An unknown error occurred\n")
  };
};