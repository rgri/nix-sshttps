{
  inputs.flake-utils.url =
    "github:numtide/flake-utils/ff7b65b44d01cf9ba6a71320833626af21126384";
  inputs.nixpkgs.url =
    "github:nixos/nixpkgs/aa8aa7e2ea35ce655297e8322dc82bf77a31d04b";

  outputs = { self, nixpkgs, ... }@inputs:
    with inputs;
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        system = "x86_64-linux";
      in rec {
        packages.sshttp = pkgs.callPackage ./default.nix { };
        defaultPackage = packages.sshttp;
      });
}
