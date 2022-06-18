open Base;
open Cohttp_lwt;
open Cohttp_lwt_unix;
open AwsSdkLib.Aws;

let service =
  Service.{namespace: "sqs", endpointPrefix: "sqs", version: "2012-11-05"};
let config =
  Config.{
    region: Some("ap-southeast-2"),
    authResolver: Auth.environmentAuthResolver,
  };

let charset = headers =>
  Option.(
    headers
    |> Cohttp.Header.get(_, "content-type")
    >>| String.split(~on=';')
    >>= List.find(~f=part =>
          Str.string_match(Str.regexp_string("^charset="), part, 0)
        )
    >>| String.split(~on='=')
    >>= List.last
  );

type awsError = { requestId: string, code: string };
exception AwsError(awsError);

let handle = (~request, ~service, ~config, ~action, ~xmlNamespace, ~resultParser, ~exceptionMapper) => {
  open Lwt.Syntax;
  let* (response, body) = request;
  let* body = Body.to_string(body);
  let status = Response.status(response);
  switch (status) {
  | `OK =>
    Lwt.return(AwsSdkLib.AwsQuery.Response.parse_xml_ok_response(
      ~action,
      ~xmlNamespace,
      ~body,
      ~resultParser
    ))
  | _ => {
    let code = Cohttp.Code.code_of_status(status);
    let (requestId, AwsSdkLib.AwsQuery.Error.{ errorType, code }) = AwsSdkLib.AwsQuery.Response.parse_xml_error_response(
      ~body,
    );
    Lwt.fail(exceptionMapper(~errorType, ~code, ~requestId));
  }
  };

}

let exceptionMapper = (~errorType, ~code, ~requestId) => {
  // switch (code) {
  //   | "AWS.SimpleQueueService.InvalidBatchEntryId" => raise(SQS.InvalidBatchEntryId);
  // }
  AwsError({requestId, code});
}

let listQueues: 'a => 'b =
  (input: SQS.listQueuesRequest) => {
    open Lwt.Syntax;
    let action = "ListQueues";
    let request =
      AwsSdkLib.AwsQuery.Request.make(
        ~service,
        ~config,
        ~action,
        ~fields=
          AwsSdkLib.AwsQuery.Request.[
            map_opt(map_string, ["NextToken"], input.nextToken),
            map_opt(map_int, ["MaxResults"], input.maxResults),
            map_opt(map_string, ["QueueNamePrefix"], input.queueNamePrefix),
          ],
      );
    let* result = handle(
      ~request,
      ~service,
      ~config,
      ~action,
      ~xmlNamespace="http://queue.amazonaws.com/doc/2012-11-05/",
      ~resultParser= (xmlSource) => {
        open AwsSdkLib.Xml.Parse.UnorderedRead;
        let (nextToken, queueUrls) =
          item2(
            xmlSource,
            {
              tag: "NextToken",
              type_: InputStringElement,
            },
            {
              tag: "QueueUrl",
              type_: InputStringElements,
            },
          );
        Fmt.pr("nextToken: %a",Fmt.option(String.pp), nextToken);
        let result: SQS.listQueuesResult = {
          nextToken,
          queueUrls,
        };
        result;
      },
      ~exceptionMapper,
    )
    Lwt.return_unit;
  };

Lwt_main.run(
  (
    () =>
      listQueues({
        maxResults: Some(1),
        queueNamePrefix: None,
        nextToken: None,
      })
  )
  |> Lwt.catch(
       _,
       exn => {
         Fmt.pr("Exception %a", Exn.pp, exn);
         Lwt.return_unit;
       },
     ),
);
