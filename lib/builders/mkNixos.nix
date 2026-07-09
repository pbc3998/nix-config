{ inputs, overlays, extraModules }:
let
  hosts-x86_64-linux = [ "dp7530" ];

  hostsDir = "${inputs.self}/system/hosts";

  modules' = [
    "${inputs.self}/system/common-configuration.nix"
    # "${inputs.self}/system/virtualisation.nix"
  ];

  mk =
    {
      host,
      system ? "x86_64-linux",
    }:
    {
      inherit system;

      specialArgs = {
        inherit inputs;
        profile = import "${inputs.self}/profile";
      };

      modules = modules' ++ extraModules ++ [
        "${hostsDir}/${host}"
        {
          networking.hostName = "nixos-${host}";

          nixpkgs = {
            inherit overlays;
            config.allowUnfree = true;
          };
        }
      ];
    };

  mk-x86_64-linux = host: {
    ${host} = inputs.nixpkgs.lib.nixosSystem (mk {
      inherit host;
    });
  };
in
inputs.nixpkgs.lib.mergeAttrsList (map mk-x86_64-linux hosts-x86_64-linux)
