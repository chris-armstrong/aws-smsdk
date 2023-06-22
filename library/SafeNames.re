open Base;
open Util;

module StringSet = Set;
let reservedWords =
  StringSet.of_list(
    (module String),
    [
      "open",
      "private",
      "as",
      "external",
      "public",
      "protected",
      "string",
      "bool",
      "integer",
      "object",
      "type",
      "let",
      "and",
      "open",
      "float",
      "timestamp",
      "include",
      "boolean",
      "unit",
      "switch",
      "match",
      "for",
      "in",
      "while",
      "do",
      "export",
      "int",
      "tagList",
      "option",
      "Option",
      "Some",
      "None",
      "Result",
      "Ok",
      "Error",
      "constraint",
    ],
  );

let uppercaseStartRe = Str.regexp("^\\([A-Z]*\\)\\(.*\\)$");

let translateBadChars = name =>
  [@ns.braces]
  (
    name
    |> String.map(~f=char =>
         [@ns.braces]
         (
           switch (char) {
           | 'A' .. 'Z' => char
           | 'a' .. 'z' => char
           | '0' .. '9' => char
           | _ => '_'
           }
         )
       )
  );

let translateReserved = (name: string) =>
  if (StringSet.exists(~f=word => String.equal(word, name), reservedWords)) {
    name ++ "_";
  } else {
    name;
  };

let stripLeadingNumbers = name =>
  if (String.length(name) == 0) {
    name;
  } else {
    switch (name.[0]) {
    | '0'
    | '1'
    | '2'
    | '3'
    | '4'
    | '5'
    | '6'
    | '7'
    | '8'
    | '9' => {js|x|js} ++ name
    | _ => name
    };
  };

let safeMemberName = name => {
  let matched = Str.string_match(uppercaseStartRe, name, 0);
  if (matched) {
    let upperpart = Str.matched_group(1, name);
    let remaining = Str.matched_group(2, name);
    let upperLength = String.length(upperpart);
    let first =
      [@ns.ternary]
      (
        if (upperLength > 0) {
          String.lowercase(String.sub(upperpart, ~pos=0, ~len=upperLength));
        } else {
          "";
        }
      );
    first
    ++ remaining
    |> stripLeadingNumbers
    |> translateReserved
    |> translateBadChars;
  } else {
    name |> stripLeadingNumbers |> translateReserved |> translateBadChars;
  };
};

let safeTypeName = target =>
  [@ns.braces]
  {
    let name = symbolName(target);
    let namespace = symbolNamespace(target);
    switch (namespace) {
    | "smithy.api" => safeMemberName("Base" ++ name)
    | _ => safeMemberName(name)
    };
  };

let camelCase = name =>
  String.uppercase(String.sub(name, ~pos=0, ~len=1))
  ++ String.sub(name, ~pos=1, ~len=String.length(name) - 1);
let safeConstructorName = name => name |> symbolName |> camelCase;

let variantReplaceRe = Str.regexp("-|#|:|\\.|/| |\\(|\\)|\\\\`");
let safeVariantName = name =>
  [@ns.braces]
  (
    name
    |> Str.global_replace(variantReplaceRe, "_")
    |> String.substr_replace_all(~pattern="*", ~with_="Star")
    |> String.split(~on='_')
    |> List.filter_map(~f=x =>
         [@ns.ternary]
         (
           if (String.length(x) > 0) {
             [@ns.braces] Some(camelCase(x));
           } else {
             None;
           }
         )
       )
    |> String.concat(~sep="_")
  );
