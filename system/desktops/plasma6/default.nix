{ config, ... }:
{
  services.desktopManager.plasma6.enable = config.host-config.useDesktop;
}
