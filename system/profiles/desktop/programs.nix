{ programsDir, ... }:
{
  imports = [
    "${programsDir}/nix-ld"
    "${programsDir}/zsh"
  ];
}
