{ pkgs, settings, inputs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.${settings.identity.username} = {
      extensions = with inputs.vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
        diegoulloao.neofusion-theme
        pkief.material-icon-theme

        # nix
        arrterian.nix-env-selector
        jnoortheen.nix-ide
        brettm12345.nixfmt-vscode
        editorconfig.editorconfig
        vancoding.vscode-treefmt-nix
        mkhl.direnv
      ];

      userSettings = {
        "workbench.activityBar.compact" = true;
        "workbench.sideBar.location" = "right";
        "workbench.activityBar.location" = "bottom";
        "workbench.colorTheme" = "Neofusion Theme";
        "workbench.iconTheme" = "material-icon-theme";

        "files.autoSave" = "afterDelay";

        "git.autofetch" = true;
        "git.confirmSync" = false;

        "terminal.integrated.fontFamily" = " '${settings.fonts.terminal.name}' ";
        "terminal.integrated.fontSize" = settings.fonts.terminal.size + 3;
        "editor.fontSize" = settings.fonts.code.size;
        "editor.fontFamily" = settings.fonts.code.name;
        "editor.fontLigatures" =  true;
      };

      keybindings = [
        {
          key = "alt+a";
          command = "workbench.action.quickOpen";
        }
        {
          key = "alt+s";
          command = "workbench.action.closeActiveEditor";
        }
        {
          key = "alt+d";
          command = "workbench.action.quickOpenNavigateNextInEditorPicker";
          when = "inEditorsPicker";
        }
        {
          key = "alt+d";
          command = "workbench.action.showAllEditors";
        }
        {
          key = "alt+f";
          command = "workbench.action.quickOpenNavigatePreviousInEditorPicker";
          when = "inEditorsPicker";
        }
        {
          key = "alt+f";
          command = "workbench.action.showAllEditors";
        }
      ];
    };
  };
}
