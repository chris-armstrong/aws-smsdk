open Base;
let symbolName = str => {
  str|>String.split(~on='#')|>List.nth(_, 1)|>Option.value(~default=str);
}

let symbolNamespace = str => {
  str|>String.split(~on='#')|>List.nth(_, 0)|>Option.value(~default=str);
}