open Base
open Aws

type field = string * string list
type 'a mapper = string list -> 'a -> field

let join_path path = String.concat path ~sep:"."

module Request = struct
  let map_string path (value : string) = (join_path path, [ value ])
  let map_int path value = (join_path path, [ Int.to_string value ])

  let map_required (mapper : 'a mapper) path value =
    (Some (mapper path value) [@explicit_arity])

  let map_opt (mapper : 'a mapper) path value =
    Option.map value ~f:(fun v -> mapper path v)

  let make ~(service : Aws.Service.descriptor) ~config ~action
      ~(fields : field option list) ~sw env =
    let basicHeaders =
      [ ("content-type", "application/x-www-form-urlencoded") ]
    in
    let filteredFields = fields |> List.filter_opt in
    let uri = Aws.Service.makeUri config service in
    let body_values =
      ("Action", [ action ])
      :: ("Version", [ service.version ])
      :: filteredFields
    in
    let body = Uri.encoded_of_query body_values in
    Stdio.printf "Action %s on %s\n" action (Uri.to_string uri);
    Stdio.printf "Sending body %s\n" body;
    let auth = config.resolveAuth () in
    let region = config.resolveRegion () in
    let headers =
      Sign.sign_request ~region ~auth ~service ~headers:basicHeaders ~uri
        ~method_:`POST ~body
    in
    Http.request ~method_:`POST ~headers ~body:(`String body) ~sw env ~uri
end

module Error = struct
  type errorType = Sender | Receiver
  type t = { errorType : errorType; code : string }
end

module Response = struct
  exception Unparseable of string * string

  let parse_xml_ok_response ~(action : string) ~(xmlNamespace : string)
      ~(body : string) ~resultParser =
    let open Xml.Parse in
    let xmlSource = source_with_encoding ~src:body ~encoding:None in
    Read.dtd xmlSource;
    Read.sequence xmlSource (action ^ "Response") ~ns:xmlNamespace
      (fun _ _ ->
        let result =
          Read.sequence xmlSource (action ^ "Result")
            (fun i _ -> resultParser i)
            ()
        in
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
                  | _ ->
                      raise
                        (Unparseable
                           ( "Unknown Error type (expected Sender/Receiver)",
                             body )
                        [@explicit_arity])
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
    | Xml.Parse.XmlParse _ ->
        raise (Unparseable ("xmlm error", body) [@explicit_arity])
    | ((Xml.Parse.XmlUnexpectedConstruct (_, _, _)) [@explicit_arity]) ->
        raise (Unparseable ("construct error", body) [@explicit_arity])
end

exception MissingElement of string * Xmlm.pos
