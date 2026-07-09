{
  description = "My nix configuration for nixos and Home Manager";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
    allow-unfree = true;
    auto-optimise-store = true;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-26.05";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # system

    cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { pkgs, ... }: {
        formatter = pkgs.nixpkgs-fmt-tree;

        packages = import ./packages { inherit pkgs; };
        devShells.default = import ./modules/devshell.nix { inherit pkgs; };
      };

      flake =
        let
          overlays = import ./overlays { inherit inputs; };
          lib = import ./lib { inherit inputs overlays; };
        in
        {
          overlays.default = overlays;

          nixosConfigurations = lib.builders.mkNixos {
            extraModules = [
              inputs.lanzaboote.nixosModules.lanzaboote
              inputs.home-manager.nixosModules.home-manager
            ];
          };

          homeConfigurations = lib.builders.mkHome {
            extraModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
          };
        };
    };
}
