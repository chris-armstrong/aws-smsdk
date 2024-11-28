open Parselib.Parse.Html

let mydom = (module BasicDom : Alcotest.TESTABLE with type t = BasicDom.t)

let test_text () =
  let input =
    "<body><p> All text nodes\r\n\
     with unnecessary\r\n\
     \t* line breaks\r\n\
     * and tabs\r\n\
     are cleaned up</p><p>and <code>code is formatted as code</code></p>" ^ {|<pre>but pre blocks|}
    ^ "\n\t" ^ {|are left alone</pre>|} ^ "</body>"
  in
  Alcotest.(check string)
    "processes text correctly"
    ("All text nodes with unnecessary * line breaks * and tabs are cleaned up\n"
   ^ "and [code is formatted as code]\n" ^ "{vbut pre blocks\n\tare left alonev}\n")
    (html_to_odoc ~indent:0 ~start_indent:0 input)

let test_formatting () =
  let input = "<body><p>This is <b>some bold text</b> and <i>italics</i></p></body>" in
  Alcotest.(check string)
    "formats bold italic" "This is {b some bold text} and {i italics}"
    (html_to_odoc ~start_indent:0 ~indent:0 input)

let test_unordered_list () =
  let input = "<body><ul><li>Item A</li><li><b>Item B</b></li></ul></body>" in
  (* FIXME: This should only be indented 2 spaces, but is 4 (5 at the end) *)
  Alcotest.(check string)
    "formats unordered lists" "{ul\n     {- Item A}\n     {- {b Item B}}\n     }\n"
    (html_to_odoc ~start_indent:0 ~indent:2 input)

let test_link () =
  let input =
    "<p>It correctly transforms <a href=\"https://www.example.com\">a link containing</a> \
     something.</p>"
  in

  Alcotest.(check string)
    "correctly renders links"
    "It correctly transforms {{: https://www.example.com }a link containing} something."
    (html_to_odoc ~start_indent:0 ~indent:0 input)

let test_multi_paragraphs () =
  let input = "<body><p>This is <b>line 1</b></p><p>and this is line 2</p></body>" in

  Alcotest.(check string)
    "correct renders multiple paragraphs" "This is {b line 1}\nand this is line 2"
    (html_to_odoc ~start_indent:0 ~indent:0 input)

let test_suite =
  Alcotest.
    [
      test_case "Processes text correctly" `Quick test_text;
      test_case "Converts formatting" `Quick test_formatting;
      test_case "Unordered list" `Quick test_unordered_list;
      test_case "Simple link" `Quick test_link;
      test_case "Multiple paragraphs" `Quick test_multi_paragraphs;
    ]
