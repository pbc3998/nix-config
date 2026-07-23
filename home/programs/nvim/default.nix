{ inputs, ... }:
{
  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;
  };

  imports = [
    ./common
    ./diagnostic
    ./edit
    ./file
    ./git
    ./languages
    ./terminal
    ./ui
    ./direnv
  ];
}
