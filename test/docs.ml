open Parselib.Parse.Html

let mydom = (module BasicDom : Alcotest.TESTABLE with type t = BasicDom.t)

let test_text () =
  let input =
    "<body><p> All text nodes\r\n\
     with unnecessary\r\n\
     \t* line breaks\r\n\
     * and tabs\r\n\
     are cleaned up</p><p>and <code>code is formatted as code</code></p><pre>but pre blocks\n\
     \tare left alone</pre></body>"
  in
  Alcotest.(check string)
    "processes text correctly"
    ("All text nodes with unnecessary * line breaks * and tabs are cleaned up\n\n"
   ^ "and [code is formatted as code]\n\n" ^ "{v\nbut pre blocks\n\tare left alone\nv}")
    (html_to_odoc input)

let test_paragraphs () =
  let input = "<body><p>paragraph 1</p><p>paragraph 2</p></body>" in
  Alcotest.(check mydom)
    "parses dom correctly"
    BasicDom.(
      simple_element "body"
        [ simple_element "p" [ text "paragraph 1" ]; simple_element "p" [ text "paragraph 2" ] ])
    (html_to_tree input);
  Alcotest.(check string) "formats paragraphs" "paragraph 1\n\nparagraph 2\n\n" (html_to_odoc input)

let test_formatting () =
  let input = "<body><p>This is <b>some bold text</b> and <i>italics</i></p></body>" in
  Alcotest.(check string)
    "formats bold italic" "This is {b some bold text} and {i italics}\n\n" (html_to_odoc input)

let test_unordered_list () =
  let input = "<body><ul> <li>Item A</li><li><b>Item B</b></li></ul></body>" in
  Alcotest.(check string)
    "formats unordered lists" "- Item A\n- {b Item B}\n\n" (html_to_odoc input)

let test_link () =
  let input =
    "<p>It correctly transforms <a href=\"https://www.example.com\">a link containing</a> \
     something.</p>"
  in

  Alcotest.(check string)
    "correctly renders links"
    "It correctly transforms {{: https://www.example.com }a link containing} something.\n\n"
    (html_to_odoc input)

let test_suite =
  Alcotest.
    [
      test_case "Processes text correctly" `Quick test_text;
      test_case "Converts paragraphs" `Quick test_paragraphs;
      test_case "Converts formatting" `Quick test_formatting;
      test_case "Unordered list" `Quick test_unordered_list;
      test_case "Simple link" `Quick test_link;
    ]
