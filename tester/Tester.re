open Base;
open Cohttp_lwt;
open Cohttp_lwt_unix;
open AwsSdkLib;

let service =
  Aws.Service.{
    namespace: "sqs",
    endpointPrefix: "sqs",
    version: "2012-11-05",
  };

let xmlNamespace = "http://queue.amazonaws.com/doc/2012-11-05/";
let config =
  Aws.Config.{
    region: Some("ap-southeast-2"),
    authResolver: Aws.Auth.environmentAuthResolver,
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

let handle =
    (
      ~request,
      ~service,
      ~config,
      ~action,
      ~xmlNamespace,
      ~resultParser,
      ~exceptionMapper,
    ) => {
  open Lwt.Syntax;
  let* (response, body) = request;
  let* body = Body.to_string(body);
  let status = Response.status(response);
  switch (status) {
  | `OK =>
    let (requestId, result) =
      AwsSdkLib.AwsQuery.Response.parse_xml_ok_response(
        ~action,
        ~xmlNamespace,
        ~body,
        ~resultParser,
      );
    Lwt.return(AwsSdkLib.Aws.{requestId, result});
  | _ =>
    let code = Cohttp.Code.code_of_status(status);
    let (requestId, AwsSdkLib.AwsQuery.Error.{errorType, code}) =
      AwsSdkLib.AwsQuery.Response.parse_xml_error_response(~body);
    Lwt.fail(exceptionMapper(~errorType, ~code, ~requestId));
  };
};

let exceptionMapper = (~errorType, ~code, ~requestId) => {
  let type_ =
    switch (errorType) {
    | AwsQuery.Error.Sender => Aws.ApiSenderType
    | AwsQuery.Error.Receiver => Aws.ApiReceiverType
    };
  let errorDetails = Aws.{
                       requestId,
                       code,
                       type_,
                       details: {},
                     };
  switch (code) {
  | "AWS.SimpleQueueService.InvalidBatchEntryId" =>
    SQS.InvalidBatchEntryId(errorDetails)
  | _ => Aws.AwsError(errorDetails)
  };
};

let listQueues = (input: SQS.listQueuesRequest) => {
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
  let* result =
    handle(
      ~request,
      ~service,
      ~config,
      ~action,
      ~xmlNamespace,
      ~resultParser=
        xmlSource => {
          open AwsSdkLib.Xml.Parse.Structure;
          let (nextToken, queueUrls) =
            item2(
              xmlSource,
              {tag: "NextToken", type_: InputStringElement},
              {tag: "QueueUrl", type_: InputStringElements},
            );
          Fmt.pr("nextToken: %a", Fmt.option(String.pp), nextToken);
          let result: SQS.listQueuesResult = {nextToken, queueUrls};
          result;
        },
      ~exceptionMapper,
    );
  Lwt.return(result);
};

let listQueueTags = (input: SQS.listQueueTagsRequest) => {
  open Lwt.Syntax;
  let action = "ListQueueTags";
  let request =
    AwsSdkLib.AwsQuery.Request.make(
      ~service,
      ~config,
      ~action,
      ~fields=
        AwsSdkLib.AwsQuery.Request.[
          map_required(map_string, ["QueueUrl"], input.queueUrl),
        ],
    );

  let* result =
    handle(
      ~request,
      ~service,
      ~config,
      ~action,
      ~xmlNamespace,
      ~resultParser=
        xmlSource => {
          open AwsSdkLib.Xml.Parse.Structure;
          let tags =
            item1(
              xmlSource,
              {
                tag: "Tag",
                type_:
                  InputStructuresElement(
                    (xmlSource, _) => {
                      let (key, value) = item2(
                        xmlSource,
                        {tag: "Key", type_: InputStringElement},
                        {tag: "Value", type_: InputStringElement},
                      );
                      (Xml.Parse.required("Key", key, xmlSource), Xml.Parse.required("Value", value, xmlSource));
                    },
                  ),
              },
            );
          let result: SQS.listQueueTagsResult = { tags : tags };
          result;
        },
      ~exceptionMapper,
    );
  Lwt.return(result);
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
         Fmt.pr("Rethrowing: %a\n", Exn.pp, exn);
         raise(exn);
       },
     ),
);
