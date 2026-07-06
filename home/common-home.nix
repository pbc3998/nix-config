{ profile, inputs, ... }:
{
  home.username = profile.username;
  home.homeDirectory = "/home/${profile.username}";
  home.stateVersion = "26.05";

  imports = [
    "${inputs.self}/home/programs"
    #    "${inputs.self}/home/services"
  ];
}
