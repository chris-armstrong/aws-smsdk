open Base;
let%test_unit "symbolName" = [%test_result: string] (Util.symbolName("smithy.api#integer"), ~expect="integere")