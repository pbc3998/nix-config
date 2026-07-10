{lib, ...}:
with lib;
{
  options.host-config = {
    gpuDrivers = mkOption {
      type = types.listOf types.str;
      description = "List of graphics card drivers that need to be installed";
    };

    useDesktop = mkOption {
      type = types.bool;
      default = true;
      description = "Install the desktop application for the current host; if the answer is false, the desktop application and desktop apps (GUI apps) will not be installed";
    };
  };
}
