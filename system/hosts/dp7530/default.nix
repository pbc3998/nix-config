{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    loader.systemd-boot.enable = true;

    # TODO: Prepare the file containing the digital signature key for the machine to use with LanzaBoote.
    lanzaboote = {
      enable = false;
    };
  };

  host-config = {
    gpuDrivers = [ "intel" ];
    useDesktop = true;
  };
}
