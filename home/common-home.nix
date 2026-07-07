{ profile, inputs, ... }:
{
  home.username = profile.username;
  home.homeDirectory = profile.homeDir;
  home.stateVersion = "26.05";

  imports = [
    "${inputs.self}/home/programs"
    #    "${inputs.self}/home/services"
  ];
}
