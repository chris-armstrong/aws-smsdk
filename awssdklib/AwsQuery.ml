type field = string * string list
type 'a mapper = string list -> 'a -> field

let join_path path = String.concat "." path

module Error = struct
  type errorType = Sender | Receiver
  type t = { errorType : errorType; code : string }
end

module Response = struct
  exception Unparseable of string * string

  let parse_xml_ok_response ~(action : string) ~(xmlNamespace : string) ~(body : string)
      ~resultParser =
    let open Xml.Parse in
    let xmlSource = source_with_encoding ~src:body ~encoding:None in
    Read.dtd xmlSource;
    Read.sequence xmlSource (action ^ "Response") ~ns:xmlNamespace
      (fun _ _ ->
        let result = Read.sequence xmlSource (action ^ "Result") (fun i _ -> resultParser i) () in
        let metadata =
          Read.sequence xmlSource "ResponseMetadata"
            (fun _ _ ->
              let requestId = Read.element xmlSource "RequestId" () in
              requestId)
            ()
        in
        (metadata, result))
      ()

  let parse_xml_error_response ~(body : string) =
    let open Xml.Parse in
    let xmlSource = source_with_encoding ~src:body ~encoding:None in
    Read.dtd xmlSource;
    try
      Read.sequence xmlSource "ErrorResponse"
        (fun _ _ ->
          let error =
            Read.sequence xmlSource "Error"
              (fun i _ ->
                let type_ = Read.element i "Type" () in
                let code = Read.element i "Code" () in
                let errorType =
                  match type_ with
                  | "Sender" -> Error.Sender
                  | "Receiver" -> Error.Receiver
                  | _ -> raise (Unparseable ("Unknown Error type (expected Sender/Receiver)", body))
                in
                let open Error in
                { errorType; code })
              ()
          in
          let metadata =
            Read.sequence xmlSource "ResponseMetadata"
              (fun _ _ ->
                let requestId = Read.element xmlSource "RequestId" () in
                requestId)
              ()
          in
          (metadata, error))
        ()
    with
    | Xml.Parse.XmlParse _ -> raise (Unparseable ("xmlm error", body))
    | Xml.Parse.XmlUnexpectedConstruct (_, _, _) -> raise (Unparseable ("construct error", body))
end

exception MissingElement of string * Xmlm.pos

module type S = sig
  type http

  val request :
    service:Service.descriptor ->
    config:Config.t ->
    http:http ->
    action:string ->
    xmlNamespace:string ->
    fields:field option list ->
    output_deserializer:(Xmlm.input -> 'out) ->
    error_deserializer:
      (Error.t -> ([> `HttpError of Http.http_failure | `ParseError of string * string ] as 'error)) ->
    ('out, 'error) result
end

module Make (Http : Http.Client_intf) : S = struct
  type http = Http.t

  module Request = struct
    let map_string path (value : string) = (join_path path, [ value ])
    let map_int path value = (join_path path, [ Int.to_string value ])
    let map_required (mapper : 'a mapper) path value = Some (mapper path value)
    let map_opt (mapper : 'a mapper) path value = Option.map (fun v -> mapper path v) value

    let make ~(service : Service.descriptor) ~config ~action ~(fields : field option list) ~http =
      let basicHeaders = [ ("content-type", "application/x-www-form-urlencoded") ] in
      let filteredFields = fields |> List.filter_map (fun x -> x) in
      let uri = Service.makeUri ~config ~service in
      let body_values =
        ("Action", [ action ]) :: ("Version", [ service.version ]) :: filteredFields
      in
      let body = Uri.encoded_of_query body_values in
      Stdio.printf "Action %s on %s\n" action (Uri.to_string uri);
      Stdio.printf "Sending body %s\n" body;
      let auth = config.resolveAuth () in
      let region = config.resolveRegion () in
      let headers =
        Sign.sign_request_v4 ~config ~service ~headers:basicHeaders ~uri ~method_:`POST ~body
      in
      Http.request ~method_:`POST ~headers ~body:(`String body) http ~uri
  end

  let request ~service ~config ~http ~action ~xmlNamespace ~fields ~output_deserializer
      ~error_deserializer =
    match Request.make ~service ~config ~action ~fields ~http with
    | Ok (response, body) -> begin
        let status = Http.Response.status response in
        let body = Http.Body.to_string body in
        match status with
        | 200 ->
            let metadata, result =
              Response.parse_xml_ok_response ~action ~xmlNamespace ~body
                ~resultParser:output_deserializer
            in
            Ok result
        | status ->
            let metadata, error = Response.parse_xml_error_response ~body in
            let error = error_deserializer error in
            Error error
      end
    | Error http_failure -> Error (`HttpError http_failure)
end
