open Markup

module MyDom = struct
  let equal_name (_, name1) (_, name2) = String.equal name1 name2
  let pp_name fmt ((_, name1) : string * string) = Fmt.pf fmt "%s" name1

  type t = Text of string | Element of string * (name * string) list * t list
  [@@deriving show, eq]

  let simple_element name children = Element (name, [], children)
  let text txt = Text txt
end

let html_to_tree html =
  let open MyDom in
  html |> string |> parse_html |> signals
  |> tree
       ~text:(fun ss -> Text (String.concat "" ss))
       ~element:(fun (_, name) attrs children -> Element (name, attrs, children))
  |> Option.value ~default:(Text "")

let html_to_odoc html =
  let open MyDom in
  let rec transform ?(buf = Buffer.create 1) dom =
    let transform_children children =
      List.iter
        (fun child ->
          let _ = transform ~buf child in
          ())
        children
    in
    ignore
      begin
        match dom with
        | Element ("p", _, children) ->
            transform_children children;
            Buffer.add_string buf "\n\n"
        | Element ("b", _, children) ->
            Buffer.add_string buf "{b ";
            transform_children children;
            Buffer.add_string buf "}"
        | Element ("i", _, children) ->
            Buffer.add_string buf "{i ";
            transform_children children;
            Buffer.add_string buf "}"
        | Element (_, _, children) -> transform_children children
        | Text str -> Buffer.add_string buf str
      end;
    buf
  in
  html |> html_to_tree |> transform |> Buffer.to_bytes |> String.of_bytes
