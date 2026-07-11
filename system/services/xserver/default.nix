{ config, ... }:
{
  services.xserver = {
    enable = config.host-config.useDesktop;
    videoDrivers = config.host-config.gpuDrivers;
  };
}
