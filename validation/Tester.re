open Base;

module SKU = {
  [@deriving show]
  type variation = {
    color: string,
    size: string,
    code: string,
  };

  [@deriving show]
  type t =
    | Variation(variation)
    | Single({description: string});
};

let catalogue = [
  SKU.Variation({color: "blue", size: "M", code: "OT-M-blue"}),
  SKU.Single({description: "One-size Patterned Socks"}),
];

Stdio.printf("Catalogue items:\n");
let pp = Fmt.list(~sep=Fmt.semi, SKU.pp);
Fmt.pr("%a", pp, catalogue) /* List.iter(catalogue, ~f=item => Stdio.printf("\titem %s\n", SKU.show(item)))*/;
// List.iter(catalogue, ~f=print_item(Stdlib.Format.std_formatter))
