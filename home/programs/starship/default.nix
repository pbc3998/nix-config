{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = "$directory$git_branch$git_status$dotnet$line_break$character";

      character = {
        success_symbol = "󱄅   ";
        error_symbol = "[](bold #ff5555)   ";
      };
    };
  };
}
