{ settings, ... }: {
  programs.gh = {
    enable = true;
    settings = {
      version = 1;
      git_protocol = "https";
      editor = settings.tools.editor;
      prompt = "enabled";
      prefer_editor_prompt = "disabled";
      pager = "cat";
      browser = settings.tools.browser;

      color_labels = "disabled";
      accessible_colors = "disabled";
      accessible_prompter = "disabled";
      spinner = "enabled";
    };
  };
}
