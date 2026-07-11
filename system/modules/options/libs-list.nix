{ lib, pkgs, ...}:
{
  options.libs-list = lib.mkOption {
    description = "List of libraries processed by nix-ld for third parties";
    type = lib.types.attrListWith pkgs;
  };
}
