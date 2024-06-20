let () =
  Alcotest.run "Protocols" [ ("Protocols/AwsJson 1.0 & 1.1", Smithy_protocol_awsjson.test_suite) ]
