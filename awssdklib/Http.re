module type Body = {
  type t;
  let to_string: t => Lwt.t(string);
};
module type S = {
  type method = [ | `GET | `POST | `PATCH];
  type headers = list((string, string));
  type body;
  type response;
  let string_of_method: method => string;
  let body_to_string: body => Lwt.t(string);
  let body_of_string: string => body;
  let request:
    (~method: method, ~uri: Uri.t, ~headers: headers, ~body: body) =>
    Lwt.t((response, body));
  let response_status_code: response => int;
};
module M: S = {
  type method = [ | `GET | `POST | `PATCH];
  type headers = list((string, string));
  type body = Cohttp_lwt.Body.t;
  let body_to_string = (body: body) => Cohttp_lwt.Body.to_string(body);
  let body_of_string = body => Cohttp_lwt.Body.of_string(body);
  type response = Cohttp_lwt.Response.t;
  let string_of_method =
    fun
    | `GET => "GET"
    | `POST => "POST"
    | `PATCH => "PATCH";
  let request:
    (~method: method, ~uri: Uri.t, ~headers: headers, ~body: body) =>
    Lwt.t((response, body)) =
    (~method, ~uri, ~headers, ~body) => {
      let headers = Cohttp.Header.of_list(headers);
      let method =
        switch (method) {
        | `GET => `GET
        | `POST => `POST
        | `PATCH => `PATCH
        };
      Cohttp_lwt_unix.Client.call(~headers, ~body, method, uri);
    };
  let response_status_code = response =>
    response |> Cohttp.Response.status |> Cohttp.Code.code_of_status;
};
