{ pkgs, lib, ... }: {
  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    loader.systemd-boot.enable = lib.mkForce false;

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
      configurationLimit = 10;
      settings = {
        timeout = 4;
        force-menu = false;
        console-mode = "max";
      };
    };
  };

  imports = [
    ./hardware-configuration.nix
  ];

  host-config.gpuDrivers = [ "intel" ];
}
