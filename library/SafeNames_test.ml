open Base
[%%test_unit
  let "symbolName" =
    ([%test_result : string]) (Util.symbolName "smithy.api#integer")
      ~expect:"integere"]