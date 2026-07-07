{ profile, ... }:
{
  programs.nh = {
    enable = true;

    flake = "${profile.nixConfigDir}/flake.nix";
  };
  home.sessionVariables = {
    NH_HOME_FLAKE = "${profile.nixConfigDir}/flake.nix";
  };
}
