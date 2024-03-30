open Base
let symbolName str =
  ((str |> (String.split ~on:'#')) |> (fun __x -> List.nth __x 1)) |>
    (Option.value ~default:str)
let symbolNamespace str =
  ((str |> (String.split ~on:'#')) |> (fun __x -> List.nth __x 0)) |>
    (Option.value ~default:str)