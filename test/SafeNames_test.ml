open Parselib.Codegen

let test_symbol_name () =
  Alcotest.(check @@ string) "symbolName" (Util.symbolName "smithy.api#integer") "integer"

let test_snake_case () =
  Alcotest.(check @@ string) "snakeCase BasicSnake" (SafeNames.snakeCase "BasicSnake") "basic_snake";
  Alcotest.(check @@ string) "snakeCase AWSSnake" (SafeNames.snakeCase "AWSSnake") "aws_snake";

  Alcotest.(check string) "snakeCase MyMDGen" (SafeNames.snakeCase "MyMDGen") "my_md_gen";

  Alcotest.(check string) "snakeCase Single" (SafeNames.snakeCase "Single") "single";

  Alcotest.(check string) "snakeCase MD5Sum" (SafeNames.snakeCase "MD5Sum") "md5_sum";

  Alcotest.(check string)
    "snakeCase AConfusingN523Value"
    (SafeNames.snakeCase "AConfusingN523Value")
    "a_confusing_n523_value"

let test_suite =
  [
    Alcotest.test_case "SymbolName" `Quick test_symbol_name;
    Alcotest.test_case "Snake Case" `Quick test_snake_case;
  ]
