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
  let _ = acceptEndTag(i, ~expected=XmlEndSequence(tag, ns));
  res;
};

let readElement = (i, tag, ~ns=?, ()) => {
  let (_, _, _) =
    acceptStartTag(i, tag, ~ns, ~expected=XmlStartElement(tag, ns));
  let data = acceptData(i, ~expected=XmlElementData(tag, ns));
  let _ = acceptEndTag(i, ~expected=XmlEndElement(tag, ns));
  data;
};

let readElements = (i, tag, ~ns=?, ()) => {
  let rec readList = (~items) => {
    switch (Xmlm.peek(i)) {
    | `El_start(el) when tag_equal(tag, ns, el) =>
      let next = readElement(i, tag, ~ns?, ());
      readList(~items=[next, ...items]);
    | _ => items
    };
  };
  readList(~items=[]) |> List.rev;
};

let readOptionalElements = (i, tag, ~ns=?, ()) => {
  let elements = readElements(i, tag, ~ns?, ());
  List.is_empty(elements) ? None : Some(elements);
};

let readOptionalElement = (i, tag, ~ns=?, ()) => {
  switch (Xmlm.peek(i)) {
  | `El_start(el) when tag_equal(tag, ns, el) =>
    Some(readElement(i, tag, ~ns?, ()))
  | _ => None
  };
};

let readDtd = i => {
  switch (Xmlm.input(i)) {
  | `Dtd(_) => ()
  | _ as va => raise(XmlReadError(va, XmlDtd))
  };
};

type inputType('returnType) =
  | InputElement: inputType(string)
  | InputElements: inputType(list(string))
  | InputOptionalElement: inputType(option(string))
  | InputOptionalElements: inputType(option(list(string)));

type inputItem('a) = {
  tag: string,
  type_: inputType('a),
};

let readItem: type a. Xmlm.input => inputItem(a) => a = (i, t1) => {
  switch (t1.type_) {
    | InputElement => readElement(i, t1.tag, ());
    | InputElements => readElements(i, t1.tag, ());
    | InputOptionalElement => readOptionalElement(i, t1.tag, ());
    | InputOptionalElements => readOptionalElements(i, t1.tag, ());
  }
};

exception ReadTypeError(string);

let readItem2: type a b. Xmlm.input => inputItem(a) => inputItem(b) => (a, b) = (i, t1, t2) => {
  let break = ref(false);
  let r1 = ref(None);
  let r2 = ref(None);
  while (!break.contents) {
    let next = Xmlm.peek(i);
    switch (next) {
      | `El_start(((_, tag), _)) => {
        if (String.equal(t1.tag, tag)) {
          r1 := Some(readItem(i, t1));
        } else if (String.equal(t2.tag, tag)) {
          r2 := Some(readItem(i, t2));
        } else {
          raise(ReadTypeError("Unexpected tag " ++ tag))
        }
      }
      | `El_end => { break := true; }
      | `Dtd(_) | `Data(_) => raise(ReadTypeError("Unexpected DTD or Data tag"))
    }
  }
  switch (r1^, r2^) {
    | (Some(a1), Some(a2)) => (a1, a2);
    | _ => raise(ReadTypeError("One or more of the expected elements was not found"))
  }
}
