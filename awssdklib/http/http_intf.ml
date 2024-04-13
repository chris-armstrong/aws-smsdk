type method_ =
  [ `GET | `POST | `CONNECT | `DELETE | `HEAD | `OPTIONS | `Other of string | `PUT | `TRACE ]

type headers = (string * string) list
type input_body = [ `None | `String of string | `Form of (string * string list) list ]

exception InvalidUri of Uri.t
exception ConnectionError of H2.Client_connection.error
exception NoSupportedProtocol
