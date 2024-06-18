type http_failure = Http_types.http_failure =
  | NameLookupFailure
      (** DNS resolution failure - an IP address could not be resolved for the specified host **)
  | NoSupportedProtocol  (** The server has no supported HTTP protocol support (HTTP 1.1 or 2.0) *)
  | InvalidUri of Uri.t  (** The specified URI was invalid for a HTTP request *)
  | MalformedResponse of string
  | InvalidResponseBodyLength
  | ProtocolError of string
  | HttpException of exn

let pp_http_failure = Http_types.pp_http_failure

type method_ = Http_types.method_

let string_of_method = Httpun_types.Method.to_string

module type Client_intf = Http_client_intf.S
module type Eio_client_intf = Http_eio_client.S

module Client = Http_eio_client.Make (Http_eio_connection.M)
