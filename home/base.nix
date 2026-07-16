{ settings, pkgs, ... }:
{
  home.username = settings.identity.username;
  home.homeDirectory = settings.dirs.home;
  home.stateVersion = settings.stateVersion;

  home.packages = [
    pkgs.nixd
    pkgs.treefmt
  ];
}
