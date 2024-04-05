exception RequestError of int * string

let make_request ~(shapeName : string) ~(service : Aws.Service.descriptor)
    ~(config : Aws.config) ~(input : Yojson.Safe.t) ~sw env =
  let uri = Aws.Service.makeUri config service in
  let body = Yojson.Safe.to_string input in
  let headers =
    [
      ("Content-Type", "application/x-amz-json-1.0"); ("X-Amz-Target", shapeName);
    ]
  in
  let auth = config.resolveAuth () in
  let region = config.resolveRegion () in
  let headers =
    Aws.Sign.sign_request ~auth ~region ~service ~uri ~method_:`POST ~headers
      ~body
  in
  match
    Http.request ~method_:`POST ~headers ~body:(`String body) ~uri ~sw env
  with
  | Ok (response, body) ->
      let body = body |> Http.Body.to_string in
      Ok (response |> Http.Response.status, body)
  | Error err -> Error err
