{
  description = "A flake for clj-nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    clj-nix = {
      url = "github:jlesquembre/clj-nix/next";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, flake-utils, clj-nix }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        cljpkgs = clj-nix.packages."${system}";
      in

      {
        packages = {

          salmon = cljpkgs.mkCljBin {
            projectSrc = ./.;
            name = "rs.shaffe/salmon";
            version = "0.3.0-SNAPSHOT";
            main-ns = "salmon.main";
            jdkRunner = pkgs.jdk17_headless;
          };

        };
      });

}