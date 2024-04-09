include Stdlib.List

let hd_opt list = match list with value :: _ -> Some value | [] -> None
