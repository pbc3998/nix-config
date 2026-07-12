{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-bamboo
      fcitx5-gtk
    ];
    fcitx5.waylandFrontend = true;
  };
  home.file.".config/fcitx5/config".source = ./fcitx5.conf;
}
