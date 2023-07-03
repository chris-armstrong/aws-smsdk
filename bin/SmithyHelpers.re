open Base;
open Parselib;

let printProtocol = (traits: option(list(Trait.t))) => {
  traits
  |> Option.value(~default=[])
  |> List.find_map(
       ~f=
         fun
         | Trait.AwsProtocolAwsJson1_0Trait => Some("AWS JSON 1.0")
         | Trait.AwsProtocolAwsJson1_1Trait => Some("AWS JSON 1.1")
         | Trait.AwsProtocolRestJson1Trait => Some("AWS REST JSON 1")
         | Trait.AwsProtocolRestXmlTrait => Some("AWS REST XML")
         | Trait.AwsProtocolAwsQueryTrait => Some("AWS Query")
         | Trait.AwsProtocolEc2QueryTrait => Some("EC2 Query")
         | _ => None,
     )
  |> Option.value(~default="<unknown>");
};

let printServiceTrait = traits => {
  traits
  |> Option.value(~default=[])
  |> List.find_map(
       ~f=
         fun
         | Trait.ServiceTrait({sdkId, arnNamespace, endpointPrefix, _}) =>
           Some(
             Fmt.str(
               "{ Sdk %s Namespace %s endpointPrefix %s }",
               sdkId,
               arnNamespace,
               Option.value(endpointPrefix, ~default="<>"),
             ),
           )
         | _ => None,
     )
  |> Option.value(~default="<unknown>");
};

let printOperations = operations => {
  operations
  |> List.filter_map(
       ~f=
         fun
         | Shape.{name, descriptor: Shape.OperationShape({input, output, _})} => {
             Some(
               Printf.sprintf(
                 "operation %s = %s => %s",
                 name,
                 Option.value(input, ~default="()"),
                 Option.value(output, ~default="void"),
               ),
             );
           }
         | _ => None,
     )
  |> List.iter(~f=str => Stdio.print_endline(str));
};

let printServiceDetails = shapes => {
  List.iter(shapes, ~f=(Shape.{descriptor, _}) =>
    switch (descriptor) {
    | Shape.ServiceShape(details) =>
      Stdio.printf(
        "Service: version=%s\n, protocol=%s, %s",
        details.version,
        printProtocol(details.traits),
        printServiceTrait(details.traits),
      )
    | _ => ()
    }
  );
};
