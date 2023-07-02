module SerializeHelpers = {
  type t = Yojson.Safe.t;
  let string_to_yojson = (x: string): t => `String(x);
  let int_to_yojson = (x: int): t => `Int(x);
  let long_to_yojson = (x: int): t => `Int(x);
  let float_to_yojson = (x: float): t => `Float(x);
  let double_to_yojson = (x: float): t => `Float(x);
  let list_to_yojson = (converter: 'a => t, x: list('a)): t =>
    `List(List.map(converter, x));
  let big_int_to_yojson = (x: int64): t => `Int(Int64.to_int(x));
  let bool_to_yojson = (x: bool): t => `Bool(x);
  let assoc_to_yojson = (x: list((string, option(t)))): t =>
    `Assoc(
      List.filter_map(
        ((name, value)) =>
          switch (value) {
          | Some(value) => Some((name, value))
          | None => None
          },
        x,
      ),
    );
  let blob_to_yojson = (x: Bytes.t): t =>
    `String(Base64.encode_exn(Bytes.to_string(x)));
  let big_decimal_to_yojson = (x: string): t => `String(x);
  let map_to_yojson = (converter: 'a => t, x: list((string, 'a))): t =>
    `Assoc(List.map(((name, value)) => {(name, converter(value))}, x));
  let timestamp_to_yojson = float_to_yojson;
  let option_to_yojson = (converter: 'a => t, x: option('a)) =>
    Option.map(converter, x);
};
