{ inputs, overlays }: {
  # mkNixos =
  #   {
  #     inputs' ? inputs,
  #     overlays' ? overlays,
  #   }:
  #   import ./lib/mkNixos.nix {
  #     inputs = inputs';
  #     overlays = overlays';
  #   };
  mkHome =
    {
      inputs' ? inputs,
      overlays' ? overlays,
    }:
    import ./mkHome.nix {
      inputs = inputs';
      overlays = overlays';
    };
}
