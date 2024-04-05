[@@@warning "-69"]

module Log =
  (val Logs.src_log
         (Logs.Src.create "awssdklib.http" ~doc:"AwsSdkLib Http implementation")
      : Logs.LOG)

let _ = Ssl.init ()

module StringHash = Hashtbl.Make (String)

module Response = struct
  type t = { status : int }

  let status response = response.status
end

module Body = struct
  type t = H2.Body.Reader.t

  let to_string body =
    let promise, resolver = Eio.Promise.create () in
    let body_string = ref String.empty in
    let rec read () =
      H2.Body.Reader.schedule_read body
        ~on_read:(fun s ~off ~len ->
          body_string := String.cat !body_string (Bigstringaf.to_string s);
          read ())
        ~on_eof:(fun () -> Eio.Promise.resolve resolver !body_string)
    in
    read ();
    Eio.Promise.await promise
end

type method_ =
  [ `GET
  | `POST
  | `CONNECT
  | `DELETE
  | `HEAD
  | `OPTIONS
  | `Other of string
  | `PUT
  | `TRACE ]

let string_of_method method_ = H2.Method.to_string method_

type headers = (string * string) list
type input_body = [ `String of string | `Form of (string * string list) list ]

exception InvalidUri of Uri.t

type connection = { client : H2_eio.Client.t; ssl_socket : Eio_ssl.t }

let connections : connection StringHash.t = StringHash.create 5

(* let body_to_string (body : body) =  *)
(* let body_of_string body = Cohttp_lwt.Body.of_string body *)

let error_handler error_promise err =
  let _ =
    match err with
    | `Exn exn -> Log.warn (fun m -> m "Exception: %s" (Printexc.to_string exn))
    | `Invalid_response_body_length response ->
        Log.warn (fun m ->
            m "Invalid response body length %a" H2.Response.pp_hum response)
    | `Malformed_response s ->
        Logs.warn (fun m -> m "Malformed response: %s@." s)
    | `Protocol_error (err, s) ->
        Logs.warn (fun m ->
            m "Protocol Error: %a %S@." H2.Error_code.pp_hum err s)
  in
  Eio.Promise.resolve error_promise (Error err)

let response_handler response_promise response body_reader =
  Logs.debug (fun m -> m "Response: %a@." H2.Response.pp_hum response);
  let status_code = H2.Status.to_code H2.Response.(response.status) in
  Eio.Promise.resolve_ok response_promise
    (Response.{ status = status_code }, body_reader)

let create_ssl_context () =
  let ctx = Ssl.create_context Ssl.TLSv1_2 Ssl.Client_context in
  Ssl.honor_cipher_order ctx;
  Ssl.set_context_alpn_protos ctx [ "h2" ];
  Ssl.set_min_protocol_version ctx Ssl.TLSv1_2;
  Ssl.set_max_protocol_version ctx Ssl.TLSv1_3;
  ctx

let resolve_address host port =
  let addresses =
    Eio_unix.run_in_systhread (fun () ->
        Unix.getaddrinfo host (Int.to_string port)
          [ Unix.AI_FAMILY Unix.PF_INET ])
    |> List.filter_map (fun (addr : Unix.addr_info) ->
           match addr.ai_addr with
           | Unix.ADDR_INET (addr, port) -> Some (addr, port)
           | _ -> None)
  in
  let addr =
    let inet, port = List.hd addresses in
    Logs.debug (fun m ->
        m "resolve_address: %s:%d -> %s:%d" host port
          (Unix.string_of_inet_addr inet)
          port);
    `Tcp (Eio_unix.Net.Ipaddr.of_unix inet, port)
  in
  addr

let create_or_retrieve_connection ~host ~port ~scheme ~error_handler ~sw network
    =
  match StringHash.find_opt connections host with
  | Some connection -> connection
  | None ->
      let ctx = create_ssl_context () in
      Format.printf "Resolving address for %s://%s:%d@." scheme host port;
      let addr = resolve_address host port in
      Format.printf "Establishing SSL Connection to %s:%d@." host port;
      let socket = Eio.Net.connect ~sw network addr in
      let sslctx = Eio_ssl.Context.create ~ctx socket in

      let ssl_socket = Eio_ssl.Context.ssl_socket sslctx in
      Ssl.set_client_SNI_hostname ssl_socket host;
      Ssl.set_hostflags ssl_socket [ Ssl.No_partial_wildcards ];
      Ssl.set_host ssl_socket host;
      Format.printf "Established SSL Connection@.";
      let ssl_socket = Eio_ssl.connect sslctx in
      let ssl_underlying_socket = Eio_ssl.Context.ssl_socket sslctx in
      Fmt.pr "SSL Details cipher=%s alpn=%s@."
        (ssl_underlying_socket |> Ssl.get_cipher |> Ssl.get_cipher_name)
        (ssl_underlying_socket |> Ssl.get_negotiated_alpn_protocol
        |> Option.value ~default:"<none>");
      let config = H2.Config.default in
      let client =
        H2_eio.Client.create_connection ~config ~sw ~error_handler ssl_socket
      in
      Format.printf "Established HTTP/2 connection@.";
      let connection = { client; ssl_socket } in
      StringHash.add connections host connection;
      connection

let request ~sw ~method_ ~uri ?headers ?body env =
  let network = Eio.Stdenv.net env in
  let host = Uri.host uri |> Option.map String.lowercase_ascii in
  let port = Uri.port uri |> Option.value ~default:443 in
  let scheme = Uri.scheme uri |> Option.value ~default:"https" in
  let response_promise, response_resolver =
    Eio.Promise.create ~label:"response" ()
  in
  let error_handler = error_handler response_resolver in
  let response_handler = response_handler response_resolver in
  match host with
  | Some host ->
      let connection =
        create_or_retrieve_connection ~host ~port ~scheme ~sw ~error_handler
          network
      in
      let headers =
        List.concat
          [
            [
              (":authority", host);
              ("accept", "text/html");
              ("user-agent", "ocaml/1.0.0-experimental");
            ];
            Option.value ~default:[] headers;
          ]
      in
      let path = Uri.path uri in
      Format.printf "Request: %s %s@." (H2.Method.to_string method_) path;
      let request =
        H2.Request.create
          ~headers:(H2.Headers.of_list headers)
          ~scheme method_ path
      in
      let body_string =
        match body with
        | Some (`String body) ->
            Format.printf "Write string body@.";
            Some body
        | Some (`Form body_values) ->
            Format.printf "Write form body@.";
            let body_string =
              Uri.encoded_of_query ~scheme:"utf-8" body_values
            in
            Some body_string
        | None ->
            Format.printf "Write empty request body@.";
            None
      in
      let body_writer =
        H2_eio.Client.request connection.client request ~error_handler
          ~response_handler ~flush_headers_immediately:true
      in
      Option.iter
        (fun body_string -> H2.Body.Writer.write_string body_writer body_string)
        body_string;
      H2.Body.Writer.close body_writer;
      Fmt.pr "Closed body writer.@.";
      let result = Eio.Promise.await response_promise in
      result
  | _ -> raise (InvalidUri uri)
