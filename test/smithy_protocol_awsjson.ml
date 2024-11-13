open Smaws_Lib
open Http_mock

let service =
  Service.
    {
      namespace = "DummyService";
      version = "20000101";
      endpointPrefix = "dummy";
      protocol = AwsJson_1_0;
    }

let config = Config.make ~resolveRegion:(fun () -> "us-east-1") ~resolveAuth:Auth.fromDummy

(** Example type for serialising / deserialising with protocol *)
module HelloType = struct
  type t = { hello : bool option } [@@deriving eq, show]

  (** dummy deserializer for type *)
  let deserialize_type_of_yojson yj path =
    Json.DeserializeHelpers.(
      let o = assoc_of_yojson yj path in
      { hello = option_of_yojson (value_for_key bool_of_yojson "Hello") o path })
end

(** Wrapper for error type to enable Alcotest comparison *)
module ErrorType = struct
  type t =
    [ AwsErrors.t
    | `HttpError of Http.http_failure
    | `JsonParseError of Json.DeserializeHelpers.jsonParseError ]
  [@@deriving show, eq]
end

let testableType = (module HelloType : Alcotest.TESTABLE with type t = HelloType.t)
let testableErrorType = (module ErrorType : Alcotest.TESTABLE with type t = ErrorType.t)

let default_error_deserializer tree path =
  (Protocols.AwsJson.error_deserializer Protocols.AwsJson.Errors.default_handler) tree path

let test_simple () =
  (* Construct HTTP Mock *)
  let module HttpMock = (val create_http_mock ()) in
  let http = HttpMock.make () in

  (* Set mock response body *)
  HttpMock.mock_response ~body:"{}" ();

  (* Functorize protocol (AwsJson) implementation *)
  let module Protocol = Protocols.Unbound.AwsJson.Make (HttpMock) in
  let serialize_result =
    Protocol.request ~shape_name:"Test_Shape" ~http ~input:(`Assoc []) ~config ~service
      ~output_deserializer:HelloType.deserialize_type_of_yojson
      ~error_deserializer:default_error_deserializer
  in
  Alcotest.(check @@ result testableType testableErrorType)
    "deserialises response correctly" serialize_result
    (Ok HelloType.{ hello = None });
  let request = HttpMock.last_request () in
  Alcotest.(check (testable Http.pp_method_ Http.equal_method_))
    "used correct HTTP method" request.method_ `POST;
  Alcotest.(check @@ option string)
    "Uses correct host" (Uri.host request.uri) (Some "dummy.us-east-1.amazonaws.com");
  Alcotest.(check @@ option @@ testable Http.pp_input_body Http.equal_input_body)
    "Uses correctly serialized request body"
    (Some (`String "{}"))
    request.body;
  Alcotest.(check @@ option string)
    "Sends correct Content-Type header" (Some "application/x-amz-json-1.0")
    (List.assoc_opt "Content-Type" request.headers);
  Alcotest.(check @@ option string)
    "Sends correct shape name in headers" (Some "Test_Shape")
    (List.assoc_opt "X-Amz-Target" request.headers)

let test_suite = [ Alcotest.test_case "Basic" `Quick test_simple ]
