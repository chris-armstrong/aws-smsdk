open AwsSdkLib

module List = struct
  include List

  let assoc_keys list = List.map (fun (x, _) -> x) list
end

let () =
  Eio_main.run (fun env ->
      let cwd = Eio.Stdenv.cwd in
      let filename = Array.get Sys.argv 1 in
      try
        let contents = Ini.load_ini Eio.Path.(Eio.Stdenv.fs env / filename) in
        Fmt.pr "loaded %d sections@." (List.length contents);
        List.iter
          (fun (k, values) ->
            Fmt.pr "SECTION: %s@;@[<hov 2>@;" k;
            List.iter (fun (key, value) -> Fmt.pr "%s=%s@;" key value) values;
            Fmt.pr "@]@\n@,")
          contents
      with Eio.Exn.Io _ as ex ->
        Fmt.pr "Unknown exception raised: %s@." (Printexc.to_string ex);
        Printexc.print_backtrace Stdio.stdout)
