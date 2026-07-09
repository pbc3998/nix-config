{ inputs, overlays }: {
  mkNixos =
    {
      inputs' ? inputs,
      overlays' ? overlays,
      extraModules ? [ ],
    }:
    import ./mkNixos.nix {
      inputs = inputs';
      overlays = overlays';
      inherit extraModules;
    };

  mkHome =
    {
      inputs' ? inputs,
      overlays' ? overlays,
      extraModules ? [ ],
    }:
    import ./mkHome.nix {
      inputs = inputs';
      overlays = overlays';
      inherit extraModules;
    };
}
