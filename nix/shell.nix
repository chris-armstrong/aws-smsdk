{ packages, pkgs, release-mode ? false }:

let 
  inherit (pkgs) lib ;
  ourDrvs = lib.filterAttrs (_: value: lib.isDerivation value) packages;

  in

  with pkgs;

  (mkShell {
    OCAMLRUNPARAM= "b";
    inputsFrom = lib.attrValues ourDrvs;
    nativeBuildInputs = 
      lib.optionals release-mode 
      [];
    buildInputs =with ocamlPackages; [ ocaml-lsp merlin ocamlformat utop ]; 
  }).overrideAttrs (o: {
    propagatedBuildInputs = lib.filter 
      (drv:
        !(lib.hasAttr "pname" drv) ||
        drv.pname == null ||
        !(lib.any (name: name == drv.pname) (lib.attrNames ourDrvs))
        ) o.propagatedBuildInputs;
  })

