exception RequestError(int, string);
let make_request =
    (
      ~shapeName: string,
      ~service: Aws.Service.descriptor,
      ~config: Aws.config,
      ~input: Yojson.Safe.t,
    ) => {
  open Http.M;
  open Lwt.Syntax;
  let uri = Aws.Service.makeUri(config, service);
  let body = Yojson.Safe.to_string(input);
  let headers = [
    ("Content-Type", "application/x-amz-json-1.0"),
    ("X-Amz-Target", shapeName),
  ];
  let* auth = config.resolveAuth();
  let region = config.resolveRegion();
  let headers =
    Aws.Sign.sign_request(
      ~auth,
      ~region,
      ~service,
      ~uri,
      ~method=`POST,
      ~headers,
      ~body,
    );
  let body = body_of_string(body);

  let* (response, body) = request(~method=`POST, ~headers, ~body, ~uri);
  let* body = body |> body_to_string;
  Lwt.return((response |> response_status_code, body));
  /* switch (response |> Http.M.response_status_code) {
     | 200 => Lwt.return_ok(body |> body_to_string)
     | _ as x =>
       let* body = body |> body_to_string;
       Lwt.return_error(RequestError(x, body));
     };
     */
};
