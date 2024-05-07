type method_ =
  [ `GET | `POST | `CONNECT | `DELETE | `HEAD | `OPTIONS | `Other of string | `PUT | `TRACE ]

type headers = (string * string) list
type input_body = [ `None | `String of string | `Form of (string * string list) list ]

type http_failure =
  | NoSupportedProtocol  (** The server has no supported HTTP protocol support (HTTP 1.1 or 2.0) *)
  | InvalidUri of Uri.t  (** The specified URI was invalid for a HTTP request *)
  | ConnectionError of string
  | MalformedResponse of string
  | InvalidResponseBodyLength
  | ProtocolError of string
  | HttpException of exn

let pp_http_failure fmt = function
  | NoSupportedProtocol -> Fmt.pf fmt "No supported protocol during TLS negotation"
  | InvalidUri u -> Fmt.pf fmt "Invalid URI: %a" Uri.pp u
  | ConnectionError e -> Fmt.pf fmt "Connection error: %s" e
  | MalformedResponse r -> Fmt.pf fmt "Malformed response"
  | InvalidResponseBodyLength -> Fmt.pf fmt "Invalid response body length"
  | ProtocolError e -> Fmt.pf fmt "Protocol error: %s" e
  | HttpException e -> Fmt.pf fmt "Unknown HTTP exception: %s" (Printexc.to_string e)
