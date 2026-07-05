{
  description = "My nix configuration for nixos and Home Manager";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://gvolpe-nixos.cachix.org"
      "https://helium-nix.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "gvolpe-nixos.cachix.org-1:0MPlBIMwYmrNqoEaYTox15Ds2t1+3R+6Ycj0hZWMcL0="
      "helium-nix.cachix.org-1:a8YPjt9O4GPyX0u3gjg/aWpb14teU9aRiSG/MOaSFgw="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { config, pkgs, ... }: {
        #        packages = ./packages { inherit pkgs; };
        #        devShells.default = import ./lib/devshell.nix { inherit pkgs; };
      };

      flake =
        let
          #          overlays = import ./overlays;
          #          builders = import ./lib/builders.nix { inherit inputs overlays; };
        in
        {
          #          overlays.default = overlays;

          #          nixosConfigurations = builders.mkNixos { };
          #          homeConfigurations = builders.mkHome { };
        };
    };
}
