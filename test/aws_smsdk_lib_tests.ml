let () =
  Alcotest.run "Aws_SmSdk_Lib"
    [
      ("Protocols/AwsJson 1.0 & 1.1", Smithy_protocol_awsjson.test_suite);
      ("Docs/Converter", Docs.test_suite);
    ]
