{desktopsDir, ...}:
{
  imports = [
    ./modules.nix
    ./programs.nix
    ./services.nix

    "${desktopsDir}/plasma6"
    ../../flatpak
  ];
}
