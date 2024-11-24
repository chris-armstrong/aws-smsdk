open Base

let sanitize str = str
(* |> String.substr_replace_all ~pattern:"\"\"\"" ~with_:"\"\\\"\"" *)
(* |> String.substr_replace_all ~pattern:"*)" ~with_:"* )" *)
(* |> String.substr_replace_all ~pattern:"(*" ~with_:"( *" *)

let generate traits =
  let docStrs =
    traits |> Option.value ~default:[]
    |> List.filter_map ~f:(fun trait ->
           match trait with Ast.Trait.DocumentationTrait str -> Some (sanitize str) | _ -> None)
  in
  if List.is_empty docStrs then None
  else begin
    let docStrs = List.concat [ [ "<body>" ]; docStrs; [ "</body>" ] ] in
    let docs = String.concat docStrs ~sep:"" |> Parse.Html.html_to_odoc in
    if not (docs |> String.is_empty) then Some (("(**{|" ^ docs) ^ "|}*)\n") else None
  end
