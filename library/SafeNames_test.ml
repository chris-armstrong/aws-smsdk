open Base

[%%test_unit
let "symbolName" = [%test_result: string] (Util.symbolName "smithy.api#integer") ~expect:"integer"]

[%%test_unit
let "snakeCase BasicSnake" =
  [%test_result: string] (SafeNames.snakeCase "BasicSnake") ~expect:"basic_snake"]

[%%test_unit
let "snakeCase AWSSnake" =
  [%test_result: string] (SafeNames.snakeCase "AWSSnake") ~expect:"aws_snake"]

[%%test_unit
let "snakeCase MyMDGen" = [%test_result: string] (SafeNames.snakeCase "MyMDGen") ~expect:"my_md_gen"]

[%%test_unit
let "snakeCase Single" = [%test_result: string] (SafeNames.snakeCase "Single") ~expect:"single"]

[%%test_unit
let "snakeCase MD5Sum" = [%test_result: string] (SafeNames.snakeCase "MD5Sum") ~expect:"md5_sum"]

[%%test_unit
let "snakeCase AConfusingN523Value" =
  [%test_result: string]
    (SafeNames.snakeCase "AConfusingN523Value")
    ~expect:"a_confusing_n523_value"]
