module type Body  = sig type t val to_string : t -> string end
module type Response = sig end

module StringHash = Hashtbl.Make (String )

exception InvalidUri of Uri.t
module type S  =
  sig
    type method_ = [ `GET  | `POST  | `PATCH ]
    type headers = (string * string) list
    type body
    type response
    val string_of_method : method_ -> string
    (* val body_to_string : body -> string Lwt.t *)
    (* val body_of_string : string -> body *)
    (* val request : *)
    (*   sw: Eio.Switch.t -> *)
    (*   method_:method_ -> *)
    (*     uri:Uri.t -> headers:headers -> body:string -> (response * body) *)
    (* val response_status_code : response -> int *)
  end
module M : S =
  struct
    type connection = { client: H2_eio.Client.t; ssl_socket: Eio_ssl.t }
    let connections : connection StringHash.t = StringHash.create 5
    type method_ = [ `GET  | `POST  | `PATCH ]
    type headers = (string * string) list
    type body = { body: H2.Body.Writer.t }
    (* let body_to_string (body : body) =  *)
    (* let body_of_string body = Cohttp_lwt.Body.of_string body *)
    type response = { response: H2.Response.t }
    let string_of_method =
      function | `GET -> "GET" | `POST -> "POST" | `PATCH -> "PATCH"

    let error_handler err =
      let _ = (match err with 
      | `Exn exn -> ();
      | `Invalid_response_body_length response -> ();
      | `Malformed_response s -> (); 
      | `Protocol_error (err, s) -> Format.printf "Protocol Error: %a %S@." H2.Error_code.pp_hum err s)
      in ()
      (* Eio.Promise.resolve u () *)

    let create_ssl_context () =
      let ctx = Ssl.create_context Ssl.TLSv1_3 Ssl.Client_context in
      Ssl.honor_cipher_order ctx;
      Ssl.set_context_alpn_protos ctx ["h2"];
      Ssl.set_min_protocol_version ctx Ssl.TLSv1_3;
      Ssl.set_max_protocol_version ctx Ssl.TLSv1_3;
      ctx

    let resolve_address host port = 
      let addresses = Eio_unix.run_in_systhread (
        fun () -> Unix.getaddrinfo host (Int.to_string port)[Unix.AI_FAMILY Unix.PF_INET]
    ) |> List.filter_map (fun (addr: Unix.addr_info) -> match addr.ai_addr with
      | Unix.ADDR_INET (addr, port) -> Some (addr, port)
      | _ -> None) in
      let addr = 
        let inet, port = List.hd addresses in
          `Tcp (Eio_unix.Net.Ipaddr.of_unix inet, port) in
      addr

    let request ~method_ ~uri ~headers ~body ~sw env =
      let network = Eio.Stdenv.net env in
      let host = Uri.host uri |> Option.map(String.lowercase_ascii) in
      let port = Uri.port uri |> Option.value ~default:443 in
      let scheme = Uri.scheme uri |> Option.value ~default:"https" in
      match (host) with
      | Some host ->
          let connection = (match (StringHash.find_opt connections host) with
            | Some connection -> connection
            | None -> (
              let ctx = create_ssl_context () in
              let addr = resolve_address host port in
              let socket = Eio.Net.connect ~sw network addr in
              let sslctx = Eio_ssl.Context.create ~ctx socket in
              let ssl_socket = Eio_ssl.Context.ssl_socket sslctx in
              Ssl.set_client_SNI_hostname ssl_socket host ;
              Ssl.set_host ssl_socket host ;
              Ssl.set_hostflags ssl_socket [No_partial_wildcards];
              
              let ssl_socket = Eio_ssl.connect sslctx in
              let client = H2_eio.Client.create_connection ~sw ~error_handler ssl_socket in
              { client; ssl_socket }
              )
          ) in
          let request = H2.Request.create ~headers ~scheme
            method_ (Uri.path uri) in
          let body_writer = H2_eio.Client.request connection.client request
            ~error_handler
            ~response_handler
          in
          H2.Body.Writer.write_string body ();


      | _ -> raise (InvalidUri uri)
    (* let response_status_code response = *)
    (*   (response |> Cohttp.Response.status) |> Cohttp.Code.code_of_status *)
  end 
