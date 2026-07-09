{
  inputs,
  overlays,
  extraModules,
  embed ? false # This flag is only used when embedding home-manager into nixos instead of using it as a standalone unit.
}:
let
  desktopsDir = "${inputs.self}/home/desktops";
  desktops = [ "tty" ];
  modules' = [ "${inputs.self}/home/common-home.nix" ];

  mkHome =
    {
      desktop,
      system ? "x86_64-linux",
    }:
    {
      pkgs = import inputs.nixpkgs {
        inherit overlays system;
        config.allowUnfree = true;
      };

      extraSpecialArgs = {
        inherit inputs;
        profile = import "${inputs.self}/profile";
        libx = import "${inputs.self}/lib"; # lib extension
      };
      modules = modules' ++ extraModules ++ [ "${desktopsDir}/${desktop}" ];
    };

  # For convenience, we will not add the suffix to the x86_64-linux platform.
  mk-x86_64-linux = desktop: {
    ${desktop} = inputs.home-manager.lib.homeManagerConfiguration (mkHome {
      inherit desktop;
    });
  };
  # Used for Home Manager on NixoS
  mk-x86_64-linux-for-nixos = desktop: {
    ${desktop} = mkHome { inherit desktop; };
  };
in
inputs.nixpkgs.lib.mergeAttrsList (
  if ! embed
  then map mk-x86_64-linux desktops
  else map mk-x86_64-linux-for-nixos desktops
)
