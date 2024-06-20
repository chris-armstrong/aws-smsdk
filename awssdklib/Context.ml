type t = { http : Http.Client.t; config : Config.t }

let make ?(config = Config.defaultConfig ()) ~sw env = { http = Http.Client.make ~sw env; config }
