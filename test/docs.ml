open Parselib.Parse.Html

let mydom = (module MyDom : Alcotest.TESTABLE with type t = MyDom.t)

let test_paragraphs () =
  let input = "<body><p>paragraph 1</p><p>paragraph 2</p></body>" in
  Alcotest.(check mydom)
    "parses dom correctly"
    MyDom.(
      simple_element "body"
        [ simple_element "p" [ text "paragraph 1" ]; simple_element "p" [ text "paragraph 2" ] ])
    (html_to_tree input);
  Alcotest.(check string) "formats paragraphs" "paragraph 1\n\nparagraph 2\n\n" (html_to_odoc input)

let test_formatting () =
  let input = "<body><p>This is <b>some bold text</b> and <i>italics</i></p></body>" in
  Alcotest.(check string)
    "formats bold italic" "This is {b some bold text} and {i italics}\n\n" (html_to_odoc input)

let test_suite =
  Alcotest.
    [
      test_case "Converts paragraphs" `Quick test_paragraphs;
      test_case "Converts formatting" `Quick test_formatting;
    ]
