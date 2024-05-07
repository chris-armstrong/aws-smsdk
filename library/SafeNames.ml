open Base
open Util
module StringSet = Set

let reservedWords =
  StringSet.of_list
    (module String)
    [
      "open";
      "private";
      "as";
      "external";
      "public";
      "protected";
      "string";
      "bool";
      "integer";
      "object";
      "type";
      "let";
      "and";
      "open";
      "float";
      "timestamp";
      "include";
      "boolean";
      "unit";
      "switch";
      "match";
      "for";
      "in";
      "while";
      "do";
      "export";
      "int";
      "tagList";
      "option";
      "Option";
      "Some";
      "None";
      "Result";
      "Ok";
      "Error";
      "constraint";
    ]

let uppercaseStartRe = Str.regexp "^\\([A-Z]*\\)\\(.*\\)$"
let uppercaseRe = Str.regexp "\\([A-Z][A-Z0-9]+[A-Z]\\|[A-Z]+\\)\\([^A-Z]*\\)"

let translateBadChars name =
  (name
  |> String.map ~f:(fun char ->
         match[@ns.braces] char with
         | 'A' .. 'Z' -> char
         | 'a' .. 'z' -> char
         | '0' .. '9' -> char
         | _ -> '_'))
  [@ns.braces]

let translateReserved (name : string) =
  if StringSet.exists ~f:(fun word -> String.equal word name) reservedWords then name ^ "_"
  else name

let stripLeadingNumbers name =
  if String.length name = 0 then name
  else (
    match name.[0] with
    | '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' -> {js|x|js} ^ name
    | _ -> name)

let snakeCase name =
  let start_pos = ref 0 in
  let name_len = String.length name in
  let components : string list ref = ref [] in
  while !start_pos < name_len do
    try
      let next_pos = Str.search_forward uppercaseRe name !start_pos in
      let upperpart = Str.matched_group 1 name in
      let lowerpart = Str.matched_group 2 name in
      if String.length upperpart > 1 then (
        (* sequence of uppercase characters - convert all but one to their own group *)
        let group_len = String.length upperpart - 1 in
        let group = Str.string_before upperpart group_len |> String.lowercase in
        components := group :: !components;
        start_pos := !start_pos + group_len)
      else (
        (* one uppercase followed by some not-upper *)
        let group_len = String.length lowerpart + 1 in
        let group = String.lowercase upperpart ^ lowerpart in
        components := group :: !components;
        start_pos := !start_pos + group_len)
    with Stdlib.Not_found ->
      components := Str.string_after name !start_pos :: !components;
      start_pos := name_len + 1
  done;
  !components |> List.rev |> String.concat ~sep:"_" |> stripLeadingNumbers |> translateReserved

let safeMemberName = snakeCase

(* let matched = Str.string_match uppercaseStartRe name 0 in *)
(* if matched *)
(* then *)
(*   let upperpart = Str.matched_group 1 name in *)
(*   let remaining = Str.matched_group 2 name in *)
(*   let upperLength = String.length upperpart in *)
(*   let first = *)
(*     ((if upperLength > 0 *)
(*       then String.lowercase (String.sub upperpart ~pos:0 ~len:upperLength) *)
(*       else "") *)
(*     [@ns.ternary ]) in *)
(*   (((first ^ remaining) |> stripLeadingNumbers) |> translateReserved) |> *)
(*     translateBadChars *)
(* else *)
(*   ((name |> stripLeadingNumbers) |> translateReserved) |> translateBadChars *)
let safeTypeName target =
  (let name = symbolName target in
   let namespace = symbolNamespace target in
   match namespace with "smithy.api" -> safeMemberName ("Base" ^ name) | _ -> safeMemberName name)
  [@ns.braces]

let safeFunctionName = safeTypeName

let camelCase name =
  String.uppercase (String.sub name ~pos:0 ~len:1)
  ^ String.sub name ~pos:1 ~len:(String.length name - 1)

let safeConstructorName name = name |> symbolName |> camelCase
let variantReplaceRe = Str.regexp "-|#|:|\\.|/| |\\(|\\)|\\\\`"

let safeVariantName name =
  (name
  |> Str.global_replace variantReplaceRe "_"
  |> String.substr_replace_all ~pattern:"*" ~with_:"Star"
  |> String.split ~on:'_'
  |> List.filter_map ~f:(fun x ->
         (if String.length x > 0 then Some (camelCase x) [@explicit_arity] [@ns.braces] else None)
         [@ns.ternary])
  |> String.concat ~sep:"_")
  [@ns.braces]
