let make_request =
    (
      ~service: Aws.Service.descriptor,
      ~config: Aws.Config.t,
      ~input: Yojson.Safe.t,
    ) => {
  open Http.M;
  open Lwt.Syntax;
  let uri = Aws.Service.makeUri(config, service);
  let body = Yojson.Safe.to_string(input);
  let headers = [];
  let headers =
    Aws.Sign.sign_request(
      ~config,
      ~service,
      ~uri,
      ~method=`POST,
      ~headers,
      ~body,
    );
  let body = body_of_string(body);

  let* (response, body) = request(~method=`POST, ~headers, ~body, ~uri);
  switch (response |> Http.M.response_status_code) {
  | 200 => Lwt.return_ok(body |> body_to_string)
  | _ as x => Lwt.return_error((x, body |> body_to_string))
  };
};
