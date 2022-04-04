open Base;
open Yojson;

module Decode = {
  type t = Basic.t;
  let flatMap_result = Base.Result.bind;

  let optionToResult = (opt, errorString) =>
    switch (opt) {
    | Some(result) => Ok(result)
    | None => Error(errorString)
    };

  type nonrec jsonTreeRef = {
    tree: t,
    path: string,
  };

  type jsonObject = List.Assoc.t(string, t);
  type nonrec jsonObjectRef = {
    object_: jsonObject,
    path: string,
  };

  type nonrec jsonParseError =
    | SyntaxError(string)
    | WrongType(string, string)
    | NoValueError(string)
    | RecordParseError(string, string)
    | CustomError(string);

  let jsonParseErrorToString = error =>
    switch (error) {
    | SyntaxError(error) => {js|Syntax Error: |js} ++ error
    | [@implicit_arity] WrongType(path, expected) =>
      (
        ({js|Wrong Type Error: |js} ++ expected)
        ++ {js| was expected at path |js}
      )
      ++ path
    | NoValueError(path) =>
      {js|No Value Error: expected a value at |js} ++ path
    | [@implicit_arity] RecordParseError(path, suberror) =>
      (
        ({js|Record parse error: at path |js} ++ path)
        ++ {js| received record parse error - |js}
      )
      ++ suberror
    | CustomError(error) => {js|Other parse error: |js} ++ error
    };

  let parseJsonString = (jsonString, rootParser) =>
    [@ns.braces]
    {
      let treeResult =
        try(Ok(Yojson.Basic.from_string(jsonString))) {
        | Yojson.Json_error(err) => Error(SyntaxError(err))
        };
      Base.Result.(
        treeResult >>= ((. tree) => rootParser(Ok({tree, path: "$"})))
      );
    };

  let parseJsonFile = (jsonFile, rootParser) =>
    [@ns.braces]
    {
      let treeResult =
        try(Ok(Yojson.Basic.from_file(jsonFile))) {
        | Yojson.Json_error(err) => Error(SyntaxError(err))
        };
      Base.Result.(
        treeResult >>= ((. tree) => rootParser(Ok({tree, path: "$"})))
      );
    };

