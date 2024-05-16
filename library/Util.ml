open Base

let symbolName str =
  str |> String.split ~on:'#' |> (fun __x -> List.nth __x 1) |> Option.value ~default:str

let symbolNamespace str =
  str |> String.split ~on:'#' |> (fun __x -> List.nth __x 0) |> Option.value ~default:str

let symbolPair str = str |> String.split ~on:'#' |> fun l -> (List.nth_exn l 0, List.nth_exn l 1)
