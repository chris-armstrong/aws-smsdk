open Base;
open Xmlm;

module Parse = {
  let source_with_encoding = (~src, ~encoding) => {
    let enc =
      Option.bind(encoding, ~f=encoding =>
        switch (String.lowercase(encoding)) {
        | "utf-8" => Some(`UTF_8)
        | _ => None
        }
      );
    make_input(~enc, ~strip=true, `String((0, src)));
  };

  [@deriving (show, eq)]
  type expected =
    | XmlStartSequence(string, option(string))
    | XmlEndSequence(string, option(string))
    | XmlStartElement(string, option(string))
    | XmlElementData(string, option(string))
    | XmlEndElement(string, option(string))
    | XmlDtd
    | XmlOneOfElement(list(string));

  type pos = (int, int);

  exception XmlParse(Xmlm.error);
  exception XmlUnexpectedConstruct(expected, signal, pos);

  module Accept = {
    let startTag = (i, tag, ~ns, ~expected) => {
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
      | _ => raise(XmlUnexpectedConstruct(expected, next, Xmlm.pos(i)))
      };
    };
    let endTag = (i, ~expected) => {
      let next = input(i);
      switch (next) {
      | `El_end => ()
      | _ => raise(XmlUnexpectedConstruct(expected, next, Xmlm.pos(i)))
      };
    };

    let data = (i, ~expected) => {
      let next = input(i);
      switch (next) {
      | `Data(data) => data
      | _ => raise(XmlUnexpectedConstruct(expected, next, Xmlm.pos(i)))
      };
    };

    let dtd = i => {
      switch (Xmlm.input(i)) {
      | `Dtd(_) => ()
      | _ as va => raise(XmlUnexpectedConstruct(XmlDtd, va, Xmlm.pos(i)))
      };
    };
  };
  let tag_equal = (name, ns, ((nns, nname), _)) =>
    String.equal(name, nname)
    && (
      Option.is_none(ns) || String.equal(nns, Option.value(ns, ~default=""))
    );

  module Read = {
    let sequence = (i, tag, reader, ~ns=?, ()) => {
      let (_, _, attributes) =
        Accept.startTag(i, tag, ~ns, ~expected=XmlStartSequence(tag, ns));
      let res = reader(i, attributes);
      let _ = Accept.endTag(i, ~expected=XmlEndSequence(tag, ns));
      res;
    };
    let element = (i, tag, ~ns=?, ()) => {
      let (_, _, _) =
        Accept.startTag(i, tag, ~ns, ~expected=XmlStartElement(tag, ns));
      let data = Accept.data(i, ~expected=XmlElementData(tag, ns));
      let _ = Accept.endTag(i, ~expected=XmlEndElement(tag, ns));
      data;
    };

    let elements = (i, tag, ~ns=?, ()) => {
      let rec readList = (~items) => {
        switch (Xmlm.peek(i)) {
        | `El_start(el) when tag_equal(tag, ns, el) =>
          let next = element(i, tag, ~ns?, ());
          readList(~items=[next, ...items]);
        | _ => items
        };
      };
      readList(~items=[]) |> List.rev;
    };

    let optionalElements = (i, tag, ~ns=?, ()) => {
      let elements = elements(i, tag, ~ns?, ());
      List.is_empty(elements) ? None : Some(elements);
    };

    let optionalElement = (i, tag, ~ns=?, ()) => {
      switch (Xmlm.peek(i)) {
      | `El_start(el) when tag_equal(tag, ns, el) =>
        Some(element(i, tag, ~ns?, ()))
      | _ => None
      };
    };

    let dtd = i => {
      Accept.dtd(i);
    };
  };

  module UnorderedRead = {
    type inputType('returnType) =
      | InputStringElement: inputType(string)
      | InputStringElements: inputType(list(string));

    type inputItem('a) = {
      tag: string,
      type_: inputType('a),
    };

    exception InputUnordered(string);

    let item: type a. (input, inputItem(a)) => a =
      (i, t1) => {
        switch (t1.type_) {
        | InputStringElement => Read.element(i, t1.tag, ())
        | InputStringElements => Read.elements(i, t1.tag, ())
        };
      };

    let item2:
      type a b.
        (input, inputItem(a), inputItem(b)) => (option(a), option(b)) =
      (i, t1, t2) => {
        let break = ref(false);
        let r1 = ref(None);
        let r2 = ref(None);
        while (!break.contents) {
          let next = Xmlm.peek(i);
          switch (next) {
          | `El_start((_, tag), _) =>
            if (String.equal(t1.tag, tag)) {
              r1 := Some(item(i, t1));
            } else if (String.equal(t2.tag, tag)) {
              r2 := Some(item(i, t2));
            } else {
              raise(
                XmlUnexpectedConstruct(
                  XmlOneOfElement([t1.tag, t2.tag]),
                  next,
                  Xmlm.pos(i),
                ),
              );
            }
          | `El_end => break := true
          | `Dtd(_)
          | `Data(_) =>
            raise(
              XmlUnexpectedConstruct(
                XmlOneOfElement([t1.tag, t2.tag]), next, Xmlm.pos(i),
              ),
            )
          };
        };
        (r1^, r2^);
      };
  };
};