  type nonrec parser('a) =
    Result.t(jsonTreeRef, jsonParseError) => Result.t('a, jsonParseError);

  let parseObject =
      (x: Result.t(jsonTreeRef, jsonParseError))
      : Result.t(jsonObjectRef, jsonParseError) =>
    Result.(
      x
      >>= (
        (. {tree, path}) =>
          switch (tree) {
          | `Assoc(items) => Ok({object_: items, path})
          | _ => Error(NoValueError(path))
          }
      )
    );

  let parseRecord =
      (recordParser, recordObject: Result.t(jsonTreeRef, jsonParseError)) =>
    recordObject
    |> parseObject
    |> Result.bind(~f=({object_, path}) => {
         List.fold(
           ~f=
             (records, (key, value)) => {
               Result.bind(
                 records,
                 ~f=recordsValue => {
                   let record =
                     recordParser(
                       key,
                       Ok({path: path ++ {|.|} ++ key, tree: value}),
                     );
                   switch (record) {
                   | Ok(recordValue) => Ok([recordValue, ...recordsValue])
                   | Error(CustomError(y)) =>
                     Error(RecordParseError(path ++ "." ++ key, y))
                   | Error(x) => Error(x)
                   };
                 },
               )
             },
           ~init=Ok([]),
           object_,
         )
       });

  let parseString = x =>
    Result.bind(x, ~f=({tree, path}) =>
      switch (tree) {
      | `String(str) => Ok(str)
      | _ => Error(WrongType("string", path))
      }
    );

  let parseNumber = x =>
    Result.bind(x, ~f=(. {tree, path}) =>
      switch (tree) {
      // We wanted a float, so we'll make it a float
      | `Int(num) => Ok(Int.to_float(num))
      | `Float(num) => Ok(num)
      | _ => Error([@implicit_arity] WrongType(path, "number"))
      }
    );
  let parseInteger = x =>
    Result.bind(x, ~f=(. {tree, path}) =>
      switch (tree) {
      | `Int(i) => Ok(i)
      | _ => Error([@implicit_arity] WrongType(path, "integer"))
      }
    );

  let parseArray = (itemParser, arrayRef) =>
    Result.(
      arrayRef
      >>= (
        (. {tree, path}) =>
          switch (tree) {
          | `List(arr) =>
            Base.List.foldi(
              arr,
              ~f=
                (i, progress, next) =>
                  progress
                  >>= (
                    (. items) => {
                      let record =
                        itemParser(
                          Ok({
                            path: (path ++ {js|.|js}) ++ Int.to_string(i),
                            tree: next,
                          }),
                        );
                      switch (record) {
                      | Ok(recordValue) =>
                        Ok(Base.List.append(items, [recordValue]))
                      | Error(y) => Error(y)
                      };
                    }
                  ),
              ~init=Ok([]),
            )
          | _ => Error([@implicit_arity] WrongType(path, "array"))
          }
      )
    );

  let field = (fieldName, objectRef) =>
    Result.(
      objectRef
      >>= (
        (. {object_, path}) =>
          switch (List.Assoc.find(object_, ~equal=String.equal, fieldName)) {
          | Some(fieldValue) =>
            Ok({tree: fieldValue, path: (path ++ {js|.|js}) ++ fieldName})
          | None => Error(NoValueError((path ++ {js|.|js}) ++ fieldName))
          }
      )
    );

  let optional = (decodedResult: Result.t('a, jsonParseError)) =>
    switch (decodedResult) {
    | Ok(value) => Ok(Some(value))
    | Error(error) =>
      switch (error) {
      | NoValueError(_) => Ok(None)
      | _ => Error(error)
      }
    };
};

module ResultHelpers = {
  let map2 = (result1, result2, mapper) =>
    switch (result1, result2) {
    | (Ok(result1), Ok(result2)) => Ok(mapper(result1, result2))
    | (Error(error1), _) => Error(error1)
    | (_, Error(error2)) => Error(error2)
    };
  let map3 = (result1, result2, result3, mapper) =>
    switch (result1, result2, result3) {
    | (Ok(result1), Ok(result2), Ok(result3)) =>
      Ok(mapper(result1, result2, result3))
    | (Error(error1), _, _) => Error(error1)
    | (_, Error(error2), _) => Error(error2)
    | (_, _, Error(error3)) => Error(error3)
    };
  let map4 = (r1, r2, r3, r4, mapper) =>
    switch (r1, r2, r3, r4) {
    | (Ok(r1), Ok(r2), Ok(r3), Ok(r4)) => Ok(mapper(r1, r2, r3, r4))
    | (Error(e1), _, _, _) => Error(e1)
    | (_, Error(e2), _, _) => Error(e2)
    | (_, _, Error(e3), _) => Error(e3)
    | (_, _, _, Error(e4)) => Error(e4)
    };
  let map5 = (r1, r2, r3, r4, r5, mapper) =>
    switch (r1, r2, r3, r4, r5) {
    | (Ok(r1), Ok(r2), Ok(r3), Ok(r4), Ok(r5)) =>
      Ok(mapper(r1, r2, r3, r4, r5))
    | (Error(e1), _, _, _, _) => Error(e1)
    | (_, Error(e2), _, _, _) => Error(e2)
    | (_, _, Error(e3), _, _) => Error(e3)
    | (_, _, _, Error(e4), _) => Error(e4)
    | (_, _, _, _, Error(e5)) => Error(e5)
    };

  let mapOptional =
      (
        mapper:
          Result.t('a, Decode.jsonParseError) =>
          Result.t('b, Decode.jsonParseError),
        resultWithOption: Result.t(option('a), Decode.jsonParseError),
      )
      : Result.t(option('b), Decode.jsonParseError) =>
    [@ns.braces]
    (
      switch (resultWithOption) {
      | Ok(optValue) =>
        switch (optValue) {
        | Some(value) =>
          switch (mapper(Ok(value))) {
          | Ok(result) => Ok(Some(result))
          | Error(error) => Error(error)
          }
        | None => Ok(None)
        }
      | Error(error) => Error(error)
      }
    );
};
