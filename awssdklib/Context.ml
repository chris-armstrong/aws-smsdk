type t = { config : Config.t; http : Http.t }

let http context = context.http
let config context = context.config

let make ?config ~sw () =
  { config = Option.value ~default:(Config.defaultConfig ()) config; http = Http.make ~sw }
