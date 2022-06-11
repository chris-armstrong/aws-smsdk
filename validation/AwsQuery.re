open Base;
open Aws;
open Cohttp_lwt;
open Cohttp_lwt_unix;

type field = (string, list(string));
type mapper('a) = (list(string), 'a) => field;
let makeRequest =
    (
      ~service: Aws.Service.descriptor,
      ~config,
      ~action,
      ~fields: list(option(field)),
    ) => {
  open Lwt.Syntax;
  let basicHeaders = [("content-type", "application/x-www-form-urlencoded")];
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
  let headers =
    Cohttp.Header.of_list(
      Sign.sign_request(
        ~config,
        ~service,
        ~headers=basicHeaders,
        ~uri,
        ~method=`POST,
        ~body=stringbody,
      ),
    );
  Client.post(~headers, ~body, uri);
};
let join_path = path => String.concat(path, ~sep=".");
let map_string = (path, value: string) => (join_path(path), [value]);
let map_int = (path, value) => (join_path(path), [Int.to_string(value)]);
let map_opt = (mapper: mapper('a), path, value) =>
  Option.map(value, ~f=v => mapper(path, v));
