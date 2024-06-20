module SHA256 = Digestif.SHA256

module Log =
  (val Logs.src_log (Logs.Src.create "Aws_SmSdk_Lib.Sign" ~doc:"AWS Signing Algorithm") : Logs.LOG)

let sign_request_v4 ~(config : Config.t) ~(service : Service.descriptor) ~(uri : Uri.t)
    ~(method_ : Http.method_) ~(headers : (string * string) list) ~(body : string) =
  let region = Config.(config.resolveRegion ()) in
  let auth = Config.(config.resolveAuth ()) in
  let httpRequestMethod = Http.string_of_method method_ |> String.uppercase_ascii in
  let canonicalUri =
    Uri.path uri
    |> Str.split (Str.regexp "/")
    |> List.map (fun str -> Uri.pct_encode str)
    |> String.concat "/"
    |> fun str -> match String.equal str "" with true -> "/" | false -> "/" ^ str ^ "/"
  in
  let canonicalQuery = "" in
  let host = Option.get (Uri.host uri) in
  let now = Unix.time () in
  let xAmzDate = DateTime.amzDateTime now in
  let extendedHeaders =
    List.concat
      [
        [ ("X-Amz-Date", xAmzDate); ("Host", host) ];
        auth.session_token
        |> Option.map (fun token -> [ ("X-Amz-Security-Token", token) ])
        |> Option.value ~default:[];
        headers;
      ]
  in
  let canonicalHeaders =
    (extendedHeaders
    |> List.map (fun (key, value) -> (String.lowercase_ascii key, value))
    |> List.sort (fun (key1, _) (key2, _) -> String.compare key1 key2)
    |> List.map (fun (key, value) -> key ^ ":" ^ value)
    |> String.concat "\n")
    ^ "\n"
  in
  let signedHeaders =
    extendedHeaders
    |> List.map (fun (key, _) -> String.lowercase_ascii key)
    |> List.sort String.compare |> String.concat ";"
  in
  let hash = SHA256.digest_string body |> SHA256.to_hex |> String.lowercase_ascii in
  let canonicalRequest =
    httpRequestMethod ^ "\n" ^ canonicalUri ^ "\n" ^ canonicalQuery ^ "\n" ^ canonicalHeaders ^ "\n"
    ^ signedHeaders ^ "\n" ^ hash
  in
  Logs.debug (fun m -> m "signed_request: %s" canonicalRequest);
  let canonicalRequestHash =
    canonicalRequest |> Digestif.SHA256.digest_string |> Digestif.SHA256.to_hex
    |> String.lowercase_ascii
  in
  let algorithm = "AWS4-HMAC-SHA256" in
  let date = DateTime.amzDate now in
  let credentialScope = date ^ "/" ^ region ^ "/" ^ service.namespace ^ "/aws4_request" in
  let stringToSign =
    algorithm ^ "\n" ^ xAmzDate ^ "\n" ^ credentialScope ^ "\n" ^ canonicalRequestHash
  in
  let kSecret = auth.secret_access_key in
  let kDate = SHA256.hmac_string ~key:("AWS4" ^ kSecret) date in
  let kRegion = SHA256.hmac_string ~key:(SHA256.to_raw_string kDate) region in
  let kService = SHA256.hmac_string ~key:(SHA256.to_raw_string kRegion) service.namespace in
  let kSigning = SHA256.hmac_string ~key:(SHA256.to_raw_string kService) "aws4_request" in
  let signature =
    SHA256.hmac_string ~key:(SHA256.to_raw_string kSigning) stringToSign
    |> SHA256.to_hex |> String.lowercase_ascii
  in
  let authorization =
    Printf.sprintf "%s Credential=%s/%s, SignedHeaders=%s, Signature=%s" algorithm
      auth.access_key_id credentialScope signedHeaders signature
  in
  ("Authorization", authorization) :: extendedHeaders
(* sign a request using the AWSv4 algorithm 
    *)
