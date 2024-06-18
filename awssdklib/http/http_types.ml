type method_ =
  [ `GET | `POST | `CONNECT | `DELETE | `HEAD | `OPTIONS | `Other of string | `PUT | `TRACE ]
[@@deriving show, eq]

let string_of_method = Httpun_types.Method.to_string

type headers = (string * string) list [@@deriving show, eq]

type input_body = [ `None | `String of string | `Form of (string * string list) list ]
[@@deriving show, eq]

type http_failure =
  | NameLookupFailure
  | NoSupportedProtocol  (** The server has no supported HTTP protocol support (HTTP 1.1 or 2.0) *)
  | InvalidUri of Uri.t  (** The specified URI was invalid for a HTTP request *)
  | MalformedResponse of string
  | InvalidResponseBodyLength
  | ProtocolError of string
  | HttpException of exn

let pp_http_failure fmt = function
  | NameLookupFailure -> Fmt.pf fmt "Unable to resolve host"
  | NoSupportedProtocol -> Fmt.pf fmt "No supported protocol during TLS negotation"
  | InvalidUri u -> Fmt.pf fmt "Invalid URI: %a" Uri.pp u
  | MalformedResponse r -> Fmt.pf fmt "Malformed response"
  | InvalidResponseBodyLength -> Fmt.pf fmt "Invalid response body length"
  | ProtocolError e -> Fmt.pf fmt "Protocol error: %s" e
  | HttpException e -> Fmt.pf fmt "Unknown HTTP exception: %s" (Printexc.to_string e)

let equal_http_failure lhs rhs =
  match (lhs, rhs) with
  | NameLookupFailure, NameLookupFailure -> true
  | NoSupportedProtocol, NoSupportedProtocol -> true
  | InvalidUri l, InvalidUri r -> Uri.equal l r
  | MalformedResponse l, MalformedResponse r -> String.equal l r
  | InvalidResponseBodyLength, InvalidResponseBodyLength -> true
  | ProtocolError l, ProtocolError r -> String.equal l r
  | HttpException l, HttpException r -> l = r
  | _, _ -> false
