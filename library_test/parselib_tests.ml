let () =
  Alcotest.run "Parselib" [ ("SafeNames", SafeNames_test.test_suite); ("Docs", Docs.test_suite) ]
