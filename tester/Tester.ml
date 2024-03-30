open Base
open Cohttp_lwt
open Cohttp_lwt_unix
open AwsSdkLib
let service =
  let open Aws.Service in
    { namespace = "sqs"; endpointPrefix = "sqs"; version = "2012-11-05" }
let xmlNamespace = "http://queue.amazonaws.com/doc/2012-11-05/"
let charset headers =
  let open Option in
    ((((headers |> (fun __x -> Cohttp.Header.get __x "content-type")) >>|
         (String.split ~on:';'))
        >>=
        (List.find
           ~f:(fun part ->
                 Str.string_match (Str.regexp_string "^charset=") part 0)))
       >>| (String.split ~on:'='))
      >>= List.last
let handle ~request  ~service  ~config  ~action  ~xmlNamespace  ~resultParser
   ~exceptionMapper  =
  let open Lwt.Syntax in
    let* (response, body) = request
     in
    let* body = Body.to_string body
     in
    let status = Response.status response in
    match status with
    | `OK ->
        let (requestId, result) =
          AwsSdkLib.AwsQuery.Response.parse_xml_ok_response ~action
            ~xmlNamespace ~body ~resultParser in
        Lwt.return (let open AwsSdkLib.Aws in { requestId; result })
    | _ ->
        let code = Cohttp.Code.code_of_status status in
        let (requestId, AwsSdkLib.AwsQuery.Error.{ errorType; code } ) =
          AwsSdkLib.AwsQuery.Response.parse_xml_error_response ~body in
        Lwt.fail (exceptionMapper ~errorType ~code ~requestId)
let exceptionMapper ~errorType  ~code  ~requestId  =
  let type_ =
    match errorType with
    | AwsQuery.Error.Sender -> Aws.ApiSenderType
    | AwsQuery.Error.Receiver -> Aws.ApiReceiverType in
  let errorDetails =
    let open Aws in
      { requestId; code; type_; details = (object (this)  end) } in
  match code with
  | "AWS.SimpleQueueService.InvalidBatchEntryId" ->
      ((SQS.InvalidBatchEntryId (errorDetails))[@explicit_arity ])
  | _ -> ((Aws.AwsError (errorDetails))[@explicit_arity ])
let listQueues (input : SQS.listQueuesRequest) =
  let open Lwt.Syntax in
    let action = "ListQueues" in
    let config = Aws.defaultConfig () in
    let request =
      AwsSdkLib.AwsQuery.Request.make ~service ~config ~action
        ~fields:(let open AwsSdkLib.AwsQuery.Request in
                   [map_opt map_string ["NextToken"] input.nextToken;
                   map_opt map_int ["MaxResults"] input.maxResults;
                   map_opt map_string ["QueueNamePrefix"]
                     input.queueNamePrefix]) in
    let* result =
      handle ~request ~service ~config ~action ~xmlNamespace
        ~resultParser:(fun xmlSource ->
                         let open AwsSdkLib.Xml.Parse.Structure in
                           let (nextToken, queueUrls) =
                             item2 xmlSource
                               {
                                 tag = "NextToken";
                                 type_ = InputStringElement
                               }
                               {
                                 tag = "QueueUrl";
                                 type_ = InputStringElements
                               } in
                           Fmt.pr "nextToken: %a" (Fmt.option String.pp)
                             nextToken;
                           (let result =
                              ({ nextToken; queueUrls } : SQS.listQueuesResult) in
                            result)) ~exceptionMapper
     in Lwt.return result
let listQueueTags (input : SQS.listQueueTagsRequest) =
  let open Lwt.Syntax in
    let action = "ListQueueTags" in
    let config = Aws.defaultConfig () in
    let request =
      AwsSdkLib.AwsQuery.Request.make ~service ~config ~action
        ~fields:(let open AwsSdkLib.AwsQuery.Request in
                   [map_required map_string ["QueueUrl"] input.queueUrl]) in
    let* result =
      handle ~request ~service ~config ~action ~xmlNamespace
        ~resultParser:(fun xmlSource ->
                         let open AwsSdkLib.Xml.Parse.Structure in
                           let tags =
                             item1 xmlSource
                               {
                                 tag = "Tag";
                                 type_ =
                                   ((InputStructuresElement
                                       ((fun xmlSource ->
                                           fun _ ->
                                             let (key, value) =
                                               item2 xmlSource
                                                 {
                                                   tag = "Key";
                                                   type_ = InputStringElement
                                                 }
                                                 {
                                                   tag = "Value";
                                                   type_ = InputStringElement
                                                 } in
                                             ((Xml.Parse.required "Key" key
                                                 xmlSource),
                                               (Xml.Parse.required "Value"
                                                  value xmlSource)))))
                                   [@explicit_arity ])
                               } in
                           let result = ({ tags } : SQS.listQueueTagsResult) in
                           result) ~exceptionMapper
     in Lwt.return result
module DynamoDBClient =
  struct
    type t = {
      config: Aws.config }
    let make (config : Aws.config) = { config }
  end
let tagResource (client : DynamoDBClient.t)
  (tagResource : DynamoDB.tagResourceInput) =
  let open Lwt.Syntax in
    let input = DynamoDB.Serialize.tagResourceInput_to_yojson tagResource in
    let* (status_code, body) =
      AwsSdkLib.AwsJson.make_request
        ~shapeName:(Fmt.str "%s.TagResource" "DynamoDB_20120810")
        ~service:DynamoDB.service ~config:(client.config) ~input
     in Lwt.return (status_code, body)
;;Lwt_main.run
    (tagResource (DynamoDBClient.make (Aws.defaultConfig ()))
       {
         resourceArn =
           "arn:aws:dynamodb:ap-southeast-2:201232004111:table/test-table";
         tags = [{ key = "test_tag"; value = "test_value" }]
       })