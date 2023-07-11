open Base;
open Aws;
open Cohttp_lwt;
open Cohttp_lwt_unix;

type field = (string, list(string));
type mapper('a) = (list(string), 'a) => field;
let join_path = path => String.concat(path, ~sep=".");

module Request = {
  let map_string = (path, value: string) => (join_path(path), [value]);
  let map_int = (path, value) => (
    join_path(path),
    [Int.to_string(value)],
  );
  let map_required = (mapper: mapper('a), path, value) =>
    Some(mapper(path, value));
  let map_opt = (mapper: mapper('a), path, value) =>
    Option.map(value, ~f=v => mapper(path, v));
  let make =
      (
        ~service: Aws.Service.descriptor,
        ~config,
        ~action,
        ~fields: list(option(field)),
      ) => {
    open Lwt.Syntax;
    let basicHeaders = [
      ("content-type", "application/x-www-form-urlencoded"),
    ];
    let filteredFields = fields |> List.filter_opt;
    let uri = Aws.Service.makeUri(config, service);
    let body =
      Cohttp_lwt.Body.of_form(
        ~scheme="utf-8",
        [
          ("Action", [action]),
          ("Version", [service.version]),
          ...filteredFields,
        ],
      );
    let* stringbody = Body.to_string(body);
    Stdio.printf("Action %s on %s\n", action, Uri.to_string(uri));
    Stdio.printf("Sending body %s\n", stringbody);
    let* auth = config.resolveAuth();
    let region = config.resolveRegion();
    let headers =
      Cohttp.Header.of_list(
        Sign.sign_request(
          ~region,
          ~auth,
          ~service,
          ~headers=basicHeaders,
          ~uri,
          ~method=`POST,
          ~body=stringbody,
        ),
      );
    Client.post(~headers, ~body, uri);
  };
};

module Error = {
  type errorType =
    | Sender
    | Receiver;
  type t = {
    errorType,
    code: string,
  };
};

module Response = {
  exception Unparseable(string, string);

  let parse_xml_ok_response =
      (~action: string, ~xmlNamespace: string, ~body: string, ~resultParser) => {
    open Xml.Parse;
    let xmlSource = source_with_encoding(~src=body, ~encoding=None);
    Read.dtd(xmlSource);
    Read.sequence(
      xmlSource,
      action ++ "Response",
      ~ns=xmlNamespace,
      (_, _) => {
        let result =
          Read.sequence(
            xmlSource,
            action ++ "Result",
            (i, _) => resultParser(i),
            (),
          );
        let metadata =
          Read.sequence(
            xmlSource,
            "ResponseMetadata",
            (_, _) => {
              let requestId = Read.element(xmlSource, "RequestId", ());
              requestId;
            },
            (),
          );
        (metadata, result);
      },
      (),
    );
  };

  let parse_xml_error_response = (~body: string) => {
    open Xml.Parse;
    let xmlSource = source_with_encoding(~src=body, ~encoding=None);
    Read.dtd(xmlSource);
    try(
      Read.sequence(
        xmlSource,
        "ErrorResponse",
        (_, _) => {
          let error =
            Read.sequence(
              xmlSource,
              "Error",
              (i, _) => {
                let type_ = Read.element(i, "Type", ());
                let code = Read.element(i, "Code", ());
                let errorType =
                  switch (type_) {
                  | "Sender" => Error.Sender
                  | "Receiver" => Error.Receiver
                  | _ =>
                    raise(
                      Unparseable(
                        "Unknown Error type (expected Sender/Receiver)",
                        body,
                      ),
                    )
                  };
                Error.{errorType, code};
              },
              (),
            );
          let metadata =
            Read.sequence(
              xmlSource,
              "ResponseMetadata",
              (_, _) => {
                let requestId = Read.element(xmlSource, "RequestId", ());
                requestId;
              },
              (),
            );
          (metadata, error);
        },
        (),
      )
    ) {
    | Xml.Parse.XmlParse(_) => raise(Unparseable("xmlm error", body))
    | Xml.Parse.XmlUnexpectedConstruct(_, _, _) =>
      raise(Unparseable("construct error", body))
    };
  };
};

exception MissingElement(string, Xmlm.pos);
