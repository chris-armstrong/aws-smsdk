exception RequestError of int * string

let make_request ~(shapeName : string) ~(service : Aws.Service.descriptor) ~(context : Context.t)
    ~(input : Yojson.Safe.t) ~sw env =
  let Context.{ config; http } = context in
  let uri = Service.makeUri ~context ~service in
  let body = Yojson.Safe.to_string input in
  let headers = [ ("Content-Type", "application/x-amz-json-1.0"); ("X-Amz-Target", shapeName) ] in
  let auth = config.resolveAuth () in
  let region = config.resolveRegion () in
  let headers = Aws.Sign.sign_request ~context ~service ~uri ~method_:`POST ~headers ~body in
  try
    let response, body = Http.request ~method_:`POST ~headers ~body:(`String body) ~uri http env in
    let body = body |> Http.Body.to_string in
    Ok (response |> Http.Response.status, body)
  with err -> Error err
