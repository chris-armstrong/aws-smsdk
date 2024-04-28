{
    pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
      nativeBuildInputs = with pkgs.buildPackages; [ opam neovim gmp lazygit openssl pcre ];
    }
