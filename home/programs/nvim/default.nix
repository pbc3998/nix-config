{ inputs, ... }:
{
  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;
  };

  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins
    ./ui
  ];
}
