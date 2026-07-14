{ pkgs, settings, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = settings.profile.name;
        email = settings.profile.email.main;
      };
      init = {
        defaultBranch = "main";
      };

      "credential \"https://github.com\"" = {
        helper = [
          ""
          "${pkgs.github-cli}/bin/gh auth git-credential"
        ];
      };

      "credential \"https://gist.github.com\"" = {
        helper = [
          ""
          "${pkgs.github-cli}/bin/gh auth git-credential"
        ];
      };
    };
  };
}
