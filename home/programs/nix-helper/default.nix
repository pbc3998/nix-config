{
  programs.nh = {
    enable = true;

    flake = "/home/pbcdev/nix-config/flake.nix";
  };
  home.sessionVariables = {
    NH_HOME_FLAKE = "/home/pbcdev/nix-config/flake.nix";
  };
}
