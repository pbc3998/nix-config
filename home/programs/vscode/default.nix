{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      eamodio.gitlens
      esbenp.prettier-vscode
    ];
  };
}
