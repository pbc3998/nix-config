{
  description = "My nix configuration for nixos and Home Manager";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://xddxdd.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "xddxdd.cachix.org-1:ay1HJyNDYmlSwj5NXQG065C8LfoqqKaTNCyzeixGjf8="
    ];
    allow-unfree = true;
    auto-optimise-store = true;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-26.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ==================== system ====================

    cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ==================== home ====================

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/v0.7.0";

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    catppuccin.url = "github:catppuccin/nix";

    wezterm-types = {
      url = "github:/DrKJeff16/wezterm-types";
      flake = false;
    };
  };

  outputs =
    inputs@{ flake-parts
    , ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      perSystem = { pkgs, ... }: {
        treefmt.config = {
          projectRootFile = "flake.nix";
          programs = {
            nixpkgs-fmt.enable = true;
            prettier.enable = true;
          };
        };

        packages = import ./packages { inherit pkgs; };
        devShells.default = import ./modules/devshell.nix { inherit pkgs; };
      };

      flake =
        let
          overlays = import ./overlays { inherit inputs; };
          libx = import ./lib { inherit inputs overlays; };

          extraModulesHome = [
            inputs.plasma-manager.homeModules.plasma-manager
            inputs.nix-flatpak.homeManagerModules.nix-flatpak
            inputs.nixvim.homeModules.nixvim
            inputs.catppuccin.homeModules.catppuccin
          ];

          extraModulesNixos = [
            inputs.lanzaboote.nixosModules.lanzaboote
            inputs.home-manager.nixosModules.home-manager
          ];
        in
        {
          overlays.default = overlays;

          nixosConfigurations = libx.builders.mkNixos {
            extraModules = [
              {
                # Embed Home Manager into Nixos
                home-manager = libx.builders.mkHome {
                  extraModules = extraModulesHome;
                  standalone = false;
                };
              }
            ]
            ++ extraModulesNixos;
          };

          homeConfigurations = libx.builders.mkHome { extraModules = extraModulesHome; };
        };
    };
}
