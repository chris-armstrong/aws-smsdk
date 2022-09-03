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
  exception XmlMissingElement(string, pos);

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
    type reader('a) = (input, list(attribute)) => 'a;

    let sequence = (i, tag, reader: reader('a), ~ns=?, ()) => {
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

    let sequences = (i, tag, reader, ~ns=?, ()) => {
      let rec readList = (~items) => {
        switch (Xmlm.peek(i)) {
        | `El_start(el) when tag_equal(tag, ns, el) =>
          let next = sequence(i, tag, reader, ~ns?, ());
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

  module Structure = {
    type inputType('returnType) =
      | InputStringElement: inputType(string)
      | InputStringElements: inputType(list(string))
      | InputStructureElement(Read.reader('returnType))
        : inputType('returnType)
      | InputStructuresElement(Read.reader('returnType))
        : inputType(list('returnType));

    type inputItem('a) = {
      tag: string,
      type_: inputType('a),
    };

    exception InputUnordered(string);
    exception MissingElement(string, Xmlm.pos);

    let item1: type a. (input, inputItem(a)) => option(a) =
      (i, t1) => {
        switch (t1.type_) {
        | InputStringElement => Read.optionalElement(i, t1.tag, ())
        | InputStringElements => Some(Read.elements(i, t1.tag, ()))
        | InputStructureElement(reader) =>
          Some(Read.sequence(i, t1.tag, reader, ()))
        | InputStructuresElement(reader) =>
          Some(Read.sequences(i, t1.tag, reader, ()))
        };
      };

    let scanSequence = (i, expectedTags, reader) => {
      let break = ref(false);
      while (!break.contents) {
        let next = Xmlm.peek(i);
        switch (next) {
        | `El_start((_, tag), _) => reader(tag, next)
        | `El_end => break := true
        | `Dtd(_)
        | `Data(_) =>
          raise(
            XmlUnexpectedConstruct(
              XmlOneOfElement(expectedTags),
              next,
              Xmlm.pos(i),
            ),
          )
        };
      };
    };

    let item2:
      type a b.
        (input, inputItem(a), inputItem(b)) => (option(a), option(b)) =
      (i, t1, t2) => {
        let r1 = ref(None);
        let r2 = ref(None);
        scanSequence(i, [t1.tag, t2.tag], (tag, next) =>
          if (String.equal(t1.tag, tag)) {
            r1 := item1(i, t1);
          } else if (String.equal(t2.tag, tag)) {
            r2 := item1(i, t2);
          } else {
            raise(
              XmlUnexpectedConstruct(
                XmlOneOfElement([t1.tag, t2.tag]),
                next,
                Xmlm.pos(i),
              ),
            );
          }
        );
        (r1^, r2^);
      };

    let item3:
      type a b c.
        (input, inputItem(a), inputItem(b), inputItem(c)) =>
        (option(a), option(b), option(c)) =
      (i, t1, t2, t3) => {
        let r1 = ref(None);
        let r2 = ref(None);
        let r3 = ref(None);
        scanSequence(i, [t1.tag, t2.tag, t3.tag], (tag, next) =>
          switch (tag) {
          | _ when String.equal(t1.tag, tag) => r1 := item1(i, t1)
          | _ when String.equal(t2.tag, tag) => r2 := item1(i, t2)
          | _ when String.equal(t3.tag, tag) => r3 := item1(i, t3)
          | _ =>
            raise(
              XmlUnexpectedConstruct(
                XmlOneOfElement([t1.tag, t2.tag, t3.tag]),
                next,
                Xmlm.pos(i),
              ),
            )
          }
        );
        (r1^, r2^, r3^);
      };
    let item4:
      type a b c d.
        (input, inputItem(a), inputItem(b), inputItem(c), inputItem(d)) =>
        (option(a), option(b), option(c), option(d)) =
      (i, t1, t2, t3, t4) => {
        let r1 = ref(None);
        let r2 = ref(None);
        let r3 = ref(None);
        let r4 = ref(None);
        scanSequence(i, [t1.tag, t2.tag, t3.tag, t4.tag], (tag, next) =>
          switch (tag) {
          | _ when String.equal(t1.tag, tag) => r1 := item1(i, t1)
          | _ when String.equal(t2.tag, tag) => r2 := item1(i, t2)
          | _ when String.equal(t3.tag, tag) => r3 := item1(i, t3)
          | _ when String.equal(t4.tag, tag) => r4 := item1(i, t4)
          | _ =>
            raise(
              XmlUnexpectedConstruct(
                XmlOneOfElement([t1.tag, t2.tag, t3.tag, t4.tag]),
                next,
                Xmlm.pos(i),
              ),
            )
          }
        );
        (r1^, r2^, r3^, r4^);
      };
    let item5:
      type a b c d e.
        (input, inputItem(a), inputItem(b), inputItem(c), inputItem(d), inputItem(e)) =>
        (option(a), option(b), option(c), option(d), option(e)) =
      (i, t1, t2, t3, t4, t5) => {
        let r1 = ref(None);
        let r2 = ref(None);
        let r3 = ref(None);
        let r4 = ref(None);
        let r5 = ref(None);
        scanSequence(i, [t1.tag, t2.tag, t3.tag, t4.tag, t5.tag], (tag, next) =>
          switch (tag) {
          | _ when String.equal(t1.tag, tag) => r1 := item1(i, t1)
          | _ when String.equal(t2.tag, tag) => r2 := item1(i, t2)
          | _ when String.equal(t3.tag, tag) => r3 := item1(i, t3)
          | _ when String.equal(t4.tag, tag) => r4 := item1(i, t4)
          | _ when String.equal(t5.tag, tag) => r5 := item1(i, t5)
          | _ =>
            raise(
              XmlUnexpectedConstruct(
                XmlOneOfElement([t1.tag, t2.tag, t3.tag, t4.tag, t5.tag]),
                next,
                Xmlm.pos(i),
              ),
            )
          }
        );
        (r1^, r2^, r3^, r4^, r5^);
      };

    let item6:
      type a b c d e f.
        (input, inputItem(a), inputItem(b), inputItem(c), inputItem(d), inputItem(e), inputItem(f)) =>
        (option(a), option(b), option(c), option(d), option(e), option(f)) =
      (i, t1, t2, t3, t4, t5, t6) => {
        let r1 = ref(None);
        let r2 = ref(None);
        let r3 = ref(None);
        let r4 = ref(None);
        let r5 = ref(None);
        let r6 = ref(None);
        scanSequence(i, [t1.tag, t2.tag, t3.tag, t4.tag, t5.tag, t6.tag], (tag, next) =>
          switch (tag) {
          | _ when String.equal(t1.tag, tag) => r1 := item1(i, t1)
          | _ when String.equal(t2.tag, tag) => r2 := item1(i, t2)
          | _ when String.equal(t3.tag, tag) => r3 := item1(i, t3)
          | _ when String.equal(t4.tag, tag) => r4 := item1(i, t4)
          | _ when String.equal(t5.tag, tag) => r5 := item1(i, t5)
          | _ when String.equal(t6.tag, tag) => r6 := item1(i, t6)
          | _ =>
            raise(
              XmlUnexpectedConstruct(
                XmlOneOfElement([t1.tag, t2.tag, t3.tag, t4.tag, t5.tag, t6.tag]),
                next,
                Xmlm.pos(i),
              ),
            )
          }
        );
        (r1^, r2^, r3^, r4^, r5^, r6^);
      };
    let item7:
      type a b c d e f g.
        (input, inputItem(a), inputItem(b), inputItem(c), inputItem(d), inputItem(e), inputItem(f), inputItem(g)) =>
        (option(a), option(b), option(c), option(d), option(e), option(f), option(g)) =
      (i, t1, t2, t3, t4, t5, t6, t7) => {
        let r1 = ref(None);
        let r2 = ref(None);
        let r3 = ref(None);
        let r4 = ref(None);
        let r5 = ref(None);
        let r6 = ref(None);
        let r7 = ref(None);
        scanSequence(i, [t1.tag, t2.tag, t3.tag, t4.tag, t5.tag, t6.tag, t7.tag], (tag, next) =>
          switch (tag) {
          | _ when String.equal(t1.tag, tag) => r1 := item1(i, t1)
          | _ when String.equal(t2.tag, tag) => r2 := item1(i, t2)
          | _ when String.equal(t3.tag, tag) => r3 := item1(i, t3)
          | _ when String.equal(t4.tag, tag) => r4 := item1(i, t4)
          | _ when String.equal(t5.tag, tag) => r5 := item1(i, t5)
          | _ when String.equal(t6.tag, tag) => r6 := item1(i, t6)
          | _ when String.equal(t7.tag, tag) => r7 := item1(i, t7)
          | _ =>
            raise(
              XmlUnexpectedConstruct(
                XmlOneOfElement([t1.tag, t2.tag, t3.tag, t4.tag, t5.tag, t6.tag, t7.tag]),
                next,
                Xmlm.pos(i),
              ),
            )
          }
        );
        (r1^, r2^, r3^, r4^, r5^, r6^, r7^);
      };
  };

  let required = (tag, value, i) => {
    switch (value) {
    | Some(value) => value
    | None => raise(XmlMissingElement(tag, Xmlm.pos(i)))
    };
  };
};
