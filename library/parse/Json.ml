open Base
open Yojson

module Decode = struct
  type t = Basic.t

  let flatMap_result = Base.Result.bind

  let optionToResult opt errorString =
    match opt with Some result -> Ok result | None -> Error errorString

  type nonrec jsonTreeRef = { tree : t; path : string }
  type jsonObject = (string, t) List.Assoc.t
  type nonrec jsonObjectRef = { object_ : jsonObject; path : string }

  type nonrec jsonParseError =
    | SyntaxError of string
    | WrongType of string * string
    | NoValueError of string
    | RecordParseError of string * string
    | CustomError of string

  type jsonTreeResult = (jsonTreeRef, jsonParseError) Result.t

  let jsonParseErrorToString error =
    match error with
    | SyntaxError error -> {js|Syntax Error: |js} ^ error
    | WrongType (path, expected) ->
        (({js|Wrong Type Error: |js} ^ expected) ^ {js| was expected at path |js}) ^ path
    | NoValueError path -> {js|No Value Error: expected a value at |js} ^ path
    | ((RecordParseError (path, suberror)) [@implicit_arity]) ->
        (({js|Record parse error: at path |js} ^ path) ^ {js| received record parse error - |js})
        ^ suberror
    | CustomError error -> {js|Other parse error: |js} ^ error

  let parseJsonString jsonString rootParser =
    (let treeResult =
       try Ok (Yojson.Basic.from_string jsonString)
       with Yojson.Json_error err -> Error (SyntaxError err)
     in
     let open Base.Result in
     treeResult >>= fun [@u] tree -> rootParser (Ok { tree; path = "$" }))
    [@ns.braces]

  let parseJsonFile jsonFile rootParser =
    (let treeResult =
       try Ok (Yojson.Basic.from_file jsonFile)
       with Yojson.Json_error err -> Error (SyntaxError err)
     in
     let open Base.Result in
     treeResult >>= fun [@u] tree -> rootParser (Ok { tree; path = "$" }))
    [@ns.braces]

  type nonrec 'a parser = (jsonTreeRef, jsonParseError) Result.t -> ('a, jsonParseError) Result.t

  let parseObject (x : jsonTreeResult) : (jsonObjectRef, jsonParseError) Result.t =
    let open Result in
    x >>= fun [@u] { tree; path } ->
    match tree with `Assoc items -> Ok { object_ = items; path } | _ -> Error (NoValueError path)

  let parseRecord recordParser (recordObject : jsonTreeResult) =
    recordObject |> parseObject
    |> Result.bind ~f:(fun { object_; path } ->
           List.fold
             ~f:(fun records (key, value) ->
               Result.bind records ~f:(fun recordsValue ->
                   let record = recordParser key (Ok { path = path ^ {|.|} ^ key; tree = value }) in
                   match record with
                   | Ok recordValue -> Ok (recordValue :: recordsValue)
                   | Error (CustomError y) -> Error (RecordParseError (path ^ "." ^ key, y))
                   | Error x -> Error x))
             ~init:(Ok []) object_)

  let parseString x =
    Result.bind x ~f:(fun { tree; path } ->
        match tree with `String str -> Ok str | _ -> Error (WrongType ("string", path)))

  let parseNumber x =
    Result.bind x ~f:(fun [@u] { tree; path } ->
        match tree with
        | `Int num -> Ok (Int.to_float num)
        | `Float num -> Ok num
        | _ -> Error (WrongType (path, "number")))

  let parseInteger x =
    Result.bind x ~f:(fun [@u] { tree; path } ->
        match tree with `Int i -> Ok i | _ -> Error (WrongType (path, "integer")))

  let parseArray itemParser arrayRef =
    let open Result in
    arrayRef >>= fun [@u] { tree; path } ->
    match tree with
    | `List arr ->
        Base.List.foldi arr
          ~f:(fun i progress next ->
            progress >>= fun [@u] items ->
            let record =
              itemParser (Ok { path = (path ^ {js|.|js}) ^ Int.to_string i; tree = next })
            in
            match record with
            | Ok recordValue -> Ok (Base.List.append items [ recordValue ])
            | Error y -> Error y)
          ~init:(Ok [])
    | _ -> Error (WrongType (path, "array") [@implicit_arity])

  let raw (recordObject : (jsonTreeRef, jsonParseError) Result.t) =
    let open Result in
    recordObject >>= fun { tree; path } -> Ok tree

  let field fieldName objectRef =
    let open Result in
    objectRef >>= fun [@u] { object_; path } ->
    match List.Assoc.find object_ ~equal:String.equal fieldName with
    | Some fieldValue -> Ok { tree = fieldValue; path = (path ^ {js|.|js}) ^ fieldName }
    | None -> Error (NoValueError ((path ^ {js|.|js}) ^ fieldName))

  let optional (decodedResult : ('a, jsonParseError) Result.t) =
    match decodedResult with
    | Ok value -> Ok (Some value)
    | Error error -> ( match error with NoValueError _ -> Ok None | _ -> Error error)
end

module ResultHelpers = struct
  let map2 result1 result2 mapper =
    match (result1, result2) with
    | Ok result1, Ok result2 -> Ok (mapper result1 result2)
    | Error error1, _ -> Error error1
    | _, Error error2 -> Error error2

  let map3 result1 result2 result3 mapper =
    match (result1, result2, result3) with
    | Ok result1, Ok result2, Ok result3 -> Ok (mapper result1 result2 result3)
    | Error error1, _, _ -> Error error1
    | _, Error error2, _ -> Error error2
    | _, _, Error error3 -> Error error3

  let map4 r1 r2 r3 r4 mapper =
    match (r1, r2, r3, r4) with
    | Ok r1, Ok r2, Ok r3, Ok r4 -> Ok (mapper r1 r2 r3 r4)
    | Error e1, _, _, _ -> Error e1
    | _, Error e2, _, _ -> Error e2
    | _, _, Error e3, _ -> Error e3
    | _, _, _, Error e4 -> Error e4

  let map5 r1 r2 r3 r4 r5 mapper =
    match (r1, r2, r3, r4, r5) with
    | Ok r1, Ok r2, Ok r3, Ok r4, Ok r5 -> Ok (mapper r1 r2 r3 r4 r5)
    | Error e1, _, _, _, _ -> Error e1
    | _, Error e2, _, _, _ -> Error e2
    | _, _, Error e3, _, _ -> Error e3
    | _, _, _, Error e4, _ -> Error e4
    | _, _, _, _, Error e5 -> Error e5

  let mapOptional
      (mapper : ('a, Decode.jsonParseError) Result.t -> ('b, Decode.jsonParseError) Result.t)
      (resultWithOption : ('a option, Decode.jsonParseError) Result.t) :
      ('b option, Decode.jsonParseError) Result.t =
    match[@ns.braces] resultWithOption with
    | Ok optValue -> (
        match optValue with
        | Some value -> (
            match mapper (Ok value) with
            | Ok result -> Ok (Some result)
            | Error error -> Error error)
        | None -> Ok None)
    | Error error -> Error error
end
