{ profile, inputs, ... }:
{
  home.username = profile.userName;
  home.homeDirectory = profile.homeDir;
  home.stateVersion = profile.stateVersion;

  imports = [
    "${inputs.self}/home/programs"
    "${inputs.self}/home/services"
    "${inputs.self}/home/modules"
  ];
}
