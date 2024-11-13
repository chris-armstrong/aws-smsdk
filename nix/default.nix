{ nix-filter, lib, stdenv, ocamlPackages, doCheck ? true }:

rec {
  smaws-gen = ocamlPackages.buildDunePackage {
    pname = "smaws-gen";
    version = "0.1.0";
    src = with nix-filter; filter {
      root = ./..;
      include = [
        "dune"
        "dune-project"
        "library"
        "test"
      ];
    };
    propagatedBuildInputs = with ocamlPackages; [
      dune_3
      fmt
      yojson
      base64
      digestif
      ppx_inline_test
      ppx_deriving
      ppx_expect
      ocamlgraph
      containers
      uri
      logs
      alcotest
      odoc
      base
    ];
  };

  smaws-lib = ocamlPackages.buildDunePackage {
    pname = "smaws-lib";
    version = "0.1.0";
    src = with nix-filter; filter {
      root = ./..;
      include = [
        "dune"
        "dune-project"
        "awssdklib"
        "test"
      ];
    };
    propagatedBuildInputs = with ocamlPackages; [
      dune_3
      yojson
      fmt
      xmlm
      base64
      digestif
      eio-ssl
      uri
      httpun
      httpun-eio
      eio_main
      logs
      alcotest
    ];
    inherit doCheck;
  };

  smaws-client-sqs = ocamlPackages.buildDunePackage {
    pname = "smaws-client-sqs";
    version = "0.1.0";
    src = with nix-filter; filter {
      root = ./..;
      include = [
        "dune"
        "dune-project"
        "sdks/sqs"
      ];
    };
    propagatedBuildInputs = with ocamlPackages; [
      dune_3
      smaws-lib
    ];
    inherit doCheck;
  };

  smaws-client-dynamodb = ocamlPackages.buildDunePackage {
    pname = "smaws-client-dynamodb";
    version = "0.1.0";
    src = with nix-filter; filter {
      root = ./..;
      include = [
        "dune"
        "dune-project"
        "sdks/dynamodb"
      ];
    };
    propagatedBuildInputs = with ocamlPackages; [
      dune_3
      smaws-lib
    ];
    inherit doCheck;
  };
}
