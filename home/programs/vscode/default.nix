{ pkgs, profile, inputs, ... }:
{
  programs.vscode = {
    enable = true;
  profiles.${profile.userName} = {
    extensions = with inputs.vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
      diegoulloao.neofusion-theme
      pkief.material-icon-theme

      # nix
      arrterian.nix-env-selector
      jnoortheen.nix-ide
      brettm12345.nixfmt-vscode
      editorconfig.editorconfig
    ];

    userSettings = {
      "workbench.activityBar.compact" = true;
      "workbench.sideBar.location" = "right";
      "workbench.activityBar.location" = "bottom";
      "workbench.colorTheme" = "Neofusion Theme";
      "workbench.iconTheme" = "material-icon-theme";

      "files.autoSave" = "true";
    };
  };
  };
}
