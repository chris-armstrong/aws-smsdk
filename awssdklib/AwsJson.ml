exception RequestError of int * string 
let make_request ~shapeName:(shapeName : string) 
  ~service:(service : Aws.Service.descriptor)  ~config:(config : Aws.config) 
  ~input:(input : Yojson.Safe.t)  =
  let open Http.M in
    let open Lwt.Syntax in
      let uri = Aws.Service.makeUri config service in
      let body = Yojson.Safe.to_string input in
      let headers =
        [("Content-Type", "application/x-amz-json-1.0");
        ("X-Amz-Target", shapeName)] in
      let* auth = config.resolveAuth ()
       in
      let region = config.resolveRegion () in
      let headers =
        Aws.Sign.sign_request ~auth ~region ~service ~uri ~method_:`POST
          ~headers ~body in
      let body = body_of_string body in
      let* (response, body) = request ~method_:`POST ~headers ~body ~uri
       in
      let* body = body |> body_to_string
       in Lwt.return ((response |> response_status_code), body)
