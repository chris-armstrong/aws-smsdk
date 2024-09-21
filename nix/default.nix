{ nix-filter, lib, stdenv, ocamlPackages, doCheck ? true }:

rec {
  aws-smsdk-gen = ocamlPackages.buildDunePackage {
    pname = "aws-smsdk-gen";
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
      markup
    ];
  };

  aws-smsdk-lib = ocamlPackages.buildDunePackage {
    pname = "aws-smsdk-lib";
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

  aws-smsdk-client-sqs = ocamlPackages.buildDunePackage {
    pname = "aws-smsdk-client-sqs";
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
      aws-smsdk-lib
    ];
  };

  aws-smsdk-client-dynamodb = ocamlPackages.buildDunePackage {
    pname = "aws-smsdk-client-dynamodb";
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
      aws-smsdk-lib
    ];
  };
}
