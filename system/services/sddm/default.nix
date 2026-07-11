{ config, ... }:
{
  ervices.displayManager.sddm.enable = config.host-config.useDesktop;
  services.displayManager.sddm.wayland.enable = true;
}
