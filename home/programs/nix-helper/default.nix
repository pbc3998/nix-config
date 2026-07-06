{ profile, ... }:
{
  programs.nh = {
    enable = true;

    flake = "${profile.dirConfig}/flake.nix";
  };
  home.sessionVariables = {
    NH_HOME_FLAKE = "${profile.dirConfig}/flake.nix";
  };
}
