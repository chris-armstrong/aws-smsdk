module type S = sig
  type http
  type json_type = Yojson.Basic.t

  type error =
    [ Errors.t
    | `HttpError of Http.http_failure
    | `JsonParseError of Json.DeserializeHelpers.jsonParseError ]

  val request :
    shape_name:string ->
    service:Service.descriptor ->
    config:Config.t ->
    http:http ->
    input:json_type ->
    output_deserializer:(json_type -> string list -> 'res) ->
    error_deserializer:
      (json_type ->
      string list ->
      ([> `HttpError of Http.http_failure
       | `JsonParseError of Json.DeserializeHelpers.jsonParseError ]
       as
       'error)) ->
    ('res, 'error) result

  val error_deserializer :
    (json_type -> string list -> string * string -> 'a) -> json_type -> string list -> 'a
end

module Make (Http_module : Http.Client_intf) = struct
  type http = Http_module.t
  type json_type = Yojson.Basic.t

  let json_to_string = Yojson.Basic.to_string
  let json_of_string = Yojson.Basic.from_string

  type error =
    [ Errors.t
    | `HttpError of Http.http_failure
    | `JsonParseError of Json.DeserializeHelpers.jsonParseError ]

  let request ~(shape_name : string) ~(service : Service.descriptor) ~(config : Config.t)
      ~(input : json_type) ~(output_deserializer : json_type -> string list -> 'res) ~http
      ~(error_deserializer : json_type -> string list -> 'error) =
    let open Json.DeserializeHelpers in
    let ( let* ) = Result.bind in
    let ( let+ ) res map = Result.map map res in
    let uri = Service.makeUri ~config ~service in
    let body = json_to_string input in
    let headers =
      [ ("Content-Type", "application/x-amz-json-1.0"); ("X-Amz-Target", shape_name) ]
    in
    let auth = config.resolveAuth () in
    let region = config.resolveRegion () in
    let headers = Sign.sign_request_v4 ~config ~service ~uri ~method_:`POST ~headers ~body in
    match Http_module.request ~method_:`POST ~headers ~body:(`String body) ~uri http with
    | Ok (response, body) -> begin
        let body = body |> Http_module.Body.to_string in
        Fmt.pr "Response body: %s" body;
        let body_res =
          body |> json_of_string ~fname:(Fmt.str "%s.%s" service.endpointPrefix shape_name)
        in

        match response |> Http_module.Response.status with
        | x when x >= 200 && x < 300 ->
            (deserialize_res output_deserializer) body_res
            |> Result.map_error (fun e -> `JsonParseError e)
        | _ -> (
            match (deserialize_res error_deserializer) body_res with
            | Ok error -> Error error
            | Error error -> Error (`JsonParseError error))
      end
    | Error error -> Error (`HttpError error)

  let error_deserializer handler tree path =
    let _obj = Json.DeserializeHelpers.assoc_of_yojson tree path in
    let _type =
      Json.DeserializeHelpers.value_for_key Json.DeserializeHelpers.string_of_yojson "__type" _obj
        path
    in
    let typepair =
      match String.split_on_char '#' _type with
      | namespace :: name :: _ -> (namespace, name)
      | _ -> ("", _type)
    in

    handler tree path typepair
end
