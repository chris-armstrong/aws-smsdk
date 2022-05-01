open! Base;

module SKU {

[@deriving.show]

type variation = {
  color: string,
  size: string,
  code: string,
};

[@deriving.show]
type t = Variation(variation) | Single({ description: string });
}

let catalogue = [
  SKU.Variation({ color: "blue", size: "M", code: "OT-M-blue" }),
  SKU.Single({ description: "One-size Patterned Socks" }),
];

Stdio.printf("Catalogue items:\n");
List.iter(catalogue, ~f=item => Stdio.printf("\titem %a\n", SKU.show(item)));