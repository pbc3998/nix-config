{pkgs, ...}:
{
  services.flatpak = {
    enable = true;

    uninstallUnmanaged = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    packages = [
      "com.valvesoftware.Steam"
      "com.vivaldi.Vivaldi"
      "com.wps.Office"
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}
