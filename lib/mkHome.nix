{ inputs, overlays }:
let

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

      extraSpecialArgs = { inherit inputs; };
      modules = modules' ++ [ "${inputs.self}/home/desktops/${desktop}" ];
    };

  # For convenience, we will not add the suffix to the x86_64-linux platform.
  mk-x86_64-linux = desktop: {
    ${desktop} = inputs.home-manager.lib.homeManagerConfiguration (mkHome { inherit desktop; });
  };
in
inputs.nixpkgs.lib.mergeAttrsList (map mk-x86_64-linux desktops)
