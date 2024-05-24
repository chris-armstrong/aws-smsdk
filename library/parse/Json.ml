open Base
open Yojson

module Decode = struct
  type t = Basic.t

  let flatMap_result = Base.Result.bind

  let optionToResult opt errorString =
    match opt with
    | ((Some result) [@explicit_arity]) -> Ok result [@explicit_arity]
    | None -> Error errorString [@explicit_arity]

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
    | ((SyntaxError error) [@explicit_arity]) -> {js|Syntax Error: |js} ^ error
    | ((WrongType (path, expected)) [@explicit_arity]) ->
        (({js|Wrong Type Error: |js} ^ expected) ^ {js| was expected at path |js}) ^ path
    | ((NoValueError path) [@explicit_arity]) -> {js|No Value Error: expected a value at |js} ^ path
    | ((RecordParseError (path, suberror)) [@implicit_arity]) ->
        (({js|Record parse error: at path |js} ^ path) ^ {js| received record parse error - |js})
        ^ suberror
    | ((CustomError error) [@explicit_arity]) -> {js|Other parse error: |js} ^ error

  let parseJsonString jsonString rootParser =
    (let treeResult =
       try Ok (Yojson.Basic.from_string jsonString) [@explicit_arity]
       with ((Yojson.Json_error err) [@explicit_arity]) ->
         Error (SyntaxError err [@explicit_arity]) [@explicit_arity]
     in
     let open Base.Result in
     treeResult >>= fun [@u] tree -> rootParser (Ok { tree; path = "$" } [@explicit_arity]))
    [@ns.braces]

  let parseJsonFile jsonFile rootParser =
    (let treeResult =
       try Ok (Yojson.Basic.from_file jsonFile) [@explicit_arity]
       with ((Yojson.Json_error err) [@explicit_arity]) ->
         Error (SyntaxError err [@explicit_arity]) [@explicit_arity]
     in
     let open Base.Result in
     treeResult >>= fun [@u] tree -> rootParser (Ok { tree; path = "$" } [@explicit_arity]))
    [@ns.braces]

  type nonrec 'a parser = (jsonTreeRef, jsonParseError) Result.t -> ('a, jsonParseError) Result.t

  let parseObject (x : jsonTreeResult) : (jsonObjectRef, jsonParseError) Result.t =
    let open Result in
    x >>= fun [@u] { tree; path } ->
    match tree with
    | `Assoc items -> Ok { object_ = items; path } [@explicit_arity]
    | _ -> Error (NoValueError path [@explicit_arity]) [@explicit_arity]

  let parseRecord recordParser (recordObject : jsonTreeResult) =
    recordObject |> parseObject
    |> Result.bind ~f:(fun { object_; path } ->
           List.fold
             ~f:(fun records (key, value) ->
               Result.bind records ~f:(fun recordsValue ->
                   let record =
                     recordParser key
                       (Ok { path = path ^ {|.|} ^ key; tree = value } [@explicit_arity])
                   in
                   match record with
                   | ((Ok recordValue) [@explicit_arity]) ->
                       Ok (recordValue :: recordsValue) [@explicit_arity]
                   | ((Error ((CustomError y) [@explicit_arity])) [@explicit_arity]) ->
                       Error (RecordParseError (path ^ "." ^ key, y) [@explicit_arity])
                       [@explicit_arity]
                   | ((Error x) [@explicit_arity]) -> Error x [@explicit_arity]))
             ~init:(Ok [] [@explicit_arity]) object_)

  let parseString x =
    Result.bind x ~f:(fun { tree; path } ->
        match tree with
        | `String str -> Ok str [@explicit_arity]
        | _ -> Error (WrongType ("string", path) [@explicit_arity]) [@explicit_arity])

  let parseNumber x =
    Result.bind x ~f:(fun [@u] { tree; path } ->
        match tree with
        | `Int num -> Ok (Int.to_float num) [@explicit_arity]
        | `Float num -> Ok num [@explicit_arity]
        | _ -> Error (WrongType (path, "number") [@implicit_arity]) [@explicit_arity])

  let parseInteger x =
    Result.bind x ~f:(fun [@u] { tree; path } ->
        match tree with
        | `Int i -> Ok i [@explicit_arity]
        | _ -> Error (WrongType (path, "integer") [@implicit_arity]) [@explicit_arity])

  let parseArray itemParser arrayRef =
    let open Result in
    arrayRef >>= fun [@u] { tree; path } ->
    match tree with
    | `List arr ->
        Base.List.foldi arr
          ~f:(fun i progress next ->
            progress >>= fun [@u] items ->
            let record =
              itemParser
                (Ok { path = (path ^ {js|.|js}) ^ Int.to_string i; tree = next } [@explicit_arity])
            in
            match record with
            | ((Ok recordValue) [@explicit_arity]) ->
                Ok (Base.List.append items [ recordValue ]) [@explicit_arity]
            | ((Error y) [@explicit_arity]) -> Error y [@explicit_arity])
          ~init:(Ok [] [@explicit_arity])
    | _ -> Error (WrongType (path, "array") [@implicit_arity]) [@explicit_arity]

  let raw (recordObject : (jsonTreeRef, jsonParseError) Result.t) =
    let open Result in
    recordObject >>= fun { tree; path } -> Ok tree

  let field fieldName objectRef =
    let open Result in
    objectRef >>= fun [@u] { object_; path } ->
    match List.Assoc.find object_ ~equal:String.equal fieldName with
    | ((Some fieldValue) [@explicit_arity]) ->
        Ok { tree = fieldValue; path = (path ^ {js|.|js}) ^ fieldName } [@explicit_arity]
    | None ->
        Error (NoValueError ((path ^ {js|.|js}) ^ fieldName) [@explicit_arity]) [@explicit_arity]

  let optional (decodedResult : ('a, jsonParseError) Result.t) =
    match decodedResult with
    | ((Ok value) [@explicit_arity]) -> Ok (Some value [@explicit_arity]) [@explicit_arity]
    | ((Error error) [@explicit_arity]) -> (
        match error with
        | NoValueError _ -> Ok None [@explicit_arity]
        | _ -> Error error [@explicit_arity])
end

module ResultHelpers = struct
  let map2 result1 result2 mapper =
    match (result1, result2) with
    | ((Ok result1) [@explicit_arity]), ((Ok result2) [@explicit_arity]) ->
        Ok (mapper result1 result2) [@explicit_arity]
    | ((Error error1) [@explicit_arity]), _ -> Error error1 [@explicit_arity]
    | _, ((Error error2) [@explicit_arity]) -> Error error2 [@explicit_arity]

  let map3 result1 result2 result3 mapper =
    match (result1, result2, result3) with
    | ( ((Ok result1) [@explicit_arity]),
        ((Ok result2) [@explicit_arity]),
        ((Ok result3) [@explicit_arity]) ) ->
        Ok (mapper result1 result2 result3) [@explicit_arity]
    | ((Error error1) [@explicit_arity]), _, _ -> Error error1 [@explicit_arity]
    | _, ((Error error2) [@explicit_arity]), _ -> Error error2 [@explicit_arity]
    | _, _, ((Error error3) [@explicit_arity]) -> Error error3 [@explicit_arity]

  let map4 r1 r2 r3 r4 mapper =
    match (r1, r2, r3, r4) with
    | ( ((Ok r1) [@explicit_arity]),
        ((Ok r2) [@explicit_arity]),
        ((Ok r3) [@explicit_arity]),
        ((Ok r4) [@explicit_arity]) ) ->
        Ok (mapper r1 r2 r3 r4) [@explicit_arity]
    | ((Error e1) [@explicit_arity]), _, _, _ -> Error e1 [@explicit_arity]
    | _, ((Error e2) [@explicit_arity]), _, _ -> Error e2 [@explicit_arity]
    | _, _, ((Error e3) [@explicit_arity]), _ -> Error e3 [@explicit_arity]
    | _, _, _, ((Error e4) [@explicit_arity]) -> Error e4 [@explicit_arity]

  let map5 r1 r2 r3 r4 r5 mapper =
    match (r1, r2, r3, r4, r5) with
    | ( ((Ok r1) [@explicit_arity]),
        ((Ok r2) [@explicit_arity]),
        ((Ok r3) [@explicit_arity]),
        ((Ok r4) [@explicit_arity]),
        ((Ok r5) [@explicit_arity]) ) ->
        Ok (mapper r1 r2 r3 r4 r5) [@explicit_arity]
    | ((Error e1) [@explicit_arity]), _, _, _, _ -> Error e1 [@explicit_arity]
    | _, ((Error e2) [@explicit_arity]), _, _, _ -> Error e2 [@explicit_arity]
    | _, _, ((Error e3) [@explicit_arity]), _, _ -> Error e3 [@explicit_arity]
    | _, _, _, ((Error e4) [@explicit_arity]), _ -> Error e4 [@explicit_arity]
    | _, _, _, _, ((Error e5) [@explicit_arity]) -> Error e5 [@explicit_arity]

  let mapOptional
      (mapper : ('a, Decode.jsonParseError) Result.t -> ('b, Decode.jsonParseError) Result.t)
      (resultWithOption : ('a option, Decode.jsonParseError) Result.t) :
      ('b option, Decode.jsonParseError) Result.t =
    match[@ns.braces] resultWithOption with
    | ((Ok optValue) [@explicit_arity]) -> (
        match optValue with
        | ((Some value) [@explicit_arity]) -> (
            match mapper (Ok value [@explicit_arity]) with
            | ((Ok result) [@explicit_arity]) ->
                Ok (Some result [@explicit_arity]) [@explicit_arity]
            | ((Error error) [@explicit_arity]) -> Error error [@explicit_arity])
        | None -> Ok None [@explicit_arity])
    | ((Error error) [@explicit_arity]) -> Error error [@explicit_arity]
end
