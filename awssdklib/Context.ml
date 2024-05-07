type t = { config : Config.t; http : Http.t }

let http context = context.http
let config context = context.config

let make ?config ~sw
    (env : < net : [> [ `Generic | `Unix ] Eio.Net.ty ] Eio.Resource.t ; .. > as 'a) () =
  {
    config = Option.value ~default:(Config.defaultConfig ()) config;
    http = Http.make ~sw (env :> < net : [ `Generic | `Unix ] Eio.Net.ty Eio.Resource.t >);
  }
