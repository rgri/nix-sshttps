{stdenv, pkgs ? import <nixpkgs> {}, }:
stdenv.mkDerivation {
 src = fetchFromGitHub
}
