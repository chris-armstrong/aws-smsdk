type descriptor = { namespace : string; endpointPrefix : string; version : string }

let makeUri ~(context : Context.t) ~(service : descriptor) =
  Uri.make ~scheme:"https"
    ~host:
      (Printf.sprintf "%s.%s.amazonaws.com" service.endpointPrefix (context.config.resolveRegion ()))
    ()
