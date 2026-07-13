{ profile, ... }:
{
  programs.nh = {
    enable = true;

    flake = "${profile.nixConfigDir}";
  };
  home.sessionVariables = {
    NH_HOME_FLAKE = "${profile.nixConfigDir}";
  };
}
