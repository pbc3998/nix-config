{ pkgs, config, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-bamboo
      fcitx5-gtk
      qt6Packages.fcitx5-configtool
    ];
    fcitx5.waylandFrontend = true;
  };

  xdg.configFile."fcitx5/config".source = config.lib.file.mkOutOfStoreSymlink ./fcitx5.conf;
  xdg.configFile."fcitx5/conf/clipboard.conf".source = config.lib.file.mkOutOfStoreSymlink ./fcitx5/clipboard.conf;
  xdg.configFile."fcitx5/conf/notifications.conf".source = config.lib.file.mkOutOfStoreSymlink ./fcitx5/notifications.conf;
  xdg.configFile."fcitx5/profile".source = config.lib.file.mkOutOfStoreSymlink ./fcitx5/profile;
}
