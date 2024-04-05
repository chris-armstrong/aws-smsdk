module DateTime = struct
  let amzDate now =
    let Unix.{ tm_year; tm_mon; tm_mday; _ } = Unix.gmtime now in
    Printf.sprintf "%04d%02d%02d" (tm_year + 1900) (tm_mon + 1) tm_mday

  let amzDateTime now =
    let Unix.{ tm_year; tm_mon; tm_mday; tm_hour; tm_min; tm_sec; _ } =
      Unix.gmtime now
    in
    Printf.sprintf "%04d%02d%02dT%02d%02d%02dZ" (tm_year + 1900) (tm_mon + 1)
      tm_mday tm_hour tm_min tm_sec
end

type region = string
type 'a apiResult = { result : 'a; requestId : string }
type emptyErrorDetails = < >
type apiErrorType = ApiSenderType | ApiReceiverType

type 'a apiError = {
  requestId : string;
  code : string;
  type_ : apiErrorType;
  details : 'a;
}

exception AwsError of emptyErrorDetails apiError

module Auth = struct
  type t = {
    accessKeyId : string;
    secretAccessKey : string;
    sessionToken : string option;
  }

  exception AuthError of string

  type resolver = unit -> t

  let fromEnvironment () =
    try
      let accessKeyId = Sys.getenv "AWS_ACCESS_KEY_ID" in
      let secretAccessKey = Sys.getenv "AWS_SECRET_ACCESS_KEY" in
      let sessionToken = Sys.getenv_opt "AWS_SESSION_TOKEN" in
      { accessKeyId; secretAccessKey; sessionToken }
    with _ ->
      raise
        (AuthError
           "Could not resolve AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY from \
            environment"
        [@explicit_arity])
end

type config = { resolveAuth : unit -> Auth.t; resolveRegion : unit -> string }

let defaultConfig () =
  let auth = Auth.fromEnvironment () in
  let region =
    Sys.getenv_opt "AWS_DEFAULT_REGION" |> Option.value ~default:"us-east-1"
  in
  let resolveRegion () = region in
  let resolveAuth () = auth in
  { resolveRegion; resolveAuth }

module Service = struct
  type descriptor = {
    namespace : string;
    endpointPrefix : string;
    version : string;
  }

  let makeUri config (service : descriptor) =
    Uri.make ~scheme:"https"
      ~host:
        (Printf.sprintf "%s.%s.amazonaws.com" service.endpointPrefix
           (config.resolveRegion ()))
      ()
end

module Sign = struct
  module SHA256 = Digestif.SHA256

  let sign_request ~(auth : Auth.t) ~(region : string)
      ~(service : Service.descriptor) ~(uri : Uri.t) ~(method_ : Http.method_)
      ~(headers : (string * string) list) ~(body : string) =
    let httpRequestMethod =
      Http.string_of_method method_ |> String.uppercase_ascii
    in
    let canonicalUri =
      Uri.path uri
      |> Str.split (Str.regexp "/")
      |> List.map (fun str -> Uri.pct_encode str)
      |> String.concat "/"
      |> fun str ->
      match String.equal str "" with true -> "/" | false -> "/" ^ str ^ "/"
    in
    let canonicalQuery = "" in
    let host = Option.get (Uri.host uri) in
    let now = Unix.time () in
    let xAmzDate = DateTime.amzDateTime now in
    let extendedHeaders =
      List.concat
        [
          [ ("X-Amz-Date", xAmzDate); ("Host", host) ];
          auth.sessionToken
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
    let hash =
      SHA256.digest_string body |> SHA256.to_hex |> String.lowercase_ascii
    in
    let canonicalRequest =
      httpRequestMethod ^ "\n" ^ canonicalUri ^ "\n" ^ canonicalQuery ^ "\n"
      ^ canonicalHeaders ^ "\n" ^ signedHeaders ^ "\n" ^ hash
    in
    Stdio.printf "canoncial, %s\n" canonicalRequest;
    let canonicalRequestHash =
      canonicalRequest |> Digestif.SHA256.digest_string
      |> Digestif.SHA256.to_hex |> String.lowercase_ascii
    in
    let algorithm = "AWS4-HMAC-SHA256" in
    let date = DateTime.amzDate now in
    let credentialScope =
      date ^ "/" ^ region ^ "/" ^ service.namespace ^ "/aws4_request"
    in
    let stringToSign =
      algorithm ^ "\n" ^ xAmzDate ^ "\n" ^ credentialScope ^ "\n"
      ^ canonicalRequestHash
    in
    let kSecret = auth.secretAccessKey in
    let kDate = SHA256.hmac_string ~key:("AWS4" ^ kSecret) date in
    let kRegion = SHA256.hmac_string ~key:(SHA256.to_raw_string kDate) region in
    let kService =
      SHA256.hmac_string ~key:(SHA256.to_raw_string kRegion) service.namespace
    in
    let kSigning =
      SHA256.hmac_string ~key:(SHA256.to_raw_string kService) "aws4_request"
    in
    let signature =
      SHA256.hmac_string ~key:(SHA256.to_raw_string kSigning) stringToSign
      |> SHA256.to_hex |> String.lowercase_ascii
    in
    let authorization =
      Printf.sprintf "%s Credential=%s/%s, SignedHeaders=%s, Signature=%s"
        algorithm auth.accessKeyId credentialScope signedHeaders signature
    in
    ("Authorization", authorization) :: extendedHeaders
end
