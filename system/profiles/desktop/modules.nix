{ modulesDir, ... }:
{
  imports = [
    "${modulesDir}/bluetooth"
    "${modulesDir}/ldLibraries"
    "${modulesDir}/networking"
    "${modulesDir}/nix"
    "${modulesDir}/security"
    "${modulesDir}/users"
  ];
}
