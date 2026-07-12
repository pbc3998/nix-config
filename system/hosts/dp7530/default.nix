{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    loader.systemd-boot.enable = false;

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };

  imports = [
    ./hardware-configuration.nix
  ];

  host-config = {
    gpuDrivers = [ "intel" ];
    useDesktop = true;
  };
}
