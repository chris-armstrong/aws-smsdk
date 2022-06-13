open Base;
open Aws;
open Cohttp_lwt;
open Cohttp_lwt_unix;

let service =
  Service.{namespace: "sqs", endpointPrefix: "sqs", version: "2012-11-05"};
let config =
  Config.{
    region: Some("ap-southeast-2"),
    authResolver: Auth.environmentAuthResolver,
  };

exception UnsupportedEncoding(string);

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

let listQueues: 'a => 'b =
  (input: SQS.listQueuesRequest) => {
    open Lwt.Syntax;
    let request =
      AwsQuery.makeRequest(
        ~service,
        ~config,
        ~action="ListQueues",
        ~fields=
          AwsQuery.[
            map_opt(map_string, ["NextToken"], input.nextToken),
            map_opt(map_int, ["MaxResults"], input.maxResults),
            map_opt(map_string, ["QueueNamePrefix"], input.queueNamePrefix),
          ],
      );
    let* (response, body) = request;
    let* body = Body.to_string(body);
    let status = Response.status(response);
    switch (status) {
    | `OK =>
      Stdio.printf("Success: %s\n", body);
      let ce = charset(response.headers);
      Stdio.printf(
        "Content-Type: %s\n",
        Option.value(
          Cohttp.Header.get(response.headers, "content-type"),
          ~default="unknown",
        ),
      );
      Stdio.printf("Charset: %s\n", Option.value(ce, ~default="unknown"));
      try({
        let xmlSource = ParseXml.source(~src=body, ~encoding=ce);
        ParseXml.readDtd(xmlSource);
        let _ =
          ParseXml.readSequence(
            xmlSource,
            "ListQueuesResponse",
            ~ns="http://queue.amazonaws.com/doc/2012-11-05/",
            _ => {
              // let result = ParseXml.readSequence(xmlSource, "ListQueuesResult", (_) => {
              //   let queueUrls = ParseXml.readOptionalElements(xmlSource, "QueueUrl", ());
              //   let nextToken = ParseXml.readOptionalElement(xmlSource, "NextToken", ());
              //   // SQS.({
              //   //   nextToken: nextToken,
              //   //   queueUrls: queueUrls,
              //   // })
              //   (queueUrls, nextToken)
              // }, ());
              let result =
                ParseXml.readSequence(
                  xmlSource,
                  "ListQueuesResult",
                  _ =>
                    {
                      let (nextToken, queueUrls) =
                        ParseXml.readItem2(
                          xmlSource,
                          {
                            tag: "NextToken",
                            type_: ParseXml.InputOptionalElement,
                          },
                          {
                            tag: "QueueUrl",
                            type_: ParseXml.InputOptionalElements,
                          },
                        );
                      Fmt.pr("nextToken: %a",Fmt.option(String.pp), nextToken);
                      let result: SQS.listQueuesResult = {
                        nextToken,
                        queueUrls,
                      };
                      result;
                    },
                    // (queueUrls, nextToken)
                  (),
                );
              let metadata =
                ParseXml.readSequence(
                  xmlSource,
                  "ResponseMetadata",
                  _ => {
                    let requestId =
                      ParseXml.readElement(xmlSource, "RequestId", ());
                    requestId;
                  },
                  (),
                );
              (metadata, result);
            },
            (),
          );
        ();
      }) {
      | ParseXml.XmlReadError(_, exp) =>
        Fmt.pr("XmlReadError: expected: %a", ParseXml.pp_expectedXml, exp)
      | ParseXml.ReadTypeError(exp) =>
        Fmt.pr("ReadTypeError: %s", exp)
      };
    | _ =>
      Stdio.printf(
        "Failure %d: %s",
        Cohttp.Code.code_of_status(status),
        body,
      )
    };
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
