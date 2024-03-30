module SerializeHelpers =
  struct
    type t = Yojson.Safe.t
    let string_to_yojson (x : string) = (`String x : t)
    let int_to_yojson (x : int) = (`Int x : t)
    let long_to_yojson (x : int) = (`Int x : t)
    let float_to_yojson (x : float) = (`Float x : t)
    let double_to_yojson (x : float) = (`Float x : t)
    let list_to_yojson (converter : 'a -> t) (x : 'a list) =
      (`List (List.map converter x) : t)
    let big_int_to_yojson (x : int64) = (`Int (Int64.to_int x) : t)
    let bool_to_yojson (x : bool) = (`Bool x : t)
    let assoc_to_yojson (x : (string * t option) list) =
      (`Assoc
         (List.filter_map
            (fun (name, value) ->
               match value with
               | ((Some (value))[@explicit_arity ]) ->
                   ((Some ((name, value))))
               | None -> None) x) : t)
    let blob_to_yojson (x : Bytes.t) =
      (`String (Base64.encode_exn (Bytes.to_string x)) : t)
    let big_decimal_to_yojson (x : string) = (`String x : t)
    let map_to_yojson (converter : 'a -> t) (x : (string * 'a) list) =
      (`Assoc (List.map (fun (name, value) -> (name, (converter value))) x) : 
      t)
    let timestamp_to_yojson = float_to_yojson
    let option_to_yojson (converter : 'a -> t) (x : 'a option) =
      Option.map converter x
  end
