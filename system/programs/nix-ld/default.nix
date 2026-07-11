{config, ...}:
{
  programs.nix-ld = {
    enable = true;
    libraries = config.libs-list;
  };
}
