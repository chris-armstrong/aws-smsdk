type t = { resolveAuth : unit -> Auth.t; resolveRegion : unit -> string }

let defaultConfig () =
  let resolveRegion () =
    let region = Sys.getenv_opt "AWS_DEFAULT_REGION" |> Option.value ~default:"us-east-1" in
    region
  in
  let resolveAuth () =
    let auth = Auth.fromEnvironment () in
    auth
  in
  { resolveRegion; resolveAuth }
