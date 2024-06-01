open Xmlm

module Parse = struct
  let source_with_encoding ~src ~encoding =
    let enc =
      Option.bind encoding (fun encoding ->
          match String.lowercase_ascii encoding with "utf-8" -> Some `UTF_8 | _ -> None)
    in
    make_input ~enc ~strip:true (`String (0, src))

  type expected =
    | XmlStartSequence of string * string option
    | XmlEndSequence of string * string option
    | XmlStartElement of string * string option
    | XmlElementData of string * string option
    | XmlEndElement of string * string option
    | XmlDtd
    | XmlOneOfElement of string list
  [@@deriving show, eq]

  type pos = int * int

  exception XmlParse of Xmlm.error
  exception XmlUnexpectedConstruct of expected * signal * pos
  exception XmlMissingElement of string * pos

  module Accept = struct
    let startTag i tag ~ns ~expected =
      let next = input i in
      match next with
      | `El_start ((nns, nname), attributes)
        when (Option.is_none ns || String.equal nns (Option.value ns ~default:""))
             && String.equal nname tag ->
          (nns, nname, attributes)
      | _ -> raise (XmlUnexpectedConstruct (expected, next, Xmlm.pos i))

    let endTag i ~expected =
      let next = input i in
      match next with
      | `El_end -> ()
      | _ -> raise (XmlUnexpectedConstruct (expected, next, Xmlm.pos i))

    let data i ~expected =
      let next = input i in
      match next with
      | `Data data -> data
      | _ -> raise (XmlUnexpectedConstruct (expected, next, Xmlm.pos i))

    let dtd i =
      match Xmlm.input i with
      | `Dtd _ -> ()
      | _ as va -> raise (XmlUnexpectedConstruct (XmlDtd, va, Xmlm.pos i))
  end

  let tag_equal name ns ((nns, nname), _) =
    String.equal name nname && (Option.is_none ns || String.equal nns (Option.value ns ~default:""))

  module Read = struct
    type 'a reader = input -> attribute list -> 'a

    let sequence i tag (reader : 'a reader) ?ns () =
      let _, _, attributes = Accept.startTag i tag ~ns ~expected:(XmlStartSequence (tag, ns)) in
      let res = reader i attributes in
      let _ = Accept.endTag i ~expected:(XmlEndSequence (tag, ns)) in
      res

    let element i tag ?ns () =
      let _, _, _ = Accept.startTag i tag ~ns ~expected:(XmlStartElement (tag, ns)) in
      let data = Accept.data i ~expected:(XmlElementData (tag, ns)) in
      let _ = Accept.endTag i ~expected:(XmlEndElement (tag, ns)) in
      data

    let elements i tag ?ns () =
      let rec readList ~items =
        match Xmlm.peek i with
        | `El_start el when tag_equal tag ns el ->
            let next = element i tag ?ns () in
            readList ~items:(next :: items)
        | _ -> items
      in
      readList ~items:[] |> List.rev

    let sequences i tag reader ?ns () =
      let rec readList ~items =
        match Xmlm.peek i with
        | `El_start el when tag_equal tag ns el ->
            let next = sequence i tag reader ?ns () in
            readList ~items:(next :: items)
        | _ -> items
      in
      readList ~items:[] |> List.rev

    let optionalElements i tag ?ns () =
      let elements = elements i tag ?ns () in
      match List.is_empty elements with true -> None | false -> Some elements

    let optionalElement i tag ?ns () =
      match Xmlm.peek i with
      | `El_start el when tag_equal tag ns el -> Some (element i tag ?ns ())
      | _ -> None

    let dtd i = Accept.dtd i
  end

  module Structure = struct
    type 'returnType inputType =
      | InputStringElement : string inputType
      | InputStringElements : string list inputType
      | InputStructureElement : 'returnType Read.reader -> 'returnType inputType
      | InputStructuresElement : 'returnType Read.reader -> 'returnType list inputType

    type 'a inputItem = { tag : string; type_ : 'a inputType }

    exception InputUnordered of string
    exception MissingElement of string * Xmlm.pos

    let item1 : type a. input -> a inputItem -> a option =
     fun i t1 ->
      match t1.type_ with
      | InputStringElement -> Read.optionalElement i t1.tag ()
      | InputStringElements -> Some (Read.elements i t1.tag ())
      | InputStructureElement reader -> Some (Read.sequence i t1.tag reader ())
      | InputStructuresElement reader -> Some (Read.sequences i t1.tag reader ())

    let scanSequence i expectedTags reader =
      let break = ref false in
      while not break.contents do
        let next = Xmlm.peek i in
        match next with
        | `El_start ((_, tag), _) -> reader tag next
        | `El_end -> break := true
        | `Dtd _ | `Data _ ->
            raise (XmlUnexpectedConstruct (XmlOneOfElement expectedTags, next, Xmlm.pos i))
      done

    let item2 : type a b. input -> a inputItem -> b inputItem -> a option * b option =
     fun i t1 t2 ->
      let r1 = ref None in
      let r2 = ref None in
      scanSequence i [ t1.tag; t2.tag ] (fun tag next ->
          if String.equal t1.tag tag then r1 := item1 i t1
          else if String.equal t2.tag tag then r2 := item1 i t2
          else raise (XmlUnexpectedConstruct (XmlOneOfElement [ t1.tag; t2.tag ], next, Xmlm.pos i)));
      (!r1, !r2)

    let item3 :
        type a b c.
        input -> a inputItem -> b inputItem -> c inputItem -> a option * b option * c option =
     fun i t1 t2 t3 ->
      let r1 = ref None in
      let r2 = ref None in
      let r3 = ref None in
      scanSequence i [ t1.tag; t2.tag; t3.tag ] (fun tag next ->
          match tag with
          | _ when String.equal t1.tag tag -> r1 := item1 i t1
          | _ when String.equal t2.tag tag -> r2 := item1 i t2
          | _ when String.equal t3.tag tag -> r3 := item1 i t3
          | _ ->
              raise
                (XmlUnexpectedConstruct
                   (XmlOneOfElement [ t1.tag; t2.tag; t3.tag ], next, Xmlm.pos i)));
      (!r1, !r2, !r3)

    let item4 :
        type a b c d.
        input ->
        a inputItem ->
        b inputItem ->
        c inputItem ->
        d inputItem ->
        a option * b option * c option * d option =
     fun i t1 t2 t3 t4 ->
      let r1 = ref None in
      let r2 = ref None in
      let r3 = ref None in
      let r4 = ref None in
      scanSequence i [ t1.tag; t2.tag; t3.tag; t4.tag ] (fun tag next ->
          match tag with
          | _ when String.equal t1.tag tag -> r1 := item1 i t1
          | _ when String.equal t2.tag tag -> r2 := item1 i t2
          | _ when String.equal t3.tag tag -> r3 := item1 i t3
          | _ when String.equal t4.tag tag -> r4 := item1 i t4
          | _ ->
              raise
                (XmlUnexpectedConstruct
                   (XmlOneOfElement [ t1.tag; t2.tag; t3.tag; t4.tag ], next, Xmlm.pos i)));
      (!r1, !r2, !r3, !r4)

    let item5 :
        type a b c d e.
        input ->
        a inputItem ->
        b inputItem ->
        c inputItem ->
        d inputItem ->
        e inputItem ->
        a option * b option * c option * d option * e option =
     fun i t1 t2 t3 t4 t5 ->
      let r1 = ref None in
      let r2 = ref None in
      let r3 = ref None in
      let r4 = ref None in
      let r5 = ref None in
      scanSequence i [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag ] (fun tag next ->
          match tag with
          | _ when String.equal t1.tag tag -> r1 := item1 i t1
          | _ when String.equal t2.tag tag -> r2 := item1 i t2
          | _ when String.equal t3.tag tag -> r3 := item1 i t3
          | _ when String.equal t4.tag tag -> r4 := item1 i t4
          | _ when String.equal t5.tag tag -> r5 := item1 i t5
          | _ ->
              raise
                (XmlUnexpectedConstruct
                   (XmlOneOfElement [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag ], next, Xmlm.pos i)));
      (!r1, !r2, !r3, !r4, !r5)

    let item6 :
        type a b c d e f.
        input ->
        a inputItem ->
        b inputItem ->
        c inputItem ->
        d inputItem ->
        e inputItem ->
        f inputItem ->
        a option * b option * c option * d option * e option * f option =
     fun i t1 t2 t3 t4 t5 t6 ->
      let r1 = ref None in
      let r2 = ref None in
      let r3 = ref None in
      let r4 = ref None in
      let r5 = ref None in
      let r6 = ref None in
      scanSequence i [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag; t6.tag ] (fun tag next ->
          match tag with
          | _ when String.equal t1.tag tag -> r1 := item1 i t1
          | _ when String.equal t2.tag tag -> r2 := item1 i t2
          | _ when String.equal t3.tag tag -> r3 := item1 i t3
          | _ when String.equal t4.tag tag -> r4 := item1 i t4
          | _ when String.equal t5.tag tag -> r5 := item1 i t5
          | _ when String.equal t6.tag tag -> r6 := item1 i t6
          | _ ->
              raise
                (XmlUnexpectedConstruct
                   ( XmlOneOfElement [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag; t6.tag ],
                     next,
                     Xmlm.pos i )));
      (!r1, !r2, !r3, !r4, !r5, !r6)

    let item7 :
        type a b c d e f g.
        input ->
        a inputItem ->
        b inputItem ->
        c inputItem ->
        d inputItem ->
        e inputItem ->
        f inputItem ->
        g inputItem ->
        a option * b option * c option * d option * e option * f option * g option =
     fun i t1 t2 t3 t4 t5 t6 t7 ->
      let r1 = ref None in
      let r2 = ref None in
      let r3 = ref None in
      let r4 = ref None in
      let r5 = ref None in
      let r6 = ref None in
      let r7 = ref None in
      scanSequence i [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag; t6.tag; t7.tag ] (fun tag next ->
          match tag with
          | _ when String.equal t1.tag tag -> r1 := item1 i t1
          | _ when String.equal t2.tag tag -> r2 := item1 i t2
          | _ when String.equal t3.tag tag -> r3 := item1 i t3
          | _ when String.equal t4.tag tag -> r4 := item1 i t4
          | _ when String.equal t5.tag tag -> r5 := item1 i t5
          | _ when String.equal t6.tag tag -> r6 := item1 i t6
          | _ when String.equal t7.tag tag -> r7 := item1 i t7
          | _ ->
              raise
                (XmlUnexpectedConstruct
                   ( XmlOneOfElement [ t1.tag; t2.tag; t3.tag; t4.tag; t5.tag; t6.tag; t7.tag ],
                     next,
                     Xmlm.pos i )));
      (!r1, !r2, !r3, !r4, !r5, !r6, !r7)
  end

  let required tag value i =
    match value with Some value -> value | None -> raise (XmlMissingElement (tag, Xmlm.pos i))
end
