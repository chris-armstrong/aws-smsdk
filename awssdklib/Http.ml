module type Body  = sig type t val to_string : t -> string Lwt.t end
module type S  =
  sig
    type method_ = [ `GET  | `POST  | `PATCH ]
    type headers = (string * string) list
    type body
    type response
    val string_of_method : method_ -> string
    val body_to_string : body -> string Lwt.t
    val body_of_string : string -> body
    val request :
      method_:method_ ->
        uri:Uri.t -> headers:headers -> body:body -> (response * body) Lwt.t
    val response_status_code : response -> int
  end
module M : S =
  struct
    type method_ = [ `GET  | `POST  | `PATCH ]
    type headers = (string * string) list
    type body = Cohttp_lwt.Body.t
    let body_to_string (body : body) = Cohttp_lwt.Body.to_string body
    let body_of_string body = Cohttp_lwt.Body.of_string body
    type response = Cohttp_lwt.Response.t
    let string_of_method =
      function | `GET -> "GET" | `POST -> "POST" | `PATCH -> "PATCH"
    let request =
      (fun ~method_:method_ ->
         fun ~uri ->
           fun ~headers ->
             fun ~body ->
               let headers = Cohttp.Header.of_list headers in
               let method_ =
                 match method_ with
                 | `GET -> `GET
                 | `POST -> `POST
                 | `PATCH -> `PATCH in
               Cohttp_lwt_unix.Client.call ~headers ~body method_ uri : 
      method_:method_ ->
        uri:Uri.t -> headers:headers -> body:body -> (response * body) Lwt.t)
    let response_status_code response =
      (response |> Cohttp.Response.status) |> Cohttp.Code.code_of_status
  end 
