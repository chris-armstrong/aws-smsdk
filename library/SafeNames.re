open Base;
open Core;
open Util;

module StringSet = Set.Make(String);
let reservedWords = StringSet.of_list([
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
]);

let uppercaseStartRe = Str.regexp("^\\([A-Z]*\\)\\(.*\\)$");

let translateBadChars = name =>
  [@ns.braces]
  (
    name
    |> String.map(~f=char =>
         [@ns.braces]
         (
           switch char {
             | 'A'..'Z' => char;
             | 'a'..'z' => char;
             | '0'..'9' => char;
             | _ => '_';
           }
         )
       )
  );

let translateReserved = (name: string) =>
  (
    if (StringSet.exists(~f=(word => String.equal(word,name)), reservedWords)) {
      name ++ "_";
    } else {
      name;
    }
  );

let stripLeadingNumbers = name =>

    if (String.length(name) == 0) {
      name;
    } else {
      switch (String.nget(name,0)) {
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
        let upperpart = Str.matched_group(0, name);
        let remaining = Str.matched_group(1, name);
        let upperLength = String.length(upperpart);
        let first =
          [@ns.ternary]
          (
            if (upperLength > 0) {
              String.lowercase(
                String.slice(upperpart, 0, upperLength - 1)
                ++ String.slice(upperpart, upperLength - 1, upperLength),
              );
            } else {
              "";
            }
          );
        (first ++ remaining)
        |>stripLeadingNumbers
        |>translateReserved
        |>translateBadChars;
    } else {
      name|>stripLeadingNumbers|>translateReserved|>translateBadChars;
    };
  };

let safeTypeName = target =>
  [@ns.braces]
  {
    let name = symbolName(target);
    let namespace = symbolNamespace(target);
    switch namespace {
      | "smithy.api" => safeMemberName("Base" ++ name);
      | _ => safeMemberName(name);
    }
  };

let camelCase = name =>
  String.uppercase(String.slice(name, 0, 1))
  ++ String.slice(name, 1, String.length(name))

let variantReplaceRe = Str.regexp(
    "-|#|:|\\.|/| |\\(|\\)|\\\\`",
  );
let safeVariantName = name =>
  [@ns.braces]
  (
    name
    |>(Str.global_replace(variantReplaceRe, "_"))
    |>(String.substr_replace_all(~pattern="*", ~with_="Star"))
    |>(String.split(~on='_'))
    |>(
        List.filter_map(~f=x =>
          [@ns.ternary]
          (
            if (String.length(x) > 0) {
              [@ns.braces] Some(camelCase(x));
            } else {
              None;
            }
          )
        )
      )
    |>(String.concat(~sep="_"))
  );
