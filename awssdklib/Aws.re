open Base;

module DateTime = {
  let amzDate = now => {
    let Unix.{tm_year, tm_mon, tm_mday, _} = Unix.gmtime(now);
    Printf.sprintf("%04d%02d%02d", tm_year + 1900, tm_mon + 1, tm_mday);
  };
  let amzDateTime = now => {
    let Unix.{tm_year, tm_mon, tm_mday, tm_hour, tm_min, tm_sec, _} =
      Unix.gmtime(now);
    Printf.sprintf(
      "%04d%02d%02dT%02d%02d%02dZ",
      tm_year + 1900,
      tm_mon + 1,
      tm_mday,
      tm_hour,
      tm_min,
      tm_sec,
    );
  };
};

module Auth = {
  type t = {
    accessKeyId: string,
    secretAccessKey: string,
    sessionToken: option(string),
  };

  type resolver = unit => t;
  let environmentAuthResolver = () => {
    let accessKeyId = Sys.getenv("AWS_ACCESS_KEY_ID");
    let secretAccessKey = Sys.getenv("AWS_SECRET_ACCESS_KEY");
    let sessionToken = Sys.getenv("AWS_SESSION_TOKEN");
    let (accessKeyId, secretAccessKey) =
      Option.both(accessKeyId, secretAccessKey)
      |> Option.value_exn(
           ~message=
             "Could not resolve AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY from environment",
         );
    {accessKeyId, secretAccessKey, sessionToken};
  };
};

module Config = {
  type t = {
    region: option(string),
    authResolver: Auth.resolver,
  };
  let resolveAuth = ({authResolver, _}) => authResolver();
  let resolveRegion = ({region, _}) =>
    Option.value(region, ~default="us-east-1");
};

module Service = {
  type descriptor = {
    namespace: string,
    endpointPrefix: string,
    version: string,
  };
  let makeUri = (config: Config.t, service: descriptor) =>
    Uri.make(
      ~scheme="https",
      ~host=
        Printf.sprintf(
          "%s.%s.amazonaws.com",
          service.endpointPrefix,
          Config.resolveRegion(config),
        ),
      (),
    );
};

module Http = {
  type method = [
    | `GET
    | `POST
    | `PUT
    | `DELETE
    | `OPTIONS
    | `DELETE
    | `PATCH
    | `CONNECT
    | `HEAD
    | `TRACE
    | `Other(string)
  ];

};

module Sign = {
  module SHA256 = Digestif.SHA256;
  let sign_request =
      (
        ~config: Config.t,
        ~service: Service.descriptor,
        ~uri: Uri.t,
        ~method: Http.method,
        ~headers: list((string, string)),
        ~body: string,
      ) => {
    let httpRequestMethod =
      Cohttp.Code.string_of_method(method) |> String.uppercase;
    let canonicalUri =
      Uri.path(uri)
      |> Str.split(Str.regexp("/"))
      |> List.map(~f=Uri.pct_encode)
      |> String.concat
      |> (str => String.is_empty(str) ? "/" : "/" ++ str ++ "/");
    let canonicalQuery = "";
    let host = Option.value_exn(Uri.host(uri));
    let now = Unix.time();
    let xAmzDate = DateTime.amzDateTime(now);
    let auth = Config.resolveAuth(config);
    let extendedHeaders = List.concat([[
      ("X-Amz-Date", xAmzDate),
      ("Host", host),
    ],
      (Option.value_map(auth.sessionToken, ~f=token => [("X-Amz-Security-Token", token)], ~default=[])),
      headers,
    ]);
    let canonicalHeaders =
      (
        extendedHeaders
        |> List.map(~f=((key, value)) => (String.lowercase(key), value))
        |> List.sort(~compare=((key1, _), (key2, _)) =>
             String.compare(key1, key2)
           )
        |> List.map(~f=((key, value)) => key ++ ":" ++ value)
        |> String.concat(~sep="\n")
      )
      ++ "\n";
    let signedHeaders =
      extendedHeaders
      |> List.map(~f=((key, _)) => String.lowercase(key))
      |> List.sort(~compare=String.compare)
      |> String.concat(~sep=";");

    let hash =
      SHA256.digest_string(body) |> SHA256.to_hex |> String.lowercase;

    let canonicalRequest =
      httpRequestMethod
      ++ "\n"
      ++ canonicalUri
      ++ "\n"
      ++ canonicalQuery
      ++ "\n"
      ++ canonicalHeaders
      ++ "\n"
      ++ signedHeaders
      ++ "\n"
      ++ hash;
      Stdio.printf("canoncial, %s\n", canonicalRequest)
    let canonicalRequestHash =
      canonicalRequest
      |> Digestif.SHA256.digest_string
      |> Digestif.SHA256.to_hex
      |> String.lowercase;

    let algorithm = "AWS4-HMAC-SHA256";
    let date = DateTime.amzDate(now);
    let region = Config.resolveRegion(config);
    let credentialScope =
      date
      ++ "/"
      ++ region
      ++ "/"
      ++ service.namespace
      ++ "/aws4_request";
    let stringToSign =
      algorithm
      ++ "\n"
      ++ xAmzDate
      ++ "\n"
      ++ credentialScope
      ++ "\n"
      ++ canonicalRequestHash;

    let kSecret = auth.secretAccessKey;
    let kDate = SHA256.hmac_string(~key="AWS4" ++ kSecret, date);
    let kRegion =
      SHA256.hmac_string(
        ~key=SHA256.to_raw_string(kDate),
        region,
      );
    let kService =
      SHA256.hmac_string(
        ~key=SHA256.to_raw_string(kRegion),
        service.namespace,
      );
    let kSigning =
      SHA256.hmac_string(
        ~key=SHA256.to_raw_string(kService),
        "aws4_request",
      );

    let signature =
      SHA256.hmac_string(~key=SHA256.to_raw_string(kSigning), stringToSign)
      |> SHA256.to_hex
      |> String.lowercase;
    let authorization =
      Printf.sprintf(
        "%s Credential=%s/%s, SignedHeaders=%s, Signature=%s",
        algorithm,
        auth.accessKeyId,
        credentialScope,
        signedHeaders,
        signature,
      );

    [("Authorization", authorization), ...extendedHeaders];
  };
};
