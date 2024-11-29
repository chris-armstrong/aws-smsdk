open Base

let sanitize str = str
(* |> String.substr_replace_all ~pattern:"\"\"\"" ~with_:"\"\\\"\"" *)
(* |> String.substr_replace_all ~pattern:"*)" ~with_:"* )" *)
(* |> String.substr_replace_all ~pattern:"(*" ~with_:"( *" *)

type doc_type = FloatingComment | ItemComment | LabelComment

let start_comment_pattern = String.Search_pattern.create "(*"
let end_comment_pattern = String.Search_pattern.create "*)"
let at_of_doc_type = function FloatingComment -> "@" | ItemComment -> "@@" | LabelComment -> "@@@"

let generate type_ traits =
  let docStrs =
    traits |> Option.value ~default:[]
    |> List.filter_map ~f:(fun trait ->
           match trait with Ast.Trait.DocumentationTrait str -> Some (sanitize str) | _ -> None)
  in
  if List.is_empty docStrs then None
  else begin
    let docStrs = List.concat [ [ "<body>" ]; docStrs; [ "</body>" ] ] in
    let docs = String.concat docStrs ~sep:"" |> Parse.Html.html_to_odoc in
    match docs with
    | "" -> None
    | str
      when String.contains str '\"'
           || String.Search_pattern.matches start_comment_pattern str
           || String.Search_pattern.matches end_comment_pattern str ->
        Some
          ("[" ^ at_of_doc_type type_ ^ "ocaml.doc {| "
          ^ String.substr_replace_all ~pattern:"|}" ~with_:"|\\}" docs
          ^ " |}]\n")
    | str -> Some ("(** " ^ docs ^ " *)\n")
  end
