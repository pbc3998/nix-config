# Warning: This is only for use when combining Home Manager with Nixos.
{
  inputs,
  overlays,
  extraModules,
}:
import ./mkHome.nix {
  inherit inputs overlays;
  embed = true;
  extraModules = extraModules ++ [
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    }
  ];
}
