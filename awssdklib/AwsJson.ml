type json_type = Yojson.Basic.t

let json_to_string = Yojson.Basic.to_string
let json_of_string = Yojson.Basic.from_string

type error =
  [ `HttpError of Http.http_failure | `JsonParseError of Json.DeserializeHelpers.jsonParseError ]

let make_request ~(shape_name : string) ~(service : Aws.Service.descriptor) ~(context : Context.t)
    ~(input : json_type) ~(output_deserializer : json_type -> string list -> 'res)
    ~(error_deserializer : json_type -> string list -> 'error) =
  let open Json.DeserializeHelpers in
  let ( let* ) = Result.bind in
  let ( let+ ) res map = Result.map map res in
  let Context.{ config; http } = context in
  let uri = Service.makeUri ~context ~service in
  let body = json_to_string input in
  let headers = [ ("Content-Type", "application/x-amz-json-1.0"); ("X-Amz-Target", shape_name) ] in
  let auth = config.resolveAuth () in
  let region = config.resolveRegion () in
  let headers = Aws.Sign.sign_request ~context ~service ~uri ~method_:`POST ~headers ~body in
  match Http.request ~method_:`POST ~headers ~body:(`String body) ~uri http with
  | Ok (response, body) -> begin
      let body = body |> Http.Body.to_string in
      Fmt.pr "Response body: %s" body;
      let body_res =
        body |> json_of_string ~fname:(Fmt.str "%s.%s" service.endpointPrefix shape_name)
      in

      match response |> Http.Response.status with
      | x when x >= 200 && x < 300 ->
          (deserialize_res output_deserializer) body_res
          |> Result.map_error (fun e -> `JsonParseError e)
      | _ -> (
          match (deserialize_res error_deserializer) body_res with
          | Ok error -> Error error
          | Error error -> Error (`JsonParseError error))
    end
  | Error error -> Error (`HttpError error)
