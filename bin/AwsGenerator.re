open Base;
open Parselib;

let _ = {
  open Base.Result;
  Stdio.Out_channel.printf("We're going to model this\n");
  try({
    let process_file = Sys.get_argv()[1];
    let res = Json.Decode.parseJsonFile(process_file, Parse.parseModel);
    let _ =
      res
      >>| List.iter(~f=model => {Stdio.printf("%s\n", Shape.show(model))});

    let _ =
      res
      >>| List.map(~f=(Shape.{name, descriptor}) =>
            Dependencies.{
              name: name,
              descriptor: descriptor,
              targets: Dependencies.getTargets(descriptor),
              recursWith: None,
            }
          )
      >>|Dependencies.order
      >>| Fmt.pr("%a", Fmt.Dump.list(Dependencies.pp_shapeWithTarget), _)
    let _ =
      map_error(res, ~f=error =>
        Stdio.Out_channel.printf(
          "Error parsing model: %s\n",
          Json.Decode.jsonParseErrorToString(error),
        )
      );
    ();
  }) {
  | Invalid_argument(_) =>
    Stdio.Out_channel.fprintf(
      Stdio.stderr,
      "You must supply a model file as the first parameter\n",
    )
  | _ =>
    Stdio.Out_channel.fprintf(Stdio.stderr, "An unknown error occurred\n")
  };
};