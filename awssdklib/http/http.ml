include Http_types

module type Client_intf = Http_client_intf.S
module type Eio_client_intf = Http_eio_client.S

module Client = Http_eio_client.Make (Http_eio_connection.M)
