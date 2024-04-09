let hash = Str.regexp "#"
let section_marker = Str.regexp "\\[[ \\t]*\\(.+\\)[ \\t]*\\]"
let value_marker = Str.regexp "\\(.+\\)=\\(.+\\)"

exception InvalidFormat of string

let load_ini path =
  Eio.Path.with_lines path (fun lines ->
      let sections : (string * (string * string) list) list ref = ref [] in
      let section : string option ref = ref None in
      let values : (string * string) list ref = ref [] in
      let push_section () =
        if Option.is_some !section then (
          sections := (!section |> Option.get, !values |> List.rev) :: !sections;
          section := None;
          values := [])
      in
      Seq.iteri
        (fun line_no line ->
          Fmt.pr "[%d] %s@." line_no line;
          let without_comment =
            line |> Str.split hash |> List.hd_opt |> Option.value ~default:""
          in
          if Str.string_match section_marker without_comment 0 then (
            push_section ();
            section := Some (Str.matched_group 1 without_comment))
          else if Str.string_match value_marker without_comment 0 then (
            if Option.is_none !section then
              raise
                (InvalidFormat
                   (Fmt.str "value without section on line %d" line_no));
            let key = Str.matched_group 1 without_comment |> String.trim in
            let value = Str.matched_group 2 without_comment |> String.trim in
            values := (key, value) :: !values)
          else if not (without_comment |> String.trim |> String.length = 0) then
            raise (InvalidFormat (Fmt.str "could not parse line %d" line_no)))
        lines;
      push_section ();
      !sections |> List.rev)
