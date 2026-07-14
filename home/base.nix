{ settings, inputs, ... }:
{
  home.username = settings.profile.username;
  home.homeDirectory = settings.dirs.home;
  home.stateVersion = settings.stateVersion;

  imports = [
    "${inputs.self}/home/programs"
    "${inputs.self}/home/services"
    "${inputs.self}/home/modules"
  ];
}
