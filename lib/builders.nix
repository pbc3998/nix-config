{ inputs, overlays }:
let
  rootDir = inputs.self;
  inherit (inputs) nixpkgs;

  hosts = {
    x86_64-linux = [
      "dp7530"
    ];
  };

  desktops = [
    "tty"
    "plasma6"
  ];
  systems = [ "x86_64-linux" ];
  systemPriority = "x86_64-linux";

  hostsDir = "${rootDir}/system/hosts";
  desktopsDir-nixos = "${rootDir}/system/desktops";
  desktopsDir = "${rootDir}/home/desktops";

  profile = import "${rootDir}/profile";
  libx = import "${rootDir}/lib"; # my lib extension

  # ==================== Nixos ====================

  nixosModules = [
    "${rootDir}/system/base.nix"
    # "${rootDir}/system/virtualisation.nix"
  ];

  nixosSpecialArgs = {
    inherit inputs profile libx;
  };

  mkNixos-base =
    { system ? "x86_64-linux"
    , host
    , desktop
    , extraModules
    ,
    }:
    let
      mk = {
        inherit system;
        specialArgs = nixosSpecialArgs;

        modules = [
          "${hostsDir}/${host}"
          "${desktopsDir-nixos}/${desktop}"
          ({ lib, ... }: {
            # Create a hidden option to transfer Desktop environment information (DE/WM) from NixOS
            # to the Home Manager module (when using embedded mode).
            options._desktop = lib.mkOption {
              type = lib.types.enum desktops;
              description = "This helps Home Manager identify the target desktop";
            };
            config = {
              _desktop = desktop;
              nixpkgs = {
                inherit overlays;
                config.allowUnfree = true;
              };
            };
          })
        ]
        ++ nixosModules
        ++ extraModules;
      };
    in
    # If it's the preferred (primary) architecture, omit the operating system suffix for a shorter Host/Desktop name.
    if (system == systemPriority) then
      { "${host}-${desktop}" = nixpkgs.lib.nixosSystem mk; }
    else
      { "${host}-${desktop}-${system}" = nixpkgs.lib.nixosSystem mk; };

  # ==================== Home-Manager ====================

  homeModules = [
    "${rootDir}/home/base.nix"
  ];

  homeSpecialArgs = { inherit inputs profile libx; };

  mkHomeModules =
    { desktop, extraModules }: homeModules ++ extraModules ++ [ "${desktopsDir}/${desktop}" ];

  mkHome-base =
    { desktop
    , system ? "x86_64-linux"
    , extraModules
    ,
    }:
    let
      mk = {
        extraSpecialArgs = homeSpecialArgs;
        pkgs = import nixpkgs {
          inherit overlays system;
          config.allowUnfree = true;
        };
        modules = (mkHomeModules { inherit desktop extraModules; });
      };
    in
    if (system == systemPriority) then
      { ${desktop} = inputs.home-manager.lib.homeManagerConfiguration mk; }
    else
      { "${desktop}-${system}" = inputs.home-manager.lib.homeManagerConfiguration mk; };
in
{
  mkNixos =
    { extraModules ? [ ]
    ,
    }:
    nixpkgs.lib.mergeAttrsList (
      nixpkgs.lib.concatMap
        (
          system:
          map
            (
              { host, desktop }:
              mkNixos-base {
                inherit
                  system
                  host
                  desktop
                  extraModules
                  ;
              }
            )
            (
              nixpkgs.lib.cartesianProduct {
                desktop = desktops;
                host = hosts.${system};
              }
            )
        )
        systems
    );

  mkHome =
    { embed ? false
    , # By default, it will not be embedded in NixoS.
      extraModules ? [ ]
    ,
    }:
    if embed then
      {
        extraSpecialArgs = homeSpecialArgs;
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${profile.userName} = { osConfig, ... }: {
          imports = (
            mkHomeModules {
              inherit extraModules;
              desktop = osConfig._desktop;
            }
          );
        };
      }
    else
      nixpkgs.lib.mergeAttrsList (
        nixpkgs.lib.concatMap
          (
            system: map (desktop: mkHome-base { inherit system desktop extraModules; }) desktops
          )
          systems
      );
}
