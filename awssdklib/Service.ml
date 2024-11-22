type protocol = AwsJson_1_0 | AwsJson_1_1

type descriptor = {
  namespace : string;
  endpointPrefix : string;
  version : string;
  protocol : protocol;
}

let makeUri ~(config : Config.t) ~(service : descriptor) =
  Uri.make ~scheme:"https"
    ~host:(Printf.sprintf "%s.%s.amazonaws.com" service.endpointPrefix (config.resolveRegion ()))
    ()
