open Base
open Markup
module Format = Stdlib.Format

module BasicDom = struct
  let equal_name (_, name1) (_, name2) = String.equal name1 name2
  let pp_name fmt ((_, name1) : string * string) = Fmt.pf fmt "%s" name1

  type t = Text of string | Element of string * (string * string) list * t list
  [@@deriving show, eq]

  let simple_element name children = Element (name, [], children)
  let text txt = Text txt
end

let html_to_tree html =
  let open BasicDom in
  html |> string |> parse_html |> signals
  |> tree
       ~text:(fun ss -> Text (String.concat ~sep:"" ss))
       ~element:(fun (_, name) attrs children ->
         Element (name, attrs |> List.map ~f:(fun ((_, name), value) -> (name, value)), children))
  |> Option.value ~default:(Text "")

let beginning_whitespace = Re.Perl.(re {|^[\t \n\r]+|} |> compile)
let trailing_whitespace = Re.Perl.(re {|[\t \n\r]+$|} |> compile)
let multi_whitespace_regex = Re.Perl.(re ~opts:[ `Multiline ] {|[\t \n\r]+|} |> compile)
let special_char_pattern = Re.Perl.(re ~opts:[ `Multiline ] {|\[|\]|\{|\}|} |> compile)

exception UnexpectedElement of string

type list_type = Unordered | Ordered | Undefined

type context = {
  fmt : Stdlib.Format.formatter;
  indent : int;
  list_type : list_type;
  first : bool;
  last : bool;
}

let context ?(first = true) ?(last = true) ~fmt ~indent ~list_type () =
  { fmt; indent; list_type; first; last }

let rec transform_children ~ctx children =
  let len = List.length children in
  List.iteri
    ~f:(fun index child ->
      let first = index = 0 in
      let last = index = len - 1 in
      let _ = transform ~ctx:{ ctx with first; last } child in
      ())
    children

and transform ~ctx dom =
  let { first; last; list_type; fmt; indent } = ctx in
  let indent_str = Int.to_string indent in
  let open BasicDom in
  ignore
    begin
      match dom with
      | Element ("p", _, children) ->
          Format.pp_open_vbox fmt 0;
          transform_children ~ctx children;
          Format.pp_force_newline fmt ();
          if not last then begin
            Format.pp_force_newline fmt ()
          end;
          Format.pp_close_box fmt ()
      | Element ("b", _, children) ->
          Fmt.pf fmt "{b ";
          transform_children ~ctx children;
          Fmt.pf fmt "}"
      | Element (("ul" as lt), _, children) | Element (("ol" as lt), _, children) ->
          Fmt.pf fmt "{";
          Fmt.pf fmt "%s" (if String.equal lt "ul" then "ul" else "ol");
          Format.pp_open_vbox fmt indent;
          Format.pp_print_cut fmt ();
          transform_children
            ~ctx:{ ctx with list_type = (if String.equal lt "ol" then Ordered else Unordered) }
            children;
          Format.pp_close_box fmt ();
          Format.pp_print_break fmt 0 indent;
          Fmt.pf fmt "}";
          Format.pp_print_break fmt 0 indent
      | Element ("li", _, children) ->
          Fmt.pf fmt "{- ";
          (* Fmt.pf fmt (if list_type == Unordered then "- " else "+ "); *)
          transform_children ~ctx children;
          Fmt.pf fmt "}";
          Format.pp_print_cut fmt ()
      | Element ("i", _, children) ->
          Fmt.pf fmt "{i ";
          transform_children ~ctx children;
          Fmt.pf fmt "}"
      | Element ("code", _, children) -> begin
          match children with
          | [] -> ()
          | [ Text str ] ->
              Fmt.pf fmt "[%s]"
                (str
                |> String.substr_replace_all ~pattern:"[" ~with_:"\\["
                |> String.substr_replace_all ~pattern:"]" ~with_:"\\]")
          | _ ->
              Fmt.pf fmt "@\n{[@\n";
              transform_children ~ctx children;
              Fmt.pf fmt "@\n]}@\n"
        end
      | Element ("pre", _, children) ->
          Fmt.pf fmt "{v";
          Format.pp_print_break fmt 0 0;
          let _ =
            match children with
            | [ Text str ] ->
                Format.pp_open_box fmt indent;
                Format.pp_print_break fmt 0 0;
                Format.pp_print_string fmt str;
                Format.pp_close_box fmt ()
            | _ -> raise (UnexpectedElement "<pre> tags should not contain other elements")
          in
          Format.pp_print_break fmt 0 0;
          Fmt.pf fmt "v}";
          Format.pp_print_break fmt 0 0
      | Element ("a", attrs, children) -> (
          let href = List.Assoc.find attrs ~equal:String.equal "href" in
          match href with
          | Some href -> begin
              Fmt.pf fmt "{{:%s}" href;
              transform_children ~ctx children;
              Fmt.pf fmt "}"
            end
          | None -> begin
              let link_href_fallback = match children with [ Text str ] -> str | _ -> "" in
              Fmt.pf fmt "[%s]" link_href_fallback
            end)
      | Element (_, _, children) -> transform_children ~ctx children
      | Text str ->
          let str =
            if first then Re.replace_string ~all:false beginning_whitespace ~by:"" str else str
          in
          let str =
            if last then Re.replace_string ~all:false trailing_whitespace ~by:"" str else str
          in
          let str = Re.replace_string ~all:true multi_whitespace_regex ~by:" " str in
          let str =
            str
            |> String.substr_replace_all ~pattern:"{" ~with_:"\\{"
            |> String.substr_replace_all ~pattern:"}" ~with_:"\\}"
            |> String.substr_replace_all ~pattern:"[" ~with_:"\\["
            |> String.substr_replace_all ~pattern:"]" ~with_:"\\]"
            |> String.substr_replace_all ~pattern:"@" ~with_:"\\@"
          in
          Format.pp_print_string fmt str
    end

and html_to_odoc ?(indent = 2) ?(start_indent = 4) html =
  let buffer = Buffer.create (String.length html) in
  let fmt = Format.formatter_of_buffer buffer in
  Format.pp_set_geometry ~max_indent:80 ~margin:100 fmt;
  if start_indent > 0 then Format.pp_open_vbox fmt start_indent;
  Format.pp_print_break fmt 0 0;
  html |> html_to_tree |> transform ~ctx:(context ~fmt ~indent ~list_type:Undefined ());
  Format.pp_close_box fmt ();
  Format.pp_print_flush fmt ();
  buffer |> Buffer.contents
