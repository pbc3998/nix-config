{ inputs, overlays }:
let
  rootDir = inputs.self;
  inherit (inputs) nixpkgs;

  hosts = [
    "dp7530"
  ];

  desktops = [
    "tty"
    "plasma6"
  ];

  hostPlatforms = [ "x86_64-linux" ];
  hostPlatformPriority = "x86_64-linux";

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
    { host
    , desktop
    , extraModules
    ,
    }:
    let
      mk = {
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
    { "${host}-${desktop}" = nixpkgs.lib.nixosSystem mk; };

  # ==================== Home-Manager ====================

  homeModules = [
    "${rootDir}/home/base.nix"
  ];

  homeSpecialArgs = { inherit inputs profile libx; };

  mkHomeModules =
    { desktop, extraModules }: homeModules ++ extraModules ++ [ "${desktopsDir}/${desktop}" ];

  mkHome-base =
    { desktop
    , hostPlatform ? "x86_64-linux"
    , extraModules
    ,
    }:
    let
      mk = {
        extraSpecialArgs = homeSpecialArgs;
        pkgs = import nixpkgs {
          inherit overlays hostPlatform;
          config.allowUnfree = true;
        };
        modules = (mkHomeModules { inherit desktop extraModules; });
      };
    in
    if (hostPlatform == hostPlatformPriority) then
      { ${desktop} = inputs.home-manager.lib.homeManagerConfiguration mk; }
    else
      { "${desktop}-${hostPlatform}" = inputs.home-manager.lib.homeManagerConfiguration mk; };
in
{
  mkNixos =
    { extraModules ? [ ]
    ,
    }:
    nixpkgs.lib.mergeAttrsList (
          map
            (
              { host, desktop }:
              mkNixos-base {
                inherit
                  host
                  desktop
                  extraModules
                  ;
              }
            )
            (
              nixpkgs.lib.cartesianProduct {
                desktop = desktops;
                host = hosts;
              }
            )
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
                 hostPlatform: map (desktop: mkHome-base { inherit hostPlatform desktop extraModules; }) desktops
          )
          hostPlatforms
      );
}
