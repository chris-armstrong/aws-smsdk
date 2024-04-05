open AwsSdkLib.Ini

let () =
  Eio_main.run (fun env ->
      let home_dir = Unix.getenv "HOME" in
      let contents =
        load_ini Eio.Path.(Eio.Stdenv.fs env / home_dir / ".aws" / "config")
      in
      Fmt.pr "loaded %d sections" (List.length contents))
