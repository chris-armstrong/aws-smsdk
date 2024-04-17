module Log =
  (val Logs.src_log (Logs.Src.create "awssdklib.Aws" ~doc:"AwsSdkLib Http implementation")
      : Logs.LOG)

module DateTime = struct
  let amzDate now =
    let Unix.{ tm_year; tm_mon; tm_mday; _ } = Unix.gmtime now in
    Printf.sprintf "%04d%02d%02d" (tm_year + 1900) (tm_mon + 1) tm_mday

  let amzDateTime now =
    let Unix.{ tm_year; tm_mon; tm_mday; tm_hour; tm_min; tm_sec; _ } = Unix.gmtime now in
    Printf.sprintf "%04d%02d%02dT%02d%02d%02dZ" (tm_year + 1900) (tm_mon + 1) tm_mday tm_hour tm_min
      tm_sec
end

type 'a apiResult = { result : 'a; requestId : string }
type emptyErrorDetails = < >
type apiErrorType = ApiSenderType | ApiReceiverType
type 'a apiError = { requestId : string; code : string; type_ : apiErrorType; details : 'a }

exception AwsError of emptyErrorDetails apiError

module Auth = struct
  type t = { accessKeyId : string; secretAccessKey : string; sessionToken : string option }

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
        (AuthError "Could not resolve AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY from environment"
        [@explicit_arity])

  let load_ini_file_res file_path =
    try Ok (Ini.load_ini file_path)
    with Eio.Exn.Io _ as ex ->
      Error (AuthError (Fmt.str "Unable to load ~/.aws/credentials: %a" Eio.Exn.pp ex))

  let load_credentials_profiles env =
    let home_dir = Sys.getenv "HOME" in
    load_ini_file_res Eio.Path.(Eio.Stdenv.fs env / home_dir / ".aws" / "credentials")

  let load_config_profiles env =
    let home_dir = Sys.getenv "HOME" in
    load_ini_file_res Eio.Path.(Eio.Stdenv.fs env / home_dir / ".aws" / "config")
    |> Result.map (fun kvps ->
           List.filter_map
             (fun (section_name, values) ->
               match section_name with
               | "default" -> Some (section_name, values)
               | s when String.starts_with ~prefix:"profile " s ->
                   Some (String.sub s 8 (String.length s - 8) |> String.trim, values)
               | _ -> None)
             kvps)

  type profile = {
    aws_access_key_id : string;
    aws_secret_access_key : string;
    aws_session_token : string option;
    role_arn : string option;
    output : string option;
  }

  let read_profile profile_name profiles =
    let profile_section = List.assoc_opt profile_name profiles in

    match profile_section with
    | Some profile_values -> (
        match
          ( profile_values |> List.assoc_opt "aws_access_key_id",
            profile_values |> List.assoc_opt "aws_secret_access_key",
            profile_values |> List.assoc_opt "aws_session_token" )
        with
        | Some aws_access_key, Some aws_secret_key, aws_session_token ->
            {
              aws_access_key_id = aws_access_key;
              aws_secret_access_key = aws_secret_key;
              aws_session_token;
              role_arn = None;
              output = None;
            }
        | _ ->
            raise
              (AuthError
                 (Fmt.str "Profile '%s' missing aws_access_key_id or aws_secret_access_key"
                    profile_name)))
    | None ->
        raise (AuthError (Fmt.str "Unable to find profile '%s' in credentials file" profile_name))

  let fromProfile env ?profile_name () =
    try
      let profile_name = Option.value profile_name ~default:"default" in
      let credentials_file = load_credentials_profiles env in
      let config_file = load_config_profiles env in

      let profiles =
        match (config_file, credentials_file) with
        | Ok config_file, Ok credentials_file -> List.concat [ config_file; credentials_file ]
        | Ok config_file, Error _ -> config_file
        | _, Ok credentials_file -> credentials_file
        | Error e, _ -> raise e
      in

      let { aws_access_key_id; aws_secret_access_key; aws_session_token; _ } =
        read_profile profile_name profiles
      in
      {
        accessKeyId = aws_access_key_id;
        secretAccessKey = aws_secret_access_key;
        sessionToken = aws_session_token;
      }
    with Not_found ->
      raise (AuthError "Unable to find $HOME in environment for loading AWS profile")
end

type config = { resolveAuth : unit -> Auth.t; resolveRegion : unit -> string }

let defaultConfig () =
  let auth = Auth.fromEnvironment () in
  let region = Sys.getenv_opt "AWS_DEFAULT_REGION" |> Option.value ~default:"us-east-1" in
  let resolveRegion () = region in
  let resolveAuth () = auth in
  { resolveRegion; resolveAuth }

module Service = struct
  type descriptor = { namespace : string; endpointPrefix : string; version : string }

  let makeUri config (service : descriptor) =
    Uri.make ~scheme:"https"
      ~host:(Printf.sprintf "%s.%s.amazonaws.com" service.endpointPrefix (config.resolveRegion ()))
      ()
end

module Sign = struct
  module SHA256 = Digestif.SHA256

  let sign_request ~(auth : Auth.t) ~(region : string) ~(service : Service.descriptor)
      ~(uri : Uri.t) ~(method_ : Http.method_) ~(headers : (string * string) list) ~(body : string)
      =
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
    let hash = SHA256.digest_string body |> SHA256.to_hex |> String.lowercase_ascii in
    let canonicalRequest =
      httpRequestMethod ^ "\n" ^ canonicalUri ^ "\n" ^ canonicalQuery ^ "\n" ^ canonicalHeaders
      ^ "\n" ^ signedHeaders ^ "\n" ^ hash
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
    let kSecret = auth.secretAccessKey in
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
        auth.accessKeyId credentialScope signedHeaders signature
    in
    ("Authorization", authorization) :: extendedHeaders
  (* sign a request using the AWSv4 algorithm 
    *)
end
