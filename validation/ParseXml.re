open Base;

let source = (~src, ~encoding) => {
  let enc =
    Option.bind(encoding, ~f=encoding =>
      switch (String.lowercase(encoding)) {
      | "utf-8" => Some(`UTF_8)
      | _ => None
      }
    );
  Xmlm.make_input(~enc, ~strip=true, `String((0, src)));
};

[@deriving (show, eq)]
type expectedXml =
  | XmlStartSequence(string, option(string))
  | XmlEndSequence(string, option(string))
  | XmlStartElement(string, option(string))
  | XmlElementData(string, option(string))
  | XmlEndElement(string, option(string))
  | XmlDtd;

exception XmlReadError(Xmlm.signal, expectedXml);

let acceptStartTag = (i, tag, ~ns, ~expected) => {
  open Xmlm;
  let next = input(i);
  switch (next) {
  | `El_start((nns, nname), attributes)
      when
        (
          Option.is_none(ns)
          || String.equal(nns, Option.value(ns, ~default=""))
        )
        && String.equal(nname, tag) => (
      nns,
      nname,
      attributes,
    )
  | _ => raise(XmlReadError(next, expected))
  };
};
let acceptEndTag = (i, ~expected) => {
  open Xmlm;
  let next = input(i);
  switch (next) {
  | `El_end => ()
  | _ => raise(XmlReadError(next, expected))
  };
};

let acceptData = (i, ~expected) => {
  open Xmlm;
  let next = input(i);
  switch (next) {
  | `Data(data) => data
  | _ => raise(XmlReadError(next, expected))
  };
};

let tag_equal = (name, ns, ((nns, nname), _)) =>
  String.equal(name, nname)
  && (
    Option.is_none(ns) || String.equal(nns, Option.value(ns, ~default=""))
  );

let readSequence = (i, tag, reader, ~ns=?, ()) => {
  let (_, _, attributes) =
    acceptStartTag(i, tag, ~ns, ~expected=XmlStartSequence(tag, ns));
  let res = reader(attributes);
  acceptEndTag(i, ~expected=XmlEndSequence(tag, ns));
  res;
};

let readElement = (i, tag, ~ns=?, ()) => {
  let (_, _, _) =
    acceptStartTag(i, tag, ~ns, ~expected=XmlStartElement(tag, ns));
  let data = acceptData(i, ~expected=XmlElementData(tag, ns));
  acceptEndTag(i, ~expected=XmlEndElement(tag, ns));
  data;
};

let readElements = (i, tag, ~ns=?, ()) => {
  let rec readList = (~items) => {
    switch (Xmlm.peek(i)) {
    | `El_start(el) when tag_equal(tag, ns, el) =>
      let next = readElement(i, tag, ~ns=?ns, ());
      readList(~items=[next, ...items]);
    | _ => items
    };
  };
  readList(~items=[]) |> List.rev;
};

let readOptionalElements = (i, tag, ~ns, ()) => {
  let elements = readElements(i, tag, ~ns=?ns, ());
  List.is_empty(elements) ? None : Some(elements);
}

let readOptionalElement = (i, tag, ~ns=?, ()) => {
  switch (Xmlm.peek(i)) {
  | `El_start(el) when tag_equal(tag, ns, el) =>
    Some(readElement(i, tag, ~ns=?ns, ()))
  | _ => None
  };
};

let readDtd = i => {
  switch (Xmlm.input(i)) {
  | `Dtd(_) => ()
  | _ as va => raise(XmlReadError(va, XmlDtd))
  };
};
