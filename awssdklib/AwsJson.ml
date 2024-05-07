let make_request ~(shapeName : string) ~(service : Aws.Service.descriptor) ~(context : Context.t)
    ~(input : Yojson.Safe.t) =
  let ( let* ) = Result.bind in
  let Context.{ config; http } = context in
  let uri = Service.makeUri ~context ~service in
  let body = Yojson.Safe.to_string input in
  let headers = [ ("Content-Type", "application/x-amz-json-1.0"); ("X-Amz-Target", shapeName) ] in
  let auth = config.resolveAuth () in
  let region = config.resolveRegion () in
  let headers = Aws.Sign.sign_request ~context ~service ~uri ~method_:`POST ~headers ~body in
  let* response, body = Http.request ~method_:`POST ~headers ~body:(`String body) ~uri http in
  let body =
    body |> Http.Body.to_string
    |> Yojson.Basic.from_string ~fname:(Fmt.str "%s.%s" service.endpointPrefix shapeName)
  in
  Ok (response, body)
