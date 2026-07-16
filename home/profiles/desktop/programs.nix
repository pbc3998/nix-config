{ programsDir, ... }: {
  imports = [
    "${programsDir}/atuin"
    "${programsDir}/bat"
    "${programsDir}/direnv"
    "${programsDir}/eza"
    "${programsDir}/fastfetch"
    "${programsDir}/fd"
    "${programsDir}/firefox"
    "${programsDir}/fzf"
    "${programsDir}/gh"
    "${programsDir}/git"
    "${programsDir}/home-manager"
    "${programsDir}/kitty"
    "${programsDir}/nix-helper"
    "${programsDir}/nvim"
    "${programsDir}/ripgrep"
    "${programsDir}/starship"
    "${programsDir}/vivaldi"
    "${programsDir}/vscode"
    "${programsDir}/zoxide"
    "${programsDir}/zsh"
  ];
}
